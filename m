Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A2F87BB63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 11:36:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XWuhRMhb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwP1R5jljz3dhY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 21:36:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XWuhRMhb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwP0k2cgGz3cDg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 21:35:34 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so336835566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710412530; x=1711017330; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUT+z5aPzLoK1XBR0CtD7lRZ7iP+OijvRC1vgfB2c3M=;
        b=XWuhRMhbjbA548ixO9NXKryvbv7u+CGDENCwvVdJPLDZ08JlbwQpdrSQcAhfkE/aWB
         487towQBRabDmCWyS5Ce8l124c63Um8XdbtWkq0j3rvvqw4belo6NI7rpS6KS4HvuSq0
         cFZ1kt1VEcUiRQWV3wCXjhfyeKRwtZtQOytnmuGQUxJSAfLp2bYGe/3wOa5zDNn+rV5n
         anX84pZ5gJfBZP62DkmpA9TbdyaGl5FepAfJAQq6KhA7St8I1Vma3tf25Q1jRpKwb5Yp
         EOlVNBFmiR9J0mc98Byw2Gll4kLU27q4nx01fOtdsAyp9X8Lft+piHRFoF1fu/1tECPB
         +q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710412530; x=1711017330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUT+z5aPzLoK1XBR0CtD7lRZ7iP+OijvRC1vgfB2c3M=;
        b=MZhAxYkl4FHUx/dv9Std47V3Qljfg3Pv0H47NA0aHKY8bAoha/06YjUhTvP8coOh/x
         fyt021jSL5S18jdKnOOf9til0GlkxAD6yKu74E80wsRpQ+YMb0ez+l15yL3htnqAsKtv
         1dNs1O62dJ7XIi5FaY7p0E0+isdEa8gh8DhtCNvDLsSQWKrfVJ+jZfUx11SfkgX5lFG8
         PfBAu3lPBCSdi7SsCAw61YX9xdbHEzOQgqo7Uov+R07Dl1Wf2oi4iAezTpVHqqCjyyF9
         hH90N5/kQteKNiZTGKhgEU9BmpyKlyZEV4f2yU14WzXZ5722DuAEnu95PlXLCdIauGwf
         ygoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZzb36XISouv0EEmkt9doTQbnKDx6G42m8uYVf92sC/s9EIbPWcNmTmlynADNRA8MZk28K/9potpw70pt/FvTZ+GkiiDj5Ye8xpARQxQ==
X-Gm-Message-State: AOJu0YxzKFKUJVDbsYNBzt3phgReLIDFGLj5P2VFUt/OpbmcQHZZfFBd
	TZhT0K5uS6ODgu3dwgDZ8QW7WIK1DuWyrwH6bz3KYXLSlN4PmwhV8N+SJX74IVJg1KsvBDCLGOf
	LN5YaM/4ENJjNIPafMgFnUuIoMEw=
X-Google-Smtp-Source: AGHT+IFnq0Pgx23scikKTP17lOnZUwgeSw196b+FB/RuP2T0OiI6iGiC9TdnME85WIwCtzKA0WA7uZJMZKfaiv1Soro=
X-Received: by 2002:a17:906:5acf:b0:a46:1cbd:c2c4 with SMTP id
 x15-20020a1709065acf00b00a461cbdc2c4mr1170808ejs.26.1710412530221; Thu, 14
 Mar 2024 03:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240314084531.1935545-1-gnstark@salutedevices.com> <20240314084531.1935545-10-gnstark@salutedevices.com>
In-Reply-To: <20240314084531.1935545-10-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Mar 2024 12:34:54 +0200
Message-ID: <CAHp75VfGRNo4hvKV7caQE6i2rHVncOjxDv3-b9oGrpK-uDEBRw@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] leds: powernv: use LED_RETAIN_AT_SHUTDOWN flag for leds
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
> This driver wants to keep its LEDs state after module is removed
> and implemented it in its own way. LED subsystem supports dedicated
> flag LED_RETAIN_AT_SHUTDOWN for the same purpose so use the flag
> instead of custom implementation.

So, this change is not related to the main purpose of the series...

--=20
With Best Regards,
Andy Shevchenko
