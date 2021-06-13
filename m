Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E593A58ED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 16:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2x8H228Kz308v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 00:01:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o+51Gt//;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o+51Gt//; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2x7l4WLgz2ym5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 00:01:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D192A61285
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623592862;
 bh=0GuJ8MA8YvAb5LFEu1wccuQD+B/n8HPSEdt3rIsJcas=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=o+51Gt//Duy1u56s/dk9eBSqfx7WwhWuvnaaLdrcMaG3LmeZrVtGkRkI0C4u7F+xe
 MxBf0MbTrfv0YH/G6frmBvYzEuaW6sMJahhiCIvqmWnkPBI768dvBpziGRFpQSGnJQ
 Kw7IJpvWeimsERuU/hgc07usgvl1rNQG03BeR0t6imRpYE4d960nqdYjJPaCOl9t6f
 YZyIUp/KPawWcIo6YortJ8GsP/C6ZZ7N4JC6L+MCWK34JxuTCNX+HDy0cm9zJZYQpV
 IF4eKBEJiwc1AqZkcKAiObyK0Xr18kE6SKRBUxzlTr07ucdXnGiyumBZKLXih4B07+
 /5bcHZKbI8W2w==
Received: by mail-pj1-f49.google.com with SMTP id
 go18-20020a17090b03d2b029016e4ae973f7so7545457pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 07:01:02 -0700 (PDT)
X-Gm-Message-State: AOAM5314ln+ZcU19WpfYOlcYtSDTKpW0o1Lckdlh1klBd4ij6jPsKtFz
 bVc5r+EfLbXN74pLfeAyhpozkTJx8EIEJCOZbkU=
X-Google-Smtp-Source: ABdhPJyFOyiJWkaOurdmvQmKHDKj6R/+QYd0Y/yarti/BChQroTPj0Zm9Ag2edUHztcoSXwOu7UmDfTXDUlbEeJ5BU4=
X-Received: by 2002:a17:902:d4c8:b029:102:715b:e3a5 with SMTP id
 o8-20020a170902d4c8b0290102715be3a5mr12622809plg.83.1623592862495; Sun, 13
 Jun 2021 07:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210611093626.579176-1-yangyingliang@huawei.com>
 <20210611093626.579176-10-yangyingliang@huawei.com>
In-Reply-To: <20210611093626.579176-10-yangyingliang@huawei.com>
From: Timur Tabi <timur@kernel.org>
Date: Sun, 13 Jun 2021 09:00:25 -0500
X-Gmail-Original-Message-ID: <CAOZdJXUn9FgdhiPAqbxMrz4tSeqQ_S+L9jkpg48NxCo5Fz7PXQ@mail.gmail.com>
Message-ID: <CAOZdJXUn9FgdhiPAqbxMrz4tSeqQ_S+L9jkpg48NxCo5Fz7PXQ@mail.gmail.com>
Subject: Re: [PATCH -next 9/9] ASoC: fsl_xcvr: check return value after
 calling platform_get_resource_byname()
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: alsa-devel mailing list <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>, timur@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 11, 2021 at 4:32 AM Yang Yingliang <yangyingliang@huawei.com> wrote:

>         rx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rxfifo");
>         tx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "txfifo");
> +       if (!rx_res || !tx_res) {
> +               dev_err(dev, "Invalid resource\n");
> +               return -EINVAL;
> +       }

If platform_get_resource_byname() returns an error, it's probably
because the name cannot be found.  So I think this error message is
more accurate:

"could not find rxfifo or txfifo resource"
