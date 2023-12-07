Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D9A80887A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:54:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T6oXEb5W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDjv6b02z3w9J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:54:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T6oXEb5W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDY61kRYz3dHJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:46:33 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-db3fa47c2f7so1073314276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 04:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701953189; x=1702557989; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHfqqy7VSfkSG99E4cdZjp3eHb2ShoLvFftEF8wWjOQ=;
        b=T6oXEb5WJXAVHwyL6E5/XZPJgkX3RjaTQa68CFqVVWAZwV5KI9YXUhGOw/E5SabUJm
         5TizD7rewIZZG4v/2mUIohcPLQw6BO7h45XrmajVBzfKkjZh+2XNta1ros1soo3QuXsm
         bLW0ncVptmFSPJJdB94BrQHu3nLN4yelqt746qtbDJfZasIfjYa46mbjZOBhInnICtQ0
         pDJSiXRVYsoU8J0kfLjkTws1QksUXRpYQjqn957064vUQAIea9J5rgicWvOr3e++FoWc
         EsHyyVIuC6L5hPDEJXZXJgWnvEjh0IwhfPEV7vEoAkDNBCn8rymDU7//+Ip+okA2HHx3
         AyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953189; x=1702557989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHfqqy7VSfkSG99E4cdZjp3eHb2ShoLvFftEF8wWjOQ=;
        b=MhsnRf9+7KVpicuJWAQI5KRa5J58PjUNucDVPtgtXoDbA+diLPTir5m3/LuWNdF7Wm
         dcUdbQoZ/m4o/Ln365/OwC8oOmdqvSYy9J3rRVd8VHY5J6XGmyZsa2JoYx/Cbgx7JB2W
         Xy4Md/N8c2bfnL/4jECRfQoQXjE37ejilEOYKKxplFDTva0avAs/vjJwaY8lDEiuS1sp
         1J68IxE4FZLUOsfoFL/yHeL5n8JTxMq17Dspi38L+JXjPhu/YnMzRThibLtgu93toCzz
         pG8ReGGi2DKadojPGpG+UfIyNmpfr2No4pVDWp6nx0DZ36hQp01hmJgYES8n7hhOJ9Rh
         8bSA==
X-Gm-Message-State: AOJu0YxtnuJP6uvqXY58VkjM5Kh9wGze87ExRU6GmKs6ZPr/lzkbSek3
	T5IhW+2XuwR4Bw8nDPp7vpU423nOnaSc6Ty8oig=
X-Google-Smtp-Source: AGHT+IFwsBRm2Rebv+SFsvxcHiAxag8PhUK1dcHIdFKH5KX2JpHW3VXWMpLshEKz01dWJ6+Za1oDmJQd0KMGyh6EKoc=
X-Received: by 2002:a25:aa6a:0:b0:db7:dad0:60c1 with SMTP id
 s97-20020a25aa6a000000b00db7dad060c1mr2364100ybi.78.1701953188938; Thu, 07
 Dec 2023 04:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com> <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com> <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu> <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
 <CAHp75VdMzZZg3w_jr-SF2APeyq1wVNHK=r=Amf0+JUOq1hy0Fw@mail.gmail.com> <3275dec3-fd19-4aa1-8eba-441fd64cc185@csgroup.eu>
In-Reply-To: <3275dec3-fd19-4aa1-8eba-441fd64cc185@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Dec 2023 14:45:52 +0200
Message-ID: <CAHp75VfmF0sMrQTrq8G+R9e7icjEZR9jM9L9GEQHqTutS+E-Uw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, George Stark <gnstark@salutedevices.com>, Waiman Long <longman@redhat.com>, "will@kernel.org" <will@kernel.org>, "jic23@kernel.org" <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 7, 2023 at 2:31=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 07/12/2023 =C3=A0 12:59, Andy Shevchenko a =C3=A9crit :
> > On Thu, Dec 7, 2023 at 1:23=E2=80=AFAM George Stark <gnstark@salutedevi=
ces.com> wrote:
> >> On 12/7/23 01:37, Christophe Leroy wrote:
> >>> Le 06/12/2023 =C3=A0 23:14, Christophe Leroy a =C3=A9crit :
> >>>> Le 06/12/2023 =C3=A0 19:58, George Stark a =C3=A9crit :
> >>>>> On 12/6/23 18:01, Hans de Goede wrote:
> >>>>>> On 12/4/23 19:05, George Stark wrote:

