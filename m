Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C557754C7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 10:08:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wA899vmO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLN3K1bzMz3bst
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 18:08:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wA899vmO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLN2K25C9z2yVN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 18:07:19 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b974031aeaso100778361fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Aug 2023 01:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691568435; x=1692173235;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+NIjwwFDQKW7cnGd92fTyoQN2mHu5pGGy6SwJYxvEU=;
        b=wA899vmOt6e40iwvnorBqfLDYE08uOLR6PH4e5kaatohOekCUlhLvGrZE1o84ycknv
         1kaSi1GvGEPy1KKVk4av4CUBGKvaQ+Q+KFxE7/beDo87Dbewi7g0gqCKCClCRNsJUmC/
         sHaKhSBRTNVOj+EWnhA3ROP67Klp8gHxAfbDHnuLCNy8bUAA450yvCiRVpyvq0t2lLK6
         d/xxQFoT09NpZGjCqfI48xZX9QesWLdGZd7rdm+0QwqTFViWfQ1+h+mtSSWW9Ru09gqX
         alGWxzj3P15ermRNJhYgmhHUL8FhqKG4trPmoY0XQKs7maIlFHvYqR7LDkWycXWrhIJ/
         5+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568435; x=1692173235;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+NIjwwFDQKW7cnGd92fTyoQN2mHu5pGGy6SwJYxvEU=;
        b=lEYiyWovFx/JBkCMCXxuEVKRdgoO09euu2TtBEuBRdBjIyyMIPKEp/O9+hF1F2/iz2
         FdKArA87CgoV3wLckIb8Mq8JSZyHprKyEk1VE3y9UqpgOpkpqdfne32yv7/ZgyonZ3sL
         XszIaCW10X/tFU9Y1IhSpaIA3j3d03j7ffUEAhgtT5BEwhrb4jgQpP1tLN4VrONulaYC
         fY3ouNP9boaA0/0ALUfPS/vxxvEgFIjQqzMl918GlMNc4qhcV5Q6jsWDWwiE9SC6dJSi
         fj0Eszu0Wis0KljlBq+62uXkhYhud8lQvAZa2pR3YH9xqmV8x+/yQAWyqZS6hqBXFzy6
         KgUQ==
X-Gm-Message-State: AOJu0YzW/N2wjOd3RE9YpLnjg7TxDruep2wDUuTyEtEsv+R+47rBkguT
	LEpzwV5NEMTg8p6ZilFAVW4iwA==
X-Google-Smtp-Source: AGHT+IEFu4/11ozUGErDMUCugM0LP0KohOO+cT+uy9VvXZaFXuAyAWMhTBeYIjzaDKLc4dx2smTJKw==
X-Received: by 2002:a2e:98c9:0:b0:2b6:f21a:3dae with SMTP id s9-20020a2e98c9000000b002b6f21a3daemr1226601ljj.44.1691568435645;
        Wed, 09 Aug 2023 01:07:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id y16-20020a05651c021000b002b9415597d0sm2612450ljn.78.2023.08.09.01.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 01:07:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 09 Aug 2023 10:07:13 +0200
Subject: [PATCH] powerpc: Make virt_to_pfn() a static inline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org>
X-B4-Tracking: v=1; b=H4sIADBJ02QC/x3MPQqAMAxA4atIZgPVin9XEYdSo2axJS1VEe9uc
 fyG9x4IJEwBxuIBocSB3ZFRlQXY3RwbIS/ZUKtaq171mFgiRod+vwN6d5J4i61u7NoZu+jBQE6
 90MrXv53m9/0Auuia32YAAAA=
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

Move the virt_to_pfn() and related functions below the
declaration of __pa() so it compiles.

For symmetry do the same with pfn_to_kaddr().

As the file is included right into the linker file, we need
to surround the functions with ifndef __ASSEMBLY__ so we
don't cause compilation errors.

The conversion moreover exposes the fact that pmd_page_vaddr()
was returning an unsigned long rather than a const void * as
could be expected, so all the sites defining pmd_page_vaddr()
had to be augmented as well.

