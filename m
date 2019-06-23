Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C561D4FB02
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 11:49:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WngZ60HwzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 19:48:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nZ1uAEh/"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Wnbk2J5PzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 19:45:38 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id cl9so5175959plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wnbjux+HxNYOkFaRKhTh2OlBlr6Yjq4h8O9uCggPaW0=;
 b=nZ1uAEh/l/iH3XHgJ4JMzpVgG2BAjVP+Z4uP0nLctfLAj7AD/MmtA4UP0ovGBefyCX
 oi/eiKdn5rkb+cERs9Q8dHLJnb+ghuSMilmtfbCoNwrAS8IHMPARnfgHf8n9HMnua6zS
 +dxXBrDAzpJmAl2a5WPEl0+v9WftLVMpwR+Ki8qD5BEfrZHM6Z+MwQFgDagG17N4lc1g
 5g3hUt3k1Vuvyww7G6od0qdoZYGYGxV4ZJ+E/1RRGg0hnv1OCHh2088YsdWh7C6PTe+t
 pG1oasPj0r+b4PVWCRQ/vj3KXGeUaEOXaQbg+/rH4Dd4SeFUb1BicT4qR09j10i/WFg9
 yGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wnbjux+HxNYOkFaRKhTh2OlBlr6Yjq4h8O9uCggPaW0=;
 b=J7YsxpZPxzFbyFT0AgA3zZnieQP9FWxf378ccptvx8iuvnM+3t8J+8SnSKOQjra+V0
 w37jipyQw8xgTSxgcKlEX+5JPinDJtsjtspKRVy54KMInYyK93PmpIjlKWqrNM8qXSW7
 /EG9+NeOSuQYGbAwgLtToreIUm0SAy+tOpDNeTLy79+6zyoRTsDOa2ZILUWV84DKJUGH
 NLqKX6iDbQ6oALYgfU1cHgATCRsi4kDRT/IWj6N8680yX2R0ZEFn0fcp+2cstHuTiwMV
 HkenqleAusUNJQNsc0gfHbzWzGI7Kv36dLXm7tvN1B3CoUDOcF9pPsWDUPH97dbazjsX
 Zg+g==
X-Gm-Message-State: APjAAAVK7PjoFXvTZuTDf/g0XsmehrDfaduA6DFbe202sTZKS9hAySjk
 gi50S1zdOTFnF//REpUbazrrz56ptV0=
X-Google-Smtp-Source: APXvYqy03K0Z/MbKC+X3ScMS1p5nrg83Wdw/gotWUEhNW5qLKL0hUnw5AV3nEp2FnFcsXPqkd+XVzA==
X-Received: by 2002:a17:902:7c03:: with SMTP id
 x3mr117368602pll.242.1561283136704; 
 Sun, 23 Jun 2019 02:45:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.129.156.141])
 by smtp.gmail.com with ESMTPSA id d26sm6181062pfn.29.2019.06.23.02.45.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 02:45:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH 1/3] arm64: mm: Add p?d_large() definitions
Date: Sun, 23 Jun 2019 19:44:44 +1000
Message-Id: <20190623094446.28722-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190623094446.28722-1-npiggin@gmail.com>
References: <20190623094446.28722-1-npiggin@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Will Deacon <will.deacon@arm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Price <steven.price@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

walk_page_range() is going to be allowed to walk page tables other than
those of user space. For this it needs to know when it has reached a
'leaf' entry in the page tables. This information will be provided by the
p?d_large() functions/macros.

For arm64, we already have p?d_sect() macros which we can reuse for
p?d_large().

pud_sect() is defined as a dummy function when CONFIG_PGTABLE_LEVELS < 3
or CONFIG_ARM64_64K_PAGES is defined. However when the kernel is
configured this way then architecturally it isn't allowed to have a
large page that this level, and any code using these page walking macros
is implicitly relying on the page size/number of levels being the same as
the kernel. So it is safe to reuse this for p?d_large() as it is an
architectural restriction.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
This patch is taken from arm64 but is required if this series is not
build together with arm64 tree.

 arch/arm64/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index fca26759081a..0e973201bc16 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -417,6 +417,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 				 PMD_TYPE_TABLE)
 #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
 				 PMD_TYPE_SECT)
+#define pmd_large(pmd)		pmd_sect(pmd)
 
 #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
 #define pud_sect(pud)		(0)
@@ -499,6 +500,7 @@ static inline void pte_unmap(pte_t *pte) { }
 #define pud_none(pud)		(!pud_val(pud))
 #define pud_bad(pud)		(!(pud_val(pud) & PUD_TABLE_BIT))
 #define pud_present(pud)	pte_present(pud_pte(pud))
+#define pud_large(pud)		pud_sect(pud)
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
-- 
2.20.1

