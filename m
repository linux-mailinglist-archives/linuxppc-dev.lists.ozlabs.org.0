Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E4E8C1C6A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 04:31:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vr1T7hQ9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbCYL0ZHJz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:31:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vr1T7hQ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbCXd05S4z3c3s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 12:30:24 +1000 (AEST)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-36c96441a41so6523095ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 19:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715308222; x=1715913022; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21VKHMMaZA0kpkZw9wZiu6Ve2UlBKMEGNlaolOO9V6A=;
        b=Vr1T7hQ9VSKYCOrx8V5/s7rcbRkARln0fcJSuvpxOSlnRIXAXWSxnSgIsun0mX4nvm
         ziunhTjpC8Mn/tq5TohgoQXb7ouCd5+BDdv1Dh2h7SXiOPihQSgtTLRdYD9XoYbAqRaE
         BoT0f/3vn4y0r2IK/BjlpLLc/FmVD4eIN/R92k1K4hjWlhFm13sff9tsFO1Edv13WLQS
         v89KC0yPUDQTdxtEz8++urkhME51aGLSXoaCtkOyYX8wVmunsynI2hW8n81Ib3hSDnh0
         rZpgkjGeTW+Kxltct5ML9btjcA22rqzZmyjNJzrBxRhCXuVgUcT/yNRS2lNfAUJyNnp6
         iAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715308222; x=1715913022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21VKHMMaZA0kpkZw9wZiu6Ve2UlBKMEGNlaolOO9V6A=;
        b=FfKQ8iSbQKjC+1EJt7HOFpjkL5TlLw9c/PJ+cO7g861SPoDgKYWznL5SKEjdozbxoA
         TVXBJ7QUPSpQ620cZcIreDifyO1nUEGC+wPHkpbxV+Dew65SpPdjuhgDCI1405c8MVV6
         39h3+zlZjwlCtaSrOkWMiSuN6RfynDODe7Zmv4Sa1kJ1E1ri/21BOpAmuDwQfTEgwwiJ
         MqVOxsYSthWbaBm1xNFN3zw39cZG6g58OaNbFTghxRMITkwBjT709WztgfbbdJHcQCSX
         uNSnirUSTrcvoFP/0chZ4aAAYfUDKCOyYLnjcGrSBl89CkQU4XBTGQrzq1T7PEihAqhE
         EUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9SkoPp2r/rQSPu90xIL9cpw6VOoW+QjSbKB1TdMIvrMO/1JZDtyEAa0k1xWrSuHp2nVvKPW5gDiIt5gzDqE/bY2x5znyzW1hdC8b8fg==
X-Gm-Message-State: AOJu0Yx6OSmRcQYDqxggsw35qgOi2yyGSemUIuaiO87387dbHLvQKOKR
	tJB7Qzr8/6+E1+MiYwsfsfUhzPaXn3Kr5b4C36ftx9OkEiFCPKXQdwWbuo3pY047FZNrKLzE91H
	hlKk5/7a+nE2dUjT10sEZ/lE2iwU=
X-Google-Smtp-Source: AGHT+IGrr4iwZg6NUnOgkVHX9/Croov3vFT4FOj9bA67E1Jv8+1P0qtMgoPO/Vex1YuXlIlPwX+ZWDLIR3wv6gRTbps=
X-Received: by 2002:a05:6e02:1d83:b0:36c:47df:5922 with SMTP id
 e9e14a558f8ab-36cc14e12bemr19098315ab.29.1715308222256; Thu, 09 May 2024
 19:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-2-git-send-email-shengjiu.wang@nxp.com> <20240509-phonics-wound-58d3435165f0@spud>
In-Reply-To: <20240509-phonics-wound-58d3435165f0@spud>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 10 May 2024 10:30:11 +0800
Message-ID: <CAA+D8AOn=fPmUHthSRZeAYSpA3mCCdQQAT2SmqjAALo8nRPHsQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: fsl,xcvr: Add compatible string
 for i.MX95
To: Conor Dooley <conor@kernel.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2024 at 1:11=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 09, 2024 at 10:57:37AM +0800, Shengjiu Wang wrote:
> > Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.
>
> That's apparent from the diff. Why is it not compatible with existing
> devices?

i.MX8MP:  There is PHY and support eARC, ARC, SPDIF
i.MX93: There is no PHY and support SPDIF only
i.MX95: There is PHY (PHY is different with i.MX8MP),  only support SPDIF.

Will add such info in the commit message.

Best regards
Shengjiu
>
> Cheers,
> Conor.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 0eb0c1ba8710..1c74a32def09 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > @@ -22,6 +22,7 @@ properties:
> >      enum:
> >        - fsl,imx8mp-xcvr
> >        - fsl,imx93-xcvr
> > +      - fsl,imx95-xcvr
> >
> >    reg:
> >      items:
> > --
> > 2.34.1
> >
