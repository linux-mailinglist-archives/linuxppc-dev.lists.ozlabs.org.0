Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7F108627
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 01:55:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LpVR5T6nzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 11:55:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="bf4wQj5h"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LpSb3JqyzDqZ2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 11:53:49 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id y10so15317749qto.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 16:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W5KvmIUsZXoQMVbzDoxYnt7yT+pQC9oHjmWUHowLIDE=;
 b=bf4wQj5hUYAUJ6J+IG0+hDMiHwo0y37jHBHT8UdhIIsQlzBQ4CxdtIHJrRj51DxlRK
 CKLiYZNarSFFj4FEgRzMNxy+kI0kMWkp2JP+w0At3xJ5awQQfKCflGDMEbLjgI1axJbX
 hAKULgjdId2ND6JafSG19IZ76B47iyKuc//kc4PjYIOLOtUHlwtDFurR95sHJjXvaqXY
 fGrur8LfkpaaQNAoNniODg3+dsAf2S2GrC+6cEhUlICPkA/CU1JiTx+UkO0BkI15CMLp
 7s5O7Rwk6bHEYMLHf8Cgu9Ix5CmyXm+g4xBp1CqvpB7TPmrxsr5ItFDOP1iwxt6Ai6Gn
 z9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W5KvmIUsZXoQMVbzDoxYnt7yT+pQC9oHjmWUHowLIDE=;
 b=aOiyySv5lB73WU8mN483pLMJlQBrnd6nbsCiFAK1baq+76h+ed42o1+r3LRjefQX6b
 G6++dCErGVdulAekC0JBjDRG7iKxIAVMhXWP9tzq3/TU/fuHNEZ2k3OrmOD7HQV490Gf
 1Ysy8FV6CLGcGozzN9Qrx8fMASwP7BbzXP0Wg72vaSyiahxYDuy5squB5BQqlQwnp3iV
 oj5FvqrXDx6C1Ldop/CBxgXEeTcm99H4b6TbzeYM9bdsOfiPzQJfLaZ016TJb92ULyLb
 hsSdb1NGYPT8273AqfggQdmz0Gs/bPqav/ISNj9zYI/Aqv/oBoFDAlXgevSnHaHyJ4cL
 MUQg==
X-Gm-Message-State: APjAAAW2WTmKylApdFiCgDwAe4Ycjqa5Z+vY2m8ZZZ9mUxa8FbPixLcD
 sZ0Ur/rEcT72gck9kUSicQT6fg==
X-Google-Smtp-Source: APXvYqyaLXo5MUyD+I9dO6HiLJFn2uWdH+8xt8jSkZ8bt7a48VQTUuqWsbmWyw/EGV6UxA2EsKJ0Ug==
X-Received: by 2002:ac8:2209:: with SMTP id o9mr27065091qto.246.1574643226463; 
 Sun, 24 Nov 2019 16:53:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id o124sm2535273qkf.66.2019.11.24.16.53.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Nov 2019 16:53:45 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iZ2dH-00020J-3s; Sun, 24 Nov 2019 20:53:39 -0400
Date: Sun, 24 Nov 2019 20:53:39 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 07/24] IB/umem: use get_user_pages_fast() to pin DMA
 pages
Message-ID: <20191125005339.GC5634@ziepe.ca>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-8-jhubbard@nvidia.com>
 <20191121080746.GC30991@infradead.org>
 <20191121143643.GC7448@ziepe.ca> <20191124100724.GH136476@unreal>
 <e8319590-a3f0-5ba4-af4c-65213358a742@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8319590-a3f0-5ba4-af4c-65213358a742@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 24, 2019 at 04:05:16PM -0800, John Hubbard wrote:
 
> I looked into this, and I believe that the problem is in gup.c. There appears to
> have been an oversight, in commit 817be129e6f2 ("mm: validate get_user_pages_fast
> flags"), in filtering out FOLL_FORCE. There is nothing in the _fast() implementation
> that requires that we avoid writing to the pages.

I think it is too late to be doing these kinds of changes, I will
revert the patch and this will miss this merge window.

Jason

From ec6cb45292d21d1af9b9d95997b8cf204bbe854c Mon Sep 17 00:00:00 2001
From: Jason Gunthorpe <jgg@mellanox.com>
Date: Sun, 24 Nov 2019 20:47:59 -0400
Subject: [PATCH] Revert "IB/umem: use get_user_pages_fast() to pin DMA pages"

This reverts commit c9a7a2ed837c563f9f89743a6db732591cb4035b.

This was merged before enough testing was done, and it triggers a WARN_ON()
in get_user_pages_fast():

  WARNING: CPU: 1 PID: 2557 at mm/gup.c:2404 get_user_pages_fast+0x115/0x180
  Call Trace:
   ib_umem_get+0x298/0x550 [ib_uverbs]
   mlx5_ib_db_map_user+0xad/0x130 [mlx5_ib]
   mlx5_ib_create_cq+0x1e8/0xaa0 [mlx5_ib]
   create_cq+0x1c8/0x2d0 [ib_uverbs]
   ib_uverbs_create_cq+0x70/0xa0 [ib_uverbs]
   ib_uverbs_handler_UVERBS_METHOD_INVOKE_WRITE+0xc2/0xf0 [ib_uverbs]
   ib_uverbs_cmd_verbs.isra.6+0x5be/0xbe0 [ib_uverbs]
   ? uverbs_disassociate_api+0xd0/0xd0 [ib_uverbs]
   ? kvm_clock_get_cycles+0xd/0x10
   ? kmem_cache_alloc+0x176/0x1c0
   ? filemap_map_pages+0x18c/0x350
   ib_uverbs_ioctl+0xc0/0x120 [ib_uverbs]
   do_vfs_ioctl+0xa1/0x610
   ksys_ioctl+0x70/0x80
   __x64_sys_ioctl+0x16/0x20
   do_syscall_64+0x42/0x110
   entry_SYSCALL_64_after_hwframe+0x44/0xa9

2404         if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM)))
2405                 return -EINVAL;

While we think this WARN_ON is probably bogus, resolving this will have to
wait.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/infiniband/core/umem.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 214e87aa609d6e..7a3b99597eada1 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -266,13 +266,16 @@ struct ib_umem *ib_umem_get(struct ib_udata *udata, unsigned long addr,
 	sg = umem->sg_head.sgl;
 
 	while (npages) {
-		ret = get_user_pages_fast(cur_base,
-					  min_t(unsigned long, npages,
-						PAGE_SIZE /
-						sizeof(struct page *)),
-					  gup_flags | FOLL_LONGTERM, page_list);
-		if (ret < 0)
+		down_read(&mm->mmap_sem);
+		ret = get_user_pages(cur_base,
+				     min_t(unsigned long, npages,
+					   PAGE_SIZE / sizeof (struct page *)),
+				     gup_flags | FOLL_LONGTERM,
+				     page_list, NULL);
+		if (ret < 0) {
+			up_read(&mm->mmap_sem);
 			goto umem_release;
+		}
 
 		cur_base += ret * PAGE_SIZE;
 		npages   -= ret;
@@ -280,6 +283,8 @@ struct ib_umem *ib_umem_get(struct ib_udata *udata, unsigned long addr,
 		sg = ib_umem_add_sg_table(sg, page_list, ret,
 			dma_get_max_seg_size(context->device->dma_device),
 			&umem->sg_nents);
+
+		up_read(&mm->mmap_sem);
 	}
 
 	sg_mark_end(sg);
-- 
2.24.0

