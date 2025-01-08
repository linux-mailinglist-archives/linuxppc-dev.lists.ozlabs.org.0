Return-Path: <linuxppc-dev+bounces-4808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 997AAA053AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:00:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf2H2TVCz2yNR;
	Wed,  8 Jan 2025 18:00:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319639;
	cv=none; b=AYG0hNYfzA+d0dSXKAjqq+XyK5fjt3BucdYb3FZ94YiR9F74ychVFK5kiYBLmRlHMJ6pvZ/nf4oifDuJDPNtKKaHTgKXk0xZqxjInPkYRT9ZpOi34V+Swt9+PRs9QjrDH2Y0ppwFS1V9QOIHDwfH/fLaLmuflK8AzlBJ6HyqRsig/neMK+VZH5ru/m7MGVWAZZ8jiGh4P4qRXm2iyb10EdhXkSB+NmnQMFYgeAqRiZteOblObTiJ/Ft0Qb0J9s9v2f8tjcvYxBG4Ct1CafAHiFk3VXMLlcApxV4c8a9UfWSSG0mk1tTfg8E/+qfW/3kFcKLoB156lw/S0wge/vI9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319639; c=relaxed/relaxed;
	bh=s3ajwCEJzuBWHLhfIS3uOIg9mbtSga1CIaOnP3nLDr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I5DfTA5YB5A0gl+xDcipAIYABBRdLL6Pht/+jBwwZP7VPagtdlFXLBS9sJTiHxKnrpA6Q30zNCePhAS9G+a8ch/i7k5/IMSkzb50T9/M6FTJj6tqWFV1TpH3uYjLP1gcJnAN5VvyuRBy2KzawKRtNQlpmcKUgf3C2fzhDehdG90DVwiQqnFDOvv576LmhMKJdTo2cUl1TWdwVZ6urHWiTBqC6nAfOZ9giY7cGa4PXf9ouvWC8s2jF7h9aTbYCwzOUSnNjiOJPdcmvVUPJZb8kAyyk4Ud2n/VmQgPLQuEplOMbVIZ6vTYZvdWLZxPHB2aL7CV6GkbKecwd2Cex4Zb0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KP5/IQvs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KP5/IQvs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf2G20Yfz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:00:38 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2166022c5caso215981845ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319635; x=1736924435; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3ajwCEJzuBWHLhfIS3uOIg9mbtSga1CIaOnP3nLDr0=;
        b=KP5/IQvslcjSKULM+y1X7UGfhb3AhRJxj+p2rZuxsMvPQwXmP+GjL6A4bvxdbKya0r
         xwPCnjPUaRu02KDE+uL0eogWh0yTl8fyniY0mQw1IfUPPvZ/lXe2RpWLwND8N9LjB0hH
         NqT7DSVqOpX/3//DcVYUQAwQW6rokwDPPs8VFAywDRewxmv7fEQNG11YfhhkzOa1OPzP
         VsuT4bg7cR8fZiNrj4stSyzFu5otpTVNRAl5yRg/60LzRGSB8LSC0XfrGw+wm1fUjIi6
         AI9RWMnMqt8AbpjgdcBJyvRfBpt4Rvkb+OoGN/yuO6kkwSZlwe2BAoxJvkJSNH86J0eh
         17Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319635; x=1736924435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3ajwCEJzuBWHLhfIS3uOIg9mbtSga1CIaOnP3nLDr0=;
        b=sL7ueq0NStScRpXphDbO0zw/QZiCGngLIMpcav+1JyiTxUCDSxcBkR+74Y3AWRKSvH
         gYuhWc9j0jMzNTjX2HkQk3o34q5MuJZ3CJmQ5hIMdmz4W5/X9C4ko0BnlyeMhkUE8xZJ
         6HXQYrhYthwXs+7XMMaoR89hTbuxZdHc8M0TLiIyfWBemIuUn9Qmw9S82xmb7PpdzVKb
         Yf23m5gRDVTGwHbCEhy9Ry+cVBFOZCC2m5gr0Pdc5W556LYl0ZBfCWxAPNjs6Qj0zCS+
         k9INC2fHOTGIG9OKw/bvYZE8/YB485TYHfooOrgpAA69UthniYmUpN44dVMTMUVXuldV
         JjVw==
X-Forwarded-Encrypted: i=1; AJvYcCXfTz5wxEE/v5Bks1zqrsAZ0qoWlsYZjIlsilz8YR6muxhc+2q3Z6xzsnfNUA2FMWiQ1r/E2FYaRyOXAk8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXn+uI7S+3UfzLTt98UYiFBhiZNIsvvK8v3IwatmwldqDp/Abn
	ixwZ8rvLOohDf45djAJtCvAJLAC/qHjs1/ZpFmTGQuaeXlubpbSCafQV8LJVE1c=
X-Gm-Gg: ASbGncs2k3tWpSQmMX++3csIdYX8H//+XT3WuzH3/2OuDnovIgbYV1KJlGSb6mDkM1l
	S1bfByGVnmJBUzQH53bkmQ5fb69IrzJoGM6c2ygxHGEjWW/KXmM1OGUkGRiRAp4jomZmG7a3x0H
	y7VtYOhy1GUwffsDbZOO38tYszx1LkZX9lXvGrkJ9Sv+kusFgtKMsGSTiEjLSnqWxL2X0xct9YE
	Of7YIc+fQLh4PBR91jYqX6VNV554F0d7MXNvdpmiAlHY16Q28BOU9ULNKNrD7km3TNGllBJhZdC
	F3RGBsKx79bnuL3vzHs0kcFjYGQ=
X-Google-Smtp-Source: AGHT+IFQatZJEh1vMaYN2M2lTtxd4TB3DgwS5fDlIHVUeP0cQjVCzCSP2sGAFE7qJT7hKS5hKn1bKA==
X-Received: by 2002:a17:902:d4d2:b0:215:9642:4d6d with SMTP id d9443c01a7336-21a83f55157mr23731385ad.17.1736319635015;
        Tue, 07 Jan 2025 23:00:35 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:00:34 -0800 (PST)
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
Subject: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d level page table
Date: Wed,  8 Jan 2025 14:57:21 +0800
Message-Id: <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
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

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
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


