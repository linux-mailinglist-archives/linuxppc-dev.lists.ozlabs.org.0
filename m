Return-Path: <linuxppc-dev+bounces-10809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D57B20C2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 16:40:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0y361JD5z3d2w;
	Tue, 12 Aug 2025 00:40:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754923201;
	cv=none; b=I2tZZjaWFwG0zvPwIhPW0r001KsWwiXE+a4EjofeHVvBlHrtmISeIpqUoW14nf08QpokuKc6mkL5L9Q0TwPoY0K5pCkAdNi2JIidvwPHaEi3rv4ODthL3C94n+GpFzaJ7rfOe4o/9YfIEGsS0rYlifpKuOWP0bhxDeahAnCIoGwjTrbYmMHE2K0qwRlgBZTzG0aEuby4NtAcUfAHPsKBnZULxdJSHPx1xIcoLtijy6EzG4IWbFmKchnC0Za6qHymVCzgLwWXz9W0wQNdyOnBAYcVQvYxZMcW5bAIUpfFsElBJH2bie9eg8I4rXSwrJ1j9fpjaB2UPDgoQiGC7F0WJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754923201; c=relaxed/relaxed;
	bh=3jBX4j3yDpmQs2pQdcmkFlIUwpnim2gbOcYS+XAZawI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BvYrnCa2DXXDyqcPqDiGwFGjeqIjRUKpbUHlHGQGa53mrc2Uausw4JTZU5Xfz4i4MwlzzVdCFU32ymcTKNnLlaBihbyQTjkbhjsAozv1Ajjd+5wJ+dMsQUB1zSihLxlRZEoPdeh6iDpo4WRzMC4QtITj439JbvYSa7mrOgqlNaJ0bEZwjxg1pasORXR+5NxAXLmddUbF4fuMtbPSMCM/83lBCljYbcAGoZsXWQDKqCbzUCyiwREeuA1tAsM6d8Sh79v6uQiC2Y2vnYhlbQVP0/hCzIv7eexyCkdxAhVgyUqCLiYRzaA/G/eMeqOaIH7wd/tNO2FmTZFGyTVQ4o2xfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AnU7Krjd; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VN24MNSn; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AnU7Krjd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VN24MNSn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0y340r4Vz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 00:39:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754923194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3jBX4j3yDpmQs2pQdcmkFlIUwpnim2gbOcYS+XAZawI=;
	b=AnU7Krjd+MixZdLvwFFmaxLBf5JwzArGHSRc6EIGK6fYus7gjYYePLSg3lIRpOplQf4Ezm
	CF18YD8UdXAXQG2mo+gjnJ7GZuP/ztHkFXKKpIahJAHKMDpbfmHKOhani2ycaCob6Ggqbq
	cqiBFIW4GkFDr0UvIWD36NdCcsxWti4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754923195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3jBX4j3yDpmQs2pQdcmkFlIUwpnim2gbOcYS+XAZawI=;
	b=VN24MNSnX8FATshQ9CkdFmTo8F/d3K1vFB83gSSpJPjNR1Ar/Dt3C8TLLfQ2GwKE3NNMvD
	zJ861SFH/nZS9EFvscsxikElANCIxpbWH7FWXbfo3LF7Ai9HDOrNIAqfnUaEBP1qKwhaPr
	B+Ci/aa0LArYcpu8xdVHF2WpYdiCWPc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-hzKnHrnVMI6jrQ3sWHY_8g-1; Mon, 11 Aug 2025 10:39:53 -0400
X-MC-Unique: hzKnHrnVMI6jrQ3sWHY_8g-1
X-Mimecast-MFC-AGG-ID: hzKnHrnVMI6jrQ3sWHY_8g_1754923192
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-458b301d9ccso24076025e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 07:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923192; x=1755527992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jBX4j3yDpmQs2pQdcmkFlIUwpnim2gbOcYS+XAZawI=;
        b=vw8Mqt33SeZRqnF/U6EPZw7BF9KxxYBy1cPCsT29x/QqAygNtMOTR4U9rjN46vdwIf
         XDemKNUCfABWh+W6b49tQmPrcSo8ZvXpwC3A89jC5OG0r0oZoAXeKs/MtraEMJYz7hSR
         Z8qADXLXSKSebJC9Tsdqxfjhcdg3cYTvoYc/dUeERYSf+uiIm9DMJvqGUL8q0c4QN8Np
         nF+B/R6X2LvkuACeE7VTZKintfVyc3ulMDemfak4KfwyVi8H2aEKcLefWArxAnlmUcgF
         kmFIDqj4raf5PY8X88o4aMjmVahm+3H/QV4OgD7wZzmv7rDeH8FF35v7juDOM6XOKrWv
         2chg==
