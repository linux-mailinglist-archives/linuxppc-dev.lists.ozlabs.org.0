Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FE7F85BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 23:01:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=S8NXtnMp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScTSx1GhYz3vjw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 09:01:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=S8NXtnMp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amarulasolutions.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=dario.binacchi@amarulasolutions.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScFnC4Lb3z3dK8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 00:14:21 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-db37c6a4d48so1782405276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 05:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1700831658; x=1701436458; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZaK+IRCHYZVeuIwCCx8MjbxD5RCfoi/UxbkuHPIU0k=;
        b=S8NXtnMpNpmgmRlWM0uaCwDNkKdbn8Up60A3HlEuzoe1CNkIWnO8A//HnoqKOBOKOX
         nv2r13esdCABcBHvE7m25o7hRFrvGLZYSiFiZ+mb10twHi88N5yxAjp+VTE0C6aJtP1x
         NMAFYwExpE/3L0/AsSFH2lwSXNaulY0erHGd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700831658; x=1701436458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZaK+IRCHYZVeuIwCCx8MjbxD5RCfoi/UxbkuHPIU0k=;
        b=ASaQDdwaRtrtLV995yRj82FevE8XuuMVA5yNBTD12PW4qIlzhfVNAaT+z7BYnR2vit
         CGgLh8xOvVwcjxwBuVKh7x+sXsZxX1+jhS5KdI6w1boCgjTtvZwy+8zmAPMPMXijOh1R
         kg7Q0QNUCmobwzjxewLm+NgB/K8UNtfxiMbJjNVNn93qiaR3AQ7xEl7sO8bFaKaIgs6b
         P2svLDogIYQ20jaf9iwVT6wsR8PXt23UdOE+QPHiUusFKFlzriFF1dEOT0a6NLqZAgtP
         6yUMTCx+KoGsarvy1oQ2JahfHEIHa9LzmywtqM7EwD3WmxgNcs7tddT3b4PoPyrjdc28
         YlyA==
X-Gm-Message-State: AOJu0Yyt6Zm7CWza3QE2cZbhaXg6BrqHnt4T36HRkRTui3yKEEfoyYan
	xX3gGOWG0Sim9c4RCEBwV1kE3HoJj+2qPcC/ZEs50A==
X-Google-Smtp-Source: AGHT+IFB4TAblmvPDwOeBKvW2nDTani0cluwcTTsPtTZG2Z1ImHjDc09Mjf/2Abn7pO8Ej5yfYgO3NeRgrgLTzTIFQs=
X-Received: by 2002:a25:a306:0:b0:d99:d1b8:672f with SMTP id
 d6-20020a25a306000000b00d99d1b8672fmr2117371ybi.33.1700831657808; Fri, 24 Nov
 2023 05:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20231124100241.660374-1-dario.binacchi@amarulasolutions.com> <4ce802db-b6d0-4eec-9ae2-5383a6f01843@csgroup.eu>
In-Reply-To: <4ce802db-b6d0-4eec-9ae2-5383a6f01843@csgroup.eu>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 24 Nov 2023 14:14:06 +0100
Message-ID: <CABGWkvrvaanicdZi2zaSrWHCrcfFt6Zf2RK6X1oRX=kA28ZfBQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/85xx: Fix typo in code comment
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 25 Nov 2023 08:57:59 +1100
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
Cc: Rob Herring <robh@kernel.org>, Zhicheng Fan <b32736@freescale.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kumar Gala <galak@kernel.crashing.org>, Scott Wood <oss@buserror.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Timur Tabi <timur@freescale.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 24, 2023 at 2:08=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 24/11/2023 =C3=A0 11:02, Dario Binacchi a =C3=A9crit :
> > s/singals/signals/
>
> Is that really worth it to spend time on such a change ?
>
> By sending such a patch, you require people to spend time reviewing your
> patch, then maintainer has to spend time handling your patch.
> Furthermore, as you added a Fixes: tag, LTS maintainers will have to
> spend time handling that too.
>
> Do you really think that this typo is worth a patch ?
>
> This kind of tiny error should be fixed through a more significant patch
> adressing this file. But it is not worth a patch on its own.

It's not the first time I've submitted patches of this kind, and no one has
ever complained before. However, if it has become an issue, I won't do
it anymore.

Thanks and regards,
Dario
>
> Christophe
>
>
> >
> > Fixes: 04e358d896a7 ("powerpc/85xx: Add Quicc Engine support for p1025r=
db")
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >   arch/powerpc/platforms/85xx/mpc85xx_rdb.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/p=
latforms/85xx/mpc85xx_rdb.c
> > index ec9f60fbebc7..e0cec670d8db 100644
> > --- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> > +++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> > @@ -76,7 +76,7 @@ static void __init mpc85xx_rdb_setup_arch(void)
> >                       /* P1025 has pins muxed for QE and other function=
s. To
> >                       * enable QE UEC mode, we need to set bit QE0 for =
UCC1
> >                       * in Eth mode, QE0 and QE3 for UCC5 in Eth mode, =
QE9
> > -                     * and QE12 for QE MII management singals in PMUXC=
R
> > +                     * and QE12 for QE MII management signals in PMUXC=
R
> >                       * register.
> >                       */
> >                               setbits32(&guts->pmuxcr, MPC85xx_PMUXCR_Q=
E(0) |



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
