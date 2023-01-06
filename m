Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94489660969
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 23:17:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Npd4p3WxPz3c8t
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 09:17:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F5Ivjoz7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=anirudh.venkataramanan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F5Ivjoz7;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Npcgm6vGsz3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 08:59:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673042373; x=1704578373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SSz6BzP2REm+D8MWs8FHchah/89P2zMYb+LTILGyOH0=;
  b=F5Ivjoz7PmsnhCyruJykovSTkye/EHEmbEhydHJs4mhvwqaZ/0BEOehy
   RlKO/2u3QPQ+mVcxxUcQv+hGFqrbHGHdJOAwBO6Gn5uXsVquIbxjmeHZl
   mw+v9lKQAwSL1mmbR6VJT6riajzWiyc9GPdsxNUZm5rpDydoNYunNGpfe
   eseshuJneKubHw8AtTw/5kzd+F7SwM/pFq45L+U3JkvW73cr2Vhc8TjIT
   jwbdiRXJkL1edVC8M+1cwwHz/N5cpmlSl7aCeJrUf0WrVjRD4AE1IMPMb
   S9cq3cM73aZT+j+7uNWcPYuNwTvo0Gt2dzjV5vP8Cx3CHhBmk8t9+HhNA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="387030712"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="387030712"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 13:59:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="763652895"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="763652895"
Received: from avenkata-desk0.sc.intel.com ([172.25.112.60])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jan 2023 13:59:16 -0800
From: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 6/7] sunvnet: Remove event tracing file
Date: Fri,  6 Jan 2023 14:00:19 -0800
Message-Id: <20230106220020.1820147-7-anirudh.venkataramanan@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com>
References: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 07 Jan 2023 09:09:38 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Leon Romanovsky <leon@kernel.org>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An earlier patch removed the Sun LDOM vswitch and sunvnet drivers, and
as a result, nothing includes sunvnet.h anymore. Remove it.

Note:

checkpatch complains "WARNING: added, moved or deleted file(s), does
MAINTAINERS need updating?". The file being removed doesn't have its
own entry in the MAINTAINERS file, so there's nothing to remove.

Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
---
 include/trace/events/sunvnet.h | 140 ---------------------------------
 1 file changed, 140 deletions(-)
 delete mode 100644 include/trace/events/sunvnet.h

diff --git a/include/trace/events/sunvnet.h b/include/trace/events/sunvnet.h
deleted file mode 100644
index 8d444f1..00000000
--- a/include/trace/events/sunvnet.h
+++ /dev/null
@@ -1,140 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#undef TRACE_SYSTEM
-#define TRACE_SYSTEM sunvnet
-
-#if !defined(_TRACE_SUNVNET_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_SUNVNET_H
-
-#include <linux/tracepoint.h>
-
-TRACE_EVENT(vnet_rx_one,
-
-	TP_PROTO(int lsid, int rsid, int index, int needs_ack),
-
-	TP_ARGS(lsid, rsid, index, needs_ack),
-
-	TP_STRUCT__entry(
-		__field(int, lsid)
-		__field(int, rsid)
-		__field(int, index)
-		__field(int, needs_ack)
-	),
-
-	TP_fast_assign(
-		__entry->lsid = lsid;
-		__entry->rsid = rsid;
-		__entry->index = index;
-		__entry->needs_ack = needs_ack;
-	),
-
-	TP_printk("(%x:%x) walk_rx_one index %d; needs_ack %d",
-		__entry->lsid, __entry->rsid,
-		__entry->index, __entry->needs_ack)
-);
-
-DECLARE_EVENT_CLASS(vnet_tx_stopped_ack_template,
-
-	TP_PROTO(int lsid, int rsid, int ack_end, int npkts),
-
-	TP_ARGS(lsid, rsid, ack_end, npkts),
-
-	TP_STRUCT__entry(
-		__field(int, lsid)
-		__field(int, rsid)
-		__field(int, ack_end)
-		__field(int, npkts)
-	),
-
-	TP_fast_assign(
-		__entry->lsid = lsid;
-		__entry->rsid = rsid;
-		__entry->ack_end = ack_end;
-		__entry->npkts = npkts;
-	),
-
-	TP_printk("(%x:%x) stopped ack for %d; npkts %d",
-		__entry->lsid, __entry->rsid,
-		__entry->ack_end, __entry->npkts)
-);
-DEFINE_EVENT(vnet_tx_stopped_ack_template, vnet_tx_send_stopped_ack,
-	     TP_PROTO(int lsid, int rsid, int ack_end, int npkts),
-	     TP_ARGS(lsid, rsid, ack_end, npkts));
-DEFINE_EVENT(vnet_tx_stopped_ack_template, vnet_tx_defer_stopped_ack,
-	     TP_PROTO(int lsid, int rsid, int ack_end, int npkts),
-	     TP_ARGS(lsid, rsid, ack_end, npkts));
-DEFINE_EVENT(vnet_tx_stopped_ack_template, vnet_tx_pending_stopped_ack,
-	     TP_PROTO(int lsid, int rsid, int ack_end, int npkts),
-	     TP_ARGS(lsid, rsid, ack_end, npkts));
-
-TRACE_EVENT(vnet_rx_stopped_ack,
-
-	TP_PROTO(int lsid, int rsid, int end),
-
-	TP_ARGS(lsid, rsid, end),
-
-	TP_STRUCT__entry(
-		__field(int, lsid)
-		__field(int, rsid)
-		__field(int, end)
-	),
-
-	TP_fast_assign(
-		__entry->lsid = lsid;
-		__entry->rsid = rsid;
-		__entry->end = end;
-	),
-
-	TP_printk("(%x:%x) stopped ack for index %d",
-		__entry->lsid, __entry->rsid, __entry->end)
-);
-
-TRACE_EVENT(vnet_tx_trigger,
-
-	TP_PROTO(int lsid, int rsid, int start, int err),
-
-	TP_ARGS(lsid, rsid, start, err),
-
-	TP_STRUCT__entry(
-		__field(int, lsid)
-		__field(int, rsid)
-		__field(int, start)
-		__field(int, err)
-	),
-
-	TP_fast_assign(
-		__entry->lsid = lsid;
-		__entry->rsid = rsid;
-		__entry->start = start;
-		__entry->err = err;
-	),
-
-	TP_printk("(%x:%x) Tx trigger for %d sent with err %d %s",
-		__entry->lsid, __entry->rsid, __entry->start,
-		__entry->err, __entry->err > 0 ? "(ok)" : " ")
-);
-
-TRACE_EVENT(vnet_skip_tx_trigger,
-
-	TP_PROTO(int lsid, int rsid, int last),
-
-	TP_ARGS(lsid, rsid, last),
-
-	TP_STRUCT__entry(
-		__field(int, lsid)
-		__field(int, rsid)
-		__field(int, last)
-	),
-
-	TP_fast_assign(
-		__entry->lsid = lsid;
-		__entry->rsid = rsid;
-		__entry->last = last;
-	),
-
-	TP_printk("(%x:%x) Skip Tx trigger. Last trigger sent was %d",
-		__entry->lsid, __entry->rsid, __entry->last)
-);
-#endif /* _TRACE_SOCK_H */
-
-/* This part must be outside protection */
-#include <trace/define_trace.h>
-- 
2.37.2

