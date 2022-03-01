Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 967F14C974C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 21:49:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7TrH54NDz3bxm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 07:49:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kF+4eIya;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kF+4eIya; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7TqW4Gm9z30Hp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 07:48:39 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221Jcf1i026322; 
 Tue, 1 Mar 2022 20:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=NzmemcIvh2KgUCy7fzhsxYkFZy2vGLqre8sjxZP5R68=;
 b=kF+4eIyayhrSMpnvBFd//l22qlJpx1ZYHeY8mAf6EQrsTZItnjbcIWpzkdXTkEdYOYLT
 KEk9g/cwDBspW8qO9WbWREyOHAuYSGPlJ4JKmn7wBLZ9TqBiN9FzDrzYQHfuEwmQ0Txr
 pfsWDCNFfsasAaH4z7uQp4ej12SI00XVADKkvWEk6bMh1LrOoH5qwbNU0OVXBkyR7hPP
 5jqKsGF328/pjh1ZhSFZAei7r/j6VjEB7NJfmgnwwVDc1em+ruqIQfYIeudctnBf0y7z
 yCRv34VBvQ83usRvF01hNUpePwZ4UARtNpTVt9VzO217mga831ttQMLBbt93syS2m3jS vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehqp2vg3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 20:48:28 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221Kf5oc013621;
 Tue, 1 Mar 2022 20:48:28 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehqp2vg38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 20:48:27 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221Km4sK021560;
 Tue, 1 Mar 2022 20:48:27 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3egfss5ubs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 20:48:26 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221KmNoX47907140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 20:48:23 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01CCBAE067;
 Tue,  1 Mar 2022 20:48:23 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5484EAE066;
 Tue,  1 Mar 2022 20:48:22 +0000 (GMT)
Received: from localhost (unknown [9.65.81.114])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  1 Mar 2022 20:48:22 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s: Fix build failure when
 CONFIG_PPC_64S_HASH_MMU is not set
Date: Tue,  1 Mar 2022 17:47:43 -0300
Message-Id: <20220301204743.45133-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: at-I7ZtJdSHfDzVpnXQa3viA3xdvEebj
X-Proofpoint-ORIG-GUID: mprGZymhnLIFYLdSyAXV8aPK4MB-unCr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010103
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
Cc: "Erhard F ." <erhard_f@mailbox.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Nick Child <nick.child@ibm.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, mopsfelder@gmail.com,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following build failure occurs when CONFIG_PPC_64S_HASH_MMU is not
set:

    arch/powerpc/kernel/setup_64.c: In function ‘setup_per_cpu_areas’:
    arch/powerpc/kernel/setup_64.c:811:21: error: ‘mmu_linear_psize’ undeclared (first use in this function); did you mean ‘mmu_virtual_psize’?
      811 |                 if (mmu_linear_psize == MMU_PAGE_4K)
          |                     ^~~~~~~~~~~~~~~~
          |                     mmu_virtual_psize
    arch/powerpc/kernel/setup_64.c:811:21: note: each undeclared identifier is reported only once for each function it appears in

Move the declaration of mmu_linear_psize outside of
CONFIG_PPC_64S_HASH_MMU ifdef.

After the above is fixed, it fails later with the following error:

    ld: arch/powerpc/kexec/file_load_64.o: in function `.arch_kexec_kernel_image_probe':
    file_load_64.c:(.text+0x1c1c): undefined reference to `.add_htab_mem_range'

Fix that, too, by conditioning add_htab_mem_range() symbol to
CONFIG_PPC_64S_HASH_MMU.

Fixes: 387e220a2e5e (powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU)
Reported-by: Erhard F. <erhard_f@mailbox.org>
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Nick Child <nick.child@ibm.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215567
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
---
v1: https://lore.kernel.org/linuxppc-dev/20220301164843.29170-1-muriloo@linux.ibm.com/

 arch/powerpc/include/asm/book3s/64/mmu.h | 2 +-
 arch/powerpc/include/asm/kexec_ranges.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index ba5b1becf518..006cbec70ffe 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -202,7 +202,6 @@ static inline struct subpage_prot_table *mm_ctx_subpage_prot(mm_context_t *ctx)
 /*
  * The current system page and segment sizes
  */
-extern int mmu_linear_psize;
 extern int mmu_virtual_psize;
 extern int mmu_vmalloc_psize;
 extern int mmu_io_psize;
@@ -213,6 +212,7 @@ extern int mmu_io_psize;
 #define mmu_virtual_psize MMU_PAGE_4K
 #endif
 #endif
+extern int mmu_linear_psize;
 extern int mmu_vmemmap_psize;
 
 /* MMU initialization */
diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
index 7a90000f8d15..f83866a19e87 100644
--- a/arch/powerpc/include/asm/kexec_ranges.h
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -9,7 +9,7 @@ struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
 int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
 int add_tce_mem_ranges(struct crash_mem **mem_ranges);
 int add_initrd_mem_range(struct crash_mem **mem_ranges);
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_64S_HASH_MMU
 int add_htab_mem_range(struct crash_mem **mem_ranges);
 #else
 static inline int add_htab_mem_range(struct crash_mem **mem_ranges)
-- 
2.35.1

