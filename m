Return-Path: <linuxppc-dev+bounces-16412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNAJFu4OfGlMKQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 02:52:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2CB6486
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 02:52:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2JtL53zMz2xjP;
	Fri, 30 Jan 2026 12:52:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1032" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769737962;
	cv=pass; b=G8JWFFTLO9UCwG1CIUtICe9vEAYw+NGKtWywS8Fn3CF1f2Cj8mpRj5rMAH0ubS9bDkLk/zPQC3ECXEj2EJsYHnxNYoXxc1NPI1cJ6QI9TMqDlV2QgzATJC9qo7HId1klkY27ppAzA1tiNIYPK1oc1LruS0+f+C3CWBA4rSYDPwW6cY/4DM+rR8gKAg19QwUyfXSXEW/t29p//QbwyR5NjNwMeDx/L0jIESLwDT13B0FJ7HAsjPQDhZ+Ks4mXrBgPR/5ngxkZaJESYfbrL8afAOn4IrRKZZqAl7QpKZmgwXjYvbn+lmr/bGxlZUmn6yXhgOJaGQAl+o9Nihg9KLY6dg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769737962; c=relaxed/relaxed;
	bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hhv47hcCgKp0mu/mMt2DgF5I1IEEHxryhs90EwenYhn3WkejXcxzq/zhGoAJZkx8ufQUJ4Oo4pQTkmATYi7Z7Mpcm9o1HuyBKauQ9ibORXn5iSvsrcg/9RMpOUQzxXzI5s/RI1Q2m+IspE0aisecjFytHIkF9LD2CRDzYtT/aKnDHz1t9qbZs+QqqxHdx0//nSTx2Nusm2WKpNzMKa09XBrRThgcGbqlkQDWGxn7xa5cwbZTA3CdYPprGWdxpGIu4FEtacmEuPGxTRgqz4f3uI7FRhfOy6xtCmcIRuB5NeHGZB9ZmrIx8pcKCATdCrRN0TIbZgWCIR8sbWi2rtJZ+A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eW682Xx0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eW682Xx0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2JtK47JPz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 12:52:40 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso1253240a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 17:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769737958; cv=none;
        d=google.com; s=arc-20240605;
        b=c8zjvx6oCnpbRAeCnCB9nKteZgJdNFOnN5PSS2ed4uLxvfTkBPd6CKVMxXD/aGDCSI
         RGBydvwqf2t5LGT95KdE+B1nOiHbcPQ2lUIcJuGN0ux/jX5CPgwQqAt8sHqa67KZJCEX
         JE656PC9Rn/LlWROpqMHA8I52024CJZXYXVjwFuOtn6Iz2xSztBIGkczFZPnjRDoMian
         pqPxhdRZE9NH23sgaSrqV6WlpcmCw+k7NLpHlDAP/BsxMpmUMjTS4HUzGCN10IruTdLl
         s4oH76rxekT447x0Vmh15lNIU5klG2zS0vdVk9NxIH6EbNv/oQSRBYfiNL9LieKYNeQB
         ASCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        fh=02tNfCpEhMGv1b3FUJCulGF6t7mOZvJ018Rutm8+Ajk=;
        b=GhhHPMY2a177Ytn54PIX0/m1eWXgQ/mCoAceOttqTMh4pUzPvXj0yrP/2t3QP18ecv
         uSN5dqYNO0nSoJoKXOkQhSX64WFJ8pas7vOG18hkBx6/NtL/XrPdmx/i8qBYltyzdnNR
         dJl34bLBdSfiTXFZe02Uefx866dM/qCC51+HVZButnWWWx2JijjmvaKae1l1ZF1g8wsh
         jgLzjhFDVGbvZhCm2Pbp7bqJZTH+5m+ENSVjQa4J9PN1mcrh7AvSdeioU2NVMM30IPVE
         tIVeXhCzVL4bEv6HcHYzQebib9KJBATCI4PZq/S62CUZ2HQAT8y+72pUoSPBng+GYGbj
         vJmw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769737958; x=1770342758; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        b=eW682Xx0nbYSn82djRR1FSGZ0W26pJjeSgD3LlNQRlQQIIgXt5v2rcPttJj5/Y2XDx
         7A9+nliTfmjwpMxD19z0g6elOb5Ik9wGAn8jze0rN6W36WLzUmq935ayYa17konj7/p6
         cERaK0nURNG/kyaMfPyY2mftgFNmiJytF/Sz5TmSSMrdt+bTaYHDnXFO9dAiPQHu/6ZW
         PXiNTTnm2jnVHzcdXp1LWY0setcSTpuNgEIyU4+JcCoeZtdHh1IwQQ/Hap0yKiPrCaPU
         7AuyTLnq9meqljNS+ZR7mOT2DsGzAOozuYoFcDwp28mHZdomFyvJVDVzP24bpN4vflpv
         cqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737958; x=1770342758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        b=nJLtWmYXGFEwtCSasVrvAaSbd6V/IMOcZzv6j6s8G/6GRUb2DCsqSqhco0Gj9w5DWZ
         B23iECDDhT5O88Bu04VqJeTk6/jRCGCcfaMctMI/+zXsawsXIW2Jw4FWkJLPLqa7vaNt
         nefJQMSgjhO0GzMK+gMDP/HPLUBm+pmPTKt96uKZ1CkYZr2cCI4NCaePtjRw+cdAQTqX
         aln4gH13S/lqGxziaDV8OWxSAVgY2E1p7Vz5pewnSUCG5R0UA6Nvwugy5ZBYu7vcVQmx
         kyJt4AFIt4ijTXuQsIqJV0sXbYn989uHXSpp9Tg1hoEbLh0zGguBH5YtJfk2FWiu9J8l
         kp9g==
