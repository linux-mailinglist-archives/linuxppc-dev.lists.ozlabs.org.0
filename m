Return-Path: <linuxppc-dev+bounces-2644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 068309B3524
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 16:41:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xcd043HZrz2xjH;
	Tue, 29 Oct 2024 02:41:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730130068;
	cv=none; b=EWU1Re1NXVQPsy+EL2Qqmnjw5cs4TO4L8CaW9kQeMVLVpDzRUy9rlO/7STYbB0xUjSqVvToMx/Vu+X4GQ/Hrhiggur6EXs6Yk4O56iX0nW8QLlxWWNYJlpuk0XyCz1uJlbdcfnmK7F17D15KsyCaTq0DX87yaIw0AOYWpiCKmCgRtPvvQ4KYbS12VJ526wZamgdn5jWcDfzlaFotpqnpk1ewKyN8aD8wlZtoO93oQ64rHA15fpxEfanPb2pPxJfd4eAsCw0lKjkwsM5uQE1vm2IeSg9sYBw7gOojDp0JWnwhxcuAsff0fgFOjUIjdGiBTfDD33ez1f7+XIGI1NmIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730130068; c=relaxed/relaxed;
	bh=JmodkLtS/XYD6QZM7LmJmXh4F9FYhEXNq73oZR86uq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFe9yQvsaCWFQFg0DEPnrrFkGTGy+c7ka6qi/Ui+MRxMRMuqRKe7EIJ8MYRygi9nHv/iXh+mZRDsBLJuFPx9+HNSx/CePgbQY55m6sUF30FS/NeA4z6dB1Jk14a568iib9FkctCVWbgrbFs7CZSQeK3H83gC6migtzUBe7yFYex5IX6QDtS82ShWAKcSgYO+ubzhpMLffqrZX2dljpaoPzH0zQAZ12OsWGODfVY+YN2Fa9czYD2SCsjp4pyXpvADKayOSyBGrLauDNX2KQJKkZgDVk5cCzgoxsMYOewcyEim+p4dRGk9wq5FjwoR8F0X+mZ9APrEFXhMePgim6JPVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p+bslp5n; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p+bslp5n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xcd012p62z2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 02:41:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3FD25C5B61;
	Mon, 28 Oct 2024 15:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0E1C4CEC3;
	Mon, 28 Oct 2024 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730130062;
	bh=1OnKnskO1uPXHT57ko80fWNSrAKlqsEB3xePdsqM5Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+bslp5nYFB5IdzYlqcPXUe0Deg2tPLvvs4TWlciZJnyPqj4C7msUDWod/mZ74Wbi
	 V+npdeWkLAM2YaCU68ORi88AWKUdk+SexkhRmxohs3rLk/42hVRfWw3lmcgEXhKfmW
	 l+9bfe1QEI3TUsTCQUmiCfe1cOZzdBeIsDmI24fTFiyKZwDu9f4TeXEh9Tmi9Z7A4g
	 RQuSC3lG7y94YkqEIK4qkURF8Scn98uwTY1D6XvZn72zlsfH7cHelHDCN5wkvgpceU
	 yWqXIdxX1dAjLGXoC7cRczTCjM1LzpGhlbBh2ntrVJVtMMwopnozbfMsplC2SfLpCE
	 /bnM2cMZeJadg==
Date: Mon, 28 Oct 2024 15:40:55 +0000
From: Will Deacon <will@kernel.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: robh@kernel.org, mark.rutland@arm.com, leitao@debian.org,
	catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net,
	saravanak@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, loongarch@lists.linux.dev,
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and
 early_init_dt_verify
Message-ID: <20241028154054.GE2484@willie-the-truck>
References: <20241023171426.452688-1-usamaarif642@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023171426.452688-1-usamaarif642@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 23, 2024 at 06:14:26PM +0100, Usama Arif wrote:
>  __pa() is only intended to be used for linear map addresses and using
> it for initial_boot_params which is in fixmap for arm64 will give an
> incorrect value. Hence save the physical address when it is known at
> boot time when calling early_init_dt_scan for arm64 and use it at kexec
> time instead of converting the virtual address using __pa().
> 
> Reported-by: Breno Leitao <leitao@debian.org>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
> ---
> v1 -> 2:
> - pass dt_phys in early_init_dt_scan instead of creating
>   anorther arch->dt function (Rob Herring)
> ---
>  arch/arc/kernel/devtree.c              |  2 +-
>  arch/arm/kernel/devtree.c              |  2 +-
>  arch/arm64/kernel/setup.c              |  6 +++++-
>  arch/csky/kernel/setup.c               |  4 ++--
>  arch/loongarch/kernel/setup.c          |  2 +-
>  arch/microblaze/kernel/prom.c          |  2 +-
>  arch/mips/kernel/prom.c                |  2 +-
>  arch/mips/kernel/relocate.c            |  2 +-
>  arch/nios2/kernel/prom.c               |  4 ++--
>  arch/openrisc/kernel/prom.c            |  2 +-
>  arch/powerpc/kernel/dt_cpu_ftrs.c      |  2 +-
>  arch/powerpc/kernel/prom.c             |  2 +-
>  arch/powerpc/platforms/pseries/plpks.c |  2 +-
>  arch/riscv/kernel/setup.c              |  2 +-
>  arch/sh/kernel/setup.c                 |  2 +-
>  arch/um/kernel/dtb.c                   |  2 +-
>  arch/x86/kernel/devicetree.c           |  2 +-
>  arch/xtensa/kernel/setup.c             |  2 +-
>  drivers/of/fdt.c                       | 14 ++++++++------
>  drivers/of/kexec.c                     |  2 +-
>  include/linux/of_fdt.h                 |  5 +++--
>  21 files changed, 36 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> index 4c9e61457b2f..cc6ac7d128aa 100644
> --- a/arch/arc/kernel/devtree.c
> +++ b/arch/arc/kernel/devtree.c
> @@ -62,7 +62,7 @@ const struct machine_desc * __init setup_machine_fdt(void *dt)
>  	const struct machine_desc *mdesc;
>  	unsigned long dt_root;
>  
> -	if (!early_init_dt_scan(dt))
> +	if (!early_init_dt_scan(dt, __pa(dt)))
>  		return NULL;
>  
>  	mdesc = of_flat_dt_match_machine(NULL, arch_get_next_mach);
> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> index fdb74e64206a..3b78966e750a 100644
> --- a/arch/arm/kernel/devtree.c
> +++ b/arch/arm/kernel/devtree.c
> @@ -200,7 +200,7 @@ const struct machine_desc * __init setup_machine_fdt(void *dt_virt)
>  
>  	mdesc_best = &__mach_desc_GENERIC_DT;
>  
> -	if (!dt_virt || !early_init_dt_verify(dt_virt))
> +	if (!dt_virt || !early_init_dt_verify(dt_virt, __pa(dt_virt)))
>  		return NULL;
>  
>  	mdesc = of_flat_dt_match_machine(mdesc_best, arch_get_next_mach);
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index b22d28ec8028..177262739c49 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -175,7 +175,11 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
>  	if (dt_virt)
>  		memblock_reserve(dt_phys, size);
>  
> -	if (!dt_virt || !early_init_dt_scan(dt_virt)) {
> +	/*
> +	 * dt_virt is a fixmap address, hence __pa(dt_virt) can't be used.
> +	 * Pass dt_phys directly.
> +	 */
> +	if (!dt_virt || !early_init_dt_scan(dt_virt, dt_phys)) {

nit: It looks like early_init_dt_verify() will now return false if
!dt_virt, so we can drop the additional check here.

Will

