Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE51539C8F3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 16:03:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fy1ZD4j0tz30D8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 00:03:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fy1Yp21hXz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 00:03:08 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8575C6736F; Sat,  5 Jun 2021 16:02:57 +0200 (CEST)
Date: Sat, 5 Jun 2021 16:02:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: simplify gendisk and request_queue allocation for blk-mq based
 drivers
Message-ID: <20210605140257.GA13166@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
 <YLpNqiw0LMkYWUyN@0xbeefdead.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLpNqiw0LMkYWUyN@0xbeefdead.lan>
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
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 Christoph Hellwig <hch@lst.de>, Tim Waugh <tim@cyberelk.net>,
 linux-s390@vger.kernel.org, Maxim Levitsky <maximlevitsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, ceph-devel@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel@lists.xenproject.org,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Alex Dubov <oakad@yahoo.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 jgross@suse.com, Geoff Levand <geoff@infradead.org>, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 04, 2021 at 11:58:34AM -0400, Konrad Rzeszutek Wilk wrote:
> On Wed, Jun 02, 2021 at 09:53:15AM +0300, Christoph Hellwig wrote:
> > Hi all,
> 
> Hi!
> 
> You wouldn't have a nice git repo to pull so one can test it easily?

git://git.infradead.org/users/hch/block.git alloc_disk-part2
