Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5887F0D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:05:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3EIu5v1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3EIu5v1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5SW0vhXz3dV7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:05:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3EIu5v1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3EIu5v1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5R06tfBz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8evz9V3UX8qsNtRrNT6H/1m1GM34KP8FDwkI2vjQ2A=;
	b=D3EIu5v1UpmsnFhXhn7+WblxsinqrCVDg2tAmkdGHIKsoOV3Ka3zeUIbn+xbSpWAe6HRTT
	4wAuWspfP0Trr5CxWjf0YM1QhJ5k6Lg1Ajn7I827gbxoDA+CYWU2bwsPDxuJ1cQ0Lf4NrT
	Cu7QjvY1+QEedEHRgjXn8td9DYpioXg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8evz9V3UX8qsNtRrNT6H/1m1GM34KP8FDwkI2vjQ2A=;
	b=D3EIu5v1UpmsnFhXhn7+WblxsinqrCVDg2tAmkdGHIKsoOV3Ka3zeUIbn+xbSpWAe6HRTT
	4wAuWspfP0Trr5CxWjf0YM1QhJ5k6Lg1Ajn7I827gbxoDA+CYWU2bwsPDxuJ1cQ0Lf4NrT
	Cu7QjvY1+QEedEHRgjXn8td9DYpioXg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-5iGdXNtePg-lGxxPrJiRMA-1; Mon, 18 Mar 2024 16:04:08 -0400
X-MC-Unique: 5iGdXNtePg-lGxxPrJiRMA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-430d73c0492so3449531cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792248; x=1711397048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8evz9V3UX8qsNtRrNT6H/1m1GM34KP8FDwkI2vjQ2A=;
        b=S0rbd1njdTLBLLPuYpXKhHTRj7Il+c2zU5i6KkWjzQA6vNIXLHEs5yEi9RqssXWe6+
         ynUIbAcjayzeXIrbd3Do9xtAk+WAOet1Tq1w/DK5+hBHxRS0p2EzWUbFU9FYUSOA5LOH
         S3kV/IiWAnKbhvqwRwAtaTZLKFuMMDO+NNVM5uX+1Gm3ujZJIos3y8b/njaLZd/PlVBY
         FxVfhxuXlvULiGaLRN5NvBTdcjyn6frWCVwUdke8GUj9xQalNhvvs2Qd+MpzSvIiistd
         cqEvLzbaQK5cfEse9YrWw5IsjMUUzwHNpFTqeXuhXWXgGGzMLNV7SVpTd2sYlmDK37K8
         FTHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6mEwDAXnMc1YPLg95XIUrKaq7OitCbPFJoby8yyC+5qTXl71jzErFZDyY4lp9rFrleWWnfLUh3Bxfb+Wc4i4Vo2usnKi5+Pn9GZGW6w==
X-Gm-Message-State: AOJu0Yy1RKZ8bYUjYOjF1x7ZgT55sE1WecT+TVk9rl3jpze1C/cVPJUS
	Cnj/Jb5Hlllwq1Jvu68AdnrS5XpBKPDKoAfxnUjzTMDr8GDHzYQyhpxslzsWFbPc37cPMC0yqiv
	LPXojbQBpFLBBrFOhiz8EMvyozDqsgd/+vVS+acMupvmP74Xe3MgUnhB6j8QtNAA=
X-Received: by 2002:ac8:4e2c:0:b0:430:d071:2b0 with SMTP id d12-20020ac84e2c000000b00430d07102b0mr368388qtw.0.1710792248063;
        Mon, 18 Mar 2024 13:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6cgX9VgTY+xZMMhFw6lqDmni31WpaCJ4ySK//jo7z1XpjzLPLjahfNZgReizXXgubZZVEzA==
X-Received: by 2002:ac8:4e2c:0:b0:430:d071:2b0 with SMTP id d12-20020ac84e2c000000b00430d07102b0mr368368qtw.0.1710792247694;
        Mon, 18 Mar 2024 13:04:07 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:07 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 01/14] mm/hmm: Process pud swap entry without pud_huge()
Date: Mon, 18 Mar 2024 16:03:51 -0400
Message-ID: <20240318200404.448346-2-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Alistair Popple <apopple@nvidia.com>, Muchun Song <muchun.song@linux.dev>, x86@kernel.org, Matthew Wilcox <willy@infradead.org>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Swap pud entries do not always return true for pud_huge() for all archs.
x86 and sparc (so far) allow it, but all the rest do not accept a swap
entry to be reported as pud_huge().  So it's not safe to check swap entries
within pud_huge().  Check swap entries before pud_huge(), so it should be
always safe.

This is the only place in the kernel that (IMHO, wrongly) relies on
pud_huge() to return true on pud swap entries.  The plan is to cleanup
pXd_huge() to only report non-swap mappings for all archs.

Cc: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hmm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 277ddcab4947..c95b9ec5d95f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -424,7 +424,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 	walk->action = ACTION_CONTINUE;
 
 	pud = READ_ONCE(*pudp);
-	if (pud_none(pud)) {
+	if (!pud_present(pud)) {
 		spin_unlock(ptl);
 		return hmm_vma_walk_hole(start, end, -1, walk);
 	}
@@ -435,11 +435,6 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		unsigned long *hmm_pfns;
 		unsigned long cpu_flags;
 
-		if (!pud_present(pud)) {
-			spin_unlock(ptl);
-			return hmm_vma_walk_hole(start, end, -1, walk);
-		}
-
 		i = (addr - range->start) >> PAGE_SHIFT;
 		npages = (end - addr) >> PAGE_SHIFT;
 		hmm_pfns = &range->hmm_pfns[i];
-- 
2.44.0

