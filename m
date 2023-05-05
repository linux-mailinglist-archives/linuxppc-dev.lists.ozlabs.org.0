Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A276F86EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 18:40:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCbyx3bbZz3fPH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 02:40:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kMGWInL9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kMGWInL9;
	dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCbwr6vzzz3cjK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 02:38:52 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-619ca08c166so9430176d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683304729; x=1685896729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx/Z1QGIGo513DGFRHbMqQT6fmsKMlQd8/3rs/cumNc=;
        b=kMGWInL9mq877PQUgVdTlcAsfTo3/vVVk6M2dqVjnzfZq9pPWNLk+bFRQvxEA8fnuw
         Shu6jbkmq2GRdad3Au7t4JniYbulyG9cOWtXN07an2Lvdnnu5EUjXVgmlYMpPW/nOr0D
         vo4AF82D8H6gb2wOvTdDvphNSJHq2KKXqKFQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683304729; x=1685896729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx/Z1QGIGo513DGFRHbMqQT6fmsKMlQd8/3rs/cumNc=;
        b=MXoS6BEQckF03tlWM2O5/PoyMjeh/SsZc6R8YNumh6AxksvcKv11VHSTiqMZqSOibE
         Mkic9a44jvRNhuB3N4p/RbBsWpo9RA9o4ReTPA30lQLaTKQQpqZPu4PC8Ri4TGdmpkut
         wYAgL5+UbZ+G4w9jZsVPUVcvjHprnGrL/QxpySZnrhM2lP5qevGICcUBAo102y2iLlq1
         ONnQEPoJoLJb43vQGZk3H7/GVklZXOoMiHWQcyAWdE57mzYOz5AFXY3C52NcS+Fgm4m3
         NjV0gZ8Ohe/vwSp/ga96Hgk2xEf4js9fWloYBAjUVQP/m57s5sBEQBJgw2LvcNGJTDue
         aa2A==
X-Gm-Message-State: AC+VfDyINHQiqE5AT1TW5sdIIhYa6lynw2VRxRFQ7VFZfxxA3+S6pEwa
	tCt42VPiHN7OSJudvy/kcnI5T50j2DuES+iDaCw=
X-Google-Smtp-Source: ACHHUZ4P5+F18kb0mRhflgltEU68lptW/GrtDWTQegYUkKI6U+fmr3SMvATmLdmc5Jjugec6VSaZgQ==
X-Received: by 2002:a05:6214:485:b0:5ee:2789:160e with SMTP id pt5-20020a056214048500b005ee2789160emr3461101qvb.52.1683304729134;
        Fri, 05 May 2023 09:38:49 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id o16-20020a0ce410000000b005dd8b93459esm714237qvl.54.2023.05.05.09.38.48
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 09:38:48 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3ef31924c64so1113841cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:38:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1898:b0:3ef:31a5:13c with SMTP id
 v24-20020a05622a189800b003ef31a5013cmr206117qtc.3.1683304708084; Fri, 05 May
 2023 09:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.8.I818492c326b632560b09f20d2608455ecf9d3650@changeid> <CSE0CI3TFK72.2I4E5TJIRHDGM@wheely>
In-Reply-To: <CSE0CI3TFK72.2I4E5TJIRHDGM@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:38:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vuad+gxrUirhyx8aFuLbh2M1hMnoY5NUVBxdycd8kFiQ@mail.gmail.com>
Message-ID: <CAD=FV=Vuad+gxrUirhyx8aFuLbh2M1hMnoY5NUVBxdycd8kFiQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/17] watchdog/hardlockup: Style changes to
 watchdog_hardlockup_check() / ..._is_lockedup()
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

On Thu, May 4, 2023 at 8:02=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
>
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > These are tiny style changes:
> > - Add a blank line before a "return".
> > - Renames two globals to use the "watchdog_hld" prefix.
>
> Particularly static ones don't really need the namespace prefixes.

Renames are mostly at Petr's request. If I've misunderstood what he
wants here that I'm happy to remove them.


> Not sure if processed is better than warn.

I can undo this one if you want. It felt like we were doing more than
just warning, but if people think "warn" is a better way to describe
it then that's fine with me.


> allcpu_dumped is better
> than dumped_stacks though because the all-CPUs-dump is a particular
> thing.

OK, I can undo this and leave it as "allcpu_dumped".


[1] https://lore.kernel.org/r/ZFErmshcrcikrSU1@alley
