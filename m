Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E837C71B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 17:40:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5v3L1nXXz3vYZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 02:40:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5v2n49M1z3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 02:39:44 +1100 (AEDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59f6492b415so9433567b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 08:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697125182; x=1697729982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4kyj9ZjW+gYqmJqenBaJFDkWv6wTV1m+k4AYZcQP5U=;
        b=lS0iMnjTigUl8Y5oKca380ylkSYKz3hi1xHPZpTnWzYE1+Ov+SeRhbJ+S7NLgI74TV
         ace0XMHN2WeKKnP7chv2U/fLfjRchSUoRK6grb5xY3fwSd3wfxa6fHeLeGnBHidjTtIS
         CRfm3YS47IBRqXstRrHlu4RoUYOuQwEqHdUd3xwk2yBO7wTIWltJTRe761Od6rMT4AjU
         puxm3Cd3r5ao8EjljwY9uT4+zlgmKrct3Wt3Zvg7cW7jReVb+FwOeiAHDrVzTcimOwSR
         /mvdTtbw6bTpmfIeljPP4gXUSFTqV/V/Sk4GIumrqLVeOLv2B1abPb+0Cnov844UZ2f/
         6E4A==
X-Gm-Message-State: AOJu0YwfNDqV0NHShMOUaui9JtKXKTTOhC9JSESDQatjI3cYRVy7udMH
	w+Oh+Z0hXzdX6OQTbpnQ1V8nlglT/XrR7Q==
X-Google-Smtp-Source: AGHT+IHR476NvA1NUBKdPmz/AXuRtiO5ZqTp/03zj2eGOUrv8pFAs3M53bkXfcTaTVsC9/HBznJfhA==
X-Received: by 2002:a05:690c:ed4:b0:5a7:f61f:7000 with SMTP id cs20-20020a05690c0ed400b005a7f61f7000mr2960754ywb.1.1697125182451;
        Thu, 12 Oct 2023 08:39:42 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id o83-20020a817356000000b0059f766f9750sm32465ywc.124.2023.10.12.08.39.40
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 08:39:41 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a4c073cc06so19270027b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 08:39:40 -0700 (PDT)
X-Received: by 2002:a81:49d7:0:b0:59b:5255:4882 with SMTP id
 w206-20020a8149d7000000b0059b52554882mr12310427ywa.20.1697125180367; Thu, 12
 Oct 2023 08:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231010155444.858483-1-arnd@kernel.org> <2023101051-unmasked-cleaver-79b3@gregkh>
 <87y1g94szz.fsf@kernel.org> <2023101139-pyromania-game-2237@gregkh>
 <87r0m1fwg9.fsf@kernel.org> <20231011080955.1beeb010@kernel.org>
 <87sf6g2hc8.fsf@kernel.org> <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
 <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
In-Reply-To: <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 17:39:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
Message-ID: <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
To: Johannes Berg <johannes@sipsolutions.net>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Johannes,

On Thu, Oct 12, 2023 at 5:28=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
> On Thu, 2023-10-12 at 16:36 +0200, Arnd Bergmann wrote:
> >
> > ps3-gelic-wireless
>
> Didn't Sony disable Linux on PS3 eventually? Though maybe someone still
> has some devices with old software.

If you didn't update the firmware, you could keep on using Linux.

And people may have found a vulnerability in more recent firmware
versions that allows them to run custom software.
I don't know, it's been +10 years ago I touched a PS3 ;-)

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
