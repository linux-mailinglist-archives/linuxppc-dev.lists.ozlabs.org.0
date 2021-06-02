Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4123983B4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:58:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw1cc4Pwnz3091
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:58:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=jCNYXrov;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=ionos.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=jinpu.wang@ionos.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256
 header.s=google header.b=jCNYXrov; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw1QN6L20z2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 17:49:45 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id ba2so55137edb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IviQGHXbohDYlY4Kaxm/cxlbY44V3tAurEYksJ8dtbE=;
 b=jCNYXrovW1sUHaOT/+lw4PCDhP0eyRFf+ELw7YXWBCDBnLin+ptT9Qqbj9mRkWWaUg
 wGBYm/DlmYSjFuDFdCiAFeYUhwBx3bN1zWIfEq4U/R6NzUaRvMrhsPRnKTgM5MVFJVxB
 CmVxljvKTCN3ZyT1LwzUVWKZgE4x9cRuQaj0TjoJvUnlN68E3Mt+4zAfSoenpZB5Ofxb
 0XLwmhqFLm1lOHsISGA/CxlwAihZibid3kenEAmMklVKKOHOy1nSq3KrSTTjFuaKWHai
 u516kaTGPG4uhGM5WuZ/+lvOuzezIo89jko54Ak3T4r5ol1iQsDze8x0V5mTappbPtSr
 aaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IviQGHXbohDYlY4Kaxm/cxlbY44V3tAurEYksJ8dtbE=;
 b=Ot52AjQfHd/vKSN2U3Qo1lpUWei+w8mbwz/hk8gEA8Ylw8L+D7WjkS1rHAp7z9tUp+
 ftrgyHrUnbo+3lC8dzfUwd8By4ORD4YJuZemURJx9YvMN9Fza830e26WpkiswITmLBNp
 bLYPozXzrc1ROKIYrZkmCAJZHQEOqZ+1osn/dPDVgFGbEgBaPXDVn/z7tBBLqYuAg/Uu
 E3NivOJtD5nHaWPaHKd7yYpeHoAo+zFYHNwkRXJmMmkUKpNQTV13LgOXNQiakEVdxsu0
 9AOg1ozwTY4zDBrrB6bXqRTH4YCbYhDoe7APZ5aBK265u4XycZR77F0gRtlXZaGXUjJk
 zctA==
X-Gm-Message-State: AOAM532biCA0qVDAinpgnIPVP1TqVO6F9P7BbRZIqIaP19PeoOByLK/e
 /Trx76vmc4xwOrYs/nCiF5sLK1t9GM1ETKZKURoSgg==
X-Google-Smtp-Source: ABdhPJzRCVGimPnGT3qQlEAMsZsY3IxcZZF186UcWgTyI7ay8iWe4IlRIEG5WowCojeDoPju71hCmgBQ+xR7PgbbWL0=
X-Received: by 2002:aa7:c693:: with SMTP id n19mr33130385edq.35.1622620178044; 
 Wed, 02 Jun 2021 00:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-24-hch@lst.de>
In-Reply-To: <20210602065345.355274-24-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 2 Jun 2021 09:49:27 +0200
Message-ID: <CAMGffEn7aCmTOTsuzbSr=DwomFKfizkNhzsZnAONHBq1neW2Og@mail.gmail.com>
Subject: Re: [PATCH 23/30] rnbd: use blk_mq_alloc_disk and blk_cleanup_disk
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 02 Jun 2021 17:58:17 +1000
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
 device-mapper development <dm-devel@redhat.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Tim Waugh <tim@cyberelk.net>,
 linux-s390@vger.kernel.org, Maxim Levitsky <maximlevitsky@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel@lists.xenproject.org,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alex Dubov <oakad@yahoo.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
 linux-block <linux-block@vger.kernel.org>,
 Ceph Development <ceph-devel@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Geoff Levand <geoff@infradead.org>, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 2, 2021 at 8:55 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
> request_queue allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 35 ++++++++---------------------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index c604a402cd5c..f4fa45d24c0b 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -1353,18 +1353,6 @@ static void rnbd_init_mq_hw_queues(struct rnbd_clt_dev *dev)
>         }
>  }
>
> -static int setup_mq_dev(struct rnbd_clt_dev *dev)
> -{
> -       dev->queue = blk_mq_init_queue(&dev->sess->tag_set);
> -       if (IS_ERR(dev->queue)) {
> -               rnbd_clt_err(dev, "Initializing multiqueue queue failed, err: %ld\n",
> -                             PTR_ERR(dev->queue));
> -               return PTR_ERR(dev->queue);
> -       }
> -       rnbd_init_mq_hw_queues(dev);
> -       return 0;
> -}
> -
>  static void setup_request_queue(struct rnbd_clt_dev *dev)
>  {
>         blk_queue_logical_block_size(dev->queue, dev->logical_block_size);
> @@ -1393,13 +1381,13 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
>         blk_queue_io_opt(dev->queue, dev->sess->max_io_size);
>         blk_queue_virt_boundary(dev->queue, SZ_4K - 1);
>         blk_queue_write_cache(dev->queue, dev->wc, dev->fua);
> -       dev->queue->queuedata = dev;
>  }
>
>  static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>  {
>         dev->gd->major          = rnbd_client_major;
>         dev->gd->first_minor    = idx << RNBD_PART_BITS;
> +       dev->gd->minors         = 1 << RNBD_PART_BITS;
>         dev->gd->fops           = &rnbd_client_ops;
>         dev->gd->queue          = dev->queue;
>         dev->gd->private_data   = dev;
> @@ -1426,24 +1414,18 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>
>  static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
>  {
> -       int err, idx = dev->clt_device_id;
> +       int idx = dev->clt_device_id;
>
>         dev->size = dev->nsectors * dev->logical_block_size;
>
> -       err = setup_mq_dev(dev);
> -       if (err)
> -               return err;
> +       dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, dev);
> +       if (IS_ERR(dev->gd))
> +               return PTR_ERR(dev->gd);
> +       dev->queue = dev->gd->queue;
> +       rnbd_init_mq_hw_queues(dev);
>
>         setup_request_queue(dev);
> -
> -       dev->gd = alloc_disk_node(1 << RNBD_PART_BITS,  NUMA_NO_NODE);
> -       if (!dev->gd) {
> -               blk_cleanup_queue(dev->queue);
> -               return -ENOMEM;
> -       }
> -
>         rnbd_clt_setup_gen_disk(dev, idx);
> -
>         return 0;
>  }
>
> @@ -1650,8 +1632,7 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
>  static void destroy_gen_disk(struct rnbd_clt_dev *dev)
>  {
>         del_gendisk(dev->gd);
> -       blk_cleanup_queue(dev->queue);
> -       put_disk(dev->gd);
> +       blk_cleanup_disk(dev->gd);
>  }
>
>  static void destroy_sysfs(struct rnbd_clt_dev *dev,
> --
> 2.30.2

Looks good to me, thx!
Reviewed-by: Jack Wang <jinpu.wang@ionos.com>
>
