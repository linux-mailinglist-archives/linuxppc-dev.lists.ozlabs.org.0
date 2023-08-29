Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6778BE91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 08:38:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S92paitq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZd6J4yFzz3bYx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 16:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S92paitq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZd345xtzz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 16:35:28 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37T6ZD83010614
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WvfvLya7vwOpJd6SISdFgf4EvBTEmZf6PYWR+pDnkQw=;
 b=S92paitqv4j/PI1VZ0aCzdSUoTpFH3nuraU82sMBwIt10NudUrIdKtBK3v/EoCyRRBBC
 F00xACDPofUEM4c73gK6jtWKaF0UgOYYqQ0eYebMYEH0ynGPBN1ufMxIrlYIgDErhBlN
 flhScd8NxJWxZqZ77KoXzIObn4MaCNHxNmYOAsd3fZBrVqm7jhTTrQYpmAOt/Z0D1B55
 6OS6zZjJwAcYkxn+27QK1xR7YjpS9XwqWcjhxUihg01CxZWpUbaZg7lCP3m53ie2ItMJ
 wpsd4bY2etZanorQ4pU2sJFDzyJ0kwsCydYMxJ9RjcJqGbBnPaiGrjjkc2gVUjKZ1HiT rw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3srv4ywur3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:26 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37T3nudM020530
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqv3y9fvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:18 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37T6ZGAN27067042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA872004B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:16 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F74C20040
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:16 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 90F7C6046C;
	Tue, 29 Aug 2023 16:35:13 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/watchpoint: Disable pagefaults when getting user instruction
Date: Tue, 29 Aug 2023 16:34:56 +1000
Message-ID: <20230829063457.54157-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829063457.54157-1-bgray@linux.ibm.com>
References: <20230829063457.54157-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wGUE3PDuD2Kxwjr-1StG5KDJHXUxBvFy
X-Proofpoint-GUID: wGUE3PDuD2Kxwjr-1StG5KDJHXUxBvFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_03,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=608 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308290056
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is called in an atomic context, so is not allowed to sleep if a
user page needs to be faulted in and has nowhere it can be deferred to.
The pagefault_disabled() function is documented as preventing user
access methods from sleeping.

In practice the page will be mapped in nearly always because we are
reading the instruction that just triggered the watchpoint trap.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint_constraints.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint_constraints.c b/arch/powerpc/kernel/hw_breakpoint_constraints.c
index a74623025f3a..9e51801c4915 100644
--- a/arch/powerpc/kernel/hw_breakpoint_constraints.c
+++ b/arch/powerpc/kernel/hw_breakpoint_constraints.c
@@ -131,8 +131,13 @@ void wp_get_instr_detail(struct pt_regs *regs, ppc_inst_t *instr,
 			 int *type, int *size, unsigned long *ea)
 {
 	struct instruction_op op;
+	int err;
 
-	if (__get_user_instr(*instr, (void __user *)regs->nip))
+	pagefault_disable();
+	err = __get_user_instr(*instr, (void __user *)regs->nip);
+	pagefault_enable();
+
+	if (err)
 		return;
 
 	analyse_instr(&op, regs, *instr);
-- 
2.41.0

