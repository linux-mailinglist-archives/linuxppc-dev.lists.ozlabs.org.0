Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42472884C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:24:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcZ0C0y7lz3fdN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:24:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=bsqS2Hso;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=bsqS2Hso;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcYzM2CMgz3cM1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:23:43 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-565ba53f434so9067977b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252220; x=1688844220;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDN5tZO3L77JzaZm0GUojeVr1G6nDfqvfBbmKnfTG1k=;
        b=bsqS2HsoK/j3AkqW2YwOMMKXyawvBNLxJHVA5gOfV85QJu1lSu6OT/EudsU4V/Y2rp
         SVDrhg0mebSfRzfMSx1MBgwwDrAuWoy9LCmuC/2umX7ttwWByA3dcTWU9wXJ/cBuk8p1
         IBLsaSZQWTiGTy2fVfGTVTLpxXSu83YUCgCeShfLhLQEtHAObGCmd/2pMwHoVzhnbL+s
         R/RqL9aWefb7+V22j+wCoHy3L9k9iU7LsdUzazOEG+iBjRzVfoBnNonp+eUMgHPu99EP
         wikBPo2R7DnOhGnbBte9FiJ408IVODR7hjXz04IiqDN6B3KGc/TbdicQd+c7pqZBIdYk
         E3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252220; x=1688844220;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDN5tZO3L77JzaZm0GUojeVr1G6nDfqvfBbmKnfTG1k=;
        b=Pq3Tijy+q/EOqsqc+NeqFsmLmWeW+j4xrZASI1I8sDKCXKS393g1lby60DX3373Em6
         K7tVNnZ4/FA1QE3Rj+3HAAzhwPirRuP7e+BDXI7Ez26ot+glPusgSlUVcnf36v8qc5Yc
         V2U1c7Ri/v6plDJEbHM6ZwLvXklsXXQYPRjt+qwFM6dKmnxjz4l5dtzSc281KmQmzaAo
         gUZNqxujQTQHAu3/tTbqzW7ofRqVvaWx4MV3JE3ymeGjYPNyl/m/4LADbIMZ1j1StZUR
         zl0nuaWN0TOSUwFGQbjPuYY6dWqgImSFV6Oc5BunTPRf2nxNO2+2K4y8q1UnBF3BPTz8
         HXwQ==
X-Gm-Message-State: AC+VfDxOv8rSnGFTtyNRqFcTzZJP34cZipZxgLJaXUserAY6ULsIiaxa
	Ks5xkvnSoZhDVeGAR47GbPxQKg==
X-Google-Smtp-Source: ACHHUZ5B2AQmlb0Co/ti6j7UtSZsz6kvSjI4SOSm5MiJUvPHp7lW170oPhZmXl+FiXgmdx/jiLqYOA==
X-Received: by 2002:a0d:d843:0:b0:565:8c16:a0e1 with SMTP id a64-20020a0dd843000000b005658c16a0e1mr683325ywe.13.1686252219629;
        Thu, 08 Jun 2023 12:23:39 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j65-20020a0df944000000b00545a08184e0sm102947ywf.112.2023.06.08.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:23:39 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:23:35 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 12/23] powerpc: allow pte_offset_map[_lock]() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <54c8b578-ca9-a0f-bfd2-d72976f8d73a@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, C
 hris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.
Balance successful pte_offset_map() with pte_unmap() where omitted.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/mm/book3s64/hash_tlb.c     | 4 ++++
 arch/powerpc/mm/book3s64/subpage_prot.c | 2 ++
 arch/powerpc/xmon/xmon.c                | 5 ++++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index a64ea0a7ef96..21fcad97ae80 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -239,12 +239,16 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
 	local_irq_save(flags);
 	arch_enter_lazy_mmu_mode();
 	start_pte = pte_offset_map(pmd, addr);
+	if (!start_pte)
+		goto out;
 	for (pte = start_pte; pte < start_pte + PTRS_PER_PTE; pte++) {
 		unsigned long pteval = pte_val(*pte);
 		if (pteval & H_PAGE_HASHPTE)
 			hpte_need_flush(mm, addr, pte, pteval, 0);
 		addr += PAGE_SIZE;
 	}
+	pte_unmap(start_pte);
+out:
 	arch_leave_lazy_mmu_mode();
 	local_irq_restore(flags);
 }
diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index b75a9fb99599..0dc85556dec5 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -71,6 +71,8 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 	if (pmd_none(*pmd))
 		return;
 	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
+	if (!pte)
+		return;
 	arch_enter_lazy_mmu_mode();
 	for (; npages > 0; --npages) {
 		pte_update(mm, addr, pte, 0, 0, 0);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 70c4c59a1a8f..fae747cc57d2 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3376,12 +3376,15 @@ static void show_pte(unsigned long addr)
 	printf("pmdp @ 0x%px = 0x%016lx\n", pmdp, pmd_val(*pmdp));
 
 	ptep = pte_offset_map(pmdp, addr);
-	if (pte_none(*ptep)) {
+	if (!ptep || pte_none(*ptep)) {
+		if (ptep)
+			pte_unmap(ptep);
 		printf("no valid PTE\n");
 		return;
 	}
 
 	format_pte(ptep, pte_val(*ptep));
+	pte_unmap(ptep);
 
 	sync();
 	__delay(200);
-- 
2.35.3

