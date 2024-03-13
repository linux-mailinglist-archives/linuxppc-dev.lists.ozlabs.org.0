Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DA087B3FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:57:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igPW2m98;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FkzJnaD9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw4B25NGjz3w3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:57:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igPW2m98;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FkzJnaD9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yp30Yhz3dWC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RceLUqudgSYtio91tFrZNJeoSc+POoSD4WuQnIajVyw=;
	b=igPW2m98y9PDQ2C5zxIfhUYhnxbWw2PEQo6KV4UUC1fYYcLqbgVLCwVO+4+zIOhCWepIgb
	ZkRT+8XeerkLWCrMoFhENcQ6DH2Vs5rdFae63go7BvWzOwmBAa0g1dnXvQ/7MonZltS/tq
	8OkpggoqDvBjxZAyl4zCYcL+YtP1bR0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RceLUqudgSYtio91tFrZNJeoSc+POoSD4WuQnIajVyw=;
	b=FkzJnaD93OD4VFF/cZyW7YFhixb4sSulId052+op6mR1zP5q4mZMgtxuM7Y88xiDVpSFWi
	uqZBTcLHA0ziYRMYKW1RETujuElb2JbrUldia1tLZGqVgvOSeBQW6o9JedcxvoIuWn/yt8
	iIci7ht8R1p2DMB/JEcHjol65he4UsM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-JyuuWSdrPyy9Aq9Z_QqnaQ-1; Wed, 13 Mar 2024 17:47:41 -0400
X-MC-Unique: JyuuWSdrPyy9Aq9Z_QqnaQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69120b349c9so1132056d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366461; x=1710971261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RceLUqudgSYtio91tFrZNJeoSc+POoSD4WuQnIajVyw=;
        b=w1/VSvqEK+9nWPJlwZYBy2bOVuGXL0vJScOjKnvU84WbPxQ0lPKZg3GOQoujiTSj+S
         doFHPsIfl7z5ggrGZUUAqNsaFSVgfieOqafy1R7YlBs47aJUddwVYWda47JEy/pgfsSq
         xJIWbdZBv0mYXmkBnC5znlx5xdlrSVgdMjgABzfR5ve5r5QLPyadqv/ltGgWH4hhc++L
         IsHkuhKF56U+8PIxRE8KCTcAqIVMLunodOKg7IbJQUZW0SD33H6quOkQvrNCqVwY9Q4T
         7ffm/ZxVlUzqWSyXPnIrFwv+K0a31A2DiBRhiQipNUHWVo1r6aJscnTveVWC3zhT414k
         Vx2w==
X-Forwarded-Encrypted: i=1; AJvYcCUGHgAwYCCKBctU1CgFpbbGMsZQp8kxvtxJzEvTvzLIl7S+lLrz9PAVWn4hzlvM0YLhwhuv7nSDJ9HSxdNRuKQ8fADmtJVtrw1uf9V9BQ==
X-Gm-Message-State: AOJu0YwWVilQ9/xvjyY9koCK9M+cae9iG6H1JALfUDP71lssuMEXSZBj
	QbyNM01hQm7rl3DGyqMGGMrf1aKhxGojsh/PWKyuFhA48ppYnLPBNn8JnV29dSaFDRgiUKW2E0G
	+L8GUFgeRPSh6q+M3EyIlFVVz0+Wg6P6rqQLm3vPn8UhmQHFJlKdCfBONRTZ37Lw=
X-Received: by 2002:a0c:eb83:0:b0:68f:e779:70f2 with SMTP id x3-20020a0ceb83000000b0068fe77970f2mr5934046qvo.3.1710366461087;
        Wed, 13 Mar 2024 14:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzQ7u+SJJkcqXmUXcq37q3NbZvmeXcFSg9ZX/No2VaFoCndSeWwMBLZUu/Dqoea36C4ilydg==
X-Received: by 2002:a0c:eb83:0:b0:68f:e779:70f2 with SMTP id x3-20020a0ceb83000000b0068fe77970f2mr5934040qvo.3.1710366460771;
        Wed, 13 Mar 2024 14:47:40 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:39 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 13/13] mm: Document pXd_leaf() API
Date: Wed, 13 Mar 2024 17:47:19 -0400
Message-ID: <20240313214719.253873-14-peterx@redhat.com>
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

There's one small section already, but since we're going to remove
pXd_huge(), that comment may start to obsolete.

Rewrite that section with more information, hopefully with that the API is
crystal clear on what it implies.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/pgtable.h | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 85fc7554cd52..6b0d222a7fad 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1770,11 +1770,25 @@ typedef unsigned int pgtbl_mod_mask;
 #endif
 
 /*
- * p?d_leaf() - true if this entry is a final mapping to a physical address.
- * This differs from p?d_huge() by the fact that they are always available (if
- * the architecture supports large pages at the appropriate level) even
- * if CONFIG_HUGETLB_PAGE is not defined.
- * Only meaningful when called on a valid entry.
+ * pXd_leaf() is the API to check whether a pgtable entry is a huge page
+ * mapping.  It should work globally across all archs, without any
+ * dependency on CONFIG_* options.  For architectures that do not support
+ * huge mappings on specific levels, below fallbacks will be used.
+ *
+ * A leaf pgtable entry should always imply the following:
+ *
+ * - It is a "present" entry.  IOW, before using this API, please check it
+ *   with pXd_present() first. NOTE: it may not always mean the "present
+ *   bit" is set.  For example, PROT_NONE entries are always "present".
+ *
+ * - It should _never_ be a swap entry of any type.  Above "present" check
+ *   should have guarded this, but let's be crystal clear on this.
+ *
+ * - It should contain a huge PFN, which points to a huge page larger than
+ *   PAGE_SIZE of the platform.  The PFN format isn't important here.
+ *
+ * - It should cover all kinds of huge mappings (e.g., pXd_trans_huge(),
+ *   pXd_devmap(), or hugetlb mappings).
  */
 #ifndef pgd_leaf
 #define pgd_leaf(x)	false
-- 
2.44.0

