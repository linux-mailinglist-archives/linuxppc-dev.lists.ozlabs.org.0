Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0E851013
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 10:55:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JpyJgSF+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYKZQ0Btlz3dTL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 20:55:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JpyJgSF+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYKYh32cHz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 20:54:30 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a3be9edf370so332955566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707731667; x=1708336467; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMIQDKpWunM+UrneNS0NgY3ocyzjZza2ecHhJJ88y1k=;
        b=JpyJgSF+h7MScIFRZl55oP6tO+Vq56rPFy2jcVv6R1uNthldxyzmWbWNO9CkvJShNM
         3mKfbfS2H46pQmyPDDYRyRZbqgIi/r+8mJIDbONQ5ve9x2+ju4f8ibSOxqni0h7SZmi/
         /yuLJPUxoj0MAztmGciyujJPocDFlmohEMCIzjSseoWh6sZyaE0u0q0302WXp90Kpuup
         WotyYCGFgLEte83YVB0zMOkdAWvM8bJGSSo4X8KFYhZfZYZbLDXa/Vpy4m4fo8rIpW5g
         DQUGX3+wUHhDs4A8DSSckGnZsjo4jSpwAOr0ObVwCHqwjcmm7jopkGAF5xWh9amQ69PI
         9qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731667; x=1708336467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMIQDKpWunM+UrneNS0NgY3ocyzjZza2ecHhJJ88y1k=;
        b=lo49VnK/SbExoZ+GIX0cOqt5hryrVNa5dtEEA8GEadvihH6GZRPGR70RZKC0m4e5Jz
         IWfi6/DfgV3Ls8pcjRnRT4GbAK1ZCXriYvGycu4BPKu1FiBiQKRLNoVH36tS9R3TWeCf
         wcMoT75L4acI/L+g1+9BPUrBrJTZoZd7+HHFkZk9yfodbHEeUfnA9AhImBIoAIw+romO
         M1g73nef4asPQ0ayy/DsntUuuGaw3/SnYdNVhdujhfkcFnJdyqO/S+JqnWwsTYeRlqmH
         QtG2lBxxiKM9Y0/nA1nLSCxn5waSkrtaF5zINWaMNVyHfrfGd+35cXFA4LI+O64e33To
         Ah+Q==
X-Gm-Message-State: AOJu0YxHRmbORWCo93XcZZ2kIlV+TdxTr+yQuIBEhlasqms7LAvVtgVX
	L2Q9+GljeC2BgHqnYb6T/cCvxXj3TFShVd3wYYdtr837cd46vQJlWllg8hgTVQ0iCWSk6CskpPU
	Y34u4kFEokQT5uJ3gHXKOomTlXVs=
X-Google-Smtp-Source: AGHT+IG/MlHO4rtA/ydi+JG0ItW1+P0Kw4weOn/uJNJktOE3eTDa25UDCp+VSUuqwmxkMzquRjo17adF55sUnhaFaMo=
X-Received: by 2002:a17:906:4c57:b0:a3c:8a77:e67d with SMTP id
 d23-20020a1709064c5700b00a3c8a77e67dmr1916452ejw.59.1707731666830; Mon, 12
 Feb 2024 01:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231221151111.GJ10102@google.com> <ZcZcpUHygltD2ETa@smile.fi.intel.com> <d844862e-1d1c-4c9a-b7fe-e0ac44f4126e@salutedevices.com>
In-Reply-To: <d844862e-1d1c-4c9a-b7fe-e0ac44f4126e@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Feb 2024 11:53:49 +0200
Message-ID: <CAHp75VfQd9e4fLAYkYrMajnJfPQqno6s_aiTarErPiqP-Z6ydg@mail.gmail.com>
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
Cc: Lee Jones <lee@kernel.org>, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, hdegoede@redhat.com, mingo@redhat.com, npiggin@gmail.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 1:52=E2=80=AFAM George Stark <gnstark@salutedevices=
.com> wrote:
> I haven't lose hope for the devm_mutex thing and keep pinging those guys
> from time to time.

I don't understand. According to v4 thread Christophe proposed on how
the patch should look like. What you need is to incorporate an updated
version into your series. Am I wrong?

> Sure I can single out the fix-only patch I'll do it tomorrow.

I believe it can be handled without issuing it separately. `b4` tool
is capable of selective choices. It was rather Q to Lee if he can/want
to apply it right away.

> On 2/9/24 20:11, Andy Shevchenko wrote:
> > On Thu, Dec 21, 2023 at 03:11:11PM +0000, Lee Jones wrote:
> >> On Thu, 14 Dec 2023, George Stark wrote:
> >>
> >>> This patch series fixes the problem of devm_led_classdev_register mis=
using.
> >>>
> >>> The basic problem is described in [1]. Shortly when devm_led_classdev=
_register()
> >>> is used then led_classdev_unregister() called after driver's remove()=
 callback.
> >>> led_classdev_unregister() calls driver's brightness_set callback and =
that callback
> >>> may use resources which were destroyed already in driver's remove().
> >>>
> >>> After discussion with maintainers [2] [3] we decided:
> >>> 1) don't touch led subsytem core code and don't remove led_set_bright=
ness() from it
> >>> but fix drivers
> >>> 2) don't use devm_led_classdev_unregister
> >>>
> >>> So the solution is to use devm wrappers for all resources
> >>> driver's brightness_set() depends on. And introduce dedicated devm wr=
apper
> >>> for mutex as it's often used resource.
> >>>
> >>> [1] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b=
@salutedevices.com/T/
> >>> [2] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b=
@salutedevices.com/T/#mc132b9b350fa51931b4fcfe14705d9f06e91421f
> >>> [3] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b=
@salutedevices.com/T/#mdbf572a85c33f869a553caf986b6228bb65c8383
> >
> > ...
> >
> >> FYI: I'll conduct my review once the locking side is settled.
> >
> > To reduce burden can you apply the first one? It's a fix.

--=20
With Best Regards,
Andy Shevchenko
