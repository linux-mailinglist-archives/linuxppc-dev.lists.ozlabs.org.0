Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0687B3DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:49:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T01wgmbK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T01wgmbK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw40s6vWMz3vYX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:49:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T01wgmbK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T01wgmbK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yW3nKTz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D9LYre9es5Pr/ZmF0ksBqg/v+REJVkPqwZxeVyu2sc=;
	b=T01wgmbK95N+bmb+RdGsY0qdZn3Loq33Ll2xdsivibnsLRKQRJLgMT3X8CF9DiopJt0gHl
	gTJJTWTyByPFylfQdYN2uL6uaFRHRwR/yYZY9OPngGsXxQfBl4waIuE115/Mvg+cZ1QZSj
	R4VggEEWV5D3y+WSKiZ51oXoSiBxMBI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D9LYre9es5Pr/ZmF0ksBqg/v+REJVkPqwZxeVyu2sc=;
	b=T01wgmbK95N+bmb+RdGsY0qdZn3Loq33Ll2xdsivibnsLRKQRJLgMT3X8CF9DiopJt0gHl
	gTJJTWTyByPFylfQdYN2uL6uaFRHRwR/yYZY9OPngGsXxQfBl4waIuE115/Mvg+cZ1QZSj
	R4VggEEWV5D3y+WSKiZ51oXoSiBxMBI=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-BQluzYkPM1aG1bf8ZfiImg-1; Wed, 13 Mar 2024 17:47:25 -0400
X-MC-Unique: BQluzYkPM1aG1bf8ZfiImg-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-22206c445fcso134268fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366444; x=1710971244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3D9LYre9es5Pr/ZmF0ksBqg/v+REJVkPqwZxeVyu2sc=;
        b=WN2pXQeDesyCYpTdQHwvQcai/2d+X0wBP9pYxKa++F7p0AmVzF2/ajDYGrHiGv5bCi
         dG8F8rYoGnBEyzZdtP9Wd0cz4EDrTFKh3z6d5/zUMYlZruZp5DX2w32o0WrGmurJXJU3
         NtYNTjEeu7iTMPXvXVvfoEGaprgNLseGDe1ZNzcDTTDq9eFT6IuWzwVSe4d57HcOiI7n
         iXju8yXkBFt/ekcqP1bHxLvrJBVvQwcmuVI8IghkPKj+0PA9RNVJVu7sc4u4F/mb+9c3
         m9wzGn38GoZuYwKFfUC2LH/Fm9VOziYdQgdP5gouCGnACNxh4CY+nWo9rHKqYA21S2hv
         +2eg==
X-Forwarded-Encrypted: i=1; AJvYcCU4pGvD9Jl7w/42EkVqRKRgMDhruKTdDUZb98Zl5qX3VAB7k6pmSB8gJyTlRJOwvE1JXV+LeiAZoAt7NkcDKjYqJkBVG6tSP8sVYA/LVg==
X-Gm-Message-State: AOJu0YwU3JElT8CpLcugnq2SpCiKt4Ku0hp/KQIgwrhoAmW+D8HsGTze
	RWrc7LrWJG0prt317aqVx+aFOvMZUpD6LTW0XuXzGgqrPBdlmqL0fjexfX7cJ4ZV2EybjbUuore
	XGiVJwNhvA7i2/w3bnEBG//LbtsQaLcn2GEHilzAz8cjI3ec5PVo1QEdmWG+VkJs=
X-Received: by 2002:a05:6870:548b:b0:221:8fd1:21d9 with SMTP id f11-20020a056870548b00b002218fd121d9mr65920oan.1.1710366444686;
        Wed, 13 Mar 2024 14:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsHUgdlv9jd2gJ8jFSi5EgQlUb7Ps0TGhERhhMFfAJj348C9AzYnG5IHJKnziXpPDsCb1mgQ==
X-Received: by 2002:a05:6870:548b:b0:221:8fd1:21d9 with SMTP id f11-20020a056870548b00b002218fd121d9mr65901oan.1.1710366444348;
        Wed, 13 Mar 2024 14:47:24 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:23 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 02/13] mm/gup: Cache p4d in follow_p4d_mask()
Date: Wed, 13 Mar 2024 17:47:08 -0400
Message-ID: <20240313214719.253873-3-peterx@redhat.com>
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

