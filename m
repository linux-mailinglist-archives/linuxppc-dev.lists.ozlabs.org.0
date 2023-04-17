Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9963A6E780D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dKR3mjjz3fgg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:07:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sICUrUNh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sICUrUNh;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQP51zXz3cfH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:53:01 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id w1so4513535plg.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764779; x=1684356779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3zVXX/N6SOzga9RDJq+tPAqPrrx50X9RMNZ27hRgPo=;
        b=sICUrUNhKpAOA4VRjrqbzI2X/H4tUjO6T2SdOnpuj4Iy+PajhE1DrUSbcJznfffRrX
         L+wg0APu+UnJsiMWo07D8eesoEiJoCPkIf7iFkO3frlAWKtnOneztwNYCGmhOQpiZeuy
         AXohiTFVSZ6j/QYK9dyhVhIaufaLIPexDAAJXmf6qW3dNeCDEUq++V0vxfiKc0g0e7Ab
         Ewxv8L1qYPD4uyzx9cQ6CGY815b+pAM3zpWc0XUF8sLnRhkHRA/O3qjcuWg0cKvRpE4M
         YyoU6OpnuIHEQ4e7n1BxpYaP+3T9kR2hf6Oim0PIubi0gprGsuCOvZCKtVwS9TGYF6kY
         TvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764779; x=1684356779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3zVXX/N6SOzga9RDJq+tPAqPrrx50X9RMNZ27hRgPo=;
        b=aaUmiPwaCCsafH/wpOr6j2kyH9Fcr9JvOWTpw4gIPzFT/VdWZdtKYHMTV0mo+mBBaw
         W6E52alMHcayKCBG1E0K0E4A+oifCli6Sr+AduMjsaj43f62c5tsCjxEqkG5k7tFjA4W
         +LdChmGoUh+WIEFY6SELx58MsPP6GXvzw+eH/SVH29BtPIdkAbLsM/WFiVNY33LRzXvq
         l3T33IwrCwtM3NccZoQA1PbAE47hg0mOVJ1/lSLilQhkbaZ8q0JIPvXrUJzr2jdAD7TL
         wvYWb7TitmEYA0FNfSyZyK7a74BvVN6OHyxcgjue/KepaIPcV0g3IZ+LrVVnR40FwIuD
         q4Gw==
X-Gm-Message-State: AAQBX9cgDhg09a7a1h8CQI5ZCc+oFXY7HoQdmtMKGqvFRAdJjkk1SKPH
	xNO6swsqmc3HTExsGaUNE+s=
X-Google-Smtp-Source: AKy350aL1Q/BuQU4b/coHWha7jodau934g5ZfPpWwX1i7O384OcXkkUs5sEaNrPzHDYpgrYCEKrWgg==
X-Received: by 2002:a17:90a:cb8c:b0:233:f393:f6cd with SMTP id a12-20020a17090acb8c00b00233f393f6cdmr15121483pju.5.1681764779380;
        Mon, 17 Apr 2023 13:52:59 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:52:59 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 10/33] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:25 -0700
Message-Id: <20230417205048.15870-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d2485a110936..2390fc2542aa 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2911,12 +2911,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct page *page)
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(page);
+	ptlock_free(ptdesc_page(ptdesc));
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
@@ -2929,7 +2929,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2953,7 +2953,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.39.2

