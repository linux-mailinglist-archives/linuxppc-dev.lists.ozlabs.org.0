Return-Path: <linuxppc-dev+bounces-13192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2568FBFFB7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 09:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csdYX1sGlz3bd0;
	Thu, 23 Oct 2025 18:52:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761205968;
	cv=none; b=iDoYRdY6Z5uK1snRuSOTjLVXqtcoVUD9OzmkvU5XlXeCzdYYDkQhnqvShXaxwkM6GZlTi+BdR8VurGY/yQYZfu/ARG3A6Ks9Rn4c+jfzzd306onfTc43wRP/t9GK+ZDvi76ngfdy290jtNA7ukbHKDjZWTg/JMQKhVqfUApwbSKpzs0OH6YhrsKCPz7XZXDalQFdIVZDxhAYIFzKHwKvJAIy/5j/IVi7m3HWUnqpJq0T9k2gpmdzc7T7vActoSHAe5QTAN9nt5RrVZWWppgI1zylphy3pqOi9op4gUAwpf3QWtjfVeIYJaATC+VdI4RGVMVilLcCa31CGfiC0JWz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761205968; c=relaxed/relaxed;
	bh=wDxToBSJlh6pwttSjRukYxP0hoFnewOMMeOaj3DS4H0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEC8FNJQlCw1FF0Nm5Ry5ahv8r3r37fPGhvp2HAh6raoz/B1eo4a2SkRx/TCbgf39Wgpnr3N0vnAGOP08fz1JSuUMaLuVlkAbpbZ38nWytWA+Ur98/9rIWHohGn2WxnGOZD4ce8EGJcaj0df3TSW0WGsRoYxzZ7iVYpRPQAIEc4Zq4LszXrz0zR2YaCpFciqb7DkJQ+sLsWiKhV6e5xsl8Ct/KSgohosVfCuZqwhRwGCGveTTFKpuQxabgtXSExGPn4QxLddjvi5FwB+OFSmOnYtNViXV8FbttAPa8IOA8JohG9nEkzWKEZBwOy08TJmKTZkPF3jGnOgRA1rrwzNqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j6xKfTDY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j6xKfTDY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csdYW196mz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 18:52:46 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b6cf07258e8so349721a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761205964; x=1761810764; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDxToBSJlh6pwttSjRukYxP0hoFnewOMMeOaj3DS4H0=;
        b=j6xKfTDYU3bCISBd9Yoiqi5I7BusgjxPQZ9XkYwwI/wzPCg4X+/vuwMZsq5Y1sh6gj
         5WvD5AQ7H3UGp5SZJyZeOoHQ76ryrq59kdoU7Eb+snvyiLp/v6pdqFASL37czFj9dBsw
         6hiiEEOegxk+C4X0IY4uXkBtF5PneQn2b1tuXbgi+0LyPyHWz3X+8hFmYNjCkMjJC/pv
         qqx9YjCelkqYiT42X1eZ+/lxM0MIhu4hNBaYsNxw6pPtyRgKkHvSnkjMUq/o5hk56As+
         2e2wFse/iVsIHM0/PNNljBdocpxaDVf4fTqX2Zqeors5dkVen+o/LUoRLqO2d1bQZ7N9
         udZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761205964; x=1761810764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDxToBSJlh6pwttSjRukYxP0hoFnewOMMeOaj3DS4H0=;
        b=CVjQxdyU5Vq5MinYQaoeSMJZivITZjvCImif9ibOf6pjiNJYbL3CVF0eOR26CxbupX
         rpn3l/hPrDtd9oe5P5I2G9qnUARhjc1dC3pybe8hogXwDM+TuoXldY2/S+wN8yHRtXT+
         /ZR4bhJzfIRGvRxQzwBVov4X9DBaKjBKSDRlfwih1PvmR+q00m+KDeySAqzrpYg6X5if
         rXaja/7VUGAyQ81Jj0HRvjTp/SsP0zeSAUDRBsntoRAHDNJLGGfC4ljB3avAtFeFTfsp
         zaBOCfUtNFkY9NNKK/eTy8Mo6wyaQRguJ9aeUL1/QY0Bu5CHy6eJBT1q361PyvuXUPRn
         SyiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfEe18AfqzqhQZkiA0zmZGDDSabfhcgcarkbjaJUtdB0RxzbG7KA9VDAsDFzC0Zz6l2nAbRDx098pBff0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyvQjNVhQeJ2Q23lwgCvfM7jjS6PktI7BanNTLMQN9rwY8kU1M7
	AsG4039o4neGFlH1Tk6ppwuUTpAu/9OlkH2bGHDy2Nzj3dNFSQB9UU++tONxdvCxrcbaU6GYw22
	iUR9IN8LRrhQ+8ulUW32fSz/JopZP+q0=
