Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB038CBCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmtZc244Dz30BG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 03:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.175;
 helo=mail-pl1-f175.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmtZD0JP7z305w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 03:16:51 +1000 (AEST)
Received: by mail-pl1-f175.google.com with SMTP id a7so2635538plh.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 10:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/6CTfoP+3YhIDA2Sa2Vg3MwIl/4IQc5OvLMHtpk2uwk=;
 b=Dcobzb8r3xHq1GkoKEJI3GQaIlA8y/JNd4QquHPoD+qmDN8c85GugbIac+VLd3xbtC
 i0p6uQ9Cj3yEH5m3d1bgmKPTbR1EiHVRj67lypMYqQhsF9E5GRqEqJk+PG5J+c3ypNfZ
 e9uSmzazvfews7x19x1SJO/0fPYLSi1/IMQH6WdYiUZioLIeXlobi4kbmIUonkHNpt9J
 W9K/VtsPqutApcFVu5yo71Mb9YeCjsY68nJ6XgOpElOH9zrZc/Sxy1J2vwGvDIVaKpdS
 wRad0Hf+/xcHiK0nbE8ojrvYZWCW9d20rHE5z4Gm94lQsONOltLA0IqX6rl5ixrJ6xJd
 oGxg==
X-Gm-Message-State: AOAM533asTLusLfpkoamX+NHqEQdU023U/wr3u3oKFRoqdjCz1QbaDqE
 x6t4PzPAWZ/EsN2CE9gcrTg=
X-Google-Smtp-Source: ABdhPJxtynqdEQ1F/D+2PqiHL9NmQC5jqLXgWhG+E7yzr8uLp59ObRLAPQ67LxwzZAhslkMqhOa4cA==
X-Received: by 2002:a17:90a:590d:: with SMTP id
 k13mr12082927pji.68.1621617409049; 
 Fri, 21 May 2021 10:16:49 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id q24sm4964064pgb.19.2021.05.21.10.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:16:47 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 6461E423A3; Fri, 21 May 2021 17:16:46 +0000 (UTC)
Date: Fri, 21 May 2021 17:16:46 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 01/26] block: refactor device number setup in
 __device_add_disk
Message-ID: <20210521171646.GA25017@42.do-not-panic.com>
References: <20210521055116.1053587-1-hch@lst.de>
 <20210521055116.1053587-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521055116.1053587-2-hch@lst.de>
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
 Vishal Verma <vishal.l.verma@intel.com>,
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

On Fri, May 21, 2021 at 07:50:51AM +0200, Christoph Hellwig wrote:
> diff --git a/block/genhd.c b/block/genhd.c
> index 39ca97b0edc6..2c00bc3261d9 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -335,52 +335,22 @@ static int blk_mangle_minor(int minor)

<-- snip -->

> -int blk_alloc_devt(struct block_device *bdev, dev_t *devt)
> +int blk_alloc_ext_minor(void)
>  {
> -	struct gendisk *disk = bdev->bd_disk;
>  	int idx;
>  
> -	/* in consecutive minor range? */
> -	if (bdev->bd_partno < disk->minors) {
> -		*devt = MKDEV(disk->major, disk->first_minor + bdev->bd_partno);
> -		return 0;
> -	}
> -

It is not obviously clear to me, why this was part of add_disk()
path, and ...

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index dc60ecf46fe6..504297bdc8bf 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -379,9 +380,15 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
>  	pdev->type = &part_type;
>  	pdev->parent = ddev;
>  
> -	err = blk_alloc_devt(bdev, &devt);
> -	if (err)
> -		goto out_put;
> +	/* in consecutive minor range? */
> +	if (bdev->bd_partno < disk->minors) {
> +		devt = MKDEV(disk->major, disk->first_minor + bdev->bd_partno);
> +	} else {
> +		err = blk_alloc_ext_minor();
> +		if (err < 0)
> +			goto out_put;
> +		devt = MKDEV(BLOCK_EXT_MAJOR, err);
> +	}
>  	pdev->devt = devt;
>  
>  	/* delay uevent until 'holders' subdir is created */

... and why we only add this here now.

Other than that, this looks like a super nice cleanup!

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
