Return-Path: <linuxppc-dev+bounces-4533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC609FE48B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:11:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9Mn6h47z30Nc;
	Mon, 30 Dec 2024 20:11:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549909;
	cv=none; b=K2ut5E7TIPJ2RKvvIIpaCbIKph9R/pKVA11+AzIv/rGJA7mW5oINfoxzrZLc/zMfWN3DvBVxYZt1FCkaAfeZFABtq7tLAMBR8Z6TdVNtiyDvbjqqsbSun0x7hVNUX+BEQawwJfQrw52Z4atpLjkIS20rDoiXttrib4EK7vyw2qdf3/+hO2dAYGLM6tiDDE2ef8tlaQxOVi/BHPhjuSukd12csyX0Wax9P8WqrCDic92iviujk0b9PLlWpgS8PgfnzIjY0mGkAXJUhA8fsqe7xUrBTLgRxUjGlveDT/XcO24zWTUDRM58H9Au9GWxlZhasT6k/S3RVyxf/eXzQXZlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549909; c=relaxed/relaxed;
	bh=Uxx1VFA8X6F1Vml9+szJuo78n9B3sJITH2LTRfnVDm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CHgQ5PmfzqtaZ3cJ+PzesMsjEGLV04lpBFWX0phZh0+fcQYw3pjfntp1npfsOqDF5SVE1V2r5uIr+GpCcdnAXXZ6sXdODei3n4Mla6vJHbNmej1zv8x36+lZd0KGug8+cAKUz7NzmLrqknPWcMPzn1GbPAGTTsCP/V8rJ6/drmG9wdk8NC+SXoAfZkuP7B141Y1MHmEQO9W1SSP20xTo5kxuZxrY8lSkrps7ZzmfpIBUSuAybzG+FNzfRd13DXUDnsK2eCuTszheYRcLAlhMvfkk7bjcvuZVd0HN46UDYp570yibcDcGYUlX1yZYHwz0TE6u0B+mWTt4S/yIsxpijg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YimxiTKt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YimxiTKt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9Mm6ktwz30NY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:11:48 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2163bd70069so13728055ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549907; x=1736154707; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uxx1VFA8X6F1Vml9+szJuo78n9B3sJITH2LTRfnVDm8=;
        b=YimxiTKt7vXIjI4UMsf0Ev9PozZJsFqG/wDKhDJ9dl5tUIlIitoY7ujWMUaBz3UANq
         JDAEeWj6jCw7SjAQFCEvNbOaeSYMNPxWM86TTqJaZD/KGYpwAz2IXe++xNLahxqZkQmS
         UfCKtI5Hia0C55wdcJL7SM11tVUllxyi0x0FbRENp6RgMH6izyyjsLwQ3Bs4Z8K25NF/
         ZfKCeIFQ1hZyTd+7mjDbsMnU9H7Q6Vl4vTzQS8GXqUTfz6mzZO+MbkdMEZsuJpu9KOjd
         PjYr4omvPT+XXqXiQubu57rLDASJab/c/mbbuPu7GJF+qlB3O4ZTXilo/m8/nI6ErhBH
         qjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549907; x=1736154707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uxx1VFA8X6F1Vml9+szJuo78n9B3sJITH2LTRfnVDm8=;
        b=v8mT2kCvrgH7twFtCf2pUY0VR2B5g0eoGucoafZU1g3Up4eycScDK5Uj8oUBbn+FOL
         nJxRyC8yFe0lcDB/Y/95vs+vc1Cnx/BMvDi7ZxTvROzPgkOFw7NXcFUO9fJi93xkgVEX
         4Z8R9qde2ASe1hQfEPrYzwScFYxPqTjfAK7v4VqRWw6Aeusl6ZOQBXaiO3fgNdUo7g3X
         ixXqAZBe/nwgUfrtX2e4jKDsclUJH15ebt5QzbE+MBXizRzcTnKstScVGVLc6uW6Jjtt
         8hwiJ3NkgaMDgq8GLYW1oiKUzASV5I1A/kflKmbflffTBQtk9q/sMqyMiamLxqCBZ1em
         fATw==
X-Forwarded-Encrypted: i=1; AJvYcCXNwv1hyOVysI3YNOQSQwORuQL/lZmOOXOHIkvzkOEb0JDQzn1kW4nowcn/CDWeGU8kEzqCVXdrkjamxNg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNqc/kDCY3Jo9O6DtL51xI87eglXKX/Atb/JagWthasz3bO7rt
	NSiIyvVyTeBQxH6czvXQvWnY3gT3iQ5wkHhsniVvlv9w/6KWT1zAdkVBsV6oB5U=
X-Gm-Gg: ASbGncvZME3rEHkHV1r3vWE7bk2LCDNCF9Ckmft4Sg5na4hRGS7Zdq7UYlT0TMehGbL
	2BNbRoOMhV4u1+cUzzpOksP01z4NZcLj2Tj135uOaWOO+nubJpqi6Ny3VP4eoawszINWqfDOKUt
	HqvOIPEG1+CZw8XokyXMaFtTPXDD0/P1FwmdNk33RN5RxOJQ5E/zrtSPCunH0ucHrMGd/8HgVxA
	Mp4cc7elA5aIsU8mfCoc5JMFjT34ZvsJsJIDrl5cRYg+oW+IcdhPnVqLEsi85LJvUPAGeh3w4du
	t9O5fYFAjYR9hvBs51yjpw==
X-Google-Smtp-Source: AGHT+IH6enLQBRxhPiyC+b4rbFoH6ZPXIb+9j2XLkfNoZdfNkkGtY/WgMqtF7HfldrPWQopcc9iyNw==
X-Received: by 2002:a05:6a20:4308:b0:1e0:c8d9:3382 with SMTP id adf61e73a8af0-1e5e0847084mr55644198637.45.1735549906952;
        Mon, 30 Dec 2024 01:11:46 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:46 -0800 (PST)
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
Subject: [PATCH v4 15/15] mm: pgtable: introduce generic pagetable_dtor_free()
Date: Mon, 30 Dec 2024 17:07:50 +0800
Message-Id: <cb5700c21d0eed9eb50bac385be1fb6cdef7e530.1735549103.git.zhengqi.arch@bytedance.com>
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

The pte_free(), pmd_free(), __pud_free() and __p4d_free() in
asm-generic/pgalloc.h and the generic __tlb_remove_table() are basically
the same, so let's introduce pagetable_dtor_free() to deduplicate them.

In addition, the pagetable_dtor_free() in s390 does the same thing, so
let's s390 also calls generic pagetable_dtor_free().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/s390/mm/pgalloc.c        |  6 ------
 include/asm-generic/pgalloc.h | 12 ++++--------
 include/asm-generic/tlb.h     |  3 +--
 include/linux/mm.h            |  6 ++++++
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 3e002dea6278f..a4e7619020931 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,12 +180,6 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_dtor_free(struct ptdesc *ptdesc)
-{
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 4afb346eae255..e3977ddca15e4 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -109,8 +109,7 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte_page);
 
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 
@@ -153,8 +152,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
 	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 #endif
 
@@ -202,8 +200,7 @@ static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -248,8 +245,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_P4D_FREE
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 69de47c7ef3c5..a96d4b440f3da 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -213,8 +213,7 @@ static inline void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cad11fa10c192..94078c488e904 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,6 +3001,12 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
+{
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
-- 
2.20.1


