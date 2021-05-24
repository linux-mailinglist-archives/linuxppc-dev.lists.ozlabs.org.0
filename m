Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A7438E16C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 09:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpTBy4m9Nz30GR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 17:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpTBb1sBXz2xYg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 17:20:22 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A686B67373; Mon, 24 May 2021 09:20:13 +0200 (CEST)
Date: Mon, 24 May 2021 09:20:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [dm-devel] [PATCH 01/26] block: refactor device number setup
 in __device_add_disk
Message-ID: <20210524072013.GA23890@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
 <20210521055116.1053587-2-hch@lst.de>
 <20210521171646.GA25017@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521171646.GA25017@42.do-not-panic.com>
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
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Mike Snitzer <snitzer@redhat.com>, linux-m68k@vger.kernel.org,
 linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
 dm-devel@redhat.com, Joshua Morris <josh.h.morris@us.ibm.com>,
 linux-s390@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Christoph Hellwig <hch@lst.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matias Bjorling <mb@lightnvm.io>,
 Nitin Gupta <ngupta@vflare.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Alex Dubov <oakad@yahoo.com>,
 Heiko Carstens <hca@linux.ibm.com>, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
 Jim Paris <jim@jtan.com>, Minchan Kim <minchan@kernel.org>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 05:16:46PM +0000, Luis Chamberlain wrote:
> > -	/* in consecutive minor range? */
> > -	if (bdev->bd_partno < disk->minors) {
> > -		*devt = MKDEV(disk->major, disk->first_minor + bdev->bd_partno);
> > -		return 0;
> > -	}
> > -
> 
> It is not obviously clear to me, why this was part of add_disk()
> path, and ...
> 
> > diff --git a/block/partitions/core.c b/block/partitions/core.c
> > index dc60ecf46fe6..504297bdc8bf 100644
> > --- a/block/partitions/core.c
> > +++ b/block/partitions/core.c
> > @@ -379,9 +380,15 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
> >  	pdev->type = &part_type;
> >  	pdev->parent = ddev;
> >  
> > -	err = blk_alloc_devt(bdev, &devt);
> > -	if (err)
> > -		goto out_put;
> > +	/* in consecutive minor range? */
> > +	if (bdev->bd_partno < disk->minors) {
> > +		devt = MKDEV(disk->major, disk->first_minor + bdev->bd_partno);
> > +	} else {
> > +		err = blk_alloc_ext_minor();
> > +		if (err < 0)
> > +			goto out_put;
> > +		devt = MKDEV(BLOCK_EXT_MAJOR, err);
> > +	}
> >  	pdev->devt = devt;
> >  
> >  	/* delay uevent until 'holders' subdir is created */
> 
> ... and why we only add this here now.

For the genhd minors == 0 (aka GENHD_FL_EXT_DEVT) implies having to
allocate a dynamic dev_t, so it can be folded into another conditional.
