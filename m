Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39D183EE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 02:59:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dpmM4k4mzDqRX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 12:59:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pjSAOZwt; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dpkk2g6FzDqHv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 12:58:21 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id 59so6290602qtb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 18:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88CKdz/NKjVak04/lN/5uD3uM5mQKrmtijz9vSkeFgg=;
 b=pjSAOZwt9ryPLjEr9Hn+KApbAgGbTkRLnUUH65gnKwCdCkYwq6qZSG+nWJ2u4BqHK0
 tY7/ToQXdluH6nYEh0LlaNONnotFWYeWQs7ksBcJwWZSMbZAKiWOCD/mpDmNLmNx73Zs
 gCrn6ASGGxo23xeiOF+49pKCeuxy0UG9CtM2APILEqad5ipMKu2R/gDgkETqpzZY0S9l
 KsgrTyJW49G/BOUCKMgudmmuBywylqv8Xu4EXoXh0YXqE5BxR3lmju3MMUSBinST6SAC
 uYWe7YaaLMmgtI9jRzkTANe0kcvacI7UN5ylAZgsiCvqfGuyG00pqVMrO+S0hdF49UYM
 RSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88CKdz/NKjVak04/lN/5uD3uM5mQKrmtijz9vSkeFgg=;
 b=Xz+I64+EqS3CJYekxXetyXQfI1QPxaL6HgcuuXGlkK7VaGJmdiU2TZ+JSh3shZrAqW
 E/l38XybVDK7+ZnLjcezMU3iiKuaF3Bqz3EVL+XgeIE+Nj5CB7YJ21FPWUWjZawNxP54
 qQsb/6BhDUUTq9xV5IVXUoUvx+xEjxYK6LObqMQuwOgcyIxchQnMJcNhnwRh+u9ZOc7W
 wyMFaNNz8lSdKBdiIQwpLATnPyxAfCpctKgBdPurrtlNwIuHU1hOekKwQS7RtiKNgI6H
 FBsb18N6911I5pv99LZepCkM8JDzYgVoz2dG9W3UBkdMF1Mm9cWQ7YJGEQpy89fqNLY9
 UwVw==
X-Gm-Message-State: ANhLgQ3NX4tHaJ8mHOdjboQIsgZYwjPjbzQzNspHxFp/KtLkG9eToM/z
 dT9cYBJCzgjqWW7BuwNNRwkVdeRkn7G2ESljzKk=
X-Google-Smtp-Source: ADFU+vvK5+cSY2SJjGHWhKW0xQKWTvae4atVpKpb9h+cuGuLEZkISiyaRiiGVQ5/eNNFTISVK0wd8Lq7pxHaHGITVPM=
X-Received: by 2002:ac8:5298:: with SMTP id s24mr10110299qtn.54.1584064696061; 
 Thu, 12 Mar 2020 18:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
 <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Mar 2020 09:58:05 +0800
Message-ID: <CAA+D8ANwQ_orAxtVCxsAOJ8b2bRxM9myD+N8Ce7okNZK7q9g9w@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property fsl,
 asrc-format
To: Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob

On Tue, Mar 10, 2020 at 5:20 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> > In order to support new EASRC and simplify the code structure,
> > We decide to share the common structure between them. This bring
> > a problem that EASRC accept format directly from devicetree, but
> > ASRC accept width from devicetree.
> >
> > In order to align with new ESARC, we add new property fsl,asrc-format.
> > The fsl,asrc-format can replace the fsl,asrc-width, then driver
> > can accept format from devicetree, don't need to convert it to
> > format through width.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > index cb9a25165503..780455cf7f71 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > @@ -51,6 +51,11 @@ Optional properties:
> >                         will be in use as default. Otherwise, the big endian
> >                         mode will be in use for all the device registers.
> >
> > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > +                       Ends, which can replace the fsl,asrc-width.
> > +                       The value is SNDRV_PCM_FORMAT_S16_LE, or
> > +                       SNDRV_PCM_FORMAT_S24_LE
>
> I am still holding the concern at the DT binding of this format,
> as it uses values from ASoC header file instead of a dt-binding
> header file -- not sure if we can do this. Let's wait for Rob's
> comments.

Could you please share your comments or proposal about
Nicolin's concern?

best regards
wang shengjiu
