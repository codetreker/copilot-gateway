import type { Context } from "hono";
import { getRepo } from "../../repo/index.ts";

export const errorLog = async (c: Context) => {
  const start = c.req.query("start") ?? new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
  const end = c.req.query("end") ?? new Date().toISOString();
  const limit = Math.min(Number(c.req.query("limit") ?? 200), 1000);
  const entries = await getRepo().errorLog.query({ start, end, limit });
  return c.json(entries);
};
