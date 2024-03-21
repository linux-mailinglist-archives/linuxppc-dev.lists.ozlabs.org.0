Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DB8862FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:09:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z1QOr5VH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ImCVPY7e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V104N6KZFz3vZn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:09:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z1QOr5VH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ImCVPY7e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V102k23lJz3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
	b=Z1QOr5VHwlnXVmwfQMhze8UZ86wYuDJEJRmDmm7Gd/MNIoSjQjosnXLK1+/tX4cfMTLOkW
	/grErCiT6duLwQtG6YQabPQH0HPqGZbdIpPnBmmZOlDv3FbocaTE0IBk1AYiZw6fGACvtE
	V0tbvz6WS6cNd0AC3nUqdbM63IySHWk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
	b=ImCVPY7eUCrb0WeAuAadTpNkzj+8tp/cbW8Smg2g3tPFk8HwS5VNpGJh5lKqlNs097zQw4
	LBLshpfgy+4aiZVXjqaPABht4+G1gkokF6l/8albClgBDeUem1ZzJasETQbgcnm2dHCDco
	SsMK/dA5XvICb3n9YVXCVY3SvNx5o/E=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-m6QgagZoOeeny54Zg6Wzkw-1; Thu, 21 Mar 2024 18:08:08 -0400
X-MC-Unique: m6QgagZoOeeny54Zg6Wzkw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-430d45c66acso2667651cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058887; x=1711663687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzTkuuEUZ2f7C9YouF2ORWZwnTLSeJ8Y5AJhy7kkISQ=;
        b=UgIzdSxW/gfz7H5+MLy3s4SFnAX2z2MYazje+hn6sVUAQsdSrCVXmhuJs163EMu5DA
         SQpeTpadLNplSQpVV+DsW1wj+k7cFd8/9qkvB5TKoypG75t5Kegq+9pOFVSLxtt2WLTX
         eI410+67dQtEv+D5xP9BrGXhk+KZaynOnKLBML6uBE8t/DERYshZA+KQDcpyDsLzJvOp
         3QxsVuf52nuCic+liwke/7lj2JD39dO1SUWO8BGWKSghqTkTrAnqdCjQ1gVR29leADcj
         hqVEnEqFIf/jlYBdFowM5idWrQ9APiItF7o34uMMe1DiHjKbbGXZjdY4mg97BuWocaCr
         Y+HQ==
X-Gm-Message-State: AOJu0YyIJ+IxlMGI0gz+wlk4k5NCMF8wnagRHCXGHgDThqjVBRW7ZRxK
	lMnHnKWMUExO+Lvzo9KrUa+QNVwEOp6fpXE4RkH4Q2CG6/8cAyDgn2Dz5rQcG5kTHwIBJhk534F
	14PQLZVjydgI+vaPvgGOZjgbme+wvJMlaaSaNwxiDh3rtpThpBPs+fKmHaskJ3K0=
X-Received: by 2002:a0c:e58b:0:b0:691:87dd:f836 with SMTP id t11-20020a0ce58b000000b0069187ddf836mr428490qvm.5.1711058887537;
        Thu, 21 Mar 2024 15:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbvsPPVNStAWHyU+pKNLEFDZ4j8yXA8+9tn+eCe8z7LjIA9ieYt5evzB7ZRQzGTHD3gHSYEw==
X-Received: by 2002:a0c:e58b:0:b0:691:87dd:f836 with SMTP id t11-20020a0ce58b000000b0069187ddf836mr428451qvm.5.1711058887085;
        Thu, 21 Mar 2024 15:08:07 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:06 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/12] mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
Date: Thu, 21 Mar 2024 18:07:51 -0400
Message-ID: <20240321220802.679544-2-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
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

