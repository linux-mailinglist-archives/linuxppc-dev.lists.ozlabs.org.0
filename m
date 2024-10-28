Return-Path: <linuxppc-dev+bounces-2645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C40919B37B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 18:34:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcgVY5W2Fz2xHt;
	Tue, 29 Oct 2024 04:34:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730136853;
	cv=none; b=P1GKzYS98ejyKXODnFd248xYV0jluoZNS4YHNmhLRgoZhfndSOUFnDIZvNSqW22JAaXWO+fV/6/kxZP2LDnb7huYJi/DbffICcsoCl8AOb8iCj8HZcdVIibJsOo2pxPrnzMCcqyX3CU+Y8t5a5sL/28v8pyx2o57pTNhDgH4OocuZq4ZjZnZO+aVLwM/M3bq43fyYvl164vpN9mIdv6N3mxYJ4uVnT2b6YKoF1UoyfVSXbmjNvjLwcLYCm7hY0PpEBPiIyqcgULjCnUjQsMZIfr8+uSTKYuF+SP1MmEN9Cm7TBrc9x6w+08dFpx+fd12r2RRIuXwncyqdt4Tgamu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730136853; c=relaxed/relaxed;
	bh=o2qaK69S8d1ir0mooHfux1HV+2f4k5U8+ZmSB4W8X3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqDyfZ3HC4/3bWx5aZB9IaCWKTaGBUhn8u4OhM0ClaNwWYZOAe1l692DNEOkt62y71nhtrDhBEs1q7o13Lv/O0HhWtesXh0wSo5Jmi1RWNQixkjHvAhf+im8wIrOX6hfSr4f1zrxz83BeP2/zGIJQ+y7/uNoJc0ms1sJkd7VOubaMcUFIU/aOWXZa9YHVDmuZgM+NZgAD5jsGgJhgiR9LXuzchJhCjipPKnhArOoFN6Z41pg+7IaWo6tjmjsrLUNJSzCnAwnZwi0bwPizOno25TikzS0ReJ6ipxSclx7z8QxYo5zxWDj3dUYp4WYEIxKgN4jG1lsvli583+0JZKAiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2N8Pbhz; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2N8Pbhz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcgVX3W9qz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 04:34:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F259A42A7C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 17:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91B4C4CEEA
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730136847;
	bh=pcLLhLxlquE4QPOlWW4Lr1bb5MuHYN7k6DZdbDCx9DQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N2N8PbhzCFAC8L9B/R+n6LS/2Vz3FY30Fm8hWgEopytD1knoRkeGPQKL3kqI2YZh4
	 N66V/nX5SYYKx1XlmynUto9sGLWOvhBEmg5rJSntmjzIwGDKa6y6pQ5CqfVhu6ox3z
	 XXy4qMSqLoaPINE/LE66ohBgCVuwypgcmHq7aI6zsMGsZnZ0NSH6AbSvbsTjET7iO5
	 tM6H9w8I9wRriKG8/z+JwgusAW1OG4vSksb8DGG2Dt3CZPSWdvjdM4zjviLYwYBMsG
	 60iDnfcMYPZgh5mphm7YYFd/flxuIVSEHd35xe9nF7CCH1OilerJX6R47wN1hlmM2E
	 GJMGejqlT3Efw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e6c754bdso4078001e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 10:34:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAykah1JcygKAt/ZEIomiiRda8vqjIo1qhMWW+Tc2L5Aas0l6kmC+pZDGnz+J7GTN1ZmPcqRerL0kigMk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBEfDEwIzB3g8bVKWnsjeY6MoWhcZ50nObl7xHQrb8KnLSZbKY
	6p/QzAYPvN7d4rQFccrkyUDKxalSIMJ36Z68FSP2WbswAjVbnSY7bQ2NkGoPq4I/34TDxMrRn0U
	co5UoE/ll5+SeEQqUK+b+0D0izg==
X-Google-Smtp-Source: AGHT+IF5IETAXGDmlx+LAKug+dwz64NqnsL1okXnnGJyl9RYKmQIgXl4x3+ziMcKV48JBCGh1PNtcevuXjcqmWy53WY=
X-Received: by 2002:a05:6512:224e:b0:539:e85c:c888 with SMTP id
 2adb3069b0e04-53b34a1900emr4148343e87.40.1730136845913; Mon, 28 Oct 2024
 10:34:05 -0700 (PDT)
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
References: <20241023171426.452688-1-usamaarif642@gmail.com> <20241028154054.GE2484@willie-the-truck>
In-Reply-To: <20241028154054.GE2484@willie-the-truck>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Oct 2024 12:33:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK=cbknmjKa-rtr9vPhaOoYf26KNzvQ0uGabOwy19jcCA@mail.gmail.com>
Message-ID: <CAL_JsqK=cbknmjKa-rtr9vPhaOoYf26KNzvQ0uGabOwy19jcCA@mail.gmail.com>
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
To: Will Deacon <will@kernel.org>
Cc: Usama Arif <usamaarif642@gmail.com>, mark.rutland@arm.com, leitao@debian.org, 
	catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net, 
	saravanak@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 28, 2024 at 10:41=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Wed, Oct 23, 2024 at 06:14:26PM +0100, Usama Arif wrote:
