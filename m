Return-Path: <linuxppc-dev+bounces-16101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBoeNM6ucGmKZAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 11:47:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37E25578B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 11:47:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx19l0dz4z2yFg;
	Wed, 21 Jan 2026 21:47:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1029" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768992458;
	cv=pass; b=nZz/EKSMQ6T4Demnh8u1IoHX7hcA0e2fKT5EEAlUXPd+mSDR1fbpAaJIo2uGLovisujtpPnq9x10xQYn+MU8qwKFL83arJO5qK+gKOePHF1/TGKUeVwMg3js69XmuvkR0rNRDZ4jLmtAw96aUTmPNJG4/BLbXqqiizhhSJaDBplLmCZjuN9GNggRZbVzoWNbG9tnD3eeZXjFfrfwgKb/Uuw6GAemzAs278AT/cobCjpn4uxhhChtn5EawcwBx7L9wwQGM+R/D1/xJpom7XBRc94rCYGF+K40hPWV4Caowl+6xD0/PKnZO7tnQniJwJhhtpaCf7rQMOVKpDDqk3aSmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768992458; c=relaxed/relaxed;
	bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+aLTuX0uFtZndApY0Ghi3CtxkkI7ixG8u0X6TCjmWYV+iyQ02TxmsGm+V3ANkw2XPbSrSXftYLUjSzcH5n2OCj5pq6AUNcD0Hd7Ax8OBFJr8rgBaND4fMYiXTvhZ9HRTwlysHjLI3eogHSfHq3vcjItMQWTiBpcnEBT9qhw9gNCJKcNnhBoSD8HsM/be8fUbvBIAB6E6e5bh8zOiOhAEQfxCxGqCicNl07vOzDLaFNEq9sRTc/q1nJ71TPpbqbC6Qv9Y1mt73aPkpzF/sGPkeHBz8BTKmFhj5T0n4wlA90lQHGqf0Bn6g4/vKyM6yuXcq7SbnmFhkx8aLVECkGPdQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nAuZU9Ws; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nAuZU9Ws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx19h0x25z2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 21:47:35 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35305538592so403808a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 02:47:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768992452; cv=none;
        d=google.com; s=arc-20240605;
        b=lM4ve5qdm+bzK/kapu3pkX874+YJjvNr0M1cSbmK01rwi79NL3ZscOocg4qDsoYpRL
         iDZ33pgx32VmJ96JGXFsl7h+cYUMSj03y1UdcHiA4PSzv1tI97hDBQ2lrNgXZ9iE5RfJ
         70MxpFNbpu/ZSEO5rWG/d+BGl3bOL8uN2DcESeD1bXpAGBIXZs4HaXOLNwnXbhuRjiCp
         MYO0l5+UUlTqy3wry88VTmKRqeqcoEjRc/dpQKSwbjCnFkDELNnQniYc91V4RVdWRz1N
         dw/AQ/Rf3vfrX8acQDBMenCpQkW6s+9avoS6lS+zd39l/grkXLgQvFixzZ5juFqLG6Fy
         0hWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        fh=2KFU3Pdo2KETrmOOctvS1QYzb2btkmsHbbTRrwbGanE=;
        b=RCrXvdk5SwngYpEjwT6K8IFWfcnJ3EmjGe/8JJp0S8icw3FTeZjXWxeNgd4mPuLpZe
         FOk8gHpuNvLxDZZ+u+mVgkUCg/8bP8VP0xJnHiYPA5ceBq9k80J1MDT4za5wBnnTFYA4
         W9IO8ls5ZgNYz5TA20VbFojUKre29e0tnyp5gFnAKYTLYPIUE2CZFW5uAwY1AcD3I8tP
         Vb1i61/4Y1MgifW3TUMtnWbpEIlnwyY8DNo5VjnguGwTUzS9Bkl+d70nKOPEtHFJ8+5D
         BDV5vTKDStDThPnfXwznS7KmRy1nA9NvCUHTGLm58MBAx6hLXzru3BJoZHAiCh7v7KcS
         GayQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768992452; x=1769597252; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        b=nAuZU9WsqIcG5VXr54IC/hCkKfvfusbdAzKGEYBG3oC21DSEDOeE37HmJz4yRv/otd
         hDDBtded3daUCuXtb3d9r8Ew6Dtucxt4FoI5dRSxdD0xn4p793ZelRh+Jh49cDDBGQSA
         4lSTbgP8XilkdtXUuHvpOqvz6Yf/oqt//+T2ccinFkbxaQe0CbnBpJkjewy03/U95AqT
         cM7NgxvpkI2O0VSVc5SSOb7OSn+51HP+SDOI08pyMEW4v0M9d9rt3dmssR9LcKmJ41+2
         2e8ZURXpsoqRSghTKH+sFxF0W+XnwowlaYWuo0H1WNUb6VrUj5imZ6VT8D0VExEMWIwJ
         bH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768992452; x=1769597252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        b=P11MAGA4Q1QT5LZh90E0hFaRjPzShOP0xTdgrlEhSzmyoOn5N+BSA+Fdck8eGxq7ZW
         VW2FnoZ4iCev4U+u5Nh+W1C0tN7kk0A4S/qC71kD9qV/rH9Rh5IgsY4u8c2Y/vYyV9WR
         KLj0EgCKd33jXdTHRf4RjrvvtMmLILFV8EOFp0k4bVj8p7zSxkGPlUPKkenxJ2ZpRBfD
         h/di68nmBGdVxMxt8s4jFQ0evjbEdzoaxwLSVQQ/5mpHEdeePb8aQnbE35ZZdyUaXWr1
         aKCyUVprgMYIn2eFy5TkYcLk+qzVrAYwGuuR+B4ZWeugK4OrVM2hzqLtRcKbgaONQeqC
         BynA==
