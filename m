Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B987F0F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:11:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fynwT17S;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fynwT17S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5b515zSz3vxG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:11:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fynwT17S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fynwT17S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5RG0x7rz3dVN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0Y+ceGC2u4mzi2lycxKAqHeA0qAqllKwMSRaV+2/Lw=;
	b=fynwT17SJVsvl2nSZHqSMrQXVMepJMrapFOUyZJWtCsFp7S369yo33HwnwDqLaXGF6vxMW
	/7EuGbMsf2HZDBxPEWlWe3Acr6NIlEBf0UaBdMiy2MDpw8USTJjoMdYQY0dWYImY3l9GVd
	7Pa67JTxBEKkh2U43zUDlHN4Hv3kx/8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0Y+ceGC2u4mzi2lycxKAqHeA0qAqllKwMSRaV+2/Lw=;
	b=fynwT17SJVsvl2nSZHqSMrQXVMepJMrapFOUyZJWtCsFp7S369yo33HwnwDqLaXGF6vxMW
	/7EuGbMsf2HZDBxPEWlWe3Acr6NIlEBf0UaBdMiy2MDpw8USTJjoMdYQY0dWYImY3l9GVd
	7Pa67JTxBEKkh2U43zUDlHN4Hv3kx/8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-yyzLupgjMyWYMSMGwIgFlQ-1; Mon, 18 Mar 2024 16:04:22 -0400
X-MC-Unique: yyzLupgjMyWYMSMGwIgFlQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-430b4572a97so17524021cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792261; x=1711397061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0Y+ceGC2u4mzi2lycxKAqHeA0qAqllKwMSRaV+2/Lw=;
        b=nTkQPKgEUlypWeF4zGxQJIatWbDuj7A/8KazFj5zZc5P2biF2T/RMhNvJtdIF0JB21
         AnEVnvduncbCw9V2L7bBH3U/Mf//j9tjOm6cDYrCjj9oyz8lZ16wFSaBU/0MADmLJkV7
         0suUdJitXtqdlzXgVl02tT7EQUxIlGDpBeeA7WtP4o3J7uHNZ8n8S9YQViO7sBtZtmgX
         HkIeZySBQ1mD5hC+gCtA7FIc6Gwc6puEY7vESCyPq2+LVsJy7C/s7wMh5pc8D1KPfvy1
         NVNmKuMBvP2TrC8LKvw/LsjbqX+55YJzbrBKPfiFh9nWKtf5p4hRiCDKYYp9I+FKomxW
         D9vg==
X-Forwarded-Encrypted: i=1; AJvYcCVGjXtnuqoe7C14+B8+Hru+uOkww33ogQw9XCHwFG35JQNV63frlVoKqmu7LQ0w/B/cV/bJZsbP89mdHE5eEMmdn9wGuu9hngSIJ9zVeQ==
X-Gm-Message-State: AOJu0YyMerHkhB5uGv1h0jUWvz16z46gWeZoRS6n0sgRPaUF4bjCDoot
	cCVv+RQGXYJlKgXEfV5z/03WqAajGvbFyIeJyIhWf0EQz4xeKGQh+W8WVOmvYmqwhPQctyPMX3n
	Imo9//ssR+bNCyOSREzHYObSXh+S92/rqeSLq1hNJyOMo3C72ypuLPpYLxOK98rujNYQujmc=
X-Received: by 2002:a05:622a:15c8:b0:430:ae0a:c08f with SMTP id d8-20020a05622a15c800b00430ae0ac08fmr12238075qty.6.1710792261470;
        Mon, 18 Mar 2024 13:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQhMJRmPtSMLbLztL+aVkPHyOJfqD1JG0yGIJ+aGiheaz6nxeexYpcIdXvqwuavYhzTjiHrw==
X-Received: by 2002:a05:622a:15c8:b0:430:ae0a:c08f with SMTP id d8-20020a05622a15c800b00430ae0ac08fmr12238049qty.6.1710792261015;
        Mon, 18 Mar 2024 13:04:21 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:20 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 10/14] mm/gup: Merge pXd huge mapping checks
Date: Mon, 18 Mar 2024 16:04:00 -0400
Message-ID: <20240318200404.448346-11-peterx@redhat.com>
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

Huge mapping checks in GUP are slightly redundant and can be simplified.

pXd_huge() now is the same as pXd_leaf().  pmd_trans_huge() and
pXd_devmap() should both imply pXd_leaf(). Time to merge them into one.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 802987281b2f..e2415e9789bc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3005,8 +3005,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
 		if (!pmd_present(pmd))
 			return 0;
 
-		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
-			     pmd_devmap(pmd))) {
+		if (unlikely(pmd_leaf(pmd))) {
 			/* See gup_pte_range() */
 			if (pmd_protnone(pmd))
 				return 0;
@@ -3043,7 +3042,7 @@ static int gup_pud_range(p4d_t *p4dp, p4d_t p4d, unsigned long addr, unsigned lo
 		next = pud_addr_end(addr, end);
 		if (unlikely(!pud_present(pud)))
 			return 0;
-		if (unlikely(pud_huge(pud) || pud_devmap(pud))) {
+		if (unlikely(pud_leaf(pud))) {
 			if (!gup_huge_pud(pud, pudp, addr, next, flags,
 					  pages, nr))
 				return 0;
@@ -3096,7 +3095,7 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_none(pgd))
 			return;
-		if (unlikely(pgd_huge(pgd))) {
+		if (unlikely(pgd_leaf(pgd))) {
 			if (!gup_huge_pgd(pgd, pgdp, addr, next, flags,
 					  pages, nr))
 				return;
-- 
2.44.0

