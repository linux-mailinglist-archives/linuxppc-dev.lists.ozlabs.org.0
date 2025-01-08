Return-Path: <linuxppc-dev+bounces-4815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB358A053DA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf4J4M5gz30Wj;
	Wed,  8 Jan 2025 18:02:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319744;
	cv=none; b=VcYav77W5TeTaTHRzqkmagPIPDFrCSj3fSG9dj/h73jIxQIEzVJl1ii7We+zCEGv0OEQusC9A3KS7xzkt3DaWtuQz4OxDK6VgloyPRWY4ehtJDcyUCGjJP61YMH/d676uPOk0yJePDnP9eV0KvRE4QHqdNFXWJoplroYIG1qANJ+VOdSOYKNUF1tDVFoD6Psdwar8UUVhZ6JD6zeU2tN0NUm4FTJBJA36JinseBrF/hrEDywmfHdTzOedEELO4MiXwXKT9qk/uR3kV9JEU38Mn9JntQN8EnBJDSZZWH+zJuQd8f2d5dp7d5uaiTk+WhnuovbLfI6dHV5nM65kmJYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319744; c=relaxed/relaxed;
	bh=DRkfj+TNyCYVuLoiDWLKznOk7pFXzbzTll42IhJYX5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m6MDaIH36MQ0eeESGV1zyJ12vy3HQ7aT/MP+0BvnMqqg0WBGraqY/Fi2z/A9PhiPqkgsR1apPg2SYAdWKbsObeQJxMiuJE2rnM2F3QthIxXUImhXKdE9QkAbKRB6ykAyhcWoMDe18QAoKeN4jlB/Sp3Q7Yce+l89OFCB30uUbyCLcXmsew85tcfn2hCXj+HVKDza9DxKjxa11u2rQ5X/NOc8rFYKzpq1hGTZS37SBmjUKpu5FbJVd9Ae9frZaunNbWNrX6EVXFlo5hPZqmfG6nqOjYYG0WlmpOKI6ZTVrYDWM1t4pNruaHD3Qkc6+FOQwvZZr1DCcc+JSSwD2z4KTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Xuf5jOCM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Xuf5jOCM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf4H4ZcKz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:02:23 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so841093a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319742; x=1736924542; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRkfj+TNyCYVuLoiDWLKznOk7pFXzbzTll42IhJYX5s=;
        b=Xuf5jOCMegpMgUQ81Fg16/Ocnmg67MVtIcwbRGZ8mSdFptfZFuGDq65SHxlqRdpjim
         zytQxaq5SsgDmTdLr1Z6Pa4MccCKONxQQFM5v9+uLGoWvKxS2DixAocdBGH5J7QQnhbH
         qLxXsf/rF7pG9nnhE75IGxjhuAzlmM/XMnDTBwluQn7gm01bF70G1mwYRFmJjQHx20GS
         U58k3VmwyOsdXtqz2+z1t2krbGs6GYv8JpWouamjbMBillcFdv1us5WhTe89oTfiTKhI
         XUPZyY0W1ly2n2itL6fXD2zb+e6lVcFaaNPjp7SmyfwVfUS5HFroqNQth6LsVUcCOYJb
         BDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319742; x=1736924542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRkfj+TNyCYVuLoiDWLKznOk7pFXzbzTll42IhJYX5s=;
        b=SOK5FqtbvQ63WyPcG2H4h90ybHuZ/2pAgVdMyq31b+nZ5j3Y7CE0TtFk2/XiZGtpVW
         FBt6uLYnin/eRMlYuVl62s2UTa6Q148uLjv9fWXpQL7jfIhzNW1NCOzGhciYWMAbKwo/
         +6Hg+CYGRnBgV34jWcOE8HWWrB5ic0IpitCOz4QdShZTRtqnA13s6znT3V3ymGl37UsX
         Yqa1j0rar3tj7Js+Sv9Z/v3+IN5Zxr6inc55/SvCMMALI2ZO0anOFLTIxvE6zZYX64ZY
         5Q0xHGxPgH5jcB6QCL+19DvuTjumSHT7Z+ksH8UU1UUB66xmCYIIWSy5Ln/l99iR5zhJ
         u0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUeQ1cEGY1w9sWPuNEKp8V6Z1GjIyB3FbyyBkrkePCvSVznsBDoQhOd1RmgcqJutDZQp7sjTXC55vemLXs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyB4TN4/aZGhjawEdCnmmyeAdLT7hr70o/f/fUHbQ0+1nbOjXzt
	F24hE5aZz8QGo8Xnrd626zECGYeReG09H5aDGSG7K3DBje8gOwt08uIQxUFuxoA=
