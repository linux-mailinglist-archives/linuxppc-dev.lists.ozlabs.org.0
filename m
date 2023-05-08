Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC486F9D6F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 03:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF3lW4scRz3cKn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 11:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=L14pxpyy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=L14pxpyy;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF3kh64jWz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 11:35:06 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-24e2bbec3d5so2783209a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 May 2023 18:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683509705; x=1686101705;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HU/mjP7Ap3TZEbMspJ2h6V5QMnaNP2Fmf0Z6DZ7aqHE=;
        b=L14pxpyy1Yc8+HiewNaTQb+1joh8hYSOP3/eSCWmsTMJDnd6785STORT8kwjkGo2Se
         0i8+WagpXa8hJmR6t/LT7/sRKpmf+/KhkH0cbQcr2O6uaSzqM3ZscCvvnujixJA1Ohtz
         +TDocKRxq9Z7oFDz3JTmqk+qGJoW7sLBtQtnhjtT1o4Jbh/kSUAEi1DayHu/qBKsz9g0
         OpLBg/55IJVmGITHmhJsf02wK5FPOZWzon9TAgZuxFxmSXGX2tWCWkv+4B/RWRpA1i4X
         sWQkpWNXRRqS1ceEPdkUmdpxnwjVOPZRPR/xEDB1D4aX3s85+ine5OJy93J2i3tU985P
         Pejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683509705; x=1686101705;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HU/mjP7Ap3TZEbMspJ2h6V5QMnaNP2Fmf0Z6DZ7aqHE=;
        b=Y7cCuXOtptIz0ghpzi3OxB2uPctmzeoOL/vNxZflFeXjkFdM7RYB5nFtTY/pDckP3a
         /ZYtFV+OW0/72vfM+M5japbVdwOmmOfTs0WDQwJ+WCRzasjKLPy13jm0RLUJlGlxUVU1
         gLj/mJRYPqSsKl7/sDPinZevl6tYyZapZ0LCdzDpMpU4hJIYeVPgZ+lzp80AqLkyhqHS
         LpYVI/ZKaXItGIJZ/5RcAAEWKjIdu0GJf6cymHx9ASob4nwzp/J11F+iSJF13dUfu7pD
         V9L5iP01ZdFgNjSs2F1trYnGrWbLNJ9b2cgtPeKD8MsJ8ozDesw88OtY8wVwRDNxb0kb
         grLg==
X-Gm-Message-State: AC+VfDz41+N/BRtffT1sny7lUgkVHJYDOFaynxPG9DhFkrHJLfZmRskU
	0+xIVQantbJEWwZVAPzmR+4=
X-Google-Smtp-Source: ACHHUZ7wpMgBNBiHQoh+RV3/6p2Xa+RAutLvbhq2Sce/KNFSy1fHPppI+Mwi880EABIulXrieqwNrA==
X-Received: by 2002:a17:90b:19ce:b0:24e:1177:f467 with SMTP id nm14-20020a17090b19ce00b0024e1177f467mr9325645pjb.12.1683509704923;
        Sun, 07 May 2023 18:35:04 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id n14-20020a170902968e00b001a4edbabad3sm5814967plp.230.2023.05.07.18.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 18:35:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 May 2023 11:34:49 +1000
Message-Id: <CSGIDMMFXIVH.3SFPYD19Y5WQX@wheely>
To: "Doug Anderson" <dianders@chromium.org>
Subject: Re: [PATCH v4 05/17] watchdog/hardlockup: Rename
 touch_nmi_watchdog() to touch_hardlockup_watchdog()
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
 <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
 <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, Ian
 Rogers <irogers@google.com>, Randy
 Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan
 Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat May 6, 2023 at 2:37 AM AEST, Doug Anderson wrote:
> Hi,
>
> On Thu, May 4, 2023 at 7:51=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com=
> wrote:
> >
> > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > > In preparation for the buddy hardlockup detector, rename
> > > touch_nmi_watchdog() to touch_hardlockup_watchdog() to make it clear
> > > that it will touch whatever hardlockup detector is configured. We'll
> > > add a #define for the old name (touch_nmi_watchdog) so that we don't
> > > have to touch every piece of code referring to the old name.
> >
> > Is this really helpful? Now it's got two names Could just leave it.
> > If you insist then it'd be better just to rename everything in one
> > go at the end of a merge window IMO. Conflicts would be trivial.
>
> I'm not picky here. I changed the name since Petr requested names to
> be changed for any code I was touching [1] and so I threw this out as
> a proposal. I agree that having two names can be confusing, but in
> this case it didn't feel too terrible to me.
>
> I'd love to hear Petr's opinion on this name change. I'm happy with:
>
> a) This patch as it is.
>
> b) Dropping this patch (or perhaps just changing it to add comments).
>
> c) Changing this patch to rename all 70 uses of the old name. Assuming
> this will go through Andrew Morton's tree, I'd be interested in
> whether he's OK w/ this.
>
> d) Dropping this patch from this series but putting it on the
> backburner to try to do later (so that the rename can happen at a time
> when it's least disruptive).
>
>
> > > Ideally this change would also rename the arch_touch_nmi_watchdog(),
> > > but that is harder since arch_touch_nmi_watchdog() is exported with
> > > EXPORT_SYMBOL() and thus is ABI. Add a comment next to the call to
> > > hopefully alleviate some of the confusion here.
> >
> > We don't keep ABI fixed upstream.
>
> I'm happy to be corrected, but my understanding was that kernel devs
> made an effort not to mess with things exported via "EXPORT_SYMBOL",
> but things exported via "EXPORT_SYMBOL_GPL" were fair game.

I don't think that's the case. If anything people might be a bit more
inclined to accommodate GPL exports for out of tree modules that use
them.

> I guess maybe my patch calling it "ABI" is a stronger statement than
> that, though. Doing a little more research, nobody wants to say that
> things exported with "EXPORT_SYMBOL" are ABI, they just want to say
> that we make an effort to have them be more stable.

We wouldn't break any symbol for no reason, but in this case there is a
good reason. If the name change is important for clarity then we change
it. And this is about the easiest change for an out of tree module to
deal with, so it should be no big deal for them.

Thanks,
Nick
