Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4635F10DC5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 22:10:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vTyb4gYRzDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 06:09:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.195; helo=mail-oi1-f195.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vTxK2qVPzDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 06:08:52 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id t184so12143790oie.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 13:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MhhNnHbahaGD1ttZfVO4EhM/RU7xN3mKfU+xr7R87yk=;
 b=sDjMjjTbMpVTrluctZQz0TO1Wy5Gen5yRxvKdZXYZuBVXOjhpZu0DiPUF3phTjpKhT
 LAkd44cE5Vkb8tBlHjPrO0NVoRc+jfsLwngZiMC+VNnf/gOAtQgh2udBc/GP99t8tHQN
 TO4PYVmfh9nRVKhrlNFBq/BK/sEtUFV95DzK5ggsLoY+S/eGYh77UUhUBMSRKsYHrWjV
 Je50bK0BTeo6JbPVT1InVwUjG9Hb013YGnsIENOfvLjmQq5L1l6ESuX/WonktBSO+NO+
 ETrlMBADzIOpC5MuYyX0OYuI5TgtUloIC90T75Wr6bhASEyhq2Itp7N16KTHrL01Zwto
 zfgA==
X-Gm-Message-State: APjAAAUfDf1KVfIK1Ry6gjJwkUbmJmA3NZdjtNbIB6aQxaUe3r5+JBdK
 9ZbXBC5ls3rVQSJtLCDorCuIc9bJ4I0=
X-Google-Smtp-Source: APXvYqz5ZOqu3zvCipqrL9ZaRW/DSiIqHwrEKw+MDallVml9gGJ95Uy4CdBpeXedQAY5ggyro7WXEg==
X-Received: by 2002:aca:a9c4:: with SMTP id s187mr72126oie.122.1556741330355; 
 Wed, 01 May 2019 13:08:50 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180])
 by smtp.gmail.com with ESMTPSA id b51sm18582189otc.8.2019.05.01.13.08.49
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 13:08:49 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id y64so9129110oia.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 13:08:49 -0700 (PDT)
X-Received: by 2002:aca:4e83:: with SMTP id c125mr62690oib.13.1556741329634;
 Wed, 01 May 2019 13:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
 <20190427071031.6563-2-laurentiu.tudor@nxp.com>
In-Reply-To: <20190427071031.6563-2-laurentiu.tudor@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 1 May 2019 15:08:38 -0500
X-Gmail-Original-Message-ID: <CADRPPNRGxEz_YXhzrJPCZrz_Xc-9Fh21tgbjERoOazMMQmiVbA@mail.gmail.com>
Message-ID: <CADRPPNRGxEz_YXhzrJPCZrz_Xc-9Fh21tgbjERoOazMMQmiVbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] soc/fsl/qman: fixup liodns only on ppc targets
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
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
Cc: madalin.bucur@nxp.com, Netdev <netdev@vger.kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, lkml <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, camelia.groza@nxp.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 27, 2019 at 2:14 AM <laurentiu.tudor@nxp.com> wrote:
>
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>
> ARM SoCs use SMMU so the liodn fixup done in the qman driver is no
> longer making sense and it also breaks the ICID settings inherited
> from u-boot. Do the fixups only for PPC targets.
>
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Applied for next.  Thanks.

Leo
> ---
>  drivers/soc/fsl/qbman/qman_ccsr.c | 2 +-
>  drivers/soc/fsl/qbman/qman_priv.h | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman_ccsr.c
> index 109b38de3176..a6bb43007d03 100644
> --- a/drivers/soc/fsl/qbman/qman_ccsr.c
> +++ b/drivers/soc/fsl/qbman/qman_ccsr.c
> @@ -596,7 +596,7 @@ static int qman_init_ccsr(struct device *dev)
>  }
>
>  #define LIO_CFG_LIODN_MASK 0x0fff0000
> -void qman_liodn_fixup(u16 channel)
> +void __qman_liodn_fixup(u16 channel)
>  {
>         static int done;
>         static u32 liodn_offset;
> diff --git a/drivers/soc/fsl/qbman/qman_priv.h b/drivers/soc/fsl/qbman/qman_priv.h
> index 75a8f905f8f7..04515718cfd9 100644
> --- a/drivers/soc/fsl/qbman/qman_priv.h
> +++ b/drivers/soc/fsl/qbman/qman_priv.h
> @@ -193,7 +193,14 @@ extern struct gen_pool *qm_cgralloc; /* CGR ID allocator */
>  u32 qm_get_pools_sdqcr(void);
>
>  int qman_wq_alloc(void);
> -void qman_liodn_fixup(u16 channel);
> +#ifdef CONFIG_FSL_PAMU
> +#define qman_liodn_fixup __qman_liodn_fixup
> +#else
> +static inline void qman_liodn_fixup(u16 channel)
> +{
> +}
> +#endif
> +void __qman_liodn_fixup(u16 channel);
>  void qman_set_sdest(u16 channel, unsigned int cpu_idx);
>
>  struct qman_portal *qman_create_affine_portal(
> --
> 2.17.1
>
