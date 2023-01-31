Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB8368226D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 03:59:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5VBw2sYsz3cd7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 13:59:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R7vBCyr4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R7vBCyr4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5V9y5zDMz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 13:58:46 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V2W84J031138;
	Tue, 31 Jan 2023 02:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=WU6+Re5td5CpgGK9u8CZ3Hnl+alKtBh3vjpjgUODC38=;
 b=R7vBCyr4heY4OMx1YHrj4gbk46TrIJTL5Pc0FbyjhLfRV6WGPKG+SigJ3cJypfgQpeX4
 vpSRS8rXgUeI4I56K5twr6fXxuYaerctB2v8mlY/6zS0z44m2NpmQdjTSxtIauzWa4lc
 vvhJU9MxJOwKcJ5pqDK/Stix7GZ0FQmvJwS26Xjm80GnT8UzdzlkZytnDSi8RSqpjrT3
 wKIeyBrDdse/rtFnlYW9mIBlFipV0cYG998fF3BdJQJrWBI10QMzOAScSXjpeC1Zk9Cf
 sE3d2mysjb5zQb1zRY+kA/ON/YvVFyW/RS8NAhkQJrq6372B9zPUkRk9YNHc2xu+MmIU JQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nersfame1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 02:58:38 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UGCvn5014009;
	Tue, 31 Jan 2023 02:58:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvsha34w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 02:58:35 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V2wXoT23658988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 02:58:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D27520040;
	Tue, 31 Jan 2023 02:58:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 835C52004B;
	Tue, 31 Jan 2023 02:58:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 02:58:32 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C798260151;
	Tue, 31 Jan 2023 13:58:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/tlb: Implement book3s/32/tlbflush.h local_flush_tlb_page_psize
Date: Tue, 31 Jan 2023 13:58:17 +1100
Message-Id: <20230131025817.279417-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aTz-zrOTw6hp2jnBxuP61B0acJ4JDa5-
X-Proofpoint-GUID: aTz-zrOTw6hp2jnBxuP61B0acJ4JDa5-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_19,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=551 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301310021
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
Cc: kernel test robot <lkp@intel.com>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit introducing this function implemented it as a build bug on this
platform to make the compiler happy, as the only use in the code is guarded
behind a radix_enabled() conditional.

GCC recognises that cpu_has_feature(MMU_FTR_TYPE_RADIX) returns false on this
platform and eliminates the build bug as dead code. However, when
CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG is enabled, the assertion and possible
call to early_cpu_... prevents Clang from eliminating any code that's
conditional on the return value. So Clang triggers the build bug as reported
by the kernel test robot:

https://lore.kernel.org/llvm/202301212348.eDkowvfF-lkp@intel.com

Fixes: 274d842fa1ef ("powerpc/tlb: Add local flush for page given mm_struct and psize")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---

Supersedes https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230124215424.9068-1-bgray@linux.ibm.com/

---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index 4be572908124..cde3b6f5d563 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
 #define _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H

-#include <linux/build_bug.h>
-
 #define MMU_NO_CONTEXT      (0)
 /*
  * TLB flushing for "classic" hash-MMU 32-bit CPUs, 6xx, 7xx, 7xxx
@@ -80,7 +78,7 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
 					      unsigned long vmaddr, int psize)
 {
-	BUILD_BUG();
+	flush_range(mm, vmaddr, vmaddr + PAGE_SIZE);
 }

 static inline void local_flush_tlb_mm(struct mm_struct *mm)

base-commit: ca272751ba18ca8f137af631cbc9f3f987fab6e3
--
2.39.1
