Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 623EA7F29E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 11:12:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YHLqk0oQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZKtq2LrRz3cjS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 21:12:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YHLqk0oQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZKsx11gbz3cT3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 21:11:47 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso1807055b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 02:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700561504; x=1701166304; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h77UCHBzfS9YsxxGuMxQKATmfaJKyNycbGsrjaUmphU=;
        b=YHLqk0oQtgbLSnY7pIs4uxd8sqkzjazj9mkPwPRfP45cGAAXzq24XsseeBbz0H9Vij
         OCwHlgxFYbUFJziVCyxzN/Psb0csS2GNEm6wWsbpi5zSTPZuST17OUJX3zabG97dFl0t
         /nLVGbdbgrMZ3MooTDHeMS2sZyTontpXhzL9AlRprgFDmeZck9DByqeYPcmbRHvWze/X
         YSSrG9SgmxF2VVinQ9tUZkRAF3l4XmyHsN+VGYdeRnxTPSWq+9wOdEnyTdtTFJMSrA1+
         qFmjk7AhhlNa3JAk+fjYoBRyzBMKcWrd6kQDzyePrxXyfWrcghvtoBhrnjGq4dy702tJ
         2rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700561504; x=1701166304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h77UCHBzfS9YsxxGuMxQKATmfaJKyNycbGsrjaUmphU=;
        b=Q+Epqvw1z+fbSK213kIA3TBNDwqmZ7ATE8mwm1L/bYJZAHPMfoZvApP2hmwJa/nWGv
         Zi5nL5NJaZwmL8M6CIoG5Rz6iG7sW97f4mznmjphDHfzkja0wuDVtUtU8tsmPiB9ah92
         eMJ0jTyPdi3ahRQD+mAq6DW6Kg72T5w3qZHK3UDsUGVqO/SXiX9GBz9NhMJh5rre+ANz
         fo58ViiBVgnnLR3FeZCtURk536Dd8GzHnZmmg+owoVQfeNwN20GdpS5t+JRfCHvM2YL/
         0327SS+iZ2yID8dXcO5YLrr4LRzp3A1ia8QQaYqweuZr4DJWjqManNNYLTLMcR7us92R
         dwlA==
X-Gm-Message-State: AOJu0Yyb6GYMRswzf9KBOkdXu80DLrTl/Y+PlvC5foy3Bv5VGNMuUFBG
	HjgtBabAh+yewztMEX+C1HByg3D8VgiDzliDhzU=
X-Google-Smtp-Source: AGHT+IEp8j+Xt8I0EWdsh1ssJvEqhJY59UJ9RwYFSlAvOSHCZgQnKLiiltgHL/5rsbh4MhNNEDWqB0d6Hu9FlWOpSMc=
X-Received: by 2002:a05:6a21:789d:b0:187:15e2:fdd9 with SMTP id
 bf29-20020a056a21789d00b0018715e2fdd9mr8857392pzc.39.1700561504425; Tue, 21
 Nov 2023 02:11:44 -0800 (PST)
MIME-Version: 1.0
References: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com>
 <1700552255-5364-14-git-send-email-shengjiu.wang@nxp.com> <0026a04d-8a04-4eeb-9f03-c68be6da5ec5@xs4all.nl>
In-Reply-To: <0026a04d-8a04-4eeb-9f03-c68be6da5ec5@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Nov 2023 18:11:33 +0800
Message-ID: <CAA+D8APe+-_Z-vE2rffnF7S6Bss_3bigzb-Z2zHKof-7RARBKg@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] media: imx-asrc: Add memory to memory driver
To: Hans Verkuil <hverkuil@xs4all.nl>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 5:20=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 21/11/2023 08:37, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the v4l2 framework, user can use this function with
> > v4l2 ioctl interface.
> >
> > User send the output and capture buffer to driver and
> > driver store the converted data to the capture buffer.
> >
> > This feature can be shared by ASRC and EASRC drivers
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/media/platform/nxp/Kconfig    |   13 +
> >  drivers/media/platform/nxp/Makefile   |    1 +
> >  drivers/media/platform/nxp/imx-asrc.c | 1264 +++++++++++++++++++++++++
> >  3 files changed, 1278 insertions(+)
> >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> >
>
> <snip>
>
> > +static const struct v4l2_ctrl_config asrc_src_rate_off_control =3D {
> > +     .ops =3D &asrc_m2m_ctrl_ops,
> > +     .id =3D V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET,
> > +     .name =3D "Audio Source Sample Rate Offset",
> > +     .type =3D V4L2_CTRL_TYPE_INTEGER64,
>
> Do you need this to be INTEGER64? If the actual number of bits
> of the fixed point value that the hardware uses fits in 32 bits,
> then you can just use the INTEGER type.
>
> > +     .min =3D 0xFFFFFF0000000000,
> > +     .max =3D 0x7fffffffff,
> > +     .def =3D 0,
> > +     .step =3D 1,
> > +     .flags =3D V4L2_CTRL_FLAG_UPDATE,
> > +     .fraction_bits =3D 32,
>
> Can't you use the actual number of fraction bits that the hardware
> uses? I can't imagine that it is actually 32 bits, it is almost
> certainly less.
>
From the ratio point view, it is 44bits.  maximum 39 fractional bits.

> I do think that we need a helper function to fill in the min/max values.

what's the helper function look like?  Where can I find an example?

best regards
wang shengjiu


>
> Regards,
>
>         Hans
>
> > +};
> > +
> > +static const struct v4l2_ctrl_config asrc_dst_rate_off_control =3D {
> > +     .ops =3D &asrc_m2m_ctrl_ops,
> > +     .id =3D V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET,
> > +     .name =3D "Audio Dest Sample Rate Offset",
> > +     .type =3D V4L2_CTRL_TYPE_INTEGER64,
> > +     .min =3D 0xFFFFFF0000000000,
> > +     .max =3D 0x7fffffffff,
> > +     .def =3D 0,
> > +     .step =3D 1,
> > +     .flags =3D V4L2_CTRL_FLAG_UPDATE,
> > +     .fraction_bits =3D 32,
> > +};
>
