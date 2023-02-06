Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DF68C662
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 20:04:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bK04ccCz3fTv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:04:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W/o7HifC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W/o7HifC;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b5z4tctz3cMR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5585860FF4;
	Mon,  6 Feb 2023 18:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82610C433A8;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709665;
	bh=+pC+FZc9iAE0L6DVRGOjsHp8weWdfKOZBYNgltfouaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W/o7HifCAEOeT+WMD7oK/vf/YcaC8B8YI72rbI2cv7Vt+SbRbMC8C368z1MBtWDNp
	 cCZdCgrLZI5HTKf8vrFNhyXPLcIAFcGq7gFOwQGaD49cm4Snw0IjzZC3PHSSZnPltc
	 XoHdL2Uw0RIWjIAxFCTtnojma1Ls/XC8tZ4xxj9nffKEJheX0Y02RccIF4WgFKj/xo
	 Lt55RbhcJltVOCXdxoPNwD2t57AfKta3bqVRrWiY2fjb0eyJ8xZEhTUl6fDAUHtz+D
	 fkcyKOhCl63ZKizh4HNbt8eQTlKGIfy0KlYKf6oKK84M3tspmzmiZTJQrMoLQDPvSj
	 aqxoUbRzcBRMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD17C6379F;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Feb 2023 12:54:25 -0600
Subject: [PATCH v2 09/19] powerpc/tracing: tracepoints for RTAS entry and
 exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-9-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=6439;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=wDn9ix2eBqz3VhUH9dpd9gT14peQ95qrGRvmcr4zpbw=;
 b=8oX6AelRB0SLjApT/g5sVekIN5so4s+FirYUaMYDqFZfYVFK7z7YyaJyTnRWK/06bxPRtzCvR
 ONU/SmIWU+BAIYI//X0N6ztHe4RS7HtPTQqy7nEpVdGI/1S7fgqkouC
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Add two sets of tracepoints to be used around RTAS entry:

* rtas_input/rtas_output, which emit the function name, its inputs,
  the returned status, and any other outputs. These produce an API-level
  record of OS<->RTAS activity.

* rtas_ll_entry/rtas_ll_exit, which are lower-level and emit the
  entire contents of the parameter block (aka rtas_args) on entry and
  exit. Likely useful only for debugging.

With uses of these tracepoints in do_enter_rtas() to be added in the
following patch, examples of get-time-of-day and event-scan functions
as rendered by trace-cmd (with some multi-line formatting manually
imposed on the rtas_ll_* entries to avoid extremely long lines in the
commit message):

cat-36800 [059]  4978.518303: rtas_input:           get-time-of-day arguments:
cat-36800 [059]  4978.518306: rtas_ll_entry:        token=3 nargs=0 nret=8
                                                    params: [0]=0x00000000 [1]=0x00000000 [2]=0x00000000 [3]=0x00000000
                                                            [4]=0x00000000 [5]=0x00000000 [6]=0x00000000 [7]=0x00000000
							    [8]=0x00000000 [9]=0x00000000 [10]=0x00000000 [11]=0x00000000
							    [12]=0x00000000 [13]=0x00000000 [14]=0x00000000 [15]=0x00000000
cat-36800 [059]  4978.518366: rtas_ll_exit:         token=3 nargs=0 nret=8
                                                    params: [0]=0x00000000 [1]=0x000007e6 [2]=0x0000000b [3]=0x00000001
						            [4]=0x00000000 [5]=0x0000000e [6]=0x00000008 [7]=0x2e0dac40
							    [8]=0x00000000 [9]=0x00000000 [10]=0x00000000 [11]=0x00000000
							    [12]=0x00000000 [13]=0x00000000 [14]=0x00000000 [15]=0x00000000
cat-36800 [059]  4978.518366: rtas_output:          get-time-of-day status: 0, other outputs: 2022 11 1 0 14 8 772648000

kworker/39:1-336   [039]  4982.731623: rtas_input:           event-scan arguments: 4294967295 0 80484920 2048
kworker/39:1-336   [039]  4982.731626: rtas_ll_entry:        token=6 nargs=4 nret=1
                                                             params: [0]=0xffffffff [1]=0x00000000 [2]=0x04cc1a38 [3]=0x00000800
							             [4]=0x00000000 [5]=0x0000000e [6]=0x00000008 [7]=0x2e0dac40
								     [8]=0x00000000 [9]=0x00000000 [10]=0x00000000 [11]=0x00000000
								     [12]=0x00000000 [13]=0x00000000 [14]=0x00000000 [15]=0x00000000
kworker/39:1-336   [039]  4982.731676: rtas_ll_exit:         token=6 nargs=4 nret=1
                                                             params: [0]=0xffffffff [1]=0x00000000 [2]=0x04cc1a38 [3]=0x00000800
							             [4]=0x00000001 [5]=0x0000000e [6]=0x00000008 [7]=0x2e0dac40
								     [8]=0x00000000 [9]=0x00000000 [10]=0x00000000 [11]=0x00000000
								     [12]=0x00000000 [13]=0x00000000 [14]=0x00000000 [15]=0x00000000
