Return-Path: <linuxppc-dev+bounces-6204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2DA367CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 22:52:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yvm4B02wjz2xSZ;
	Sat, 15 Feb 2025 08:52:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739569945;
	cv=none; b=GaARn2C6jR0XX+ku75Y5jfu1XrDRaEV0zN8iDfUARxzZnXbzzXx4O5gprSS5beFQZmaonJk+wvo/HcWXs8f51xZv6G+DZQGz790m1gUZXTiOXJq+yvyw3eZ1pOJ7stg9QRb4xzEZYycDMfpJg3Ic1eRTlenIrZCskRoHCij0uNgjQbGXdICUNWWircFuEZ+WmJsB5xlKR59pPHGF0/8MQSVS812wyOzCGz1+aUEtCIc9VlVFwT/mOSEqvr5W7FkIQXgfXfiQ/ObYWfyJNMOPFK5g3S7wkUrBkC3odoxQ6rTYwR2dCBgiYZirLM3GVZaeUjs/YdrDDCqUVEvWO0pcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739569945; c=relaxed/relaxed;
	bh=JRqlyd6oGO0KdHznSNNqTI/AEXRx3zHfr08E+Px4USU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFNWrzGnLg6ORzHFhFXK4EF4k6Ng459TzCvW1uPnursrC7GwWp3iYXvDtkI2ipJZSMh+Wv5cVWl9IRtACHlYN8XpTQT/YYgak5DuyzaXBj5UwWCJVCuu1ViL1Ko3Xp0OBD70rt/V/C2A9ydMsS/+G7jIuM0pMF1v2NJp21maZg0EF6HIrUjPAr7sOzii0x5n1i7Yi8+k+zAPj30XqJ9zmpdUHIAIQQpIlnnZ4C8jDOmxitGNuf5e1/dynDk5WmDmai+KrXJoxne4blkNB3cE6HHsMxZJhHkwS108Ix5ch1JlSPjVpqGr/oibION/fAwaC4rJGtR4RGR2jgqBK/0HyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OfECGVHq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OfECGVHq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yvm48322jz2xS6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 08:52:23 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-308e9ff235bso21753201fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739569940; x=1740174740; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRqlyd6oGO0KdHznSNNqTI/AEXRx3zHfr08E+Px4USU=;
        b=OfECGVHqgDloxsCQi4PiQmYht0bTiKJBqVqoV6pz0DnDV0VC9e3qDRsqg0gkgMtYmC
         pGvfBJ9JCcENP3uoW0XOtCpOO0lbXm1mPgn8+4teCLuUiuJF11wRKQgDUYCZyJ0ml9gl
         zEwWc6r0csnax3z8Ujoz3xPU1inCVibO8evw+Qk87+WnkK2g3J8ndM+enFhn+OQDScdM
         ogmL+62ShudcuEA3DaF+lgvmu6sMuatX4Ab9PvqYkF6MuEqglSXknkKPgI8lA+P4mANX
         Xmv/QnfAiMPzf4cBbTTpX0WnRi6Yj9krPpImsz+y5+guCYCAOswluBstbBSFDOWZ+yxV
         uvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739569940; x=1740174740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRqlyd6oGO0KdHznSNNqTI/AEXRx3zHfr08E+Px4USU=;
        b=vLt75m1hRGIu3ML4oH6EkoVfVpRFXVkCe40HvE+ut4TpCXXng3Op+knmKQQr0b2kDL
         0lhWvkDmh0QZcBqF6OUD/jR7KX38NbPKy7LwVAmcK5XNg4TXUe/1ick6XIkL25kwRh/b
         hCn7V8MWoIiKNTvp8gXCzHR1fIpuTDssx4s951+1gLt0MaaJL8gRbP9JOFM4/jUPJt70
         auctamWVagqM1Ow8Ow0SG3ruFEplDe/pW8areKRroAoOw6AJJhTJ7ZMZ2IxzaiLSh+oe
         8/NeI/zIn7n/Vbdx5gubvfvRPkePKti79i3wYoPm/vmi0pDlmYdKrayJp1jnOq1C51oc
         R0SA==
