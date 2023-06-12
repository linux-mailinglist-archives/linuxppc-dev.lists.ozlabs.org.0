Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDF672C6AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 15:56:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QxEEFm1q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QftXL6SQcz30Mc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:56:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QxEEFm1q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QftWQ5YD8z30Ds
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 23:56:00 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso5197478e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686578154; x=1689170154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HGBKm3rUtk6a6owuw8xAw+5Ji2XRPu2JkI1sZuIh9k=;
        b=QxEEFm1q2cIqsjp8nXTTOib71dS1gJ2S91xBPhVpq3QlqSDoMsXQl6a1mjGMf5ebcA
         bKoohmKKLY1i5NK6AHFGGRGM+GIQoDSjvIg43cdihtxikib9+7DBRCT/Md7wTElAVKzY
         Fc3ppTBDO+5DWxDyGX/Wd+g50xh/5am5TcUoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686578154; x=1689170154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HGBKm3rUtk6a6owuw8xAw+5Ji2XRPu2JkI1sZuIh9k=;
        b=GJ8lXKiyblRHPQ2Hg2dlx//9QMyIkivR4kp9JJeNye0f1j4qI7wd/nSe8QfHE8qE0I
         enoXriy9hax6eLas5vVF+hxZTk0FSe6bgGceDsXr3ErCP5uo80VRWvq86XLI5DDYs7K3
         ztveGvLKYuZBQhNTr0aK7+xbSc/whyRfV7XUrv0AKT9iXDCdk7ViTeHMU4ymcmKxYYGS
         BEQNhNh7Rr/rkVDfvMWQQ13st5eGuWZEcGcG+xvkDTrNgCjsMHi6lU4+4DFUcAa7wczv
         fhc/Qk84rP2j3NCY/sPhjRBkvAT5xCZiC3pgsxSKzhM4Kfc9tXVLJZgZrLBayw6MoZ/w
         UtbA==
X-Gm-Message-State: AC+VfDw+DC/QD05q6eyloYwCBDeCF+4jVJ62uGSXq4Lv06vEFf7fq2Lw
	Kflok3Day70mba8SxrWafx3BjUCvert5HTVdg/U=
X-Google-Smtp-Source: ACHHUZ6TKfcf8ccLHBAEJ+OHFPY2mtPyURdljvZy3wvhjCA02oglv0jqZSKRE6LB88j2WfNytjPHWw==
X-Received: by 2002:a19:8c0e:0:b0:4f5:bc19:68dd with SMTP id o14-20020a198c0e000000b004f5bc1968ddmr3646416lfd.53.1686578153822;
        Mon, 12 Jun 2023 06:55:53 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id d15-20020a05640208cf00b005149e90115bsm5085384edz.83.2023.06.12.06.55.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 06:55:49 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-516500163b2so8898a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 06:55:49 -0700 (PDT)
X-Received: by 2002:a50:9fad:0:b0:505:863:d85f with SMTP id
 c42-20020a509fad000000b005050863d85fmr200065edf.4.1686578149114; Mon, 12 Jun
 2023 06:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid> <ZIb0hd8djM+jJviF@FVFF77S0Q05N>
In-Reply-To: <ZIb0hd8djM+jJviF@FVFF77S0Q05N>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Jun 2023 06:55:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyLKygSsArCaSzid47Rz5=ozR6Yh9L6Q3JStpzF9Tn9w@mail.gmail.com>
Message-ID: <CAD=FV=WyLKygSsArCaSzid47Rz5=ozR6Yh9L6Q3JStpzF9Tn9w@mail.gmail.com>
Subject: Re: [PATCH v5 15/18] watchdog/perf: Add a weak function for an arch
 to detect if perf can use NMIs
To: Mark Rutland <mark.rutland@arm.com>
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
Cc: Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com, Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.o
 rg, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark,

On Mon, Jun 12, 2023 at 3:33=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Fri, May 19, 2023 at 10:18:39AM -0700, Douglas Anderson wrote:
> > On arm64, NMI support needs to be detected at runtime. Add a weak
> > function to the perf hardlockup detector so that an architecture can
> > implement it to detect whether NMIs are available.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > While I won't object to this patch landing, I consider it part of the
> > arm64 perf hardlockup effort. I would be OK with the earlier patches
> > in the series landing and then not landing ${SUBJECT} patch nor
> > anything else later.
>
> FWIW, everything prior to this looks fine to me, so I reckon it'd be wort=
h
> splitting the series here and getting the buddy lockup detector in first,=
 to
> avoid a log-jam on all the subsequent NMI bits.

I think the whole series has already landed in Andrew's tree,
including the arm64 "perf" lockup detector bits. I saw all the
notifications from Andrew go through over the weekend that they were
moved from an "unstable" branch to a "stable" one and I see them at:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/log/?h=3Dmm-non=
mm-stable

When I first saw Anderw land the arm64 perf lockup detector bits in
his unstable branch several weeks ago, I sent a private message to the
arm64 maintainers (yourself included) to make sure you were aware of
it and that it hadn't been caught in mail filters. I got the
impression that everything was OK. Is that not the case?


-Doug
