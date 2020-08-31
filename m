Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A787C2582EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 22:42:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgMZY4H4PzDqCp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 06:42:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TzB4sWRm; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgMVd3DCWzDqS3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 06:38:48 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id 31so1323487pgy.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZXOK8pT3fKKSH66fLd/ANhE16k3B7ecJU+M0aFuQDuk=;
 b=TzB4sWRm6ZAuIrDMdExk+izGYATh9SydohMYQTrP++FOYoG1+4dBkUG8f4Woek1tYp
 kF3g2XaPKsCF+vCk5+bwIwBkI+5mkEmzIKSRawtVeML+y2a0pxCygQt5FBQgD7P6RpTz
 m61TvHvUxyFyXMZfWfyF3GTJMRFC0pdUL0vJbKH5ylNFYASiCxkZ14GYNRXJaNs8zQk8
 YAtlY4Jw9iHSIV2Z4w+hPBR5HrekVcopfxUJObri1kGVk18WRDyvdrEZzb3qsI1Y5vi6
 UDpeKdiDjI9OVZk6CdeTovFqftK4gmPrhYNcPVjU39Fyvre/MvZNLdRYCNGqF8K+Fk/5
 RHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZXOK8pT3fKKSH66fLd/ANhE16k3B7ecJU+M0aFuQDuk=;
 b=ld3kYlw+NoNpXF1L6Fqq/pFugmT+qforQEGtEzJ94vGRB3qqf22ExsMPY0/Ba/nAeG
 sDe07vIWYnl6faMApiydbvurCU0alcFo+19907gR+CdS4VLDWFhf2l06NMnvORmlm/Ar
 gnvD1RETrmAC67z43nTWW1fBbMsKCynbQEq2jXjGNs1jvRenXlGGS931Oe5R72Iluu+c
 1gZH4H8fH9izoOko7SyOUnDLO4UQrxLyDxYyq7y4+coPoAaGAdLhB/s8mlRXssvdg7oY
 EU1bzlIkytpFXE+AGplLF1s08qPB5o/dep49dahiQMF0A2GWBN9iHWX8JXt+/ycYlG3X
 /KMg==
X-Gm-Message-State: AOAM531s5jLOJg21QLeCIQ3uoQjSZ6fXr2RlNdnG/GYy3fVuu+3C0w+J
 u9iscFdhAI/GpK5Yd/bQNx8=
X-Google-Smtp-Source: ABdhPJy+FlNIl8ncpj2AvTKaG971rKjgMQJrwIhf+5uTs4aPH7QA8BVHvYV2MQJ05mGYZgFUh2Wmhg==
X-Received: by 2002:a62:2707:: with SMTP id n7mr2567532pfn.38.1598906326113;
 Mon, 31 Aug 2020 13:38:46 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a26sm116850pfn.93.2020.08.31.13.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 13:38:45 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
 gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: [RESEND][PATCH 2/7] alpha: Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:06 -0700
Message-Id: <20200831203811.8494-3-nicoleotsuka@gmail.com>
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
that a device has no specific boundary limit. So "+ 1" would
potentially overflow.

Also, by following other places in the kernel, boundary_size
should align with the PAGE_SIZE before right shifting by the
PAGE_SHIFT. However, passing it to ALIGN() would potentially
overflow too.

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
 arch/alpha/kernel/pci_iommu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 81037907268d..1ef2c647bd3e 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -141,12 +141,10 @@ iommu_arena_find_pages(struct device *dev, struct pci_iommu_arena *arena,
 	unsigned long boundary_size;
 
 	base = arena->dma_base >> PAGE_SHIFT;
-	if (dev) {
-		boundary_size = dma_get_seg_boundary(dev) + 1;
-		boundary_size >>= PAGE_SHIFT;
-	} else {
-		boundary_size = 1UL << (32 - PAGE_SHIFT);
-	}
+
+	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (boundary_size >> PAGE_SHIFT) + 1;
 
 	/* Search forward for the first mask-aligned sequence of N free ptes */
 	ptes = arena->ptes;
-- 
2.17.1

