Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5088E87B3E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:50:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fIMqQGEx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vp/zrh0G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw42T0gpfz3vYf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:50:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fIMqQGEx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vp/zrh0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yX6BFpz30h5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OThRyXZFMjugEtcpgf//pX/PpGcoxbD3wNFnQts0Kco=;
	b=fIMqQGEx7JahvBljYuTF07tYd+XLr9HWTV/fi1zK8Okvt16UUiPMwAsIvjUKXikDCDP+p/
	u3L6tOIpNjQUg4AphC8FJZt+TxkQp9JZA4vfpvB4RsZXIy5ZDlxWBcbQKvX3HJ/iQ54QFQ
	Ms449FA8/sFx0GEjrJKAqROpDnepGGw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OThRyXZFMjugEtcpgf//pX/PpGcoxbD3wNFnQts0Kco=;
	b=Vp/zrh0GVeIWkTnxTS8fV9xUr5NaYZVfCQ+9kEu3o+CkJ+X4OQxuFOUMHL3IYzEFwWqN1K
	ut94Qr47WQsoijxkJBX4/LryMjBU7pltI5VBF4CJsIe4d6eIIkZtbJBMSCHTIpcNibedjX
	mavMaMkC8jGi89NfraqUty8N4i6USX0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-tZ-lUlwCNqG2Mt_EVjuoCQ-1; Wed, 13 Mar 2024 17:47:26 -0400
X-MC-Unique: tZ-lUlwCNqG2Mt_EVjuoCQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-691455cfa84so151376d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366446; x=1710971246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OThRyXZFMjugEtcpgf//pX/PpGcoxbD3wNFnQts0Kco=;
        b=iXJOsdNlROgZI6FBM6ZFFsye6YEt/ymOfXpaIIokWU5L+jJYW8ylv1bmRXrQQdARBe
         W8/LEG4PWl6XQtN7Sgyk/ECcUQy+eFuoNjIsdQvnIUHEa1BbyWgP99DdVfg88JDvZga9
         hmSatwJiq6Iw7fYOM+QECbusQK6saT34D84KbeNCQ+b5iWAmWRbTA3ZfSo4fWKAd/hPR
         rYRQVEbEGV+7KfEcJ3ZUXwnMil1Mp9wWmx1edboa4826xB1NtOq+bJfEei9Y9BuInc+7
         BYjnjsXCr5vnI2Alb20ZRPSZmNFu4e042uHEdRwLjX3SErqVYvMZAuwKd+BWdoHaE3bS
         N5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUIFzbFqtrIO5LS0xMWTrjozzHz86PA/YKreRptC9cn21k42D8oIFvdHSbgr/3Kc2S71IJaYTBlZHYVxwcLpodHAG6lUh8ZxTwb3iapQ==
X-Gm-Message-State: AOJu0YzapIIPaMD+F757uv2LpkeDoAzFsRmmPyML+wcBqImIT3eZbr3H
	dAHeWRWVgku1dfIFeetRAi/JEFb0ISka6mDua3lRYcYTLzsz6/gV+XMB8laMdiKciDhLRpGJNVV
	ebLv9Xj4qqeiDr+JvSLuvNFIXuwBpF5NRB15FgQLbX7PcCxVlIZUlK99fO6aXcYE=
X-Received: by 2002:a0c:f508:0:b0:690:b02c:2a5f with SMTP id j8-20020a0cf508000000b00690b02c2a5fmr13464365qvm.4.1710366446016;
        Wed, 13 Mar 2024 14:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXIxC5CVGnx+p2qd8ZmV2KZnCoGCjWGy3mEq+yzfnYrTYJ2FsP7C7aom0bl0ipU8C23yK/Aw==
X-Received: by 2002:a0c:f508:0:b0:690:b02c:2a5f with SMTP id j8-20020a0cf508000000b00690b02c2a5fmr13464349qvm.4.1710366445605;
        Wed, 13 Mar 2024 14:47:25 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:25 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 03/13] mm/gup: Check p4d presence before going on
Date: Wed, 13 Mar 2024 17:47:09 -0400
Message-ID: <20240313214719.253873-4-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Currently there should have no p4d swap entries so it may not matter much,
however this may help us to rule out swap entries in pXd_huge() API, which
will include p4d_huge().  The p4d_present() checks make it 100% clear that
we won't rely on p4d_huge() for swap entries.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 69a777f4fc5c..802987281b2f 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -776,7 +776,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 
 	p4dp = p4d_offset(pgdp, address);
 	p4d = READ_ONCE(*p4dp);
-	if (p4d_none(p4d))
+	if (!p4d_present(p4d))
 		return no_page_table(vma, flags);
 	BUILD_BUG_ON(p4d_huge(p4d));
 	if (unlikely(p4d_bad(p4d)))
@@ -3069,7 +3069,7 @@ static int gup_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr, unsigned lo
 		p4d_t p4d = READ_ONCE(*p4dp);
 
 		next = p4d_addr_end(addr, end);
-		if (p4d_none(p4d))
+		if (!p4d_present(p4d))
 			return 0;
 		BUILD_BUG_ON(p4d_huge(p4d));
 		if (unlikely(is_hugepd(__hugepd(p4d_val(p4d))))) {
-- 
2.44.0

