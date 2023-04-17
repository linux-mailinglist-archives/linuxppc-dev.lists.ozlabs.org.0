Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BD56E7851
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:16:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dWf16Slz3g2T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:15:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Xg6P0Upa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Xg6P0Upa;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQh02xrz3cjM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:53:15 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id v21-20020a17090a459500b0024776162815so6440864pjg.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764794; x=1684356794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=Xg6P0UpaqLjmTr9GC8q8FEqPaWuvWAOVoK//8dKOM2wu82xE/PCXSYeAATRXUJ/HKh
         6EEKIr46u43LbmKVnfil2W4E6LUnTir89HhCdDllvASzF+yevHo7MjwPE9+XRv+3hhES
         OUUsnstcNrA0rLCFMYj7vWl5ZczSf3KPYpA7wTt20fxP/HKu0nYQRIzVhW6nrnGOA5jn
         ZX8zcSMK8Y+FlG/fX2gye51alnw5R0vQJIqmi3wnRTlMtqWonWHxJepWd7O0uYkErLAf
         nElaONPL6snfMupRjx7SgoPL0fo06TUuoxc3sYPVOppMWFUfAwgvDIOHO8Ugh+LFqXUj
         IYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764794; x=1684356794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=BY9Htg2cL/ZLrjCTcBtipnbTMAcHSrn1PfDDFAT3l35YecEU3/lpo1R7SubQwgp6NW
         D/IxuA28fWzFu9pWjVnUfgNhPEqVeE+E8oxR+VXa365NDp1xgU5143D1w5R/AuUDsCBG
         gjydmJ1A3xAk+cN3bEhJ+LV7Le0qSP/C+u571fUJ39UCD2mZLC/mh7rqFEe7z263yvqd
         3ruKbvryODYOq2yCixsaOudPFjTIJ4pX5tFQq25neGUstLB399O67YWKTwKHQ8OyDqnC
         NZFU34nDQo9cM4ODbgcfgLYTtk0DXoWHCtpZ3k6DE+izDk05ud5fSVbxxQndkMbLqj89
         Uskg==
X-Gm-Message-State: AAQBX9fnRTFXdJWCRhRAsDivP4lecDNJsaYrhkrR2pXlZbKIkOcTJULI
	RzyN9ka6aSj14tcyDEyssMw=
X-Google-Smtp-Source: AKy350Ym3GSROxWd30N3vnOcQ+scJJk4j2bn57g6f2y/wdjBz5ko3J6EyTomKSlBO1Xk2XiBoSAe7w==
X-Received: by 2002:a17:90a:5315:b0:23f:81c0:eadd with SMTP id x21-20020a17090a531500b0023f81c0eaddmr15717621pjh.47.1681764794292;
        Mon, 17 Apr 2023 13:53:14 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:14 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 21/33] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:36 -0700
Message-Id: <20230417205048.15870-22-vishal.moola@gmail.com>
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
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..af26f1191b43 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	ptdesc_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.39.2

