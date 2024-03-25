Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D688B488
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 23:51:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bg/Bx5vF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3Spw4R6cz3vcb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 09:51:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bg/Bx5vF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3SmL5hh5z3dRt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 09:49:22 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42PMHiUK014792;
	Mon, 25 Mar 2024 22:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=bz2G6mVtZv25iUCAj9Knyvsb3IigxeKga1NtW53toro=;
 b=Bg/Bx5vFGrHObzyPqOCE9j1xwO2jCrh0hD/LexbFynU1TNATe/WCFp3pK5Pwor1AX1d3
 RyYJEZrh8/ETRRJt9iY7kdHPCdUNcxPXEHU7/+NiFXEVSh2xOcj77weLYKbhOR0GPh77
 sDMoe2Mtec/wDkdVL1LDhuvoLK5m3my/K9eG1g2r1jTCelpTnMHmnYS5p6WkMDnHB3kK
 xB70152gRZZfs3E5IBpPGhVqU/imbV3C1Ps3s8Nne9p7Ybu8qh0el56y2F4mD5xZDBHJ
 mTeAZ3t3fAeXrwltskyDZWitmwzGIOzqnX9H/s6h8YTIPO+xnZicAU1qNKodTfliUYx0 4g== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3eg30e9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 22:49:04 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42PKGjEP025458;
	Mon, 25 Mar 2024 22:49:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2awmkya3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 22:49:02 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42PMmwC244892632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 22:49:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8FF520040;
	Mon, 25 Mar 2024 22:48:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DA9C20043;
	Mon, 25 Mar 2024 22:48:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 22:48:58 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E21756014F;
	Tue, 26 Mar 2024 09:48:55 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] powerpc/code-patching: Restore 32-bit patching performance
Date: Tue, 26 Mar 2024 09:48:48 +1100
Message-ID: <20240325224848.20987-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325224848.20987-1-bgray@linux.ibm.com>
References: <20240325224848.20987-1-bgray@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AjDiZND1PIShlh8NgEYJ6ri-VYVhRKbI
X-Proofpoint-GUID: AjDiZND1PIShlh8NgEYJ6ri-VYVhRKbI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_24,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250143
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

The new open/close abstraction makes it more difficult for a
compiler to optimise. This causes 10% worse performance on
ppc32 as in [1]. Restoring the page alignment mask and inlining
the helpers allows the compiler to better reason about the address
alignment, allowing more optimised cache flushing selection.

[1]: https://lore.kernel.org/all/77fdcdeb-4af5-4ad0-a4c6-57bf0762dc65@csgroup.eu/

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v2: * New in v2

I think Suggested-by is an appropriate tag. The patch is Christophe's
from the link, I just added the commit description, so it could well
be better to change the author to Christophe completely.
---
 arch/powerpc/lib/code-patching.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index b3a644290369..d089da115987 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -282,13 +282,13 @@ struct patch_window {
  * Interrupts must be disabled for the entire duration of the patching. The PIDR
  * is potentially changed during this time.
  */
-static int open_patch_window(void *addr, struct patch_window *ctx)
+static __always_inline int open_patch_window(void *addr, struct patch_window *ctx)
 {
 	unsigned long pfn = get_patch_pfn(addr);
 
 	lockdep_assert_irqs_disabled();
 
-	ctx->text_poke_addr = (unsigned long)__this_cpu_read(cpu_patching_context.addr);
+	ctx->text_poke_addr = (unsigned long)__this_cpu_read(cpu_patching_context.addr) & PAGE_MASK;
 
 	if (!mm_patch_enabled()) {
 		ctx->ptep = __this_cpu_read(cpu_patching_context.pte);
@@ -331,7 +331,7 @@ static int open_patch_window(void *addr, struct patch_window *ctx)
 	return 0;
 }
 
-static void close_patch_window(struct patch_window *ctx)
+static __always_inline void close_patch_window(struct patch_window *ctx)
 {
 	lockdep_assert_irqs_disabled();
 
-- 
2.44.0

