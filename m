Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA8338CC7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmvB84X4fz3bxW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 03:44:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.182;
 helo=mail-pg1-f182.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmv9m2fsHz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 03:44:11 +1000 (AEST)
Received: by mail-pg1-f182.google.com with SMTP id v14so12074772pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 10:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lcP+zO2F1IGQjzr8jBvO9rG6CcCMMr/Whp/T20TGCRM=;
 b=DizJw4nSDQuXGA18xC49fQqeIhcOipDI1nAFCaST6Gh0VYnotfv3432GUZFyiWJu4V
 ym2B8iUKGl7k7ZKxo3Ui0RgBl/WePhVi+7GVHRVw1HquALis7BPcT0sLLhqfARwEdwjT
 ShTPtKJHGOqkJqAx+ODm4mbbVN1xM9OIf1HBDXwZHeThskQ6TbZN5Fyd8TL0KjTfwuT+
 oHE8s4Mp9DNVYhPCANuaija8m0+Qx8VdQn9dqliscKdDica15GbJ0zRQj4GSwDT1AQdw
 SeCt+cl5HNa72AI+K7IFT23wIIztV0kyOZXn9AGm4SjGV8jfTppEOLCS5HmSN3RidmiW
 o9tQ==
X-Gm-Message-State: AOAM530fJPCybEiOGsXzliwpSNVB2oEGT2gncGZdjunWzgf6CUGeEZl5
 9AbmVm2u4qXawt2byrrWEBY=
X-Google-Smtp-Source: ABdhPJx2cr14kVfs56RCS6Lg1N9a0F2CxWXa6sTYNwZ2wWHW3RuCIJw00Zxq6x/ufjwVbJsYm0Ya2A==
X-Received: by 2002:a05:6a00:15d4:b029:2de:a538:c857 with SMTP id
 o20-20020a056a0015d4b02902dea538c857mr11480779pfu.51.1621619049288; 
 Fri, 21 May 2021 10:44:09 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id o3sm4974976pgh.22.2021.05.21.10.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:44:08 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 766BF423A3; Fri, 21 May 2021 17:44:07 +0000 (UTC)
Date: Fri, 21 May 2021 17:44:07 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 05/26] block: add blk_alloc_disk and
 blk_cleanup_disk APIs
Message-ID: <20210521174407.GA25291@42.do-not-panic.com>
References: <20210521055116.1053587-1-hch@lst.de>
 <20210521055116.1053587-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521055116.1053587-6-hch@lst.de>
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

On Fri, May 21, 2021 at 07:50:55AM +0200, Christoph Hellwig wrote:
> Add two new APIs to allocate and free a gendisk including the
> request_queue for use with BIO based drivers.  This is to avoid
> boilerplate code in drivers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/genhd.c         | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/genhd.h | 22 ++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index e4974af3d729..6d4ce962866d 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1302,6 +1302,25 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
>  }
>  EXPORT_SYMBOL(__alloc_disk_node);
>  
> +struct gendisk *__blk_alloc_disk(int node)
> +{
> +	struct request_queue *q;
> +	struct gendisk *disk;
> +
> +	q = blk_alloc_queue(node);
> +	if (!q)
> +		return NULL;
> +
> +	disk = __alloc_disk_node(0, node);
> +	if (!disk) {
> +		blk_cleanup_queue(q);
> +		return NULL;
> +	}
> +	disk->queue = q;
> +	return disk;
> +}
> +EXPORT_SYMBOL(__blk_alloc_disk);

Its not obvious to me why using this new API requires you then to
set minors explicitly to 1, and yet here underneath we see the minors
argument passed is 0.

Nor is it clear from the documentation.

  Luis
