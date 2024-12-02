Return-Path: <linuxppc-dev+bounces-3667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F69E02A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 13:58:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y23kR2rP2z2yLr;
	Mon,  2 Dec 2024 23:58:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733144319;
	cv=none; b=GYSialbA2QYhBLh5cRq+vDH4JBnhwRyZNC6GUGWyeGi2LXGtTT6PMrABXSBlKl98Zj5FN+ZeiByGvXRN/ro970WWOAEgxIeIsWpel5TQrJ0JI4CRyvCrXNBQtFNv9Dp9O8zkWeNQOIB3l+aLtKjk2lS3fg1no/AlDUbPjA0X6eNGXIDXkwkZ5KWCAwZGsY1aXAO8LqVwcO1ShWfVfzu8ZhRiSNQs0ePXt0n9hs1ShiM3NkF7Q78icd7JAjnX2ulglHj1SBpKqxLjY02gfipOZVYxwkFpU4sajzfCrF6cNY5sDh4Gh0c/WDeAQWYIKdii8NAlgqImETCl52iPiru83w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733144319; c=relaxed/relaxed;
	bh=sUfFB5Sjd5S9qMX11BGcSRAtxQGHOOZYHnvQVZdcklA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j64+iWNgdvSukdVa1m0QpcIPCnnYg97pjXQ0sYmGwAgh17ACETbTSMxGvBLonkCizQnVxIV4oe1lpLPSVRe2PPlJHg8S2Ru/jGR8kRD/gv0MqAsfZYJ/YCbnQAvCUPWpEvsFKe6QstAjvnMxwAhBv974hIk1Pamn2NOpU9mVcRWV+AVaDwiMPWEFOde5uV91Q2LbydlBhdjsKAWLbFwbEq6mhkamnZcA0qbKZwVaqKqrTopjTBcX86oTqAE1zjrhAMhwmdGuoVJfG7LZBB5NUqHMwJveSL8IfHMII/on8G6Fm96IRFsTGhBZoTNV/AZJMVGrsKdYZaaLGTgrHABZcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqaOQvV7; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqaOQvV7; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqaOQvV7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqaOQvV7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y23kN0z1Lz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 23:58:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sUfFB5Sjd5S9qMX11BGcSRAtxQGHOOZYHnvQVZdcklA=;
	b=JqaOQvV7FXAaD2ImTB+MdSVKYDrEjUmSFjJxlv4AIKSGUDdi8019q2z25Qr2A3Pa6nFm5M
	XCQriAPanNx+tQDvSP+72oEyBjLX5K9LRlsxrXrJsVES4XEOicMPLgSbHbSc2XvqvZG119
	5U2w3kg4JJjKM97BRcGFS0hvzMq2gZE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733144308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sUfFB5Sjd5S9qMX11BGcSRAtxQGHOOZYHnvQVZdcklA=;
	b=JqaOQvV7FXAaD2ImTB+MdSVKYDrEjUmSFjJxlv4AIKSGUDdi8019q2z25Qr2A3Pa6nFm5M
	XCQriAPanNx+tQDvSP+72oEyBjLX5K9LRlsxrXrJsVES4XEOicMPLgSbHbSc2XvqvZG119
	5U2w3kg4JJjKM97BRcGFS0hvzMq2gZE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-2CXO6SbxMjSM_j8vAM94cQ-1; Mon,
 02 Dec 2024 07:58:21 -0500
X-MC-Unique: 2CXO6SbxMjSM_j8vAM94cQ-1
X-Mimecast-MFC-AGG-ID: 2CXO6SbxMjSM_j8vAM94cQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D83A1953951;
	Mon,  2 Dec 2024 12:58:19 +0000 (UTC)
Received: from t14s.cit.tum.de (unknown [10.39.194.150])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E7341195605A;
	Mon,  2 Dec 2024 12:58:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v1 0/6] mm/page_alloc: gfp flags cleanups for alloc_contig_*()
Date: Mon,  2 Dec 2024 13:58:06 +0100
Message-ID: <20241202125812.561028-1-david@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Let's clean up the gfp flags handling, and support __GFP_ZERO, such that we
can finally remove the TODO in memtrace code.

I did some alloc_contig_*() testing with virtio-mem and hugetlb; I did not
test powernv/memtrace -- I cross-compiled it, though.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>

David Hildenbrand (6):
  mm/page_isolation: don't pass gfp flags to isolate_single_pageblock()
  mm/page_isolation: don't pass gfp flags to start_isolate_page_range()
  mm/page_alloc: make __alloc_contig_migrate_range() static
  mm/page_alloc: sort out the alloc_contig_range() gfp flags mess
  mm/page_alloc: forward the gfp flags from alloc_contig_range() to
    post_alloc_hook()
  powernv/memtrace: use __GFP_ZERO with alloc_contig_pages()

 arch/powerpc/platforms/powernv/memtrace.c | 31 +++---------
 include/linux/page-isolation.h            |  2 +-
 mm/internal.h                             |  4 --
 mm/memory_hotplug.c                       |  3 +-
 mm/page_alloc.c                           | 62 +++++++++++++++++++----
 mm/page_isolation.c                       | 12 ++---
 6 files changed, 63 insertions(+), 51 deletions(-)

-- 
2.47.1


