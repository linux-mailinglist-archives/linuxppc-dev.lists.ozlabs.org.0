Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 622FD1CBDA5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 07:11:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JwKJ0p1qzDr9M
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 15:11:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JwBH0PMLzDr2m
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 15:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=M/BQS2zJ; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49JwBG2pstz9sT0; Sat,  9 May 2020 15:05:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49JwBG0PNpz9sNH; Sat,  9 May 2020 15:05:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589000726; bh=lES1YpCuU/2Z1sFhawP/2rUzTXByNK+I43I/QSTzCeY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=M/BQS2zJJIxhXlTXJzKtVbnV3wWDmFcGmJG2mwFBFztlTup6jfUxDKHzMpnjDRRgI
 GnUe3ZEgtLYR9lbRPXMtja7ZZ9s1kzqagsDKwNEiGQNJAU8nXXQgOSlY484DDX3OXJ
 hkn+xvZgbHDGpKoWKL4NrrV7uup+xVkHlFa6GNHpB1yxuVlcig+5T9AqJZKqZGqYtA
 ESMwqVAgnax4uKFJ68G2VxbRjhZVCeo6CaZm6XvWpayKuMP1M/QTvcEPF4k5NJbWjz
 eeP0B3T/KSSRYpcyXJmzC87r050jkQT4ZmVWIxoArSCgl+wTCGUh5vJIfv3xCja06a
 5UX58pzf1HThQ==
Date: Sat, 9 May 2020 15:02:04 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@ozlabs.org>,
 Michael Neuling <mikey@neuling.org>, Anton Blanchard <anton@ozlabs.org>
Subject: [PATCH RFC 1/4] powerpc/radix: Fix compilation for radix with
 CONFIG_SMP=n
Message-ID: <20200509050204.GB1464954@thinks.paulus.ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes the compile errors we currently get with CONFIG_SMP=n and
CONFIG_PPC_RADIX_MMU=y.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h | 2 ++
 arch/powerpc/mm/book3s64/radix_tlb.c                | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index ca8db193ae38..adcc6114d170 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -68,6 +68,8 @@ extern void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmad
 #define radix__flush_all_mm(mm)		radix__local_flush_all_mm(mm)
 #define radix__flush_tlb_page(vma,addr)	radix__local_flush_tlb_page(vma,addr)
 #define radix__flush_tlb_page_psize(mm,addr,p) radix__local_flush_tlb_page_psize(mm,addr,p)
+#define exit_flush_lazy_tlbs(mm)	do { } while (0)
+#define __flush_all_mm(mm, fullmm)	radix__local_flush_all_mm(mm)
 #endif
 extern void radix__flush_tlb_pwc(struct mmu_gather *tlb, unsigned long addr);
 extern void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr);
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 03f43c924e00..e3ea026cf91e 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -776,8 +776,6 @@ void radix__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 }
 EXPORT_SYMBOL(radix__flush_tlb_page);
 
-#else /* CONFIG_SMP */
-#define radix__flush_all_mm radix__local_flush_all_mm
 #endif /* CONFIG_SMP */
 
 static void do_tlbiel_kernel(void *info)
-- 
2.25.3

