Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61587F0DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:06:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H9WSofPm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H9WSofPm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5TR6WpGz3vdj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:06:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H9WSofPm;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H9WSofPm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5R20Ly3z3cPm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D9LYre9es5Pr/ZmF0ksBqg/v+REJVkPqwZxeVyu2sc=;
	b=H9WSofPmRGkqYfpr0CIOZPhF0qPkczJXvKMCEsoSlwPZT8Q+uaLj33Cyu8T4ZBMeUKZbul
	3Qqe3gwJc450yt0zNvT9hZhjRPA2R27pvFvGlh4nHw/v7irUVNnjyEbhpIO5sleNtREiAi
	Z2hfegWHL3c+hyFdaiVghPAjjw603CE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D9LYre9es5Pr/ZmF0ksBqg/v+REJVkPqwZxeVyu2sc=;
	b=H9WSofPmRGkqYfpr0CIOZPhF0qPkczJXvKMCEsoSlwPZT8Q+uaLj33Cyu8T4ZBMeUKZbul
	3Qqe3gwJc450yt0zNvT9hZhjRPA2R27pvFvGlh4nHw/v7irUVNnjyEbhpIO5sleNtREiAi
	Z2hfegWHL3c+hyFdaiVghPAjjw603CE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-CeqwlD7_PCmUdZt2KqVH3Q-1; Mon, 18 Mar 2024 16:04:09 -0400
X-MC-Unique: CeqwlD7_PCmUdZt2KqVH3Q-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-430c76df729so6672241cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792249; x=1711397049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3D9LYre9es5Pr/ZmF0ksBqg/v+REJVkPqwZxeVyu2sc=;
        b=WReg1scIx11sWA9Q+w+Gm/MldHN+kBU7OxqWRdq2fSEPd3SpLRbaH+Pj4isQkSvVpa
         1hQOfNCf3+ugbs4HRGK9EsvMAgjdPKXE8S6z0Wj1AYe6fF4ETGcWOVcUHMDSP54SGl/V
         5sR+qbAgF96r7et2SeS0v7bLlpslaJxBAIz8yZw6iGHJ8CXa0NHyLcByVUlWHxDf0Fbi
         LbRIPn10qoeIqQ0OwYPZ4hTZJHJzYP7FgxsIsuGcU7fQrEJ5dKDcAn4FB+KiO5AyJ5xp
         dN4JuMwUsGP8xtTHqOyE7ZrxHjKoNhtL/As/ayIdr//TVrfN8XFtTlfTlH57zO6Ve+PE
         9GdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrFdmBzgSSz0guWBSO9q259Nz0doF/0T35ZXL+Vszn/oufQm6kIxjhepxPVV+lgXJAJYKnV8wYl33df7FYvqagdR30/BlzI1XR0v3SYA==
X-Gm-Message-State: AOJu0YyAKijFL2N9n1tUJYtEgEAHvJQ8D8q72aKdL4z0cZlgNNtMaeSz
	gY2AtiDKkGsRUTrYwU1HsbflQ14YaDi84ld5qwenVCfOcHbHwXjoT+KrEktSFmNacEDypCeiwQE
	lfIEblBMJ64Dl5Yo+PqcEgtPUciB5m5IiLr91Q4lD79tqoQ6YDPeaTltod/7PyxA=
X-Received: by 2002:ac8:5809:0:b0:430:9ec1:77f9 with SMTP id g9-20020ac85809000000b004309ec177f9mr12704558qtg.3.1710792249333;
        Mon, 18 Mar 2024 13:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbpoPvKLD658FrZMZUfa21VFbJZXAX/nOy5o3FQUuNePIa1lkPrmXkrLKWAEePy+S7Jq7UDQ==
X-Received: by 2002:ac8:5809:0:b0:430:9ec1:77f9 with SMTP id g9-20020ac85809000000b004309ec177f9mr12704524qtg.3.1710792248947;
        Mon, 18 Mar 2024 13:04:08 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:08 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 02/14] mm/gup: Cache p4d in follow_p4d_mask()
Date: Mon, 18 Mar 2024 16:03:52 -0400
Message-ID: <20240318200404.448346-3-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, x86@kernel.org, Matthew Wilcox <willy@infradead.org>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Add a variable to cache p4d in follow_p4d_mask().  It's a good practise to
make sure all the following checks will have a consistent view of the entry.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index df83182ec72d..69a777f4fc5c 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -772,16 +772,17 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 				    unsigned int flags,
 				    struct follow_page_context *ctx)
 {
-	p4d_t *p4d;
+	p4d_t *p4dp, p4d;
 
-	p4d = p4d_offset(pgdp, address);
-	if (p4d_none(*p4d))
+	p4dp = p4d_offset(pgdp, address);
+	p4d = READ_ONCE(*p4dp);
+	if (p4d_none(p4d))
 		return no_page_table(vma, flags);
-	BUILD_BUG_ON(p4d_huge(*p4d));
-	if (unlikely(p4d_bad(*p4d)))
+	BUILD_BUG_ON(p4d_huge(p4d));
+	if (unlikely(p4d_bad(p4d)))
 		return no_page_table(vma, flags);
 
-	return follow_pud_mask(vma, address, p4d, flags, ctx);
+	return follow_pud_mask(vma, address, p4dp, flags, ctx);
 }
 
 /**
-- 
2.44.0

