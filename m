Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F862582F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 22:44:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgMcq6N4czDqCp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 06:44:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FTBIoSkS; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgMVd3BkyzDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 06:38:48 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id kx11so474903pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X3g/RFdq0XCD5HjHScp80cQCvDJiBf0FEu2sjpwx7PM=;
 b=FTBIoSkSFCuYfdZZaBdmEHEhwrbZcdgJQEmZ6+shh7rWUbYFsVNhqAvIZ76+x5Agay
 HZGd1vGAqH8QZN271wpNdm5UMhzNI4fjZxpDIzQoQQOkYhhXQV4pGykHjIkWUcRA+os0
 cfATZ79F07KBkEiXisWvSKSKRlB4nNLiJWGlc+KoC+c9cNTLJbaRwkGPyOMfTgCsij4L
 AIXUcsy6y/nvNko5LI3a7lMyuCUxiq3vv5/NauqeVADCoaX5kExpDbcxIi+KIEtcENxO
 D5VqKn4IFfj/HP7QtYhkIJMrqIKq81+SfGjp//+umfJhEqXXpj1hdk14thzK3bwfoS2D
 lu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X3g/RFdq0XCD5HjHScp80cQCvDJiBf0FEu2sjpwx7PM=;
 b=NgDjrJ5KHV/8ygtjUex1mE2fNke7Ry/dklswAsfshue7PL3Cx5ykFOC1L7Dm89M5rq
 ZWj+sy1WP0IFmeJkEM599BweVwWH4OyZ2HzOzzFmYNubvRe2eTuB9ueY9Fr86vNYm9pp
 18LMOUKjzyqQp0apHvLKiQWS6MaPoYU0Q/QF1yMfTu+bhVWs1OMato2C8XjLpCMyiby+
 EvoRnbExB/1WqJZCXGwxzoX02XxjNNlDdHnaObz2RTXVQlUK1ns7/zniYbxBe6n6mz0Z
 ffAsBGDj5J7eh6XJqeDs4cXi2WZyWiyYcuQ9L5UXqs6wHeJcQAsazQskT2NTcLTsj+up
 nEsw==
X-Gm-Message-State: AOAM530PFKjzsSSkejmXaOL7Hzyi4vz7TzDKr4wbRTf1I/hky4xd5G/3
 tWeQ9BpbqLOUjZIs8aYHiXE=
X-Google-Smtp-Source: ABdhPJzEZnz05KuonW+slQotpW/KiNfPxzeDAkLgmc5mo6VYw9R1Q8hucg2SB2LlI1X3IRYPBhim3A==
X-Received: by 2002:a17:902:8605:: with SMTP id
 f5mr2376275plo.263.1598906324684; 
 Mon, 31 Aug 2020 13:38:44 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a26sm116850pfn.93.2020.08.31.13.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 13:38:44 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
 gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: [RESEND][PATCH 1/7] powerpc/iommu: Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:05 -0700
Message-Id: <20200831203811.8494-2-nicoleotsuka@gmail.com>
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

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/kernel/iommu.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 9704f3f76e63..c01ccbf8afdd 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -236,15 +236,14 @@ static unsigned long iommu_range_alloc(struct device *dev,
 		}
 	}
 
-	if (dev)
-		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
-				      1 << tbl->it_page_shift);
-	else
-		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
 	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
+	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
+
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (boundary_size >> tbl->it_page_shift) + 1;
 
 	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
-			     boundary_size >> tbl->it_page_shift, align_mask);
+			     boundary_size, align_mask);
 	if (n == -1) {
 		if (likely(pass == 0)) {
 			/* First try the pool from the start */
-- 
2.17.1

