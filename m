Return-Path: <linuxppc-dev+bounces-4812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19A6A053CD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:01:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf3P4VSFz2yDx;
	Wed,  8 Jan 2025 18:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319697;
	cv=none; b=IrVhXVit3IBUISlvfIu8nt701eS5DzwZcsMfykvJ7PtrgSQIwvqgqGUetdStTf0PbcOoXmXaR7nogT7ZIWpMtkw3kyfFz2cqU6P4NHRbezmeokVfaiJagCmbSYB3da95a5c9vc+DwFl7YOxetSm1B7K38vLdn9hJn0F57wwhgm0TpxKaHF5ixrA6uIu1l0aTNDVDlxUlynlZglASZximDZIzERoEHITVTSvPqL75SdpVDqF+1l7YRE3cqVeZoquEvqDqjMCWwc+LCRR8ahyfyyli3dLp45UWRjCDnJlib9LvkuP1ygoJvOQLRuvNTiv6SjKWLw0pq7UuquNODjwIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319697; c=relaxed/relaxed;
	bh=HOmYFC5rDCHPndkDeYhMazAtFRSG5eQpr+EJP/iMn+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=orvD3M1LwBEDn0GUSCmp0grGEPc5hBb3udJdE28YYEi+K397q/zSABR+n5L7Dr7Ny4KdE57rLnSHYppiyi2LNpoTZV5Is1zGdEOjssoJ+Y6ajgGihVFSXWmsFt/4hcmzlPcc2QeWd1KBl06BMgpsImYmyLMJkUi2b+0SjSxuPwAk+MiSg908BAhazWUW/W8w7PG2Kbf/Nvrl2AAC1YcLfityXQjr0FatVC6f7kTzj70OeWqIgg6cfl9EDos3WwxvF6hJ+M8LG1RH/keuLlTU+ITt7w/2MOtWrV4lUO0QUwbtUeihEsC/50Lxtga40mlgEFjOnpzPK92PNTlyl58XDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LHZpIRlt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LHZpIRlt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf3N5Qctz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:01:36 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21a7ed0155cso22839165ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319695; x=1736924495; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOmYFC5rDCHPndkDeYhMazAtFRSG5eQpr+EJP/iMn+M=;
        b=LHZpIRltqXgAv1KL5036IVb//NaIyBw4aYcmT4iLBFV7QE6B5YpynYdbjxbsESqIxc
         I8CZhkOYWtYAU0NbMx5mUdFl9wYGPRyzvxYgz/2vR+3cxFrSbnBo0omk4B/eNj+I5ymO
         /iMD+rm6eMp4jO47erNXA+eJny+eEBlfXnRJu17D4N9Co14NBvbNvcH8MMSGUiKtVMVW
         2W7UJwORemXMNF1waFzwsCjXe+RbXydN1TsNf0FOXSQZxsi1jewYtBwjLNmKiAUEOL7f
         LEj9onuEDqcwT+Rxedt7lajMYumqHLUUQRXkrN7YkT4PKoB9uMVIgs7ljMUEkspkHcYV
         p+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319695; x=1736924495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOmYFC5rDCHPndkDeYhMazAtFRSG5eQpr+EJP/iMn+M=;
        b=HC0kmsAepznWj9kz2T8HWyoMlMu1Jh6mFlFMIT/MrVWaibFfnKZBuKUsxOkDBzZg/D
         JBzfJmEqrWZ7C2PJxDmWQTfuqfy6gOtZjf/esJx6caPeiO8XPAmQ8PiuQn5xyEt4NGCW
         pUGOOCPxd2qnbNoUaovgBdUoWSEcCObdIo0nDbaT/5Qdo1r8/M/fq4EVvxru9eJw78XJ
         9Ms/+bg67pWwyvG7nAuLK00NOmvhc0EcGNw92olPGNewBE7pDOKW7qGujrmAmvQHGCkq
         ahAPYGLkbdcW0nEepb7m5bFjo51prJHH0/Vft8UqopjzKEvzJClLQagAh9a5ikjqSNLT
         FnTw==
X-Forwarded-Encrypted: i=1; AJvYcCXXOW9F6+gkjmAgX5whPhjfCI9fy8YauWyWdmMDb4HOvfRefe5zuyE95Zmh5mAaK8ExHMN6J/5zU3xFzCI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy189+XgXYEB5mgnbSGthQRhIWVsum6Ty6pDc+VppLLUxemZlS+
	LV/GsAneCNi2nkb6gQx9PKDi/SJNYZLFbDwTVwHyZUlGVFA4/5J3o3QIQxuHrGk=
X-Gm-Gg: ASbGnctDWknDUokqlhhEx8WLTV4OSWe8Ca01U8MNcsjVckAVElVNDKgySeXfpdExl+B
	d09c2Uk1BmV49u9o3j8mStHONP3RSmvP/WFURc0Sp8sc7BHk+QhFxcDogXqcteYN7EHeN9moDHx
	T6cM3jV+NI/OdZx/cZ/TU913SM1xwPtTasCJoQaqsu05R3eEIz0HbtG+Z1qkydXo7V7I75wPsIp
	XNQUKwrPZ88Hr0HKufzfYNoeX7IPjaYQUA4rl/LstEVDrH2hwspaECl/IIe8htIIWBgMDiYN60G
	/A2PWXew1DC9sHQwz+VYDvj5ugA=
X-Google-Smtp-Source: AGHT+IG2O0LK8ylHfVSG3OwO7HgAN7h4l7Hu7AhiZODZJ2StNi5+XwyqKLd4EhZPQDdK0Gl46ps1VQ==
X-Received: by 2002:a17:902:d50d:b0:215:7421:27c with SMTP id d9443c01a7336-21a83f696a9mr29561025ad.29.1736319695027;
        Tue, 07 Jan 2025 23:01:35 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:34 -0800 (PST)
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
Subject: [PATCH v5 09/17] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:25 +0800
Message-Id: <cf4b847caf390f96a3e3d534dacb2c174e16c154.1736317725.git.zhengqi.arch@bytedance.com>
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

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/tlb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 408d0f36a8a8f..93591a80b5bfb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -9,11 +9,13 @@
 #define __ASM_TLB_H
 
 #include <linux/pagemap.h>
-#include <linux/swap.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #define tlb_flush tlb_flush
@@ -82,7 +84,6 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -92,7 +93,6 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -106,7 +106,6 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 	if (!pgtable_l4_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -120,7 +119,6 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 	if (!pgtable_l5_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
-- 
2.20.1


