Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280F808733
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:01:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bVohqCM1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmCXj0BJMz3d9Y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bVohqCM1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmCWp3RpXz3cQM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:00:20 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-77f44cd99c6so7973285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 04:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701950417; x=1702555217; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N1+cn+fBSeHCGuo21Zugsp7Q1cczJw+MFPsoqSobZY=;
        b=bVohqCM1cg5QWyMAzMR0i+WDfOKIyNhmZibjkVW+DhL6Vfkq/csMOORcXf1SrnsXj1
         3+1G/vSne926ZTr/uGpQrCrgPIjclnRXRS+zmsilL6c1nYxcP9YDZyD/P0E6LrZFQ6Pb
         k80RSbOj0ZYFJUK5WTzTackbyr/VIlQh4gutBkY4UVeDoxp9p8yOjhlNokF948o4Y2xH
         95i1/dw3a2Y8ZN5xfEN9h3I35EDLZzfWz1MjIUARJBi+fKapSW8SB7cE2vJ7DX15NGWh
         tZ+8eytgxrUF1OkvgB9ED2TYKRqJArWfqJwypihwxC9TBZRta4fV+diDS/t+ueK5HsWd
         wfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701950417; x=1702555217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8N1+cn+fBSeHCGuo21Zugsp7Q1cczJw+MFPsoqSobZY=;
        b=EYbYPmvuYjlJX/XP3AXCWP0miyJEyn3iz+cHtAQtc5ncQ2a9S01d87gbOcp4Y0ZvAq
         BjUxNa65fhyB+pkjlrVOu3nZ1JOyoOjAiUHbJ345Z1T6IzW4lyBcKW6WqQlc7HYoEPz7
         PE1lOwVnmRSXiPBu8NgN5pN3boOYm19OKzaUHygH/j8QKQgDe7h6cE2ItB2sK3bc7+2T
         x+SnsNdXHpBi2nFB9piwyYjXNp25mPFswPz7KY4oQDfuuuk61E7kU8rSkDP+knozEMrr
         tp1uOznhFt/mpvaPFowT6ZbQi7VyECzMqUP26TcEW6EMioTqVi8cU891ek5YfyL1BlTB
         3EVg==
X-Gm-Message-State: AOJu0YxJh/YFvxBySWqSeiTdDZBBYXjzN6W5Wg7XZf4xQlPAz2jo04n5
	IWJcy6RRE1P4dt/F5aoX6aeduVXjnDHmvuSGPEs=
X-Google-Smtp-Source: AGHT+IH34Xzv5KtY/D+BMVlkWYo9rwuiVxKqxlh5Ap5AifKPY0cMFdnuMB2UOvEGr+7lT/XiUh+en9FVxjhpx4Akg3E=
X-Received: by 2002:a05:620a:2486:b0:77f:34bf:5593 with SMTP id
 i6-20020a05620a248600b0077f34bf5593mr1943614qkn.17.1701950417106; Thu, 07 Dec
 2023 04:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com> <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com> <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu> <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
In-Reply-To: <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Dec 2023 13:59:40 +0200
Message-ID: <CAHp75VdMzZZg3w_jr-SF2APeyq1wVNHK=r=Amf0+JUOq1hy0Fw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
To: George Stark <gnstark@salutedevices.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, boqun.feng@gmail.com, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, mingo@redhat.com, "npiggin@gmail.com" <npiggin@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, Waiman Long <longman@redhat.com>, will@kernel.org, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jic23@kernel.org" <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 7, 2023 at 1:23=E2=80=AFAM George Stark <gnstark@salutedevices.=
com> wrote:
> On 12/7/23 01:37, Christophe Leroy wrote:
> > Le 06/12/2023 =C3=A0 23:14, Christophe Leroy a =C3=A9crit :
> >> Le 06/12/2023 =C3=A0 19:58, George Stark a =C3=A9crit :
> >>> On 12/6/23 18:01, Hans de Goede wrote:
> >>>> On 12/4/23 19:05, George Stark wrote:

...

> >>>> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
> >>>> is set, otherwise it is an empty inline-stub.
> >>>>
> >>>> Adding a devres resource to the device just to call an empty inline
> >>>> stub which is a no-op seems like a waste of resources. IMHO it
> >>>> would be better to change this to:
> >>>>
> >>>> static inline int devm_mutex_init(struct device *dev, struct mutex
> >>>> *lock)
> >>>> {
> >>>>        mutex_init(lock);
> >>>> #ifdef CONFIG_DEBUG_MUTEXES
> >>>>        return devm_add_action_or_reset(dev, devm_mutex_release, lock=
);
> >>>> #else
> >>>>        return 0;
> >>>> #endif
> >>>> }
> >>>>
> >>>> To avoid the unnecessary devres allocation when
> >>>> CONFIG_DEBUG_MUTEXES is not set.
> >>>
> >>> Honestly saying I don't like unnecessary devres allocation either but
> >>> the proposed approach has its own price:
> >>>
> >>> 1) we'll have more than one place with branching if mutex_destroy is
> >>> empty or not using  indirect condition. If suddenly mutex_destroy is
> >>> extended for non-debug code (in upstream branch or e.g. by someone fo=
r
> >>> local debug) than there'll be a problem.
> >>>
> >>> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT opti=
on
> >>> too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.
> >>>
> >>> As I see it only the mutex interface (mutex.h) has to say definitely =
if
> >>> mutex_destroy must be called. Probably we could add some define to
> >>> include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it n=
ear
> >>> mutex_destroy definition itself.
> >>>
> >>> I tried to put devm_mutex_init itself in mutex.h and it could've help=
ed
> >>> too but it's not the place for devm API.
> >>>
> >>
> >> What do you mean by "it's not the place for devm API" ?
> >>
> >> If you do a 'grep devm_ include/linux/' you'll find devm_ functions in
> >> almost 100 .h files. Why wouldn't mutex.h be the place for
> >> devm_mutex_init() ?
> mutex.h's maintainers believe so.
>
> https://lore.kernel.org/lkml/070c174c-057a-46de-ae8e-836e9e20eceb@saluted=
evices.com/T/#mb42e1d7760816b0cedd3130e08f29690496b5ac2
> >
> > Looking at it closer, I have the feeling that you want to do similar to
> > devm_gpio_request() in linux/gpio.h :
> >
> > In linux/mutex.h, add a prototype for devm_mutex_init() when
> > CONFIG_DEBUG_MUTEXES is defined and an empty static inline otherwise.
> > Then define devm_mutex_init() in kernel/locking/mutex-debug.c
>
> Yes, this would be almost perfect decision. BTW just as in linux/gpio.h
> we wouldn't have to include whole "linux/device.h" into mutex.h, only
> add forward declaration of struct device;
>
> > Wouldn't that work ?

No. It will require inclusion of device.h (which is a twisted hell
from the header perspective) into mutex.h. Completely unappreciated
move.

--=20
With Best Regards,
Andy Shevchenko
