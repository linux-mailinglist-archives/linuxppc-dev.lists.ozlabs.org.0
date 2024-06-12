Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F3904A66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 06:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzYB91CKYz3fqr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 14:54:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzY9m1Jm4z3cbd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 14:54:36 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6904768BEB; Wed, 12 Jun 2024 06:54:29 +0200 (CEST)
Date: Wed, 12 Jun 2024 06:54:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 13/26] block: move cache control settings out of
 queue->flags
Message-ID: <20240612045429.GB26776@lst.de>
References: <20240611051929.513387-1-hch@lst.de> <20240611051929.513387-14-hch@lst.de> <d21b162a-1fd3-4fd1-a17f-f127f964bdf1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d21b162a-1fd3-4fd1-a17f-f127f964bdf1@kernel.org>
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, nbd@other.debian.org, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 04:55:04PM +0900, Damien Le Moal wrote:
> On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> > Move the cache control settings into the queue_limits so that they
> > can be set atomically and all I/O is frozen when changing the
> > flags.
> 
> ...so that they can be set atomically with the device queue frozen when
> changing the flags.
> 
> may be better.

Sure.

If there was anything below I've skipped it after skipping over two
pages of full quotes.

