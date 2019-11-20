Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3F10429F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 18:55:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J9M46xr6zDqW1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 04:54:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J9K35HxczDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 04:53:08 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id e9so549774oif.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 09:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uwv8oDObgXlOHyppocybq9RAMpKlTk5h/NeR2cnrypw=;
 b=F391fmpWARFEHBgNGQcX610RbbKv5V50imrveK3HGGLpsW28sRzle5hpmfAu7ZEgtA
 SLp7R0ofq9mSRu5uwLCZeRIzTAdW+uQ3sdr8Ebol77SbAKRsjgV8t3OdMHGndxkNO0LT
 5+N29dzVjznhob+2MlEeQepm4Mrbp3g1ryA2v0evABsWWysX4pmzxNJ7IpZhupPCuKHd
 psMa9T8lCPgM15RjCdpJR+LlcMwkDxAm46lT8LnJVr7KBX0VanHvnqbrip/Hm4NWnjvB
 7KkSXd9Wl7r/6GVwC+BqHhnFRjZZu3/piC9ZzfcxCS71sceLTqcz+PYBl+ICtfWz7Bet
 2Ovg==
X-Gm-Message-State: APjAAAXdDTkpsp7dAdcAqLEKCJYgwLd2H2blx7sRGb8Xm7zucK7btDBZ
 QKa3wjfosw0e7eBgNMaaiAH2QxIk
X-Google-Smtp-Source: APXvYqyRWH1ONiovMIg7TYPtLTVW4hA8N2wFbz8KiItNEvEHVvZoYy6efJcblFuDaLLHRcFCO4uS2w==
X-Received: by 2002:aca:c64c:: with SMTP id w73mr3970884oif.161.1574272385648; 
 Wed, 20 Nov 2019 09:53:05 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
 [209.85.210.41])
 by smtp.gmail.com with ESMTPSA id q4sm8364684oij.52.2019.11.20.09.53.04
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 09:53:04 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id c14so383859oth.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 09:53:04 -0800 (PST)
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr2846999otq.221.1574272384642; 
 Wed, 20 Nov 2019 09:53:04 -0800 (PST)
MIME-Version: 1.0
References: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
 <20191118112324.22725-46-linux@rasmusvillemoes.dk>
In-Reply-To: <20191118112324.22725-46-linux@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 20 Nov 2019 11:52:53 -0600
X-Gmail-Original-Message-ID: <CADRPPNTgNtFL9Wok_ZNJSoo=4vokdU7c7z9JM-_e-w=pcDfwDg@mail.gmail.com>
Message-ID: <CADRPPNTgNtFL9Wok_ZNJSoo=4vokdU7c7z9JM-_e-w=pcDfwDg@mail.gmail.com>
Subject: Re: [PATCH v5 45/48] net/wan/fsl_ucc_hdlc: fix reading of __be16
 registers
To: David Miller <davem@davemloft.net>
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
Cc: Timur Tabi <timur@kernel.org>, Netdev <netdev@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 lkml <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 18, 2019 at 5:26 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>

Hi David,

What do you think about the patch 45-47 from the series for net
related changes?  If it is ok with you, I can merge them with the
whole series through the soc tree with your ACK.

Regards,
Leo

> When releasing the allocated muram resource, we rely on reading back
> the offsets from the riptr/tiptr registers. But those registers are
> __be16 (and we indeed write them using iowrite16be), so we can't just
> read them back with a normal C dereference.
>
> This is not currently a real problem, since for now the driver is
> PPC32-only. But it will soon be allowed to be used on arm and arm64 as
> well.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  drivers/net/wan/fsl_ucc_hdlc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
> index 405b24a5a60d..8d13586bb774 100644
> --- a/drivers/net/wan/fsl_ucc_hdlc.c
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> @@ -732,8 +732,8 @@ static int uhdlc_open(struct net_device *dev)
>
>  static void uhdlc_memclean(struct ucc_hdlc_private *priv)
>  {
> -       qe_muram_free(priv->ucc_pram->riptr);
> -       qe_muram_free(priv->ucc_pram->tiptr);
> +       qe_muram_free(ioread16be(&priv->ucc_pram->riptr));
> +       qe_muram_free(ioread16be(&priv->ucc_pram->tiptr));
>
>         if (priv->rx_bd_base) {
>                 dma_free_coherent(priv->dev,
> --
> 2.23.0
>