X-Forwarded-Encrypted: i=1; AJvYcCVZn+3ddIa9/XOpwE/DjJjjw3gyPjzlpaWP2YCW7ne26Gt/vB+3dKLFcg68YqxA4GIYMavVPUsexHX6ys8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw4kqvrMoj7EdcqUDEUPHgrgpT2g/fUGjNhrLsptKoKSYyGwzBC
	UYk8EiE6+fBMhEvNadCoYHF2shIEJ2v59mYxDpfOLYIXEKs0smCiYwnZTsIG+kXI7M4i5bmNoY5
	O3i2YkEHfV9NlCwUl+cmAPwbVkZqnnac=
X-Gm-Gg: AZuq6aLjXwVFlJ/vS24Z+/ug79LoCLsLIvy2uMkMbVTbGnnDEFwTHrcGMbmcbaSyOYf
	dw1k/eBPsJzymo9A3lF+CA0wIziromD5mexkBHEqG422emqocllpExNxuA6qo4WppoxjGNZfp+w
	uRUg5/RZ7tvScxlM6HAsVygb6v5oR/DZB8J9yfU38SdOLSizn18Q1I9G9oJnkfwGegF8H4YXMgS
	oZPJycs2ia1Y2AwfJWZoCkSbb68JIl1Fslr/D1B2M75eFwp6Xn0QUxc3YL2ZhZPkkD9GVo=
X-Received: by 2002:a17:90b:1c0e:b0:340:8d99:49d4 with SMTP id
 98e67ed59e1d1-354299f24a8mr4236387a91.1.1769737957855; Thu, 29 Jan 2026
 17:52:37 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com> <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 09:52:26 +0800
X-Gm-Features: AZwV_QiF2cDrLfRKNnjCIo-qh5cZKFulc8s1nwm3YFRDiF2SntZx7QwlcKkdk5I
Message-ID: <CAA+D8AM2d8m2eZnenH7gqOEUO1dLifFSNgizRRXwOiLX2vVdTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16412-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 63A2CB6486
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 1:09=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:53PM +0800, Shengjiu Wang wrote:
> > As the dma device may support dma-coherent property on the i.MX952,
> > allocate memory from dma device to make asrc driver to be compatible wi=
th
> > such a case.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.=
c
> > index 7dacc06b2f02..b8fe242d53db 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > @@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component=
 *component,
> >  static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
> >                               struct snd_soc_pcm_runtime *rtd)
> >  {
> > -     struct snd_card *card =3D rtd->card->snd_card;
> > +     struct device *dev =3D component->dev;
> > +     struct fsl_asrc *asrc =3D dev_get_drvdata(dev);
> > +     struct fsl_asrc_pair *pair;
> >       struct snd_pcm *pcm =3D rtd->pcm;
> > +     struct dma_chan *chan;
> >       int ret;
> >
> > -     ret =3D dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32))=
;
> > -     if (ret) {
> > -             dev_err(card->dev, "failed to set DMA mask\n");
> > -             return ret;
> > +     pair =3D kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL=
);
>
> prefer use size_add(sizeof(*pair), asrc->pair_priv_size), which did
> overflow check.

Ok, will update it.

>
> > +     if (!pair)
> > +             return -ENOMEM;
> > +
> > +     pair->asrc =3D asrc;
> > +     pair->private =3D (void *)pair + sizeof(struct fsl_asrc_pair);
> > +
> > +     /* Request a dummy pair, which will be released later.
> > +      * Request pair function needs channel num as input, for this
> > +      * dummy pair, we just request "1" channel temporarily.
> > +      */
> > +     ret =3D asrc->request_pair(1, pair);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to request asrc pair\n");
> > +             goto req_pair_err;
> >       }
> >
> > -     return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> > -                                         card->dev, FSL_ASRC_DMABUF_SI=
ZE);
> > +     /* Request a dummy dma channel, which will be released later. */
> > +     chan =3D asrc->get_dma_channel(pair, IN);
>
> Is it possible get real dma chan from fsl_asrc?

This is real dma chan, may be I should remove "dummy".

>
> > +     if (!chan) {
> > +             dev_err(dev, "failed to get dma channel\n");
> > +             ret =3D -EINVAL;
> > +             goto dma_chan_err;
> > +     }
> > +
> > +     ret =3D snd_pcm_set_fixed_buffer_all(pcm,
> > +                                        SNDRV_DMA_TYPE_DEV,
> > +                                        chan->device->dev,
> > +                                        FSL_ASRC_DMABUF_SIZE);
>
> Here you assume chan->device->dev never change when it did DMA transfer.

Yes, this refers to the generic code in ALSA.

best regards
Shengjiu Wang

>
> Frank
> > +
> > +     dma_release_channel(chan);
> > +
> > +dma_chan_err:
> > +     asrc->release_pair(pair);
> > +
> > +req_pair_err:
> > +     kfree(pair);
> > +
> > +     return ret;
> >  }
> >
> >  struct snd_soc_component_driver fsl_asrc_component =3D {
> > --
> > 2.34.1
> >

