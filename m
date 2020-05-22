Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966A1DF2C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 01:13:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TMjp36j7zDqxV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 09:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.44; helo=mail-io1-f44.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TMgp5S62zDqwL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 09:11:48 +1000 (AEST)
Received: by mail-io1-f44.google.com with SMTP id 79so13257242iou.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 16:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtCZ0bOQ8dVl/wcwOWZuf6hM21Yr4PMWRA6hQoilBR4=;
 b=cvMiyUL+1RRWk7tVcBa+6aKLynpozCmQBp8b+QjAYt+kh0SYuMhRi7NCicS6HmeV72
 9FBXE69U7THm+h3rn3oBXJwYziXSrPDI1rUn5Mo9SsOi0zkIwpQqaYCRMHMgIIVdk6NN
 6HYEFICx9alwrD1yRKcXO+z0s0phpPCB/jL/9NZHCYQwGXuHFpFTN8L1j2xy/tWvrFCw
 FXW28qn7qJbuXtRZQPUNdPtGn6iqFOk8tDbGN68ySnIp+cV6YTT/aZuN5ksyFCAgnaRU
 pTq+bXH28RFOdpIQy/S5AkKcc1Jx1jFMUyiYDFWN1QbIMwa2MqvZ97w17DtyEMuFbHbO
 VGbg==
X-Gm-Message-State: AOAM530LSrxMYQ42+AyQeCCn0Rqw0d66PjC4PMTpXdX+q/amAzHTxmJE
 2QErkRwCjqkl7oyAoTGUn74kiiHvIH0=
X-Google-Smtp-Source: ABdhPJyEKpQf0pr2cJUQ72n4ZM7472DEpeRdABN+r4cpaijTS2P35sP7od2zR2h5TgzPMiOK/vZ8XA==
X-Received: by 2002:a6b:e006:: with SMTP id z6mr5079951iog.138.1590189105759; 
 Fri, 22 May 2020 16:11:45 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50])
 by smtp.gmail.com with ESMTPSA id p3sm4172003iog.31.2020.05.22.16.11.45
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 16:11:45 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id o5so13232003iow.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 16:11:45 -0700 (PDT)
X-Received: by 2002:a6b:1505:: with SMTP id 5mr5062071iov.198.1590189105156;
 Fri, 22 May 2020 16:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200508140947.28712-1-yuehaibing@huawei.com>
In-Reply-To: <20200508140947.28712-1-yuehaibing@huawei.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 22 May 2020 18:11:21 -0500
X-Gmail-Original-Message-ID: <CADRPPNRfS1LTeCPtyfMzDUBvf871v=Vs2rpYGCevvX08OuN-Mw@mail.gmail.com>
Message-ID: <CADRPPNRfS1LTeCPtyfMzDUBvf871v=Vs2rpYGCevvX08OuN-Mw@mail.gmail.com>
Subject: Re: [PATCH -next] soc: fsl: dpio: Remove unused inline function
 qbman_write_eqcr_am_rt_register
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Roy Pledge <Roy.Pledge@nxp.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Youri Querry <youri.querry_1@nxp.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 8, 2020 at 9:13 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> There's no callers in-tree anymore since commit
> 3b2abda7d28c ("soc: fsl: dpio: Replace QMAN array mode with ring mode enqueue")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to next.  Thanks.

Regards,
Leo
> ---
>  drivers/soc/fsl/dpio/qbman-portal.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
> index 804b8ba9bf5c..e2e9fbb58a72 100644
> --- a/drivers/soc/fsl/dpio/qbman-portal.c
> +++ b/drivers/soc/fsl/dpio/qbman-portal.c
> @@ -572,18 +572,6 @@ void qbman_eq_desc_set_qd(struct qbman_eq_desc *d, u32 qdid,
>  #define EQAR_VB(eqar)      ((eqar) & 0x80)
>  #define EQAR_SUCCESS(eqar) ((eqar) & 0x100)
>
> -static inline void qbman_write_eqcr_am_rt_register(struct qbman_swp *p,
> -                                                  u8 idx)
> -{
> -       if (idx < 16)
> -               qbman_write_register(p, QBMAN_CINH_SWP_EQCR_AM_RT + idx * 4,
> -                                    QMAN_RT_MODE);
> -       else
> -               qbman_write_register(p, QBMAN_CINH_SWP_EQCR_AM_RT2 +
> -                                    (idx - 16) * 4,
> -                                    QMAN_RT_MODE);
> -}
> -
>  #define QB_RT_BIT ((u32)0x100)
>  /**
>   * qbman_swp_enqueue_direct() - Issue an enqueue command
> --
> 2.17.1
>
>
