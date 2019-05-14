Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9601E544
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 00:42:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Xkh5KbrzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:42:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e41; helo=mail-vs1-xe41.google.com;
 envelope-from=slandden@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F/cCTtSd"; 
 dkim-atps=neutral
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453RpW03XGzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 05:00:34 +1000 (AEST)
Received: by mail-vs1-xe41.google.com with SMTP id v9so37207vse.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5PcFX9RJdf4d14yX0kujsmruSvjlCKb7Aifq7y2Nde0=;
 b=F/cCTtSd2c7h3sFhACyQLtuHv3u90j9TLJ2EDu5uGXB2fsjjzNuY85qDPZp/Xco+O6
 K4rA7yPFzIHXbFWyOdcRuoKj84+ZqBag4psbIi5HRzlksii/thkNo3naiYuIOSgKpEDY
 4Ec5WRoE9/VzOGMR3BEwQJ5pk8zNRDPhblVrcE+I5zZkjF7Rb3VZu4lyjYnqXzpJzs8b
 dI/wyfVzvfgZh2XHb6PHasQ4llz6bBtMR3wOYpxwxl9ZF5n0m0LHsYSh5QLwyBQGsB5z
 4H34ehrBRzqvdQHf7csTDrbQohGGEr3suC41b3EetFXoB8sNXOpBvK/i1K3a7QIEVayr
 sz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5PcFX9RJdf4d14yX0kujsmruSvjlCKb7Aifq7y2Nde0=;
 b=bachSlvZ21wMNSNUwJuV/cXlFuDL16KbbIJo/wt/EDcVCOKMpLoDetzqTbYw/AjvvD
 nb3HBNgkDduoZwrqqRr4fKCT8oldt+RHhp1ItkDgp5ZP1CLF7JgsrdCjZzgD9z+7eyXs
 RWox0+sRtcb/0jzcaPdTasUM7thIenXvf2xgImYeQBby96AOzD7DQNjx0udaeeibXpeE
 /udEdz8oBMySMtSg6aH2Z9Dyc7Uqq02R9LeEN0VLTYNO8EPUb45jzGtjQvpWvBQ71oyD
 k0DRNToNIJnfBzCVQOLXFmRpVypa9HWJ28AvJo4aZ1Z4YL/zE2xELmSnwwyP0Kq6KD5d
 s0cg==
X-Gm-Message-State: APjAAAWGz5bR/fhLpCmoYACD/lZpXBDOLVTdlRoKKQ0HzG65jOFTBtc3
 WqnItfp9fpQb+SwCS93P2HpaYrBP7ApON8HA2No=
X-Google-Smtp-Source: APXvYqzO+vxgKrqS4Au19nQZsJsZRNhJ/HVyJVlj2atjPKe0vtOhOMEh0PYsyAtScUBOUlTylkUi0ozG9anGsFB4RE4=
X-Received: by 2002:a67:ef99:: with SMTP id r25mr11616797vsp.101.1557860430618; 
 Tue, 14 May 2019 12:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190513005104.20140-1-shawn@git.icu>
 <20190514124918.22590-1-shawn@git.icu>
 <20190514180607.GD8599@gate.crashing.org>
In-Reply-To: <20190514180607.GD8599@gate.crashing.org>
From: Shawn Landden <slandden@gmail.com>
Date: Tue, 14 May 2019 14:00:19 -0500
Message-ID: <CA+49okpasZrVx3xP64envJ+w4gf8U8f1z98Oj=EuFQbVufYPog@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Allow may_use_simd() to function as feature
 detection
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: multipart/alternative; boundary="00000000000093a65d0588dda5f8"
X-Mailman-Approved-At: Wed, 15 May 2019 08:38:49 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000093a65d0588dda5f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wireguard is not in the kernel (yet) and uses these symbols. (It is
IS_ENABLED so doesn't need it, but I think it is reasonable) I think these
enable/disable symbols should not be marked GPL-only.

El mar., 14 may. 2019 13:06, Segher Boessenkool <segher@kernel.crashing.org=
>
escribi=C3=B3:

> On Tue, May 14, 2019 at 09:49:18AM -0300, Shawn Landden wrote:
> > ARM does this, so we might as well too.
> > I am a bit confused however as CONFIG_ALTIVEC does not select
> > CONFIG_PPC_FPU. Would you ever have altivec without a fpu?
>
> There is no hardware like that, none supported anyway.  It does not make
> very much sense, and it cannot happen with VSX, so no hardware like it
> will ever show up most likely.
>
> It is much simpler to just make a Kconfig dependency (or a select) betwee=
n
> the symbols than to have to add code like this patch.
>


>
> Segher
>

--00000000000093a65d0588dda5f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Wireguard is not in the kernel (yet) and uses these =
symbols. (It is IS_ENABLED so doesn&#39;t need it, but I think it is reason=
able) I think these enable/disable symbols should not be marked GPL-only.<b=
r><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El m=
ar., 14 may. 2019 13:06, Segher Boessenkool &lt;<a href=3D"mailto:segher@ke=
rnel.crashing.org" rel=3D"noreferrer noreferrer" target=3D"_blank">segher@k=
ernel.crashing.org</a>&gt; escribi=C3=B3:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Tue, May 14, 2019 at 09:49:18AM -0300, Shawn Landden wrote:<br>
&gt; ARM does this, so we might as well too.<br>
&gt; I am a bit confused however as CONFIG_ALTIVEC does not select<br>
&gt; CONFIG_PPC_FPU. Would you ever have altivec without a fpu?<br>
<br>
There is no hardware like that, none supported anyway.=C2=A0 It does not ma=
ke<br>
very much sense, and it cannot happen with VSX, so no hardware like it<br>
will ever show up most likely.<br>
<br>
It is much simpler to just make a Kconfig dependency (or a select) between<=
br>
the symbols than to have to add code like this patch.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
<br>
Segher<br>
</blockquote></div></div></div>

--00000000000093a65d0588dda5f8--
