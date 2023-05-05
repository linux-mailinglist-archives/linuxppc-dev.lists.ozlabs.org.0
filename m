Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB25C6F86EA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 18:39:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCby041NWz3fHh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 02:39:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m8VqoR7X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m8VqoR7X;
	dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCbwN22Ckz3fFD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 02:38:28 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-769036b48b0so147366239f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683304704; x=1685896704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPJ3eJX3Wd0Hq9EHdr00dwY2jAtHzFmYEuKOc8G/h4A=;
        b=m8VqoR7Xhst2NQkNpb9oCGD3xK1RHyPSo8l4yL8rBppQCklEIgppNHBgBRfYgqSvF9
         NFH0BubfU9iR25tFs2VCstf3B3EtzxBOFABdQDQe+1/YnVyY/B4v2lL8+DZN4Qp2NMeE
         tXWpQ1JYH26pcOtOJyPEkCRR8xkseZspQkQHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683304704; x=1685896704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPJ3eJX3Wd0Hq9EHdr00dwY2jAtHzFmYEuKOc8G/h4A=;
        b=F3VvSmgu7Hs4SEz3xWTe6kOTMPpjtdTKzAGbyztovCoYnTY1m+1HweKX3VJPtfvV/V
         JeSdxSlNh7/DDVJUiFAzHYQjtf6fLNzhLVrgGViStSXzylDavXW0/IXtPLdbrj6n3zIS
         fEJiQ2k/MU1IwG8SJ4U+TC8tDu9cUvVyN4TlDOhpeB7hcncSlUG1C0ezuOHxs0KTqP78
         HZEKRZi7xZ/e4BnStSKZIU6lzN660XXHSG7Ydh6V0hDhvQpBbbY3cLiLXiYSSbfyzU8U
         HCQCAcKBjpVjbx/PyrLLffBeqKG6BPk6HrYLM5KfSdfn+w0femXmjInciNZghIpwxA2l
         Qdzg==
X-Gm-Message-State: AC+VfDyt3kYL1dCDukhG1b3nhhsfo/VkYaOddrkof5T5fEH/abhc2j83
	ybzaHgGF2jL69iT+ZahUgWbQbBXsCX2pTvy0Qqo=
X-Google-Smtp-Source: ACHHUZ6rBRbaejEuTh5nB/eCuwK2O1hhuSnrOhc8zyncnnb52DAMr22e0bVcxKyJH8tcuPXShOIDhg==
X-Received: by 2002:a05:6602:54:b0:753:568:358e with SMTP id z20-20020a056602005400b007530568358emr1216032ioz.20.1683304704701;
        Fri, 05 May 2023 09:38:24 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id v14-20020a02b08e000000b0041633985a45sm43023jah.172.2023.05.05.09.38.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 09:38:24 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-330ec047d3bso798925ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:38:24 -0700 (PDT)
X-Received: by 2002:ac8:5716:0:b0:3ef:330c:8f9e with SMTP id
 22-20020ac85716000000b003ef330c8f9emr343597qtw.10.1683304683433; Fri, 05 May
 2023 09:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.7.Id4133d3183e798122dc3b6205e7852601f289071@changeid> <CSE09YL4X0XY.1GAQWAFOOEK42@wheely>
In-Reply-To: <CSE09YL4X0XY.1GAQWAFOOEK42@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:37:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vom15dOxnp=x5RFsk7ZCXGVwUjjrA4z1js-cCB=PDLFg@mail.gmail.com>
Message-ID: <CAD=FV=Vom15dOxnp=x5RFsk7ZCXGVwUjjrA4z1js-cCB=PDLFg@mail.gmail.com>
Subject: Re: [PATCH v4 07/17] watchdog/hardlockup: Move perf hardlockup
 checking/panic to common watchdog.c
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

On Thu, May 4, 2023 at 7:58=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
>
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > The perf hardlockup detector works by looking at interrupt counts and
> > seeing if they change from run to run. The interrupt counts are
> > managed by the common watchdog code via its watchdog_timer_fn().
> >
> > Currently the API between the perf detector and the common code is a
> > function: is_hardlockup(). When the hard lockup detector sees that
> > function return true then it handles printing out debug info and
> > inducing a panic if necessary.
> >
> > Let's change the API a little bit in preparation for the buddy
> > hardlockup detector. The buddy hardlockup detector wants to print
>
> I think the name change is a gratuitous. Especially since it's now
> static.
>
> watchdog_hardlockup_ is a pretty long prefix too, hardlockup_
> should be enough?
>
> Seems okay otherwise though.

I went back and forth on names far too much when constructing this
patch series. Mostly I was trying to balance what looked good to me
and what Petr suggested [1]. I'm not super picky about the names and
I'm happy to change them all to a "hardlockup_" prefix. I'd love to
hear Petr's opinion.

[1] https://lore.kernel.org/r/ZFErmshcrcikrSU1@alley
