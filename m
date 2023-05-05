Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57B6F86E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 18:39:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCbx31M1jz3fKl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 02:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZOpEQsos;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZOpEQsos;
	dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCbw86rxHz3bTJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 02:38:16 +1000 (AEST)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-333eb36e453so1082935ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683304692; x=1685896692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yj1n8SZYpHx6GcDEfBZNc+Nz+lwlz9tugCt27cvkK8=;
        b=ZOpEQsosTbUmst8Ienf3nWALr0I43tuU6QG5nC9malggLvjl9COYLJOwf+H0XsKvTn
         l5ggtBESitzNF1+b1OZCsXuHMIB0MST6OOsXxIX0FaXAxgTqaf48l9nLSmwaLV5vDoqG
         GJdteCFXtZG4TrybH3jjPxNFm2oVJtQqUj2Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683304692; x=1685896692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yj1n8SZYpHx6GcDEfBZNc+Nz+lwlz9tugCt27cvkK8=;
        b=g/SQ0NvafqGSHPDPJ0zEvip1f1eDV6N0lgnpTH2Gwpa6dQBCuJgqxa8lSu0aJ38Hjt
         9QqJzJvVh7sJck05coH7rInWQiZmzKGkR+bRKqAwxS0vUjblEO3wx8JsFLjKHOrLlrO2
         vD+go1y70tRzRKOygUcOvlo7hEnQwpvhyLR1YlVfu9C6k1ynCk5OfB8gE0EG54Cc+aCr
         OkZN4SI9uIvCm25Bn4k6aNZPbTXlRJeQiw+I0B5cj/72B/BvYV/fmMiKUNYb/jxnssu/
         EPjueryNq3suWeSnDk7N4UuAetJqpQuqYBPoqu/upVEJkfslBPFKvjYFyPIfHLKm3UOv
         fY0g==
X-Gm-Message-State: AC+VfDx7ae1njcJ85QNkTrohPvNGkKm3yUK1MVcQ44qqaz2nuGInrPGZ
	UDXVvcywzS6eNsOjEF/9bt29Mv/gHFnXs1xvPmI=
X-Google-Smtp-Source: ACHHUZ7w8yWC7yqpTX4QQzd/MQmXoB6vaVJE4jN4mi6OxyPRPbsp71wbFyhbdmQDsfrbtuaTzyw5fg==
X-Received: by 2002:a05:6e02:54b:b0:322:f878:abcc with SMTP id i11-20020a056e02054b00b00322f878abccmr1242754ils.24.1683304691953;
        Fri, 05 May 2023 09:38:11 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id o9-20020a92dac9000000b0031595ea003asm539378ilq.85.2023.05.05.09.38.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 09:38:11 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-330ec047d3bso798875ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:38:09 -0700 (PDT)
X-Received: by 2002:a05:622a:206:b0:3db:1c01:9d95 with SMTP id
 b6-20020a05622a020600b003db1c019d95mr335755qtx.4.1683304668543; Fri, 05 May
 2023 09:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid> <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
In-Reply-To: <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:37:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
Message-ID: <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
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

On Thu, May 4, 2023 at 7:51=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
>
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > In preparation for the buddy hardlockup detector, rename
> > touch_nmi_watchdog() to touch_hardlockup_watchdog() to make it clear
> > that it will touch whatever hardlockup detector is configured. We'll
> > add a #define for the old name (touch_nmi_watchdog) so that we don't
> > have to touch every piece of code referring to the old name.
>
> Is this really helpful? Now it's got two names Could just leave it.
> If you insist then it'd be better just to rename everything in one
> go at the end of a merge window IMO. Conflicts would be trivial.

I'm not picky here. I changed the name since Petr requested names to
be changed for any code I was touching [1] and so I threw this out as
a proposal. I agree that having two names can be confusing, but in
this case it didn't feel too terrible to me.

I'd love to hear Petr's opinion on this name change. I'm happy with:

a) This patch as it is.

b) Dropping this patch (or perhaps just changing it to add comments).

c) Changing this patch to rename all 70 uses of the old name. Assuming
this will go through Andrew Morton's tree, I'd be interested in
whether he's OK w/ this.

d) Dropping this patch from this series but putting it on the
backburner to try to do later (so that the rename can happen at a time
when it's least disruptive).


> > Ideally this change would also rename the arch_touch_nmi_watchdog(),
> > but that is harder since arch_touch_nmi_watchdog() is exported with
> > EXPORT_SYMBOL() and thus is ABI. Add a comment next to the call to
> > hopefully alleviate some of the confusion here.
>
> We don't keep ABI fixed upstream.

I'm happy to be corrected, but my understanding was that kernel devs
made an effort not to mess with things exported via "EXPORT_SYMBOL",
but things exported via "EXPORT_SYMBOL_GPL" were fair game.

I guess maybe my patch calling it "ABI" is a stronger statement than
that, though. Doing a little more research, nobody wants to say that
things exported with "EXPORT_SYMBOL" are ABI, they just want to say
that we make an effort to have them be more stable.

So certainly I should adjust my patch series not to call it ABI, but
I'm still on the fence about whether I should rename this or not. I'd
love to hear other opinions. This rename actually would be a lot
easier than the touch_nmi_watchdog() one since the code referencing
the name "arch_touch_nmi_watchdog" isn't spread so broadly through the
kernel.

[1] https://lore.kernel.org/r/ZFErmshcrcikrSU1@alley

-Doug
