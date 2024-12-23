Return-Path: <linuxppc-dev+bounces-4444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7339FAC6E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:46:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtSX1rcWz30Gq;
	Mon, 23 Dec 2024 20:46:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947164;
	cv=none; b=J1ak1gWxfaqvMXDy0nGk/J8ggZ/ltI+0DNFrrmkycjKLcPGjFYTxelBUzGQ6Qlgd+HiFqeOw9dwtLu1ib4N+3q+5cn5h5ofTxL95eMaMkLINeU4kxJ+OBEwlzNHbLYD7hU6Ya7IlK0i6DoTmO6ei17wDhY/qo7eIB7HniC0mln1oygEmNzesjOZKmL0AskO5t5cZw8JCfYTb0tycO7n/EIMcF3YVUvNAXX+kDhzOzbrcbdpMHJnsC0TKFuXqvEGtj98Vt/8QxNf90PY/4iWrroTD5r9BOnBOomotmeHb5ZTuE6VGjzUHEL68ixBbQueBFxA6iWAwu8qunuiI0w4LdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947164; c=relaxed/relaxed;
	bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ntb5sBzLzFirMGKZ1qbHvvD96cItYfykCcJNpEan3egoSHJKeJTHpTPh3iCpPK64wADL6TFmt5pK4ispFL09As0kzyf2bVkGRDQBt5Qo+bN7LWORa8O5O1n8KFVQoTtBOHBWnXZDknXamHj88N+L41Q4D9H6PbxgZeg8LY8n9c64kgGcJ5nx9P9yEPP81ROqNKHxNj1De4t1avt1/LskDeGx8zxIC78EOBLegaziabBceZzJx+m465zxoOVzSMARRKGQc9kEeO8xCUJH94rJiotSxMx2CD1x4YOb5/O6+qvJiVyZ+HNruEdySZJt6U2D4SdzMV/KltPfrlWy6siZrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RrH/Luqh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RrH/Luqh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtSW35Zcz30Gm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:46:03 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-725abf74334so3355333b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947162; x=1735551962; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=RrH/LuqhbBnakxE9F4eJp/tBAgyUJjkg0TRqMQMpekk0N4/OAL/uI8vnAhObHyEqi8
         h2qwr6PZQ4BhT0E0uuxEX/wSN0nKVGIjcHyPpTs7uF+1+rDfFwqusyZg3boAI+U8aHW9
         36nSMA+5QQGo3tBaBgYTw5+iqEGCgEkT50pt44fW9hgdhIrJ5Cg38iU7gzcYNEoKsX8i
         MuTJo+Q2QUaVFhJ4Hp8p8G46tj2UYQCiY8mDvv+72t177DhVYZ2Prye/r1pjQq+mGW5D
         AP8bMvEuNIp9jmsZUjvKiy0WZuAwTxSirE6lD3FtfnyVNioG9W6dRWXteKK91x1es6BJ
         QkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947162; x=1735551962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=oVyW9tQe5/LBAfLw4wtOG8UafcdWvi7M0Aks/RAMs9Qv3eixkX0MR4a3otAL4pgNlu
         xrwmqQvkq/GioU6P20IZ3GJOf6rIkM/e5l9T0cbcmqgKp3oN5VNSlchP7S8dtHbSgHO9
         zxELONfAjus7cmWlFRJQFfIbj7c+17uXEbMgKO9exbkIl6jcde9stVT0LMEUPj1ai1tg
         XurG9cB8oZstd5eTx2mURQL91CjfvYdbvwcxgklF9Khergl8k6QMCQ8eCyNCjOeRgKBh
         Cuu/5sYXzh+HxY55C0F12kGzhRik2v4OpQDVLWoJjazfJ6rBqy+XMcEbblaRR+4OxQik
         qUQg==
X-Forwarded-Encrypted: i=1; AJvYcCUkoNZ6OYcOk+gxVhRjNlRV5ewMY+10Ob2cePErf9ek9vy9krN128LwMwuIlF+KVtFGVOn6w1xS8lZegc4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzjrg7zZ4h/iYilKxEbVs5yeKTzCSX1+lqOCg8QLJ0Z6CH8e/rU
	Mi1GJE2OXeSD1voe6Y3saiYkTKzdJSeaUG3P0ggw/qZ/WoU8BIvjpAn1S7vLRxE=
X-Gm-Gg: ASbGncvVM770ppw81iarOMVJFEgygz8MuvYQsVqvKtwZfYzkI7EBoiFmJXtf3/V1kmn
	qp1Lsi3vB7F0vPqJaPFsU4n0Gl+tmLwe/11mbtwiOuH9Jp3uBPHXBQpCa4pcVAUkATctO42s/X/
	LVoWNbv4bpngk1wQJvJeriLuUYNlKCu7lhb/s9GfnKm1tyNwSPG5nEyXT+Wndyphk1LVvtpPfVm
	BvMWFYKl+E9LS5/k+H3uP1dwMvP0hAQnW6936CxJUTFt3Ne0NROO9IiX/nQfslXUpmYGRd9yohy
	2hZVQ/onGKvmAYUMv0PIzA==
X-Google-Smtp-Source: AGHT+IEiKQiNoCztX+vEmXJ78+SVJHcoRjQcReSYKDpgexw8hG6RQW+fGx0o5GN+OmUz8JwpFgmgkg==
X-Received: by 2002:a05:6a20:c88f:b0:1d5:10d6:92b9 with SMTP id adf61e73a8af0-1e5e07f88demr18787949637.30.1734947161832;
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
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
Subject: [PATCH v3 14/17] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 23 Dec 2024 17:41:00 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1734945104.git.zhengqi.arch@bytedance.com>
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


