Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADDD7AACBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:35:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z1K+KQQq;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VHTdxsCv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQZ93HrKz3fWn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:35:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z1K+KQQq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VHTdxsCv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsPxL6mY2z3fhf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:06:46 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B20121F461;
	Fri, 22 Sep 2023 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1695370000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHF/W/f0dOZYIYwlPsxSzo9QHH8IkLe18p7CX6Kd8Ro=;
	b=Z1K+KQQqZwpNsdpTMawdeTax0BKqk5Xx87LaEK3Y70mcCtO9GhNT9n3ClqIdMOKGgxfxbE
	OX4TLP411fPLmwTqtD8ai9mD3Suabdggwgc82pIaNdbMX8jvzbJ9fL2BJxplYXcO65A1Fl
	IkpmCEXPxopBArIiixC/Cplgw52j3jU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695370000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHF/W/f0dOZYIYwlPsxSzo9QHH8IkLe18p7CX6Kd8Ro=;
	b=VHTdxsCvDmNrjLOI19AnRicmZPyUX+sTugt22wv8EaZrJ9XECRRxpL2j6YQMfZ2wVcj9lZ
	HP/xonpcuWUOgSAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7428A13597;
	Fri, 22 Sep 2023 08:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sDtsGxBLDWXuMQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 22 Sep 2023 08:06:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	arnd@arndb.de,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH v5 4/5] arch/powerpc: Remove file parameter from phys_mem_access_prot code
Date: Fri, 22 Sep 2023 10:04:58 +0200
Message-ID: <20230922080636.26762-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230922080636.26762-1-tzimmermann@suse.de>
References: <20230922080636.26762-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove 'file' parameter from struct machdep_calls.phys_mem_access_prot
and its implementation in pci_phys_mem_access_prot(). The file is not
used on PowerPC. By removing it, a later patch can simplify fbdev's
mmap code, which uses phys_mem_access_prot() on PowerPC.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/book3s/pgtable.h | 10 ++++++++--
 arch/powerpc/include/asm/machdep.h        |  3 +--
 arch/powerpc/include/asm/nohash/pgtable.h | 10 ++++++++--
 arch/powerpc/include/asm/pci.h            |  4 +---
 arch/powerpc/kernel/pci-common.c          |  3 +--
 arch/powerpc/mm/mem.c                     |  8 ++++----
 6 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index d18b748ea3ae0..84e36a5726417 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -20,9 +20,15 @@ extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 				 pte_t *ptep, pte_t entry, int dirty);
 
+extern pgprot_t __phys_mem_access_prot(unsigned long pfn, unsigned long size,
+				       pgprot_t vma_prot);
+
 struct file;
-extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-				     unsigned long size, pgprot_t vma_prot);
+static inline pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
+					    unsigned long size, pgprot_t vma_prot)
+{
+	return __phys_mem_access_prot(pfn, size, vma_prot);
+}
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
 void __update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 933465ed4c432..d31a5ec1550d4 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -106,8 +106,7 @@ struct machdep_calls {
 	int		(*pci_get_legacy_ide_irq)(struct pci_dev *dev, int channel);
 
 	/* Get access protection for /dev/mem */
-	pgprot_t	(*phys_mem_access_prot)(struct file *file,
-						unsigned long pfn,
+	pgprot_t	(*phys_mem_access_prot)(unsigned long pfn,
 						unsigned long size,
 						pgprot_t vma_prot);
 
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index a6caaaab6f922..90366b0b3ad9a 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -246,9 +246,15 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long addre
 
 #define pgprot_writecombine pgprot_noncached_wc
 
+extern pgprot_t __phys_mem_access_prot(unsigned long pfn, unsigned long size,
+				       pgprot_t vma_prot);
+
 struct file;
-extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-				     unsigned long size, pgprot_t vma_prot);
+static inline pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
+					    unsigned long size, pgprot_t vma_prot)
+{
+	return __phys_mem_access_prot(pfn, size, vma_prot);
+}
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
 #ifdef CONFIG_HUGETLB_PAGE
diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 289f1ec85bc54..34ed4d51c546b 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -104,9 +104,7 @@ extern void of_scan_pci_bridge(struct pci_dev *dev);
 extern void of_scan_bus(struct device_node *node, struct pci_bus *bus);
 extern void of_rescan_bus(struct device_node *node, struct pci_bus *bus);
 
-struct file;
-extern pgprot_t	pci_phys_mem_access_prot(struct file *file,
-					 unsigned long pfn,
+extern pgprot_t	pci_phys_mem_access_prot(unsigned long pfn,
 					 unsigned long size,
 					 pgprot_t prot);
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index e88d7c9feeec3..73f12a17e572e 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -521,8 +521,7 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma)
  * PCI device, it tries to find the PCI device first and calls the
  * above routine
  */
-pgprot_t pci_phys_mem_access_prot(struct file *file,
-				  unsigned long pfn,
+pgprot_t pci_phys_mem_access_prot(unsigned long pfn,
 				  unsigned long size,
 				  pgprot_t prot)
 {
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8b121df7b08f8..03aadf657d15a 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -34,18 +34,18 @@ unsigned long long memory_limit;
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
-pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
-			      unsigned long size, pgprot_t vma_prot)
+pgprot_t __phys_mem_access_prot(unsigned long pfn, unsigned long size,
+				pgprot_t vma_prot)
 {
 	if (ppc_md.phys_mem_access_prot)
-		return ppc_md.phys_mem_access_prot(file, pfn, size, vma_prot);
+		return ppc_md.phys_mem_access_prot(pfn, size, vma_prot);
 
 	if (!page_is_ram(pfn))
 		vma_prot = pgprot_noncached(vma_prot);
 
 	return vma_prot;
 }
-EXPORT_SYMBOL(phys_mem_access_prot);
+EXPORT_SYMBOL(__phys_mem_access_prot);
 
 #ifdef CONFIG_MEMORY_HOTPLUG
 static DEFINE_MUTEX(linear_mapping_mutex);
-- 
2.42.0

