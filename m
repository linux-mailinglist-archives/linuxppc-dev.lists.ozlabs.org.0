Return-Path: <linuxppc-dev+bounces-7296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F0CA6CFE5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Mar 2025 16:35:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLKyZ3K3yz2yMF;
	Mon, 24 Mar 2025 02:35:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742744150;
	cv=none; b=LGyltQurTxObiz3BCdmzYECwLoCJHoO1kcCh8YLGJe7xEo8Pj8e/C835TT3925DIXL1+QTLRAM2Z4PKk7110/SXAueh44Jj5IvIRqMhj+Dt4q/aKKaCCsO8IOf+1B1AvemUyEcsjhUvigngK0rGzmNtOeev3aC1fw2JENZIA0OUlb92vu2TyBQ3jVJuKGQMb6EI1jEru66tnCh8ylKzDzH/4FicCCVlctlpPpSxdvtbc7yaxXUZ8dCWqgivLPpM3Awn4hXgNq50ESX5Y2TmEKQdm1RcgXj7J9pMoSGRv7YLHqUe0TDDEbHyFuD8l4fRP/oz5KpBqS4+OVYOXK69S+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742744150; c=relaxed/relaxed;
	bh=rzGPF+jAuoVNNvZKw8AOUI3kCWKHyeZTsTlWTjdMBUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSaw8f/tPFV73Apw9r/bn6xfJuFEWGuP5niOmYFLfqq3mHtZGqgPdccjG4X3IztPvVQ8cBh9eUWIwTRXvyLti65cz1jItEOM7fp3xeoty+HLLhRyDDyzoA3ts8WdPKKWihq8ZkPxe9frWva++3YTlkuV2kE6EptwDbhWLz1nph0y8YWez1LBWIDm2tXMbtQ4HXpUAdonkuppfdiAZsJSZWWLo1QfNG6UvyRk/F7X0z827UDIDcFyIeohRktZ+phMPxF71Q66zIF4WAxYmvvhcQXtAWvQbHX7Env0O8NH9DXtGHLeyeeGriIco/v/ghwj+kkd7mjlp0fAm9h6CaXNWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YzmqxlQZ; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YzmqxlQZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLKyX6ly8z2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 02:35:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99C145C5AFC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 15:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2156BC4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742744142;
	bh=2N2/cZq9PK/1OD9D7rI0owgZtoMseqZwZPwvsoNCvXg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YzmqxlQZ/kTC9/X6Nbi0GB4G6dV1X5hxISwkHmhgwt+ADGF1rsm2my+JKh4mm7gTO
	 +Wi+rZl6qtd7joIEhSO4JjncVE0ybEAvVK7JCS4uu6Boqvk1pR24pn6AMMZ15HCWIh
	 rKE/PGJWjn9J9RMSeQa2SpYcm0g9hTT/wjdQG2e/2NDeKmx1GP1KD2uen16RiKiwFV
	 JozAfd8P1mxnh01D1tCnXGKy3+fJZSk8nD3yn9ulQ4y6XbpS33orG9bW0i6oV4A5Vr
	 Pf23igPbAiWHiFXd2YZjJAiwLavwGSqTFn703gDMtMv/2QePdOgR+mET98nJCNPmOG
	 uweKQUDjq2hMA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso36723801fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 08:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxBPL0sOylmIDeabXlLA3ZvloFLZRvn6OCJ7ZZxUftI7fx4Pn+DoI4TnWqFOgF14ipVpgwgbDKTA+Lh1E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysqBg2rb7YsEu6NNWJZEVPMPAOTSNbXsPQ0TEMpn0P6zV/k3bB
	NyKS2lBoMUaEmOQx0/8N3mrZndik8TXs2/uAxSfu//K0NVENBds8TXFgypMwqfxPF4NsENQVE11
	W7sCau45p7pBO/sxvyv17AHq88Lg=
X-Google-Smtp-Source: AGHT+IFLcZeXGkTxlRz0UlNugKaJuCUYhZIJxwtZuNGOXiFAM7FV0N99brYUCnXNyXzlAo8JVSr/VCRroadSoUTiddY=
X-Received: by 2002:a2e:be85:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-30d7e2ba306mr36637601fa.26.1742744140424; Sun, 23 Mar 2025
 08:35:40 -0700 (PDT)
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
 <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net>
In-Reply-To: <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 23 Mar 2025 16:35:29 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHAktbQ-605wfqXCWtn8bP-yEv8sYKWAykajeAX2m1hEA@mail.gmail.com>
X-Gm-Features: AQ5f1JoDr3TNnxKgMP4guUoXVQFse2BD4z6mD7wYVwiWtnHwnC7PDo4J2TBYgEQ
Message-ID: <CAMj1kXHAktbQ-605wfqXCWtn8bP-yEv8sYKWAykajeAX2m1hEA@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] lib/crc_kunit.c: add KUnit test suite for CRC
 library functions
