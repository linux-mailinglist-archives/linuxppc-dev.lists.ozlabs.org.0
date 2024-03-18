Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 937E887F0F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:09:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C048UWpS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C048UWpS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5YW2Zxmz3vZQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:09:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C048UWpS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C048UWpS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5RB1Xl1z3d2g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C+lWpN1qDfU+nymiqOVXkY7IqPiijqTb8F5rFjpmTU=;
	b=C048UWpSS9DFNweZrO+WEobrvsPYFW7Ejy5yDvVggdSucJW1FUW0BuJXOV80rWVpTcRytS
	Jce+QwQ5FwsnAlG6a6tIsTn0bKkUXRlS6GoBovBgCkiM8JEY0JE+UYTX+9PbbzuzmcmDWq
	jk/tP0gdeCtshOLKjg2KmY31LhdNNKY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C+lWpN1qDfU+nymiqOVXkY7IqPiijqTb8F5rFjpmTU=;
	b=C048UWpSS9DFNweZrO+WEobrvsPYFW7Ejy5yDvVggdSucJW1FUW0BuJXOV80rWVpTcRytS
	Jce+QwQ5FwsnAlG6a6tIsTn0bKkUXRlS6GoBovBgCkiM8JEY0JE+UYTX+9PbbzuzmcmDWq
	jk/tP0gdeCtshOLKjg2KmY31LhdNNKY=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-rcWdIBVzNd2zcdbUJ5DXVg-1; Mon, 18 Mar 2024 16:04:17 -0400
X-MC-Unique: rcWdIBVzNd2zcdbUJ5DXVg-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dde25ac92fso2115189a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792257; x=1711397057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C+lWpN1qDfU+nymiqOVXkY7IqPiijqTb8F5rFjpmTU=;
        b=pNhLNcan24HBf3G+pbEChKxcNF+P/Z8Igw7YLYfaEdyPfiwo2vuVZAi569oEbb/An6
         27OxGRYL0LgYQK5r57XWF7AExxK0NGCLSeLi/t71e3V9PX4wj4c1GKnPH2ihw/OhLAZq
         xKUoqlBJ09WTjxz2Ff5Tbj5dysrO4BwwjO2X8pOZyMwEVDFQU7ekGcoo3KbK3Z8+zGQ+
         oUfOSh4U0uoj4869lOrH8x7Vv8Re+s/KDpiKl2ZIthjpwQ4WuXstuMo3RY0Y/i7MPYpq
         D9yex9VUgnTmMi1mBVEw6f5zU9Oe1WdbFFzL522zFQpFtwMrIZIe5hA7rk9fCTm01VWW
         gvGg==
X-Forwarded-Encrypted: i=1; AJvYcCUiVahHLYS54kYyT5OI2vR3URCwhFSbKezaXKaPeIsXR5/CgSJpKWO4Ex0e1LeBuCuqOGOubG2La3debu9FJYmHqs6sunI01ujAk+exBg==
X-Gm-Message-State: AOJu0YxZ6k52An2IwBr+67RTOABmi0Y0R0FzPzweJrXyR27Fa5lmaCx+
	MjPRo9Bm14QrDbEDJFcsm03MTA65yvfLVjbpKfCpJtP9zTwYFIcbiEwArMXgn66au7J0KrFDYe6
	rR2Ymdvi+TRh+xu68dXloJQe2aY9V2QoFIRadKtJ0FIsEconfXvEkkTknRiWxGHU=
X-Received: by 2002:a05:6830:33eb:b0:6e5:14d1:54bc with SMTP id i11-20020a05683033eb00b006e514d154bcmr11071074otu.0.1710792257076;
        Mon, 18 Mar 2024 13:04:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa6+F4MLCWW6AG4iEABFfgYmZgzy20NeyXKIcAPU+wG9nL9kvLpyVpLWIkaaqT6A2sxlc6og==
X-Received: by 2002:a05:6830:33eb:b0:6e5:14d1:54bc with SMTP id i11-20020a05683033eb00b006e514d154bcmr11071025otu.0.1710792256645;
        Mon, 18 Mar 2024 13:04:16 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:16 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 07/14] mm/arm: Redefine pmd_huge() with pmd_leaf()
Date: Mon, 18 Mar 2024 16:03:57 -0400
Message-ID: <20240318200404.448346-8-peterx@redhat.com>
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

