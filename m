Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D12EB5B53E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 08:44:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cdBf0lbjzDqSk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 16:44:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yv7ONmA4"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cd6x1tSczDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 16:40:57 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d126so6047321pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 23:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pKOh82x9P2FXMy8MB5i8VNrUUku24zVBdhYruM45v1s=;
 b=Yv7ONmA4HXrBg5Z7fqXzGOQbgQwuhlK4G2llLAPL9hd//uUhAJCdLP1gC4MiqhQmS1
 PV4CZ1/6GPjUs6tQxXSl9GVwIuOpYlj0kPjLUd5KNaZDhIEToxG1Sa+JbI0gqbWYCnK1
 nlIT45EuZA6x+yj65DFrpUmE+ukUb3brmWRiJ0sEST0egchnVhKD3wf61QoTZodMZhmy
 k4LLY0TR+zKUetQRGdhUpKeJcCk0KpXMV/eM/4aPeAhRmDX3A00d0snpwA3wONNLJH4u
 fRpP7dt48AfYD+D5tlNpsUuYik0uEhm3cuSW3WNaRLnnooak0yNkr7b21OrBtbTM1gge
 bOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKOh82x9P2FXMy8MB5i8VNrUUku24zVBdhYruM45v1s=;
 b=gA043sXpGZzXcLxPlMBnd4Qv1agLf3D2X34vBbTlXVro+hC+0udOqlHbh9okSPHUUG
 yxDYj9MCaSTMwigdg3PtBXHO9VCDItro6a51A8SVqEsBcAvS6QPz8TVnuT9fEpvKkbrk
 +YUqNT7eiF1oSC3IR/ICugcf/imIq/sa2VOThQq1oqK9jojnssu5mm1PDn5kgJ72Zif3
 KRZBdX8L6Q5xdaJrLab3/HpdwMXueReQie7TeSf1un/FuEs8F/K+e9iYVLZba6C7QP/J
 Zd5Dq0trhCFhQ0pn693hoeOicqGdpQN2dx+qRWGJRRdND3XoPvxjHfJI/TAtU2CFLQ3G
 pGCg==
X-Gm-Message-State: APjAAAXL5y/NBMKxhAPhUSG7/bizak4W8Z7llErKPqQtqycRvLsG73f/
 bH71CC4uKxfMDTAPY9ZbIxk=
X-Google-Smtp-Source: APXvYqyuG0y2ZSl0o0Y8HuBhNNVpR47p1znHr/GTjxdAJLwOfhhJ0EB9nOQKOhPc/GH1Qv7SUWLDfA==
X-Received: by 2002:a17:90a:eb08:: with SMTP id
 j8mr14461754pjz.72.1561963253877; 
 Sun, 30 Jun 2019 23:40:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id x128sm24238285pfd.17.2019.06.30.23.40.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 23:40:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: "linux-mm @ kvack . org" <linux-mm@kvack.org>
Subject: [PATCH v2 1/3] arm64: mm: Add p?d_large() definitions
Date: Mon,  1 Jul 2019 16:40:24 +1000
Message-Id: <20190701064026.970-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701064026.970-1-npiggin@gmail.com>
References: <20190701064026.970-1-npiggin@gmail.com>
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
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel @ lists . infradead . org"
 <linux-arm-kernel@lists.infradead.org>
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

