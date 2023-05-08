Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B26FB487
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 17:58:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFQtj1Bkvz3cjM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 01:58:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NN4MDMMw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NN4MDMMw;
	dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFQsp4nNwz3blV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 01:57:34 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-763c3429aa6so379577439f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683561449; x=1686153449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5S/FC+4loxuZb2hQfcppwnscYEX/EcpE8zM8Zwa0M8=;
        b=NN4MDMMwkVkNRx2jJ2wDOHSqzQaaGeSu/bq+lttMuJ3G8FUu1QoUiBc0+nh8uRftU0
         A/CCvQrWqt5BKGZrXuShTLE5EFdVAH14FWk6TCedHezLuIfalQZ/5+L72rTbOGGKH1sY
         RgwnQ6k7dSu0CCaiV7EzratNYX+Z1v+Js1K0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683561449; x=1686153449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5S/FC+4loxuZb2hQfcppwnscYEX/EcpE8zM8Zwa0M8=;
        b=NjQNClFOTi/CdlaMsKjkdwqXThwHUtfYs5F0Z/bFi9poLCiS1BxK/vTaYLUWt/v1IJ
         Hs/75L+BU11WXkHsgK75yqnjgFBa9PexUAIRHluSqahkzJsYN/4WY2o2zIqa6wU+0ghD
         EbrepfoB2P086NuO027rHM8gnLobawyUGo5wFN3DBV/UiUEapbpUir9dcdbgD4KQvnde
         gVhMyT4JJ3zMoSpkY41aCP0tUr4d6wvv/XIf0JG8f9x2sJpIiNmUycNyvwwTVTCGbHed
         plMkY/Ez+Q7z1Ka2Ftu56XZp9iVrRoBzBH2gr3hA2WBasH3JBXUKv3AYrGTXmA6JFqHU
         h+eg==
X-Gm-Message-State: AC+VfDznOUu20MWbesM/vdpDpbr2jlgKRg+Y8pSASBDGPAgfyMxa2BsA
	+Yejh+fjJCmfyeuDnteMbVNm/tafAgtZWMZqPl8=
X-Google-Smtp-Source: ACHHUZ5x1qp465sV74m0KBhcMuwGmh9T3wmzSbV8kNCC85eHCE3jtX00WaG2LEFn9MkZmntkYHo+CQ==
X-Received: by 2002:a6b:e50c:0:b0:76c:4e7f:eed0 with SMTP id y12-20020a6be50c000000b0076c4e7feed0mr778985ioc.20.1683561449131;
        Mon, 08 May 2023 08:57:29 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d8245000000b0075c1eb2e228sm2344320ioo.15.2023.05.08.08.57.28
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 08:57:28 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-32f4e0f42a7so1160395ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 08:57:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:3bf:e4e0:26a0 with SMTP id
 t19-20020a05622a181300b003bfe4e026a0mr581724qtc.14.1683561427207; Mon, 08 May
 2023 08:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
 <CSE04EI159N2.2TSXHBN2QLFCM@wheely> <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
 <CSGIDMMFXIVH.3SFPYD19Y5WQX@wheely>
In-Reply-To: <CSGIDMMFXIVH.3SFPYD19Y5WQX@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 May 2023 08:56:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7XQog=OSESB8-BLaeSDRg+0cGnK-YoccdLYeFh7_bmA@mail.gmail.com>
Message-ID: <CAD=FV=V7XQog=OSESB8-BLaeSDRg+0cGnK-YoccdLYeFh7_bmA@mail.gmail.com>
Subject: Re: [PATCH v4 05/17] watchdog/hardlockup: Rename touch_nmi_watchdog()
 to touch_hardlockup_watchdog()
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, davem@da
 vemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Sun, May 7, 2023 at 6:35=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
>
> On Sat May 6, 2023 at 2:37 AM AEST, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, May 4, 2023 at 7:51=E2=80=AFPM Nicholas Piggin <npiggin@gmail.c=
om> wrote:
> > >
> > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > > > In preparation for the buddy hardlockup detector, rename
> > > > touch_nmi_watchdog() to touch_hardlockup_watchdog() to make it clea=
r
> > > > that it will touch whatever hardlockup detector is configured. We'l=
l
> > > > add a #define for the old name (touch_nmi_watchdog) so that we don'=
t
> > > > have to touch every piece of code referring to the old name.
> > >
> > > Is this really helpful? Now it's got two names Could just leave it.
> > > If you insist then it'd be better just to rename everything in one
> > > go at the end of a merge window IMO. Conflicts would be trivial.
> >
> > I'm not picky here. I changed the name since Petr requested names to
> > be changed for any code I was touching [1] and so I threw this out as
> > a proposal. I agree that having two names can be confusing, but in
> > this case it didn't feel too terrible to me.
> >
> > I'd love to hear Petr's opinion on this name change. I'm happy with:
> >
> > a) This patch as it is.
> >
> > b) Dropping this patch (or perhaps just changing it to add comments).
> >
> > c) Changing this patch to rename all 70 uses of the old name. Assuming
> > this will go through Andrew Morton's tree, I'd be interested in
> > whether he's OK w/ this.
> >
> > d) Dropping this patch from this series but putting it on the
> > backburner to try to do later (so that the rename can happen at a time
> > when it's least disruptive).
> >
> >
> > > > Ideally this change would also rename the arch_touch_nmi_watchdog()=
,
> > > > but that is harder since arch_touch_nmi_watchdog() is exported with
> > > > EXPORT_SYMBOL() and thus is ABI. Add a comment next to the call to
> > > > hopefully alleviate some of the confusion here.
> > >
> > > We don't keep ABI fixed upstream.
> >
> > I'm happy to be corrected, but my understanding was that kernel devs
> > made an effort not to mess with things exported via "EXPORT_SYMBOL",
> > but things exported via "EXPORT_SYMBOL_GPL" were fair game.
>
> I don't think that's the case. If anything people might be a bit more
> inclined to accommodate GPL exports for out of tree modules that use
> them.
>
> > I guess maybe my patch calling it "ABI" is a stronger statement than
> > that, though. Doing a little more research, nobody wants to say that
> > things exported with "EXPORT_SYMBOL" are ABI, they just want to say
> > that we make an effort to have them be more stable.
>
> We wouldn't break any symbol for no reason, but in this case there is a
> good reason. If the name change is important for clarity then we change
> it. And this is about the easiest change for an out of tree module to
> deal with, so it should be no big deal for them.

OK, fair enough. My current plan is to wait a few more days to see if
anyone else chimes in with opinions. If I don't hear anything, in my
next version I will rename _neither_ touch_nmi_watchdog() nor
arch_touch_nmi_watchdog(). I'll still add comments indicating that
these functions touch the "hardlockup" watchdog but I won't attempt
the rename just to keep the series simpler.

-Doug
