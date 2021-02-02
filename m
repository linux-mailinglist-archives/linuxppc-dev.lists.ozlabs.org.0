Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335430D086
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:54:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjqW4yBmzDqdm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:53:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XB61lX1Z; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVMRc15RbzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 22:05:31 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id y205so14087874pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 03:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vAbu4uylyD/1yZsJCHQjYIcITelz2x29iNZ/QiXVtA4=;
 b=XB61lX1Z4jTiaTn6F2TEgL9yy2HEpkCa4LEy14gBY61wcjtayhfijNdSUiYWEKnC0b
 Gr4gY14wuTx4N3GPxjmBQgPPbflA14HDXrkIMpvUCKjUM+ZvCd2V9RHJLqhnnykGpnmi
 ii4PbA6qaK5JS6pCJ08xdnIfLVbWR+I/7jOtTWQu7ZOjGOtox6vyFQ269nfVDTSaBGKF
 73ya1YZU3m7dknQ7mYnJLQ+8idRn2Jf81SlidA9eaXQzYa3JAWDtCWGnZMbrQeUPMtKF
 QnBcajgu8RWGcSenhBxa7ensCih8tLH9hK6GnxPxKBbZO5ySSgTv2JlKOx8Hg/NpJG7s
 R/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vAbu4uylyD/1yZsJCHQjYIcITelz2x29iNZ/QiXVtA4=;
 b=RsxiWEL7uOFP3LZ6VqOEbbyhPvJVFlTdZ32f8S6zVvOBNtl8sBYOWhaOCyaISwBUo7
 zNtiuZiFuS617goZm/qSDzdZRJARlB0iiypz1bPUI3fIPA9eg4TmKYNPTOzNZBM7O8rp
 iauOYEPHNQe10RPj8O4ppptK8Z5Xh0Gcc/Gnaw4iYSaGh0l1CJlyw0BSWnrfIIAjFdIm
 FSI8CCryjmGN8NRXK7J6TgYkte4UQYJtGHXZDyzyU494S/Uffw50VCF7R2m38MUfxB7r
 ieum1iwjOys7wE0aVUw031zMVnt6TAs8nwTHR3E09Clgf/cEsWrkKDduDgpbMqIqtogi
 wt3Q==
X-Gm-Message-State: AOAM531y5wGJZDi8E6P6bQC2s9SrjcEVCialMYly86G3otMXDtdqEhQf
 v6OYCYfhJCKiGuyO/xAgzlQ=
X-Google-Smtp-Source: ABdhPJxVMcdgA1+Y8LqXd2e61PK20uUftYJf8JWfAFkTyxXbbKor8wFP6q9LQTBVsxFGjf6kJasOew==
X-Received: by 2002:aa7:9694:0:b029:1bc:d0ba:10ff with SMTP id
 f20-20020aa796940000b02901bcd0ba10ffmr20855469pfk.18.1612263929711; 
 Tue, 02 Feb 2021 03:05:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-242-11-44.static.tpgi.com.au.
 [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id g19sm3188979pfk.113.2021.02.02.03.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 03:05:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 01/14] ARM: mm: add missing pud_page define to 2-level
 page tables
Date: Tue,  2 Feb 2021 21:05:02 +1000
Message-Id: <20210202110515.3575274-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210202110515.3575274-1-npiggin@gmail.com>
References: <20210202110515.3575274-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ARM uses its own PMD folding scheme which is missing pud_page which
should just pass through to pmd_page. Move this from the 3-level
page table to common header.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Ding Tianhong <dingtianhong@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/arm/include/asm/pgtable-3level.h | 2 --
 arch/arm/include/asm/pgtable.h        | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 2b85d175e999..d4edab51a77c 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -186,8 +186,6 @@ static inline pte_t pte_mkspecial(pte_t pte)
 
 #define pmd_write(pmd)		(pmd_isclear((pmd), L_PMD_SECT_RDONLY))
 #define pmd_dirty(pmd)		(pmd_isset((pmd), L_PMD_SECT_DIRTY))
-#define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
-#define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
 
 #define pmd_hugewillfault(pmd)	(!pmd_young(pmd) || !pmd_write(pmd))
 #define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index c02f24400369..d63a5bb6bd0c 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -166,6 +166,9 @@ extern struct page *empty_zero_page;
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
+#define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
+#define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
+
 #define pmd_none(pmd)		(!pmd_val(pmd))
 
 static inline pte_t *pmd_page_vaddr(pmd_t pmd)
-- 
2.23.0

