Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C23390C60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 00:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqTcN3M3Zz307q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 08:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K9wqVdOP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e33;
 helo=mail-vs1-xe33.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K9wqVdOP; dkim-atps=neutral
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqTbx6yp3z2xvb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 08:42:18 +1000 (AEST)
Received: by mail-vs1-xe33.google.com with SMTP id s15so16902627vsi.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 15:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2ntYm6uDO3tojaF9gfgprihNvjCO5hVlU6EmFGOmTo=;
 b=K9wqVdOPxXHut6A0EevQX/nqmrPWosCHVPu4555rYr8tuCz8O0lI/p4Rb77PfQ8Yfq
 fRmWkgPHBfsqXzE6lREE/b8PxdKg0U8EuVSS9rL2xjxve3ATaYRjERwWLkhwXRfzDPTA
 KMH0Jn7mx/0V+2ZMCJ2ntLBKrEex0sj58ibU9GJdf25N1KPIZf6ysG7S8bBIp5GxRiyl
 oW1gRaEs+jb593kt9via8xPWNweotp+DwCl/Vc0y0ZfLnCUPzk4X9FC3QvSvLxInEfdN
 EReMXPyNQilw4NAPZf5vV5feE5jyQ8EEPE5nGtQ/Fqd8VnVaNh6v5d36RKW9J9jTG3bc
 rUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2ntYm6uDO3tojaF9gfgprihNvjCO5hVlU6EmFGOmTo=;
 b=oHqJWJZmCVMSdU+yK3WesHKe93JkgiWF3CsNk9AdND/UteYnY5LN2aE11SWEmesDKn
 2kN3VTtQk2JnOVGJJCFyCIHOkFuVKUjuGux09deZx+cBcJyN0Y6GWHugAWeZK5VG5XjE
 NqekMUQ/EDRW/IRK+p3yErsQ0RxkZucw7lr4Mcjn15QDBqFTNQ4R4gMI4FRXZ6YTB5F/
 /c0xKwZ3Ev79Kz3DN0jJapUui456mrj0wz5NSkgYVJLevl4NIq/0sKNu6nWW1tMyzay6
 /ByETlVHP/7rkUeIV73inKhQ5vP24myxuDxGtwsv8BIcmVbO0SAVqVR3F8Roh4jXylyn
 kMfQ==
X-Gm-Message-State: AOAM530GP7aJMzf+U2Akg3TRowtlXu0Dw7CqJTBA/znzZBAjDyG72S3n
 erzUcypUMgAsK6b+5NHb1g7vo8fbvNFTl+t1CiDeNw==
X-Google-Smtp-Source: ABdhPJwx/fwYmfo8P5+A7EuWXJoD8LuumWi86gXq03cq2Wld1BR6mX3B8HbBTdDiayCS1IrjwzR0gvQYH9nbZXbeRCI=
X-Received: by 2002:a05:6102:7c1:: with SMTP id
 y1mr29600317vsg.34.1621982533995; 
 Tue, 25 May 2021 15:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210521055116.1053587-1-hch@lst.de>
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 26 May 2021 00:41:37 +0200
Message-ID: <CAPDyKFpqdSYeA+Zg=9Ewi46CmSWNpXQbju6HQo7aviCcRzyAAg@mail.gmail.com>
Subject: Re: simplify gendisk and request_queue allocation for bio based
 drivers
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
 Vishal Verma <vishal.l.verma@intel.com>,
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

On Fri, 21 May 2021 at 07:51, Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> this series is the first part of cleaning up lifetimes and allocation of
> the gendisk and request_queue structure.  It adds a new interface to
> allocate the disk and queue together for bio based drivers, and a helper
> for cleanup/free them when a driver is unloaded or a device is removed.

May I ask what else you have in the pipe for the next steps?

The reason why I ask is that I am looking into some issues related to
lifecycle problems of gendisk/mmc, typically triggered at SD/MMC card
removal.

>
> Together this removes the need to treat the gendisk and request_queue
> as separate entities for bio based drivers.
>
> Diffstat:
>  arch/m68k/emu/nfblock.c             |   20 +---
>  arch/xtensa/platforms/iss/simdisk.c |   29 +------
>  block/blk-core.c                    |    1
>  block/blk.h                         |    6 -
>  block/genhd.c                       |  149 +++++++++++++++++++-----------------
>  block/partitions/core.c             |   19 ++--
>  drivers/block/brd.c                 |   94 +++++++---------------
>  drivers/block/drbd/drbd_main.c      |   23 +----
>  drivers/block/n64cart.c             |    8 -
>  drivers/block/null_blk/main.c       |   38 ++++-----
>  drivers/block/pktcdvd.c             |   11 --
>  drivers/block/ps3vram.c             |   31 +------
>  drivers/block/rsxx/dev.c            |   39 +++------
>  drivers/block/rsxx/rsxx_priv.h      |    1
>  drivers/block/zram/zram_drv.c       |   19 ----
>  drivers/lightnvm/core.c             |   24 +----
>  drivers/md/bcache/super.c           |   15 ---
>  drivers/md/dm.c                     |   16 +--
>  drivers/md/md.c                     |   25 ++----
>  drivers/memstick/core/ms_block.c    |    1
>  drivers/nvdimm/blk.c                |   27 +-----
>  drivers/nvdimm/btt.c                |   25 +-----
>  drivers/nvdimm/btt.h                |    2
>  drivers/nvdimm/pmem.c               |   17 +---
>  drivers/nvme/host/core.c            |    1
>  drivers/nvme/host/multipath.c       |   46 +++--------
>  drivers/s390/block/dcssblk.c        |   26 +-----
>  drivers/s390/block/xpram.c          |   26 ++----
>  include/linux/blkdev.h              |    1
>  include/linux/genhd.h               |   23 +++++
>  30 files changed, 297 insertions(+), 466 deletions(-)

This looks like a nice cleanup to me.  Feel free to add, for the series:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
