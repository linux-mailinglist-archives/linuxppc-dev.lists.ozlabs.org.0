Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E733E87F0E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:08:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H7yGDba5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H7yGDba5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5Wp4hLnz3vlj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:08:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H7yGDba5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H7yGDba5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5R72KT1z3dRV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXyJDuJosTa0kFBnhKvW1aqbtapsaxz0OHU+bPr+fnc=;
	b=H7yGDba5XoiGfnjSijWsoSyNR6A3saZ+vtyjSXUZR3AafmHTI5r5A5C0PTCofvUov6fagI
	8s21wT/is9laCC5fAjouelBQ4HH4pfbsL+NyZyGDw9NUJXjS+oHjnmKUGQ93RlP+9DYxV0
	9DoEyfSQOtaEs/fLmhM+GWBKtjcF+UI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXyJDuJosTa0kFBnhKvW1aqbtapsaxz0OHU+bPr+fnc=;
	b=H7yGDba5XoiGfnjSijWsoSyNR6A3saZ+vtyjSXUZR3AafmHTI5r5A5C0PTCofvUov6fagI
	8s21wT/is9laCC5fAjouelBQ4HH4pfbsL+NyZyGDw9NUJXjS+oHjnmKUGQ93RlP+9DYxV0
	9DoEyfSQOtaEs/fLmhM+GWBKtjcF+UI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-Me9DaTjGNSqumRXdkCfpWg-1; Mon, 18 Mar 2024 16:04:14 -0400
X-MC-Unique: Me9DaTjGNSqumRXdkCfpWg-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3c386baa6feso290837b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792254; x=1711397054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXyJDuJosTa0kFBnhKvW1aqbtapsaxz0OHU+bPr+fnc=;
        b=bf2Zj34cZWwngTuoujV4UxsaJquEZfe6ZQeUJPZ7dHfU6sLaTv6vJJsOBTbR64L78C
         v5tjrcUdcrQDwH6ezkNnqPorpOahNDNZ+WCoUAtn5t7+s4SU1z8xKZwdleZ2787quGf3
         gZwcdBCZuwB80lOfFiKWIgePev9sdMnVkXWHNq8egrdQZnJG8PVaI2iAHYsm7mqscZoT
         x740aXY2qGIXhjDcS6FtXum/R3W0xAY3OHinnS19vIaUNCnofvYsDLquER1e3IS8sl8r
         GwGpWmTl32+ekfXZr1x8mVE4CUlmKdw4OyLB41+PVvp70jRuxUuT5ivEJrqNoJK719xy
         4MUw==
X-Forwarded-Encrypted: i=1; AJvYcCVMMYp3nHrZ42u3j/O2J95rciNLlEzFky6Of4sQp2tQPZpEFIgUmeyHInzFDIAQ35CtHHSNytSvgc+7NhtSbdMsAlnhqeSlzCDm+KPtng==
X-Gm-Message-State: AOJu0YzrUjpQ51FmFdqvYJmV1gvdJDhvNVVGxbdQ5HPvPH12j0MpOY5x
	3CWE2LdDCIqj2aFFSoOtzhwZ1pJ/gvhLcvywQ1siJiiWy4vwHh3C8xK0vYIEj8R4f/9OmNcj42r
	vCougJbFW/y3I8Eew+TXpoBQsTZlVrBsc+otwjE4erU1aTdEzjf8zOZrBVR0q6SY=
X-Received: by 2002:a05:6808:1508:b0:3c3:62e8:b257 with SMTP id u8-20020a056808150800b003c362e8b257mr12175253oiw.2.1710792253707;
        Mon, 18 Mar 2024 13:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUhgF4cxTmP19vnk1XO+36zS6Ji6sYyFBctjoFtXbctIHX3L15GV2lInQmSaTOj2BJ1Nuktg==
X-Received: by 2002:a05:6808:1508:b0:3c3:62e8:b257 with SMTP id u8-20020a056808150800b003c362e8b257mr12175212oiw.2.1710792253188;
        Mon, 18 Mar 2024 13:04:13 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:12 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 05/14] mm/sparc: Change pXd_huge() behavior to exclude swap entries
Date: Mon, 18 Mar 2024 16:03:55 -0400
Message-ID: <20240318200404.448346-6-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, Andreas Larsson <andreas@gaisler.com>, x86@kernel.org, Matthew Wilcox <willy@infradead.org>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
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

