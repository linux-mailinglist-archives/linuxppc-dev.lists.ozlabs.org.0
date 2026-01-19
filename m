Return-Path: <linuxppc-dev+bounces-15957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0ECD39FD3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 08:31:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvhwC0B9lz30M0;
	Mon, 19 Jan 2026 18:31:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768807882;
	cv=none; b=SnmyPgd/5LbiQPD2JAxMIFxYD/LPP3NTVqCJq3lIXdsa7m4ayklptADzRPA46BC1bkGyWGcDHlaMPZcZESHvyg/wUxFGYloZtwtOiCbaHDk1vois1aLyrUmKQLrobnLIquEXCNXocwBI8RZ1++NV6nyUgQ3gCu7edxC3zYfSitKcLbNcY0WRpOfmkpF9+NHomMAsZu+7PVa3dZjL1RHkLw4G3U2KfVniExFwJDcnD7yxCxx7MbCiMKURe2Rqer4n7dMb+NAn77uo47HlsdAywdn2hirRjHfaKsGl9MnVS2v4ChuM0+9PBbhTq2DoFWZG/cSossd6XppPgzo5oXEzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768807882; c=relaxed/relaxed;
	bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3w4+AE+LgIv29q34pa+qg/vQW5/YFf0qbZKgn9YLu+V/VYQRzQfJ0ClcItTyHeQNbFNvayZ4+Fqe5zRLJJkUfq7X+Fs3Gsl3DdOFNZF+CPfKWy/l+0j43+vVwBYDst9yamq36fHjUtOqtBgIBaU2DQgrdPAOqPZTq22jY2ZN1WcpH/ahInWRshelaTAwkfO/G4Ecz0l2PwOSK9XjrqZgsZv9NndchPwS0O3ei3Xm8GOACcB5O8i7om02I2xXdrxoKvifUh4/Z6AHiM3TNQMDIMGqVRtsp+Ue6QUNitTUOoBkhva46Bo9eCr4/ab1uD5aN9+XFcDawFluHQg/cqdMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ng4VnnuI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ng4VnnuI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvhw93Wlsz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 18:31:21 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso2468234a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jan 2026 23:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768807878; x=1769412678; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
        b=ng4VnnuIXjI8rQIH7uUNDh0iSAKSX+/iTGLIWPYQGuSCgBMwysaf8zW6sd/FORwosy
         YHO9dPpVY38g/DaXJy+In80q5iPkmmzkpmKHSn1xcPlzf0Q+QbjR6u0Si9nWEu/oPgK8
         DxtQNkoIMbM83Yh3JEYYYTOzVuWdl1ziyEyWla21sC8h4PUHerx86BTh43jw+ufh+KTy
         WWdN5Mo1WZuE28znvtTaK/OFOWaZDzLh9uLRA7nFCbayJbY1T4uWsQaDfe7qY1c99DUD
         ow2wONwrlhL4cWV9gb0z+Jx5PXLOt3OX1dYj2xLsi99E+ghbvPNrKWFZJE29pZg7FgDQ
         nlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768807878; x=1769412678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
        b=UlhwstC8DBNKDcEZllpMIDw24irJod46VLZiFJWFMJjNmpYc70NLABiO9IAuVuxkVz
         nhZQk7zd85zZQjtU8gYApoEmzmNtCB4DcerNLX5/D6ZZK24bH5Brm5BtZEpdedOx8UxE
         AUXo5xB38d9fbor1i9jjhxrhwYBbn3aADzUpU/AQ2MBMLjfopJQqTujBruLR9K9MnZPp
         3UWZExExw2x6jiLmMhnM4pMUPh8x2BCbUQ5tsiz2Od8g7MJoHxFcZP7SSRS9zfjjyqvD
         ofv+oUIGVhC66MywLjINDkwt4Fw/iyBTDm1IWlOgNeCnFc/M87nkQRUAEozebVIxXL/P
         Tj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8RgVn6a3GSfaKg3Wv7flTPsNkW2appiDUvSqg2IXTzE2LktWKPmExxzmpYGZRXiA0zl9imeV9qAwauX0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0KFhwmGCxyfwv0XiVfJ0mgWr+6XqF/5HIB7azZRRmaqYWtY/t
	KGa+FZbpTZnNG8hDRmO7FKj+aG1Sb5RPY8TznYeGqVSorc5rvJX8LpwOJ1qMV4WbuTOx/N/VrBk
	nnyeihlm36PZFCcX6jGkfuGG1DCSzOGo=
