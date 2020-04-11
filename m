Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 106961A4E41
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 07:51:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zkXY5vxlzDr13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 15:51:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q5aneZKK; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zkVd3hTJzDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 15:49:58 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id bu9so1908137qvb.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 22:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJrtFPh2k7Ocn2F2h4jgSLlpNWoMCuHTn40DR2631os=;
 b=q5aneZKKA78xQ6o1kJ1rScGZMZivPxz9JT4IiA4AblcWrlcRjvjh6cpnmwnS62vv1T
 bEbtqMxoHQvxkLa8HHlRwa3jMgYPeNd/k/3r9FuIGLgF0li7N2q7/0bUM8SSWLn3NE1U
 Sh9VJhTkn84Wrr87C5rn69nla076gFroH9YBa/4+skYdmR+O380EnUnRCbREX4jQKHiO
 0NXSGQXZv5jP6nMOdq3WowIdE0WqqKGcY5OOGEMtgqcYVBklvd2oZ19bMWyt+TdLtNg9
 XZQbPs3z2fUy1Z+BidU3rnDt+GzWSSMIddxLw8EkUI9Exn9cRvtHi2azMDuvotyBa/Bk
 mkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJrtFPh2k7Ocn2F2h4jgSLlpNWoMCuHTn40DR2631os=;
 b=dauu+RgkEx37mva4AZ4JyNqgz1KAW3JcPZIkVFEGmfcO/6bUBFOyENXmFzy2/QP+aC
 pLX2YGtkv62R5vTaLmsFGPucqPhyktFI+Q+dU0qKjRZiYUKMYRWkJX1DlKAy4VI7IrER
 MwU+JWN9WkikgJMvHt4y0aoM1O1KF1L0SJ5Jkv8WRbAuyAeUpXlzJg+eF1nYwMw5qnNN
 fXV3UymNKHOM7p8G4fmBhKKm3o9otP81DteB/T9h0SwWwikuFFPoUdnWUBfazhbOmf33
 uG2jTtjAaEFq6GTJoakEWsbFS3dVqXuK4X+9epPsNFVvgTe9/yzTvgun/JPYMtl7rwN1
 Lj9g==
X-Gm-Message-State: AGi0PuaAvY+PjPMGFNwkYqow37inuPkEBIhIMpFhspoJZLHb80LIsIiQ
 cKLcYrXIrvxzFNvPW5sBxzY6FKLc+W0MBFrJyrE=
X-Google-Smtp-Source: APiQypJ+BVKiXkyfqlXZ3G20bGDwTrRdeBK+2RCyToQfCR2IikaFnt/ESyQeRXUJ6JCeNWMvUq6ai+h+x7+pUzlEZaM=
X-Received: by 2002:ad4:4665:: with SMTP id z5mr8411234qvv.32.1586584194833;
 Fri, 10 Apr 2020 22:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 11 Apr 2020 13:49:43 +0800
Message-ID: <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Tue, Apr 7, 2020 at 7:50 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Wed, Apr 01, 2020 at 04:45:38PM +0800, Shengjiu Wang wrote:
>
> >  static int fsl_asrc_probe(struct platform_device *pdev)
> >  {
> >       struct device_node *np = pdev->dev.of_node;
> >       struct fsl_asrc *asrc;
> > +     struct fsl_asrc_priv *asrc_priv;
>
> Could we move it before "struct fsl_asrc *asrc;"?
>
> > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> > new file mode 100644
> > index 000000000000..5c93ccdfc30a
> > --- /dev/null
> > +++ b/sound/soc/fsl/fsl_asrc_common.h
>
> > +#define PAIR_CTX_NUM  0x4
> > +#define PAIR_PRIVAT_SIZE 0x400
>
> "PRIVAT_" => "PRIVATE_"
>
> > +/**
> > + * fsl_asrc_pair: ASRC common data
>
> "fsl_asrc_pair" => "fsl_asrc"
>
> > + */
> > +struct fsl_asrc {
>
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > index b15946e03380..5cf0468ce6e3 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
>
> > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> >               return ret;
> >       }
> >
> > -     pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> > +     pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
>
> If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> define in this file too, rather than in the header file.
>
> And could fit 80 characters:
>
> +       pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);

I will use a function pointer
    int (*get_pair_priv_size)(void)
to avoid definition of  PAIR_PRIVATE_SIZE. which is not safe.

best regards
wang shengjiu