To: Guenter Roeck <linux@roeck-us.net>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>, Vinicius Peixoto <vpeixoto@lkcamp.dev>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 22 Mar 2025 at 15:33, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Sun, Dec 01, 2024 at 05:20:52PM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Add a KUnit test suite for the crc16, crc_t10dif, crc32_le, crc32_be,
> > crc32c, and crc64_be library functions.  It avoids code duplication by
> > sharing most logic among all CRC variants.  The test suite includes:
> >
> > - Differential fuzz test of each CRC function against a simple
> >   bit-at-a-time reference implementation.
> > - Test for CRC combination, when implemented by a CRC variant.
> > - Optional benchmark of each CRC function with various data lengths.
> >
> > This is intended as a replacement for crc32test and crc16_kunit, as well
> > as a new test for CRC variants which didn't previously have a test.
> >
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> > Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> ...
> > +
> > +             nosimd = rand32() % 8 == 0;
> > +
> > +             /*
> > +              * Compute the CRC, and verify that it equals the CRC computed
> > +              * by a simple bit-at-a-time reference implementation.
> > +              */
> > +             expected_crc = crc_ref(v, init_crc, &test_buffer[offset], len);
> > +             if (nosimd)
> > +                     local_irq_disable();
> > +             actual_crc = v->func(init_crc, &test_buffer[offset], len);
> > +             if (nosimd)
> > +                     local_irq_enable();
>
> This triggers a traceback on some arm systems.
>
> [    7.810000]     ok 2 crc16_benchmark # SKIP not enabled
> [    7.810000] ------------[ cut here ]------------
> [    7.810000] WARNING: CPU: 0 PID: 1145 at kernel/softirq.c:369 __local_bh_enable_ip+0x118/0x194
> [    7.810000] Modules linked in:
> [    7.810000] CPU: 0 UID: 0 PID: 1145 Comm: kunit_try_catch Tainted: G                 N 6.14.0-rc7-00196-g88d324e69ea9 #1
> [    7.810000] Tainted: [N]=TEST
> [    7.810000] Hardware name: NPCM7XX Chip family
> [    7.810000] Call trace:
> [    7.810000]  unwind_backtrace from show_stack+0x10/0x14
> [    7.810000]  show_stack from dump_stack_lvl+0x7c/0xac
> [    7.810000]  dump_stack_lvl from __warn+0x7c/0x1b8
> [    7.810000]  __warn from warn_slowpath_fmt+0x19c/0x1a4
> [    7.810000]  warn_slowpath_fmt from __local_bh_enable_ip+0x118/0x194
> [    7.810000]  __local_bh_enable_ip from crc_t10dif_arch+0xd4/0xe8
> [    7.810000]  crc_t10dif_arch from crc_t10dif_wrapper+0x14/0x1c
> [    7.810000]  crc_t10dif_wrapper from crc_main_test+0x178/0x360
> [    7.810000]  crc_main_test from kunit_try_run_case+0x78/0x1e0
> [    7.810000]  kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
> [    7.810000]  kunit_generic_run_threadfn_adapter from kthread+0x118/0x254
> [    7.810000]  kthread from ret_from_fork+0x14/0x28
> [    7.810000] Exception stack(0xe3651fb0 to 0xe3651ff8)
> [    7.810000] 1fa0:                                     00000000 00000000 00000000 00000000
> [    7.810000] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    7.810000] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    7.810000] irq event stamp: 29
> [    7.810000] hardirqs last  enabled at (27): [<c037875c>] __local_bh_enable_ip+0xb4/0x194
> [    7.810000] hardirqs last disabled at (28): [<c0b09684>] crc_main_test+0x2e4/0x360
> [    7.810000] softirqs last  enabled at (26): [<c032a3ac>] kernel_neon_end+0x0/0x1c
> [    7.810000] softirqs last disabled at (29): [<c032a3c8>] kernel_neon_begin+0x0/0x70
> [    7.810000] ---[ end trace 0000000000000000 ]---
> [    8.050000]     # crc_t10dif_test: pass:1 fail:0 skip:0 total:1
>
> kernel_neon_end() calls local_bh_enable() which apparently conflicts with
> the local_irq_disable() in above code.
>

This seems to be an oversight on my part. Can you try the below please?

diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
index 82191dbd7e78..56ddbd3c4997 100644
--- a/arch/arm/include/asm/simd.h
+++ b/arch/arm/include/asm/simd.h
@@ -4,5 +4,6 @@

 static __must_check inline bool may_use_simd(void)
 {
-       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq();
+       return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
+              !in_hardirq() && !irqs_disabled();
 }

However, this test code also appears to assume that SIMD is forbidden
on any architecture when IRQs are disabled, but this not guaranteed.