X-Forwarded-Encrypted: i=1; AJvYcCWqJVglC3MN2opk6tXzN95rH7dypo6qpjnuqH24z9oz3e2wOGaWW2coszVret1nZ7NszTAQMQdE0J+GneI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLfKpJ/YKyg6zQO2ZWrvsv6lCHUNfmrSIID+WYbLTCRA7yILRz
	S07rLQTfAZsu1n1PcxG6ni2sntyHmjXDBnQIFEw27+jSkStRUghpNiWhrrLsOznX61MhgpRZIWT
	GLoF8Wg6T7WRnVBNMvb5M7Vch+ObdclLHmxmR4gv0K+0N9Ly6TeldoMkQkzVPIm+JUHA=
X-Gm-Gg: ASbGncu9GOkr4kr84wP/hO9lh9fBkuFNncieMJaXCMLI6XRQVipg56u/PJS7Uj8Mw7h
	1WCXBMO8/dV0Y8Iv0FClX8Ax5C4HVtKasczehllMeq/tdafnjyjK79tOqfyLcpU/0QGLMdQZezC
	miTAiChwkhLEz0+vR7ctHc0fIUA1ZjWEbl9t10LojD344vvkHOUBBOdzDINb1s8qJbLF6RW5HH3
	dg/qaAL42CDrdB3LQJc22v49NiKIGYjxpTHEUlRVYKVPCXhwkyQVO0MUU/rQeaJdMquFXffvaSU
	AHjtFxBiHhy51pzZzK2qvz9t7qYjZRXmwzq9vI6qrRs76ttxQYrN4x0q18r/I269+fdrsl1P2zz
	EaxDlkN2yl3UipD7psb14qKo0
X-Received: by 2002:a05:600c:1c18:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459f4f3e153mr122954995e9.8.1754923192296;
        Mon, 11 Aug 2025 07:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+bcYyrzEHtg5O8YCja39RJfZF3lc/0BwBvrhjiRJgNhfaMkviNPqO5gGtgSpeCPJqwbl5CQ==
X-Received: by 2002:a05:600c:1c18:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459f4f3e153mr122954665e9.8.1754923191851;
        Mon, 11 Aug 2025 07:39:51 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e0a24bf1sm280478765e9.1.2025.08.11.07.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 07:39:51 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Benjamin LaHaise <bcrl@kvack.org>,
	Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Kleikamp <shaggy@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v1 0/2] mm: remove MIGRATEPAGE_*
Date: Mon, 11 Aug 2025 16:39:46 +0200
Message-ID: <20250811143949.1117439-1-david@redhat.com>
X-Mailer: git-send-email 2.50.1
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
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dMVUu6i_LcmBA4iYJ9Lj2DplYXZM4KfcBhf2U2sW4Q0_1754923192
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is against mm/mm-new.

This series gets rid of MIGRATEPAGE_UNMAP, to then convert the remaining
MIGRATEPAGE_SUCCESS usage to simply use 0 instead.

Not sure if it makes sense to split the second patch up, a treewide
cleanup felt more reasonable for this simple change in an area where
I don't expect a lot of churn.

Briefly tested with virtio-mem in a VM, making sure that basic
page migration keeps working.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Eugenio Pérez" <eperezma@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Benjamin LaHaise <bcrl@kvack.org>
Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Dave Kleikamp <shaggy@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>

David Hildenbrand (2):
  mm/migrate: remove MIGRATEPAGE_UNMAP
  treewide: remove MIGRATEPAGE_SUCCESS

 arch/powerpc/platforms/pseries/cmm.c |  2 +-
 drivers/misc/vmw_balloon.c           |  4 +-
 drivers/virtio/virtio_balloon.c      |  2 +-
 fs/aio.c                             |  2 +-
 fs/btrfs/inode.c                     |  4 +-
 fs/hugetlbfs/inode.c                 |  4 +-
 fs/jfs/jfs_metapage.c                |  8 +--
 include/linux/migrate.h              | 11 +---
 mm/migrate.c                         | 80 ++++++++++++++--------------
 mm/migrate_device.c                  |  2 +-
 mm/zsmalloc.c                        |  4 +-
 11 files changed, 56 insertions(+), 67 deletions(-)


base-commit: 53c448023185717d0ed56b5546dc2be405da92ff
-- 
2.50.1


