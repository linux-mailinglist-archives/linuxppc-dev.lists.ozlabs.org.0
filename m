Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F587F101
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:14:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B6o8mPGZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B6o8mPGZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5fV3CQ0z3w6w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:14:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B6o8mPGZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B6o8mPGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5RP2vf2z3dSj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXDMCLhq+SpXi29RlzCNqEUhIAFpzfV1ImIXAFsvuS0=;
	b=B6o8mPGZAywSLNnVx1wf8uB8J2Qi0hm7+sL992HCsi3nMSIwlIUeHOWhN0YSA3kEe6TMOy
	GWeguzk/pUcFIcy3GpY/HCQ0Qrx480cTznfd7Qs63cXajGuZiHp0+leOpVwEFNchEFinke
	0aYrB9bQSDalyEhMbmjuDRqM0VU3b8Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXDMCLhq+SpXi29RlzCNqEUhIAFpzfV1ImIXAFsvuS0=;
	b=B6o8mPGZAywSLNnVx1wf8uB8J2Qi0hm7+sL992HCsi3nMSIwlIUeHOWhN0YSA3kEe6TMOy
	GWeguzk/pUcFIcy3GpY/HCQ0Qrx480cTznfd7Qs63cXajGuZiHp0+leOpVwEFNchEFinke
	0aYrB9bQSDalyEhMbmjuDRqM0VU3b8Q=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-D3N1NW_vM-qvh1JtndAjbw-1; Mon, 18 Mar 2024 16:04:27 -0400
X-MC-Unique: D3N1NW_vM-qvh1JtndAjbw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42f30752eb4so15657081cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792266; x=1711397066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXDMCLhq+SpXi29RlzCNqEUhIAFpzfV1ImIXAFsvuS0=;
        b=qx0jGXnx0x5f0+gBju4oIcmOKscglYWdvcuC+430brA5BwFq7r8+5+9VfLrfbX43+S
         ZHhh2ZkziPAPjxrH0LdwX3SZzRGfZ9gMjagGqah83DKh+JiM7Q8uVgM05HbmTQR0xskh
         KKZj8N7ZDbH22gaReX+gu3dP+rZvaU+acilpGtdPWt9FFWDMJg5SyCO26zM70wNhffHn
         MqGF7qPPt1e0Um3YiRuLv8OZn0S+Bo46zKMr8kCqPXJTh8l+y5wYyjGKTUL5Yp5vcJk/
         g+wYsXLZXt5sw1YBBp1cEBdke8FkDOv4Hc3n8cP7j9L/Z6YIn7FPRrDCOPkAQfIStqKc
         6y/w==
X-Forwarded-Encrypted: i=1; AJvYcCV59BRjEK4PCkVaI0pQ87rq6uRnQhBlg4+21ZhM/eeVj4IiRa1oB7Mguo5+kiQw5eQbG3W49PYgH3sC9JOntTjFnmBVOt7OMpNESMM0bQ==
X-Gm-Message-State: AOJu0Yw9fGqcRXpN6FReVFi9t/Jl8tw1cOrOZBUsGycgbAec0jhWG6ma
	oetLbrn4aNdMiQ7mXfxBZ8siLQW8mbvEVcrKE38sEwyg2XMswQBlWIqVTQEnvPXsACiL9qgpJPb
	FvfFaxGL0jK6zTI18CsFCKyRTi9jjag4RrIKdyWizVUmkx/olRTYSd0RZ+m/oB/0=
X-Received: by 2002:ac8:5f91:0:b0:430:c2dc:a5ef with SMTP id j17-20020ac85f91000000b00430c2dca5efmr447844qta.2.1710792266520;
        Mon, 18 Mar 2024 13:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBYHTFmkqNiU+ToXou6wXh4FVDhWI9gJPxxfj+3GqwNDwAz7q/kbYXHDobvjaQIuNomZFyOQ==
X-Received: by 2002:ac8:5f91:0:b0:430:c2dc:a5ef with SMTP id j17-20020ac85f91000000b00430c2dca5efmr447812qta.2.1710792266091;
        Mon, 18 Mar 2024 13:04:26 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:25 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 13/14] mm/arm: Remove pmd_thp_or_huge()
Date: Mon, 18 Mar 2024 16:04:03 -0400
Message-ID: <20240318200404.448346-14-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318200404.448346-1-peterx@redhat.com>
References: <20240318200404.448346-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Bjorn Andersson <andersson@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, peterx@redhat.com, Fabio Estevam <festevam@denx.de>, Jason Gunthorpe <jgg@nvidia.com>, Mark Salter <msalter@redhat.com>, sparclinux@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

ARM/ARM64 used to define pmd_thp_or_huge().  Now this macro is completely
redundant.  Remove it and use pmd_leaf().

Cc: Mark Salter <msalter@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Fabio Estevam <festevam@denx.de>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/include/asm/pgtable-2level.h | 1 -
 arch/arm/include/asm/pgtable-3level.h | 1 -
 arch/arm/lib/uaccess_with_memcpy.c    | 4 ++--
 arch/arm64/include/asm/pgtable.h      | 2 --
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index 4245c2e74720..6b5392e20f41 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -241,7 +241,6 @@ static inline pmd_t *pmd_offset(pud_t *pud, unsigned long addr)
  * define empty stubs for use by pin_page_for_write.
  */
 #define pmd_hugewillfault(pmd)	(0)
-#define pmd_thp_or_huge(pmd)	(0)
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 9e3c44f0aea2..fa5939eb9864 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -190,7 +190,6 @@ static inline pte_t pte_mkspecial(pte_t pte)
 #define pmd_dirty(pmd)		(pmd_isset((pmd), L_PMD_SECT_DIRTY))
 
 #define pmd_hugewillfault(pmd)	(!pmd_young(pmd) || !pmd_write(pmd))
-#define pmd_thp_or_huge(pmd)	(pmd_leaf(pmd) || pmd_trans_huge(pmd))
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_trans_huge(pmd)	(pmd_val(pmd) && !pmd_table(pmd))
diff --git a/arch/arm/lib/uaccess_with_memcpy.c b/arch/arm/lib/uaccess_with_memcpy.c
index 2f6163f05e93..c0ac7796d775 100644
--- a/arch/arm/lib/uaccess_with_memcpy.c
+++ b/arch/arm/lib/uaccess_with_memcpy.c
@@ -56,10 +56,10 @@ pin_page_for_write(const void __user *_addr, pte_t **ptep, spinlock_t **ptlp)
 	 * to see that it's still huge and whether or not we will
 	 * need to fault on write.
 	 */
-	if (unlikely(pmd_thp_or_huge(*pmd))) {
+	if (unlikely(pmd_leaf(*pmd))) {
 		ptl = &current->mm->page_table_lock;
 		spin_lock(ptl);
-		if (unlikely(!pmd_thp_or_huge(*pmd)
+		if (unlikely(!pmd_leaf(*pmd)
 			|| pmd_hugewillfault(*pmd))) {
 			spin_unlock(ptl);
 			return 0;
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c4efa47fed5f..a580068a6564 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -512,8 +512,6 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 	return pmd;
 }
 
-#define pmd_thp_or_huge(pmd)	(pmd_leaf(pmd) || pmd_trans_huge(pmd))
-
 #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
 
 #define pmd_mkhuge(pmd)		(__pmd(pmd_val(pmd) & ~PMD_TABLE_BIT))
-- 
2.44.0

