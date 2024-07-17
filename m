Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC68934482
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 00:03:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BYyIlfsc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BYyIlfsc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPVMC4xL1z3dRr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 08:03:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BYyIlfsc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BYyIlfsc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPVKg2sZtz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 08:02:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=;
	b=BYyIlfscfu0TlSzpQLATgGYot4scna3XiKQ9+i8j7Kd1FnfBNzEcnnhjNGtAcQ9dcPKMgB
	wYUrlFK67D2BmPKzIbutVrx8bkXkDcVHU4aQTkrjsuVrGFk8y9DgXjR+zwpPh/01PK0FtV
	IyrfauPoiksfnaK/WTQ9fO65TRju1zQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=;
	b=BYyIlfscfu0TlSzpQLATgGYot4scna3XiKQ9+i8j7Kd1FnfBNzEcnnhjNGtAcQ9dcPKMgB
	wYUrlFK67D2BmPKzIbutVrx8bkXkDcVHU4aQTkrjsuVrGFk8y9DgXjR+zwpPh/01PK0FtV
	IyrfauPoiksfnaK/WTQ9fO65TRju1zQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-4a0NnKZkN0GgCYgoYmODAA-1; Wed, 17 Jul 2024 18:02:27 -0400
X-MC-Unique: 4a0NnKZkN0GgCYgoYmODAA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-448335bb53aso257651cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 15:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253747; x=1721858547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=;
        b=ALBEYdCUwQuJ3LIAC+EMbBKp4OKbnzBfjndcSNXyjkt6uP+Oj/LoyQj02b4InNZCsL
         fHheg68q9TKBmRUes0dImXk5qSKlvSVR5ilD1H7YvB5Cga01Ln09n4NQyR4fYGh5vRL7
         mYVfFVzzn4Nai3annUvBXquLtZbESRBYhy98+qGCmB0oaFEA/FD8GusKes2HG/HiaWLu
         UeUSG/WstVy2z9kBOv6dvM8UC5ozIMc7KcBxcuIQhRlm9FBoGiog277kQnZghYQ8snQI
         HQQZwzRN183u3YG/qFpndN+JbXVG2tMeJaumJSVht2nZVS85fbNIuuLG8J6ltnpxPhox
         1urQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxroDglgGJc0HCKaWE6eThHeu+W/RTBlJqweSCLPo5xIOIKf3m61KdNt99tJ+o4hErSp/7D9a/9kpXvCOFQvAjEUfPa0qdiokHtRmgdA==
X-Gm-Message-State: AOJu0YxjpqO2kRPswbUiPP+TtvHUdA6JxLD26B7adtokazU6X46ziVF+
	mR+PiNykefQNFPYTqITrk4kg4KtxBUo7l0SrYuVPwCaImCzHbFPuhSKP1/Ui6GwLbOQytnEhQOA
	5wQcut2qBlW/DaovmXJ602V8rz3MN/r5oS+cjAH7CSz+k4VjmNXa7+zB38Yq2X4Q=
X-Received: by 2002:a05:622a:3cd:b0:44f:89e3:e8d3 with SMTP id d75a77b69052e-44f89e3ebf3mr16472731cf.10.1721253746704;
        Wed, 17 Jul 2024 15:02:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7KLWkbU1UwJKSHrhdblARNi4OMqfXeCTcT+ovTUhvRHwOTG0GQKyZtUb2OdQ3d+/fWLwEbg==
X-Received: by 2002:a05:622a:3cd:b0:44f:89e3:e8d3 with SMTP id d75a77b69052e-44f89e3ebf3mr16472521cf.10.1721253746301;
        Wed, 17 Jul 2024 15:02:26 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Date: Wed, 17 Jul 2024 18:02:15 -0400
Message-ID: <20240717220219.3743374-3-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, peterx@redhat.com, Michal Hocko <mhocko@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce two more sub-options for PGTABLE_HAS_HUGE_LEAVES:

  - PGTABLE_HAS_PMD_LEAVES: set when there can be PMD mappings
  - PGTABLE_HAS_PUD_LEAVES: set when there can be PUD mappings

It will help to identify whether the current build may only want PMD
helpers but not PUD ones, as these sub-options will also check against the
arch support over HAVE_ARCH_TRANSPARENT_HUGEPAGE[_PUD].

Note that having them depend on HAVE_ARCH_TRANSPARENT_HUGEPAGE[_PUD] is
still some intermediate step.  The best way is to have an option say
"whether arch XXX supports PMD/PUD mappings" and so on.  However let's
leave that for later as that's the easy part.  So far, we use these options
to stably detect per-arch huge mapping support.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 10 +++++++---
 mm/Kconfig              |  6 ++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 711632df7edf..37482c8445d1 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -96,14 +96,18 @@ extern struct kobj_attribute thpsize_shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, tva_flags, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, tva_flags, BIT(order)))
 
-#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
-#define HPAGE_PMD_SHIFT PMD_SHIFT
+#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
 #define HPAGE_PUD_SHIFT PUD_SHIFT
 #else
-#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
 #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
 #endif
 
+#ifdef CONFIG_PGTABLE_HAS_PMD_LEAVES
+#define HPAGE_PMD_SHIFT PMD_SHIFT
+#else
+#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
+#endif
+
 #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
 #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
diff --git a/mm/Kconfig b/mm/Kconfig
index 60796402850e..2dbdc088dee8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -860,6 +860,12 @@ endif # TRANSPARENT_HUGEPAGE
 config PGTABLE_HAS_HUGE_LEAVES
 	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
 
+config PGTABLE_HAS_PMD_LEAVES
+	def_bool HAVE_ARCH_TRANSPARENT_HUGEPAGE && PGTABLE_HAS_HUGE_LEAVES
+
+config PGTABLE_HAS_PUD_LEAVES
+	def_bool HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD && PGTABLE_HAS_HUGE_LEAVES
+
 #
 # UP and nommu archs use km based percpu allocator
 #
-- 
2.45.0

