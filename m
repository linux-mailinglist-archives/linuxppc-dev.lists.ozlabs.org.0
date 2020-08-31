Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C3258327
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 22:58:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgMxh4phxzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 06:58:48 +1000 (AEST)
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
 header.s=20161025 header.b=oHRLDva7; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgMVl1nydzDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 06:38:55 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id y6so3730146plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 13:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/pybmE7a8FIpjQvJ6DGP3d+JulP7r92A2J59iMGiCLM=;
 b=oHRLDva7bE8NCj84o3Pw6XZLnP1yvvF0hDph2uVI7flXevbbdOYILUTOYyZCQ8otre
 cCxr652BWFhSBLsdzy27Cb7Mddqacgb0iPwA8elKbwwEAVUBN15xECe0ThRuaHCOMdkR
 dc3HEMkslEYv9RGiOcoN0hJsz9vazpaaDe3s/dlsGh7DjUCEhA4GdnYvIBBSn8VtTHcx
 lvbLByvCgW0dL5AoLO91GPQcrbxAg2llOaYkOG9iH1BZqv6X0lnc9Cwlvy6dFLfDqm2M
 w4tgaSsKeklGE8LZkIFRnECIGasMSWsPpNmoSLShXelmGeMJiFCs2p43c9vhVvKrOpPS
 4Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/pybmE7a8FIpjQvJ6DGP3d+JulP7r92A2J59iMGiCLM=;
 b=LSXqz74a06ypnNZyRiGqXmJC8HnpDpoJduJBxEEFZuFdY8rm3RsJC1IRNA2V+D5wSq
 Jh3q8KdzswcI2j/PlQhZHgVDuBzAm8HZceFB+qsAWbHF0SpKcQOgi/UjXnUSo2ITeFiz
 jJE4mVb97wT60D0tBz4NkksL7A6VImTIzimrPx8FB1ozheIPreylJT9VzHAo1xQMEgQr
 Dh/+pP71Fb2Fh6mNlmkfxGJJI6/fmZn4WJo9jJGH+6iPzPucf1EzUp11sI9h4OOTqydC
 ii1wh7xHOUXS9ec3MeKv+tMok+3aJdOH0DEw1bE8qDEnjzXq8wk/5NZi31EK+FlS06gw
 q6Cw==
X-Gm-Message-State: AOAM531uU5h9dG2ABwac1CxUTeob6hiGhbkkaXHUgfQvaIU584zmRWOW
 l0GuOFTgXKgo8nQ8a2mdoNw=
X-Google-Smtp-Source: ABdhPJzxmla8Fw1rXgmVa/RE16rISQFkMFWRT5MPsRMrCIi9V2DCsAyGzGk3H5CzIrYzvPZULqAD2A==
X-Received: by 2002:a17:902:a412:: with SMTP id
 p18mr2318693plq.283.1598906333078; 
 Mon, 31 Aug 2020 13:38:53 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a26sm116850pfn.93.2020.08.31.13.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 13:38:52 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
 gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: [RESEND][PATCH 7/7] parisc: Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:11 -0700
Message-Id: <20200831203811.8494-8-nicoleotsuka@gmail.com>
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
 drivers/parisc/ccio-dma.c  | 4 ++--
 drivers/parisc/sba_iommu.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index a5507f75b524..c667d6aba764 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -356,8 +356,8 @@ ccio_alloc_range(struct ioc *ioc, struct device *dev, size_t size)
 	** ggg sacrifices another 710 to the computer gods.
 	*/
 
-	boundary_size = ALIGN((unsigned long long)dma_get_seg_boundary(dev) + 1,
-			      1ULL << IOVP_SHIFT) >> IOVP_SHIFT;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (dma_get_seg_boundary(dev) >> IOVP_SHIFT) + 1;
 
 	if (pages_needed <= 8) {
 		/*
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index d4314fba0269..96bc2c617cbd 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -342,8 +342,8 @@ sba_search_bitmap(struct ioc *ioc, struct device *dev,
 	unsigned long shift;
 	int ret;
 
-	boundary_size = ALIGN((unsigned long long)dma_get_seg_boundary(dev) + 1,
-			      1ULL << IOVP_SHIFT) >> IOVP_SHIFT;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (dma_get_seg_boundary(dev) >> IOVP_SHIFT) + 1;
 
 #if defined(ZX1_SUPPORT)
 	BUG_ON(ioc->ibase & ~IOVP_MASK);
-- 
2.17.1

