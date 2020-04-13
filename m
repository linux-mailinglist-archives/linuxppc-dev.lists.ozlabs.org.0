Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A0A1A637E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 09:21:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4910Qd6Ry3zDqTs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 17:20:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lm3du3ZN; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4910Nq5ybyzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 17:19:23 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id s30so6489638qth.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 00:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2nT3Va3E4vwilp1Fdp7ARRfOyF9O8UdBycnmN+9Xhsw=;
 b=Lm3du3ZNa8HvaBi6XryhBn8zFP8p7bnaPyDhrcxfNIvLvG0xa9ym0IHVYBQ/nv9i9R
 sayue0wrNelJykTg46+IjgbVRRHGLYy7MZ6Lc0xIeBoLYkv5gtnJZXaDFqTWw0RZzYAl
 d9d0fz9wc5Fx2L+T6rvAWERt7aUZ4w8U+UXjORxiMrtg6Vps8Z93DdGOv9qIGL3LYGMQ
 vjInJ5kMEmKYQfraZHjLv6FpJ0LYJzSJYpJRnhzsCcCaaop1hAG98Uq7m1vU/LImOmDi
 eiLqXAV1rFX/qITBUBI3RwJIdPorIsc7k32KSrLj8kuzqJDfkJuSRClis03CI5UhSnEg
 UJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2nT3Va3E4vwilp1Fdp7ARRfOyF9O8UdBycnmN+9Xhsw=;
 b=nQUFlow+Z8pq4i/uzq0ciWSjEpNsYsQ/hCMWkEnUnjX8729NR9xBwwNM07bUlif7WL
 rdauUOkBUUURc2tpyqLENdw+txIrpRx7PRy0JNaCQdUa7gAcBl/9hSa3/2UEOeqxaR9a
 i6TeAOpssyAx1wxmYCiFD35t2OMv50R1xtaDCKQXEttaqQ6M3UzsvJjnMVgn5n61voPJ
 xwPkmTgN5yrwcf4LdWPFv3LpAF8Ms8MnAC2o6nc1r2qyH+SG8/IydJrHbN7t4dkCgJbv
 +abLe/uuzgMWcYCV7TxFK7B0vDxPmL9rXVcW8oTZXxc5Msbf6D7VqesxGooKzCBxkALM
 VC2g==
X-Gm-Message-State: AGi0PuZnIo9CCbsFkadl+544TGJnZET90Ujir+lytadaGYmrMeFUC5qs
 lZvpUuWpStAkjmvLcwtfZwjY3vlqwjQIrypm0u0=
X-Google-Smtp-Source: APiQypLiZzOmvvNbZthlcuAk+7DNZ/bAtcOVLzBOGnKD29q18014aTMKUIxT6RpYFvwJHP1TcCDBEfyHYQ62HhVJz7M=
X-Received: by 2002:ac8:22ad:: with SMTP id f42mr9986167qta.292.1586762359717; 
 Mon, 13 Apr 2020 00:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
 <20200412020814.GA5984@Asurada>
 <CAA+D8AOapHbw_AREcJmef2tnM4aNiU11FLacW3HS7CXQThs80Q@mail.gmail.com>
 <20200413043143.GA9116@Asurada>
In-Reply-To: <20200413043143.GA9116@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 13 Apr 2020 15:19:08 +0800
Message-ID: <CAA+D8ANUDAfLVJ6NQvtHSV27G4RUoQYEnA3Ym0wH28YCA6bZMg@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
To: Nicolin Chen <nicoleotsuka@gmail.com>
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

On Mon, Apr 13, 2020 at 12:31 PM Nicolin Chen <nicoleotsuka@gmail.com> wrot=
e:
>
> On Mon, Apr 13, 2020 at 11:16:31AM +0800, Shengjiu Wang wrote:
> > On Sun, Apr 12, 2020 at 10:08 AM Nicolin Chen <nicoleotsuka@gmail.com> =
wrote:
> > >
> > > On Sat, Apr 11, 2020 at 01:49:43PM +0800, Shengjiu Wang wrote:
> > >
> > > > > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_a=
src_dma.c
> > > > > > index b15946e03380..5cf0468ce6e3 100644
> > > > > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > > > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > > > >
> > > > > > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct sn=
d_soc_component *component,
> > > > > >               return ret;
> > > > > >       }
> > > > > >
> > > > > > -     pair =3D kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL=
);
> > > > > > +     pair =3D kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIV=
AT_SIZE, GFP_KERNEL);
> > > > >
> > > > > If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> > > > > define in this file too, rather than in the header file.
> > > > >
> > > > > And could fit 80 characters:
> > > > >
> > > > > +       pair =3D kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KE=
RNEL);
> > >
> > > > I will use a function pointer
> > > >     int (*get_pair_priv_size)(void)
> > >
> > > Since it's the size of pair or cts structure, could be just a
> > > size_t variable?
> >
> > Yes, should be "size_t (*get_pair_priv_size)(void)"
>
> Does it have to be a function? -- how about this:
>
> struct pair {
>         ...
>         size_t private_size;
>         void *private;
> };
>
> probe/or-somewhere() {
>         ...
>         pair->private =3D pair_priv;

we need to know the size of pair_priv before allocate memory.

>         pair->private_size =3D sizeof(*pair_priv);
>         ...
> }

In fsl_asrc_dma_startup, we need to allocate memory for pair and
pair->private=EF=BC=8Cbut we don't know the object, so we don't know the
size of private, so function pointer is better.

best regards
wang shengjiu