X-Gm-Gg: ASbGncvnEV0E4F6yJZrOQ9UMQ1HyMvLsw8B0VwwW/qYZFJNYdGJNcqcnwowujXEzbcA
	7BW90TlQ6D8QHHpuTyS2VhhTHXY6ILSADM5SNq+J41uzMRX7d915KWzvl/YUEk1052+jAB9qd+S
	phXsz32UHACADccX31bvJCTGc0Bm4mGw4SQIokoANIZtA2I9djds+vD8tsZn5tDU3q6KZQ/tBrH
	l6VxgcCmbDkFLfdLyfmRYlSD62vNEsu3ZMB0HVBa6qqChW/bRRV4v7ARK8rAmxTTG//5B8=
X-Google-Smtp-Source: AGHT+IHZm7YHicY9t1s+9cg0DRHa1Ixx5JoRyuU7gM6pUgzxiSEpAdgekh3BcvYqugXkHXZmy2Soyl8hMWKn/Jc8zpc=
X-Received: by 2002:a17:902:d60d:b0:28e:acf2:a782 with SMTP id
 d9443c01a7336-290cba4edf7mr245675835ad.37.1761205964066; Thu, 23 Oct 2025
 00:52:44 -0700 (PDT)
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
References: <20251023064538.368850-1-shengjiu.wang@nxp.com>
 <20251023064538.368850-3-shengjiu.wang@nxp.com> <CAEnQRZB+rFudpHB7TKFOCumh4Ni9q-421X3jRL2y8UbV74e-xQ@mail.gmail.com>
In-Reply-To: <CAEnQRZB+rFudpHB7TKFOCumh4Ni9q-421X3jRL2y8UbV74e-xQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 23 Oct 2025 15:52:32 +0800
X-Gm-Features: AS18NWBwB2MtjnQIiGgglXV9h8USjZRfSHjjPdz0DOn_3hzcucQZP-krZ_KRb7w
Message-ID: <CAA+D8AP4t+vS_n=VvRR5YYYrp0DGdWvqSN+4U0ZWMaGHmmt9ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_micfil: correct the endian format for DSD
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 3:10=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> oldest - > most significant bit.

'oldest' is from the time perspective, which is aligned with the descriptio=
n in
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm.c#L2050

Best regards
Shengjiu wang

>
> With that,
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>
>
> On Thu, Oct 23, 2025 at 9:48=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > The DSD format supported by micfil is that oldest bit is in bit 31, so
> > the format should be DSD little endian format.
> >
> > Fixes: 21aa330fec31 ("ASoC: fsl_micfil: Add decimation filter bypass mo=
de support")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_micfil.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> > index aabd90a8b3ec..cac26ba0aa4b 100644
> > --- a/sound/soc/fsl/fsl_micfil.c
> > +++ b/sound/soc/fsl/fsl_micfil.c
> > @@ -131,7 +131,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943=
 =3D {
> >         .fifos =3D 8,
> >         .fifo_depth =3D 32,
> >         .dataline =3D  0xf,
> > -       .formats =3D SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32=
_BE,
> > +       .formats =3D SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32=
_LE,
> >         .use_edma =3D true,
> >         .use_verid =3D true,
> >         .volume_sx =3D false,
> > @@ -823,7 +823,7 @@ static int fsl_micfil_hw_params(struct snd_pcm_subs=
tream *substream,
> >                 break;
> >         }
> >
> > -       if (format =3D=3D SNDRV_PCM_FORMAT_DSD_U32_BE) {
> > +       if (format =3D=3D SNDRV_PCM_FORMAT_DSD_U32_LE) {
> >                 micfil->dec_bypass =3D true;
> >                 /*
> >                  * According to equation 29 in RM:
> > --
> > 2.34.1
> >
> >

