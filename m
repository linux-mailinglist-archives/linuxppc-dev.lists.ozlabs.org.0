Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36B1D20FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 23:26:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mnlt5R0MzDqg1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 07:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=zuYgTbgg; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MjrG0yvqzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 04:29:33 +1000 (AEST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BE30207C4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589394571;
 bh=QRSsQMrQ74camPjAugEMwP/lQqJBw3KN+yss8wjRYVo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zuYgTbgg+vneAleokfO2ukKNs/dqZRWw5cokGloCn06DRltmLMyAH0XWH7ZXE6kme
 ad+FAFkx841tWRfGJCwJuCCrF9NfvNSBS/VNkG+/4QSbaYBUc8DgdG1PYWFgMFsatw
 bhT63We9c1wVG6MA7eSBOs4coDppYUwq6NJFs550=
Received: by mail-lf1-f49.google.com with SMTP id d22so334923lfm.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 11:29:30 -0700 (PDT)
X-Gm-Message-State: AOAM532mAfBT8/3+7xQqhosTD2H9izP4jV/UQYfm7P0dBHKVPqUw2rsV
 DqYluDhYcbINrxIsKToGcD8kuF0c77N7dj3F1GU=
X-Google-Smtp-Source: ABdhPJzEel6P56V5AzdhnqpR97v3ZXYr3I1lEd0oqpxPoU0DCjvc+wX2TsHUs+/MUKk1AS+L8zGBfF+JTi024W0oARc=
X-Received: by 2002:ac2:558e:: with SMTP id v14mr539886lfg.138.1589394568604; 
 Wed, 13 May 2020 11:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
 <20200508161517.252308-13-hch@lst.de>
In-Reply-To: <20200508161517.252308-13-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Wed, 13 May 2020 11:29:17 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6_Y53_XLFeVxhTDpTi_PKNLqqnrXLn+M2fJW268eE6_w@mail.gmail.com>
Message-ID: <CAPhsuW6_Y53_XLFeVxhTDpTi_PKNLqqnrXLn+M2fJW268eE6_w@mail.gmail.com>
Subject: Re: [PATCH 12/15] md: stop using ->queuedata
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 14 May 2020 07:23:54 +1000
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
 linux-raid <linux-raid@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-nvdimm@lists.01.org, Geoff Levand <geoff@infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Jim Paris <jim@jtan.com>,
 linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
 linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Joshua Morris <josh.h.morris@us.ibm.com>, Nitin Gupta <ngupta@vflare.org>,
 drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 8, 2020 at 9:17 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for the cleanup. IIUC, you want this go through md tree?

Otherwise,

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 271e8a5873549..c079ecf77c564 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -466,7 +466,7 @@ static blk_qc_t md_make_request(struct request_queue *q, struct bio *bio)
>  {
>         const int rw = bio_data_dir(bio);
>         const int sgrp = op_stat_group(bio_op(bio));
> -       struct mddev *mddev = q->queuedata;
> +       struct mddev *mddev = bio->bi_disk->private_data;
>         unsigned int sectors;
>
>         if (unlikely(test_bit(MD_BROKEN, &mddev->flags)) && (rw == WRITE)) {
> @@ -5626,7 +5626,6 @@ static int md_alloc(dev_t dev, char *name)
>         mddev->queue = blk_alloc_queue(md_make_request, NUMA_NO_NODE);
>         if (!mddev->queue)
>                 goto abort;
> -       mddev->queue->queuedata = mddev;
>
>         blk_set_stacking_limits(&mddev->queue->limits);
>
> --
> 2.26.2
>
