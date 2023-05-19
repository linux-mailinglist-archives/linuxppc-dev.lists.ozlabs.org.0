Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C4B709E53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:37:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDZ26tbpz3gbJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:37:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oj2TcUJV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oj2TcUJV;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDDj727xz3fPn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:22:29 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso3253751a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516946; x=1687108946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxsHOCJ1OWCqFtkIFidXd/8UskEhLhb6o5wuCVwA9p8=;
        b=Oj2TcUJVkvorK9fReJjLzcW5Nc4OcfweHYNzmMqNfgh1DhA1+dO3nbazod/zwlMpA5
         1eY2w9y6GgnqAX2uCPSkqgroEak8xmx1kKoRRqYQFb/E5BZyCnzgI10SwWyGj0y3Z99U
         Gw7xFbx8sGkkJaCy6jIsJGak0Z9v/e51AOAv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516946; x=1687108946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxsHOCJ1OWCqFtkIFidXd/8UskEhLhb6o5wuCVwA9p8=;
        b=gV4HgBz9wseiyu69Yl90S90m6gV1qiveOJ2jEeLaVRkg4c4seX/sfEnIM6sAa/Ewv+
         fPBDaYB7QaRI5AxQlZPLlpgywn5nk+hcci2W3POcd+qLXMvYEhz80z/g736jzguFgb+f
         c6poH5DOG7KNx96hIT55prLOgOI2uTGk8S8CEfZ1LpvxEt8I5uwQiuByqpKCdEtEM/Za
         xkKd4FPwZ+qi3Y0NkBMRB+PTZIrgPmGm2SUzwy6uESRub3FirQPeTYML8LjS3zfr/0mo
         c437SLRSLeViyW9qgS93rwo+AJzAirsIaZDUtQG8RcScNKhGCskhKwyjSQOEn28542ov
         DacQ==
X-Gm-Message-State: AC+VfDykV+HgeDb/eRkN4y1pN6UEBiDaRO7t70sJW+hhxFbpzC20Uitw
	H3VVGrdNBW6KvaW+wJdmruMlna+q71hmaQxERp4=
X-Google-Smtp-Source: ACHHUZ6+DyYQTfKbQCw9c24gABRLU9tcz4s3mWbrVdor9abAR5u8DK2gm4vwW1rdOb89qseFZfShaw==
X-Received: by 2002:a17:902:82c4:b0:1ac:8db3:d4e3 with SMTP id u4-20020a17090282c400b001ac8db3d4e3mr3362326plz.37.1684516946236;
        Fri, 19 May 2023 10:22:26 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id i21-20020a17090adc1500b00246b7b8b43asm1715504pjv.49.2023.05.19.10.22.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 10:22:25 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ae3f74c98bso7635ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:22:23 -0700 (PDT)
X-Received: by 2002:a92:c266:0:b0:338:1993:1194 with SMTP id
 h6-20020a92c266000000b0033819931194mr230509ild.2.1684516922186; Fri, 19 May
 2023 10:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.9.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid> <ZFz4TVOyEU51b898@alley>
In-Reply-To: <ZFz4TVOyEU51b898@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 May 2023 10:21:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VOdFsdSK5X_8v3YFqDWQhDEYfo5Jkut7=G8TB=+KBKrQ@mail.gmail.com>
Message-ID: <CAD=FV=VOdFsdSK5X_8v3YFqDWQhDEYfo5Jkut7=G8TB=+KBKrQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/17] watchdog/hardlockup: Add a "cpu" param to watchdog_hardlockup_check()
To: Petr Mladek <pmladek@suse.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, May 11, 2023 at 7:14=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Thu 2023-05-04 15:13:41, Douglas Anderson wrote:
> > In preparation for the buddy hardlockup detector where the CPU
> > checking for lockup might not be the currently running CPU, add a
> > "cpu" parameter to watchdog_hardlockup_check().
> >
> > --- a/kernel/watchdog.c
> > +++ b/kernel/watchdog.c
> > @@ -92,14 +92,14 @@ static DEFINE_PER_CPU(unsigned long, hrtimer_interr=
upts_saved);
> >  static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
> >  static unsigned long watchdog_hardlockup_dumped_stacks;
> >
> > -static bool watchdog_hardlockup_is_lockedup(void)
> > +static bool watchdog_hardlockup_is_lockedup(unsigned int cpu)
> >  {
> > -     unsigned long hrint =3D __this_cpu_read(hrtimer_interrupts);
> > +     unsigned long hrint =3D per_cpu(hrtimer_interrupts, cpu);
>
> My radar tells me that this should be
> READ_ONCE(per_cpu(hrtimer_interrupts, cpu)) when the value might
> be modified on another CPU. Otherwise, the compiler is allowed
> to split the read into more instructions.
>
> It will be needed for the buddy detector. And it will require
> also incrementing the value in watchdog_hardlockup_interrupt_count()
> an atomic way.
>
> Note that __this_cpu_inc_return() does not guarantee atomicity
> according to my understanding. In theory, the following should
> work because counter will never be incremented in parallel:
>
> static unsigned long watchdog_hardlockup_interrupt_count(void)
> {
>         unsigned long count;
>
>         count =3D __this_cpu_read(hrtimer_interrupts);
>         count++;
>         WRITE_ONCE(*raw_cpu_ptr(hrtimer_interrupts), count);
> }
>
> but it is nasty. A more elegant solution might be using atomic_t
> for hrtimer_interrupts counter.

I switched it over to atomic_t.


> > -     if (__this_cpu_read(hrtimer_interrupts_saved) =3D=3D hrint)
> > +     if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint)
> >               return true;
> >
> > -     __this_cpu_write(hrtimer_interrupts_saved, hrint);
> > +     per_cpu(hrtimer_interrupts_saved, cpu) =3D hrint;
>
> IMHO, hrtimer_interrupts_saved might be handled this way.
> The value is read/written only by this function.
>
> The buddy watchdog should see consistent values even when
> the buddy CPU goes offline. This check should never race
> because this CPU should get touched when another buddy
> gets assigned.
>
> Well, it would deserve a comment.

I spent a bunch of time thinking about this too and I agree that for
hrtimer_interrupts_saved we don't need atomic_t nor even
READ_ONCE/WRITE_ONCE. I've add a comment and a note in the commit
message in v5.
