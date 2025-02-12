Return-Path: <linuxppc-dev+bounces-6112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4566A31D1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 04:51:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt4BD0hQjz3041;
	Wed, 12 Feb 2025 14:51:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739332308;
	cv=none; b=g9xyOdPzpvm/BI4wEXnMyQzdcldkOnQ+jJi8Xlakvjt+tPtPB4qNf38DU7fRSs5kWQLksS/nJY30uj3KKZI/8PKnkRzh1zvdjhvQuJ3DKErb+ng2GVOfwRJVHPCrFeEiRU5wnNmFunFOrjGkPYc3YejD2IYMJSJSSHErcGlyRXJIfWuPpMVdgAF2Qcd521nBwWui1se8EueG2vshEw724mfHZefO9JWgUDJ9DGJrOQhUp+6cCdaSX7P0g5J9AMg8b+SbKEGEjEzmq1tLezXp6Rh33fjRij9dslPM5o0c6+9WXEXnwxNof/au2Y6R8eU74FIG/BJRyhvo0cfOVZdmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739332308; c=relaxed/relaxed;
	bh=lOjNpQnzjVItcjZQzSaRVqafGTbidnsz64LyMqqRnyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0opNOeP/XgWDrVUmrYI+glF941qx1TeHG8/1HZlf2oG7ROj+2vUNVYWYCej+Ba1GUPV+whL0qPRf/RqZ97GYKPGYdrN3KnMI+cqqWCF1Q1PyW/11rlbPLCDxoemLwVNds/vRNLDcOPMapSOd4HVAt1LwMrROkqD8bVVaY6d9lRJSZJAF1mrzaWwSfpXTm1eLVEfRcwpoz/lAJ8tdIc4uiHxdABtAwtptJ07IONRgKNedE1Tb8xJEF/YVwfufqOlg1a6e/M6bJcThoNSPe920dM76e2sVmW+5O9Lr09K8sVKYqOII1RG64+5tLaaxCUa85X2519PWn94iOrppyJZPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VzpckK21; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VzpckK21;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt4BC2321z301Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 14:51:47 +1100 (AEDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d15ce78fecso23793205ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 19:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739332305; x=1739937105; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOjNpQnzjVItcjZQzSaRVqafGTbidnsz64LyMqqRnyg=;
        b=VzpckK21v/2ZPgKENqbbmsNbJ3vRHV51wRDhoz7XmH5+gULNEq1h/UsYy/i82iND3f
         EUHEKIE+lgcwDK4LMUUobmW6QO3g35aByOaK0MvgwWJIW5en6KXg6Jol97uyui+rxSG7
         DlOIgpLpx0qp/mUXNvabLexyuGXiCszm/gUXqtDwJqzzE99uMNyJifQnJohMddseirqd
         6abFA+mJ1vwDOF1X3ncUzbZHF7LnWL/nOD1A7/7RwvNXzpzySTz4M57jss+9QHNib3kE
         3HCIEw2Dw/jOM2VO/8yzxxBnv6fBk7/YybYVpVv71e5nOwDHc06S2dUvfN8gw/5xDe0L
         zqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739332305; x=1739937105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOjNpQnzjVItcjZQzSaRVqafGTbidnsz64LyMqqRnyg=;
        b=sQGQbxYVK7m5X7axijPoF7fkPEUWfjV9cDKF4pQB4Ejnr2k95SyLo5I8jKYiCejhEv
         aeTgV439azPHNh1c2rKvsmMVhkJ1TioS1aaml1TBIZRhXwWr1aJpGOq6IrbyP90U/l+S
         u2IyYf68eI78tW4l5A8awVpe+35ZzxYaGERRg2UdHB4knwdNc8jUOnsDmwjA8L6TTfAM
         3FTyyMDv9+Oc+YijYWrTx+rJWPpbGZaV2umXMb80YBE2i+cHWj0cZacpKW8ZNVX6mzzZ
         hvTIj/8nw8g7vZuNnn3fZFZOZqHfSUdpuGoJxPBOIuA9C4RkfgazBJhVzky3EPFjb4ab
         1AkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzl2dgydz2IETBQbvq7smAIvvdukJThwKEyNNbQCAhUVKX8DglEwAn26PntnvJKnl/CIlQF6/6gyUQ4XI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFuscj/YuFPHcn2Gl4ZroZMwBs//xjWdanwyRBaogQ1I3bTBgR
	F3odjWzPlbGNN+C8sFrZYrplcE3MY/BZAu3vZFbjL6MzcfCYYfUAod3uuoAImwFM+BjmSAIR3+S
	uLxoDjC6/WXPcWpiAvy/mFMftNfc=
X-Gm-Gg: ASbGnctEUP+kC0wqP3L1PTBoD0h3dbGh5cVofa59JNe1rWyQLOITDsWiM4oVU0Fe8nN
	kwrLY+rWksdHbxaRnt4cEiCIyxsBl5w/WARieEQSelggyxPhMOVEaZfnimcwb3ucJgwX7Zh1f
X-Google-Smtp-Source: AGHT+IELmMC+rEqMtc5H2YZuEE1iKouS45lV6N0hJ5Or/LuqIGNtJHv3ZlrPMODm1vA23GJ/GTBsAYKKjidNOlR17CI=
X-Received: by 2002:a05:6e02:180b:b0:3cf:b365:dcf8 with SMTP id
 e9e14a558f8ab-3d17c21ba5emr21495995ab.21.1739332305183; Tue, 11 Feb 2025
 19:51:45 -0800 (PST)
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
MIME-Version: 1.0
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-2-shengjiu.wang@nxp.com> <Z6ttkyfUapRKGMsk@lizhi-Precision-Tower-5810>
In-Reply-To: <Z6ttkyfUapRKGMsk@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Feb 2025 11:51:32 +0800
X-Gm-Features: AWEUYZl3szAb6kdvVRYt667G1aLNreWAtpJFe-4jAXLL0jVOJ3awo1RObh0k1-U
Message-ID: <CAA+D8APFPKGGNHiiRYFgGVM-AL4LrE-q0zy9i0mErjeJU+KbuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: imx-card: Add playback-only and
 capture-only property
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 11, 2025 at 11:32=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 11, 2025 at 11:57:36AM +0800, Shengjiu Wang wrote:
> > Refer to audio graph card, add playback-only and capture-only property
> > for imx-audio-card.yaml for the case that only playback or capture
> > is supported.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yam=
l b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > index f7ad5ea2491e..86571fa930f6 100644
> > --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > @@ -46,6 +46,14 @@ patternProperties:
> >          description: see tdm-slot.txt.
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >
> > +      playback-only:
> > +        description: link is used only for playback
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
> > +      capture-only:
> > +        description: link is used only for capture
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
>
> why not ref to audio-graph-port.yaml?
>
audio-graph-port are based on 'port'. which is not used
in imx-card.  imx-card can't directly refer to audio-graph-port.yaml.

Best regards
Shengjiu Wang

> Frank
>
> >        cpu:
> >          description: Holds subnode which indicates cpu dai.
> >          type: object
> > --
> > 2.34.1
> >

