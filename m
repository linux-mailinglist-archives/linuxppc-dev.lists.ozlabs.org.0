Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F84264AB17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 00:05:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWHKV2rNlz3cNg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 10:05:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NJz/Dfvl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NJz/Dfvl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWHFQ1mrfz3057
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 10:02:01 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCMaSah003642
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JHbk9+jAr6wcz2WnSLQXsK8ZhTBogT0E12Qbj6JVQGc=;
 b=NJz/DfvlvP5nCPIjhM0AEstO79KRdUkfxaPr2FBweM6PS7CWIYrmbB818xsU2jTTR/VR
 lOabQriU7GI/A/n309sQ+NCjzb7fig0g7WTuD/4Z4yNfo8ZjMsRDgekMNJlrEfml6k32
 5DYp5pEG7dXrvOANtUCwdSb3wynOmOWdX1cTsfvO0knNsJBPLCUQj1F1u5wNBjgqLVWV
 CiTnjGXb9sPZ1CDOfU+KYWQkqXRM/inx+5BVpc/mI87Xw88EmtDkagWbH8rbpH8lFOUv
 pxrMrqEOyH0GrOZlBgSCdd6fJ7i2gUNV1WsCOhkTzmp82+WmoHehbTqRRHIMiH6iqVEW 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecvrruum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:58 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCMttXt020286
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:58 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecvrruu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:58 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCLBVhA011450;
	Mon, 12 Dec 2022 23:01:57 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6fs18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:57 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BCN1tFA5636756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 23:01:55 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62C595807E;
	Mon, 12 Dec 2022 23:01:55 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4837F58056;
	Mon, 12 Dec 2022 23:01:55 +0000 (GMT)
Received: from localhost (unknown [9.163.54.62])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Dec 2022 23:01:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/rtas: strengthen do_enter_rtas() type safety, drop inline
Date: Mon, 12 Dec 2022 17:01:52 -0600
Message-Id: <20221212230154.851325-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221212230154.851325-1-nathanl@linux.ibm.com>
References: <20221212230154.851325-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J5rBhbJ6k3Wh4n1cDYuf1Hmgu4Jxw0ja
X-Proofpoint-ORIG-GUID: KNTbQd6umaZMAN8-9433azKAafPx5UPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=915 clxscore=1015 lowpriorityscore=0 bulkscore=0
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

Make do_enter_rtas() take a pointer to struct rtas_args and do the
__pa() conversion in one place instead of leaving it to callers. This
also makes it possible to introduce enter/exit tracepoints that access
the rtas_args struct fields.

There's no apparent reason to force inlining of do_enter_rtas()
either, and it seems to bloat the code a bit. Let the compiler decide.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index ac52b10a72d8..7a4c0505812b 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -528,7 +528,7 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
-static inline void do_enter_rtas(unsigned long args)
+static void do_enter_rtas(struct rtas_args *args)
 {
 	unsigned long msr;
 
@@ -543,7 +543,7 @@ static inline void do_enter_rtas(unsigned long args)
 
 	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
 
-	enter_rtas(args);
+	enter_rtas(__pa(args));
 
 	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
 }
@@ -914,7 +914,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
 	save_args = rtas.args;
 	rtas.args = err_args;
 
-	do_enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(&rtas.args);
 
 	err_args = rtas.args;
 	rtas.args = save_args;
@@ -961,7 +961,7 @@ va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	for (i = 0; i < nret; ++i)
 		args->rets[i] = 0;
 
-	do_enter_rtas(__pa(args));
+	do_enter_rtas(args);
 }
 
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, ...)
@@ -1736,7 +1736,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	flags = lock_rtas();
 
 	rtas.args = args;
-	do_enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(&rtas.args);
 	args = rtas.args;
 
 	/* A -1 return code indicates that the last command couldn't
-- 
2.37.1

