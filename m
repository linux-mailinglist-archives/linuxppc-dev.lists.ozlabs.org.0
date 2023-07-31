Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B07769F74
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 19:26:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NCurFfzE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF4s70sXpz3dD5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:26:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NCurFfzE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF4NG604pz3bmj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 03:04:30 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-bff89873d34so3787537276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823068; x=1691427868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=NCurFfzESiDx9LJv2ZuGZQRVSVONypfRSwp3UCPEimaJ0icLYx3MO5YhqaCkZBIR4Z
         l/oM16YnfTb6kc+h35gY+zFIGDLtxKkoqGrDMVFkoTTTXsh+xxxFI4aLUNlB4KO70CwF
         WRXyA1UJf7HH1gQrjYriX6iIExSZBg+JSpTH9iwwtWaRApzq4XeZb8/+i18fB7X+SbC5
         QNboB3mts09Ey/BGMzFFSqcMjH751GJumhdsMsGsSdMw+HfAwMqxwq/99BYNjLDy4Uwv
         T3I5GqlbCblT84V09f9Mmwx3a1PPDI4Kl+kA59SDykK80t9C+rJKaVJTL/sIPY4ok+Qa
         Stkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823068; x=1691427868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=g6Ws1zG32vBMor/cHeaMMFHYZvT4Jsg3xSRyzmr6sOj+/9mwtRPX27JZfMTHYBksA0
         v67yDG6UxB35aJZ0HYsjkYt/J7wx/xRdQd+r8nhKChHFy7Qqm/XMHwsFoEaWkaBaBqdL
         AA8ua8iErIhyZTN48BHRM03vQb2SbYaTdBGQMiO0ZGeVLfgVpqNgcdmyE9lR8IOeYbzb
         3WolEKfjP4DGjS7mEIraKgaNFchH5gJ3by0e/191NRp6JIBdOtKjFPpE9Lw/GTdL+dou
         5A98Y5xu8KTUomYsNpB2hWAbSTGvA3diMLQBDbFZ7HLkZ3BwxWIko0rl8s/unuFA8nhV
         3yBA==
X-Gm-Message-State: ABy/qLbmSOdplO7f66R4wjkP58xMDrN+Qd+LtQhN0ZghJgoYOQJarlTp
	JwV+q0POKl54B7UG4gIH0BE=
X-Google-Smtp-Source: APBJJlH2OMZz7Ho/ZKKTbee+QNJ7Mj2bTW6BCb3XUatLH/MvStrEwd2dCkY4APrPVNcSGvWAfXuhUw==
X-Received: by 2002:a25:acd2:0:b0:c6d:f875:520e with SMTP id x18-20020a25acd2000000b00c6df875520emr7715849ybd.49.1690823068568;
        Mon, 31 Jul 2023 10:04:28 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:28 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v8 25/31] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:26 -0700
Message-Id: <20230731170332.69404-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Jonas Bonn <jonas@southpole.se>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..c6a73772a546 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

