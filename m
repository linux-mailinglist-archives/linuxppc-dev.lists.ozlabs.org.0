Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 137462582F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 22:46:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgMgJ739hzDqSs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 06:46:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Okj7fpWG; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgMVd4ZCmzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 06:38:49 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id o16so495978pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 13:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WWik1+r7ug1ahh3ihIBeIV7cbQz02Md5UqkfuQNEKrg=;
 b=Okj7fpWGg9YFfyZ+dRvcEQiQ7iYaNcxPLqiq9ImnYm94y1t9sfUfXMWAjv4FUQwlhM
 fh8D+RSxU4t3clsLQsQCgEgfq+QF+9pjiwrVGlGKlvyxD3+cSWXGO+w0JiH/FI0PPAb1
 QeMTY5fHsFDxWqBlTtsGJFwbX9XsCW9p0AmGpDQ0oZhv9Yu74QWoV3vXLOpniaYS7gKe
 F7yYAjP8/4STfz32tCbou/bMWvPtSe0j+wPoFI2VjqOmN2Ihwv3Whu0F10nlaKbJ0/+9
 oGWK2xB8owNJZgtTI/cGbVR/o9XAewzP/dRMACRZJKQ3btWQGUUwCDv0CHPYkGN2iV9l
 Gjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WWik1+r7ug1ahh3ihIBeIV7cbQz02Md5UqkfuQNEKrg=;
 b=KXOkhoX0KOcomfjD6s8cIXuuXhXHIKeCsAOWUDwMPpE+1Wt3QbrWhmxI8/xIsOCvbW
 mhhpbIUHPn3lqIbb/i+akrHYoS+SCdU6R6VzIHV2oyFl0xoE4IHWxEmSomKgb/vJ6vmQ
 7/NPh1Rp1pEtBeGK81RRilY39xBgZ+kNolAnGmZWIi0Tcu7sb1vJdelUTWrBcdloGgPo
 7rAfsC0m+NZ5gzmYzsS5U4rCFkQ13+79GK2VRs9fiB2ENgEouiaicuSzE/PGhctkgKlC
 sHhi7IolW2IP2/KWeCV21EKkjNe0v1e9NdvnGZStPBjMbyLB5hEtdgEZRfqg+2sjJzA4
 xucA==
X-Gm-Message-State: AOAM530DtMs3ysvvhKc7zwmOlMpSF6rA7Y6AeiSqkEMVFO3XsrNtHTZd
 GPdYpsg+tQVwogYOYoPFKhA=
X-Google-Smtp-Source: ABdhPJzb64ZD7SZ8Zo3vceH3nOEuontqr0yZrVSPKjB0ptcnTiJ0jR2bKfMnjBq6bhBFFVVzWLBPEQ==
X-Received: by 2002:a17:90a:b10a:: with SMTP id
 z10mr1044115pjq.102.1598906327541; 
 Mon, 31 Aug 2020 13:38:47 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a26sm116850pfn.93.2020.08.31.13.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 13:38:47 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
 gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: [RESEND][PATCH 3/7] ia64/sba_iommu: Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:07 -0700
Message-Id: <20200831203811.8494-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831203811.8494-1-nicoleotsuka@gmail.com>
References: <20200831203811.8494-1-nicoleotsuka@gmail.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: sfr@canb.auug.org.au, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The boundary_size might be as large as ULONG_MAX, which means
that a device has no specific boundary limit. So either "+ 1"
or passing it to ALIGN() would potentially overflow.

According to kernel defines:
    #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
    #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)

We can simplify the logic here:
  ALIGN(boundary + 1, 1 << shift) >> shift
= ALIGN_MASK(b + 1, (1 << s) - 1) >> s
= {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
= [b + 1 + (1 << s) - 1] >> s
= [b + (1 << s)] >> s
= (b >> s) + 1

So fixing a potential overflow with the safer shortcut.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/ia64/hp/common/sba_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/hp/common/sba_iommu.c b/arch/ia64/hp/common/sba_iommu.c
index 656a4888c300..945954903bb0 100644
--- a/arch/ia64/hp/common/sba_iommu.c
+++ b/arch/ia64/hp/common/sba_iommu.c
@@ -485,8 +485,8 @@ sba_search_bitmap(struct ioc *ioc, struct device *dev,
 	ASSERT(((unsigned long) ioc->res_hint & (sizeof(unsigned long) - 1UL)) == 0);
 	ASSERT(res_ptr < res_end);
 
-	boundary_size = (unsigned long long)dma_get_seg_boundary(dev) + 1;
-	boundary_size = ALIGN(boundary_size, 1ULL << iovp_shift) >> iovp_shift;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (dma_get_seg_boundary(dev) >> iovp_shift) + 1;
 
 	BUG_ON(ioc->ibase & ~iovp_mask);
 	shift = ioc->ibase >> iovp_shift;
-- 
2.17.1

