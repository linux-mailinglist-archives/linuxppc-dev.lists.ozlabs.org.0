Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 184D11DCC25
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 13:32:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SSBy1TJFzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 21:32:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MqYN+vMi; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SS942r5nzDqR3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 21:30:29 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id i5so6742315qkl.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mVnGuA/c41po031/Zyo9z05iki6LpXCl3bw26UlV5Og=;
 b=MqYN+vMiHTEaW4UwLRy16WRoYfu+LJ4pOncpItD4O1GRnxH8TmktN6T6b2PcHxyEwB
 /Ls2IApWVfXgN0RNquNulhQ49MIzfMO2KbQlpew/gmesTLhSAFACIhd9NN5hvF8aTXrJ
 9dGZyhMELfyMK2fbiMTxbSKpZ8EVlDN75FSZjN4lYOI29EfHTi0l6te+3DGNqlishUcI
 ufFCYzDFtCRCTDhyOG4tSbItgT3oIdpuWbG9YF8aGWnFAtPl3K8qizsCVOk3/weuXndt
 nd8yUP/5mHGC7HDR1cjV9fJCWbl4EUH4bqfDeIq+Fhmmrdj99nMfB4lAH2i7rVf5TT9v
 sLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mVnGuA/c41po031/Zyo9z05iki6LpXCl3bw26UlV5Og=;
 b=MXCo4qEBiQQibrI/EYPMzBq1ziP5JwRKbkxAQJNqKzEiMe+t+AkXNDXTP4iXjCqSGW
 hAQIzRcbPQ1zkR8AhslQxKoI2DzbQOoQJ8VjO/ybmR2Zhn5Wr8qqSwrai1j77+yOgyYX
 ahdV7o+ODS+xciddnSO851Opl8c8Eoou8I099T1v8IQoRPon2yRoTI+yRAPIFy1GbVdF
 BhbEFGkibjxkkguNgpedO2S6fgN7y9R/OZ9sUc8/bX7O+9bZ94bEyrsZk43LkCxmXPr2
 V+sPkxMIu63/C+1Hi1gjbJIqMnBTxydrOoHZuBgCkYtKVpXriYFxja0WdGKxVFBkmXe+
 jk7A==
X-Gm-Message-State: AOAM531nIcU2NcYbYmCsVWQ6grHEQTRZINaddPtYmD8G/+qid2TSsNTF
 ItH1DkPz7VGvaXyxZTLTNzMUaeq2cbsUEuQnYXI=
X-Google-Smtp-Source: ABdhPJyt/PrPu0HyLCBNIAlcBPVwQP3EdSaZpX3l0+ThMZQ3Nc11G0djVdAg3aM+jm8BukBsG/8Iq0VgME50WXdM3Aw=
X-Received: by 2002:a37:a50d:: with SMTP id o13mr9327701qke.121.1590060626064; 
 Thu, 21 May 2020 04:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
 <20200520123850.GE4823@sirena.org.uk>
In-Reply-To: <20200520123850.GE4823@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 May 2020 19:30:04 +0800
Message-ID: <CAA+D8AOiVVi3B4dzU8r=rCMz=6w9R=wxBkzAQ=0=RAQLKCWy8Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 perex@perex.cz, Nicolin Chen <nicoleotsuka@gmail.com>, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-media@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 8:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, May 20, 2020 at 07:22:19PM +0800, Shengjiu Wang wrote:
>
> > I see some driver also request dma channel in open() or hw_params().
> > how can they avoid the defer probe issue?
> > for example=EF=BC=9A
> > sound/arm/pxa2xx-pcm-lib.c
> > sound/soc/sprd/sprd-pcm-dma.c
>
> Other drivers having problems means those drivers should be fixed, not
> that we should copy the problems.  In the case of the PXA driver that's
> very old code which predates deferred probe by I'd guess a decade.

Thanks.

For the FE-BE case, do you have any suggestion for how fix it?

With DMA1->ASRC->DMA2->ESAI case, the DMA1->ASRC->DMA2
is in FE,  ESAI is in BE.  When ESAI drvier probe,  DMA3 channel is
created with ESAI's "dma:tx" (DMA3 channel
is not used in this FE-BE case).    When FE-BE startup, DMA2
channel is created, it needs the ESAI's "dma:tx", so the warning
comes out.

best regards
wang shengjiu
