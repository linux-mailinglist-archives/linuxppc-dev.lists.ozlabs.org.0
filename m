Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D79B16A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 01:25:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tvxh6pqPzF3Jj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 09:24:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mVclnYpU"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TvtK0L6dzF50B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 09:22:01 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id z12so2697030pgp.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YmpY77tOjMlIBM+QNhtMQBjrqYVfrKFcyr6SgoPVdxU=;
 b=mVclnYpUotNVMVlsDFEnMjm9huupDI5osneDwNjpz3DEn7odTq1c2j3DWotgaHFfiP
 RrjHJyXSDm+jOs+8PAS76MemG0ZSxEVKxiDuzMSVkqgGaPZ+rBRIRjAdsDKGdsqmDTtV
 8Mt5Z3cBPNwe+5kJ6n1RslkClAwV6Wvjtx61BNTXpB7H7V+dtKgX9hc5up8a01GcBRgR
 1aygXyMNnQwQU56EcGzPJFVX4neoPPoyr92ld2d0Hs2kf0jf9Y5L3RTNqCXiFkcC2qFv
 z/cuxBvO5uT+Jm8RnPJQe231C5TPgiAibBCNfbVu/wM4UTIERhf0rLgrHxYfKtOwmB2t
 61+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YmpY77tOjMlIBM+QNhtMQBjrqYVfrKFcyr6SgoPVdxU=;
 b=tJrUTl5Eyes8iIKzf/4/f2FU6kTMEhAUcpqcDmaPFVv/kErtXd4kdoC/UQJPZvt++X
 iC9rAW0zxQ0GevQCPKYDh/oZbPDKukVqSlHWku1+RWo4K8Mot9XuxV86FXvZc3iBkTxi
 +qjuRflM3aX2d1gd5/8DH6mHSXjTRfTiWv1KizpqTPGi7y5OHls66gEis5PKIBStGcmu
 AgXWTzV9n9sDHaKLkdlCQ6VyWO3dwMGTjvx4VgOi/YGfJl8SUscxyl3vuoIQpDuQjYVn
 hau9ZeWa+IugOHUnx4FzsNb9osqrrfismwmB/MQdbMRST9JFRaZhKmuXn84EC12vzTK5
 bIUg==
X-Gm-Message-State: APjAAAU5mVIAwlw4jhah9wUDamKU7EiZZYtUAwTi0jL5n0ok75nxC3Oi
 0jwKNG/CzwVdYjX0Nw9DHQc=
X-Google-Smtp-Source: APXvYqzjkWQvAVi05TsLPjjsDKWOcCu5aiWUyBmF1hRLmeD9T7T6K9HbN6XFLr4Amm9oqjG/SQ3UEQ==
X-Received: by 2002:a17:90a:e98e:: with SMTP id
 v14mr1337906pjy.101.1568330519125; 
 Thu, 12 Sep 2019 16:21:59 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q204sm33758013pfc.11.2019.09.12.16.21.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:21:58 -0700 (PDT)
Date: Thu, 12 Sep 2019 16:21:37 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [EXT] Re: [PATCH 1/3] ASoC: fsl_asrc: Use in(out)put_format
 instead of in(out)put_word_width
Message-ID: <20190912232136.GC24937@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <65e96ca15afd4a282b122f3ea8b13642cf4614c7.1568025083.git.shengjiu.wang@nxp.com>
 <20190909200156.GB10344@Asurada-Nvidia.nvidia.com>
 <VE1PR04MB6479D271F4271ECF404473E7E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479D271F4271ECF404473E7E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2019 at 02:22:06AM +0000, S.j. Wang wrote:
> Hi
> 
> > 
> > On Mon, Sep 09, 2019 at 06:33:19PM -0400, Shengjiu Wang wrote:
> > > snd_pcm_format_t is more formal than enum asrc_word_width, which
> > has
> > > two property, width and physical width, which is more accurate than
> > > enum asrc_word_width. So it is better to use in(out)put_format instead
> > > of in(out)put_word_width.
> > 
> > Hmm...I don't really see the benefit of using snd_pcm_format_t here...I
> > mean, I know it's a generic one, and would understand if we use it as a
> > param for a common API. But this patch merely packs the "width" by
> > intentionally using this snd_pcm_format_t and then adds another
> > translation to unpack it.. I feel it's a bit overcomplicated. Or am I missing
> > something?
> > 
> > And I feel it's not necessary to use ALSA common format in our own "struct
> > asrc_config" since it is more IP/register specific.
> > 
> > Thanks
> > Nicolin
> > 
> 
> As you know, we have another M2M function internally, when user want to
> Set the format through M2M API, it is better to use snd_pcm_format_t instead the
> Width, for snd_pcm_format_t include two property, data with and physical width
> In driver some place need data width, some place need physical width.
> For example how to distinguish S24_LE and S24_3LE in driver,  DMA setting needs
> The physical width,  but ASRC need data width. 
> 
> Another purpose is that we have another new designed ASRC, which support more
> Formats, I would like it can share same API with this ASRC, using snd_pcm_format_t
> That we can use the common API, like snd_pcm_format_linear,
> snd_pcm_format_big_endian to get the property of the format, which is needed by
> driver.

I see. Just acked the patch.
