Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F119A64AB12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 00:04:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWHJS5ZVhz3f9M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 10:04:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=epPMvQLF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=epPMvQLF;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWHFP4NRrz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 10:02:01 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCKDl3m027582
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aKGV1aoek93pVYHWi+tOCO+8NTP6MeWSAfSvOSZAIlk=;
 b=epPMvQLFG49+vQBzLOMGsMINN0w9szptntE0B8Kemp7vey+oRfLsE7DqUdH94jFJK4ik
 Km9j9QH0jDiccKbPB9JF6wC63xHy+iWh2+sO+KWwLq6wo3soCFAgR3IbgGA9Gkj5eNhw
 cTI8QlPfFa+fCam8C2kxb1fbd56h04Jr/H5pzlH4ju+IS/TDOwf/nFJLNO2IqwAiQq7r
 N5hNorLegqGaQSwYn7/uIY2dgNM2pXPePLVY5WiFVq7IbFQ0K5cAAB5i+TDSlFBL4Zjv
 nEkGDl8zHE0iKwCe59b8f59Yx741KzgIieHmmPSMnJZ54W+yn5hkRsEflEc6STXsaZwF vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3meb57bd3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:58 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCMe4af009340
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:58 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3meb57bd33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:58 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCKKGU1019467;
	Mon, 12 Dec 2022 23:01:57 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3mchr6kpmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:57 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BCN1ueG66716024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 23:01:56 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E108958060;
	Mon, 12 Dec 2022 23:01:55 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8B0358066;
	Mon, 12 Dec 2022 23:01:55 +0000 (GMT)
Received: from localhost (unknown [9.163.54.62])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Dec 2022 23:01:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/tracing: tracepoints for RTAS entry and exit
Date: Mon, 12 Dec 2022 17:01:53 -0600
Message-Id: <20221212230154.851325-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221212230154.851325-1-nathanl@linux.ibm.com>
References: <20221212230154.851325-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 190oZY38hkbx-c7rjDEFe6Uxv-uMc-br
X-Proofpoint-GUID: sl8tJVKRX6xql3roe2_QCHaGu5n4lW1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212120194
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
 arch/powerpc/include/asm/trace.h | 103 +++++++++++++++++++++++++++++++
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
2.37.1