X-Forwarded-Encrypted: i=1; AJvYcCUbqVnWdw79mmEG6oqCbpPrHYOC+qB8G1G+N1Wp8uBFvGGNG/kE2lu9ra9EXqLpWS+2mdDP8t5E8+Fo2Tc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHel3e0eEPJZJOMNL2jeLX3KAiw9gR6Zs33YzmGLdMMOYMrQ3O
	NSXkmbstispcUbVYnQ9c40QyCohqaeLLjUUEZxTQwQ3DQdgOt/TsBrkkt/6AU9hFCZOhbLmBL4N
	SmPex6s5nC2I3Vde0YMPqQr5PiI6W42g=
X-Gm-Gg: AZuq6aKv5HCnlWm8ZvHSo+c2jj+reDtXMWE+ot8Rd7yd2eUNrGc+Jr2eM13QI8f1RbX
	uKBU3kIjxJdwPVU17Gf1mckqGOUR7Zyix+ALXhOchSzGRybnNnxZW46MepwI+Qaqzlfk2irdpYg
	n/sfH8Od3W6DtZGCOYrlitv1p6mCgZXJx6mNfVWyOPr8l2iK+r1BWvXDWNjBoiFIMqfF6tdofXh
	ObkucU0VxMwt1ldjByTirWWWZoZdwlQiyTdOJeK9+YpuvM8tiqluugdLyrJQzJmGUTcrYc=
X-Received: by 2002:a17:90b:3b8d:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3527329ea06mr14234623a91.37.1768992452459; Wed, 21 Jan 2026
 02:47:32 -0800 (PST)
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
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-3-shengjiu.wang@nxp.com> <20260121-careful-beige-iguana-c32bbd@quoll>
In-Reply-To: <20260121-careful-beige-iguana-c32bbd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 21 Jan 2026 18:47:19 +0800
X-Gm-Features: AZwV_QjDpxZv6jt8rBYtLCaZTNVLi3Y8jythwZEftwLkFpk7naOfOY6Hgw_qq24
Message-ID: <CAA+D8ANy6-e3RkhjSKWfqEcxEnsZrEuJvz7Bmp5q6ZO4x3RfVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode
 support on i.MX952
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:shengjiu.wang@nxp.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:XiuboLee@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16101-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,pengutronix.de,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D37E25578B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 4:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 11:52:08AM +0800, Shengjiu Wang wrote:
> > The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
> > i.MX952, so add 'fsl,sai-amix-mode' property for this feature, with
> > this property present, then SAI driver will try to config the setting,
>
> I am still not sure this is hardware static property. You say "can be
> bypassed", so I imagine same board could have it bypassed or not,
> depending on use case (so mixers).

Yes, depending on the use case.
1.  When bypassed,   the SAI output goes to codec directly.
      like: SAI -> Codec

2.  AUDMIX mode:  the SAI output goes to AUDMIX.
      like: SAI -> AUDMIX-> Codec

Will add above info in the commit message.

>
> > fsl,sai-amix-mode =3D <0> is bypass mode, fsl,sai-amix-mode =3D <1> is
> > the AUDMIX mode.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Doc=
umentation/devicetree/bindings/sound/fsl,sai.yaml
> > index d838ee0b61cb..7808c324eebc 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > @@ -133,6 +133,13 @@ properties:
> >          - description: dataline mask for 'rx'
> >          - description: dataline mask for 'tx'
> >
> > +  fsl,sai-amix-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Anyway, string is more readable.

Ok,  will use string
>
> > +    description:
> > +      The audmix module is bypassed from hardware or not.
> > +      Bypass AUDMIX(0), AUDMIX mode(1)
>
> Drop last sentence and use enum [ bypass, mode-1-whatever-this-means ]
>
> > +    enum: [0, 1]
>
> What is the default? What is the meaning of lack of this property?
>

  fsl,sai-amix-mode:
    $ref: /schemas/types.yaml#/definitions/string
    description:
      The audmix module is bypassed from hardware or not.
    enum: [none, bypass, audmix]
    default: none

I'd like to use the above definition.  add 'none' for default.
Which means no audmix connection in hardware. then we don't need to
bypass or not-bypass audmix.


> > +
> >    fsl,sai-mclk-direction-output:
> >      description: SAI will output the SAI MCLK clock.
> >      type: boolean
> > @@ -180,6 +187,15 @@ allOf:
> >        properties:
> >          fsl,sai-synchronous-rx: false
> >
> > +  - if:
> > +      required:
> > +        - fsl,sai-amix-mode
> > +    then:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx952-sai
>
> There is no such compatible.

It is in another patch:
https://www.spinics.net/lists/kernel/msg6004158.html

Best regards
Shengjiu Wang
>
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.34.1
> >

