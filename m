Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6132D9392
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 08:16:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvXkH60W3zDqH1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 18:16:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h7LvDr8+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvXhM2JlSzDq9J
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 18:14:42 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BE72VwR175963; Mon, 14 Dec 2020 02:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=q/DlQVhLTnmUwKU5xRW8Jb4eOPXPaAgGa7u3Dz55txM=;
 b=h7LvDr8+PsYOCzb3pQpTG8a3efNspgdfjQ/fno5XXMVGa8r9GKZ5TwuXASOtYg6hTxtc
 Qn0BzEz8TWQEPzAwMJkezBQPYAJOSqPQn7xrF+wQnInQ6h4rDcKui77ByBQDVY8bcHAS
 LJmKS+oSzr+3esz9fP0xJ4S5fsnsQujPZMKvtr9o48F2ZYTdROI6za9HJ9F0PzgjLNil
 uW54iBHGs+QBQR6A+fJ0bIts4f/IKJN0KVly7J4xeNDaNLMzoJwexjTmE5MX8wfit9nu
 HDc8t0nmwu3hpk5Sq0oFK5ZPWmsy6RAzmwqWpNUhQ/bRcFjJUnn1OOGs7cPJK9Q6nmfM qA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35e250a437-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 02:14:28 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BE754po011279;
 Mon, 14 Dec 2020 07:14:27 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 35cng887dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 07:14:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BE7DBLY21234162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 07:13:11 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A18AC605A;
 Mon, 14 Dec 2020 07:13:11 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC5BFC605F;
 Mon, 14 Dec 2020 07:13:09 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.194.110])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Dec 2020 07:13:09 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/kup: Mark the kuap/keup function non __init
Date: Mon, 14 Dec 2020 12:43:06 +0530
Message-Id: <20201214071306.346399-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_03:2020-12-11,
 2020-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140049
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel call these functions on cpu online and hence they should
not be marked __init.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s32/mmu.c   | 4 ++--
 arch/powerpc/mm/book3s64/pkeys.c | 4 ++--
 arch/powerpc/mm/init-common.c    | 2 +-
 arch/powerpc/mm/nohash/8xx.c     | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 23f60e97196e..8d9e90a99b51 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -449,7 +449,7 @@ void __init print_system_hash_info(void)
 }
 
 #ifdef CONFIG_PPC_KUEP
-void __init setup_kuep(bool disabled)
+void setup_kuep(bool disabled)
 {
 	pr_info("Activating Kernel Userspace Execution Prevention\n");
 
@@ -459,7 +459,7 @@ void __init setup_kuep(bool disabled)
 #endif
 
 #ifdef CONFIG_PPC_KUAP
-void __init setup_kuap(bool disabled)
+void setup_kuap(bool disabled)
 {
 	pr_info("Activating Kernel Userspace Access Protection\n");
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 2b7ded396db4..f1c6f264ed91 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -251,7 +251,7 @@ void __init pkey_early_init_devtree(void)
 }
 
 #ifdef CONFIG_PPC_KUEP
-void __init setup_kuep(bool disabled)
+void setup_kuep(bool disabled)
 {
 	if (disabled)
 		return;
@@ -277,7 +277,7 @@ void __init setup_kuep(bool disabled)
 #endif
 
 #ifdef CONFIG_PPC_KUAP
-void __init setup_kuap(bool disabled)
+void setup_kuap(bool disabled)
 {
 	if (disabled)
 		return;
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index afdebb95bcae..c71af3978496 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -47,7 +47,7 @@ static int __init parse_nosmap(char *p)
 }
 early_param("nosmap", parse_nosmap);
 
-void __ref setup_kup(void)
+void setup_kup(void)
 {
 	setup_kuep(disable_kuep);
 	setup_kuap(disable_kuap);
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 231ca95f9ffb..9fba29b95b5a 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -245,7 +245,7 @@ void set_context(unsigned long id, pgd_t *pgd)
 }
 
 #ifdef CONFIG_PPC_KUEP
-void __init setup_kuep(bool disabled)
+void setup_kuep(bool disabled)
 {
 	if (disabled)
 		return;
@@ -257,7 +257,7 @@ void __init setup_kuep(bool disabled)
 #endif
 
 #ifdef CONFIG_PPC_KUAP
-void __init setup_kuap(bool disabled)
+void setup_kuap(bool disabled)
 {
 	pr_info("Activating Kernel Userspace Access Protection\n");
 
-- 
2.28.0

