Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB36245705
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 11:17:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BTs5K4hMlzDqRx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 19:17:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a9eH2Qud; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BTrwK11CmzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Aug 2020 19:09:37 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id k13so6016881plk.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Aug 2020 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xoa50mjKdO+6rEo7JFgsM1iktECeAufQruBypQNx5uU=;
 b=a9eH2Qud8eaxaDEyJ6Ox3nV2dEQGPtlOBvhHiUtqVX8FJWPdpCeQ/7Z+MH3ABFUlzY
 hGmX62DEx+PK4neClmvN49t6HjShSviRro/UAGDtJPSR6V3MbsPNXrDz8S4WZTYDrlfr
 bCc4QjNnpMrwwl0bn98+LNDPdIcDqScjmU09UuXnxnCUFPo1/sZPQWzrH75XUEL2HCmT
 7zVlApSM3TvG4rV6nJQRTMHPF7VgTZL/WOdO4pwkBBtsA41oUEymfx9+I+gV7FC0GiBD
 FRtkqpWRR3h3zLZqRnoL0QTqf6iqBTeliFHIGWSiG4+f+zGXSw2HK5l/O3HF53m4tE+M
 HQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xoa50mjKdO+6rEo7JFgsM1iktECeAufQruBypQNx5uU=;
 b=n9hvhn0l57PK4GGWYO3av1/r57ZE+PVUsyzcWJ5gvDo2H/J5oVm1i4Lp78rEUrtxlZ
 bgWS0hHxNbxfvpEbZ6mb2esMwpFJiQ3unGZ1O2q0ZwjFjpeGSolBK5VGKBdYD57k9GBe
 okTtmEM38NEQ3zWRv9+y50rKebctPIJ4UpfB+iNS4zuzVSI7KfO6029k+QutavQidYVL
 /+zV04+RESwJj0BbEGI2smETthAWBkmw0bJUa7yoXygyWrQ7uHIa00bjJH+h5GaAkCYp
 yEQfqMOQJ1bvgwPeNw8jopPdQ8Vqdbz4CTWvv1cJ+Zwj+qfJTzxXf272oazu1kJCfaS1
 pGhg==
X-Gm-Message-State: AOAM531PCjyQXKS1NMG1lvJl8rrNJUiSM7+GfYpfsvpP013FORQC4Pj6
 vmgHGxgGcGFcxFBi0L5d/Ks=
X-Google-Smtp-Source: ABdhPJxjxbOaxbaEbI6j9pxumC5wRGiGlNLcDB22u2QtqVpRvdt2rZbK1BklnxLXaykWubkHnlaE0Q==
X-Received: by 2002:a17:902:cb0f:: with SMTP id
 c15mr7427207ply.85.1597568974143; 
 Sun, 16 Aug 2020 02:09:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-193-175.tpgi.com.au.
 [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id o19sm12768369pjs.8.2020.08.16.02.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 02:09:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v4 3/8] mm/vmalloc: rename vmap_*_range vmap_pages_*_range
Date: Sun, 16 Aug 2020 19:08:59 +1000
Message-Id: <20200816090904.83947-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200816090904.83947-1-npiggin@gmail.com>
References: <20200816090904.83947-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The vmalloc mapper operates on a struct page * array rather than a
linear physical address, re-name it to make this distinction clear.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/vmalloc.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 49f225b0f855..3a1e45fd1626 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -190,9 +190,8 @@ void unmap_kernel_range_noflush(unsigned long start, unsigned long size)
 		arch_sync_kernel_mappings(start, end);
 }
 
-static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, int *nr, pgtbl_mod_mask *mask)
 {
 	pte_t *pte;
 
@@ -218,9 +217,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
 	return 0;
 }
 
-static int vmap_pmd_range(pud_t *pud, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, int *nr, pgtbl_mod_mask *mask)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -230,15 +228,14 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pte_range(pmd, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
 			return -ENOMEM;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, int *nr, pgtbl_mod_mask *mask)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -248,15 +245,14 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pmd_range(pud, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
 			return -ENOMEM;
 	} while (pud++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, int *nr, pgtbl_mod_mask *mask)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -266,7 +262,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pud_range(p4d, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
 			return -ENOMEM;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
@@ -307,7 +303,7 @@ int map_kernel_range_noflush(unsigned long addr, unsigned long size,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
 		if (err)
 			return err;
 	} while (pgd++, addr = next, addr != end);
-- 
2.23.0

