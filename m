Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93736E786B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:19:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dcF3Mkgz3gRT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:19:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=p/jfRaNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=p/jfRaNP;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQq1mCdz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:53:23 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id s6-20020a17090a698600b00247a7794e78so3559191pjj.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764801; x=1684356801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tniPUuVL526Jec1TVIaHRLAUx7OruO8jRIKlA5wqt8Q=;
        b=p/jfRaNPQGaoJd3ujqaeLDuUP7t0WkHa2oZwiGdpehhESyVFAOdOmg0fusWkZ2XuJJ
         Yw6K8nYA6/5N6tLufuYh20gi7M7wxwYV1IodMymMAu3e2vjlzp/s4l9Vf7kZibjxovMR
         cghNEQkYGyGSVWGuIAzI28gyVhrT8GgnWs6YLc4dnuPB71AZU/a5qfpWgaMEJ0Qfl1S+
         OG2NEJp7fE32TkPWsKahDfFv2MiE7qQWnDtWKvNsVMNbEDAHg0y2Zsbd1R1MkIpv2dly
         3HDaLyPuLXfOS4PxJXenmM3XNPnXJ5LYctnHIHC9Ub4peO/zkx0GIKpeh+s1nuyRNP2C
         xoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764801; x=1684356801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tniPUuVL526Jec1TVIaHRLAUx7OruO8jRIKlA5wqt8Q=;
        b=RXSzlDVDp9GAnJ0ctVg9awL6SoPyzX189c5hWSOfZ1gouNsvraOd8BaY096yCvgjLA
         IRieFiDaKgIEoS9amL0e/lSTybqxfMlX6NFFaLU4HrULo/F2FfVAQupk6w0POeuHcV7t
         yCV2fk41c/YMWB8HbdYvpURb8bp/QTolzTlBNYk194PfkqD1b2b+ADQ1yLlEDH47Lb+O
         8IaebtcG+xnT1HPGOZI0cnhYFY0jbwHyKiJy3Ym6NgQDjnHrXjDBlTsS+i6zsxrQqdRN
         v050sg+hKjBHRrhOjcpAGim9VsRGiqnadalHuPPmqOD9Tw+iMsZHK11mLpq/VeUoQ72T
         41gw==
X-Gm-Message-State: AAQBX9dfUHOTrSpzqcBzdcnRGorwvBydy+bsmkDRbh7fhkn6ShA2UjGb
	4xYJnVd5Yylmf2TVyRt3OeLbnojwnPM6HQ==
X-Google-Smtp-Source: AKy350YG/84D/pba4O2jep64IWrC+mjA+ueyHqImP8NgwjI0qVBUMRNq8Z2uYJzIP+ywt0PW/sWA2w==
X-Received: by 2002:a17:90a:8048:b0:247:78c0:125e with SMTP id e8-20020a17090a804800b0024778c0125emr8083390pjw.15.1681764801496;
        Mon, 17 Apr 2023 13:53:21 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:21 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:41 -0700
Message-Id: <20230417205048.15870-27-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ed868f4c0ca9 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		ptdesc_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.39.2

