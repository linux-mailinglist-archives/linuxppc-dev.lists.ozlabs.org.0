Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB2A33FDE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 04:49:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1ChN2cmDz3c3s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 14:49:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ekzl93DI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ekzl93DI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Cgj3dn9z3bs1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 14:49:05 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12I3XdPY054814; Wed, 17 Mar 2021 23:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=B1glSlsMjml8IkUtR6iwf428e5+HZmHvd+7Z04QhEkM=;
 b=ekzl93DIRWTF6phfauP7t74zrEVQgiu5X9903L+P7oJ3M9yT+HSPanpf8LnRZgTEIDUn
 sxiLBI1s+/8cIrd30AoA1WP3oLdG2TqBe2bi38yh10UoRrPvKGjVFq0+95FthZXCzeRQ
 R48/IghC9UUf4JWG3pg25KtrHIxsyBm9HOic0luXJYz5hKwqxS5vgDIs7L2sjvZhyi/Z
 E1FTqWsq17GQxTEVVaJafKpKCtkp4QE8P3+25UbLDWEqlpy82xQwnUMxyciQmLu6EDfj
 CDFE/CA6Nr6JNyf6+6nMmBZ4woy50R+3llwbXG8dsbVrYgg9Xdv6XFLvyBAjlUECJVpn 6A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37bwx8hf90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Mar 2021 23:49:01 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12I3luUY010489;
 Thu, 18 Mar 2021 03:49:00 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 378n19ms7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 03:49:00 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12I3mxLg32309594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 03:49:00 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E43F6AE05F;
 Thu, 18 Mar 2021 03:48:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98224AE062;
 Thu, 18 Mar 2021 03:48:58 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.72.215])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 18 Mar 2021 03:48:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm: Revert "powerpc/mm: Remove DEBUG_VM_PGTABLE
 support on powerpc"
Date: Thu, 18 Mar 2021 09:18:55 +0530
Message-Id: <20210318034855.74513-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_01:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=770 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103180026
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

This reverts commit 675bceb097e6 ("powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc")

All the related issues are fixed by the series
https://lore.kernel.org/linux-mm/20200902114222.181353-1-aneesh.kumar@linux.ibm.com

Hence enable it back

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 Documentation/features/debug/debug-vm-pgtable/arch-support.txt | 2 +-
 arch/powerpc/Kconfig                                           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
index 7aff505af706..fa83403b4aec 100644
--- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
+++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
@@ -21,7 +21,7 @@
     |       nios2: | TODO |
     |    openrisc: | TODO |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..982c87d5c051 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -119,6 +119,7 @@ config PPC
 	#
 	select ARCH_32BIT_OFF_T if PPC32
 	select ARCH_HAS_DEBUG_VIRTUAL
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
-- 
2.30.2

