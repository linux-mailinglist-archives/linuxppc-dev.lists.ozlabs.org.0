Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C04068A21B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 19:39:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7kvq37psz3fFt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 05:39:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=jefflexu@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 303 seconds by postgrey-1.36 at boromir; Fri, 03 Feb 2023 20:54:46 AEDT
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7WGZ297fz3c9V
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 20:54:45 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0VaoUwBD_1675417773;
Received: from 30.221.129.149(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0VaoUwBD_1675417773)
          by smtp.aliyun-inc.com;
          Fri, 03 Feb 2023 17:49:35 +0800
Message-ID: <160b9e99-bff6-e37c-5f16-00157766535e@linux.alibaba.com>
Date: Fri, 3 Feb 2023 17:49:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: make alloc_anon_inode more useful
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20210309155348.974875-1-hch@lst.de>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <20210309155348.974875-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 04 Feb 2023 05:37:56 +1100
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>, "VMware, Inc." <pv-drivers@vmware.com>, "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>, Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Sorry for digging...

This patch series seems useful for fs developers.  I'm not sure its
current status and why it doesn't get merged.


On 3/9/21 11:53 PM, Christoph Hellwig wrote:
> Hi all,
> 
> this series first renames the existing alloc_anon_inode to
> alloc_anon_inode_sb to clearly mark it as requiring a superblock.
> 
> It then adds a new alloc_anon_inode that works on the anon_inode
> file system super block, thus removing tons of boilerplate code.
> 
> The few remainig callers of alloc_anon_inode_sb all use alloc_file_pseudo
> later, but might also be ripe for some cleanup.
> 
> Diffstat:
>  arch/powerpc/platforms/pseries/cmm.c |   27 +-------------
>  drivers/dma-buf/dma-buf.c            |    2 -
>  drivers/gpu/drm/drm_drv.c            |   64 +----------------------------------
>  drivers/misc/cxl/api.c               |    2 -
>  drivers/misc/vmw_balloon.c           |   24 +------------
>  drivers/scsi/cxlflash/ocxl_hw.c      |    2 -
>  drivers/virtio/virtio_balloon.c      |   30 +---------------
>  fs/aio.c                             |    2 -
>  fs/anon_inodes.c                     |   15 +++++++-
>  fs/libfs.c                           |    2 -
>  include/linux/anon_inodes.h          |    1 
>  include/linux/fs.h                   |    2 -
>  kernel/resource.c                    |   30 ++--------------
>  mm/z3fold.c                          |   38 +-------------------
>  mm/zsmalloc.c                        |   48 +-------------------------
>  15 files changed, 39 insertions(+), 250 deletions(-)
> 

-- 
Thanks,
Jingbo
