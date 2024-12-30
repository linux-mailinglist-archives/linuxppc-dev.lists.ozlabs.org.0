Return-Path: <linuxppc-dev+bounces-4523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9C9FE440
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:09:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9KQ39mgz2ymb;
	Mon, 30 Dec 2024 20:09:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549786;
	cv=none; b=Q9+/MIBfJlnLCD/CgartsbUxjbNnX4rcgD9/sIRWpaSFKI6aYhIY1Sh3CmnL0pPGibz8jJ2Dqit7KFX0GqeOoAHPl+AIoxAvlRCjpwzrwJQD+OSxbp1A9jIENRDWhdnHTReK04W5DjSxvqO57MAPe+jOE9zvZspqtjHUez293Hgt4QGRUW/aUbVUm57a+tQ4V9lu1EqAr34WPjitw2D3UtMlyCZiWaRwo0ml7TFFoMT3XeGnpdq8CJlBPymseMS6pZfEb3059jp6FbeYmQwri/Q1IlwlURC6KaRNIrSoL35P1gLbHy2oaI5kH8SEEMzHYWsx6PiZ4UvLzl54KMf+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549786; c=relaxed/relaxed;
	bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aUZMryXBU+iEC5yCaNcFf15UtB1ZT6hm3KThDmjgH7e4vs+Vp0RhDsziDtSrN1V9dSucBZCnWnUZ366FwZgQ6JDr4aMBReJHYxiM00EYBVVr0hGZ3jeaOW0p9rc48dpIkl2zgo7l3E4WcdSOQnNVNzcQwtBjbxfxROjQAdffPBtMMDAJw2LuEus3rQ/Twn+Kyn8b4L+ZLW1IojMIMi/2NaS5o5EwympXRJRofG3dRXqjPj5QAUIPF/aaaKpYyH3USrwD2iUK9jB/vQlSgyIdn/2hdPinrbdgMHvY5K3e0INNfJZi5uoeEa1MVWX7SSZlg1zjUs09gLxdAaDeHQukPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=JEhg4dC1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=JEhg4dC1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9KP471Wz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:09:45 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2167141dfa1so112898385ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549783; x=1736154583; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=JEhg4dC1tCcPA3mcYPs9M4BJSO7ePeKRuqUPgaWb1a5+U+5OQ5EXq9FCaRsd7MgzsP
         flFqTOJja0+/ynQWyVAwoghZCBoVIlMMjisbjmeAE/dU03ZY3RtyX01K9TEGDUB5UL4s
         yngw+pvENms4itq58ecpNqpk9nZHt4/KZXoa+tbnFp/PdNcZQi8AsY+j6DWNp4JLTEg5
         ia/6zw6XwO7fFX157cX8d6DR8yUMLIxNVNdVknsPfN3hZjFVj5mUVRx/R8Tr/m+IYv+O
         x7TfNSLn+mKb3EBvR815XnPx4X5Xj3qXMIwsNbL2IxlkiSHkxTENx1UAOY/X/ettQlXs
         U7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549783; x=1736154583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=NXDYmhAh32f0x7yeg6CsFNTCv7lwbMpf7TaN0wLS87CRPV1AQQ+zqmeyJ1h/mbD1c0
         44kbZWGVZoqwC1vEp9qgEqtGZyHBPNBmb7oW8o7EndVmB582tOHpDbKIUc3vIJSjITAv
         r5QsC7xwTXBFkQqWYTYvZ1orjgs64UsjCnRjqzjG9k6DWgb/NDtSZm3i6FJH7mkLo+3Q
         Y6cWHiJ77fgMA4asc+OUxIwqASLSW68xwwPexXOKQ9kH3sDne/G3LG65tZYFQm8vLkMl
         O+LtOSODRhUMkzZ9PdW5cl2nydMTL21ovuOTPSd4g/tgufj6LuYTRSN27Akrr4hwV8Jp
         BI0g==
X-Forwarded-Encrypted: i=1; AJvYcCXm1Rjly14f7cnoWvxmCKa+g0u92KagYnt/Lymxpks8x7Nxq6BJUb7SWM9YoIFqnu6bu31sJrum3P0fMRY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxN5yC9qmfOfbcWQpz9ij0fPZ1Li8gc88lW2Rwv5ysVoXOOVZOi
	tVBzksp7w/3RKdC5VCarDMxqpdy4eGoycDbXIWFuUCb5cWa4cwSPDTtVMRaniq0=
X-Gm-Gg: ASbGncvb+Cm2se6E2rWUeTeJ5JH3tESdepAt6ksdDwUqtRvpcaUnODVOOeisUMn4ifA
	e9eBi37X67HelBppieAmHRrEk57nSmw2GCRJSuj+2ge3RLZYYl/iE6DupquCJzL9PLbrfZtaJt1
	kNYNXyjBeR+nHqv1LE1rfjrCcW0epceSrwwnRCovhA6PiOV8i/Ge8QSlOqsEuMMkbPKPSzqfy7S
	4m9U+TC2qStr6DAJiCDmsiaF6rzgaGyIvJvJOcSXfC2z7Rka4L26nhZAXLBG4E3pAtxHsdQVV7F
	sEq+GpntjpWN/bpmX0VJDA==
X-Google-Smtp-Source: AGHT+IFA+DEWtAOVikEXL1Ne96u+hKYy4bbBxlgPSiON1NV20vNo54NDlhKj2iEhoHPJgNNx6Etn8w==
X-Received: by 2002:a17:903:2a87:b0:216:3f6e:fabd with SMTP id d9443c01a7336-219da5cc2d0mr588821545ad.7.1735549782882;
        Mon, 30 Dec 2024 01:09:42 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:42 -0800 (PST)
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
Subject: [PATCH v4 05/15] arm64: pgtable: use mmu gather to free p4d level page table
Date: Mon, 30 Dec 2024 17:07:40 +0800
Message-Id: <7c12112047ac230809aacd0379259414b9b0d3a3.1735549103.git.zhengqi.arch@bytedance.com>
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


