Return-Path: <linuxppc-dev+bounces-9210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D247FAD166E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 03:02:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFttJ2F3Hz2yft;
	Mon,  9 Jun 2025 11:02:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749430920;
	cv=none; b=WWca/saxzCoah2vu1gsPN6yrYoV720BT76vhCgjG2gOr2cjgVoheP7FBHNeMMRBMfPBVy7zD6v4Z4bhkbVVUwpUhi+XF0y/1pQubICTUslcmtvZZkgB7O2mIsVCtQNEipoBNUj91Il5/8W3tFIgprAvLBqWlQclGWqjdnbiDjoQoptXf2e5LaHe2ONvW/ZG3+WiPHbq9OHFx8EH031yAtI039mEzXjra3yyZ7iMyKrqSGTgPjkYrbp8dwJcZWVN57T5c/ttrQuFnjE3/nHXUsf1myAih6jBCedJv2LmyAx0Nfvuw6AmlQe1Ni0hwqjRw0ENsVU0QkwgYDp+8vKYoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749430920; c=relaxed/relaxed;
	bh=bM1FuAwutJ/XU9U3yqDnYzeNLS1EQ8LX08NArNTlPK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h1oXNS7dAFhbEUlqC1uiV2TVu2b7XdXaENR/2ZXBn1nE6htHlbEBaNEuYYD0n/6/lS/tivVVcfpfQl9QPh95DnQQYKll5jfkCEZJhoFfoXyLXbpoh3KyUL/ati5j0DYI07oSJ5OvYJt+WvkTFP51N6gCugyVSoei0JKNYnkohD86nF+Bp/9xMT2QxCOl2aN2xFu7I6KCyN5aqtsW+n5hrbvI3r05ZwSGwpzRfSQuMRJFKeCGqgvVBxyN77kvhsgkI9ffHKIjKT1WEWRUrTlVhZGflfMsZCI3v4lFDLFAGzWnDYpNRT2y9Kp0I2s22Dtva6So7QMtOtYmae/3xVGEmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RiLXG88B; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org) smtp.mailfrom=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RiLXG88B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ellerman.id.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFttH4zWyz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 11:01:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1749430919;
	bh=bM1FuAwutJ/XU9U3yqDnYzeNLS1EQ8LX08NArNTlPK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RiLXG88B5CZwIkIRgwxz09WFiVurrmWE2P+aI7lZn5tRpb7TAnmWoze7e3eTwO9Ru
	 jBAU/Ach//d6vDOyUZCtn9qwfUz3fBuGQsFShpgZrfRfBP8ZkMnTPiSjxvzg757f9Y
	 BO0uPE/Ts36SE1uW55Ehh9l+Uzt7YI9FaDgqeLE5F/WorkD+rUsftJoL5C+SXHj+gs
	 +bYwOM2QLO2MLs4xhOB/tBrfw/p9zKasmPkT7H0YGhkg+iBwT5XmJuMlzE/GnX0lfB
	 BhbKUfUzWz9hx26cF3RsY7eRz6KSdFP5w8DhcpLaDZsAuEVGS3XbtShVscQhIHuK2j
	 EqIZAxDyb8ywg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bFttH376Lz4wbv;
	Mon,  9 Jun 2025 11:01:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
In-Reply-To: <CAK7LNAQvRFVOeQhVos1T-R-Uq9ekY9Fo7HS+D=TCZziLo5TpHQ@mail.gmail.com>
References: <20250602163302.478765-1-masahiroy@kernel.org>
 <3cebc3c4-dbaf-41f6-b98d-1d33bea2eeeb@csgroup.eu>
 <CAK7LNAQvRFVOeQhVos1T-R-Uq9ekY9Fo7HS+D=TCZziLo5TpHQ@mail.gmail.com>
Date: Mon, 09 Jun 2025 11:01:56 +1000
Message-ID: <8734c9wwvv.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Tue, Jun 3, 2025 at 3:50=E2=80=AFPM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> Le 02/06/2025 =C3=A0 18:32, Masahiro Yamada a =C3=A9crit :
>> > The extra-y syntax is planned for deprecation because it is similar
>> > to always-y.
>> >
>> > When building the boot wrapper, always-y and extra-y are equivalent.
>> > Use always-y instead.
>> >
>> > In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
>> > keep the current behavior: prom_init_check is skipped when building
>> > only modular objects.
>>
>> I don't understand what you mean.
>>
>> CONFIG_PPC_OF_BOOT_TRAMPOLINE is a bool, it cannot be a module.
>>
>> prom_init_check is only to check the content of prom_init.o which is
>> never a module.
>>
>> Is always-y to run _after_ prom_init.o is built ?
>
> The intent of "make ARCH=3Dpowerpc modules"
> is to compile objects that are necessary for modules,
> that is, all built-in objects are skipped.
>
> However,
> always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_init_check
> would generate prom_init_check regardless,
> and its prerequisite, prom_init.o as well.
>
> With CONFIG_MODULES=3Dy and
> CONFIG_MODVERSIONS=3Dn,
> and without ifdef KBUILD_BUILTIN,
>
> $ make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu-   modules
>
> would result in this:
>
>
>   CC [M]  arch/powerpc/kvm/book3s_xive_native.o
>   CC [M]  arch/powerpc/kvm/book3s_64_vio.o
>   LD [M]  arch/powerpc/kvm/kvm.o
>   CC [M]  arch/powerpc/kvm/book3s_hv.o
>   AS [M]  arch/powerpc/kvm/book3s_hv_interrupts.o
>   CC [M]  arch/powerpc/kvm/book3s_64_mmu_hv.o
>   CC [M]  arch/powerpc/kvm/book3s_64_mmu_radix.o
>   CC [M]  arch/powerpc/kvm/book3s_hv_nested.o
>   CC [M]  arch/powerpc/kvm/book3s_hv_tm.o
>   LD [M]  arch/powerpc/kvm/kvm-hv.o
>   CC [M]  arch/powerpc/kernel/rtas_flash.o
>   CC      arch/powerpc/kernel/prom_init.o
>   PROMCHK arch/powerpc/kernel/prom_init_check
>   CC [M]  kernel/locking/locktorture.o
>   CC [M]  kernel/time/test_udelay.o
>   CC [M]  kernel/time/time_test.o
>   CC [M]  kernel/backtracetest.o
>   CC [M]  kernel/torture.o
>   CC [M]  kernel/resource_kunit.o
>   CC [M]  kernel/sysctl-test.o
>   CC [M]  fs/ext4/inode-test.o
>   LD [M]  fs/ext4/ext4-inode-test.o
>   CC [M]  fs/fat/namei_vfat.o
>   LD [M]  fs/fat/vfat.o
>   CC [M]  fs/fat/fat_test.o
>   CC [M]  fs/nls/nls_ucs2_utils.o
>   CC [M]  fs/netfs/buffered_read.o
>   CC [M]  fs/netfs/buffered_write.o
> ...
>
>
>
> You can see these two lines:
>
>   CC      arch/powerpc/kernel/prom_init.o
>   PROMCHK arch/powerpc/kernel/prom_init_check
>
> are supposed to be skipped when "make modules",
> but actually compiled without ifdef.
>
> So, I added ifdef KBUILD_BUILTIN to preserve
> the current behavior.

OK, that makes sense.

I don't really ever build just modules, so I wouldn't notice, but some
folks probably do.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

