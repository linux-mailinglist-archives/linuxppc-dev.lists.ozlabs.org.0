Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F1987F0EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:09:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UvAC3mlJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eum48Owf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5Xb0gm2z3vpr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:09:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UvAC3mlJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eum48Owf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5R913rGz3dRr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXv9WADGZnpW9LG755UO1HRR+yBh/xYRmZG+iRDILn4=;
	b=UvAC3mlJJCSOHNU5MD1NjSKMPmJAP7m+zAHZMj4VIQ7DR16FAGGCcRNf8Ky8MK1wlAZepj
	EkolWP9ryJTHkDDwvA3O+94HW0nLPdiqpZpV8YRInFUxA5rii2guOKPiSJkPq7s+mmRN+G
	1Y/CoYQNOCL/cc98X8ADKQ08KNQtAok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXv9WADGZnpW9LG755UO1HRR+yBh/xYRmZG+iRDILn4=;
	b=Eum48Owf+RSpdsb/v95mPuifFkLTBgfdm7wZ69xn/RjfW8zCu6GZmtA8lVEkcTupA3f2bx
	QQ98bW112LqIWDPSL9dS4sGZS5fIBaRHcCu7AjYy7/2YrqpyQjYcDZlongJ5lVlygDwjF0
	HpmhHiacqabqVvgmuUQVzCzd8zYJ1vA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-SL-1eCpGP8WWDX4_joN8vw-1; Mon, 18 Mar 2024 16:04:16 -0400
X-MC-Unique: SL-1eCpGP8WWDX4_joN8vw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-430b4572a97so17523421cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792255; x=1711397055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXv9WADGZnpW9LG755UO1HRR+yBh/xYRmZG+iRDILn4=;
        b=HvGlbV28n0625E8b/lIkUstltGEiWc2m7r7pm00Bk88KD/kLkJl+LfYPCO4X7zy4gu
         HULe4CqqsjRyTQkinbLqtwH2V7TStwFhxhZE31QTW+oo4g0sTperGjPNbjDEkb4doMbH
         GQAVEi2CL2bRSXzjUL3E6KxrRefnk71WRbg1wYV4WAeFkbKU28nSWy+FZnQRh/YoypHB
         OUJMwMsYe1DRg5v8UNPGlTTReL6GRYlbT2JfSOQ9Qur38KUELqeWVP++eQkGL41a2i7m
         cf6TnlIjfhJ04kTjE4KveWuCjctjwVsf1/7ug84IXwhLx1ta6I7bwGNsN4YK2+Z2bX0/
         9YBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkOZhVLWRyG0y4b3ewibTJjlPFzokhjjziAeiYS9/ma1UNFW/dLHauYw7LEZBkxPsVANM3Q4E5Kgb1B2NlQ1IRADIoLoP+btmpBsweVQ==
X-Gm-Message-State: AOJu0YzmrBWFcfpL8t+YWzFYn0EGxHYiwDAgGpRNwQDi3VfrkBS/XMHC
	VplKwjdo7eEySx4tZrcWm0S/EdsPW5fOf4rEQ9oWYSnxaH9uzwTNZFaJKN/Msy/uZ95zqaacktg
	JZUQGVQiyoimogJrQSnJ9k+A/A5IAkCRU4MfO9GIo+pqpxoNXeZKoVb2v02Nd1TM=
X-Received: by 2002:a05:6214:ab2:b0:695:c55d:fdf8 with SMTP id ew18-20020a0562140ab200b00695c55dfdf8mr6345891qvb.1.1710792255542;
        Mon, 18 Mar 2024 13:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM5if+BJ4z/wKMKgmRKGlctu1Y5Zn0gs2J/D1UPDtxcNZL4bpQ3QnCrk82omp9xwt5ITq/IA==
X-Received: by 2002:a05:6214:ab2:b0:695:c55d:fdf8 with SMTP id ew18-20020a0562140ab200b00695c55dfdf8mr6345849qvb.1.1710792254868;
        Mon, 18 Mar 2024 13:04:14 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:14 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 06/14] mm/arm: Use macros to define pmd/pud helpers
Date: Mon, 18 Mar 2024 16:03:56 -0400
Message-ID: <20240318200404.448346-7-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, peterx@redhat.com, Fabio Estevam <festevam@denx.de>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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

