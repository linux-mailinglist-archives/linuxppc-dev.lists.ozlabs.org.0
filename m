Return-Path: <linuxppc-dev+bounces-6823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16356A57A43
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 13:52:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z932g3H0lz309h;
	Sat,  8 Mar 2025 23:52:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741438331;
	cv=none; b=BG4/kssiNgP8BKWdpeGbH81lnT/+ofmvyrvuryYcj8KFPn0SSt+iVnPxapPCoFKrvIE5Rk7EzTX7MvV728nEuTmccDrge19ZwGvhr5Iq5TjdMrDHjdtWqxnOwiUjRYj5bFJc0vZkudJnTNyIlazI6GnNu9wFdZ/oDSBanVv+5aDotk1gxFg1+gz8XaZl1kXbl5wA1qtt+u/oN9hBGJRekWkEdQCzFNMUT431ImZ2JdgaXm8KZREbtTf73TsAyX4tDwjDBcg+LWG7gzD7yMRoLPhRTz/3qXJAU2J8F3ElO4XQ+IfsiMZ1fLgvbwfROtU5GvhEBWKeZuBA5IszcNwvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741438331; c=relaxed/relaxed;
	bh=ljcSe8icqYARGbv2/xhAvm/DCpz0wTGWoW545h+pz7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yb9TWiA21XJh7JXWd8/Pk6Kr8S1VBcadZlgfEdgGRMMfP4Pok0aIigF6D7lTLp28ruugrId2ADtRnR0zdaM7fL59L0u5ZdJlxku3WgDwOgx+K16Z1PCCRBorkwoG3QngSzR2rc/eVpiqppb1Xjyf8ZYxSmuRp/k9b3TimwVHcMKiGka3GUwwwy20PD+Bt0D0tv1tVen81olhc2NKCnJsnNme8maZBbGPatN0QsfO12F9QP2jDV4A9Ts/uK/7+hc06z2rFn4H9qRIForLSv1VeC2lh7x8o8xSoeojVAe34obfA2xxPol0/KB4GSlUU/2hg6kOHOOtJySvG5QokhNO5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jrIu4oPR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jrIu4oPR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z932d4htpz305n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 23:52:09 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30beef77634so12369001fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Mar 2025 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741438324; x=1742043124; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljcSe8icqYARGbv2/xhAvm/DCpz0wTGWoW545h+pz7A=;
        b=jrIu4oPRhecm+n0CbdWQPnChtcsO3kix/pzrQmkCH0cm3snfHpedXycUNfGEk6jcVR
         WQPrNKg4vCfqkdho6tgh0lK61MLJRgdpxp06FCEiVtTIKT0Ek3di4KL9N6IQg8Xhz9iY
         bgk5pXp4wdlotDLChU7v2TOKiITMb9u11obXDj7VD0+CRx3DOayAtyUkYAu4onWcF/i0
         4bdGdMYR4YuJRDs64iK8oC8ykKeXkSHNC5ubM1IYS85GRhF+aDz8CNzF1DsXdm8dO9GY
         5AsdyF5KXw+BLjPEMLmzBDugNpb432sBC/0cLKOtYrSkz27xjOtbp1H/c40aO8bptSHn
         OVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741438324; x=1742043124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljcSe8icqYARGbv2/xhAvm/DCpz0wTGWoW545h+pz7A=;
        b=tW6LN8QjdU8yVhPQh+PAttoHURAQ0bYdPskJBO3yLHM2t5QFpwPx0ppXpP24qmL3po
         CZScrqkYCbgAT+XuoZHrB/kRU3H2E7qINng9ET6yuJzXVQ/TlKPMZG+Xh9GaTJHyTq/m
         K99LwbZ3ujDV4Il8/6v94wMnaog/VaLpAYCO+KyIMqdsfvLXrx4RfyCcM4lErmltLW2I
         tU2EhZ17H49N/gn9SKgnIlQypDD/A06z+GGNXycuHk02z4JeJIwCvvf1w/dW/gcVD/Qe
         yMoragWRULgEk9SzT3KT3c7zOBtKKWrykGOvBBiA957teJ6bQ1P086zxhCcT5kW7kHHa
         sf9g==
X-Forwarded-Encrypted: i=1; AJvYcCUXCcUEIe3h/wthxEo1ph6xT3xIbqlwYLtGNQNGtb+WVvNjntL00bdhBoFVevmknmNF5nlxSuLJsL8R6+A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxomK4ZWwXiqsOrBdITWAAFjWR0RXeufX+JuAJi9N22XWdJYCxp
	LDibjbFnjPlytiYvp0FPBlsh+CX9dGP9X0IICPYUcYbWJYJws+CYmkSa1MrPOrPwq+G5luO6NPw
	08yV9wVHVyA7tZlehNK3Qzn+UMeo=
X-Gm-Gg: ASbGncvJm0Qzc/m1phY3wbYQtgjgld6Dni+DU8B6o9nnfK74ad6bsQdrbyqM3dFUtaE
	GsnflVR4u9/ih55X8hK0jzaQAT7x2so9D1cdEcKGkCfVXYrdkcw1dQNTsJoYEvBNv3nNiKBRfeg
	QH41SXheJmm6QJSBMrARioUbznJsZudeHrL8DHTqMFmEjrWBcoEoBseHdRHu5Q
X-Google-Smtp-Source: AGHT+IHdstqcViUgKKVj/dxOVnnCRmRtk0n+Jmb8EXvBPRxEstCxyV8oevucwu1Qdxz344u8wFGVHkGcozJRwQRyjxo=
X-Received: by 2002:a2e:a495:0:b0:30b:aabf:fc4 with SMTP id
 38308e7fff4ca-30bf4535ca8mr20702861fa.21.1741438323386; Sat, 08 Mar 2025
 04:52:03 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com> <202503072046.34DAF614E6@keescook>
In-Reply-To: <202503072046.34DAF614E6@keescook>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Mar 2025 07:51:27 -0500
X-Gm-Features: AQ5f1JrzFDCikkubFSehWJW1k-o-BEpIkGHx4XfrgD5nfeGf55hOd06bCk68tB8
Message-ID: <CAJ-ks9kTO-u+Wqp0K-vdMLAs08fBeoovSeb_pGkMjSHFnBKysA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
To: Kees Cook <kees@kernel.org>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 7, 2025 at 11:49=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Fri, Mar 07, 2025 at 05:08:55PM -0500, Tamir Duberstein wrote:
> > This is one of just 3 remaining "Test Module" kselftests (the others
> > being bitmap and scanf), the rest having been converted to KUnit.
> >
> > I tested this using:
> >
> > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=3D1=
 printf
> >
> > I have also sent out a series converting scanf[0].
> >
> > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386=
d7c3ee714@gmail.com/T/#u [0]
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> > Changes in v6:
> > - Use __printf correctly on `__test`. (Petr Mladek)
> > - Rebase on linux-next.
>
> Thanks for doing this!
>
> If Petr, Rasmus, Andy, and/or others Ack this I can carry it in my
> "lib/ kunit tests move to lib/tests/" tree, as that's where all the
> infrastructure in lib/tests/ exists.

I think the plan is to take it through the printk tree. We're still
working on it, here's v6:
https://lore.kernel.org/all/20250307-printf-kunit-convert-v6-0-4d85c361c241=
@gmail.com/
where I've rebased and put the test in lib/tests.

