Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF85274D38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 01:21:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwy4068fmzDqW2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 09:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwy2438PRzDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 09:19:38 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id m7so22976508oie.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 16:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cji0qFj1y7Q/mWiJAHJApgvwJbZGt2chl3dsq1MaaDY=;
 b=cHNvehHoLaHOw9yqIJAdoq8U1gJHelLg8ev7ugYAyXuYkHZ7cMBE6nL8OgPCikO2ds
 kKvzOlodXlvh/kAdxvNtDFHq2p4lGeyHHhDlDsSwxIHdaDBeFVFNg8nHcDMDaRtdKlbv
 qY7tGNR9R9B14X6Uz4+H6vsrUIoD0JL9w/bvDQ7hrfDxDaVqV81UpNwR9ALcemRdcvQn
 p948g5rgMoapoY0ITM3eNL9JWx7R2NXcjvkSg1ASfkdc0j9HStFcbsQzY2VA1edOEGdD
 7JvH3pjBJSGOgwiKQnfEZmw1MpOsOqwTDWuH2LCg3FpTgvhJKaDAsfGFh+nDQLC6f209
 JySg==
X-Gm-Message-State: AOAM533ZVl6Gw1JqD+U2doxu8mRib2qr661q8c13rFZWNnbOLdSBLgjh
 c7QzGrQJuTPrBQeqVNt4g5EROFBgvE/U2Q==
X-Google-Smtp-Source: ABdhPJyZ2lk3W298guAv7T3G4989QzipK+fGidAMxZkFgD3eWQYlxXaFUVSKjOAMFhfiPSoFr26RhQ==
X-Received: by 2002:aca:f0e:: with SMTP id 14mr4101892oip.134.1600816776358;
 Tue, 22 Sep 2020 16:19:36 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54])
 by smtp.gmail.com with ESMTPSA id d17sm7131495oth.73.2020.09.22.16.19.35
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 16:19:35 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id e23so17239345otk.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 16:19:35 -0700 (PDT)
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr4538615oti.63.1600816775237;
 Tue, 22 Sep 2020 16:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200914041752.3702104-1-liushixin2@huawei.com>
In-Reply-To: <20200914041752.3702104-1-liushixin2@huawei.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 22 Sep 2020 18:19:23 -0500
X-Gmail-Original-Message-ID: <CADRPPNTf-SYkuZmTi+1bq_Fme_4M4aD4KnzJZnwKqQukD=JnQw@mail.gmail.com>
Message-ID: <CADRPPNTf-SYkuZmTi+1bq_Fme_4M4aD4KnzJZnwKqQukD=JnQw@mail.gmail.com>
Subject: Re: [PATCH -next] soc/qman: convert to use be32_add_cpu()
To: Liu Shixin <liushixin2@huawei.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 13, 2020 at 10:56 PM Liu Shixin <liushixin2@huawei.com> wrote:
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> drivers/soc/fsl/qbman/qman_test_api.c---

The patch seems to be messed up here.

I have fixed that, and applied for next.  Thanks.

>  drivers/soc/fsl/qbman/qman_test_api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qbman/qman_test_api.c b/drivers/soc/fsl/qbman/qman_test_api.c
> index 2895d062cf51..7066b2f1467c 100644
> --- a/drivers/soc/fsl/qbman/qman_test_api.c
> +++ b/drivers/soc/fsl/qbman/qman_test_api.c
> @@ -86,7 +86,7 @@ static void fd_inc(struct qm_fd *fd)
>         len--;
>         qm_fd_set_param(fd, fmt, off, len);
>
> -       fd->cmd = cpu_to_be32(be32_to_cpu(fd->cmd) + 1);
> +       be32_add_cpu(&fd->cmd, 1);
>  }
>
>  /* The only part of the 'fd' we can't memcmp() is the ppid */
> --
> 2.25.1
>
