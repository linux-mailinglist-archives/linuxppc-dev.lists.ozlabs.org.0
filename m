Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5188E8C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:25:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HERAnwdQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HERAnwdQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Vpk0kCvz3vjC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HERAnwdQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HERAnwdQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VnC1g2yz3fNd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:23:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
	b=HERAnwdQFeymCFyZMJ5sMV/5gQjSvaPy/RdTHP7LaZE/FfItyTkEm2+wEyl/4vAdJOfMng
	eu2EkyMS/bU/fvZ1Eaado6rPk6CA90KZAqQ8PLDg3KzMJl9PcK5mqPk/YNRGtu7oxM4HmW
	wIjMW9VuObrzex/ogw08x4jN7sMWhTI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
	b=HERAnwdQFeymCFyZMJ5sMV/5gQjSvaPy/RdTHP7LaZE/FfItyTkEm2+wEyl/4vAdJOfMng
	eu2EkyMS/bU/fvZ1Eaado6rPk6CA90KZAqQ8PLDg3KzMJl9PcK5mqPk/YNRGtu7oxM4HmW
	wIjMW9VuObrzex/ogw08x4jN7sMWhTI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-GtrmqX2BM_iT7ZlCxs1QjA-1; Wed, 27 Mar 2024 11:23:38 -0400
X-MC-Unique: GtrmqX2BM_iT7ZlCxs1QjA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-696a9c482a4so3595406d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553018; x=1712157818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
        b=L3SkTXzGAxmm50+eM6I9QRh+Dk4aa1A2HCztyYNqKH6k/+NB8et8Qo/yWrjfXHNg2B
         RIXZbG21aA09dx2ya0kQGpeybCJBO6wrSAojkobUZSxVU8FXa0bz/DiyZSZULwJXEpUJ
         31binCcULPxrPgcaOoO4LpYXBSs3rNVeQGJjfbeB9BCSxrwy2MhKVbi/1iD1FMlo6tIw
         tijQPmV8r/Ib+0xtPLG4mz+l5SoHxET2Fqe39wxMtDgs7plfTGmynIoGjTeFFjt42MY4
         Jnn427q5q7UxPwXPd0wrIaEakNY3kh+pXc0UokJ8vUAum2mx2rhFX8G837rFSu84K8EP
         BA5g==
X-Forwarded-Encrypted: i=1; AJvYcCVpS2eBHTcy2WR2Idlc7X1N5RecyBkPq8TC4+aDGPPE5PqxD/0PClwfa8kP6lrnhO7a19N63iXZmBNsEv3RYvfXnR9MD8iKN05bCRUUbA==
X-Gm-Message-State: AOJu0YxtMW+JzRRVDVtl5Amp++qBIlaHyYWSnKL2ySruoBnQ2RAzc8yq
	hRhBx/4W2Nrsknx3hyJQXEsDZc9NxI2AX6PjejOFI2v7k67Z9gU3vakT4khPO5ixfxMuLO01ytG
	lhHWQkJrbIdWGbEZBQWGYpPu3evLeILzg5fCoyppSTWV5GKnwgFdSPjQc7GyMphY=
X-Received: by 2002:a05:6214:5d11:b0:690:3c85:c5b with SMTP id me17-20020a0562145d1100b006903c850c5bmr14918727qvb.3.1711553017568;
        Wed, 27 Mar 2024 08:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFplzIHsd2VycAjj5oUNWAa5qW9RFPqJwKtRaT5aqzv2S9fkhcwA1AKc/2h1PXS7yh/3x/6aw==
X-Received: by 2002:a05:6214:5d11:b0:690:3c85:c5b with SMTP id me17-20020a0562145d1100b006903c850c5bmr14918682qvb.3.1711553016992;
        Wed, 27 Mar 2024 08:23:36 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:36 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/13] mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
Date: Wed, 27 Mar 2024 11:23:20 -0400
Message-ID: <20240327152332.950956-2-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Introduce a config option that will be selected as long as huge leaves are
involved in pgtable (thp or hugetlbfs).  It would be useful to mark any
code with this new config that can process either hugetlb or thp pages in
any level that is higher than pte level.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index b924f4a5a3ef..497cdf4d8ebf 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -850,6 +850,12 @@ config READ_ONLY_THP_FOR_FS
 
 endif # TRANSPARENT_HUGEPAGE
 
+#
+# The architecture supports pgtable leaves that is larger than PAGE_SIZE
+#
+config PGTABLE_HAS_HUGE_LEAVES
+	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
+
 #
 # UP and nommu archs use km based percpu allocator
 #
-- 
2.44.0

