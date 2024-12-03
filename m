Return-Path: <linuxppc-dev+bounces-3694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5239E15EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 09:38:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2YvT6NNrz2yVt;
	Tue,  3 Dec 2024 19:38:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733215093;
	cv=none; b=WPulkGf6a8yvPceh2FOKa8luMvaYltjeKJvL0GP7IupWnjx5twNkh9uDIVF0VJpgLnNFqh1j89dv0zwsPejqcrYJuTHXz0p53oy5XTUY7z1aDnSHJYxoUFSQZCI/re8eFsvawe8u6EN6TORk2mVz3Ba7nHXKh0kkXnKfSA+fN2iSefoBgGFU3tt4rzJHyumrQYChxZZskjV55kNx/I3LUnLufp8O8kC0tlffCJV5ImRqexGKwI/GQ4EPKxeN/Bf9GZRkK7BYoGaf74UAtYP6s7Bk7L2wsE/4ZNGnc+jxzYuNmzW99XJ9lWQ8vEGupCYjDSnJA/yuH42OgcoQ/I92ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733215093; c=relaxed/relaxed;
	bh=nZgnwRofquDisPupcvXEoz+OH4Gw/VsFrsLE5SFZYPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azU2VPldWlj7agDWW/+g/BnVJMJ8BPEdrwLDc2/f8r3am9nTv0TLRQko1NxMGiaFlTrIbP9gj9ImtgL0qBTbfjMWeergxgYGEHqaJGiaoNYNAFwyuD1bCDh76PPxl3VgfLgRAmr0JXvaaw+4PKP7rGFYhFhh5N/v2k53hbkdaImfBBYHxba4DmbqxohOz08HXBM5NRHVfDBMhKuTozhTKTaW9vnJmxVJGGvMzrc/+Bctyfi+Oa6nTVCCVce3WGeSPNnTSRkbdrwMeT1rDlXS7x8u7o/d4msRNE6ezdXKnYHz3NAUbhO2WcbuoGRM4KuBLqgk+AFK1cHJJY7F30Urmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWaretu3; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hqvceVXv; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWaretu3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hqvceVXv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2YvS5f2kz2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 19:38:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nZgnwRofquDisPupcvXEoz+OH4Gw/VsFrsLE5SFZYPI=;
	b=fWaretu36BHD7kwpaj+N2KK3ODOcFE5wLmcJAZ5FdLfLFUkO/ZpXgxLl4mOFf65WPDkGc9
	SsBDmQBTAj6ivZhl9PzYmQT3Z37x62sUzJpTAuBZXnozixRxUBYf87608jn2V9rvgxMYgE
	CysdzG6ShCMUeSHVzAA/2x1EKzctWA8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733215089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nZgnwRofquDisPupcvXEoz+OH4Gw/VsFrsLE5SFZYPI=;
	b=hqvceVXvp47jp33kD1Ho09/jZ+hLRviE3bTvMpb2fDu0IpXzk9L3iGgSLUMRT8p79w5+BO
	zOOchxOUVY+gnryK/Kj9mBVeahdn93VCCDm1+d/VTTmH4WR45oN8TI5Mlblxt2AI/PtcPl
	DcnU19ZW5CwWxvx6S+pXPg8/dW1Q76c=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-353-28AAsukmNAeuT1N0EefuoA-1; Tue,
 03 Dec 2024 03:38:05 -0500
X-MC-Unique: 28AAsukmNAeuT1N0EefuoA-1
X-Mimecast-MFC-AGG-ID: 28AAsukmNAeuT1N0EefuoA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 148751955F4A;
	Tue,  3 Dec 2024 08:38:03 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.22.88.109])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4072030001A0;
	Tue,  3 Dec 2024 08:37:57 +0000 (UTC)
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
Subject: [PATCH v2 0/6] mm/page_alloc: gfp flags cleanups for alloc_contig_*()
Date: Tue,  3 Dec 2024 09:37:50 +0100
Message-ID: <20241203083756.112975-1-david@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For some reason v1 didn't make it to linux-mm; let's see if the problem
persists.

Let's clean up the gfp flags handling, and support __GFP_ZERO, such that we
can finally remove the TODO in memtrace code.

I did some alloc_contig_*() testing with virtio-mem and hugetlb; I did not
test powernv/memtrace -- I cross-compiled it, though.

v1 -> v2:
* "mm/page_alloc: forward the gfp flags from alloc_contig_range() to
   post_alloc_hook()"
 -> Fixup patch description

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


base-commit: 679694cdccaf75df589c2737f233954669a5f601
-- 
2.47.1