kworker/39:1-336   [039]  4982.731677: rtas_output:          event-scan status: 1, other outputs:

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/trace.h | 103 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/powerpc/include/asm/trace.h b/arch/powerpc/include/asm/trace.h
index 08cd60cd70b7..82cc2c6704e6 100644
--- a/arch/powerpc/include/asm/trace.h
+++ b/arch/powerpc/include/asm/trace.h
@@ -119,6 +119,109 @@ TRACE_EVENT_FN_COND(hcall_exit,
 );
 #endif
 
+#ifdef CONFIG_PPC_RTAS
+
+#include <asm/rtas-types.h>
+
+TRACE_EVENT(rtas_input,
+
+	TP_PROTO(struct rtas_args *rtas_args, const char *name),
+
+	TP_ARGS(rtas_args, name),
+
+	TP_STRUCT__entry(
+		__field(__u32, nargs)
+		__string(name, name)
+		__dynamic_array(__u32, inputs, be32_to_cpu(rtas_args->nargs))
+	),
+
+	TP_fast_assign(
+		__entry->nargs = be32_to_cpu(rtas_args->nargs);
+		__assign_str(name, name);
+		be32_to_cpu_array(__get_dynamic_array(inputs), rtas_args->args, __entry->nargs);
+	),
+
+	TP_printk("%s arguments: %s", __get_str(name),
+		  __print_array(__get_dynamic_array(inputs), __entry->nargs, 4)
+	)
+);
+
+TRACE_EVENT(rtas_output,
+
+	TP_PROTO(struct rtas_args *rtas_args, const char *name),
+
+	TP_ARGS(rtas_args, name),
+
+	TP_STRUCT__entry(
+		__field(__u32, nr_other)
+		__field(__s32, status)
+		__string(name, name)
+		__dynamic_array(__u32, other_outputs, be32_to_cpu(rtas_args->nret) - 1)
+	),
+
+	TP_fast_assign(
+		__entry->nr_other = be32_to_cpu(rtas_args->nret) - 1;
+		__entry->status = be32_to_cpu(rtas_args->rets[0]);
+		__assign_str(name, name);
+		be32_to_cpu_array(__get_dynamic_array(other_outputs),
+				  &rtas_args->rets[1], __entry->nr_other);
+	),
+
+	TP_printk("%s status: %d, other outputs: %s", __get_str(name), __entry->status,
+		  __print_array(__get_dynamic_array(other_outputs),
+				__entry->nr_other, 4)
+	)
+);
+
+DECLARE_EVENT_CLASS(rtas_parameter_block,
+
+	TP_PROTO(struct rtas_args *rtas_args),
+
+	TP_ARGS(rtas_args),
+
+	TP_STRUCT__entry(
+		__field(u32, token)
+		__field(u32, nargs)
+		__field(u32, nret)
+		__array(__u32, params, 16)
+	),
+
+	TP_fast_assign(
+		__entry->token = be32_to_cpu(rtas_args->token);
+		__entry->nargs = be32_to_cpu(rtas_args->nargs);
+		__entry->nret = be32_to_cpu(rtas_args->nret);
+		be32_to_cpu_array(__entry->params, rtas_args->args, ARRAY_SIZE(rtas_args->args));
+	),
+
+	TP_printk("token=%u nargs=%u nret=%u params:"
+		  " [0]=0x%08x [1]=0x%08x [2]=0x%08x [3]=0x%08x"
+		  " [4]=0x%08x [5]=0x%08x [6]=0x%08x [7]=0x%08x"
+		  " [8]=0x%08x [9]=0x%08x [10]=0x%08x [11]=0x%08x"
+		  " [12]=0x%08x [13]=0x%08x [14]=0x%08x [15]=0x%08x",
+		  __entry->token, __entry->nargs, __entry->nret,
+		  __entry->params[0], __entry->params[1], __entry->params[2], __entry->params[3],
+		  __entry->params[4], __entry->params[5], __entry->params[6], __entry->params[7],
+		  __entry->params[8], __entry->params[9], __entry->params[10], __entry->params[11],
+		  __entry->params[12], __entry->params[13], __entry->params[14], __entry->params[15]
+	)
+);
+
+DEFINE_EVENT(rtas_parameter_block, rtas_ll_entry,
+
+	TP_PROTO(struct rtas_args *rtas_args),
+
+	TP_ARGS(rtas_args)
+);
+
+DEFINE_EVENT(rtas_parameter_block, rtas_ll_exit,
+
+	TP_PROTO(struct rtas_args *rtas_args),
+
+	TP_ARGS(rtas_args)
+);
+
+#endif /* CONFIG_PPC_RTAS */
+
 #ifdef CONFIG_PPC_POWERNV
 extern int opal_tracepoint_regfunc(void);
 extern void opal_tracepoint_unregfunc(void);

-- 
2.39.1

