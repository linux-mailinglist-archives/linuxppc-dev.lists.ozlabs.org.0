Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3764AB18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 00:06:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWHLW2t3hz3fG9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 10:06:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NpdPBlbv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NpdPBlbv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWHFQ1xTNz3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 10:02:01 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCMaVcw004472
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=meNcEIvREZWYxpavnZAJrvQTcDjBosSU/ga7NI4qJVs=;
 b=NpdPBlbviJG4V3tN0Vw4+Euoswd/OJQst0KoEW2z4l3cDN1TjLQiisjQZgPcEBFq5lRu
 DYBk3YJ33ulV9Dp8vE+e5x2r7qCMRxusoINDsJ495ohXepPFQwdMUB1UyhafFWm2HxW6
 fSDc0e/WH1Oqr2Zc6uCIciUGLC/FMIee7uYoaCGH76PRD2y8R3ifQkAH0E3puyD3dd/S
 BwedZHwFzKgNm3x2F/16CsjT98hIXz5LM14XKaxXIarenb5CxCnLv5tLY0jszktCPfqz
 7C2+BLfrYBRgERdxWt9GFp+izGZKIrs3LevQ/hRVjqH5x1Td60Tf8XqeKRdUQqno/WMT lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecvrruuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:59 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCMwkxB027442
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:59 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecvrruuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:58 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCLBVhB011450;
	Mon, 12 Dec 2022 23:01:57 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6fs1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:57 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BCN1u2B44958086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 23:01:56 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B8B158060;
	Mon, 12 Dec 2022 23:01:56 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4525858055;
	Mon, 12 Dec 2022 23:01:56 +0000 (GMT)
Received: from localhost (unknown [9.163.54.62])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Dec 2022 23:01:56 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/rtas: add tracepoints around RTAS entry
Date: Mon, 12 Dec 2022 17:01:54 -0600
Message-Id: <20221212230154.851325-5-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221212230154.851325-1-nathanl@linux.ibm.com>
References: <20221212230154.851325-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uT21HJhrb3RDKqmkeG4lIvc2E_ODAc7V
X-Proofpoint-ORIG-GUID: QeAVTZsBHRbWx_S8NGHO5Qff33ycQ7q2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=929 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120199
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

Decompose the RTAS entry C code into tracing and non-tracing variants,
calling the just-added tracepoints in the tracing-enabled path. Skip
tracing in contexts known to be unsafe (real mode, CPU offline).

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 59 ++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 7a4c0505812b..1c53ef38d14e 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -38,6 +38,7 @@
 #include <asm/page.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
+#include <asm/trace.h>
 #include <asm/udbg.h>
 
 /**
@@ -528,24 +529,70 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
+static void __do_enter_rtas(struct rtas_args *args)
+{
+	enter_rtas(__pa(args));
+	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
+}
+
+static void __do_enter_rtas_trace(struct rtas_args *args)
+{
+	const char *name = NULL;
+	/*
+	 * If the tracepoints that consume the function name aren't
+	 * active, avoid the lookup.
+	 */
+	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
+		const s32 token = be32_to_cpu(args->token);
+		const struct rtas_function *func = rtas_token_to_function(token);
+
+		name = func->name;
+	}
+
+	trace_rtas_input(args, name);
+	trace_rtas_ll_entry(args);
+
+	__do_enter_rtas(args);
+
+	trace_rtas_ll_exit(args);
+	trace_rtas_output(args, name);
+}
+
 static void do_enter_rtas(struct rtas_args *args)
 {
-	unsigned long msr;
-
+	const unsigned long msr = mfmsr();
+	/*
+	 * Situations where we want to skip any active tracepoints for
+	 * safety reasons:
+	 *
+	 * 1. The last code executed on an offline CPU as it stops,
+	 *    i.e. we're about to call stop-self. The tracepoints'
+	 *    function name lookup uses xarray, which uses RCU, which
+	 *    isn't valid to call on an offline CPU.  Any events
+	 *    emitted on an offline CPU will be discarded anyway.
+	 *
+	 * 2. In real mode, as when invoking ibm,nmi-interlock from
+	 *    the pseries MCE handler. We cannot count on trace
+	 *    buffers or the entries in rtas_token_to_function_xarray
+	 *    to be contained in the RMO.
+	 */
+	const unsigned long mask = MSR_IR | MSR_DR;
+	const bool can_trace = likely(cpu_online(raw_smp_processor_id()) &&
+				      (msr & mask) == mask);
 	/*
 	 * Make sure MSR[RI] is currently enabled as it will be forced later
 	 * in enter_rtas.
 	 */
-	msr = mfmsr();
 	BUG_ON(!(msr & MSR_RI));
 
 	BUG_ON(!irqs_disabled());
 
 	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
 
-	enter_rtas(__pa(args));
-
-	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
+	if (can_trace)
+		__do_enter_rtas_trace(args);
+	else
+		__do_enter_rtas(args);
 }
 
 struct rtas_t rtas = {
-- 
2.37.1

