Return-Path: <linuxppc-dev+bounces-7301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22295A6D091
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Mar 2025 19:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLPhb12Pcz2ySJ;
	Mon, 24 Mar 2025 05:23:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742754239;
	cv=none; b=UDTbR3REz6yhzDoCZYLeHwZleP1klJCyyRUO8Zp8b9hmIURmLRWpQW5mpFmfLfldFYbtAWmQaskJIRRBZWpUVXkwCcP79Mr4t3LzrFg4EESrtXNrXVgLCUfZPx9IhQ2YE6pFXMOVCnTBU3ElTM+sQFVm3xhuWHH7dP6B2vFQFIUz6In+yMDIczi3dUpMdvf6F0PD3upA0hxnAVmi+A3vKYgQq3JvDjXlYJB1C5cS8nvn75CY1xzZbZ9jmt52RKEZU0TdCs5um83DAQdT2OpKtecXdhoDafNT3cX9hMI44M9Tmte4ApHSWtyFcKFTrzabbtFx8ROVbYROCFpDl5aLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742754239; c=relaxed/relaxed;
	bh=+Let4Q3el9jM1Xi0HwmGhei27/6Q/PCmg+tofSw5IIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cx3bLBsaDZtx6UqoQ1ZTSheBN9au7JE9m8YZ8qBDDCY6mz7yq2W4Qs1GhvVhbDRmJjcP8s5/TtRSaMX0eVH6wvLtIAf1eQuS0hl7COilxb8P7e2PG8d6hK3sRy5Ry+YoSQYkkPk3X9+IviA0j3NButLA1oE67IuxIBK98l/2MSTvVZVCpt5dgE3VxihF6k8QssdgxAbmfHT6kAALeBuMj9yUfJIKwAlH9wzQmDZIc9pbp+rNmEEvHK6dfZrqv6ZswDhdwGoZ5ELXIO07OPPov/k4oSPEf++7k+HGUMnffub2+1CTusoxPsMiEt4z7AX/k3myJcOm/OQ4x94u1JEfQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aOA/7Nht; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aOA/7Nht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 386 seconds by postgrey-1.37 at boromir; Mon, 24 Mar 2025 05:23:58 AEDT
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLPhZ0jJ4z2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 05:23:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3A3E40BE5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 18:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57ADC4CEF0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742753847;
	bh=DnwlcnrmTvJn4x6Jhu4lPS5Jhc5VMN4fOZX67Zowe28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aOA/7NhtL5afDUxB+Zhh+QBnY+LwpQJbqtjSH6/f0XKI9u9yHS8Fy6dZOGSGOBDNF
	 Yo7o8R4WnRz3l9p/NdlRFPj5rCCzvDr7BSyHE2zABYhWGBbsYGCg3fFo3QgFJxIptJ
	 qGtyvOPq+jpo8Za7Ta5jL8YhzOt+K0JyPYIICFlTcmq/Wpj09RtsURrtf5atD7v9Gs
	 SBeOElN9wucBbLZI2M2JpI2QYkbM4EUeFPaE3LBQm54IPWgvKnLJ1jSVoWX+aMelBf
	 g/YJzRe3VkQ9c+cbty53T19yVHaBjH61CmhXB+p0Wf9DE7+gClaACxKKt0cwGXIX2p
	 lE9e5dA4IxG/Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30762598511so41257361fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 11:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLUX2ANtrQf4MLh0nE8fLRyoG+mVK+yWtF5bd2t+Loyz3iMn826sW+AQ2w9ccFAP+hUMuyBZgOYfL/nqI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyX11rcmxbCnZdsaC8NB+FEhirt1LIuvtsN5lzbu9NI7OorQE0H
	q6/WBiXZI3jJjqIrrESbc9gdlq0AbQvsseW28zfN0g9X+H2G0otE0kdbbj+dobihLnZ3uFQTZub
	IbQUrhlShMIjD0z3EI2U9hC9CuaA=
