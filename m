Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0A3FE8B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 07:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0V2t72m3z2yWG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 15:33:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=RS19rQ3k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=ionos.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=jinpu.wang@ionos.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256
 header.s=google header.b=RS19rQ3k; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0V285btMz2xsj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 15:33:02 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id i21so1521862ejd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 22:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zwGb32jFXjCTTE1DLnmCCv3fIxegxghKmjAnTUaGrU=;
 b=RS19rQ3k1Oo6pxKXgESwj7SfQiQeAghwOQof8XbrKhwNE9r6QeFgGT2il12wSmfJo9
 8RLJ69QqKwMCfmgCe8M/wbbEBhqhxk27tSTA860KNjxs6Dep+LCz50EZWWyTtRkLnpaG
 HHNtk7tVj3z6KzRxoS7eJZOEmrrHFm2T8M6OdF6HLsxQ448iDnbZYKDRE+L45pgmMAX0
 wL3zbL9IzEe6T8KByoXsf2bthQqrzfNltsaTJ4qpvLruEzOxx1hVvxgobQpTwfTh760c
 2yOZCMqZm9faW+ZRKR1n4FoFQ5PHujT5YaYWgeapBWM6PozMUvM8nG4mCK28njnF3mZP
 maHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zwGb32jFXjCTTE1DLnmCCv3fIxegxghKmjAnTUaGrU=;
 b=p+/3HeRJUwx574z2u9o6NdQCnwUSbPgNKWHuX8EubBjgmQzPu7kzkfIPQVMd5gX9Tp
 IeBX80VXf8dpIKru/dYRBOjIA1vKTy8RGnFiS2MVVzU2NVg1NDG+MFXZ5xNP4+CxOWgn
 IkR9SWzo1+DFjoBN3dF7CBiPO0rfMgULL9uvK898kd2HCK5QXBekv36j0cZgXXLF9XvW
 YZxRmNKKH+CmeIiA/j1yZW3f0CsdL4sywrWhYKoQh1eW/og4KWOTP4Hvn2jCpp3nIvJf
 vML5fYsnyJ+8SRcbaIb3s9O5ez+j819Uxxr+5KtW7ET+Nrjk4PViSyLwZDHhm90RAEcE
 gkVA==
X-Gm-Message-State: AOAM5318SkfSzCun1n5eD8nM2I5CB0+L2AV1OaKEebLYqvRAoCD7WfH2
 gjyi0qaBHFU3d2rlEkLkINw5JPPfzm/MODEk10nLUg==
X-Google-Smtp-Source: ABdhPJxZFwC5NbWhR92zcxWHUA7yiRr/hOydqIOl9pEkJvL3G+5pMpY3cQSKaW1W2ZY+RQK9Gl5bBm6LDK3c2kx9+28=
X-Received: by 2002:a17:907:6297:: with SMTP id
 nd23mr1740993ejc.62.1630560774884; 
 Wed, 01 Sep 2021 22:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210901210028.1750956-1-mcgrof@kernel.org>
 <20210901210028.1750956-6-mcgrof@kernel.org>
In-Reply-To: <20210901210028.1750956-6-mcgrof@kernel.org>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Thu, 2 Sep 2021 07:32:44 +0200
Message-ID: <CAMGffE=+jnKpO-ZGqW5JQnUbdH+NjQHgq7_f4XoEem2itHhe9Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] rnbd: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Geoff Levand <geoff@infradead.org>,
 pjk1939@linux.ibm.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, jim@jtan.com,
 open list <linux-kernel@vger.kernel.org>, Liu Shixin <liushixin2@huawei.com>,
 Richard Weinberger <richard@nod.at>, paulus@samba.org,
 linux-mtd@lists.infradead.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Haris Iqbal <haris.iqbal@ionos.com>,
 Lee Jones <lee.jones@linaro.org>, josh.h.morris@us.ibm.com,
 Tim Waugh <tim@cyberelk.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 1, 2021 at 11:01 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
looks good to me.
Acked-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index bd4a41afbbfc..1ba1c868535a 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -1384,8 +1384,10 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
>         blk_queue_write_cache(dev->queue, dev->wc, dev->fua);
>  }
>
> -static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
> +static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>  {
> +       int err;
> +
>         dev->gd->major          = rnbd_client_major;
>         dev->gd->first_minor    = idx << RNBD_PART_BITS;
>         dev->gd->minors         = 1 << RNBD_PART_BITS;
> @@ -1410,7 +1412,11 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>
>         if (!dev->rotational)
>                 blk_queue_flag_set(QUEUE_FLAG_NONROT, dev->queue);
> -       add_disk(dev->gd);
> +       err = add_disk(dev->gd);
> +       if (err)
> +               blk_cleanup_disk(dev->gd);
> +
> +       return err;
>  }
>
>  static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
> @@ -1426,8 +1432,7 @@ static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
>         rnbd_init_mq_hw_queues(dev);
>
>         setup_request_queue(dev);
> -       rnbd_clt_setup_gen_disk(dev, idx);
> -       return 0;
> +       return rnbd_clt_setup_gen_disk(dev, idx);
>  }
>
>  static struct rnbd_clt_dev *init_dev(struct rnbd_clt_session *sess,
> --
> 2.30.2
>
