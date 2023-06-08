Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C517288B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcZFl1Z2qz3fvQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=24t2BtFN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=24t2BtFN;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcZ9m2LyVz3fkB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:32:44 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-bad010e1e50so1069337276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252761; x=1688844761;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5V1nU3Kqzs/xawWKyc6+rxjcg3uMlDunTMtenGe5HoU=;
        b=24t2BtFN5HXeEnWp4wmjqaz3ba7RZTv3BWN8E2lDsHPicXiEJRz9TlH2WLVzGd8CdE
         of2yNqyqdnSUhfcGIlOsfvovWhpuG53taZz/x9DR/Th5PIOmYH7IKtDML+zGnAiDR7yW
         CrmldFZSb2omivw75gysl+pOyy7IV7uE8SzN+doaYOlbMw3OdLZlcS0TMi0ZgvmIeRDQ
         MJq/tuPeT8xPnNmBXjEKmMP3qPQGwnStEjRQklqNa0dtkxFHtF5PvuvrSEAvR9DPSdcW
         McnyT5sGz87Djsd0XbZMK04rqnZG7iDmeQmmJXSZxSQJU2i6hoMEpfITW8x1lOY4n4VU
         tBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252761; x=1688844761;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V1nU3Kqzs/xawWKyc6+rxjcg3uMlDunTMtenGe5HoU=;
        b=dq9iTgwYnxQXEIbSvG5b7p7zq/De5fjkjWtntS/Zy/Ce/4V7NAEq9mgblqgTcid2Vh
         R9Dh/wIyPl5cLQ/VaGgd3xwAeewPEmuoPKWKRA43qpfmFpOPH9nDAuOu1t1+58kfADn4
         T0eFM6adCl/uA5kMOviORzAGKtJk+8fba3kOvPQ32WgUTnCZdbkiVUsY2vfxJho0dPXF
         c4atMArsCGumQ3NFdmioxCoofdcn0J9QPZAmIUMzqD8IvKfNojeMI6qRvwb9WlaEXrcd
         1XKIt8L06rRCNKoVgaBTfCb1HuOyWXWHOebNT1tnyaoG2/BWct41Cc6Sg2BL8tGrYvS8
         d7Xg==
X-Gm-Message-State: AC+VfDxhdE8nCl/ztSW6vZAsp+t4xAwPfnPZnGke1IFrDcNrG2ifXkAr
	XvOmW8YedAfU2ScbjMQwy6vzlg==
X-Google-Smtp-Source: ACHHUZ6ZLPO3tFN/Ri9lGF19A4q4QfMsE5CXjcYyyqXlwc0QGFL9qBHigDBgxXippDMgVek84lg5YA==
X-Received: by 2002:a25:f40b:0:b0:ba8:54c4:3136 with SMTP id q11-20020a25f40b000000b00ba854c43136mr602795ybd.52.1686252760634;
        Thu, 08 Jun 2023 12:32:40 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id k7-20020a258c07000000b00bb0ae4221b8sm428913ybl.43.2023.06.08.12.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:32:40 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:32:36 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 19/23] sparc: allow pte_offset_map() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <22165adb-581c-9ce1-8aa6-a3385cd39055@google.com>
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

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/sparc/kernel/signal32.c | 2 ++
 arch/sparc/mm/fault_64.c     | 3 +++
 arch/sparc/mm/tlb.c          | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/arch/sparc/kernel/signal32.c b/arch/sparc/kernel/signal32.c
index dad38960d1a8..ca450c7bc53f 100644
--- a/arch/sparc/kernel/signal32.c
+++ b/arch/sparc/kernel/signal32.c
@@ -328,6 +328,8 @@ static void flush_signal_insns(unsigned long address)
 		goto out_irqs_on;
 
 	ptep = pte_offset_map(pmdp, address);
+	if (!ptep)
+		goto out_irqs_on;
 	pte = *ptep;
 	if (!pte_present(pte))
 		goto out_unmap;
diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index d91305de694c..d8a407fbe350 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -99,6 +99,7 @@ static unsigned int get_user_insn(unsigned long tpc)
 	local_irq_disable();
 
 	pmdp = pmd_offset(pudp, tpc);
+again:
 	if (pmd_none(*pmdp) || unlikely(pmd_bad(*pmdp)))
 		goto out_irq_enable;
 
@@ -115,6 +116,8 @@ static unsigned int get_user_insn(unsigned long tpc)
 #endif
 	{
 		ptep = pte_offset_map(pmdp, tpc);
+		if (!ptep)
+			goto again;
 		pte = *ptep;
 		if (pte_present(pte)) {
 			pa  = (pte_pfn(pte) << PAGE_SHIFT);
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 9a725547578e..7ecf8556947a 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -149,6 +149,8 @@ static void tlb_batch_pmd_scan(struct mm_struct *mm, unsigned long vaddr,
 	pte_t *pte;
 
 	pte = pte_offset_map(&pmd, vaddr);
+	if (!pte)
+		return;
 	end = vaddr + HPAGE_SIZE;
 	while (vaddr < end) {
 		if (pte_val(*pte) & _PAGE_VALID) {
-- 
2.35.3

