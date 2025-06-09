Return-Path: <linuxppc-dev+bounces-9212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361AAD17D9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 06:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFzY613Rhz2xlL;
	Mon,  9 Jun 2025 14:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749443546;
	cv=none; b=oqcZPbKgXN8jTF/vnKr6e1QclqlB52xVqNZNdfVTq9FeNeNDo4MGV9c9kwkh7ivMhtBI5148StmeV4rrqI78xWCycSJUaBqgc2o/pB2Ws2Vzj6o28UXuBSmHImTXsjE/9CC9hgWU/+HuBzW05FaCU4b6qNw8qmqejX+J1RWBeDD1WVSLyYD7GpHQVOgSFHLVQbQzz4Q87SsFiNciTaBCTj9FJ4GY6uYhXcO5TM1/p+qs5MxdaHKQKIZcOssBKkQtb19isYTaLspEKzC1vh0rzXENGwneld/RJtrKDkzko+7fFAj+dVjbw5G2zWt1Lvl2ayrG70wOrkHpFvvyfPCpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749443546; c=relaxed/relaxed;
	bh=m5xHR0AZSL6WlSbRhwGUtQdKl5MEBJdOu1erk9ww9IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c33j+/V7fRwvh0rmNBPiwRyFK+IXa0GvMSsj1Lyot5jaTpr/oi6CiV6KlzjIr5jaHPsQUX/2mgB3d+niruErn9m0N1zQhEEqub6MrDvB/CaY2pH7TIyz5KSxw/WT6ZpdROZDI2eJYDgna1UJCJPI5C2TMaG8fPp01dF1+T4/yn9Gq+knnRiCNEIishsC6zOhQ5SEhySrHzSXRYazLZIWUMmjiwDRJLdTiRjxhN9523w8qPCAdguURVqfBpJyTmMomHq7n/9s/gyLdvndbfwODRLs9p7hX9zUaHpnRgOv6kZwVSqhgr1E0vxDqF4YvgRjIknBFj3YAf9CUA/NUUnV5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YuriH3Sa; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YuriH3Sa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFzY52M9kz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 14:32:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58E10A4E820
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 04:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE8FC4CEF5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 04:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749443541;
	bh=FdZ5xMRsS8L4kCJzdeb0IexN8j+Z1kdYKkOrW/omX28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YuriH3Sa9tYeBYlGTSaE1WkedTEgEJzMqT11baDtYMf31gTEeg3PB122OHBHdJbfd
	 ZhG+so7etPaoFpdifmKFPn5Tm37WUuUxqOPU3NtfeBqoPXiT2fF6JrwWFnnSPREm2c
	 im4qIyE385UnrkDLN71QwfNQrj7lEb0btVsNMI76FQZ9/EEyzDVzflj5/stpjsYrR1
	 YHTqyYIgPwaNjtzqwa1DAgBns2mrIqa+vnYxXwAONuVbzOMiW3R0/nf8jlOwBwXwMC
	 1DYBNtU3HWys94dIcl9q32i5ZAIg2qYM9c+bE9S8IVyN9Bku9BF5HD/KyilLAqpD5+
	 D8pny3Sr13J2A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55342bca34eso3765468e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Jun 2025 21:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqVAUHQO0FHn/yCKsI1GyX7xfe+3F1OQ3P7qwZ8QKbp83nnYqV5ifT6eGsFFtcHzAzjtdMPh7htT/tO/g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySsZ7g+ZMpnP8Mt7oHo5QBF+L12EwvW85aCduxvPGQeBGMm28W
	l1Ddsba9zV7pxUDKnPjOkbt+OZi6swDZm/5EbBq1+ua7/9SqlwHHm82U+q1Lw7EBrQbBcNIwVD2
	3Rb5fyduALuE1Dsr8i/K6qUkzToJIeeg=
X-Google-Smtp-Source: AGHT+IG/vSoBGoPVnUeGSR5Rgmq9JpmpZbj7EB3bohcDHvEzto0LyLdFDNmCmHJhS0bbAuP7yKY/PQDLMdVpAhRuwqg=
X-Received: by 2002:a05:6512:118c:b0:54e:9066:9af7 with SMTP id
 2adb3069b0e04-55366bea7d1mr2670834e87.27.1749443540466; Sun, 08 Jun 2025
 21:32:20 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250602163302.478765-1-masahiroy@kernel.org> <3cebc3c4-dbaf-41f6-b98d-1d33bea2eeeb@csgroup.eu>
 <CAK7LNAQvRFVOeQhVos1T-R-Uq9ekY9Fo7HS+D=TCZziLo5TpHQ@mail.gmail.com> <8734c9wwvv.fsf@mpe.ellerman.id.au>
