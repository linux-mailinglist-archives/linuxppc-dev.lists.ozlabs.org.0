Return-Path: <linuxppc-dev+bounces-4532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7709FE484
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:11:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9MY0Q6Kz30Gq;
	Mon, 30 Dec 2024 20:11:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549897;
	cv=none; b=mfK1l8S5g5U3zd+XwvFEa4K+FmCOeVz1uug4S9w6Y/kJnXdrZIkJzbEEiBkywFe0XITPmcvijYoCFOI8iBbXfERHz98VfC9cYohkxteB7Rilw87mTMnTYD3nxLnBDhrcez4JPI9DsQxZ4AcdSAHsBQmLlH3uvfAw0En8kZx6LzG9BwDYv6XboNnKLFiEe1dJ0Xoear9Gfofd6WwiZ1D1ThCnumdO+VAzUov0n7qQlvi4BTqbj8NrBVkXqseMtx1HvRXJI4Q9Sy3TmKccOCJxrPsgayz6fG37DOwx8n2LdBt6PPiLlSqBsjyaD5ggVj4MphcQ6xxNU5E/rQfE3uFtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549897; c=relaxed/relaxed;
	bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HaYMrISPg3Iv+89QMfcUUPfJzFjLIJjbn83zNnD8i2iXHDBNB1L4MhH7cBAf3gJTJx2f+PO2aq5BYM9ARmyFp2bleNtJs7VZra3X02/iv7RBJXt4FnxoUl1xHxwHcWzDyMIaymrvF3zBqS/4RPp5Mt0XtX8xbp4iIVDVxv61n7hD0VHO+CI2nyK5xvLaziK/lhnmx5pM7Tku6+UyEZJa8TqTd/zGXTtL2MfTeePvZMdNMYxF764UlKIiZ7o/K9gOdpfqlQpEp2LFqd3lO1wIljXNXVOfZCrpmpugFo2kniUdtZJmEm/25nocaBW0UzGMhOslhJJSJIMFvgUbLYUw2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ivGBtSsD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ivGBtSsD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9MX0Wksz30CL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:11:36 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21654fdd5daso108579785ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549894; x=1736154694; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=ivGBtSsD4UYjePV2WTux8gnsx87//InkE8ueNQKn2jYriMRosYcoT/g2t2F0P6cvvT
         SurbtH71qsWndG6Oc80rIaCCnChEG0rH7+tiftHAOGjbWcC8qwkWelYQjowQYzmROrSP
         NPPJLEVBVoDEJhLzfbLtjRzJmHdWoDSv/+7gdbmM2hLLY+HxkGSLK4eiedfVcNaf8ubG
         G86XMOZ2B9FE2ze+Qm7fNDRBza4kgswEvxNB5RyCSrlzBnHnSAnU8MiZ1JYf2aUOB8Mv
         aUwZJqP5V0j8rTCMqdgrpn0FULJ9tDUjrN0UsydvgVdUbDug9HjWaVCCVw+GIx9L4NFg
         nVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549894; x=1736154694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=SbUwlCc94defWiEOQK8DQKicy3RVzJZZXq7+Ubn2ENBS8jvvieafuU9O8rOyv1QQ66
         QpDe1O2WQ2ow9lVlthYuaNXynlv3AR2iJzAXnMOyb5sTtVv1+XeN0PYffs78c4HgW0Pv
         oRESg68x9ydXF2/NLjHmOUv+xMh8suqAFlx4hItO4w0ri3cUq+Czn7XuTDBIa5Pm3mvz
         IMv1zStVUIiIt5oUgcc6A+dKALreuKFtTrm48Nl1lBR3RX/c0Ndnfgn5lvVyCFATBpUv
         +Y0d4Wh5jdyRbzWL59qKxC/HQd5D6Q0dpIQyAmNtMyo9QcIchMLyT46C1E+uyfuYe7Bq
         FOBg==
X-Forwarded-Encrypted: i=1; AJvYcCXrEmYgezzxnxKtcagncpFc9yzN+soBMLVXjvgGXZpf688KqCsaepqLIZFaqIVNDpevylRQI75uQgu1rJU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3ChbQnvcBWmtrsppB3cSYK/em+hKB7+fY+ybQZ4sWXch4eos3
	vAEPRFB6tr6V7gT2Al1BcYxlom7eo0Y/YSW1BFiClDjBLTFlVgDEdVVxP6kYaLk=
X-Gm-Gg: ASbGncs0nrd5YiV5KDftkwUzcKh/TVpmdpTH6Yw8RyB1ridfJH0MYNcjk29d1FDxxHv
	DODfxRwSWYe2AA/XSUkpAeC1GFTJvFpEKz/6Hi0GkHmbsNbn/8VPAgnu5UAleUy+KIFhO7liUBT
	Oe6Q84LwfCWMd2jk9yO8I5TDCLmtgYyki41kHB+IrpzxYv+KNvUpzRRF0mmU1F098OYa4fZzbhv
	4QsMd6ivJ+T6GetZcpWH5POjFEc0orZcbpoO9Qu8S9Zvo4uqXxgPCWIJBeCnlx5OUBUb7QoomcS
	ItW4sIQLe2dR5nWozaPCsA==
X-Google-Smtp-Source: AGHT+IF2zawjY8HUYTCaMJHzWmoJ2TNFStaqczmOTvWfDCo9S9fZfm/YNlaFMm14SUWbTnX0T2oRFg==
X-Received: by 2002:a05:6a00:600c:b0:728:b601:86ee with SMTP id d2e1a72fcca58-72abde82a17mr50548930b3a.16.1735549894520;
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v4 14/15] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 30 Dec 2024 17:07:49 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
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

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1


