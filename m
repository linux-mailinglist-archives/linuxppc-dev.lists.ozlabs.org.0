Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A58925831A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 22:56:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgMv94lVYzDqG8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 06:56:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C7f9KtGN; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgMVj5S2LzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 06:38:53 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id z15so3736595plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9lkO17MTf1PvM2bYbtDswYPNjHPfse5Uqsd7G1Ozxzk=;
 b=C7f9KtGN6f9jn52H6vQ9qIM5jGWuoLJsZ/RKNr/lbkpPxTWSk5dxFfynXA0FMAYioq
 OxyAGzkgkPNh5e9cbfdo3dNv5UU8aAZV6AP6s2gvl5+DT9DVURrgFlAen5QW57oDKcmS
 OeBDz3aRzBm+A0c4rJ2IeiRUaHerUUToq2LfGlKk09Crc5w+8/6iqhYQwmdpaRYBJw/W
 qCzkNkO9kbzK7YJL/M2gaGN7xY2ZgCRmcAEs0pmIegG3sgCM7y3BK7uAEioOaUDCWQX7
 o2McdgM03YS24UfiiKYj67GqZYb3vI0E35EC+O14k3kW4wCeVY/ckjYJN1iq9G/PFpfE
 xlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9lkO17MTf1PvM2bYbtDswYPNjHPfse5Uqsd7G1Ozxzk=;
 b=JMm8CPRXy8rlu/4PFx025eV1F/OfHDMP2yP9fMqF4SsuOIPZEY/+YHxQFcstTZphYk
 E65QxgW9CnQ91hv912JexDRApj7MT1BfuwbUD4I4nnFZh3K96wZQ+mbOzOiXquej/ELb
 XhawhR41vYOw8o/a1h+zGzfldIckoNVdiZ3VEzUgAvVJexTkSnS/5egnPKKFMa6D5cKZ
 6c2GDKOJu4RgyyNrBP8YY0mf5A3PcWphjWsFbLuHR1uKXqw2XU8T+54GPKBWJBTHzwU5
 HIRm1gF+xpY+MRtpk1u4OOXRjcgMwJiaeAU/K4hJJJ477mvwk/A2Cg+js6y43hZ7Cs2Z
 N2nQ==
X-Gm-Message-State: AOAM531RB6PtF9z7hlDuzUbyUTo8kw5eJRFqd3DTj70jl+AS6RkodpM5
 yikhzhT3B6HLmUrqY9H2oGg=
X-Google-Smtp-Source: ABdhPJwNe6SMal3ghr336eWQ9OQ27rxWY9eWRgjp87ARIjTK34cksm8DqThZeCN/pPb0zdeAnklq5Q==
X-Received: by 2002:a17:90a:9d8b:: with SMTP id
 k11mr915199pjp.169.1598906331693; 
 Mon, 31 Aug 2020 13:38:51 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a26sm116850pfn.93.2020.08.31.13.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 13:38:51 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
 gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: [RESEND][PATCH 6/7] x86/amd_gart: Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:10 -0700
Message-Id: <20200831203811.8494-7-nicoleotsuka@gmail.com>
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
 arch/x86/kernel/amd_gart_64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index e89031e9c847..7fa0bb490065 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -96,8 +96,8 @@ static unsigned long alloc_iommu(struct device *dev, int size,
 
 	base_index = ALIGN(iommu_bus_base & dma_get_seg_boundary(dev),
 			   PAGE_SIZE) >> PAGE_SHIFT;
-	boundary_size = ALIGN((u64)dma_get_seg_boundary(dev) + 1,
-			      PAGE_SIZE) >> PAGE_SHIFT;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (dma_get_seg_boundary(dev) >> PAGE_SHIFT) + 1;
 
 	spin_lock_irqsave(&iommu_bitmap_lock, flags);
 	offset = iommu_area_alloc(iommu_gart_bitmap, iommu_pages, next_bit,
-- 
2.17.1

