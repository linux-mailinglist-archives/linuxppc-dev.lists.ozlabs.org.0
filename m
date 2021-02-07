Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F210C312345
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 10:51:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYPYM3HHSzDvZr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 20:51:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=diViRcfh; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYPWR0GF6zDvWk
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 20:49:17 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id u20so11556704qku.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Feb 2021 01:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cbbpsfQOSGbGs7R9zUS8hYozEigpvRyjnIt3/cvm3W4=;
 b=diViRcfhsBkjhy6mWySEJOvsQpOFK8pZMbHHTOXwUoPo1Ufs827UZAvqXypn/cYfbC
 w6BVY6DkW3CKlG2KmSRpgU5z2KocTnpA6/MSr+resHu5Lry5t6So7Ij6KP0YOIUAM9W/
 huFYnUNtqpAcUFTaoClhw4N7n27WmMKnsKfev01KHJxc+8bzxTWIJGGdzL6ZJgkcbpJg
 IdB8X6n+ct1xkjqGPnj+HWL0/tirsOdYu2VRr7ftt2i//YyLHiP9LHr7JFBytNJUAaI1
 5cgpzZ3gAIyg49t2FiBhrd7VMbFLD9n5qn+iTRwhsPWZI1OMMqICxBPAgxO5SQLVPtx/
 NDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cbbpsfQOSGbGs7R9zUS8hYozEigpvRyjnIt3/cvm3W4=;
 b=UsxmdMBatTrzMWz3Pe41/XHN2J9yyPqbMLSKnZOco7vW0B9Rkziv6xrLKWufBGDdXs
 KQPaxdnTn+XmXdzo1wEuAoeNjzwCIYsA2Thh3EQYSdaKSz92MKBxAN46ekDWIWxj8+TE
 T4ABV4U1uNY5xIyNDkuzRII+VJEbNvt8pM7D8IluhwWgLxa4Gf2tR717+uEOyzZu0ByQ
 /UdVAfySiQKp0Z9OpEZBayZlorG/FvtZ8zDJ7I4yYV03Bl/tAnKi5Q4KNSX2kSXPYeXK
 CUa1eGlnqaIFj1CiZ8leqwGKXKVm+eHML8Zb2nv2XxwTMfRW7BTy1mUjWzJeVt2KjGOG
 DXYA==
X-Gm-Message-State: AOAM530ufQZMckXZrHcPMo0gcLMbRGX0WBoE+Pp98At0pSHI2MaafVB6
 nbZYgbbUALXkg8jG3U9mU/tEd1j+RNpA6m3ovRQ=
X-Google-Smtp-Source: ABdhPJz7+XOZYuIE5pcblvhRQewVLTixRZW/R/cp3G96D5R/aLCDqK4IrND0zV4hhmv9HidC2Ycs1HEyKDlklGV2C98=
X-Received: by 2002:ae9:e80e:: with SMTP id a14mr2346374qkg.103.1612691351108; 
 Sun, 07 Feb 2021 01:49:11 -0800 (PST)
MIME-Version: 1.0
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-3-git-send-email-shengjiu.wang@nxp.com>
 <20210205140251.GB4720@sirena.org.uk>
In-Reply-To: <20210205140251.GB4720@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 7 Feb 2021 17:49:00 +0800
Message-ID: <CAA+D8AOa73k4yRsy20w2yHOTPoKATm0pwsBdJvtxthEtff6WrA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on
 rpmsg
To: Mark Brown <broonie@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 5, 2021 at 10:04 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 02:57:25PM +0800, Shengjiu Wang wrote:
> > This is a dummy cpu dai driver for rpmsg audio use case,
> > which is mainly used for getting the user's configuration
>
> This is actually doing stuff, it's not a dummy driver.
>
> > +static int fsl_rpmsg_remove(struct platform_device *pdev)
> > +{
> > +     return 0;
> > +}
>
> If this isn't needed just remove it.

Thanks Mark. I will update them.

Best regards
Wang shengjiu
