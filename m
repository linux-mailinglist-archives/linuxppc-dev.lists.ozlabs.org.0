Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D233F852E7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 11:56:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GrsLx7SB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYyv35Xwxz3dX8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 21:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GrsLx7SB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYytG5nHMz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 21:56:05 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a3cfacf0eadso62570566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 02:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707821761; x=1708426561; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUurrgB9hKbq8LQjUCjYTYfNwInt+r7uGpXZGPanFts=;
        b=GrsLx7SBm+LcxeEVRI6DoIl8etYxlRW8lopvh/3MDoQoyv7zXO1wy3kId8J6iVoNtk
         6a7JkoKmJz+AH6rYb6+7yZa/EHPUiJ251KzK/dhNngt+KV2uzjMHGtS3RPj2vLkiuMPo
         Xi6JIQYRErRFaIDwI93PZrwIWDlDo4tWpsIw4jSrLjgZT4HIRpcX+QSpGJ8s0cG33Qqq
         vlolLEyZyc2DnJtwSIEWqRPMP0kVzuDxiF/+AdajrgHXRYpu26+/R/PSc5OXwJ1+06vw
         3M3u7JgC+m/GqPlRe/5SNsUE6pl5jNod2b/9HW7tMcr/Jo7RJWjJY6EFZ643EVg9M/Br
         oe/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707821761; x=1708426561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUurrgB9hKbq8LQjUCjYTYfNwInt+r7uGpXZGPanFts=;
        b=rLiLC2jyu4PitomydnsVb9CNhl25+1MC0gIOgm6hCwwb+UQBTag7cv4QZUrFW7iocM
         9hDT+ZeaDgxT6Tr4V4GezLL//1GS+Kr4y7QVDPfbeND0HoJ0+g8cav42QluTy4Wp5Xk6
         0v/oX+rtc8TXMm0tu2sAEB7876xxNVdLp2ycJ8XipTbJM0NrvakkljQwV74RfTC0immH
         9Lt0HQ4c6rXBCZEsuuozq6PUGHJuJE37oIgR61NNSIlyM4OmU+rClgtSPoqV9kJb5uxI
         YwUg9t4HekHyGBgV5fBTEY+J7p03MCThRK6Xbf9n6mvDSujoxFDoj9+3HWcsH0QsFr2e
         /yqA==
X-Forwarded-Encrypted: i=1; AJvYcCUJXbbv12MJC6+WeYhuXmb1dp8HbXf4g5p9pUYa05tEKUsoXle5T//CDGcqawmINP9WtTuTrSoUsRamYP8NI3pjR8a6jRMgNoAPB81JsA==
X-Gm-Message-State: AOJu0YytwsN2902uc6nMFvTT/I12m7gaksWgpQL5GXesS4daGPn4hz9S
	rw+wihJ52LOTcsfyQOv6oZq9NPzB4cLj9FhCUcDysS0rfoVSfTBPz9JkZEsoF/5YD8jOFul0UBB
	moKvciY5Y5xDAlOIYlOzlugHGVPU=
X-Google-Smtp-Source: AGHT+IFolOxgwWLz8kVogEtlGE21JCzOZgJAa+aH+vEDXUfXHQDponMPU6Br24q1L+ahv8K1sh+Uqz/FoqPf/0eDVC4=
X-Received: by 2002:a17:906:ae93:b0:a3c:92c2:66e0 with SMTP id
 md19-20020a170906ae9300b00a3c92c266e0mr4060891ejb.64.1707821760864; Tue, 13
 Feb 2024 02:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231221151111.GJ10102@google.com> <ZcZcpUHygltD2ETa@smile.fi.intel.com>
 <d844862e-1d1c-4c9a-b7fe-e0ac44f4126e@salutedevices.com> <CAHp75VfQd9e4fLAYkYrMajnJfPQqno6s_aiTarErPiqP-Z6ydg@mail.gmail.com>
 <ae5bf6bc-5f7f-4fe9-a833-c1bfa31ff534@salutedevices.com>
In-Reply-To: <ae5bf6bc-5f7f-4fe9-a833-c1bfa31ff534@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Feb 2024 12:55:24 +0200
Message-ID: <CAHp75Vd1FRz9=Q7NRXsbkBu_K0+zRC6uf5nPM1Q+QnJum+74tg@mail.gmail.com>
Subject: Re: [DMARC error][SPF error] Re: [PATCH v4 00/10] devm_led_classdev_register()
 usage problem
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
Cc: kernel@salutedevices.com, vadimp@nvidia.com, mazziesaccount@gmail.com, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, hdegoede@redhat.com, "will@kernel.org" <will@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, npiggin@gmail.com, pavel@ucw.cz, Waiman Long <longman@redhat.com>, nikitos.tr@gmail.com, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 2:14=E2=80=AFAM George Stark <gnstark@salutedevices=
.com> wrote:
>
> Hello Andy
>
> On 2/12/24 12:53, Andy Shevchenko wrote:
> > On Mon, Feb 12, 2024 at 1:52=E2=80=AFAM George Stark <gnstark@salutedev=
ices.com> wrote:
> >> I haven't lose hope for the devm_mutex thing and keep pinging those gu=
ys
> >> from time to time.
> >
> > I don't understand. According to v4 thread Christophe proposed on how
> > the patch should look like. What you need is to incorporate an updated
> > version into your series. Am I wrong?
>
> We agreed that the effective way of implementing devm_mutex_init() is in
> mutex.h using forward declaration of struct device.
> The only inconvenient thing is that in the mutex.h mutex_init() declared
> after mutex_destroy() so we'll have to use condition #ifdef
> CONFIG_DEBUG_MUTEXES twice. Waiman Long proposed great cleanup patch [1]
> that eliminates the need of doubling #ifdef. That patch was reviewed a
> bit but it's still unapplied (near 2 months). I'm still trying to
> contact mutex.h guys but there're no any feedback yet.

So the roadmap (as I see it) is:
- convince Lee to take the first patch while waiting for the others
- incorporate the above mentioned patch into your series
- make an ultimatum in case there is no reaction to get it applied on
deadline, let's say within next cycle (if Lee is okay with a such, but
this is normal practice when some maintainers are non-responsive)

P.S. In case Lee doesn't want to take the first patch separately
(let's say this week), send a new version with amended patches
included.

> [1]
> https://lore.kernel.org/lkml/20231216013656.1382213-2-longman@redhat.com/=
T/#m795b230d662c1debb28463ad721ddba5b384340a


--=20
With Best Regards,
Andy Shevchenko
