Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F272924B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 10:09:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QctzT5Nxgz3dvx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 18:09:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RfeoHUBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RfeoHUBL;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QctyZ3XhDz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 18:09:09 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-56974f42224so13683777b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 01:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686298146; x=1688890146;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+JG9ScbeIgWCoIoD1lrBSynxF7pZ7ZmtCOtSuAlDGQ=;
        b=RfeoHUBLwqk9vTTBDLCpOuzNXpllWDEkPYc6yjXtxGCPNmX/rvie991AU10lJs4XbF
         9RzbOtcSEpi5Rh8KstlxITQN3Ffo4ROyfYENBHFqs9HkcG3CFgO7j5lBQrxeeGMGBjp2
         NZdxOQon49qNf9HZ1Qgrz3xC18+gnVg36Hvk5SsHYUm7h4j5tszvUdFL2KV4ehwHCBOk
         gyj3AdqSIMMtQdGmRCxc7HYtfEU+n7ezPeWYkyEIY3KjdS94V8qvWswp+jF2hFiGMFim
         NoPZGExtzKBOx7SOm5zC/zUvIhzRSqstVSVI3uYZkXeW9ex9SLXGk6aLeA5PY5ojGjGB
         epOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298146; x=1688890146;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+JG9ScbeIgWCoIoD1lrBSynxF7pZ7ZmtCOtSuAlDGQ=;
        b=ZLd4UNalrbjjVdgUpoqPkNH03PfjKE5kWDDlVWj4tczbUnNQcHn+Mp8u8CijGu84ft
         8ERQugH58ULrAOXxxWfxIFD25B4FUCQvd7AFJGWkThMEtErkUmftVvQ3gRwRu0f5Vyqf
         wZcHCbxKdpcL1wxuHRG56UJFKolOq08KED2HS1XhQE39racUlGexQ6rFSGnlWwmg7Rsm
         SRwvnLhkIUPuih99tPH4QfXv7AyP2veykrkyO1DDporP7uOhQMMoQh0ZJu3P9yU104Nc
         7uuX7bbx3CH6OsLVwjFBbsz3R6C0DI9h5w4P1UX5PO6ejQAWzzXZjklk4dQmB7p0H9/y
         TkZQ==
X-Gm-Message-State: AC+VfDxWsXGFAkw10pAQBp1f4Nu3f9jF3Dze4VrLnf6xmrTXOIVFm7FR
	9oEfP14YinyOp6pG1CbUJAf+fA==
X-Google-Smtp-Source: ACHHUZ5DQYcZ9JTl8EUp4l7QLImYygbjncdx8ql55YYe3IsFqc7F1XNEab87Po2zAxMo3TGE3P0BfA==
X-Received: by 2002:a0d:e684:0:b0:565:e87f:a78f with SMTP id p126-20020a0de684000000b00565e87fa78fmr500342ywe.25.1686298145738;
        Fri, 09 Jun 2023 01:09:05 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n19-20020a819c53000000b005688f7596ccsm453200ywa.78.2023.06.09.01.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:09:04 -0700 (PDT)
Date: Fri, 9 Jun 2023 01:08:52 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 07/23 fix] mips: update_mmu_cache() can replace __update_tlb():
 fix
In-Reply-To: <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
Message-ID: <6852be98-64e6-6092-d1c-13124b97bc75@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com> <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
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

I expect this to fix the
arch/mips/mm/tlb-r4k.c:300:16: warning: variable 'pmdp' set but not used
reported by the kernel test robot; but I am uncomfortable rearranging
lines in this tlb_probe_hazard() area, and would be glad for review and
testing by someone familiar with mips - thanks in advance!

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306091304.cNVIspK0-lkp@intel.com/
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/mips/mm/tlb-r4k.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index c96725d17cab..80fc90d8d2f1 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -293,11 +293,13 @@ void local_flush_tlb_one(unsigned long page)
 void update_mmu_cache(struct vm_area_struct *vma,
 		      unsigned long address, pte_t *ptep)
 {
-	unsigned long flags;
+#ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	pgd_t *pgdp;
 	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
+#endif
+	unsigned long flags;
 	int idx, pid;
 
 	/*
@@ -316,15 +318,15 @@ void update_mmu_cache(struct vm_area_struct *vma,
 		pid = read_c0_entryhi() & cpu_asid_mask(&current_cpu_data);
 		write_c0_entryhi(address | pid);
 	}
-	pgdp = pgd_offset(vma->vm_mm, address);
 	mtc0_tlbw_hazard();
 	tlb_probe();
 	tlb_probe_hazard();
+	idx = read_c0_index();
+#ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
+	pgdp = pgd_offset(vma->vm_mm, address);
 	p4dp = p4d_offset(pgdp, address);
 	pudp = pud_offset(p4dp, address);
 	pmdp = pmd_offset(pudp, address);
-	idx = read_c0_index();
-#ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	/* this could be a huge page  */
 	if (ptep == (pte_t *)pmdp) {
 		unsigned long lo;
-- 
2.35.3

