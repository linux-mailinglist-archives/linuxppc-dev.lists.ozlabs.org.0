Return-Path: <linuxppc-dev+bounces-4819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC2A05408
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:03:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf5W3lccz30jV;
	Wed,  8 Jan 2025 18:03:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319807;
	cv=none; b=frnRY2oHuu2sp2Y/a1vaKCB20SLC6hu+vMOZzx3rVRz71fhFYF65ZWFglbyf6SZ3cv1kDkoduTveFNbni4MGDTl40ONuqeQhRePx0qMzLkNTfpjyhRr40+ocRMOhfzZkQXJoJxNsyVQRqiHD4L/P306wsHHcdsILC+0SI0zh5vvPsr9VGA4mNGRXAF5pVQH50P8xEfyBxlU0HKrcYz741Jgoz9y4VrmuHtTIg5sU6wYDfcq/uWRLdMQLtwSornMNbtYIof6H8cppKbrQ5QVE8TPpZ92iHzBu+fKjEfg/Ex5GnHHRjVGg5bxHmTb+Mrurs/9tsRFXCZKqaHG88PB9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319807; c=relaxed/relaxed;
	bh=x40aCfPUIT+7f+SOGlgpQ1mZ5+3GERu3xGzgSvQpPds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gJMqxK9PBa4uXWvUTzZd/NDeqkWWIqPbFf1QLwzbrNYqTSQLjOpyoT3jbrvN6wQJDdurseC40mxUPir6DoP5zAzoGbye7dhdP1wMwTLgKUWWk6PgZdCd49Gu4SyucborJR71cU9nuAWAK26MTfcRRAw1w/L+czmkGmBmAS2Kpu6OnIw65MgqHxYfDJmEH1ZsL14rTD2nobikkS9JyjCDrciNa0bj6eh3vNbTBBBawS1VQMLrJNa9auGQEoeRi6EaXUNTzyKwfOA4/oMI8O0iEh0eYNlHyn09D5kunsm5AmxZlUswccK1m640dLLNgay4LA0652IvoyW/D/sujl8Hrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hS/zXITY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hS/zXITY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf5V3MQ3z30h5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:03:26 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2156e078563so210961595ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319804; x=1736924604; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x40aCfPUIT+7f+SOGlgpQ1mZ5+3GERu3xGzgSvQpPds=;
        b=hS/zXITYJ0OBq8vnxuCUhAHE//LA8qdii+6csOp9vi3CzJehcD9Vdv/NSt429cmEaQ
         itxlaWMe0GL/Uyv4xQHVx4JepMg1SJOpX6OpLsfJAiwx9bVPgpmiiwMewy5JliQLEyDo
         rZIy/qrjRicdjkLcTH3lKPZraEwDCHVjUr9Z6b8qCj453Io/JDu5IuUWLSin813LKQG/
         n5yAQDo9oEVgUs5wIMA7l10JRoA/pvuD58giFSODYELazJMYrMU1DuNGzurR8UOgSD8c
         AcP9EtomylsE5j7i4JdQaaDptOoiHwvUZuhDMUXTBXMsIeK6FXUtxPxJCem8LoIvp2kg
         WLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319804; x=1736924604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x40aCfPUIT+7f+SOGlgpQ1mZ5+3GERu3xGzgSvQpPds=;
        b=WoW0tGnn5259DYRD+zo6dn7ENYtjAgs2TYbHjZOV4ABuge1L1SRTii9/5AUZAr3tl7
         syrW7wBhZ3sbj6wbUMb961Qb8bKuZE07n44Hg26/78BHOGUWroGQMqN9VPIg/9aTxxjz
         UZP7xsRoI8ZSZzYchOxXWgO4eQF8nXJm6rJZQkEbKUFLt2fJFXVZzRzqaxlwcpHpsocE
         E1CipgdI/QC/XlJ89ZJ1i6XDUVJJ2I9ezE1vLGPaQ3EQQqYFxGoGY7OP6NQrqK8vMgBO
         BusnyI/7yT/C9/TGEUNCWAiBYwKjajoLp4SaiWt5XDz7u2kgtsAfA/BiF6Ko3jo3UYyD
         Z+Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXh1diCpASIYchnQODbofSP8Sg8LYzQQ5ZidfIT9ou3A6dPyZ35sKrbRaeHjBXSv6hOEBlfupKGr/1SdwQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzWQp7IiFm0GE0iCKri7vUAaActrtZJzzQ7FKgOEqDBRmBwfSz8
	10eCXmIEhPkEnFsNoR8+goDAm5dnT8f4TbY/bWyLKM+1WuLOEo3xO/FZeqva3os=
X-Gm-Gg: ASbGncv/xh3/UeG+GdybsPlHxLRE/2QjWvH7aptw0uLlBq4TC9MlnBc6X17PuhAUHg7
	kBActPQV4C/snQZ8W4RhPy75pLGiKQWvY12uXuVHOh/ghHK8kRaabv/9WxXrqXLriUG4GMYVwuL
	cdi8MGutFBfrALpn36IZIv4f/MQFANuAE005B7ZKO/B+N3v32NT97y8YLqN6zcvKQHUu6W70PWh
	Rg9nb6eDyxcUrcb5ZeXErEIPDwzjkBRL5XS6Sx3VuNnx5Gzk3/8CbAJKtHCyc7vqq039TLiwiuG
	JayHnXt4Sozhr5KNof7LVyaMYgw=
X-Google-Smtp-Source: AGHT+IH8IKObAIjKqBGW3XQDBdiOawtDgYf1Tuj1urKOF9Kp4Be/TSELj5l2Ma8a+iBaK6i0ld/PMQ==
X-Received: by 2002:a17:902:da8e:b0:216:410d:4c67 with SMTP id d9443c01a7336-21a83fb1395mr28350885ad.41.1736319804422;
        Tue, 07 Jan 2025 23:03:24 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:03:23 -0800 (PST)
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
Subject: [PATCH v5 16/17] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Wed,  8 Jan 2025 14:57:32 +0800
Message-Id: <aab8a449bc67167943fd2cb5aab0a3a23b7b1cd7.1736317725.git.zhengqi.arch@bytedance.com>
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

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
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


