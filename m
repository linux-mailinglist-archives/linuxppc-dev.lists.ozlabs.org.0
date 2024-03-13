Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908AC87B3F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:52:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eTU2Wm1N;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eTU2Wm1N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw4442JN3z3dXh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:52:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eTU2Wm1N;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eTU2Wm1N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yd1bPSz3cGL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXv9WADGZnpW9LG755UO1HRR+yBh/xYRmZG+iRDILn4=;
	b=eTU2Wm1N8XO7TUN2KuoFYlGsr3XZAShQ0DkuZ5/PS8H6YupQDwNA75BH6tQQ0AbWXsP6hJ
	Yx1mrfp4jJ0try7Tw5ZEmTwfchAL77qVCNsNCS6506Juj+pidIlbehOfOPuzd8GPOHyEq/
	DbjnL7xdcPNa4o5hoNiVW122juAwZX0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXv9WADGZnpW9LG755UO1HRR+yBh/xYRmZG+iRDILn4=;
	b=eTU2Wm1N8XO7TUN2KuoFYlGsr3XZAShQ0DkuZ5/PS8H6YupQDwNA75BH6tQQ0AbWXsP6hJ
	Yx1mrfp4jJ0try7Tw5ZEmTwfchAL77qVCNsNCS6506Juj+pidIlbehOfOPuzd8GPOHyEq/
	DbjnL7xdcPNa4o5hoNiVW122juAwZX0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-odH-O18wMQOty_kFaZ_eyg-1; Wed, 13 Mar 2024 17:47:31 -0400
X-MC-Unique: odH-O18wMQOty_kFaZ_eyg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-690d3f5af86so1063786d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366450; x=1710971250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXv9WADGZnpW9LG755UO1HRR+yBh/xYRmZG+iRDILn4=;
        b=kq7HeCmcK4+wzPYA3DGa6eCFt0fttay85FBr8knscmSnsV2N2esZIx1OiGB+cUhsE4
         QhFSdNvmUwX4BTOxfbDu5rJVk7cvTDt3irGcjJWtt9WR8ayxeZlhlJfH5/nhlz30yVvb
         PP+z3DuhLVlcubYKVd6bnrHW4kYUflD6TctuqMPRw27jStrc/F0UCERaaofc29mqZ/Mi
         L+PjWbMwRlbGmA+Ihqe14NnWiTNYJKFDwBC6gGCrPg9vuuR2NiS1dcW6euO4sh/nmYn8
         LEH2gtgKbjGnDgkmQUA26fC9KK6NUAoLalWIjZPyDZhzIWBb34yO2nnO/OR0DJzsMtCg
         koaw==
X-Forwarded-Encrypted: i=1; AJvYcCXsslc7PXtRfcIAR1e+YXN+twvmH2fzjdAm73ZhMLyXBdtQwBn+GoJysfpxEz1Sc+O57H67G0KVS3PKTyFd+vC7gBJG4aTv8bjJe+7x7w==
X-Gm-Message-State: AOJu0Yw34BXmL9l7txWRsWy7UmOSFdi3IZD3/klR2MAwQsQRFf5g1+eM
	u3Jh2oLW2hrRTtJwU8RoflMRghzx7F0++9umDy24o0X9APWxf9r0CiwG1gJ8Jf/79huRbE9VqvS
	U/anXjyBbyOT5ZfxVAoI5X+BEWJDcH3YAU4sNM3reoQcI2xPVkUrzWOLLTKWERbA=
X-Received: by 2002:a05:6214:ca1:b0:690:ca31:f070 with SMTP id s1-20020a0562140ca100b00690ca31f070mr2870228qvs.2.1710366450585;
        Wed, 13 Mar 2024 14:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7R1Abf8N+n3Ay4Ttv5JPf4Xs41/taFQJ/1rB/5tSFgWpT6oJW7WbEayo47shzOXV0M53hEQ==
X-Received: by 2002:a05:6214:ca1:b0:690:ca31:f070 with SMTP id s1-20020a0562140ca100b00690ca31f070mr2870205qvs.2.1710366450230;
        Wed, 13 Mar 2024 14:47:30 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:29 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 06/13] mm/arm: Use macros to define pmd/pud helpers
Date: Wed, 13 Mar 2024 17:47:12 -0400
Message-ID: <20240313214719.253873-7-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313214719.253873-1-peterx@redhat.com>
References: <20240313214719.253873-1-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Jason Gunthorpe <jgg@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, peterx@redhat.com, Fabio Estevam <festevam@denx.de>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

It's already confusing that ARM 2-level v.s. 3-level defines SECT bit
differently on pmd/puds.  Always use a macro which is much clearer.

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
 arch/arm/include/asm/pgtable-2level.h       | 4 ++--
 arch/arm/include/asm/pgtable-3level-hwdef.h | 1 +
 arch/arm/include/asm/pgtable-3level.h       | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index b0a262566eb9..4245c2e74720 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -213,8 +213,8 @@ static inline pmd_t *pmd_offset(pud_t *pud, unsigned long addr)
 
 #define pmd_pfn(pmd)		(__phys_to_pfn(pmd_val(pmd) & PHYS_MASK))
 
-#define pmd_leaf(pmd)		(pmd_val(pmd) & 2)
-#define pmd_bad(pmd)		(pmd_val(pmd) & 2)
+#define pmd_leaf(pmd)		(pmd_val(pmd) & PMD_TYPE_SECT)
+#define pmd_bad(pmd)		pmd_leaf(pmd)
 #define pmd_present(pmd)	(pmd_val(pmd))
 
 #define copy_pmd(pmdpd,pmdps)		\
diff --git a/arch/arm/include/asm/pgtable-3level-hwdef.h b/arch/arm/include/asm/pgtable-3level-hwdef.h
index 2f35b4eddaa8..e7b666cf0060 100644
--- a/arch/arm/include/asm/pgtable-3level-hwdef.h
+++ b/arch/arm/include/asm/pgtable-3level-hwdef.h
@@ -14,6 +14,7 @@
  * + Level 1/2 descriptor
  *   - common
  */
+#define PUD_TABLE_BIT		(_AT(pmdval_t, 1) << 1)
 #define PMD_TYPE_MASK		(_AT(pmdval_t, 3) << 0)
 #define PMD_TYPE_FAULT		(_AT(pmdval_t, 0) << 0)
 #define PMD_TYPE_TABLE		(_AT(pmdval_t, 3) << 0)
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 4b1d9eb3908a..e7aecbef75c9 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -112,7 +112,7 @@
 #ifndef __ASSEMBLY__
 
 #define pud_none(pud)		(!pud_val(pud))
-#define pud_bad(pud)		(!(pud_val(pud) & 2))
+#define pud_bad(pud)		(!(pud_val(pud) & PUD_TABLE_BIT))
 #define pud_present(pud)	(pud_val(pud))
 #define pmd_table(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
 						 PMD_TYPE_TABLE)
@@ -137,7 +137,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 	return __va(pud_val(pud) & PHYS_MASK & (s32)PAGE_MASK);
 }
 
-#define pmd_bad(pmd)		(!(pmd_val(pmd) & 2))
+#define pmd_bad(pmd)		(!(pmd_val(pmd) & PMD_TABLE_BIT))
 
 #define copy_pmd(pmdpd,pmdps)		\
 	do {				\
-- 
2.44.0

