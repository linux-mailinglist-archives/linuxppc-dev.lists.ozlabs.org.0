Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF687F0DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:07:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DWL5jjHV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZxeXUD0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5VD5G3wz3vXN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:07:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DWL5jjHV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZxeXUD0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5R433hLz3dCH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OThRyXZFMjugEtcpgf//pX/PpGcoxbD3wNFnQts0Kco=;
	b=DWL5jjHVolwBuIeGnvdZeQ+W3bWwaF3eniNYkw+dnClS0HjM6d2nZMFy/P5ip7DIXm/4OQ
	bpxngUIj16VEzk3LavJFO1AJekil/+mEquPIbqnEOgYhZTCwZ3RRnb3fXKCWq97dHcLfUW
	PKsU/RiZYQPozWzUKJp3x5tczMF5jvU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OThRyXZFMjugEtcpgf//pX/PpGcoxbD3wNFnQts0Kco=;
	b=hZxeXUD0iXdRyMB2gqURGAYYXZyQqGvv/Daq488SDWgRKKWq+26o+cG71LqtEiULOqdI/Q
	LGLt6s8BqlIQ74G1Mjlh8DWZ7Swl4S2QgeK/yb5TL3lI2lWcBK8Y8qSkQFFpOMHdeSkCVY
	D7LALnI2EIv2C4g3+kPzjHKVqQQP2x8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-nPyg0pH3OW-VmIOL88_tSQ-1; Mon, 18 Mar 2024 16:04:11 -0400
X-MC-Unique: nPyg0pH3OW-VmIOL88_tSQ-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-430b4572a97so17522721cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792251; x=1711397051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OThRyXZFMjugEtcpgf//pX/PpGcoxbD3wNFnQts0Kco=;
        b=aXG/DRNMm2tSTCFiI5u6kzKtIkaIS9yA5hmDPmvrB4Q+8WZtrtrqYvegfrwW9HtRH9
         +cDZxGwwyRI2eEql/mtR/aTsZ9ihbIlLaXPHVqvSmr27FtiDcKHbOZJPNbq5Km/YWUqP
         K8fQ7fxc03krZHyllRJ7z+JOerEATR9YXFR0UwTza6kvn5+KEW16Z0CxDD6NjSs9kwwp
         4U7skDtTNhLx7F0ymAQjkoa75zYaEs+D7fbvHRXbDoF81TCNKmkI6MpTcWQOKAC07Dli
         bMsZubsOrs7pipYv6IvO+QcpCQcWz/js5mea9KStgVHvkJoBOQ2Xr8ugWih3Zc2PQeDs
         Xz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeJtgxTYfjG8/6aHMfO7CJ3TZq8pnYwx2FGxa3rBDeCo3S1ZCTCfwHHS1Gx+cP924lyrsCgkGlAF+b4funrK9krozqe6GjhsTkg4cdPA==
X-Gm-Message-State: AOJu0YwrZXoerhuRfr8Csxr0kFsKy/QcQsPVxRuHxR3E6ELZG+RJqgee
	ldj091AnjgLt1pQNHXZ1TVXqjTo/9dYf3mHoRGzj7UYqCxAxIo6Qi7+n1tMJ9yK3hNa8XYBxL52
	w9p5+AtUctpLQdyEsN+vkN8zl9gVzYJulkuD93HhZu6m+9m5Rkj7DblfT2IWFEt8=
X-Received: by 2002:a05:622a:100b:b0:430:ace8:9801 with SMTP id d11-20020a05622a100b00b00430ace89801mr13041010qte.1.1710792250870;
        Mon, 18 Mar 2024 13:04:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3lB75/Xyi/Yr3FGp4iv8P5rE4DSC0aUJAJLEw6DejnKFtl7A4ZV0qXSchssNp4WRDw4IDoQ==
X-Received: by 2002:a05:622a:100b:b0:430:ace8:9801 with SMTP id d11-20020a05622a100b00b00430ace89801mr13040968qte.1.1710792250407;
        Mon, 18 Mar 2024 13:04:10 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:09 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 03/14] mm/gup: Check p4d presence before going on
Date: Mon, 18 Mar 2024 16:03:53 -0400
Message-ID: <20240318200404.448346-4-peterx@redhat.com>
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

