Return-Path: <linuxppc-dev+bounces-4434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC419FAC34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:43:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtQ52RjGz2yvj;
	Mon, 23 Dec 2024 20:43:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947037;
	cv=none; b=irlVe2Q02dqX+6vH79rZ36TT/xMCzTn4vhGVy/JZc9GsDmn0wlPZkxFRnEcvTj5c+inPTwJG47Stu0Ini7NWV3/8cqPIniRCeW976Oll8Lf9e1gRaeR8d04It6GUoMurakbcgXAQxP9WUCFmzpXWJFScK7X6ZmAdPR8n2snk/q1bAoZHeHwm4IrwpKaFzbtsTsd4bvgWyAzTUciz2e6OpeTUU9LkTlqItRngpWtInm4umn16mNEv+JlqrC3MaCEQ+Nq9XYBJUw7u2BefVA+h4w2ZfciolBMqi4VPlx2DF1U0a5OgUlgaXYmQJSQiiV5HaDcxohZ6nTqbuA65vBldsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947037; c=relaxed/relaxed;
	bh=t6vBY23hDAeU19z0pXyQ9vuAeZavJyfGUN8npoqwlxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gHcaGu84INlS9FLsx3tCDqhGxk0WTb9O9XetKfZac8f6e/dmZaPWrwQl4AlN/XtsJCdxtVKW6DG5R1S5SO+LhtRx+2S3ZGl3Mk87HiMwFx1n2mRVqP+QKkIE4LP2m9kOz1iuv5BIy5Kv5y1ENmnm5zQICCpmLKM7PZwrAHHxdFLPD7ZlMIi3Lz+qoDdaQaREVTp7gKQvySyM0gJ4EEAAGi0PVsaDE4HfB7QCMRTAZrloCfYkT5vGeu12V6H1ZUfUKZqLAMFzZ2bVqykhzRc/O48GgDtpFsqbo4KmKPE3Dmi6NMY0W6KYDCnD39MYw36KuarinlWdOG05KlvmjkyWCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gZ5vaGe3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gZ5vaGe3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtQ42xw8z2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:43:56 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7265c18d79bso4502347b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947034; x=1735551834; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6vBY23hDAeU19z0pXyQ9vuAeZavJyfGUN8npoqwlxU=;
        b=gZ5vaGe3guusUEOYCYnl416Fij2BJ+c//P0vDutLgNFY3jndzXp+kguSJQTTeC/hnU
         fseR//IhAdVIyUq7sKuLVg5MtAMZ4My7V+SnFjTv6Xa/d5Q9T8wb9smEJk+4Pj/uVSEn
         bag29KP+nf2lc6SHeOEg5Kcbw/puCasM1JXH6esKZOx8if7DXFaoEW+3yXE+Fb03OCG2
         eA20MER1oo/99ieBvw2p2CNSIA1Sr3tVE8mcloHiRE2HWlIqr0hWyh5lo5kSTVfeoxLe
         EIqexHBtZfFDEjl+X0XN2RIH+PGfD+Vcs8SUMnpVmcaz05ajZBQXu53RvIufB22Sm1Mm
         zmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947034; x=1735551834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6vBY23hDAeU19z0pXyQ9vuAeZavJyfGUN8npoqwlxU=;
        b=mYFVi2nilBtOvErsMh2JRsFDYcFeRuAvb3//2tmJI29IFApr6rP/PKjeW4HMTSDuZV
         JVurRlefLPaZiY8BD7MO0dlDB7g73b8D9SI3Nio3DuCLnYhX8lLdA8XFLcU+/Q6j2dzu
         dLFmfrR+VH5T+SGXqjvs3jsSVcGPFNkkbDL8IbDKICAIeow01SvWbiNcTSh4mnMyeJiP
         IQQwQ6qvbh0ya4zkH1GnLCe30J3og6aucMIPHY6cG6ONMCRnTz9ZFNfIS0E0EuQ7tJwU
         R1wUzVB7NgeVeMKWrCxXpOBmPXGYHpSdO+hmkISEoXe6A8S9Hp0G2wa5b5wmDbyDxgLq
         rX1A==
X-Forwarded-Encrypted: i=1; AJvYcCXxvJkMRBn7Ecs7FyIaZ7MO6IBC/zsRdprw4QnHBEM3AfcqxtMEpJ+R3eeuecSIRp2K5IjESXCKBnXRBHk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzF2GZwYpjOlrBK6UuGQm88m+OXW5oMrhcO3tFEdRYE3mPhqkNZ
	/rZaEsp+sX43+9NnPcdPO9TSOO6v6hSHa6b1a/0tiDt/2hQBpsBa2kaJUMidw+s=
X-Gm-Gg: ASbGncvyZ8eSVDUkO6QJT3R8lT+o+oLzZ0wtFb7B0EqmpDtiz+6YucUuiIHJPy6eJkx
	2k/RN92/F/Dog0+krDciXVaBG+Yjj19i7n1PbrGZPTWJMVmGEMHpGZ+XFr0SdE81G2gZyTwG+lS
	rLuU1OClrdV4HcKxkj0yCX07kHSofQ7hGUbtWcGW4aTgTC9HO4+ocx65Mauta4W8pMQbQZ46GSb
	ZwDOBMR5+JMuBEnBmxP/HrCbxASdY3A5a1dQRl/XyryZWKfIiAhnDL83Dy9bPnJkSR4T4mRgxhA
	zsPZxApAxQq4k+WXaNoPow==
X-Google-Smtp-Source: AGHT+IGO0+mWINscMdGqF/L7XDe6Dv/dfGXrIYILRYMXJn04aY3ZCG1rf5V2YGuLlSic6wG5VWjqsA==
X-Received: by 2002:a05:6a00:4090:b0:72a:a7a4:b4cd with SMTP id d2e1a72fcca58-72abdeb85b1mr18289604b3a.21.1734947034102;
        Mon, 23 Dec 2024 01:43:54 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:53 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 04/17] mm: pgtable: add statistics for P4D level page table
Date: Mon, 23 Dec 2024 17:40:50 +0800
Message-Id: <2fa644e37ab917292f5c342e40fa805aa91afbbd.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
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

Like other levels of page tables, add statistics for P4D level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/riscv/include/asm/pgalloc.h |  6 +++++-
 arch/x86/mm/pgtable.c            |  3 +++
 include/asm-generic/pgalloc.h    |  2 ++
 include/linux/mm.h               | 16 ++++++++++++++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 551d614d3369c..3466fbe2e508d 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled) {
+		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+		pagetable_p4d_dtor(ptdesc);
 		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 69a357b15974a..3d6e84da45b24 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -94,6 +94,9 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+	pagetable_p4d_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
 	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
 }
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 59131629ac9cc..bb482eeca0c3e 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -230,6 +230,7 @@ static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long
 	if (!ptdesc)
 		return NULL;
 
+	pagetable_p4d_ctor(ptdesc);
 	return ptdesc_address(ptdesc);
 }
 #define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
@@ -247,6 +248,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
+	pagetable_p4d_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c49bc7b764535..5d82f42ddd5cc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3175,6 +3175,22 @@ static inline void pagetable_pud_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+}
+
+static inline void pagetable_p4d_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 extern void __init pagecache_init(void);
 extern void free_initmem(void);
 
-- 
2.20.1


