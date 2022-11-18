Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F962F916
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:15:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDL2j48G4z3fCj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:15:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EfhLOp+k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EfhLOp+k;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsb1fNrz3cK7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:03 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE7EXk005326
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VVYtn5NwgvBZmfCMrsOmYaknHQEVDxbUVM4lDwAU2pk=;
 b=EfhLOp+k6Bsi0bcVcta06I/2v4AJLyObL39w2NCMu4Drf7lXNaBRfFBeiwbMQIBGYwaN
 433AZ2vmbLWpxaBxXrIOItKShHzRXR5EYemdG1bo0vAJ5mJry3SU8VNu3Aj4qCzrZYO8
 4oPRLKxsv6e4eccFrL51YvKHb0Gd5h7ruOMBiH/esesAwp1nHS91MueO+3YvaPvY3Ubd
 mC1iQXPpc/rz2lElwmxNuKeMzHC6+ZxZVBvMYF1c9EqLuPB+OIfJtkZUsYXDRxErAqgo
 DBpaHvZ9gR+OhMWlayWeUpv+YqR1AvycOfwBKP9TamQeBiXePsbL2zu/naw+Cpy1Vn8N SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx6dx1x73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:08:00 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIE7gCx007390
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:08:00 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx6dx1x68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:08:00 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF6sOh015387;
	Fri, 18 Nov 2022 15:07:59 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma05wdc.us.ibm.com with ESMTP id 3kt34ag7ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:59 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7vPi4915936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:58 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EF7E5805E;
	Fri, 18 Nov 2022 15:07:57 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7810F58058;
	Fri, 18 Nov 2022 15:07:57 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:57 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/13] powerpc/tracing: tracepoints for RTAS entry and exit
Date: Fri, 18 Nov 2022 09:07:50 -0600
Message-Id: <20221118150751.469393-13-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lrcFUrwLRBR3C7h96pSQfYBibJnLiEL6
X-Proofpoint-ORIG-GUID: xfsoUEEgoaMFmeBt1u8M1rOkVx1OcBBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180088
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
 arch/powerpc/include/asm/trace.h | 116 +++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/powerpc/include/asm/trace.h b/arch/powerpc/include/asm/trace.h
index 08cd60cd70b7..e7a301c9eb95 100644
--- a/arch/powerpc/include/asm/trace.h
+++ b/arch/powerpc/include/asm/trace.h
@@ -119,6 +119,122 @@ TRACE_EVENT_FN_COND(hcall_exit,
 );
 #endif
 
+#ifdef CONFIG_PPC_RTAS
+
+#include <asm/rtas-types.h>
+
+/*
+ * Since stop-self is how CPUs go offline on RTAS platforms,
+ * these tracepoints are conditional.
+ */
+
+TRACE_EVENT_CONDITION(rtas_input,
+
+	TP_PROTO(struct rtas_args *rtas_args, const char *name),
+
+	TP_ARGS(rtas_args, name),
+
+	TP_CONDITION(cpu_online(raw_smp_processor_id())),
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
+TRACE_EVENT_CONDITION(rtas_output,
+
+	TP_PROTO(struct rtas_args *rtas_args, const char *name),
+
+	TP_ARGS(rtas_args, name),
+
+	TP_CONDITION(cpu_online(raw_smp_processor_id())),
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
+DEFINE_EVENT_CONDITION(rtas_parameter_block, rtas_ll_entry,
+
+	TP_PROTO(struct rtas_args *rtas_args),
+
+	TP_ARGS(rtas_args),
+
+	TP_CONDITION(cpu_online(raw_smp_processor_id()))
+);
+
+DEFINE_EVENT_CONDITION(rtas_parameter_block, rtas_ll_exit,
+
+	TP_PROTO(struct rtas_args *rtas_args),
+
+	TP_ARGS(rtas_args),
+
+	TP_CONDITION(cpu_online(raw_smp_processor_id()))
+);
+
+#endif /* CONFIG_PPC_RTAS */
+
 #ifdef CONFIG_PPC_POWERNV
 extern int opal_tracepoint_regfunc(void);
 extern void opal_tracepoint_unregfunc(void);
-- 
2.37.1

