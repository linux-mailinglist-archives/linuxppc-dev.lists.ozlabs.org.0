Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 304E8440FF0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Oct 2021 18:52:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hj3dW11wKz2xth
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 04:51:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=MvRLH8wC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=MvRLH8wC; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hj3cp17qMz2xF4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Nov 2021 04:51:21 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id x5so5353650pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Oct 2021 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f8mR+D/eH/dZNNjPVwCwixw0JTq5UBSJUqcsN3WCTdc=;
 b=MvRLH8wCuHLDGU5wWh67k3cqC1Fdd3cZizRDNMF6VwG3BIGVykQrXQ5XqN/SFH4gF0
 aMNjx/sd3ls8H4qnD1YxCP5l5GJAAEpAG/Esp4V6LKux9NYOWi96TwUZ/pFb3TcmZBWP
 zVBzvEL+MVUnbMk9GV0AJMQQu68lxnATIX9jNgOg6W2MrQQWyRvUFoiusZtaNgUAPfI1
 AxT4pyI0WF/pD617rNm69wlS3SI/GAt5yD+1ZKqpLA3r9I/GOI56o8ePSp4PP7gIIGX3
 ZjKHBLE0TTaieZDjpKAQiXOrBhNCxqkLUX94RtN1Jp6OGXuvi8GYPomwsciSqBwOSwmF
 zWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8mR+D/eH/dZNNjPVwCwixw0JTq5UBSJUqcsN3WCTdc=;
 b=3mLL3ZzcI2TnAQijxYxX/3aqk2LK/q3/Vnaav+C+OgbWlCTHn+hgOGTyJniP+lmRkQ
 v6KqNcWZID/zK1h0EFTbzXAh3OC6Rj/+wUhNI4IMIUukllE1PCTcoNfgg8z9X/snDQZt
 yrjR2xCcDlx5XrXEOOZ+jF4ze4k6TqlQoEmIJhEKQuyPCmcorhLA3oZLeMIpPOXk/J4J
 rX3ft5nK0Zvfaw2Bdn+Wym1bYpQ31ULuwOisDDjqEBngTu0xdUTZyUh/VcHS4HFxw8Az
 uww2gOBByCazUhapk8ZK08jlhJQkYMOlc4chMts0cOlDMOogCHYzyLAaURnwAsfssXwe
 dasg==
X-Gm-Message-State: AOAM531Lo+oQGh3NkKyEk3pPivWQ13AmfQncsDI6DLPqW4sQThRUrzFx
 fy9zyjHtWRW0JXY1sGSMMVzvvd193Gz3YgKAWcfJOQ==
X-Google-Smtp-Source: ABdhPJwgKG5Mr66Ui8RTcSTuDFaX+/IepWZB1EHkIZ09RxQEUmJyKltynz0/5/JNtOiXpRzef+xr6SruizxyjaU9z7s=
X-Received: by 2002:a63:6bc2:: with SMTP id
 g185mr17997770pgc.356.1635702678641; 
 Sun, 31 Oct 2021 10:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-5-mcgrof@kernel.org>
In-Reply-To: <20211015235219.2191207-5-mcgrof@kernel.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 31 Oct 2021 10:51:08 -0700
Message-ID: <CAPcyv4g98Dk4HFvgzEeCfCNjF-vjfpEhjGjsPDazGPg-BqMr8A@mail.gmail.com>
Subject: Re: [PATCH 04/13] nvdimm/btt: use goto error labels on btt_blk_init()
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, vigneshr@ti.com,
 linux-nvme@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 miquel.raynal@bootlin.com, "Weiny, Ira" <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Dave Jiang <dave.jiang@intel.com>,
 Sagi Grimberg <sagi@grimberg.me>, Minchan Kim <minchan@kernel.org>,
 Vishal L Verma <vishal.l.verma@intel.com>, Nitin Gupta <ngupta@vflare.org>,
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jim Paris <jim@jtan.com>, senozhatsky@chromium.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> This will make it easier to share common error paths.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/nvdimm/btt.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
> index 29cc7325e890..23ee8c005db5 100644
> --- a/drivers/nvdimm/btt.c
> +++ b/drivers/nvdimm/btt.c
> @@ -1520,10 +1520,11 @@ static int btt_blk_init(struct btt *btt)
>  {
>         struct nd_btt *nd_btt = btt->nd_btt;
>         struct nd_namespace_common *ndns = nd_btt->ndns;
> +       int rc = -ENOMEM;
>
>         btt->btt_disk = blk_alloc_disk(NUMA_NO_NODE);
>         if (!btt->btt_disk)
> -               return -ENOMEM;
> +               goto out;

I tend to not use a goto when there is nothing to unwind.

The rest looks good to me. After dropping "goto out;" you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