Finally the KVM code in book3s_64_mmu_hv.c was passing an
unsigned int to virt_to_phys() so fix that up with a cast so the
result compiles.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h |  2 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
 arch/powerpc/include/asm/page.h              | 30 ++++++++++++++++++----------
 arch/powerpc/include/asm/pgtable.h           |  4 ++--
 arch/powerpc/kvm/book3s_64_mmu_hv.c          |  2 +-
 5 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index fec56d965f00..d6201b5096b8 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -355,7 +355,7 @@ static inline int pte_young(pte_t pte)
 #define pmd_pfn(pmd)		(pmd_val(pmd) >> PAGE_SHIFT)
 #else
 #define pmd_page_vaddr(pmd)	\
-	((unsigned long)(pmd_val(pmd) & ~(PTE_TABLE_SIZE - 1)))
+	((const void *)(pmd_val(pmd) & ~(PTE_TABLE_SIZE - 1)))
 #define pmd_pfn(pmd)		(__pa(pmd_val(pmd)) >> PAGE_SHIFT)
 #endif
 
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 287e25864ffa..81c801880933 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -127,7 +127,7 @@ static inline pte_t pmd_pte(pmd_t pmd)
 #define	pmd_bad(pmd)		(!is_kernel_addr(pmd_val(pmd)) \
 				 || (pmd_val(pmd) & PMD_BAD_BITS))
 #define	pmd_present(pmd)	(!pmd_none(pmd))
-#define pmd_page_vaddr(pmd)	(pmd_val(pmd) & ~PMD_MASKED_BITS)
+#define pmd_page_vaddr(pmd)	((const void *)(pmd_val(pmd) & ~PMD_MASKED_BITS))
 extern struct page *pmd_page(pmd_t pmd);
 #define pmd_pfn(pmd)		(page_to_pfn(pmd_page(pmd)))
 
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index f2b6bf5687d0..9ee4b6d4a82a 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -9,6 +9,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <linux/kernel.h>
+#include <linux/bug.h>
 #else
 #include <asm/types.h>
 #endif
@@ -119,16 +120,6 @@ extern long long virt_phys_offset;
 #define ARCH_PFN_OFFSET		((unsigned long)(MEMORY_START >> PAGE_SHIFT))
 #endif
 
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
-#define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
-
-#define virt_addr_valid(vaddr)	({					\
-	unsigned long _addr = (unsigned long)vaddr;			\
-	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
-	pfn_valid(virt_to_pfn(_addr));					\
-})
-
 /*
  * On Book-E parts we need __va to parse the device tree and we can't
  * determine MEMORY_START until then.  However we can determine PHYSICAL_START
@@ -233,6 +224,25 @@ extern long long virt_phys_offset;
 #endif
 #endif
 
+#ifndef __ASSEMBLY__
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline const void *pfn_to_kaddr(unsigned long pfn)
+{
+	return (const void *)(((unsigned long)__va(pfn)) << PAGE_SHIFT);
+}
+#endif
+
+#define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
+#define virt_addr_valid(vaddr)	({					\
+	unsigned long _addr = (unsigned long)vaddr;			\
+	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
+	pfn_valid(virt_to_pfn((void *)_addr));				\
+})
+
 /*
  * Unfortunately the PLT is in the BSS in the PPC32 ELF ABI,
  * and needs to be executable.  This means the whole heap ends
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 6a88bfdaa69b..a9515d3d7831 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -60,9 +60,9 @@ static inline pgprot_t pte_pgprot(pte_t pte)
 }
 
 #ifndef pmd_page_vaddr
-static inline unsigned long pmd_page_vaddr(pmd_t pmd)
+static inline const void *pmd_page_vaddr(pmd_t pmd)
 {
-	return ((unsigned long)__va(pmd_val(pmd) & ~PMD_MASKED_BITS));
+	return (const void *)((unsigned long)__va(pmd_val(pmd) & ~PMD_MASKED_BITS));
 }
 #define pmd_page_vaddr pmd_page_vaddr
 #endif
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 7f765d5ad436..efd0ebf70a5e 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -182,7 +182,7 @@ void kvmppc_free_hpt(struct kvm_hpt_info *info)
 	vfree(info->rev);
 	info->rev = NULL;
 	if (info->cma)
-		kvm_free_hpt_cma(virt_to_page(info->virt),
+		kvm_free_hpt_cma(virt_to_page((void *)info->virt),
 				 1 << (info->order - PAGE_SHIFT));
 	else if (info->virt)
 		free_pages(info->virt, info->order - PAGE_SHIFT);

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230808-virt-to-phys-powerpc-634cf7acd39a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

