Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B44258301
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 22:50:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgMmW2P2XzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 06:50:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QBwNrPdf; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgMVg0DWgzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 06:38:50 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id a8so3749175plm.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 13:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UkH8Mq/WpiesfkXrapLTRLCROpdsRyoJty+98OOSpss=;
 b=QBwNrPdfcSAA97dtBnIWUfFN68G3dlx1D0NnviFoEsXwwJ685l3hFpoUYeYtJQzsk/
 fa7q/UtZxp6YwHBe+lUXHOQ1+GfSZzVh/DlB4nJjGv8Y+GG4bROeovNbk90Dcxd5OiaP
 gYkpuhwWCgw69+Fd2vWpUnQw4H4CpId8WgPawlAj3OSXL312ysfq8SYTiTBN4xm5ThPO
 F5+hNzC4yo3iGIb2RECwzNn7zXfvrk0NhPLH5HEpZ91StyGiVU6TKHdKBob3F9RMPnA2
 XmuYHqTMy4gsXlEfIEJipnHZkQI0n3KRv58zBJxo9DDi8lOQS6j3A/NxhJQ1wSezy3yl
 U1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UkH8Mq/WpiesfkXrapLTRLCROpdsRyoJty+98OOSpss=;
 b=g6h7sWsuaPgD6IznyePOz75sAF3cF46IJXFfL9oOfLhOlEi/j4Jb/HDMEBiJDX/1DU
 Rf4rNTO/eBdn1zwavHgovpg4RcIGUrRGzPb+VocbIcUAqYXMOi0zQDB33gm7vaSuQPVe
 +sd9pDnkzBDk4A3ftmAi5CoAkT36o5xxoU/IJc2bQQkrbSmJWwlZ2fd8gLrRX0NF90/l
 W/ubSX4AldgGkpPiuN4F3dhIqV/Rr04A4TP2HQmI/66EVbdEjf08O0AbMRQarIjnltwf
 LT9SOH4Lo/CtAdrD0BJ5pMwfVuWFEkmn1VzgqmxZi0aCSeTxjoWGQZEyK34XSXluay0Y
 VoTA==
X-Gm-Message-State: AOAM533NMsBrlTMrWbp4R2/0NLG8CnWUxmjWXa+8wn0imAPxBbUBmDxQ
 3e/Gq3rv9xytV6uKrsMWxlE=
X-Google-Smtp-Source: ABdhPJyXoduzDrrOfdBPGH2aNf+3wAYQRVLuMBfbGQJgA2G8/prLtxMZHSUPNIUyBa+AP5hiPpK76w==
X-Received: by 2002:a17:90a:5a01:: with SMTP id b1mr918526pjd.27.1598906328871; 
 Mon, 31 Aug 2020 13:38:48 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a26sm116850pfn.93.2020.08.31.13.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 13:38:48 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
 gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: [RESEND][PATCH 4/7] s390/pci_dma: Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:08 -0700
Message-Id: <20200831203811.8494-5-nicoleotsuka@gmail.com>
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
 arch/s390/pci/pci_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
index 64b1399a73f0..ecb067acc6d5 100644
--- a/arch/s390/pci/pci_dma.c
+++ b/arch/s390/pci/pci_dma.c
@@ -263,8 +263,8 @@ static unsigned long __dma_alloc_iommu(struct device *dev,
 	struct zpci_dev *zdev = to_zpci(to_pci_dev(dev));
 	unsigned long boundary_size;
 
-	boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
-			      PAGE_SIZE) >> PAGE_SHIFT;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (dma_get_seg_boundary(dev) >> PAGE_SHIFT) + 1;
 	return iommu_area_alloc(zdev->iommu_bitmap, zdev->iommu_pages,
 				start, size, zdev->start_dma >> PAGE_SHIFT,
 				boundary_size, 0);
-- 
2.17.1

