Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71D117619
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 20:46:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wtx14p4qzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 06:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=207.54.116.67; helo=ale.deltatee.com;
 envelope-from=gunthorp@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=deltatee.com
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WtrM6fjczDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 06:42:27 +1100 (AEDT)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1ieOTm-00025o-2L; Mon, 09 Dec 2019 12:14:04 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1ieOTd-0001Mp-GC; Mon, 09 Dec 2019 12:13:49 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon,  9 Dec 2019 12:13:44 -0700
Message-Id: <20191209191346.5197-5-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209191346.5197-1-logang@deltatee.com>
References: <20191209191346.5197-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, hch@lst.de, dan.j.williams@intel.com,
 akpm@linux-foundation.org, catalin.marinas@arm.com, benh@kernel.crashing.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, will@kernel.org, luto@kernel.org,
 peterz@infradead.org, logang@deltatee.com, gor@linux.ibm.com,
 heiko.carstens@de.ibm.com, borntraeger@de.ibm.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 MYRULES_FREE,MYRULES_NO_TEXT autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH 4/6] s390/mm: Thread pgprot_t through vmem_add_mapping()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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
Cc: Vasily Gorbik <gor@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In prepartion to support a pgprot_t argument for arch_add_memory().

Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 arch/s390/include/asm/pgtable.h |  3 ++-
 arch/s390/mm/extmem.c           |  3 ++-
 arch/s390/mm/init.c             |  2 +-
 arch/s390/mm/vmem.c             | 10 +++++-----
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 5ff98d76a66c..e0d5ed38282b 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1673,7 +1673,8 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
 
 #define kern_addr_valid(addr)   (1)
 
-extern int vmem_add_mapping(unsigned long start, unsigned long size);
+extern int vmem_add_mapping(unsigned long start, unsigned long size,
+			    pgprot_t prot);
 extern int vmem_remove_mapping(unsigned long start, unsigned long size);
 extern int s390_enable_sie(void);
 extern int s390_enable_skey(void);
diff --git a/arch/s390/mm/extmem.c b/arch/s390/mm/extmem.c
index fd0dae9d10f4..6cf7029a7b35 100644
--- a/arch/s390/mm/extmem.c
+++ b/arch/s390/mm/extmem.c
@@ -313,7 +313,8 @@ __segment_load (char *name, int do_nonshared, unsigned long *addr, unsigned long
 		goto out_free;
 	}
 
-	rc = vmem_add_mapping(seg->start_addr, seg->end - seg->start_addr + 1);
+	rc = vmem_add_mapping(seg->start_addr, seg->end - seg->start_addr + 1,
+			      PAGE_KERNEL);
 
 	if (rc)
 		goto out_free;
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index a124f19f7b3c..263ebb074cdd 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -276,7 +276,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	if (WARN_ON_ONCE(restrictions->altmap))
 		return -EINVAL;
 
-	rc = vmem_add_mapping(start, size);
+	rc = vmem_add_mapping(start, size, PAGE_KERNEL);
 	if (rc)
 		return rc;
 
diff --git a/arch/s390/mm/vmem.c b/arch/s390/mm/vmem.c
index b403fa14847d..8a5e95f184a2 100644
--- a/arch/s390/mm/vmem.c
+++ b/arch/s390/mm/vmem.c
@@ -66,7 +66,7 @@ pte_t __ref *vmem_pte_alloc(void)
 /*
  * Add a physical memory range to the 1:1 mapping.
  */
-static int vmem_add_mem(unsigned long start, unsigned long size)
+static int vmem_add_mem(unsigned long start, unsigned long size, pgprot_t prot)
 {
 	unsigned long pgt_prot, sgt_prot, r3_prot;
 	unsigned long pages4k, pages1m, pages2g;
@@ -79,7 +79,7 @@ static int vmem_add_mem(unsigned long start, unsigned long size)
 	pte_t *pt_dir;
 	int ret = -ENOMEM;
 
-	pgt_prot = pgprot_val(PAGE_KERNEL);
+	pgt_prot = pgprot_val(prot);
 	sgt_prot = pgprot_val(SEGMENT_KERNEL);
 	r3_prot = pgprot_val(REGION3_KERNEL);
 	if (!MACHINE_HAS_NX) {
@@ -362,7 +362,7 @@ int vmem_remove_mapping(unsigned long start, unsigned long size)
 	return ret;
 }
 
-int vmem_add_mapping(unsigned long start, unsigned long size)
+int vmem_add_mapping(unsigned long start, unsigned long size, pgprot_t prot)
 {
 	struct memory_segment *seg;
 	int ret;
@@ -379,7 +379,7 @@ int vmem_add_mapping(unsigned long start, unsigned long size)
 	if (ret)
 		goto out_free;
 
-	ret = vmem_add_mem(start, size);
+	ret = vmem_add_mem(start, size, prot);
 	if (ret)
 		goto out_remove;
 	goto out;
@@ -403,7 +403,7 @@ void __init vmem_map_init(void)
 	struct memblock_region *reg;
 
 	for_each_memblock(memory, reg)
-		vmem_add_mem(reg->base, reg->size);
+		vmem_add_mem(reg->base, reg->size, PAGE_KERNEL);
 	__set_memory((unsigned long)_stext,
 		     (unsigned long)(_etext - _stext) >> PAGE_SHIFT,
 		     SET_MEMORY_RO | SET_MEMORY_X);
-- 
2.20.1

