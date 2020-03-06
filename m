Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 412BC17C741
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 21:47:32 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z06j6cT7zDrPr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 07:47:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=209.85.160.194; helo=mail-qt1-f194.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=sVQp0SNz; dkim-atps=neutral
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z04r2FQVzDqnf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 07:45:48 +1100 (AEDT)
Received: by mail-qt1-f194.google.com with SMTP id d22so2776436qtn.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 12:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VIytyDCq7f0kiHtZyAPYuhAfxkdQ6oPpVlPc91ezlzw=;
 b=sVQp0SNzavyEmQgQgPO7gOzbjdxNHOBGOKLb2+i6xH5nTB6ZP6ociRcsHZFKZahWzv
 lVQMhT0TucKZE0jr1svRTaAecWqS9Lak/5QCDTaDSkOc6vq9y74In5QZ3C0vju5Y/YSJ
 seKiYzybOes0y2OWOOVvb45ZEYoBXTTL7/NQZvUeV5Umj/iFPmYuELjQmpwwRG/RbM00
 WMRsRryr0bUnfhZtTUXyLUc60zizY1/bRX7olknPmplQ8VZG+HU7CqTLWPWwICtR5QAk
 sPbgocfLtbClg6uijm1uY7WawL446OXTMUcERTf+StMaVG507VDTlm1AAJaTPJabMPKz
 9fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VIytyDCq7f0kiHtZyAPYuhAfxkdQ6oPpVlPc91ezlzw=;
 b=RUQgtjKatpnOt4y+ISRu+X/F0XQiR/UUf4KVzccNmXJhC8qdc86IK4w+ACmPOzHLqZ
 IXwHkCBFhxlptgNMRawm246K92fdgiqDwXTRc3CwQ1V2dMhdA5QEYHNmw7i8wgyNllyn
 P/SbNxvmp/W7VOpV3WhXMXtVieLyHcbaZi654U+1G+ZG23vQiY29tKPkeWDC2pUZy/Om
 QvqagwNvIevy7ODajsWgDPY1/vBuf5JtXlPO0hQl2KwIZ7g96y/KGN1pcoBxKmrFaLnL
 SdjBqKfAWz5ITkfB6+2hMN6mzvHhKi+5NA4YrrXr8rVt0SeOgaUwWLCvmpRYCn10viE8
 uj6A==
X-Gm-Message-State: ANhLgQ3m6Q2FHR+YoKu3zyhkb7DgMdygySUv+bp0VofHqtVG4U2VVfhO
 uXNv/jdnk3jfrSLb2HTZYMsz6g==
X-Google-Smtp-Source: ADFU+vtc3atgWoG361itKB4xApBMGrMUExpxNIdab4Ow4UUWS5fC6T+QADXDozQS4OkwoR392p5sKA==
X-Received: by 2002:ac8:43c1:: with SMTP id w1mr4780630qtn.381.1583527484932; 
 Fri, 06 Mar 2020 12:44:44 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id g15sm14611541qtq.71.2020.03.06.12.44.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 12:44:44 -0800 (PST)
Message-ID: <1583527481.7365.165.camel@lca.pw>
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Fri, 06 Mar 2020 15:44:41 -0500
In-Reply-To: <1583452659-11801-1-git-send-email-anshuman.khandual@arm.com>
References: <1583452659-11801-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-06 at 05:27 +0530, Anshuman Khandual wrote:
> This adds tests which will validate architecture page table helpers and
> other accessors in their compliance with expected generic MM semantics.
> This will help various architectures in validating changes to existing
> page table helpers or addition of new ones.
> 
> This test covers basic page table entry transformations including but not
> limited to old, young, dirty, clean, write, write protect etc at various
> level along with populating intermediate entries with next page table page
> and validating them.
> 
> Test page table pages are allocated from system memory with required size
> and alignments. The mapped pfns at page table levels are derived from a
> real pfn representing a valid kernel text symbol. This test gets called
> inside kernel_init() right after async_synchronize_full().
> 
> This test gets built and run when CONFIG_DEBUG_VM_PGTABLE is selected. Any
> architecture, which is willing to subscribe this test will need to select
> ARCH_HAS_DEBUG_VM_PGTABLE. For now this is limited to arc, arm64, x86, s390
> and ppc32 platforms where the test is known to build and run successfully.
> Going forward, other architectures too can subscribe the test after fixing
> any build or runtime problems with their page table helpers. Meanwhile for
> better platform coverage, the test can also be enabled with CONFIG_EXPERT
> even without ARCH_HAS_DEBUG_VM_PGTABLE.
> 
> Folks interested in making sure that a given platform's page table helpers
> conform to expected generic MM semantics should enable the above config
> which will just trigger this test during boot. Any non conformity here will
> be reported as an warning which would need to be fixed. This test will help
> catch any changes to the agreed upon semantics expected from generic MM and
> enable platforms to accommodate it thereafter.

OK, I get this working on powerpc hash MMU as well, so this?

diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
index 64d0f9b15c49..c527d05c0459 100644
--- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
+++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
@@ -22,8 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: | TODO |
     |      parisc: | TODO |
-    |  powerpc/32: |  ok  |
-    |  powerpc/64: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: |  ok  |
     |          sh: | TODO |
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2e7eee523ba1..176930f40e07 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -116,7 +116,7 @@ config PPC
 	#
 	select ARCH_32BIT_OFF_T if PPC32
 	select ARCH_HAS_DEBUG_VIRTUAL
-	select ARCH_HAS_DEBUG_VM_PGTABLE if PPC32
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FORTIFY_SOURCE
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 96a91bda3a85..98990a515268 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -256,7 +256,8 @@ static void __init pte_clear_tests(struct mm_struct *mm,
pte_t *ptep,
 	pte_t pte = READ_ONCE(*ptep);
 
 	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
-	WRITE_ONCE(*ptep, pte);
+	set_pte_at(mm, vaddr, ptep, pte);
+	barrier();
 	pte_clear(mm, vaddr, ptep);
 	pte = READ_ONCE(*ptep);
 	WARN_ON(!pte_none(pte));
