Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CA87B3F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:53:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bazvJyk0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bazvJyk0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw44t57J1z3vqg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:53:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bazvJyk0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bazvJyk0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yd2fSHz3cTT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C+lWpN1qDfU+nymiqOVXkY7IqPiijqTb8F5rFjpmTU=;
	b=bazvJyk0oolsrXSnKJxFyuKnq+sgMqHpudvV3rD22w5lAsIl5Kmgi8N4d8fCmM6XNTQgt+
	Mx3x1NgJLEBHB9xeQzI2zjTyAZWYTqU/8eJCiuUxaUjdIgVlscuQ8OrTPOFdW03B23O7wp
	8Avnw21tdHOcjtGVTlEg/X4vwao5XlM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C+lWpN1qDfU+nymiqOVXkY7IqPiijqTb8F5rFjpmTU=;
	b=bazvJyk0oolsrXSnKJxFyuKnq+sgMqHpudvV3rD22w5lAsIl5Kmgi8N4d8fCmM6XNTQgt+
	Mx3x1NgJLEBHB9xeQzI2zjTyAZWYTqU/8eJCiuUxaUjdIgVlscuQ8OrTPOFdW03B23O7wp
	8Avnw21tdHOcjtGVTlEg/X4vwao5XlM=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-V_wBa8dxORywEaud--x1Kw-1; Wed, 13 Mar 2024 17:47:32 -0400
X-MC-Unique: V_wBa8dxORywEaud--x1Kw-1
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-7da965e700fso36739241.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366452; x=1710971252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C+lWpN1qDfU+nymiqOVXkY7IqPiijqTb8F5rFjpmTU=;
        b=tyx7rn5sG24Caj1bjIs1eC3iJiRwaF4QnA/07NoNmCLp2++99uE9PG91ARZw1wRXmv
         qreiwwlsPxvm/VW5/27iXuI5AmYch1PTuAUAMhvL9Z8TgltgPTN616YNem7N+q/h9pCn
         qnHrbiHwBFjZyYAPKf05OL8d5XFd8ot79oIdxjcJQlYxq2Nm/YDCdRrlNv/mCLrc/GHr
         Kp+qJc29bPQU32N+GGytAwwhBh2tLHHqNmQJSZaZIKTqOW1SSgGw0NIYx26gmP0zW2TY
         kcwUVc8BoIpWntJtM6Spfavzn1p5tz4eKy77URRaS3hegNBWv9rN1xGNeJR/yi7fO+I8
         fgqA==
X-Forwarded-Encrypted: i=1; AJvYcCUvU6dz7uHfLLP3GyKP6yZdCNxG7p5RWMUgHsQ8gzv1RVjpZbio5TMBJo0HTDRf08vPd+uq+u+syY5c2HalLcDduD6LEG/J2pIDGIquRg==
X-Gm-Message-State: AOJu0YySjV4YOlTs8GFyKd+Q22ZA+lsoV2CX4FJlJBkOtRif8g8ebnXA
	idCVEY51VL6x1QEGH2QsS90NfuYZgRCQur11IhAm9+PobtZcu5Sn2u0jdFfKIXy5RiO2r3stH8Z
	uIRyVVA/SqaHNB14E6Q83Tp3c1Cu7L1nu8/bB9gAlbMzkujEDzM6dsOwvyIPLSc8=
X-Received: by 2002:a05:6102:22c3:b0:474:974a:9262 with SMTP id a3-20020a05610222c300b00474974a9262mr178629vsh.2.1710366452195;
        Wed, 13 Mar 2024 14:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHbMJFgovzI2kAdigpD7SPTonoPokqIJ0+3R0neH2rsizaH6LOW92IcmRgIzS4nmmpWup5Ig==
X-Received: by 2002:a05:6102:22c3:b0:474:974a:9262 with SMTP id a3-20020a05610222c300b00474974a9262mr178595vsh.2.1710366451805;
        Wed, 13 Mar 2024 14:47:31 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:31 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 07/13] mm/arm: Redefine pmd_huge() with pmd_leaf()
Date: Wed, 13 Mar 2024 17:47:13 -0400
Message-ID: <20240313214719.253873-8-peterx@redhat.com>
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

Most of the archs already define these two APIs the same way.  ARM is more
complicated in two aspects:

  - For pXd_huge() it's always checking against !PXD_TABLE_BIT, while for
    pXd_leaf() it's always checking against PXD_TYPE_SECT.

  - SECT/TABLE bits are defined differently on 2-level v.s. 3-level ARM
    pgtables, which makes the whole thing even harder to follow.

Luckily, the second complexity should be hidden by the pmd_leaf()
implementation against 2-level v.s. 3-level headers.  Invoke pmd_leaf()
directly for pmd_huge(), to remove the first part of complexity.  This
prepares to drop pXd_huge() API globally.

When at it, drop the obsolete comments - it's outdated.

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
 arch/arm/mm/hugetlbpage.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/mm/hugetlbpage.c b/arch/arm/mm/hugetlbpage.c
index dd7a0277c5c0..c2fa643f6bb5 100644
--- a/arch/arm/mm/hugetlbpage.c
+++ b/arch/arm/mm/hugetlbpage.c
@@ -18,11 +18,6 @@
 #include <asm/tlb.h>
 #include <asm/tlbflush.h>
 
-/*
- * On ARM, huge pages are backed by pmd's rather than pte's, so we do a lot
- * of type casting from pmd_t * to pte_t *.
- */
-
 int pud_huge(pud_t pud)
 {
 	return 0;
@@ -30,5 +25,5 @@ int pud_huge(pud_t pud)
 
 int pmd_huge(pmd_t pmd)
 {
-	return pmd_val(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
+	return pmd_leaf(pmd);
 }
-- 
2.44.0

