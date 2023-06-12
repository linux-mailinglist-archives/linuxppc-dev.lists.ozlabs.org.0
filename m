Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95C72D338
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:25:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Hs3OvBwx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4Tg37TLz3c4G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:25:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Hs3OvBwx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg43105f0z30dp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:33 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-39ca48cd4c6so2440563b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603931; x=1689195931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFY2ToTc/KdsqBsJRwbv8KRLKHn/LK4ImlbTce4a9J0=;
        b=Hs3OvBwxjNbzyixj7aSD+NgtYC45wE004i2+DhLM32gwxSgyME8uf0ehUc+DFmEBWc
         xTMw6H3P+HY7Tq7UuCfgFLKB1x+LkNTK02YDaXYWD1PeR9EEokleZ/wyxNBXTFWH/El9
         c1bXL1i+QVcFD32llcBXIuwFJs/8j8fBCHPhcoBGFcfEu/JCwezOfmF0Yorw8OxgwAQW
         Ostw6KM5t1cwURmpaD0hTGMu4TC4wHA6I1gDTQyjBc+K/xsxhtlIAUhVsIG12sG34SnA
         HCLguPK5bJjFlDAoWGoj4Zr1Q8mKdxu4vSYAJa+HTJDnQnTisEOZH/pEJVvGvXlWVYbR
         pDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603931; x=1689195931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFY2ToTc/KdsqBsJRwbv8KRLKHn/LK4ImlbTce4a9J0=;
        b=UutznkXXBSRJlbo7a7TNwknYoMykAPoPjo5Bzd/5keKVSmOet7LlJ86FexyemLURPf
         zZvWDctirKW5u56i2010kJ+xVzqXYhvWX2CMR+aEIOtY775HhdeboQw54dICkO7i718/
         ciwIpaOIkAGCBfQuSDH3FvB1kYweswmJCQjX2f4lgOkBIsiyXHbC8/sEmlZEGkQFtY5Y
         pWVAZUt1RpU/Uf+UDoxQLKk8YxOTBoETofwycaU/OydpoEqaRcUTVwk6anzwQlzX4iNf
         46wZbFJzcETZdXMV38zVAUSgEAldDlreg6+I+vqHHUg6WxcW/CMEuFK7S/dQG2NwU1BO
         RAYQ==
X-Gm-Message-State: AC+VfDwGzVNiYK1m5HJlut5QFS1m01bbGTK+uFAIfmHo38PSHspn/zD7
	d0tnf9bZwNhSDTFIGAP5iCk=
X-Google-Smtp-Source: ACHHUZ6j3CfgAuZNFN9JISmvDm/MlbHYE4sRUTkol2XKHwfWtbEYLS5pSkDxzuxqJ+njTa+59MBJKg==
X-Received: by 2002:a05:6358:1a8a:b0:129:bddf:7960 with SMTP id gm10-20020a0563581a8a00b00129bddf7960mr4783450rwb.16.1686603930823;
        Mon, 12 Jun 2023 14:05:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:30 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:11 -0700
Message-Id: <20230612210423.18611-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Guo Ren <guoren@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1