X-Forwarded-Encrypted: i=1; AJvYcCX+FC73PVEg2ytVZj3W7aZuP8pfolrz2Badq7AYr2BTX1FNzr0YXWOyiIk0+CgioxjkqPr2ALwXkKPwkaU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKUeWsXNYkAyk4dfe8tz2y6Het450sKs3c7MihM8aZjCTpmbzf
	19PDprOJ+O/lykLUBjf63RY0bXLr+MiBZ1B5BlLxSVgfsufdrZgfdbP3FpyVyvCGrfjLXkwhTXB
	h80+rNhbeCwWiZ7WOlok69nC3K+g=
X-Gm-Gg: ASbGncugcl4abycdHNpfMzIi95L57Qzbhbxv0ckVvv/rJyLCtRZJIaWG5eeQvxFqx5h
	NrTRK3GiFiGGE+tZxYqCf054H+ADHz31DLGxqxeViHi+u9jj7me5duz+DsACExSmsSEZBQiHtMY
	ISKKbIi0bTGjm9/7cdx2VZVRdZ6Rle6l8=
X-Google-Smtp-Source: AGHT+IHSpHMu+d9yxfeM9fhEh2exQCFb02zAuHKSY+JxD0Uew6ExTEbIBTjpVBPP5XMmM53Pc3kzV0IcmY9YkC9NKA4=
X-Received: by 2002:a2e:95c4:0:b0:308:ee65:7f4e with SMTP id
 38308e7fff4ca-309279505ddmr4289291fa.0.1739569939469; Fri, 14 Feb 2025
 13:52:19 -0800 (PST)
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
 <CAJ-ks9mck4DzX+WANxKSmcN=mP9ztgwWETXLmX_F-gy=EhmLNg@mail.gmail.com> <CAKwiHFjnY-c01rvkzNRz=h=L-AxRMyUtp2G0b17akF82tAOHQg@mail.gmail.com>
In-Reply-To: <CAKwiHFjnY-c01rvkzNRz=h=L-AxRMyUtp2G0b17akF82tAOHQg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 14 Feb 2025 16:51:43 -0500
X-Gm-Features: AWEUYZlIzjGDNjdcMbGasiSVuX4TBnRVStLmaQbB724z7yxjnP4i1AoyHu0JSSg
Message-ID: <CAJ-ks9=T7JJ2W4+fDKeysQ9QOtquMHoGwYU3g8a-A2OJrgL9Sg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] printf: convert self-test to KUnit
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
	Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
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

On Fri, Feb 14, 2025 at 4:47=E2=80=AFPM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On Fri, 14 Feb 2025 at 17:53, Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > On Fri, Feb 14, 2025 at 11:02=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Feb 14, 2025 at 04:35:12PM +0100, Petr Mladek wrote:
>
> > > > I have just quickly tested this before leaving for a week.
> > > > And I am fine with the result.
> > >
>
> Thanks, Petr, for demonstrating how it looks in a failure case.
>
> > > Seems reasonable to me. But I want a consensus with Rasmus.
> >
> > I have a local v4 where I've added the same enhancement as the scanf
> > patches so that assertions log the line in the top-level test.
> >
> > I'll wait for Rasmus' reply before sending.
>
> I think all my concerns are addressed, with the lines printed in case
> of error telling what is wrong and not that memcmp() evaluating to 1
> instead of 0, and with the final free-form comment including that "ran
> 448 tests". If you feel that word is confusing when there's
> "obviously" only 28 "test" being done, feel free to change that to
> "did 448 checks" or "did 448 individual checks" any other better
> wording.
>
> Rasmus

Personally, I don't feel strongly about this wording, so I'm hewing
close to the original:

    ....
    ok 25 flags
    ok 26 errptr
    ok 27 fwnode_pointer
    ok 28 fourcc_pointer
    # printf: ran 448 tests
# printf: pass:28 fail:0 skip:0 total:28
# Totals: pass:28 fail:0 skip:0 total:28
ok 1 printf

I'll send v4 momentarily. Thanks, all!

