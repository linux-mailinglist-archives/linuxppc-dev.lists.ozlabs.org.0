Return-Path: <linuxppc-dev+bounces-6200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF1A363AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 17:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvdRj6gkRz3blH;
	Sat, 15 Feb 2025 03:53:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739552033;
	cv=none; b=B6ZpSD1T403mHQ3Yy2eASgQ6eaDod6EHLZ+G5pvMyoaSoyrzV1lPNlMEih3E+y1rQ23AZkBluIs+vbe6QiokgIP1g9MOMzCU61vIOiBtpS775MTPUli7GAdnzNMj0ZBP0WQ5GVsnSwwyxcIpnq/K6AfL6DAE88OsFrhXU907FNVgZHZDCdt9UB6bU1wmUG/TLMhFYwQfFHRNy0kbbco3VBhkA/+3E5P/aTs6g5o0uPNwL5JsDX1GCORuKlRfR76bD/GdWMkpayKdKhVQyV4HoGnl0yaPdpaiHZWf0Sy0J4DF/kF/Jup5TcyjIOMgBAcCTsdGLfEr3qGUpDFJcK5nDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739552033; c=relaxed/relaxed;
	bh=2c5NuBDyo2m0shbPuVy5ObaCNtX5qBwlWxjze7MTKVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHbtO+WrPO3Dmz577itVpAs7/yMV+NBRNavk4bXxbPQicv7QIqfaD8x8PHjAllREOTntmuXawTBU72+HMBgpwd6zXmcQLf29FCnR7TjGr2FdexNqjVVFGNDPSMPqWmFTpftmtD4dlaAIOPU2kgjQB67yr5ZvaQrG13JSKusTTP0b/sgnM+hsKK1JdQK8fwhGmTpSbLX1rcPSYhAAv2tBG3ig/KgApBgc+8cad8s30GYlh3EQJHIoFv7XExzNnSPnd10tA1kDOm9Xp71ls9IyFg6I5elU/21M/Gszsb9ojLIvmMIZFH0ho0colFTH9baSBh5htnMHn1WM29wvpR3vRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F52EVjnq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F52EVjnq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvdRh3g4Rz3bgV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 03:53:52 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-308e9ff235bso19541291fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 08:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739552029; x=1740156829; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c5NuBDyo2m0shbPuVy5ObaCNtX5qBwlWxjze7MTKVg=;
        b=F52EVjnqS5LVB8Hv+UL8TFvuRPNQwk+u5Acn0YsMENlBkwLphqwaTdPejUOK9W4ZqW
         I73SNgULQsO/Ur0/PXr01ViblaJdZtzufk3H5Amdg+mLfS+oEhppAYV8fki4brvMXJQd
         /jOINyPeXrb9udblds+oj8AcAszZVwXwcNuVFSBDLpkRHbg4DcE8XOfsRV7NnyiRVW4S
         lrvbUh3mx5prTvL8blMNrpeiXl6pwKo9HhtmKsZK/azGaGCTYb9GSoj/mSExMG5PZb8p
         NySHRMmkNY1AxxLl4misp2tW3IVUxBWmj/qRaEyHThaJEsgCDnJaF0J2zbM2rkbghYxI
         rPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739552029; x=1740156829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c5NuBDyo2m0shbPuVy5ObaCNtX5qBwlWxjze7MTKVg=;
        b=MUv3qzuT3C2Wt2DSIkND7nJt9pmxI8iwGL+gkyFX8lTK4aV4Ox4oyA/NeE7qk4u99b
         Ca8pdPtGE4nRnQv6bh5rXT6DheKRcT0/v0+Zv5UdIrTgg4YwR33hqjDcSAtAgh8Dumvy
         i80IObQzy3ZPwESACLL6MUsvW+GeVKr8MDEWa/dEV/GOKVIF9rl8tHms0aIiJr//JokI
         9vski0PKIzVDo75FJkDxsomq2Z+I4tVHuaYQSIBuB0fZ19dMYa3vJYqAN+60Zq2LT5tj
         tZ684Wq37VUzu53S1VRwP1X8Hm68UAMX8wcoKr7JmHGz1NR6L9QLyoRu517orRqUzKZD
         lV/w==
X-Forwarded-Encrypted: i=1; AJvYcCXQwFqs/FZYCh28YN1LSwxYUmmrOhEPZx6DenwbgU2FFghHbv75Ibmmash1R3/+uFNrJkwm0T55XNFaa40=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw63WNSMoUxh1HugGIyQS0VZfoczPJAG/G4NwVCQFWjJUV8kSxH
	+koztQ7d0GNOAXI0gax6jXx4D0R6OHtJx2ms6m8iGPe98y30jRLc52DBLnTtkRX3OlteuBOaoav
	XhAxXjlz3juV+SZvict/pE5lBWRo=
X-Gm-Gg: ASbGncunNnbYnXk67RWzjsc7AWRETXapyURt8pNWK1+pPrCRr9Lys+xKkXUSFTqyd2H
	Sl2ECaG+1qIH2K8ne1tc8HGDVxnc+w7lYyUefnZXa8Pv0lAG4Q6g4RQO3IOHM3oPnkrcSbsMvdC
	cSvuOYeeHXn23CtO1/WR23I4wZj5Qx6ak=
X-Google-Smtp-Source: AGHT+IH+ZY2j63cWbogB9A3vuP8zUi7lLVt1mNv8t9yoNtwWn6FsGoTMpU+6/obf1W6ICZ9peOj7KrEV5ms8Ua3/CX8=
X-Received: by 2002:a05:651c:548:b0:301:12:1ef3 with SMTP id
 38308e7fff4ca-30927a2cde4mr1356071fa.4.1739552028486; Fri, 14 Feb 2025
 08:53:48 -0800 (PST)
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
References: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
 <Z69isDf_6Vy8gGcS@pathway.suse.cz> <Z69oxhkUzTfJ6YKi@smile.fi.intel.com>
In-Reply-To: <Z69oxhkUzTfJ6YKi@smile.fi.intel.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 14 Feb 2025 11:53:10 -0500
X-Gm-Features: AWEUYZlnq5SWYMq0W8Wtx8_gV8oE6jI4f_XCC4fWZ0NXKTJTv_1uIYIyKaB7JkM
Message-ID: <CAJ-ks9mck4DzX+WANxKSmcN=mP9ztgwWETXLmX_F-gy=EhmLNg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] printf: convert self-test to KUnit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Petr Mladek <pmladek@suse.com>, Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 11:02=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 14, 2025 at 04:35:12PM +0100, Petr Mladek wrote:
> > On Mon 2025-02-10 13:23:21, Tamir Duberstein wrote:
> > > This is one of just 3 remaining "Test Module" kselftests (the others
> > > being bitmap and scanf), the rest having been converted to KUnit.
> > >
> > > I tested this using:
> > >
> > > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=
=3D1 printf
> > >
> > > I have also sent out a series converting scanf[0].
> > >
> > > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-3=
86d7c3ee714@gmail.com/T/#u [0]
> > >
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >
> > I have just quickly tested this before leaving for a week.
> > And I am fine with the result.
>
> Seems reasonable to me. But I want a consensus with Rasmus.

I have a local v4 where I've added the same enhancement as the scanf
patches so that assertions log the line in the top-level test.

I'll wait for Rasmus' reply before sending.
Tamir

