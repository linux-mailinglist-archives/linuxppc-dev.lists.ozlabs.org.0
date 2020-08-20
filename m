Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB5B24C87C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 01:24:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXghN00sHzDqwg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 09:24:04 +1000 (AEST)
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
 header.s=20161025 header.b=H6SRQTt/; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXgbs2V4QzDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 09:20:09 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id mt12so118295pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 16:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=X3g/RFdq0XCD5HjHScp80cQCvDJiBf0FEu2sjpwx7PM=;
 b=H6SRQTt/e40/pQOyXkQ9JtJDyYqK27MLhVSs+T4x0VbMT2Ek2SyHxzAFwZ1ifIQ74Y
 iDpIZ2aV98EUqmIU4+GafEj8GP7Csi80NP0FyFdKeKSjrdEDx2D46CsdT68SxLIG0d9Z
 19uSfPNTXibsNjOKZe8dnldxR9WOKBSIODrOSzHpo6O9ijaZH0CITcn3OUccvGvuXsZi
 SDMGCg6wrvshrhCyYHSTPc6wSA6orbaDIv3XK0WffrRdMK8s8JjzKydHytCyEtGsd37g
 obP653B/poADTj6MYwyRpUYgCdwZDUULd0cgyD5m1EjgK5v65/yTx2kwtEw7mgB6MXuu
 mrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=X3g/RFdq0XCD5HjHScp80cQCvDJiBf0FEu2sjpwx7PM=;
 b=lFkPKfkIfzQRBotE36bZQ0ZcFecHKRCQF4VoCFb4kZOOtt2WEVsmZf4UD6ltBpYabG
 Ifv3Eh2f3zJFyFFzvlqLvUadkghCHNYwJNOfUn8glx9QF2+VBUSo5qjKca7QDXuvjl54
 uJXE4XGxehn4Zzd4lRybxMmti5qS/Anra414XIEpF4erokIoNhdJwvGWDUFtQpIvDwC0
 n1qPm+qMMycHS43J6Acyki2U7+jqiNjnzXBNL2NhaK38x3ExAoYwRACsvGxun5WnaXEw
 5fyOKD9F09CQ2hBchxOybvK8CYW/qQ0+1krmicd/E3C26R1Z0+ZCjE9hnE6C7btP8+E9
 7t9w==
X-Gm-Message-State: AOAM532ArJpNjddAPJF4PGv5MgYvBWT6cITCa3SjdARCCU9EGlG4ydGH
 WhgE4YAmasNavOSH52KyYbY=
X-Google-Smtp-Source: ABdhPJymF9sP8ZVbRRbulyIKVw8BzxVOEH7wq+yuUEvAaTczXPJW5VOGEKa0aHe1o0ifMP4gvJ/e1Q==
X-Received: by 2002:a17:902:8bcc:: with SMTP id
 r12mr108273plo.314.1597965606080; 
 Thu, 20 Aug 2020 16:20:06 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id e29sm154527pfj.92.2020.08.20.16.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 16:20:05 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [RFT][PATCH 1/7] powerpc/iommu: Avoid overflow at boundary_size
Date: Thu, 20 Aug 2020 16:19:50 -0700
Message-Id: <20200820231950.23719-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: sfr@canb.auug.org.au, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-kernel@vger.kernel.org
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

