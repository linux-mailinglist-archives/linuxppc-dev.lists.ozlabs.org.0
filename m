Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A7133374C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 09:31:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwQJn110Hz3d5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 19:31:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwQJS1KGqz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 19:30:47 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6CA5168B05; Wed, 10 Mar 2021 09:30:41 +0100 (CET)
Date: Wed, 10 Mar 2021 09:30:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH 1/9] fs: rename alloc_anon_inode to alloc_anon_inode_sb
Message-ID: <20210310083040.GA5217@lst.de>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-2-hch@lst.de> <YEhpiRCOUll6Ri6J@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEhpiRCOUll6Ri6J@google.com>
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
 Alex Williamson <alex.williamson@redhat.com>, Nadav Amit <namit@vmware.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 09, 2021 at 10:39:05PM -0800, Minchan Kim wrote:
> > -struct inode *alloc_anon_inode(struct super_block *s)
> > +struct inode *alloc_anon_inode_sb(struct super_block *s)
> >  {
> >  	static const struct address_space_operations anon_aops = {
> >  		.set_page_dirty = anon_set_page_dirty,
> 
> EXPORT_SYMBOL(alloc_anon_inode_sb) ?

Yes, I actually fixed this up shortly after sending the series.
