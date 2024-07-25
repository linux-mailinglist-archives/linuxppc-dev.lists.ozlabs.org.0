Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8E93C1B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 14:19:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=uter.be header.i=@uter.be header.a=rsa-sha256 header.s=2021.lounge header.b=HRSnzfY+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WV91B20k2z3cyd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 22:19:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=uter.be
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=uter.be header.i=@uter.be header.a=rsa-sha256 header.s=2021.lounge header.b=HRSnzfY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=uter.be (client-ip=2a01:4f8:200:91e8::2; helo=lounge.grep.be; envelope-from=w@uter.be; receiver=lists.ozlabs.org)
X-Greylist: delayed 1258 seconds by postgrey-1.37 at boromir; Thu, 25 Jul 2024 21:58:00 AEST
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WV8XS0T7Rz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 21:58:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=A2VuDAKeSGGGRwdNEgASvdRePK2jE6LTgdknFzfGiVg=; b=HRSnzfY+SxqUo9lzjJBHswdyNO
	izEqhcP/7tFCFgJJGzzhTZHV+hkIJ95lvet5keDsrZB2SVJh4LM2TT0rY+nfGtvBDiOATcCiQ/ZZp
	NX14nRCfBdImELKCJsEds0YwtB87PNneYsFwhe69klvX8hKaVd3bPAdUOO5oKLpwqsdI1TpEV3xHA
	zPeruYumASMydrGBh8+RD0p+DiFqZyJ0vUaImcbHlwd7Aik2LDO+RgK3xJUkwPiJj9pwJIeGrrPKF
	y3yZwQEUsA40VBWzlQvQ+rZPVwPFNOT65DR9yRxPQziuObFSyUbJuGiw7PBH1R7FTtIfgagxi0sHi
	wC/6XZ8A==;
Received: from [102.39.153.168] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1sWwlF-001dJr-31;
	Thu, 25 Jul 2024 13:35:53 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1sWwl8-00000002sGZ-0mps;
	Thu, 25 Jul 2024 13:35:46 +0200
Date: Thu, 25 Jul 2024 13:35:46 +0200
From: Wouter Verhelst <w@uter.be>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
Message-ID: <ZqI4kosy20WkLC2P@pc220518.home.grep.be>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617060532.127975-15-hch@lst.de>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Mailman-Approved-At: Thu, 25 Jul 2024 22:18:09 +1000
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-bcache@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
> Use the chance to switch to defaulting to non-rotational and require
> the driver to opt into rotational, which matches the polarity of the
> sysfs interface.
[...]
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index cb1c86a6a3fb9d..6cddf5baffe02a 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1867,11 +1867,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>  		goto out_err_disk;
>  	}
>  
> -	/*
> -	 * Tell the block layer that we are not a rotational device
> -	 */
> -	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
> -
>  	mutex_init(&nbd->config_lock);
>  	refcount_set(&nbd->config_refs, 0);
>  	/*

NBD actually exports a flag for rotational devices; it's defined in
nbd.h in the NBD userland source as

#define NBD_FLAG_ROTATIONAL     (1 << 4)        /* Use elevator algorithm - rotational media */

which is passed in the same flags field which also contains the
NBD_FLAG_SEND_FLUSH and NBD_FLAG_SEND_FUA flags.

Perhaps we might want to look at that flag and set the device to
rotational if it is specified?

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.
