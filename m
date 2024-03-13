Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765F87B3EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:51:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T0wvxe2J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LTOpLQYr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw43G6ZkKz3vkk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:51:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T0wvxe2J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LTOpLQYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yY2Prtz30h8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXyJDuJosTa0kFBnhKvW1aqbtapsaxz0OHU+bPr+fnc=;
	b=T0wvxe2JskXetd00jmZvrz41xDj5HAZ8lmEtTeF895rIlJ9au1ifo0DT7qMwgVqBlOHDe7
	hW2GkKjyQ1dOheXdyilkypVjLB5y/YOzyrG9/VIyltN9PXFAmtQwJTqh0F073vL/0nv1dF
	rUxfxQT7xEExltFX5PMFc+qj0IjstE8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXyJDuJosTa0kFBnhKvW1aqbtapsaxz0OHU+bPr+fnc=;
	b=LTOpLQYraY+PadoDsrCsF/o6wp5PQyzoax3nyunILSykrbeR3qlKBOgNsV5BJHfMBAPB9h
	75+kkIyYhkogEmLsgJFVQRwjCTEGt9ySRKcX14YcYbq3973E8Rkxe+im1Jc6zmbC/szqOn
	jtFO6qo3zzLmrWagCV60FlLpTQQDsAM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-EmtVOPVMMuyGEYUgyK18mQ-1; Wed, 13 Mar 2024 17:47:29 -0400
X-MC-Unique: EmtVOPVMMuyGEYUgyK18mQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-690d3f5af86so1063716d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366449; x=1710971249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXyJDuJosTa0kFBnhKvW1aqbtapsaxz0OHU+bPr+fnc=;
        b=svIM2vAwDH6rlkybyz9BXjde15HfzKRm/yQSV5fK4UH/M8fa1CCps2emLk+ed3+qfE
         eNjX9yTRdBQrWAHtqrYdXdJkmqLDwSyhOq7jWxT0Ab5kY86lpqje8dYzNVhhSH/Bu1l+
         q4g+06di8Zeh1R6HaCOqMQ5tlllZOCn9eP9h1mo7psNwojwXUa3XKIzh1EYpr4gNZ6LA
         8jEhHuVPb8AZM5SmbfK7Uy30EbRYNsEwWOfqcvXroGj5KMCQ/f1LLJQAN2m+kCxq8DYC
         pEOXQ61JzoTCj6fh6X0i5gXxFr/I1FRz+Zi2tZatdBmT1LOo0hIFOJRdS6AuXlILdSqC
         3uTA==
X-Forwarded-Encrypted: i=1; AJvYcCVhVx54Ymztv/ZMZnRiWFdyPLiKNNOdsiYy0/KhiIPsVYKI/1wrnsIA8Q03+g5Pe8BkjSBeXD02ZrWnCjhAwv3AW2JcssQwQctn0EwUmw==
X-Gm-Message-State: AOJu0YxjAgG433R6CqEROm9ynDtkKrajYO8iIb7QVV2ZdS6W6T1mqnTv
	Mui20CskExRB4fwmoA56ugYE0UTPQ58GK94h9NIlV66wdVgccdBo71RBkiXWP+uoWF0UmR9cvZF
	ptiBO7crsj9xtxZHB7vgjANWr51WoYJXN5MWVKTKAYgTVtogIyvYCIW7PhYMjg2b8ENx+NKc=
X-Received: by 2002:a05:6214:aa7:b0:690:d74d:7e6d with SMTP id ew7-20020a0562140aa700b00690d74d7e6dmr2881509qvb.3.1710366448982;
        Wed, 13 Mar 2024 14:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELbWWxNSgYU6xiV6giMb0Xazy3M+lqNjbyiI8S6tM3m0hmfGtXABqH+Dtrq87Nz5UyrTDJQA==
X-Received: by 2002:a05:6214:aa7:b0:690:d74d:7e6d with SMTP id ew7-20020a0562140aa700b00690d74d7e6dmr2881487qvb.3.1710366448612;
        Wed, 13 Mar 2024 14:47:28 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:28 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 05/13] mm/sparc: Change pXd_huge() behavior to exclude swap entries
Date: Wed, 13 Mar 2024 17:47:11 -0400
Message-ID: <20240313214719.253873-6-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Jason Gunthorpe <jgg@nvidia.com>, Andreas Larsson <andreas@gaisler.com>, x86@kernel.org, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Please refer to the previous patch on the reasoning for x86.  Now sparc is
the only architecture that will allow swap entries to be reported as
pXd_huge().  After this patch, all architectures should forbid swap entries
in pXd_huge().

Cc: David S. Miller <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: sparclinux@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/sparc/mm/hugetlbpage.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index b432500c13a5..d31c2cec35c9 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -409,14 +409,12 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 
 int pmd_huge(pmd_t pmd)
 {
-	return !pmd_none(pmd) &&
-		(pmd_val(pmd) & (_PAGE_VALID|_PAGE_PMD_HUGE)) != _PAGE_VALID;
+	return pmd_leaf(pmd);;
 }
 
 int pud_huge(pud_t pud)
 {
-	return !pud_none(pud) &&
-		(pud_val(pud) & (_PAGE_VALID|_PAGE_PUD_HUGE)) != _PAGE_VALID;
+	return pud_leaf(pud);
 }
 
 static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
-- 
2.44.0

