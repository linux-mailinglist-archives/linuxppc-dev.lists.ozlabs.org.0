Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D98CF3663C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 04:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ4V06JWpz30Cm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 12:38:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vbmbaaDK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32;
 helo=mail-yb1-xb32.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vbmbaaDK; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ4Tb0FZgz2xZj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 12:37:38 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id k73so39168987ybf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 19:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gPDuUPNr2r8RT0p2uPgp6ysslhE0fHlSqcFPVymRgMk=;
 b=vbmbaaDKdoFGxMR2AzKF17JnCmOvYz0Z8AN58ukrBNIdNAYFDwZBAUL5Pfs16bk3Jq
 qKWwTNenpd0YYuRsNuadntPCivUb59rvznzrZxULxK4Acg+gc6XE28E/CYiW6KhbQNZo
 ZH/LVzxTFGgwgivI0M/ZW+kph5PLADwnmSaR6lzLqt9pZW8vvYn2n5OCpIhcY+s4CuRa
 MfV3H0jpalgPE26g6WOUK3zPnyD3c3syp2pDNshNPzcjMuwah1KHt4PlgUS4PctseNvM
 FjKEInYmawfFZQjqnibWjRiBLE2qYX/ve7PXmhxShbu5U/PpOsSS+OWCnsocU7KPs6WY
 NBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gPDuUPNr2r8RT0p2uPgp6ysslhE0fHlSqcFPVymRgMk=;
 b=Z7odcimLuz3qJUd0r/qaTcCocnJHn3mHTGORC17R7gsIGF25a+jkTrDuEQbhsTkhFT
 xkztK8E7cMWcJ/Z37f/HEu9Dzcjk22/MWeOnE6C+3Ksu6x9UNe5nMcKoMLSG7p/u01kT
 XFjMbYCdBaIbJbjnxjpLh9lcRth/To3dcl2ENbXstgaCCpXy6t1MiOzzlxlKM+QlRMI4
 wkrcByAIBjXDMLM2qxypqAFoW1K4q5Nlb7+nL9Bp2yUWijYFOqlrCTJGYZ9NbpHwhk9u
 GRieJRYIspQdxDFnNl7gEtRMbRjJUNI8IDVRdRr57NDYAYVSuS3pCI/v/yAdg6RFCwPD
 xPYA==
X-Gm-Message-State: AOAM532x3MWON+32A0vo/xHAj02ZQmamw75VP9fP3nUXyvvoY4Hy2dBp
 x0OcZp4SS2/xDdLWCOwpt/qK9at4W6J8PWO/b4g=
X-Google-Smtp-Source: ABdhPJx3vgTNzpazRcmV3WVgnlhqxFHnmVTdeZCIO4Cp6o8UZeexT4MchvelphfgIbBke1Q0GFkl5W6hAVR9F2IfCwY=
X-Received: by 2002:a05:6902:124a:: with SMTP id
 t10mr15424638ybu.386.1618972655721; 
 Tue, 20 Apr 2021 19:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-9-jniethe5@gmail.com>
 <c511660d-64e3-30fa-9324-8019928545d5@csgroup.eu>
In-Reply-To: <c511660d-64e3-30fa-9324-8019928545d5@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 21 Apr 2021 12:37:24 +1000
Message-ID: <CACzsE9p-ZaroqsShfBeoGHMeC=oS9oBgnyroxnWddHCQRve56w@mail.gmail.com>
Subject: Re: [PATCH v10 08/10] powerpc/configs: Enable STRICT_MODULE_RWX in
 skiroot_defconfig
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: ajd@linux.ibm.com, Joel Stanley <joel@joel.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 4:27 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 30/03/2021 =C3=A0 06:51, Jordan Niethe a =C3=A9crit :
> > From: Russell Currey <ruscur@russell.cc>
> >
> > skiroot_defconfig is the only powerpc defconfig with STRICT_KERNEL_RWX
> > enabled, and if you want memory protection for kernel text you'd want i=
t
> > for modules too, so enable STRICT_MODULE_RWX there.
>
> Maybe we could now selectt ARCH_OPTIONAL_KERNEL_RWX_DEFAULT in arch/power=
pc/Kconfig.
>
> Then this change would not be necessary.
>
> Would be in line with https://github.com/linuxppc/issues/issues/223
Yes, I think that is the way to go.
>
>
> >
> > Acked-by: Joel Stanley <joel@joel.id.au>
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >   arch/powerpc/configs/skiroot_defconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/conf=
igs/skiroot_defconfig
> > index b806a5d3a695..50fe06cb3a31 100644
> > --- a/arch/powerpc/configs/skiroot_defconfig
> > +++ b/arch/powerpc/configs/skiroot_defconfig
> > @@ -50,6 +50,7 @@ CONFIG_CMDLINE=3D"console=3Dtty0 console=3Dhvc0 ipr.f=
ast_reboot=3D1 quiet"
> >   # CONFIG_PPC_MEM_KEYS is not set
> >   CONFIG_JUMP_LABEL=3Dy
> >   CONFIG_STRICT_KERNEL_RWX=3Dy
> > +CONFIG_STRICT_MODULE_RWX=3Dy
> >   CONFIG_MODULES=3Dy
> >   CONFIG_MODULE_UNLOAD=3Dy
> >   CONFIG_MODULE_SIG_FORCE=3Dy
> >
