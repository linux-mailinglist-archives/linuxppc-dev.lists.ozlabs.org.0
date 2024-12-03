Return-Path: <linuxppc-dev+bounces-3703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B90699E1829
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 10:47:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2bRk0dX9z2y1W;
	Tue,  3 Dec 2024 20:47:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733219266;
	cv=none; b=FLUZXoKBpcHGzw/yGTxt9G7XLmwr5UmvG16PMS4CtS/acFGj935Sz7ChEtKK2g8ADR+XZnzwiEMHisBg/ZIdOXwPrGkQbRVDXfpMjU8Z1B6asjjscCgzQqlzOluo+XgaNsH99QAZxt9/1eJ5wimdQ1lvwgi9DJzntvgYDXy9BxI5tL6nzb1iricP5N6YaIhyPvu+L4msH6sAEtauh67nZv/jmLt4b4LhI6ia2SMktqPUrez0vBzqEy9SpuDhbdIDCO+ECvJRnlsOEA6rXEp2ioFV8tf/6tMSQfDiMWOdAoNJoI8HMn/WZxAwi6fK5l8bAzdMsqhsEGGglvjWOfyqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733219266; c=relaxed/relaxed;
	bh=I+WpaV6OWdi5kvpk6n/53fQFkDnKmQdF+vIgGPak5jU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=dAMCodJwq7UdN2T1z5L66QWDxDpQPdp7tA73U93eTN/CmGub2+IxiM1fga3CUn4SM4Vx96f20FTUNqqO5kywSUgUW1mvp52Rv5eQuOFPARTccBMar1eSim+/TlhDHIXNcKzTOXT3mC3LhbqEZBP3iVH6NMbHCqLOx/TdKZwvE2mwc8E3zx7vahv99AZfiU7Wuv1+x/b1jLSUFnUa0ep0mucjvpXk8plOS+B2nIy0vE89ly3jq0ZjEBOtajfeOa8MKQ2VCUE8+YEnL9SrnZ/phoS4WzaFtdKn7uexjpWCj3h5J84riGtXNncU5PA5ktoAXIggD/i6DhrVrvi+G0wsWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHg26Ek6; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHg26Ek6; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHg26Ek6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VHg26Ek6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2bRg5YyFz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 20:47:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I+WpaV6OWdi5kvpk6n/53fQFkDnKmQdF+vIgGPak5jU=;
	b=VHg26Ek6cYMzZ2nMA3wtK824Ty8O5gqzQQsVY7GRrDlZip3ORdBm2HT349mD2ur6qjNZMz
	V7gQfcYB5uRaJZVGENy3A8R2TT1FBbeCpYU4CFaorqoLYS6Z5rGuJtkdenF32oewjUaoUn
	VoRb49QBHx51S95SwcU0DewzCdj/OJc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I+WpaV6OWdi5kvpk6n/53fQFkDnKmQdF+vIgGPak5jU=;
	b=VHg26Ek6cYMzZ2nMA3wtK824Ty8O5gqzQQsVY7GRrDlZip3ORdBm2HT349mD2ur6qjNZMz
	V7gQfcYB5uRaJZVGENy3A8R2TT1FBbeCpYU4CFaorqoLYS6Z5rGuJtkdenF32oewjUaoUn
	VoRb49QBHx51S95SwcU0DewzCdj/OJc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-iEJT7FKCNe2qiQ7RFeyHzw-1; Tue, 03 Dec 2024 04:47:37 -0500
X-MC-Unique: iEJT7FKCNe2qiQ7RFeyHzw-1
X-Mimecast-MFC-AGG-ID: iEJT7FKCNe2qiQ7RFeyHzw
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ffd18cf7c8so30883311fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 01:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219255; x=1733824055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+WpaV6OWdi5kvpk6n/53fQFkDnKmQdF+vIgGPak5jU=;
        b=tNTTTuVqUfp8D0G2JcGRZj5tGWRN0Q6iUUfNRcRwEb+dHJo7hjc+sfQ16zd7DJz9W7
         2/zUPcCPZRfDaUWiT1r6GxRKLQjJxuJRDDCRG39sf9hsDQX9fZze/bl7EB09kuQOeq2D
         OyNEBD251Q/cr7qX5NERpQiWwh+/1zVWb7xi+vUMayEtpgUfPC7zsYaecVhNy4rbnLJ2
         F5whnT+h5WeNFPp8JmPeSws+YF/OLtVK0+GxuOCCVBOG+rhR2R4S5UssphM/gxVZdGDc
         TRKisAj1GDad/lhosaK9VXOoYVeo8nDoHu+n0H0GPvXTI4suvhBDzYUfIoZ6XAA49iHq
         VACw==
X-Forwarded-Encrypted: i=1; AJvYcCWBNL6xYdsCiB+EvQtOQJ7cok7O6QXgLOhkbY8aLCXE1P+Gw0gDiS5TZx42Y1K5j5AxdpDO12xz+W2Kl7k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxl70r7awXtwmRGjogxK/hq4mwVD1glFINNZyNDLbc9TA95G7GA
	ZylL4VMLn3tGE+QEwYrgIBg7JVuaVCWV2/AVClBcB2npIUqH0ArbqYQRnLN3uZ5wGeZGj4KdDZQ
	D/d7pNlVFmCTWSTjjCB1dBgfMe28RyiKuuNxTXPZNNbQo+As4TKDbhafWMflIPSI=
X-Gm-Gg: ASbGncsAFFp0CTU3hcJFtgix11SI9s1N+V/QrUqyVHxkR2l8XzaAeh07hCdij3e3Z/E
	F3Mo/z0osRblNYUFOlRepjX96QmAE74TIHv0LzZ3J04G1gqQGISVPntZNx+nO1rhv7JWfsGLPV4
	8NjujzB/fv+FcniVfDk7pas0c+/v3Fx3C4N3bMIPJ4EdawllkGV95GSA2WHWEfjdRfuER3uVe0N
	j6T8gZtH1dOUVhLlOmHU4PNQS9Y0RyOQA/XmpaD8hkYDFL5mdp6JpMTdBknT+XyfIpVZwaufnPb
	v95exV4F8hsMBcsOuJnq4Kh1QKLEZCiixNc=
X-Received: by 2002:a05:6512:3f1f:b0:53d:eefc:2b48 with SMTP id 2adb3069b0e04-53e12a01888mr1168018e87.33.1733219255514;
        Tue, 03 Dec 2024 01:47:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7ix1vCCH64WEfdTl8JuJR8R5JVe6DQ6ETyTqieE4HgQ8WDhb2jympdCPhJGy/Jq9uyRGFBg==
X-Received: by 2002:a05:6512:3f1f:b0:53d:eefc:2b48 with SMTP id 2adb3069b0e04-53e12a01888mr1168001e87.33.1733219255133;
        Tue, 03 Dec 2024 01:47:35 -0800 (PST)
Received: from localhost (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-434b0f7dccasm182037325e9.43.2024.12.03.01.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:47:34 -0800 (PST)
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
Subject: [PATCH RESEND v2 0/6] mm/page_alloc: gfp flags cleanups for alloc_contig_*()
Date: Tue,  3 Dec 2024 10:47:26 +0100
Message-ID: <20241203094732.200195-1-david@redhat.com>
X-Mailer: git-send-email 2.47.1
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dRxYCfqg02W1hpXIfzSvaCFYMQBLgOrOpn-mdpUPBBc_1733219256
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For some reason v1 didn't make it to linux-mm; same with v2. Let's try
a different SMTP server (gmail), maybe there are some issues with the
RH one ...

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


