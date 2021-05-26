Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E95FC390FCA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 06:50:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqdmY0FJtz2xZp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 14:50:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqdm06pDkz2yXl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 14:49:51 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3ADA76736F; Wed, 26 May 2021 06:49:44 +0200 (CEST)
Date: Wed, 26 May 2021 06:49:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: simplify gendisk and request_queue allocation for bio based
 drivers
Message-ID: <20210526044943.GA28551@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
 <CAPDyKFpqdSYeA+Zg=9Ewi46CmSWNpXQbju6HQo7aviCcRzyAAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpqdSYeA+Zg=9Ewi46CmSWNpXQbju6HQo7aviCcRzyAAg@mail.gmail.com>
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
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
 dm-devel@redhat.com, linux-bcache@vger.kernel.org,
 Joshua Morris <josh.h.morris@us.ibm.com>, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Christoph Hellwig <hch@lst.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matias Bjorling <mb@lightnvm.io>,
 Nitin Gupta <ngupta@vflare.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Alex Dubov <oakad@yahoo.com>,
 Heiko Carstens <hca@linux.ibm.com>, Coly Li <colyli@suse.de>,
 linux-block <linux-block@vger.kernel.org>, linux-m68k@lists.linux-m68k.org,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Chris Zankel <chris@zankel.net>, linux-raid@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 26, 2021 at 12:41:37AM +0200, Ulf Hansson wrote:
> On Fri, 21 May 2021 at 07:51, Christoph Hellwig <hch@lst.de> wrote:
> >
> > Hi all,
> >
> > this series is the first part of cleaning up lifetimes and allocation of
> > the gendisk and request_queue structure.  It adds a new interface to
> > allocate the disk and queue together for bio based drivers, and a helper
> > for cleanup/free them when a driver is unloaded or a device is removed.
> 
> May I ask what else you have in the pipe for the next steps?
> 
> The reason why I ask is that I am looking into some issues related to
> lifecycle problems of gendisk/mmc, typically triggered at SD/MMC card
> removal.

In the short run not much more than superficial cleanups.  Eventually
I want bio based drivers to not require a separate request_queue, leaving
that purely as a data structure for blk-mq based drivers.  But it will
take a while until we get there, so it should not block any fixes.

For hot unplug handling it might be worth to take a look at nvme, as it
is tested a lot for that case.
