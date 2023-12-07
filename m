Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76731808749
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:03:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cZZ2Uy61;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmCbq6fYqz3dHw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cZZ2Uy61;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmCb06XsTz30h0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:03:08 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-67a934a5b7eso4931396d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701950585; x=1702555385; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a76pkPINuWuuNyd1g0nmGNuSpkTPlhe2dR0CW1O0fkI=;
        b=cZZ2Uy61tAd55UmTodQQCeRKtWduUJZ1R77+WlrT4iff6nY/QABTGrnmRskGAyE8lh
         Gd9H2jGxtSjHLKOGnksP+xdynUfL9mKP9SCs2ssr7nG/4UjrSCyVC0Qm+1xCKYz6M5J5
         S8ONoYdnIbHUAp/CElX9/02wFoH7g/EEh7Dr0vvjMqWAXCcUhTuorKiwirlEpGDWotiI
         PCdbOka3VavBYWTNJL/90uDloDWr8F8D6zixfW+fLU7EQRKs38JuxGHk+BWcPzH+EjnA
         Ub33DgePWv6DTsshpGn2yQkH5GjPYD/fwxBaM8Y0ZhEFJREhCvh2YslnC+THPI3jQ6io
         eH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701950585; x=1702555385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a76pkPINuWuuNyd1g0nmGNuSpkTPlhe2dR0CW1O0fkI=;
        b=EzfDh7onAEjpEoQirVeOT624vrkl5ycw0AdY7NpcVoAB2DX+4iy29AoftnFInHYpEp
         SYtQ8WA0fV+mvj85rJgOm3ABidCaWeKIdQWtZUPozdI4Ek0UHyBrwSaICxZxB0g6rGLW
         1lHNf+WcXtj0zRc5SUbVrDb6/n4a66m0jRKzorQZeD5P6Jfjykhk2ngChWjOZRKosd4a
         bMNBzkzI38D/FJ9XUHp2Ap2pPp1QLCt6mq0HWGgoMbQ/U2azbP/jphHEJl2648opPZy6
         0bZNopyVTdZ58wQeVbPliw4gI/PT30JvyyWIKkgsaRfpAbhvxLSj4/nDBDVSFMS6soZ2
         ybVA==
X-Gm-Message-State: AOJu0YwJFfyKudgZ0s3H2sMfJCIBhj6pwgsIFJh5hYgYSpjjC848kc0d
	1Bui3MtNV9mMhUnBht2WM1EUJnehOAQ/La4tSPg=
X-Google-Smtp-Source: AGHT+IE7UKQ77qRY9ysn/BaFopgxG9y7lP3T51d2djhRlBt8w9XYBK4KfHkGlCkq6n19/zLy6x8OhEEOaZE8GSocbkY=
X-Received: by 2002:ad4:5189:0:b0:67a:a721:7848 with SMTP id
 b9-20020ad45189000000b0067aa7217848mr2211444qvp.109.1701950585302; Thu, 07
 Dec 2023 04:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com> <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com> <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu> <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
In-Reply-To: <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Dec 2023 14:02:29 +0200
Message-ID: <CAHp75Veyz-hMYPDEiCC1WJASGZ8N9pVef0foYJ0vBcW2VpfR+w@mail.gmail.com>
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

...

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

In case you place it into a C-file. Otherwise you need a header for
the API and that is not acceptable for mutex.h.

--=20
With Best Regards,
Andy Shevchenko