> >  __pa() is only intended to be used for linear map addresses and using
> > it for initial_boot_params which is in fixmap for arm64 will give an
> > incorrect value. Hence save the physical address when it is known at
> > boot time when calling early_init_dt_scan for arm64 and use it at kexec
> > time instead of converting the virtual address using __pa().
> >
> > Reported-by: Breno Leitao <leitao@debian.org>
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()"=
)
> > ---
> > v1 -> 2:
> > - pass dt_phys in early_init_dt_scan instead of creating
> >   anorther arch->dt function (Rob Herring)
> > ---
> >  arch/arc/kernel/devtree.c              |  2 +-
> >  arch/arm/kernel/devtree.c              |  2 +-
> >  arch/arm64/kernel/setup.c              |  6 +++++-
> >  arch/csky/kernel/setup.c               |  4 ++--
> >  arch/loongarch/kernel/setup.c          |  2 +-
> >  arch/microblaze/kernel/prom.c          |  2 +-
> >  arch/mips/kernel/prom.c                |  2 +-
> >  arch/mips/kernel/relocate.c            |  2 +-
> >  arch/nios2/kernel/prom.c               |  4 ++--
> >  arch/openrisc/kernel/prom.c            |  2 +-
> >  arch/powerpc/kernel/dt_cpu_ftrs.c      |  2 +-
> >  arch/powerpc/kernel/prom.c             |  2 +-
> >  arch/powerpc/platforms/pseries/plpks.c |  2 +-
> >  arch/riscv/kernel/setup.c              |  2 +-
> >  arch/sh/kernel/setup.c                 |  2 +-
> >  arch/um/kernel/dtb.c                   |  2 +-
> >  arch/x86/kernel/devicetree.c           |  2 +-
> >  arch/xtensa/kernel/setup.c             |  2 +-
> >  drivers/of/fdt.c                       | 14 ++++++++------
> >  drivers/of/kexec.c                     |  2 +-
> >  include/linux/of_fdt.h                 |  5 +++--
> >  21 files changed, 36 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> > index 4c9e61457b2f..cc6ac7d128aa 100644
> > --- a/arch/arc/kernel/devtree.c
> > +++ b/arch/arc/kernel/devtree.c
> > @@ -62,7 +62,7 @@ const struct machine_desc * __init setup_machine_fdt(=
void *dt)
> >       const struct machine_desc *mdesc;
> >       unsigned long dt_root;
> >
> > -     if (!early_init_dt_scan(dt))
> > +     if (!early_init_dt_scan(dt, __pa(dt)))
> >               return NULL;
> >
> >       mdesc =3D of_flat_dt_match_machine(NULL, arch_get_next_mach);
> > diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> > index fdb74e64206a..3b78966e750a 100644
> > --- a/arch/arm/kernel/devtree.c
> > +++ b/arch/arm/kernel/devtree.c
> > @@ -200,7 +200,7 @@ const struct machine_desc * __init setup_machine_fd=
t(void *dt_virt)
> >
> >       mdesc_best =3D &__mach_desc_GENERIC_DT;
> >
> > -     if (!dt_virt || !early_init_dt_verify(dt_virt))
> > +     if (!dt_virt || !early_init_dt_verify(dt_virt, __pa(dt_virt)))
> >               return NULL;
> >
> >       mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mach=
);
> > diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> > index b22d28ec8028..177262739c49 100644
> > --- a/arch/arm64/kernel/setup.c
> > +++ b/arch/arm64/kernel/setup.c
> > @@ -175,7 +175,11 @@ static void __init setup_machine_fdt(phys_addr_t d=
t_phys)
> >       if (dt_virt)
> >               memblock_reserve(dt_phys, size);
> >
> > -     if (!dt_virt || !early_init_dt_scan(dt_virt)) {
> > +     /*
> > +      * dt_virt is a fixmap address, hence __pa(dt_virt) can't be used=
.
> > +      * Pass dt_phys directly.
> > +      */
> > +     if (!dt_virt || !early_init_dt_scan(dt_virt, dt_phys)) {
>
> nit: It looks like early_init_dt_verify() will now return false if
> !dt_virt, so we can drop the additional check here.

That was true before, but I'll fix this up when applying.

Rob

