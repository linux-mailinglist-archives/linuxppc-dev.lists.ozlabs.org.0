Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D61602CFA2D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 08:05:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp0wC4nvQzDqlr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 18:05:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fcGKhIpp; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp0l80FC3zDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 17:57:55 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id c79so5355411pfc.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 22:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wf66xeGBT+zLBJ325IKif/6Ivp+txfeM6xGRJ6CQfBE=;
 b=fcGKhIppJJa4HGaXNdZBhdNLob29Ivf9BES+4C8PfV5PbxTaC14ALc7yzgbzTh1Cf2
 LjY1qEbDYZiXN0mvRHB9kiU1bHI8141d6FpINWNGUwiZuAMlwJh7UbCitM0jugtSzM+e
 uuVzySGmGdz/Yxt1V7K/3YHoHcW8tcgLe1Yp12EMc82n5ttvwmI/rb1/KAYWS1plwtbs
 C3P/hnxWcEW+9SZQ68McBxZbgcmjUDMkfkRVryruxzpH8n3TAVWd3jxOUtaInOlv1kWv
 90Gz53+ICxtmSLTNCU1YyD9uSx4stnX42USHoS8I9tMkYSCB4FkeuO7N/K7et3LRpziZ
 MFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wf66xeGBT+zLBJ325IKif/6Ivp+txfeM6xGRJ6CQfBE=;
 b=DrWV37XWa6PFcRtvOapJArhcAMqAC+n2dsn3KILxHIGmf4UVhbfsDD4uwdY3Sw266H
 BvYGvZquASUX74Ueypu8uJoh+DRjP3dIiYZn4i4tiIJMII8yi9bg7Dw1jzgkUPdWn0Ji
 CsjVxlxS+pnoSUcauLLzwnRy/ZF9GvepjLoSc1wD+RmfNjGYLyydfx00vOfq73DHi9C8
 pUEGgIf4Xj2AS6NIr1DlcxrbU/iZy6a8jiQXoGshOE7ZboE+aaRZCzKv2scSv6vctWeV
 9uULrNee019Kuy+6mlwtO6QCudw5sQ5YslQKUgMPiKTIYH93i8eE5mPpVgVexvmbJ2ee
 2lDw==
X-Gm-Message-State: AOAM532zLQdC+ncUTCz6SGjwtNRBREe9ILM24PyM+akW+4V6DrRIVJ5l
 dLxiK0ybzKDd4KZYu4Lsl9s=
X-Google-Smtp-Source: ABdhPJxONuxdsKc3Y9tSWgtmcHfGYtNDoscWaaTlNa/hUFWSKu5YHYgn5z4+YBtAOkosOqfGAZt7dA==
X-Received: by 2002:a62:ab13:0:b029:197:ca83:7720 with SMTP id
 p19-20020a62ab130000b0290197ca837720mr7159021pff.78.1607151472903; 
 Fri, 04 Dec 2020 22:57:52 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.129.145.238])
 by smtp.gmail.com with ESMTPSA id a14sm1110848pfl.141.2020.12.04.22.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 22:57:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 03/12] mm/vmalloc: rename vmap_*_range vmap_pages_*_range
Date: Sat,  5 Dec 2020 16:57:16 +1000
Message-Id: <20201205065725.1286370-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205065725.1286370-1-npiggin@gmail.com>
References: <20201205065725.1286370-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The vmalloc mapper operates on a struct page * array rather than a
linear physical address, re-name it to make this distinction clear.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/vmalloc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f85124e88bdb..42326dbffaf0 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -189,7 +189,7 @@ void unmap_kernel_range_noflush(unsigned long start, unsigned long size)
 		arch_sync_kernel_mappings(start, end);
 }
 
-static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
+static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
@@ -217,7 +217,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
 	return 0;
 }
 
-static int vmap_pmd_range(pud_t *pud, unsigned long addr,
+static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
@@ -229,13 +229,13 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr,
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
+static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
@@ -247,13 +247,13 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
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
+static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
 		pgtbl_mod_mask *mask)
 {
@@ -265,7 +265,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pud_range(p4d, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
 			return -ENOMEM;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
@@ -306,7 +306,7 @@ int map_kernel_range_noflush(unsigned long addr, unsigned long size,
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

