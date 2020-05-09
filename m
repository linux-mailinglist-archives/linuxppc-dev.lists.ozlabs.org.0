Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2491CC067
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 12:39:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K3bz3MP6zDrBn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 20:39:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K3ZN6m7kzDr6t
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 20:38:17 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id t199so10845088oif.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 May 2020 03:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nBe+65cgrmufPqKgCO/WJS9rGOrSoS9DaeQpyO6VPQY=;
 b=UCgyRkP1xv7ALC2qq55HYmb2KYn61ZKOqhn9XbEJTZYXKPPwmp3NZeya1uMcN9joOa
 zEDkoQBQH3sP58jSOxDvdFPeqHqjO+YIQ8evPeduz01YAopsAoSkWB7E7gtHomLKyB7K
 kan7BZVSeyFxBAkzWmRlwGC+RiiezHigIyDLzAoySC4nR07OLiVVuaiE3cTj97UxiEFI
 +LuMWQRSWVANS3x9pMFk8oDuVFEZirb7p7wZSmylQt0iPUjVQJSb+Lu7fZij5LkhGtyO
 53accaYJIUIljAIz7FzjRFGCh2szcML9SZq0U+9OvicPYu2MIAC4Z6K2yGH1apAN3npm
 /hFg==
X-Gm-Message-State: AGi0PuZw2wdFgfoP9emumYES8OPwncvxVbZj9RWMY9CSHE7HL0/8hphT
 VeANaMl+Cc6a69k2VmfzYfFCZ6cqDmEYrvoMvYo=
X-Google-Smtp-Source: APiQypJViR7zf1BxfE4fSiEMumUvdAfdspNngdk/6s5fr4R3Q+whgmTLapvbuOPEuAwW4U0ZD7JgMnKsLrBjVv9lPKw=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr13605566oig.54.1589020691722; 
 Sat, 09 May 2020 03:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
 <20200508161517.252308-2-hch@lst.de>
In-Reply-To: <20200508161517.252308-2-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 9 May 2020 12:38:00 +0200
Message-ID: <CAMuHMdUBRsZQ1BOD9jW99NTm_8NZDootGrqzz3nPeeJ+mUAoTw@mail.gmail.com>
Subject: Re: [PATCH 01/15] nfblock: use gendisk private_data
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
Cc: Jens Axboe <axboe@kernel.dk>, "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, linux-raid@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jim Paris <jim@jtan.com>, linux-block@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Philip Kelleher <pjk1939@linux.ibm.com>, linux-bcache@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Morris <josh.h.morris@us.ibm.com>, Nitin Gupta <ngupta@vflare.org>,
 Lars Ellenberg <drbd-dev@lists.linbit.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Fri, May 8, 2020 at 6:16 PM Christoph Hellwig <hch@lst.de> wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/arch/m68k/emu/nfblock.c
> +++ b/arch/m68k/emu/nfblock.c
> @@ -61,7 +61,7 @@ struct nfhd_device {
>
>  static blk_qc_t nfhd_make_request(struct request_queue *queue, struct bio *bio)
>  {
> -       struct nfhd_device *dev = queue->queuedata;
> +       struct nfhd_device *dev = bio->bi_disk->private_data;
>         struct bio_vec bvec;
>         struct bvec_iter iter;
>         int dir, len, shift;
> @@ -122,7 +122,6 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
>         if (dev->queue == NULL)
>                 goto free_dev;
>
> -       dev->queue->queuedata = dev;
>         blk_queue_logical_block_size(dev->queue, bsize);
>
>         dev->disk = alloc_disk(16);
> @@ -136,6 +135,7 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
>         sprintf(dev->disk->disk_name, "nfhd%u", dev_id);
>         set_capacity(dev->disk, (sector_t)blocks * (bsize / 512));
>         dev->disk->queue = dev->queue;
> +       dev->disk->private_data = dev;

This is already set above, just before the quoted sprintf() call.

>
>         add_disk(dev->disk);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
