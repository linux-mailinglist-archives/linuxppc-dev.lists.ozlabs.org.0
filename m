Return-Path: <linuxppc-dev+bounces-10823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E348B21A28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 03:30:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1DTQ0rTbz3cnN;
	Tue, 12 Aug 2025 11:30:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754962218;
	cv=none; b=OGj5b3jytKROozpauFDTMaLdH2NZRGZb/516EvLtPRtxJwY7KX/0iFvn5qIySQsp5iBeVnZFB0sackm41X0ecQiQB0HSU/Y7ePvk8/1ixkL/CM8hc7hHLyw76nTwJRQdlqbPsCZfm8XzfTbgAsg/MDmsjMKHM3o1T3zrHuXBB0X9Ek6DfVvldjLJlHSoFQsnEdd/lPEY3bLop7S+FJ4NVZyOUN7sKPck1/r2fdzn2aFs1tAannWS5kjk4pdoK7yfsQXV11kTnu6+smSlIuWGyXg2c41nQhOQMp8k2LOHDfWVHiy/s3ZtOnT5cABQ1f3UT0kSsTW7Fl62DlhH+jusUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754962218; c=relaxed/relaxed;
	bh=djZxdkbYS5ABjJh5vZ+OSyzqxKEA12clHOn12k1eFBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Js1IrjoqhI8Vu1SaqBYZUa5/Ulu6Rv8pRuJ2PEbusd8SKiVIg3YMkZTShUPhQBc0smrRoqvu8tWV4OatCza49gLgx+xVHaI4bFUh9EgMzl65GtT8koiYmqniM3XmWmr7b0lbRul1ouc/kb+fVBd3OJ9XqxWa3R7wJo3LJngdvz5AoyTn8aX1SH1px6LCQtORDEzatMJ0+atu68x9Ft0nOXsk/iNtUvkhBsy4eXbH7kZQA6z/gxsJzfxvIvbtO9YDYvh+8IHSXZxXt/LOZwhacGxlCAu4fA+wyGQTNbtAAmXyL4+rgSF4yVAXYfm2vYKpfYXgi1sMYcmqcaOhqiSlbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JMbfwpsR; dkim-atps=neutral; spf=pass (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JMbfwpsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1DTN1svlz3ck4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 11:30:14 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754962210; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=djZxdkbYS5ABjJh5vZ+OSyzqxKEA12clHOn12k1eFBw=;
	b=JMbfwpsRNCi9vQ8K0CdPK0zFsmtjl1OT5ze7/nvcC9uy1+BBNgnJzrXzYo/jsMsVasDPYYjhUbEL4r0yaX89uL9z80p/b5ORZUZIyBKo2n7zC/7pwar7Es6i3EZ6u8anU7cbm5tcI49YJa+A9LIyWz09nPLOifv3+UzTQQDKM9s=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WlYvemQ_1754962181 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 Aug 2025 09:30:08 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  linuxppc-dev@lists.ozlabs.org,  virtualization@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-aio@kvack.org,
  linux-btrfs@vger.kernel.org,  jfs-discussion@lists.sourceforge.net,
  Andrew Morton <akpm@linux-foundation.org>,  Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Michael Ellerman <mpe@ellerman.id.au>,  Nicholas
 Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Jerrin Shaji George
 <jerrin.shaji-george@broadcom.com>,  Arnd Bergmann <arnd@arndb.de>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>,  Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?=
 <eperezma@redhat.com>,
  Alexander Viro <viro@zeniv.linux.org.uk>,  Christian Brauner
 <brauner@kernel.org>,  Jan Kara <jack@suse.cz>,  Benjamin LaHaise
 <bcrl@kvack.org>,  Chris Mason <clm@fb.com>,  Josef Bacik
 <josef@toxicpanda.com>,  David Sterba <dsterba@suse.com>,  Muchun Song
 <muchun.song@linux.dev>,  Oscar Salvador <osalvador@suse.de>,  Dave
 Kleikamp <shaggy@kernel.org>,  Zi Yan <ziy@nvidia.com>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,  Rakie
 Kim <rakie.kim@sk.com>,  Byungchul Park <byungchul@sk.com>,  Gregory Price
 <gourry@gourry.net>,  Alistair Popple <apopple@nvidia.com>,  Minchan Kim
 <minchan@kernel.org>,  Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v1 0/2] mm: remove MIGRATEPAGE_*
In-Reply-To: <20250811143949.1117439-1-david@redhat.com> (David Hildenbrand's
	message of "Mon, 11 Aug 2025 16:39:46 +0200")
References: <20250811143949.1117439-1-david@redhat.com>
Date: Tue, 12 Aug 2025 09:29:40 +0800
Message-ID: <87bjolgwe3.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi, David,

David Hildenbrand <david@redhat.com> writes:

> This is against mm/mm-new.
>
> This series gets rid of MIGRATEPAGE_UNMAP, to then convert the remaining
> MIGRATEPAGE_SUCCESS usage to simply use 0 instead.
>
> Not sure if it makes sense to split the second patch up, a treewide
> cleanup felt more reasonable for this simple change in an area where
> I don't expect a lot of churn.
>
> Briefly tested with virtio-mem in a VM, making sure that basic
> page migration keeps working.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Cc: "Eugenio P=C3=A9rez" <eperezma@redhat.com>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Benjamin LaHaise <bcrl@kvack.org>
> Cc: Chris Mason <clm@fb.com>
> Cc: Josef Bacik <josef@toxicpanda.com>
> Cc: David Sterba <dsterba@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Dave Kleikamp <shaggy@kernel.org>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Minchan Kim <minchan@kernel.org>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
>
> David Hildenbrand (2):
>   mm/migrate: remove MIGRATEPAGE_UNMAP
>   treewide: remove MIGRATEPAGE_SUCCESS

LGTM.  Feel free to add my

Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

for the whole series in the future versions.

>  arch/powerpc/platforms/pseries/cmm.c |  2 +-
>  drivers/misc/vmw_balloon.c           |  4 +-
>  drivers/virtio/virtio_balloon.c      |  2 +-
>  fs/aio.c                             |  2 +-
>  fs/btrfs/inode.c                     |  4 +-
>  fs/hugetlbfs/inode.c                 |  4 +-
>  fs/jfs/jfs_metapage.c                |  8 +--
>  include/linux/migrate.h              | 11 +---
>  mm/migrate.c                         | 80 ++++++++++++++--------------
>  mm/migrate_device.c                  |  2 +-
>  mm/zsmalloc.c                        |  4 +-
>  11 files changed, 56 insertions(+), 67 deletions(-)
>
>
> base-commit: 53c448023185717d0ed56b5546dc2be405da92ff

---
Best Regards,
Huang, Ying

