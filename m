Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82687BB70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 11:38:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VTB3qzGC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwP4721Qfz3dXh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 21:38:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VTB3qzGC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwP3Q2HzHz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 21:37:54 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a466f89560eso67077766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 03:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710412670; x=1711017470; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzCmVzgk1A2WbwK3W/30teVzlmAUHDmYtHZ6Lsqwgus=;
        b=VTB3qzGCMK5mwNSfp0YBqSw8XxhOYPRQGE2yy3y7QRfR/mO4SH5AeOclOSGZWh75gE
         C2dSmEUm7pNTYlPcftostK94WrNSYXATeId+qZFAgVMxsYA3X9eLds15hc/d/Fpg/Zyq
         V61/b6JxVQVx+0NaGtqx8ulH7WiHLTxpRZ1Q6C02DzfR0CtESCUpKb2XUrjp0bhZgvCJ
         SuExDlRZ70e/sXB+x8ZSJ4RdJmnaTUcKvP0D9HLM9V7ZZTrLl6DfC/7c2A4SZmS4VeMF
         ietmadZav4QPuK+C3w27615EdcHtvgcODoEq+4j4D5tM+hxnDuA/6RYW9NuxunxMAOKq
         dDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710412670; x=1711017470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzCmVzgk1A2WbwK3W/30teVzlmAUHDmYtHZ6Lsqwgus=;
        b=EyhpMF3C51DEG86PLq/8RUviCrbxAwu8U5/hx36Q0vqcbSBIdX2QuJOXQGEl+wD1TK
         FwqNE+oA6SyshvW3Hr1UfRyxrUcyGQggYzNteu1c+JvXIU+eL+SYXK7O8nq4IXiVz/UW
         Al05CYX0KJn/emsCY/ZwmFg6efvPEnL0R2WiN5qtnePVimLCFxPMixG2y33Z0AwPIqSH
         K3bvm8nhUko/lxVkDuZ4i8Fz5pXQWKuHkvlsJEODIaDE6rOMjNwz3IHiAbcITwmtNp9j
         QKKUxPoSlouRtyNRtkcK05G17tdb6021NaJ/t/6j6LcRkBIXhFy/VPg4d9w4rcf+GBBq
         qXsw==
X-Forwarded-Encrypted: i=1; AJvYcCUQHCpjBMFuTqDIMkMHGlvpCKMUn/yxXWeR9rwrbC6rPUyFaLfmGtGRWwqQtiI+P59jBwMR10fwUA8Kw5bdWtCJMP846xEi+SJRlAWPyg==
X-Gm-Message-State: AOJu0Yz3FgdVyU5JnstvMaDm/rFWcRmKiw6HgBYw97XzfdKcPeNj1x/a
	Ng8CGbyMwsYz/4GjqDpVe158Np9e5e7laDciRKjmeCBgc+c6JdYjx1Bs8BhooLeYdGvlvw2+qKL
	X0twoQVVTznYjX3VUE3uo6UM+Al0=
X-Google-Smtp-Source: AGHT+IHAgDyqVH7oGwixukT7CSGFbdDnW4TvuHEXAOyVQ/qRpBYbBxUZXwiLPNDdK50Y8a0SeFDblV5Sbfrs/AuuR+0=
X-Received: by 2002:a17:906:5801:b0:a46:614f:f2be with SMTP id
 m1-20020a170906580100b00a46614ff2bemr899128ejq.28.1710412670199; Thu, 14 Mar
 2024 03:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240314084531.1935545-1-gnstark@salutedevices.com>
In-Reply-To: <20240314084531.1935545-1-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Mar 2024 12:37:13 +0200
Message-ID: <CAHp75VdM9GkogkeffY+0rwU3r2iWeTZ8-aj901MLteUmRfcLOA@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] devm_led_classdev_register() usage problem
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
Cc: kabel@kernel.org, linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, marek.behun@nic.cz, hdegoede@redhat.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 10:46=E2=80=AFAM George Stark <gnstark@salutedevice=
s.com> wrote:
>
> This patch series fixes the problem of devm_led_classdev_register misusin=
g.
>
> The basic problem is described in [1]. Shortly when devm_led_classdev_reg=
ister()
> is used then led_classdev_unregister() called after driver's remove() cal=
lback.
> led_classdev_unregister() calls driver's brightness_set callback and that=
 callback
> may use resources which were destroyed already in driver's remove().
>
> After discussion with maintainers [2] [3] we decided:
> 1) don't touch led subsytem core code and don't remove led_set_brightness=
() from it

subsystem

> but fix drivers
> 2) don't use devm_led_classdev_unregister
>
> So the solution is to use devm wrappers for all resources
> driver's brightness_set() depends on. And introduce dedicated devm wrappe=
r
> for mutex as it's often used resource.

The leds related changes (except the last one) LGTM, hence FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(for patches 2-8)

> [1] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@sal=
utedevices.com/T/
> [2] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@sal=
utedevices.com/T/#mc132b9b350fa51931b4fcfe14705d9f06e91421f
> [3] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@sal=
utedevices.com/T/#mdbf572a85c33f869a553caf986b6228bb65c8383

--=20
With Best Regards,
Andy Shevchenko