X-Gm-Gg: ASbGncukv/x0fs5+mo0Bm5FD2QUH6Heo4mf+L2FA3LSsbNo8by5+5oeuykPTSsZvw0T
	xxEG4Q0h78bIh7c//MhhIESP+N0G9TD5w4+WUwRZcxFd4o2pBAl76IOpl1LrbglU5wQKZJdaD7O
	7yZCdqW3ID0ROW9pjQeq1gdDKhjiF7UPuyU5IldLY7qljDHj5ZrB6l82TZXzFt9tj5Bo+O/wD41
	MfYAl4P3l4VnYsgPKxIFGFbgPpfW3vH2kgzww0v4Ukacs79lRuw6F5jxW6iAZlxzBtnwbirG8ti
	/3858SxWsKASPuliFydrs0j2JDY=
X-Google-Smtp-Source: AGHT+IEyar1kSnzqQimnz8qjA8akoGYyLgYubsk1qekCNbk2Sp0If2dwICCDFtvO4jCrehuyEyMuwg==
X-Received: by 2002:a17:90a:dfc4:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-2f548602842mr3182102a91.8.1736319741885;
        Tue, 07 Jan 2025 23:02:21 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:02:21 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 12/17] x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:28 +0800
Message-Id: <27b3cdc8786bebd4f748380bf82f796482718504.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: x86@kernel.org
---
 arch/x86/include/asm/tlb.h |  1 +
 arch/x86/kernel/paravirt.c |  1 +
 arch/x86/mm/pgtable.c      | 16 ++++------------
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 680ec3d47915a..f64730be5ad67 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -33,6 +33,7 @@ static inline void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
+	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index dc1ab9301d2c6..1ccaa3397a670 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -64,6 +64,7 @@ static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
 	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
+	pagetable_dtor(ptdesc);
 	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #else
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index f9516024cbe5d..c02aa0427a6a5 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -25,6 +25,7 @@ void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
 	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
+	pagetable_dtor(ptdesc);
 	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #else
@@ -62,7 +63,6 @@ early_param("userpte", setup_userpte);
 
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
-	pagetable_dtor(page_ptdesc(pte));
 	paravirt_release_pte(page_to_pfn(pte));
 	paravirt_tlb_remove_table(tlb, page_ptdesc(pte));
 }
@@ -70,7 +70,6 @@ void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 #if CONFIG_PGTABLE_LEVELS > 2
 void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 	paravirt_release_pmd(__pa(pmd) >> PAGE_SHIFT);
 	/*
 	 * NOTE! For PAE, any changes to the top page-directory-pointer-table
@@ -79,28 +78,21 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #ifdef CONFIG_X86_PAE
 	tlb->need_flush_all = 1;
 #endif
-	pagetable_dtor(ptdesc);
-	paravirt_tlb_remove_table(tlb, ptdesc);
+	paravirt_tlb_remove_table(tlb, virt_to_ptdesc(pmd));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
 void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-	pagetable_dtor(ptdesc);
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, ptdesc);
+	paravirt_tlb_remove_table(tlb, virt_to_ptdesc(pud));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-	pagetable_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, ptdesc);
+	paravirt_tlb_remove_table(tlb, virt_to_ptdesc(p4d));
 }
 #endif	/* CONFIG_PGTABLE_LEVELS > 4 */
 #endif	/* CONFIG_PGTABLE_LEVELS > 3 */
-- 
2.20.1


