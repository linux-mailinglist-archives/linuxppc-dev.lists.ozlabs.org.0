Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0662F91A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:17:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDL4n2rT6z3fKj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:17:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YLELmL44;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YLELmL44;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsb3dJDz3cMv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:03 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE7tCT016589
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1HtL8hUyVpg/o9OPqqCsF/Ytgi0SfZaa3wLuwRt1R1w=;
 b=YLELmL44Lg4/6jer5/GyQRQtQc0CzxWxdacovJGH2EKC17e/o7lLky5obviT1C5k418R
 LcClYcpl6CJpUmUAOr2MFmndKO1EOA2FUItEIt7I92ocTXh23JPHf9+8jQH/5akCLosQ
 pQTniqu2SeUVDb0Rbcg/06mdnAvOVMOyHBhe8JKPTqrWmw8UvjcYFLBN7mzoPAn5Hk5/
 ZD0QRQu9XnJCm5bwXe5j6SmYlSj5Dow/qq7pMWk8qg9FYg2gknNxwvtfQBKLbzqDY/42
 SRVmrMAxvXDvHOOEFipoqa/t/HGHMyNX8tWkqgTHbolGSfjtD602ay0Ku84ACNpzfUJ9 Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx6wqrr8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:08:00 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIE80ND017069
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:08:00 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx6wqrr8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:08:00 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF7VUQ012324;
	Fri, 18 Nov 2022 15:07:59 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma02dal.us.ibm.com with ESMTP id 3kt34aj5df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:59 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7wan30999236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:58 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 229B158062;
	Fri, 18 Nov 2022 15:07:58 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08C6B58059;
	Fri, 18 Nov 2022 15:07:58 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:57 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/13] powerpc/rtas: place tracepoints in do_enter_rtas()
Date: Fri, 18 Nov 2022 09:07:51 -0600
Message-Id: <20221118150751.469393-14-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WaRh-WVHLkG3fkgnQj0Iurz070G1k34K
X-Proofpoint-GUID: zT-j2P_0wT09Iy3nZ1pxt-WM4pzQhTL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 adultscore=0 malwarescore=0 mlxlogscore=669 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180084
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

Call the just-added rtas tracepoints in do_enter_rtas(), taking care
to avoid function name lookups in the CPU offline path.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 198366d641d0..3487b42cfbf7 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -38,6 +38,7 @@
 #include <asm/page.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
+#include <asm/trace.h>
 #include <asm/udbg.h>
 
 enum rtas_function_flags {
@@ -525,6 +526,7 @@ void enter_rtas(unsigned long);
 static void do_enter_rtas(struct rtas_args *args)
 {
 	unsigned long msr;
+	const char *name = NULL;
 
 	/*
 	 * Make sure MSR[RI] is currently enabled as it will be forced later
@@ -537,9 +539,30 @@ static void do_enter_rtas(struct rtas_args *args)
 
 	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
 
+	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
+		/*
+		 * rtas_token_to_function() uses xarray which uses RCU,
+		 * but this code can run in the CPU offline path
+		 * (e.g. stop-self), after it's become invalid to call
+		 * RCU APIs.
+		 */
+		if (cpu_online(smp_processor_id())) {
+			const s32 token = be32_to_cpu(args->token);
+			const struct rtas_function *func = rtas_token_to_function(token);
+
+			name = func->name;
+		}
+	}
+
+	trace_rtas_input(args, name);
+	trace_rtas_ll_entry(args);
+
 	enter_rtas(__pa(args));
 
 	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
+
+	trace_rtas_ll_exit(args);
+	trace_rtas_output(args, name);
 }
 
 struct rtas_t rtas = {
-- 
2.37.1

