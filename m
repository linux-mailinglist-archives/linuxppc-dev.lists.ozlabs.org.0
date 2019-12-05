Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1519113E7D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 10:47:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T9r32GtbzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 20:47:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=daniel.baluta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A/uquqn7"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T9nk3gyWzDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 20:45:46 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id p9so2907740wmg.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 01:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IAHAPcfNyYPZewTfBhsG7qwba+YQCk2356CRIqll3K8=;
 b=A/uquqn7fzUQpqmYGO+PEXKF1NoPRxYMZ0y2sW+aDKN2NiVkv7K16K/R63JFJt3fdo
 PAqzhlml/ixjVKxynF0FGEbQBpjyn/orMffUA7RtohOKEsDFu0I2e/m4o3RSxCMcHRPl
 WxFBf9N9tp3la/OS19JL1VNiHJKI3y4h+yBPMpEsRQkJuXKF10bWuSYlx8+xHkw3mGwu
 CgsV630jVK1HXVfmmOrNxjhvEIF/6CNZuTECWJ6ux4arJzFKOk9C+ztBFKrFZ5gFiQkG
 qHjrP2okiVzBNHwpyOOJH+7tZvfC46DiMArQ1geFD4nelFOWtjAoXRxpDUIjaPrhLngI
 kI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IAHAPcfNyYPZewTfBhsG7qwba+YQCk2356CRIqll3K8=;
 b=qfNwkXSNdsPlARz7Byro1D5eMP65+tRBPbg/nt34KHpipoTvQ4hRPtuiXMMktOg4pt
 HoZVtR9G+Ydwwp8sDsRoyNuJDHeO3aXAmhTDgyFlldJ4ufE/MBYUroqykCSux9eTlpc5
 vIBMFniEdy4F3m1zks8BKOkTX7h+ouzso42frriNi65aDbSkxnrXCn00mru5BGCjDHdB
 SqyIr4xlduuY+SYwGh8CzRXIaWIe27lqMhkjnoqk6SpwNXSLAmP8+l75E+KEp9owbYR8
 ERHXsMj5xURPrMti96BFq/FRuF3E2AC/f3K8kzd3dxHH6K7hhVgsacTEDFBYRHO51CED
 XItA==
X-Gm-Message-State: APjAAAXou+YJqYOCnM1d6YdeUjh4EIu40Ybpnw9Coja1GKi0KVqK+xNu
 5eCMfJDKVeb60zsgVWLJPCpo5dQeBOZ9UOP8R5Y=
X-Google-Smtp-Source: APXvYqwcYRc0fuaLRFVleqfgSmiyl3I2fPNK6AKFa5K8/dfNSEFtx+axt8WpebIoZlIVYXmSl6OmkUOLn9wJyytUYes=
X-Received: by 2002:a1c:4944:: with SMTP id w65mr4047032wma.39.1575539141872; 
 Thu, 05 Dec 2019 01:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20191128223802.18228-1-michael@walle.cc>
 <CAEnQRZCnQAUVowOJw5aPe9rYWU5DKR4bFbmQLYV2BzYqOhRJmQ@mail.gmail.com>
 <a5accae02f840f7e25099c2ccd7b02ff@walle.cc>
In-Reply-To: <a5accae02f840f7e25099c2ccd7b02ff@walle.cc>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Dec 2019 11:45:30 +0200
Message-ID: <CAEnQRZBm2=BrQ2VQW6ZNYSshNi_90-RdHKCYbtXi0=u3oxG3SA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: add IRQF_SHARED
To: Michael Walle <michael@walle.cc>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 5, 2019 at 11:18 AM Michael Walle <michael@walle.cc> wrote:
>
> Hi Daniel,
>
> Am 2019-12-05 09:43, schrieb Daniel Baluta:
> > On Fri, Nov 29, 2019 at 12:40 AM Michael Walle <michael@walle.cc>
> > wrote:
> >>
> >> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
> >> IRQF_SHARED to be able to use these SAIs simultaneously.
> >
> > Hi Michael,
> >
> > Thanks for the patch. We have a similar change inside our internal tree
> > (it is on my long TODO list to upstream :D).
> >
> > We add the shared flag conditionally on a dts property.
> >
> > Do you think it is a good idea to always add shared flag? I'm thinking
> > on SAI IP integrations where the interrupt is edge triggered.
>
> Mhh, I don't really get the point to make the flag conditionally. If
> there is only one user, the flag won't hurt, correct?
>
> If there are two users, we need the flag anyway.
>
> > AFAIK edge triggered interrupts do not get along very well
> > with sharing an interrupt line.
>
> So in that case you shouldn't use shared edge triggered interrupts in
> the
> SoC in the first place, I guess.

I think you make a good point. I was thinking that it would hurt the single
user case. But it is fine.

Thanks for the patch.

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
