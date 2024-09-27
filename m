Return-Path: <linuxppc-dev+bounces-1670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5DD98898A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 19:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFcR52Z7Vz3cPH;
	Sat, 28 Sep 2024 03:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727457009;
	cv=none; b=l80jKgaEJakZbGiDAkTasqrP5dG6ecbObEPMl9xe5N/d3ZtEBCqEijHjwdtSs4oPyvgiNG3pKBLPpKHYPOQOeoCvUxPCLTv42BkvC3oIFKBSNAU+jIQ6aL1J7gvVMGB+DDw0O++jK35+Uiyw3Pee7xAPctZmsssf+sZDz35RIv0tqtGCy8wpYxsJ6+z/yLK4oRntWRLsUQbFWKfrfobFSWfj9D0G28NSJKMCqTVjaBgG04M8jkCs6apTGtIj+MWh/M7YcDOslo2PnHEQ29a3dtdueBDTLp0qR87PIeErxSYCcMehZ41Jdc7WULLaspHGCPsVYUDOhMoyFg/mLdjeng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727457009; c=relaxed/relaxed;
	bh=xoY6H2xihm8sOHd6/SknfHzEtRV3+jpw8m+Q4KMLP+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahqdFX93x03dvClOWIYKs2nL40vSakm24lw7GNwq6OuDsnZM9UR/dfxUWR8/xfoitU4Fs8DfPLhXmrXkGj2MEBeoeSTEFTqGwjUrb5s4idrz1RFM1xRW1MzC/MGajeB8lVCA3di19nt0k/nz/UJ3xy9Qdxr8OWzgLeTxwC/9Vnh3S4/1AK1M/daKiv0j94F7UTIDH5G3Jy7aLlb1PUM8h9BumuQ2w0osyAFDQuwIp8VNBrrI3216enFMpqIOvSI523aATd3mZdD8OcRSibd3Q+g3WPY6JFqSjGRvvqroVREEa0AkvhiPwwaDu7BArIs3/Ouzz3fv3SFUgLo3tJ3yFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.180; helo=mail-yb1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.180; helo=mail-yb1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFcR42FD8z3cLL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 03:10:06 +1000 (AEST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e25d11cc9f0so1763022276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 10:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727457002; x=1728061802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoY6H2xihm8sOHd6/SknfHzEtRV3+jpw8m+Q4KMLP+g=;
        b=jTSMjHOwJ/g/ZxWtv70MDOInlbPkL5OcpWJ6f69QyvVWpGhwi4eJetB5bK/mG5V1Fj
         7E7svQJMwdrW5QZZTz+My9nFXGHXXFzvPwO4aVQB5euN0TDgfwCgCC2L7Li6dlYRF/P9
         DmhIEOiMn8c6DCzBmEhOxifC0lNm9rcLD+D3xtmEIDJYoxqYgxDI5ixj0XIWiPUdz3ho
         ouxmHGCeIa2EFVYg16PpVn73HYVjl++WBbTPKzDwr/l63eJWo+lAsNlhnB3j3m1wzvcp
         xZPUzslVOIqwzhJvvUplrMqKeSejMHJy8aPrkP/9cBHasL67NpkLFayDJum+PGZqKZYW
         vbVw==
X-Forwarded-Encrypted: i=1; AJvYcCUkO6D25naOUQGOZr+4xLhVQIQ8ZdzA2+RaZakGBUUBQ+7wkTUcLy+PmzDrBTeB295lN+f42ynQp39eJo0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAHO23d9iCD6TruZSMI0FY/W05lsZXsMGuELpNaXmhnZ3/2MWa
	3EAQajkr4CyRfOYp72h5/xF+LJcwcIjMV5AtzKFQyLD1iIjkTmXj+9y+7QhJ
X-Google-Smtp-Source: AGHT+IFFLEhM1sf/8bgrLoh/dA0blOWBvPz8CmgHR1DJN5rA6tuVcAmgpu5PyKf4fMlRjg9g6srNjQ==
X-Received: by 2002:a05:6902:2191:b0:e25:8b70:78fa with SMTP id 3f1490d57ef6-e260495d221mr3439493276.0.1727457001993;
        Fri, 27 Sep 2024 10:10:01 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e6294af6sm529252276.49.2024.09.27.10.09.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 10:10:00 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6dbb24ee2ebso23637427b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 10:09:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXp1rRe8q69eMuvi85APkLK45z0lm2AXIw+8dhvzHbC7fxm+Z+1xAj5psgpvkHbFGGXue9eyMef91lednk=@lists.ozlabs.org
X-Received: by 2002:a05:690c:112:b0:6e2:985:f4df with SMTP id
 00721157ae682-6e24dc9c710mr22157267b3.44.1727456998718; Fri, 27 Sep 2024
 10:09:58 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <4455919.MSiuQNM8U4@phil>
In-Reply-To: <4455919.MSiuQNM8U4@phil>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 19:09:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVBfp0ZJ5Me93p1fB9-ac00WcAYOb9jkG=D+wm01j+qw@mail.gmail.com>
Message-ID: <CAMuHMdXVBfp0ZJ5Me93p1fB9-ac00WcAYOb9jkG=D+wm01j+qw@mail.gmail.com>
Subject: Re: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
To: Heiko Stuebner <heiko@sntech.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Fri, Sep 27, 2024 at 4:45=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
> Am Freitag, 27. September 2024, 14:42:15 CEST schrieb Geert Uytterhoeven:
> >   - The second patch updates the Audio Graph and Simple Audio Card DT
> >     bindings,
> >   - Patches 3-9 converts various DTS files to use the new properties,
> >   - The last 2 patches convert Freescale sound device nodes to use the
> >     new properties.
> >
> > All patches can be applied independently,
>
> though I guess dts patches should wait till patch 2 gets applied
> somewhere, so that changed dts and changed binding can again find
> together in linux-next?

Yes, if we want to avoid introducing new dtbs_check warnings in linux-next.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

