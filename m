Return-Path: <linuxppc-dev+bounces-4435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B219FAC3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtQL0dHSz2yvk;
	Mon, 23 Dec 2024 20:44:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947049;
	cv=none; b=JeGM1sdBHuilvbTV4xlzhBTH62ylxW7PhciLZRRPM08Diwv8ecHOEFc3cqDLCImAWCGJvG3PwlJJ8Js1c/TfdSbFKk88U+SdpiiEMuwCqmI8wrOot36nkPxwR4fjC74ZkSfWZmfDtjHrDuBT4LzSQG8u4oMJakATnap+TEE6AOrehgYCJvRNwCnBEcV/rn708cuU3n579GLqCSQIQz+pFpZKUMbjItFHcC/jD85XIjAcT18iDi4/3pDOdAeuFnysXLD80eCb3u8e4Z4JdEODZQUVVuUcCa3ZkhypmVDPz5H803TBpTNQMlVpAF+BzNqg/YDbMzVl6qrmrfOFd9PMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947049; c=relaxed/relaxed;
	bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDNRhaxVqz0nVF6SZ0w38LGZN5UDDNJTknx+/HdHNAip91b/ayVMmOF2wdeI9Et5k4l+nPGjSM+dcs2t4y/ydr/gHEe5t9t1EkJyrNyMC8pYdAQwTj+5GSX2iXdm3AO474Hh2+V7uLwZnnD+BO4fH2oeIVBIVzoc4xtwiPoJXmukuQ3xCKZisvmtoC0p6NyuYDL/TTdvhJzqAaUnFYrxTNb3gCZbL6Y8r9Fb228j5nT6a5ZXAaqMlTczEZISrKaQRQje0I8rMsYdVmXzflnUakhVLolaKv3bkRHjXqrsU8z6xXc3dMdxV4qtUy2Z6FZiElH63OHN0yh6/QiM+oP7qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=d7tyvLCG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=d7tyvLCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtQK0HJsz2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:44:09 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7242f559a9fso4801382b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947047; x=1735551847; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=d7tyvLCGJdqc07xjB3Gia18uarptwPq+TZYlpfzEx4iY5fdbpjzsSGjdCCqi6zMsxB
         st09/bR66nrWbOy/j78CRW6kjXMgvCzxLmgfiSagqIVyutGIPux/Z5qEQyNMOoF60NlL
         fsC3S+awhNt3rib22RU3kfWbgOxwzguQlG8Zd7x5GIovuhy92CCG8BpJVyq+WBy56MUH
         WEfbNiNeJ+C65rzFgNTs1pLsan3BJsQRgyS7xYzGgemzMSR5TZUUSDIM+9z3T4nfmL5p
         gC0Qm/Re/R20wczRkkJPcRTKpte2YOzjYRqCCFEHx+UCzpyOemSZ0C0/+p8m+OjNXsXx
         nprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947047; x=1735551847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=H8t9bWeyY1tPO4MBCfF0K0XPvM2FCAw3+YwSc1rZosz3Sm0EzplxPsbZ0+7X3ieaSy
         MU0Taab0qpaCiy/nGxuxAsxkCzkjzGpf40JuA0PGXRzv4h2g1RRcpyytiHF9KamBZBYF
         CAEjS+hjm/jW8ovROhub5j/cFQbY1itMaVTouYw/t2sX8l8OvJFzW41w9OJpIoBCkSj0
         iEipATsg2mWrMe3L1t0D4HG9+/Eida2ce2pgNBGKrwgL9Wx6oRQrSBa6FXexg/X0jZsj
         OGUG5TqniqwvPkDTOyOBZKYTY7q4uijBTbwZz0kO1gjohOf8DCElt3F4Wiye6CpaOwkI
         YDBA==
X-Forwarded-Encrypted: i=1; AJvYcCVbXiRCcVUNXVY0D82eRBDxRlfYTNIS5v50wxjAlCBENSLixUa5hQyZNUz84jtKQI10vCo15cdY6CndOJI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUAsxGPWj+87bpTkQw/NJEuXdcjlWWArIIlT/wvtfc6NqI7yWu
	ZHoJyKDozos/O/iNgDwKPqAMqI25eLWihmufzBCsPR9fQhSMhS5QBKILYv17CEM=
X-Gm-Gg: ASbGncu3J7oAxv8xmbzW4m5MBcURMi/YWgJUFJZ1knlC5FYgxajrZqW/OVv9OAwG23R
	StbIDuSi/fi/Z05WOVAIPl9PBZRBdKvWA8FWhMVQttnwcJuFO6QX/03eeNYnwUwBm/t+03+wQlI
	YGHdAvuWmKWpi+VIURVFD2qCAcJQ1RWJ2XmIODxhcRs6jp9jOXxc80JKF29E10aLkkNsQQmjfDb
	LHJQaFdNX/xEC9NYDNq5FkvxAOEfIcEUoZfUqHivUbM0pABX0h8Cg7KhqToXYfx/JwQPsbcv4xw
	x54G/iqxpV4fRlSiyqjCjQ==
X-Google-Smtp-Source: AGHT+IEE3DAo82DBKWUM6FD2Qxwd8GTGkBziQ/dfcNtaRbY+efEiB7FXaTM2aY8g2l19VVq60zkLag==
X-Received: by 2002:a05:6a20:7f82:b0:1e0:d575:8d4f with SMTP id adf61e73a8af0-1e5e081c5acmr19810935637.37.1734947046731;
        Mon, 23 Dec 2024 01:44:06 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:06 -0800 (PST)
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
Subject: [PATCH v3 05/17] arm64: pgtable: use mmu gather to free p4d level page table
Date: Mon, 23 Dec 2024 17:40:51 +0800
Message-Id: <7c12112047ac230809aacd0379259414b9b0d3a3.1734945104.git.zhengqi.arch@bytedance.com>
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

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/pgalloc.h |  1 -
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 2965f5a7e39e3..1b4509d3382c6 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 {
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed2..445282cde9afb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 4
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
+
+	if (!pgtable_l5_enabled())
+		return;
+
+	pagetable_p4d_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
+}
+#endif
+
 #endif
-- 
2.20.1


