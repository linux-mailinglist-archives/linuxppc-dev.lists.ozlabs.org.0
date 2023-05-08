Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A38956F9D31
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 03:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF3503bB3z3cBL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 11:05:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g6nKyzCd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g6nKyzCd;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF3402MGGz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 11:05:02 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-24eab83867dso3556007a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 May 2023 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683507895; x=1686099895;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+PPFKXX425r8vzKPVM6Zic55f59QA5mguBoW8dBKWo=;
        b=g6nKyzCdl7wTzFzj0LPDCvxv55Fy7TfpGWgO3pV6ij+uOoq81YB2jNTSX5iaFONC1a
         2mmifmqG7gTqnR60RJOMRKTGxfC1MPZOBDnxBxC8EfLhTHJL8AhE1/n2yUOJyPMLC9o/
         uuml0GrB72oOnQcqwCMNQfB2MRnFdMZQT3rB+TP3y0CeS4NjZ5eUYbvjHqlpvDWij0mY
         +Rsmlbec0zcoH6AhBTwgJ1Kv0dXBCznV96/reb0frVyB8K6Y485zWs34lthhXNKMQ7fk
         dmwcTIP128fzDg1lcXBtIwm0yEzMGvicYdNfyIwQCmGboUqYj0oPhBVNRspiaZjXGsoc
         yQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683507895; x=1686099895;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L+PPFKXX425r8vzKPVM6Zic55f59QA5mguBoW8dBKWo=;
        b=eR8MxmKvu5tz27j6vVN1u5X9mXeB7FVoL4HvJVjT9aNgfNtUfy8IIrOW6Tt4ln5ASY
         cHP75fE+gjGaoP1+KUNN3ZXWFXNZJsh7eVWPwS1S9O48BH8QGAe18lFb9ubYOuIQ6FtY
         QzQGhj/lgLl9+Nk0e58M8QoeAMJRoA+/c9qGpJ1TPigl4ovuZNOSCITgLsiwS1LfdX6N
         5v01o3JIIOCC2B1f1UZIBgKEuamAh7lerj2T8DsSG9X16q69tHeONKTxevhTa/IfMW1z
         GLrUSAzjsNtKvM5+7lXrTeG1j5Li2nZH+oPc3L1Z0cXs1GNUKHRgxnk8FOyHfdT+u3Hf
         nkyw==
X-Gm-Message-State: AC+VfDymhcggqysTnt8+eDwJua8Nr4HHOFYy2q8sxtaHnQhFgczhMlHM
	eC9PtBZIcCPuNs5iRYSWy8w=
X-Google-Smtp-Source: ACHHUZ59icTjTc2OdzI15EfiZxFSZ69uNN4QwbtfViigDNmld+b2odQxDB6B0BmyEFVXN9x050Oztw==
X-Received: by 2002:a17:90b:3142:b0:246:f8d7:3083 with SMTP id ip2-20020a17090b314200b00246f8d73083mr8577679pjb.16.1683507895288;
        Sun, 07 May 2023 18:04:55 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id ie14-20020a17090b400e00b0024e1172c1d3sm11713201pjb.32.2023.05.07.18.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 18:04:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 May 2023 11:04:40 +1000
Message-Id: <CSGHQJAJHWVS.1UAJOF8P5UXSK@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Doug Anderson" <dianders@chromium.org>
Subject: Re: [PATCH v4 13/17] watchdog/hardlockup: detect hard lockups using
 secondary (buddy) CPUs
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
 <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
In-Reply-To: <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
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
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>, Stephen Boyd <swboyd@chromium.org>, Pingfan
 Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat May 6, 2023 at 2:35 AM AEST, Doug Anderson wrote:
> Hi,
>
> On Thu, May 4, 2023 at 7:36=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com=
> wrote:
> >
> > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > > From: Colin Cross <ccross@android.com>
> > >
> > > Implement a hardlockup detector that doesn't doesn't need any extra
> > > arch-specific support code to detect lockups. Instead of using
> > > something arch-specific we will use the buddy system, where each CPU
> > > watches out for another one. Specifically, each CPU will use its
> > > softlockup hrtimer to check that the next CPU is processing hrtimer
> > > interrupts by verifying that a counter is increasing.
> >
> > Powerpc's watchdog has an SMP checker, did you see it?
>
> No, I wasn't aware of it. Interesting, it seems to basically enable
> both types of hardlockup detectors together. If that really catches
> more lockups, it seems like we could do the same thing for the buddy
> system.

It doesn't catch more lockups. On powerpc we don't have a reliable
periodic NMI hence the SMP checker. But it is preferable that a CPU
detects its own lockup because NMI IPIs can result in crashes if
they are taken in certain critical sections.

> If people want, I don't think it would be very hard to make
> the buddy system _not_ exclusive of the perf system. Instead of having
> the buddy system implement the "weak" functions I could just call the
> buddy functions in the right places directly and leave the "weak"
> functions for a more traditional hardlockup detector to implement.
> Opinions?
>
> Maybe after all this lands, the powerpc watchdog could move to use the
> common code? As evidenced by this patch series, there's not really a
> reason for the SMP detection to be platform specific.

The powerpc SMP checker could certainly move to common code if
others wanted to use it.

> > It's all to
> > all rather than buddy which makes it more complicated but arguably
> > bit better functionality.
>
> Can you come up with an example crash where the "all to all" would
> work better than the simple buddy system provided by this patch?

CPU2                     CPU3
spin_lock_irqsave(A)     spin_lock_irqsave(B)
spin_lock_irqsave(B)     spin_lock_irqsave(A)

CPU1 will detect the lockup on CPU2, but CPU3's lockup won't be
detected so we don't get the trace that can diagnose the bug.

Another thing I actually found it useful for is you can easily
see if a core (i.e., all threads in the core) or a chip has
died. Maybe more useful when doing presilicon and bring up work
or firmware hacking, but still useful.

Thanks,
Nick

> It
> seems like they would be equivalent, but I could be missing something.
> Specifically they both need at least one non-locked-up CPU to detect a
> problem. If one or more CPUs is locked up then we'll always detect it.
> I suppose maybe you could provide a better error message at lockup
> time saying that several CPUs were locked up and that could be
> helpful. For now, I'd keep the current buddy system the way it is and
> if you want to provide a patch improving things to be "all-to-all" in
> the future that would be interesting to review.