X-Gm-Gg: AZuq6aJ/qog7HYO9Uek+8Zbr6py+Y0DxYYzBNaItU4BMgG16C9Bkz92ZfgHDafHWPuz
	qmgueo1CbglqmKbKVxYEt5tKcCtuV13Kx0n6w09nFXtWyjGqHTkffMUa+/DCQSkez/GBjYac0ji
	1E3hPEXAez7lTXl+7nJYFeY1utOAqZ0zg69zpEqrCDwiaA18EjyrilTiRiTy+aozNJNSm0xVjCe
	FWDYSj2AM+5G0kYNbM4Xge+s0FpE8LNtX5rKPR31e6JTgP1WIKMfH8BBevA/LUUVV2XHKw=
X-Received: by 2002:a17:90b:3884:b0:34f:6ddc:d9de with SMTP id
 98e67ed59e1d1-352678fcf6fmr11202077a91.16.1768807878309; Sun, 18 Jan 2026
 23:31:18 -0800 (PST)
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
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com> <20260117-versed-proficient-pigeon-bd0b2a@quoll>
 <CAA+D8ANrcjvOCfRN7gGGW+7YzvVieU7P2uexUpVYTw6MEHAKYQ@mail.gmail.com> <2be56ba8-5659-4d03-a886-ad32a32f6b44@kernel.org>
In-Reply-To: <2be56ba8-5659-4d03-a886-ad32a32f6b44@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jan 2026 15:31:04 +0800
X-Gm-Features: AZwV_Qh5iuoRHWZMiK5VT4SDQMVso2DrWmENEWodorBSh_MSb2zROT8lpDWRAvg
Message-ID: <CAA+D8AMv0TaGwCU8yWWVbVfuYHyPMjMnz0MWNLh86nfsGMZtYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 19, 2026 at 3:07=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/01/2026 07:27, Shengjiu Wang wrote:
> > On Sat, Jan 17, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> >>> The specific feature for AUDMIX on i.MX952 is that it can be bypassed=
,
> >>> so add fsl,amix-bypass property for this feature, besides this there =
is
> >>> no power domain defined on i.MX952, so make power-domains to be
> >>> dedicated to i.MX8QM.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++=
--
> >>>  1 file changed, 33 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml =
b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> index 3ad197b3c82c..50fb08460b4f 100644
> >>> --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> @@ -34,7 +34,9 @@ description: |
> >>>
> >>>  properties:
> >>>    compatible:
> >>> -    const: fsl,imx8qm-audmix
> >>> +    enum:
> >>> +      - fsl,imx8qm-audmix
> >>> +      - fsl,imx952-audmix
> >>>
> >>>    reg:
> >>>      maxItems: 1
> >>> @@ -75,12 +77,41 @@ properties:
> >>>          unevaluatedProperties: false
> >>>          description: Output port to SAI RX
> >>>
> >>> +  fsl,amix-bypass:
> >>> +    type: boolean
> >>> +    description:
> >>> +      The audmix module is bypassed from hardware.
> >>
> >> I don't understand why device AUDMIX would have property saying AUDMIX
> >> (so itself) can by bypassed. If you bypass the device itself, what do
> >> you configure here?
> >
> > The case is that the SAI interface is connected to AUDMIX,  but AUDMIX =
can also
> > be bypassed by hardware configuration.
> >
> > Yes, adding this property in the AUDMIX module looks strange.  Another
> > choice is to
> > add this property in the SAI binding document.  Is this better?
> >
>
> Not sure, but certainly it does not look like a property of AUDMIX.
>
> I assume you acknowledge all other comments.

I will move the property to the SAI binding document, then please
have a review.  As this change, the binding document will be updated, for
the comments to use the example-schema (:false) will be adopted if needed.

Thanks.

Best regards
Shengjiu Wang
>
>
> Best regards,
> Krzysztof