In-Reply-To: <8734c9wwvv.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 13:31:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhhw7pg+ymaSdniXwfBbHUoAkOJiwFzuGVRoN01KhHnw@mail.gmail.com>
X-Gm-Features: AX0GCFtPsQFxjuGHywgztAGrisTJf8QTNS_os0tvyIWPeq0FJaSszxBi_gRlGoE
Message-ID: <CAK7LNARhhw7pg+ymaSdniXwfBbHUoAkOJiwFzuGVRoN01KhHnw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 9, 2025 at 10:02=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > On Tue, Jun 3, 2025 at 3:50=E2=80=AFPM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Le 02/06/2025 =C3=A0 18:32, Masahiro Yamada a =C3=A9crit :
> >> > The extra-y syntax is planned for deprecation because it is similar
> >> > to always-y.
> >> >
> >> > When building the boot wrapper, always-y and extra-y are equivalent.
> >> > Use always-y instead.
> >> >
> >> > In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
> >> > keep the current behavior: prom_init_check is skipped when building
> >> > only modular objects.
> >>
> >> I don't understand what you mean.
> >>
> >> CONFIG_PPC_OF_BOOT_TRAMPOLINE is a bool, it cannot be a module.
> >>
> >> prom_init_check is only to check the content of prom_init.o which is
> >> never a module.
> >>
> >> Is always-y to run _after_ prom_init.o is built ?
> >
> > The intent of "make ARCH=3Dpowerpc modules"
> > is to compile objects that are necessary for modules,
> > that is, all built-in objects are skipped.
> >
> > However,
> > always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_init_check
> > would generate prom_init_check regardless,
> > and its prerequisite, prom_init.o as well.
> >
> > With CONFIG_MODULES=3Dy and
> > CONFIG_MODVERSIONS=3Dn,
> > and without ifdef KBUILD_BUILTIN,
> >
> > $ make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu-   modules
> >
> > would result in this:
> >
> >
> >   CC [M]  arch/powerpc/kvm/book3s_xive_native.o
> >   CC [M]  arch/powerpc/kvm/book3s_64_vio.o
> >   LD [M]  arch/powerpc/kvm/kvm.o
> >   CC [M]  arch/powerpc/kvm/book3s_hv.o
> >   AS [M]  arch/powerpc/kvm/book3s_hv_interrupts.o
> >   CC [M]  arch/powerpc/kvm/book3s_64_mmu_hv.o
> >   CC [M]  arch/powerpc/kvm/book3s_64_mmu_radix.o
> >   CC [M]  arch/powerpc/kvm/book3s_hv_nested.o
> >   CC [M]  arch/powerpc/kvm/book3s_hv_tm.o
> >   LD [M]  arch/powerpc/kvm/kvm-hv.o
> >   CC [M]  arch/powerpc/kernel/rtas_flash.o
> >   CC      arch/powerpc/kernel/prom_init.o
> >   PROMCHK arch/powerpc/kernel/prom_init_check
> >   CC [M]  kernel/locking/locktorture.o
> >   CC [M]  kernel/time/test_udelay.o
> >   CC [M]  kernel/time/time_test.o
> >   CC [M]  kernel/backtracetest.o
> >   CC [M]  kernel/torture.o
> >   CC [M]  kernel/resource_kunit.o
> >   CC [M]  kernel/sysctl-test.o
> >   CC [M]  fs/ext4/inode-test.o
> >   LD [M]  fs/ext4/ext4-inode-test.o
> >   CC [M]  fs/fat/namei_vfat.o
> >   LD [M]  fs/fat/vfat.o
> >   CC [M]  fs/fat/fat_test.o
> >   CC [M]  fs/nls/nls_ucs2_utils.o
> >   CC [M]  fs/netfs/buffered_read.o
> >   CC [M]  fs/netfs/buffered_write.o
> > ...
> >
> >
> >
> > You can see these two lines:
> >
> >   CC      arch/powerpc/kernel/prom_init.o
> >   PROMCHK arch/powerpc/kernel/prom_init_check
> >
> > are supposed to be skipped when "make modules",
> > but actually compiled without ifdef.
> >
> > So, I added ifdef KBUILD_BUILTIN to preserve
> > the current behavior.
>
> OK, that makes sense.
>
> I don't really ever build just modules, so I wouldn't notice, but some
> folks probably do.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

No rush for this patch.
Please take it to your ppc tree.
Thank you.

--=20
Best Regards
Masahiro Yamada

