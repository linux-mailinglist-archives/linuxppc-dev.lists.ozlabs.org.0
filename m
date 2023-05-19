Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFBD709E58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:39:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDc21FG3z3g7Y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:39:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QX0Qpo3D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QX0Qpo3D;
	dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDPZ3sfSz3fxY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:30:09 +1000 (AEST)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-434706ea450so1103350137.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684517405; x=1687109405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7bXuAl2er6jMvvw+SQdriEgYnLYrf51RQ1JCNcE4RU=;
        b=QX0Qpo3DVIwhnJ4ZQZxA9eKhM/wPlTIJE6RFPspnX7j5IZ77lKIL1GPCHXzH6AoVsg
         nRgAkxnlEmoHgSdDTIh/XdUj4oksY8F4NbELoncm2Bii7WbZPT8rgZvDhNPd/Z0GCWMi
         oS7VYAymViD1wI+IieQBrBVv4PlXpiydJtzw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684517405; x=1687109405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7bXuAl2er6jMvvw+SQdriEgYnLYrf51RQ1JCNcE4RU=;
        b=YfwUtyONG/h+wRtHwpQoesD7sDFg2iSFYhsPuKZH2NTQ1lABuf0bnXr88h1S25WxpR
         7BB0qMpP8LIMLKY8V3HAiDBzxNQp3sE5Fs0IN9Gs2WsbgqXg+4TFP+nH8x6rU5ZZF+Lv
         UbIVIUkl8hGh0f74/Bx1vGnSiJ46vMI0iuOBpA4mXoSdYiZ5VBOIoi/nVp8oaqL4Lj2s
         2Yh3TyC4CIfpoSd8xS7zhammflDycB3fQ4079bRHPGFBs6wLY6J2ilm77HkDx660dWBQ
         zKomvvcaZImuHnmVO0Q/WhK6jyzqcF7zDdGlgDS+ROjkPEU556wi5+mtHtIugNIby55a
         IsDg==
X-Gm-Message-State: AC+VfDxGYgPv8b5O7nUYrrWaLK6A/hQyJDZvqly3tflQgaqgZKnch6PB
	B6LV6aMvKgYVw31WBnHZ0c2RQgE8gmjQNQbntXk=
X-Google-Smtp-Source: ACHHUZ4oAIyKvuuQ8AdhagDQmqlvCPFImtiSjr0cvfb3QFXZTqsG2gNzL+NtBKaKCw0J7B9xztsfFg==
X-Received: by 2002:a67:f583:0:b0:425:e492:de9e with SMTP id i3-20020a67f583000000b00425e492de9emr19245vso.16.1684517405553;
        Fri, 19 May 2023 10:30:05 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id f2-20020ab01002000000b0073f5b4610e4sm786260uab.39.2023.05.19.10.30.05
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 10:30:05 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-456ea0974bcso793942e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:30:05 -0700 (PDT)
X-Received: by 2002:a05:6602:1548:b0:76c:e93a:e2a with SMTP id
 h8-20020a056602154800b0076ce93a0e2amr7743221iow.8.1684516998834; Fri, 19 May
 2023 10:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CSDZSKA38AEF.FY7J3JXBJX4I@wheely> <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
 <CSGHQJAJHWVS.1UAJOF8P5UXSK@wheely> <CAD=FV=WEp23wDm2=cFO66uSjqw1UfYSczGSrQh32DGiqHnUDkg@mail.gmail.com>
In-Reply-To: <CAD=FV=WEp23wDm2=cFO66uSjqw1UfYSczGSrQh32DGiqHnUDkg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 May 2023 10:23:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X53VnS37YXkGUT7W=1ekS1YgznCbOiBQBSHuZLqpHa_A@mail.gmail.com>
Message-ID: <CAD=FV=X53VnS37YXkGUT7W=1ekS1YgznCbOiBQBSHuZLqpHa_A@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] watchdog/hardlockup: detect hard lockups using
 secondary (buddy) CPUs
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux
 ppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, May 8, 2023 at 8:52=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hmmm, but I don't think you really need "all-to-all" checking to get
> the stacktraces you want, do you? Each CPU can be "watching" exactly
> one other CPU, but then when we actually lock up we could check all of
> them and dump stacks on all the ones that are locked up. I think this
> would be a fairly easy improvement for the buddy system. I'll leave it
> out for now just to keep things simple for the initial landing, but it
> wouldn't be hard to add. Then I think the two SMP systems  (buddy vs.
> all-to-all) would be equivalent in terms of functionality?

FWIW, I take back my "this would be fairly easy" comment. :-P ...or,
at least I'll acknowledge that the easy way has some tradeoffs. It
wouldn't be trivially easy to just snoop on the data of the other
buddies because the watching processors aren't necessarily
synchronized with each other.

That being said, if someone really wanted to report on other locked
CPUs before doing a panic() and was willing to delay the panic, it
probably wouldn't be too hard to put in a mode where the CPU that
detects the first lockup could do some extra work to look for lockups.
Maybe it could send a normal IPI to other CPUs and see if they respond
or maybe it could take over monitoring all CPUs and wait one extra
period.

In any case, I'm not planning on implementing this now, but at least
wanted to document thoughts. ;-)

> With my simplistic solution
> of just allowing the buddy detector to be enabled in parallel with a
> perf-based detector then we wouldn't have this level of coordination,
> but I'll assume that's OK for the initial landing.

I dug into this more as well and I also wanted to note that, at least
for now, I'm not going to include support to turn on both the buddy
and perf lockup detectors in the common core. In order to do this and
not have them stomp on each other then I think we need extra
coordination or two copies of the interrupt count / saved interrupt
count and, at least at this point in time, it doesn't seem worth it
for a halfway solution. From everything I've heard there is a push on
many x86 machines to get off the perf lockup detector anyway to free
up the resources. Someone could look at adding this complexity later.

-Doug
