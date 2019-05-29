Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2E2E68A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 22:54:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DjdX3lVMzDqMl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 06:54:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.174; helo=mail-oi1-f174.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Djbv1ck2zDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 06:53:30 +1000 (AEST)
Received: by mail-oi1-f174.google.com with SMTP id y124so3251481oiy.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 13:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2+H7EZcpvU21TkBJqjVERhn4aghur1shp/MYn/imNU=;
 b=p57teXgkUC/QS20uongvd/2pFXzn5AZAOlURP+mKCrt0MIG4jSMEDReQ3ZgPX+C/xE
 xfRhul6MU/QRO8Ye5lRvBblil7WKDxV/zQDb46//CQ8zRaTKQQPQOjX5Q7LAvod/T9S+
 TMb4JnlGjerlFDHCAOv3BhdXdeBxgL4M7qChlnx2fyWtRDqaIsqMoPLoLAe1uI2Tu73q
 xA+3qu78qkHtaGhucNipci6R44duotrxElWxtMgjANtXK2/sX77O2cULkGr327JOdeE/
 WXYIQLgo0OKYbCuN3XWQJ2+NB7AkamgsYqvxn+TYzaFqRNC4RtRXlXfiTxH2LRYuC3zh
 qBKw==
X-Gm-Message-State: APjAAAWGMM+u0XbxgQ9mUFKVNOl6kStNv8M1uZ6XvbE2Nr+0xpkdX+kj
 m0WihyqFpbedYVBc2cwO9j2iySzL
X-Google-Smtp-Source: APXvYqyS2uqnKU57MozjYrzdypOVnvAdV1e3yEZqciASl5iggCqFqTGm1eTVqaTUeqQsxbbn4SP/Mg==
X-Received: by 2002:aca:5e87:: with SMTP id s129mr157415oib.95.1559163207247; 
 Wed, 29 May 2019 13:53:27 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id l20sm253025otf.55.2019.05.29.13.53.26
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 13:53:26 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id l17so3499212otq.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 13:53:26 -0700 (PDT)
X-Received: by 2002:a9d:7343:: with SMTP id l3mr58178960otk.63.1559163206194; 
 Wed, 29 May 2019 13:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190521085624.13665-1-colin.king@canonical.com>
In-Reply-To: <20190521085624.13665-1-colin.king@canonical.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 29 May 2019 15:53:15 -0500
X-Gmail-Original-Message-ID: <CADRPPNS5EbVrQ_ayvs=s7fYAc4JM1DfNeXwrmCXMvk6HzPouEQ@mail.gmail.com>
Message-ID: <CADRPPNS5EbVrQ_ayvs=s7fYAc4JM1DfNeXwrmCXMvk6HzPouEQ@mail.gmail.com>
Subject: Re: [PATCH][next] soc: fsl: fix spelling mistake "Firmaware" ->
 "Firmware"
To: Colin King <colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 3:57 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pr_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Regards,
Leo
> ---
>  drivers/soc/fsl/dpaa2-console.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/dpaa2-console.c b/drivers/soc/fsl/dpaa2-console.c
> index 9168d8ddc932..27243f706f37 100644
> --- a/drivers/soc/fsl/dpaa2-console.c
> +++ b/drivers/soc/fsl/dpaa2-console.c
> @@ -73,7 +73,7 @@ static u64 get_mc_fw_base_address(void)
>
>         mcfbaregs = ioremap(mc_base_addr.start, resource_size(&mc_base_addr));
>         if (!mcfbaregs) {
> -               pr_err("could not map MC Firmaware Base registers\n");
> +               pr_err("could not map MC Firmware Base registers\n");
>                 return 0;
>         }
>
> --
> 2.20.1
>
