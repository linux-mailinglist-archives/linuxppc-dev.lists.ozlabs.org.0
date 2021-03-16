Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0AD33D4E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:34:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0DlV03Psz30Dt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 00:33:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=R+7ONg+R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R+7ONg+R; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Dl46gl3z302X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 00:33:35 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id f124so35155702qkj.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yxhYiPJJfH15vXoqGY5Nr6454DNFIyQXelAI1Oeta38=;
 b=R+7ONg+RgbaadocUNVLV29LfFtUgU08qGOry13BkXZuUFBFdApt7Q1+HoPq95QNmmK
 2o3ieaXtCTwUuwJLbltLXooTvq9MOIcqDu2j31htqM9p/0qKnYJJG2FbX2hlB2DMQhHS
 wN/YFTNa2+/mIo9Ss9mOnnaK9uViykX44CgthMB7gKsSAtW2dYhUXV+zXJwEYdLvyjjG
 hhlZhAuWKnxeE3sC76kOrqtI+zQq8bHLJepTQ4Bp+Mt8ZOcv2K5z2/1zuQJPcf2gB9vA
 VIhQgygxCx7LeyWGzQTGlkeVXK8pHZxUrbGtLyGgYe+iOyb8BBHkxWWZH5E6i1l09S9V
 q7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxhYiPJJfH15vXoqGY5Nr6454DNFIyQXelAI1Oeta38=;
 b=P8js7yMGeRGphQRRaGMxVIDg7jZcxw8Td0g4Gxvsu7Y7FS4aO8UT/wSjI94uSd5s+6
 78ApK8g3l2RE2VCkN9f2AKQ+aYNu/UxixjeS/PCeDQlO/u4pDQOf5nLHaTumn98LWTxR
 fMATScwBBiC4lJ226yS4JL7GXk1RcYNNgWVFaUvq0f3ihRICPYpKnYzf7/cNCy92wEBM
 vAb1UGDsK0pv8MK07tqQSxEW/HYv4T2F2okZzV3BEmkdYHharBD1o4flxge8YOmMCUVd
 GnO/Tk9ZPjf3+lrGuq6cesNs4OWWUY/WkWo792OsL5lH9jw4dMOWwQJkOO9gxCQXZ1oY
 pisA==
X-Gm-Message-State: AOAM531qHw/UJtqqQDY2EY/SwOnE6ijicLenVOZ9AeMUbBezTEkcU3wX
 ba/cBlxH72PmMwVst+oQ7dDTwcWm7IszOIzq6XE=
X-Google-Smtp-Source: ABdhPJykBK34HSDNuEExOj5PswzE1G8jMi/5K/0nsn1rodmf2p5QQgA9T0JNsjrPtdfQjvlMyoaxymcMxTUmvmisoS0=
X-Received: by 2002:a05:620a:718:: with SMTP id
 24mr30441878qkc.121.1615901611988; 
 Tue, 16 Mar 2021 06:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
 <20210316125839.GA4309@sirena.org.uk>
In-Reply-To: <20210316125839.GA4309@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 16 Mar 2021 21:33:21 +0800
Message-ID: <CAA+D8APfpXvMby-rKKodcOZaJHHsE4sAtSYV9JW867MLZTvj5w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: remove reset code from dai_probe
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 16, 2021 at 9:01 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Mar 16, 2021 at 05:27:06PM +0800, Shengjiu Wang wrote:
> > From: Viorel Suman <viorel.suman@nxp.com>
> >
> > SAI software reset is done in runtime resume,
> > there is no need to do it in fsl_sai_dai_probe.
>
> People can disable runtime PM in their configurations - do you not still
> need a reset on probe in case there's no runtime PM?  It'd probably make
> sense to factor the rest code out itno a function though.

Right, didn't consider the case of disable runtime PM.
Will move the reset code to a function.

Best regards
wang shengjiu
