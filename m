Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A2762F91F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:19:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDL6r5rvdz3f9l
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k15ya8ze;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k15ya8ze;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsh6QZbz3dvG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:08 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE81PI028258
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KHrgOgYbnWUbm+3seEvXpcJvdbg2t+kvSDYPLx5zKrI=;
 b=k15ya8zevw+Ced5PQOmSqpA1c90u7kAkjbHItRUifxiPXfbDgIpOeY5ls0HKN0oCjKbC
 D5pC7r+UVqPhOdXPISxKjid/FfAfS05fpaxUJSNBjsMbFc4VY9KIMdHBNicc8z+sYOnm
 HkYFkIarNR7Jjpf2v7GEYCKKCQAPmmv++1ZotHK72ZltvTku7qpsCa+OU2bfDAw1TkSd
 v9KsjB3sKScUrhwvJR1TxeqaMNj2lhMQ5YWAjFSmgY1e+7CcFknYNjlSbkmnev4fablD
 3FG6MK8SkyA9VrdK+S8umikxOyqo/8FRsUBwdFRXyYpaOUvTHSG4MWyqsGQu9hqAI4ak rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx8w0wwgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:08:00 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIEAFXd003346
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:59 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx8w0wwg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:59 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF6orU008271;
	Fri, 18 Nov 2022 15:07:58 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma01dal.us.ibm.com with ESMTP id 3kt34aa866-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:58 +0000
Received: from smtpav02.dal12v.mail.ibm.com ([9.208.128.128])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7v9e23593486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:57 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFD3F5805A;
	Fri, 18 Nov 2022 15:07:56 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4CC158066;
	Fri, 18 Nov 2022 15:07:56 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:56 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/13] powerpc/rtas: strengthen do_enter_rtas() type safety, drop inline
Date: Fri, 18 Nov 2022 09:07:49 -0600
Message-Id: <20221118150751.469393-12-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HP1AT36_uhVUAqph2PN_9z9FpMa7YQ0M
X-Proofpoint-GUID: XtHRA2spGuhiVi1IOwqgKZM1VclMDnym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=897
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211180084
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

Make do_enter_rtas() take a pointer to struct rtas_args and do the
__pa() conversion in one place instead of leaving it to callers. This
also makes it possible to introduce enter/exit tracepoints that access
the rtas_args struct fields.

There's no apparent reason to force inlining of do_enter_rtas()
either, and it seems to bloat the code a bit. Let the compiler decide.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index a88db3b3486f..198366d641d0 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -522,7 +522,7 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
-static inline void do_enter_rtas(unsigned long args)
+static void do_enter_rtas(struct rtas_args *args)
 {
 	unsigned long msr;
 
@@ -537,7 +537,7 @@ static inline void do_enter_rtas(unsigned long args)
 
 	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
 
-	enter_rtas(args);
+	enter_rtas(__pa(args));
 
 	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
 }
@@ -908,7 +908,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
 	save_args = rtas.args;
 	rtas.args = err_args;
 
-	do_enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(&rtas.args);
 
 	err_args = rtas.args;
 	rtas.args = save_args;
@@ -955,7 +955,7 @@ va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	for (i = 0; i < nret; ++i)
 		args->rets[i] = 0;
 
-	do_enter_rtas(__pa(args));
+	do_enter_rtas(args);
 }
 
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, ...)
@@ -1731,7 +1731,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	flags = lock_rtas();
 
 	rtas.args = args;
-	do_enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(&rtas.args);
 	args = rtas.args;
 
 	/* A -1 return code indicates that the last command couldn't
-- 
2.37.1

