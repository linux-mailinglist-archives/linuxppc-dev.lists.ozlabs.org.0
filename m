Return-Path: <linuxppc-dev+bounces-4625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12556A006DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 10:26:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPdVZ3lJSz30RS;
	Fri,  3 Jan 2025 20:26:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735896374;
	cv=none; b=jTEGbYazYSyLioqgR8TXm3YsxajG0styLpOqQTtS8Vxz0wlsnZjQtb2bKXRi9mh6CcMRpSWFspmFBQSsC0+EPMae1N9QyiVrO1a95HGIHlgj25r6LuuQJqAAk5nPPATq79J9IzVx1gTngBtbunGQlwd/JvC0xMIy7xBlb9dVRiRt1Vmz4+dUD9XqmUo3FQT17Lsx6H5ZDzZ9mY1bC30aFCmWT9RIAbtWqR4rXRaaf+B4JZo1pOckcsVwr0R/Ple3KPkxC5Vaaqmk/bz/uAHg+EIjacrAXvz7N33q3BeRPgBJNmA2RJpE2N9pXhw8xsej5dl7hoLt4M1ariRt/e4ueg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735896374; c=relaxed/relaxed;
	bh=OjhYyamqLdDEJy3N4MKnSa94M/Zio7ELm/v+tKn61jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NU0F/AITkwliCaP2mKjxYlawoEE0CO8tOgWVm4Ex+8x8wesZRh9RC0CwSCk+UpS5arqrqSzfUPtOImcVqr3+esORhdFbvts7hqh3gpwzD40kd5xMz9JWhTAh86wY74D0Ac5ThSWXgT3YbvJkgY1LaoENlE15B73lnw/ELvIzT9d7d/bhhZ7yUrbQ25Xv4UEyjwwU6HCMKZXYeYLHWUoqskNQ6VR+UsOSlc2dtCiK0dS3CBlK6H0Uz7S7fZVoS6vYmWfnYpet/6sHo2gkgzScWXfvrnASvStoorW41yoNp1gMk//mJ/gaNUJTjAk8nQB4NBg0DveD9XPXol/g7BwBCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.222.43; helo=mail-ua1-f43.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.43; helo=mail-ua1-f43.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPdVY2RtYz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 20:26:12 +1100 (AEDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso2268688241.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 01:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896369; x=1736501169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjhYyamqLdDEJy3N4MKnSa94M/Zio7ELm/v+tKn61jg=;
        b=vA+xi0J0ZwfrMK2AjDfwtuId3TKGW/QCogb3boPnhtVbgEpX0donAyze2Qs1YubusG
         7H5e/KdABWLj/XTG9Ts/hrHEL6t+l4Lt+VPvtBReM7JEJuqFIB0VmOmMJxGVi8qryWJm
         yPd1hyepefA+UriJQodvnjg39UvwF/l/WGSiOYm0aZ+F98SsUmAXU5FoEtt7u5whBShr
         yk443u9rtedYUdcxnUkLszhM+7uObebReCiBBAi7UhD7thsRlJfp2UYGuc1cWvDJVFFr
         DBAjIrSaprjMekt19WIkgV1JSNPOUSN689WhdxoA+q27dI91yz0hoBejQsosgxZovDdI
         a1Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVE68qsl4NIW4E3o5gtrstKKlIvaEJgtrIfP/MPp+BPNSLOm9ybJhMCXLGFrb6g5XmM2Q0tHkfaqCVPeNw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0gKfBW9z76tmnu8yTeZ4IFGFzT80aSEBS4im7eOpefFxGgq+f
	HMwW1wN4ANKCY/NZm6bt1wjTsgXPyuIIE6SuwwIYvxRgJItpypFX4oFS0VNn
X-Gm-Gg: ASbGncvOGhZtb0q8itn0hUFjSAp8DGD6V9CHP2PKV4zBlvlV/k4OQm9Jh1wfBcElrgJ
	sDueF8FMlixiSOJLs2fz9sSKdAMUsLTYwg8Zg0R+5cY2zeTSDZzIJc8FhJH/p0Ni1VK/NZzVFNZ
	X+uVOXbn+Zusxfg8P4ihvJE74hVFdqMYsZAoUjVHv4gOWuI9B3l6cYeKE+WdLs7dham44OW+CHn
	yNaMAYXCVmAc0ptLCqNs5P+PU3mwJ/aZWrmlB/584K5T+vL92k9dwW0Un2niRANy1H9aajsdY+Z
	wsoZx3fypU4lXscEjus=
X-Google-Smtp-Source: AGHT+IFRMjes22vWz8ev+yJ22vzgq1IG80x/9pHG14Nn0awNPcYWHEpSBeWiP+xjaY3VPnYgFxDsNQ==
X-Received: by 2002:a05:6102:442a:b0:4b1:340a:ce63 with SMTP id ada2fe7eead31-4b2cc3740f1mr39188660137.11.1735896369077;
        Fri, 03 Jan 2025 01:26:09 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac4c4dfsm5505892241.14.2025.01.03.01.26.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:26:08 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4affab62589so3166435137.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 01:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9P/OGFF//rUuPfjHtPLukBONz/fKEdSKmDq9VmktwjEp7VCLjF8lMZz5eh9IV/fW834zrzXa/kE8xiQQ=@lists.ozlabs.org
X-Received: by 2002:a05:6102:50a7:b0:4b2:cbe5:fbc5 with SMTP id
 ada2fe7eead31-4b2cc462478mr39231786137.20.1735896368688; Fri, 03 Jan 2025
 01:26:08 -0800 (PST)
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
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com> <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
 <11ae0b7362284d4828021068b05b38a280a9cee5.camel@infradead.org>
In-Reply-To: <11ae0b7362284d4828021068b05b38a280a9cee5.camel@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 10:25:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPSK-6_bMoiJyAsV4nhfW7HytZpOpf7Odg-4YKYNZfEA@mail.gmail.com>
Message-ID: <CAMuHMdXPSK-6_bMoiJyAsV4nhfW7HytZpOpf7Odg-4YKYNZfEA@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: David Woodhouse <dwmw2@infradead.org>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geoff Levand <geoff@infradead.org>, Simon Horman <horms@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Pavel Machek <pavel@ucw.cz>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev, 
	linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi David,

On Fri, Jan 3, 2025 at 10:14=E2=80=AFAM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> On Fri, 2025-01-03 at 09:53 +0100, Geert Uytterhoeven wrote:
> > > The following points are also in the list of reasons:
> > > - This driver has a maximum 54MBit/s as it supports only 802.11 b/g.
> > > - Using this hardware is security wise not state of the art as WPA3 i=
s
> > >     not supported.
> >
> > If you only do VPN over such an insecure link, I guess it's still safe?
>
> Why VPN? If it's public Internet that any you only use secure protocols
> such as https/ssh/etc over it that's just fine too.

Oh sure.

I was also considering it from the side of the wireless access point:
if you have to provide an non-secure access point just for your PS3,
an attacker can not only impact PS3 wireless traffic, but also connect
to the access point.

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