X-Google-Smtp-Source: AGHT+IETHfg8ib2tQB5DP02LtHyjTXmPdsydvih0XDlfjgyQtoziDZQMtCctILBs1DwoARqUA+qqI6epKDqy+wlyiFE=
X-Received: by 2002:a05:6512:1598:b0:549:5769:6ad8 with SMTP id
 2adb3069b0e04-54ad6470a7dmr3513782e87.4.1742753846190; Sun, 23 Mar 2025
 11:17:26 -0700 (PDT)
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
References: <20241202012056.209768-1-ebiggers@kernel.org> <20241202012056.209768-9-ebiggers@kernel.org>
 <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net> <CAMj1kXHAktbQ-605wfqXCWtn8bP-yEv8sYKWAykajeAX2m1hEA@mail.gmail.com>
 <20250323171243.GA852@quark.localdomain>
In-Reply-To: <20250323171243.GA852@quark.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 23 Mar 2025 19:17:14 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGMtpMuiJqwWVuWDhRrb-dXC30Fj0vu0vU=O6-gGR0FWg@mail.gmail.com>
X-Gm-Features: AQ5f1Jq9h71nypQ2vOBZhli703EaGsNLFv7huy-pmiN-c5U6P8ctOyu2HMEj9rU
Message-ID: <CAMj1kXGMtpMuiJqwWVuWDhRrb-dXC30Fj0vu0vU=O6-gGR0FWg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] lib/crc_kunit.c: add KUnit test suite for CRC
 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>, Vinicius Peixoto <vpeixoto@lkcamp.dev>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 23 Mar 2025 at 18:12, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sun, Mar 23, 2025 at 04:35:29PM +0100, Ard Biesheuvel wrote:
> > On Sat, 22 Mar 2025 at 15:33, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Hi,
> > >
> > > On Sun, Dec 01, 2024 at 05:20:52PM -0800, Eric Biggers wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Add a KUnit test suite for the crc16, crc_t10dif, crc32_le, crc32_be,
> > > > crc32c, and crc64_be library functions.  It avoids code duplication by
> > > > sharing most logic among all CRC variants.  The test suite includes:
> > > >
> > > > - Differential fuzz test of each CRC function against a simple
> > > >   bit-at-a-time reference implementation.
> > > > - Test for CRC combination, when implemented by a CRC variant.
> > > > - Optional benchmark of each CRC function with various data lengths.
> > > >
> > > > This is intended as a replacement for crc32test and crc16_kunit, as well
> > > > as a new test for CRC variants which didn't previously have a test.
> > > >
> > > > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > > > Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> > > > Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > ...
> > > > +
> > > > +             nosimd = rand32() % 8 == 0;
> > > > +
> > > > +             /*
> > > > +              * Compute the CRC, and verify that it equals the CRC computed
> > > > +              * by a simple bit-at-a-time reference implementation.
> > > > +              */
> > > > +             expected_crc = crc_ref(v, init_crc, &test_buffer[offset], len);
> > > > +             if (nosimd)
> > > > +                     local_irq_disable();
> > > > +             actual_crc = v->func(init_crc, &test_buffer[offset], len);
> > > > +             if (nosimd)
> > > > +                     local_irq_enable();
> > >
> > > This triggers a traceback on some arm systems.
> > >
> > > [    7.810000]     ok 2 crc16_benchmark # SKIP not enabled
> > > [    7.810000] ------------[ cut here ]------------
> > > [    7.810000] WARNING: CPU: 0 PID: 1145 at kernel/softirq.c:369 __local_bh_enable_ip+0x118/0x194
> > > [    7.810000] Modules linked in:
> > > [    7.810000] CPU: 0 UID: 0 PID: 1145 Comm: kunit_try_catch Tainted: G                 N 6.14.0-rc7-00196-g88d324e69ea9 #1
> > > [    7.810000] Tainted: [N]=TEST
> > > [    7.810000] Hardware name: NPCM7XX Chip family
> > > [    7.810000] Call trace:
> > > [    7.810000]  unwind_backtrace from show_stack+0x10/0x14
> > > [    7.810000]  show_stack from dump_stack_lvl+0x7c/0xac
> > > [    7.810000]  dump_stack_lvl from __warn+0x7c/0x1b8
> > > [    7.810000]  __warn from warn_slowpath_fmt+0x19c/0x1a4
> > > [    7.810000]  warn_slowpath_fmt from __local_bh_enable_ip+0x118/0x194
> > > [    7.810000]  __local_bh_enable_ip from crc_t10dif_arch+0xd4/0xe8
> > > [    7.810000]  crc_t10dif_arch from crc_t10dif_wrapper+0x14/0x1c
> > > [    7.810000]  crc_t10dif_wrapper from crc_main_test+0x178/0x360
> > > [    7.810000]  crc_main_test from kunit_try_run_case+0x78/0x1e0
> > > [    7.810000]  kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
> > > [    7.810000]  kunit_generic_run_threadfn_adapter from kthread+0x118/0x254
> > > [    7.810000]  kthread from ret_from_fork+0x14/0x28
> > > [    7.810000] Exception stack(0xe3651fb0 to 0xe3651ff8)
> > > [    7.810000] 1fa0:                                     00000000 00000000 00000000 00000000
> > > [    7.810000] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > > [    7.810000] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > > [    7.810000] irq event stamp: 29
> > > [    7.810000] hardirqs last  enabled at (27): [<c037875c>] __local_bh_enable_ip+0xb4/0x194
> > > [    7.810000] hardirqs last disabled at (28): [<c0b09684>] crc_main_test+0x2e4/0x360
> > > [    7.810000] softirqs last  enabled at (26): [<c032a3ac>] kernel_neon_end+0x0/0x1c
> > > [    7.810000] softirqs last disabled at (29): [<c032a3c8>] kernel_neon_begin+0x0/0x70
> > > [    7.810000] ---[ end trace 0000000000000000 ]---
> > > [    8.050000]     # crc_t10dif_test: pass:1 fail:0 skip:0 total:1
> > >
> > > kernel_neon_end() calls local_bh_enable() which apparently conflicts with
> > > the local_irq_disable() in above code.
> > >
> >
> > This seems to be an oversight on my part. Can you try the below please?
> >
> > diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
> > index 82191dbd7e78..56ddbd3c4997 100644
> > --- a/arch/arm/include/asm/simd.h
> > +++ b/arch/arm/include/asm/simd.h
> > @@ -4,5 +4,6 @@
> >
> >  static __must_check inline bool may_use_simd(void)
> >  {
> > -       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq();
> > +       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
> > +              !in_hardirq() && !irqs_disabled();
> >  }
>
> Thanks Ard, you beat me to it.  Yes, may_use_simd() needs to be consistent with
> kernel_neon_begin().  On x86 there is a case where the equivalent function is
> expected to work when irqs_disabled(), but if there is no such case on arm this
> fix looks good.  Can you send it out as a formal patch?  Presumably for the arm
> maintainer to pick up.
>

Sure.

On other architectures, we might just turn this logic around, and only
disable softirqs when IRQs are enabled, as otherwise, there is no
need: we don't care about whether or not IRQs are disabled, only the
softirq plumbing that we need to call into does, and no softirqs can
be delivered over the back of a hard IRQ when those are disabled to
begin with.

> > However, this test code also appears to assume that SIMD is forbidden
> > on any architecture when IRQs are disabled, but this not guaranteed.
>
> Yes, to reliably test the no-SIMD code paths, I need to finish refactoring the
> crypto_simd_disabled_for_test stuff to be disentangled from the crypto subsystem
> so that crc_kunit.c can use it.  It's on my list of things to do, and I'm
> planning to get it done in 6.16.  Disabling hardirqs is just a trick to get
> there more easily on some architectures.  But as this shows it's a useful test
> to have anyway, so we'll want to keep that too.  The CRC functions need to work
> in any context, and any context that we can easily test we should do so.
>

Sounds good.

