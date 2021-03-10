Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DE7333779
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 09:37:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwQSS4y2lz3d3m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 19:37:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwQS75BsMz30HJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 19:37:27 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5F87968B05; Wed, 10 Mar 2021 09:37:23 +0100 (CET)
Date: Wed, 10 Mar 2021 09:37:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: make alloc_anon_inode more useful
Message-ID: <20210310083723.GC5217@lst.de>
References: <20210309155348.974875-1-hch@lst.de>
 <20210310040545.GM3479805@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310040545.GM3479805@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 10, 2021 at 04:05:45AM +0000, Matthew Wilcox wrote:
> On Tue, Mar 09, 2021 at 04:53:39PM +0100, Christoph Hellwig wrote:
> > this series first renames the existing alloc_anon_inode to
> > alloc_anon_inode_sb to clearly mark it as requiring a superblock.
> > 
> > It then adds a new alloc_anon_inode that works on the anon_inode
> > file system super block, thus removing tons of boilerplate code.
> > 
> > The few remainig callers of alloc_anon_inode_sb all use alloc_file_pseudo
> > later, but might also be ripe for some cleanup.
> 
> On a somewhat related note, could I get you to look at
> drivers/video/fbdev/core/fb_defio.c?
> 
> As far as I can tell, there's no need for fb_deferred_io_aops to exist.
> We could just set file->f_mapping->a_ops to NULL, and set_page_dirty()
> would do the exact same thing this code does (except it would get the
> return value correct).

> But maybe that would make something else go wrong that distinguishes
> between page->mapping being NULL and page->mapping->a_ops->foo being NULL?

I can't find any place in the kernel that treats a NULL aops different
from not having the method it is looking for. 

> Completely untested patch ...

the patch looks mostly good to me.

>  	}
> -#ifdef CONFIG_FB_DEFERRED_IO
> -	if (info->fbdefio)
> -		fb_deferred_io_open(info, inode, file);
> -#endif
> +	file->f_mapping->a_ops = NULL;

But I'd also skip this.  Drivers generally do not set aops, but if they
do a funtion like this really should not override it.  This will require
an audit of the callers, though.
