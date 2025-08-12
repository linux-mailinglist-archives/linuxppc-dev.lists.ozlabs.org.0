Return-Path: <linuxppc-dev+bounces-10854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C559B21E5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 08:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1MBm3lPNz3dLq;
	Tue, 12 Aug 2025 16:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754980384;
	cv=none; b=boBZ+KpJ+9uD+OmH3qXEC3bbu5WfYPAPQHLQFgNDgn/dJGW9eHSlDMl7OkjzOZ7NVYSxKztoxdTgj2+WveP/wWyv9RnZ0co4lMjhVsIgBsR8de8fAmykrK8oV6Vh7tf1/keS1ygYs7FK2nR5B6B9YSPzT2HwRrj1uGq26iZ5hSS2RYP9qH9vqzR9NRuminYghyb6t5WI5gHdSBJ8k4MvaBGpT2pWmh5iQPHYNaoHIIkfXcMKKnwaahaHqARn4ddNCLJJJ8C/batsPKMwUqJWpfAVQVLZ6wYnxJY0QN1gkCXQ2xu1rJ31xnki8rdMBnDSsqEI3X8FuXJRjG6gPdONWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754980384; c=relaxed/relaxed;
	bh=80CcYUyhFS51zi8RkV5UHs4TwEeN2kI+C7wf490nVe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ps0Cpp/kPbYOpL7kTOLmww9V3L7QQwsdLnmjiPkhNasOvFSQQyhEdmUJaR82FkfydJXAlAGu+JsThcJottMdTIAcLXyTPVOPVjxRJO982MOdtiXeVLgFT4jSbUhXPPKBWGBDHmRN56iEdTUItkMdW/eFYJqxN4P5G2l+MBi9wywg9jLPoBQSbKmSsylmfxAGwg/6qL/Erwu5Kthk9lvPZcEZOSlTGTHxFDw++phvMztur57TzOzcCIdmk3mPG3Zw0svoZY+0T4pvgcvWGBY4DZtcrfg/U6pbt8aACKGwRoUbVB0G4486knBjoQNtTqXhPtCWdrGjkLXxyX5wxbKZ/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o3Zdl07+; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o3Zdl07+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1MBl32Pzz3dLN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 16:33:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53FB361138;
	Tue, 12 Aug 2025 06:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5D8C4CEF0;
	Tue, 12 Aug 2025 06:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754980380;
	bh=L+sX4qQqPbDUBLkuV1Ks7WnwsWzP4JYCHfnG9R60EsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3Zdl07+nWJldBMbMVuKTfEaKA02+JJIAzDpjCNhxFWBMLdaRJJhBmPRrgtO3jhOn
	 3DLPc/DlinkClYmp8AGn0qc5ZzONh5I+O4JSq3yBXwTxghSqeequDUZMB4Ps5ZU4fP
	 axmDeKecaYk3Uif6H2WsVrS0XFX4G8URQzeK1yi8=
Date: Tue, 12 Aug 2025 08:32:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Benjamin LaHaise <bcrl@kvack.org>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Kleikamp <shaggy@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v1 2/2] treewide: remove MIGRATEPAGE_SUCCESS
Message-ID: <2025081248-frisbee-empathic-1815@gregkh>
References: <20250811143949.1117439-1-david@redhat.com>
 <20250811143949.1117439-3-david@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811143949.1117439-3-david@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 11, 2025 at 04:39:48PM +0200, David Hildenbrand wrote:
> At this point MIGRATEPAGE_SUCCESS is misnamed for all folio users,
> and now that we remove MIGRATEPAGE_UNMAP, it's really the only "success"
> return value that the code uses and expects.
> 
> Let's just get rid of MIGRATEPAGE_SUCCESS completely and just use "0"
> for success.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/platforms/pseries/cmm.c |  2 +-
>  drivers/misc/vmw_balloon.c           |  4 +--
>  drivers/virtio/virtio_balloon.c      |  2 +-
>  fs/aio.c                             |  2 +-
>  fs/btrfs/inode.c                     |  4 +--
>  fs/hugetlbfs/inode.c                 |  4 +--
>  fs/jfs/jfs_metapage.c                |  8 +++---
>  include/linux/migrate.h              | 10 +------
>  mm/migrate.c                         | 40 +++++++++++++---------------
>  mm/migrate_device.c                  |  2 +-
>  mm/zsmalloc.c                        |  4 +--
>  11 files changed, 36 insertions(+), 46 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