...

> >>>>>> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXE=
S
> >>>>>> is set, otherwise it is an empty inline-stub.
> >>>>>>
> >>>>>> Adding a devres resource to the device just to call an empty inlin=
e
> >>>>>> stub which is a no-op seems like a waste of resources. IMHO it
> >>>>>> would be better to change this to:
> >>>>>>
> >>>>>> static inline int devm_mutex_init(struct device *dev, struct mutex
> >>>>>> *lock)
> >>>>>> {
> >>>>>>         mutex_init(lock);
> >>>>>> #ifdef CONFIG_DEBUG_MUTEXES
> >>>>>>         return devm_add_action_or_reset(dev, devm_mutex_release, l=
ock);

^^^^ (1)

> >>>>>> #else
> >>>>>>         return 0;
> >>>>>> #endif
> >>>>>> }
> >>>>>>
> >>>>>> To avoid the unnecessary devres allocation when
> >>>>>> CONFIG_DEBUG_MUTEXES is not set.
> >>>>>
> >>>>> Honestly saying I don't like unnecessary devres allocation either b=
ut
> >>>>> the proposed approach has its own price:
> >>>>>
> >>>>> 1) we'll have more than one place with branching if mutex_destroy i=
s
> >>>>> empty or not using  indirect condition. If suddenly mutex_destroy i=
s
> >>>>> extended for non-debug code (in upstream branch or e.g. by someone =
for
> >>>>> local debug) than there'll be a problem.
> >>>>>
> >>>>> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT op=
tion
> >>>>> too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.
> >>>>>
> >>>>> As I see it only the mutex interface (mutex.h) has to say definitel=
y if
> >>>>> mutex_destroy must be called. Probably we could add some define to
> >>>>> include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it=
 near
> >>>>> mutex_destroy definition itself.
> >>>>>
> >>>>> I tried to put devm_mutex_init itself in mutex.h and it could've he=
lped
> >>>>> too but it's not the place for devm API.
> >>>>>
> >>>>
> >>>> What do you mean by "it's not the place for devm API" ?
> >>>>
> >>>> If you do a 'grep devm_ include/linux/' you'll find devm_ functions =
in
> >>>> almost 100 .h files. Why wouldn't mutex.h be the place for
> >>>> devm_mutex_init() ?
> >> mutex.h's maintainers believe so.
> >>
> >> https://lore.kernel.org/lkml/070c174c-057a-46de-ae8e-836e9e20eceb@salu=
tedevices.com/T/#mb42e1d7760816b0cedd3130e08f29690496b5ac2
> >>>
> >>> Looking at it closer, I have the feeling that you want to do similar =
to
> >>> devm_gpio_request() in linux/gpio.h :
> >>>
> >>> In linux/mutex.h, add a prototype for devm_mutex_init() when
> >>> CONFIG_DEBUG_MUTEXES is defined and an empty static inline otherwise.
> >>> Then define devm_mutex_init() in kernel/locking/mutex-debug.c
> >>
> >> Yes, this would be almost perfect decision. BTW just as in linux/gpio.=
h
> >> we wouldn't have to include whole "linux/device.h" into mutex.h, only
> >> add forward declaration of struct device;
> >>
> >>> Wouldn't that work ?
> >
> > No. It will require inclusion of device.h (which is a twisted hell
> > from the header perspective) into mutex.h. Completely unappreciated
> > move.
>
> I see no reason for including device.h, I think a forward declaration of
> struct device would be enough, as done in linux/gpio.h
>
> Am I missing something ?

Yes, see (1) above. If you want to have it in the header, you must
provide an API, which is located in device.h. The idea about
mutex-debug.c is interesting, but the file naming and the devm_*() API
for _initing_ the mutex seems confusing.

--=20
With Best Regards,
Andy Shevchenko
