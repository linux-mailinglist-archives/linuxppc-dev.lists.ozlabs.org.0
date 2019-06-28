Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5359032
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 04:05:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zg8q5TbrzDqkW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 12:05:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zg705Q6HzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 12:04:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Zg703sPhz9s3Z;
 Fri, 28 Jun 2019 12:04:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sven Schnelle <svens@stackframe.org>, kexec@lists.infradead.org
Subject: Re: [PATCH RFC] generic ELF support for kexec
In-Reply-To: <20190625185433.GA10934@t470p.stackframe.org>
References: <20190625185433.GA10934@t470p.stackframe.org>
Date: Fri, 28 Jun 2019 12:04:11 +1000
Message-ID: <87o92isbxg.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-s390@vger.kernel.org, deller@gmx.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sven,

Sven Schnelle <svens@stackframe.org> writes:
> Hi List,
>
> i recently started working on kexec for PA-RISC. While doing so, i figured
> that powerpc already has support for reading ELF images inside of the Kernel.
> My first attempt was to steal the source code and modify it for PA-RISC, but
> it turned out that i didn't had to change much. Only ARM specific stuff like
> fdt blob fetching had to be removed.
>
> So instead of duplicating the code, i thought about moving the ELF stuff to
> the core kexec code, and exposing several function to use that code from the
> arch specific code.
>
> I'm attaching the patch to this Mail. What do you think about that change?
> s390 also uses ELF files, and (maybe?) could also switch to this implementation.
> But i don't know anything about S/390 and don't have one in my basement. So
> i'll leave s390 to the IBM folks.

It looks mostly OK, a few comments below.

> I haven't really tested PowerPC yet. Can anyone give me a helping hand what
> would be a good target to test this code in QEMU? Or even better, test this
> code on real Hardware?

There's some info on using qemu here:
  https://github.com/linuxppc/wiki/wiki/Booting-with-Qemu

But I'm not sure where you get a version of kexec that uses kexec_file().

We can probably work out those details though.

> If that change is acceptable i would finish the patch and submit it. I think
> best would be to push this change through Helge's parisc tree, so we don't
> have any dependencies to sort out.

That will work for you but could cause us problems if we have any
changes that touch that code.

It's easy enough to create a topic branch with just that patch that both
of us merge.


> diff --git a/arch/Kconfig b/arch/Kconfig
> index c47b328eada0..de7520100136 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -18,6 +18,9 @@ config KEXEC_CORE
>  	select CRASH_CORE
>  	bool
>  
> +config KEXEC_FILE_ELF
> +	bool

We could probably just call it KEXEC_ELF I think? The functions are
called that after all.

> diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/arch/powerpc/kernel/kexec_elf_64.c
> index ba4f18a43ee8..0059e36913e9 100644
> --- a/arch/powerpc/kernel/kexec_elf_64.c
> +++ b/arch/powerpc/kernel/kexec_elf_64.c
> @@ -21,8 +21,6 @@
>   * GNU General Public License for more details.
>   */
>  
> -#define pr_fmt(fmt)	"kexec_elf: " fmt
> -

Please don't remove that, there are still some prints left in this file
that use it.

>  #include <linux/elf.h>
>  #include <linux/kexec.h>
>  #include <linux/libfdt.h>
> @@ -31,540 +29,6 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> -#define PURGATORY_STACK_SIZE	(16 * 1024)

This is unused AFAICS. We should probably remove it explicitly rather
than as part of this patch.

> diff --git a/kernel/kexec_file_elf.c b/kernel/kexec_file_elf.c
> new file mode 100644
> index 000000000000..bb966c93492c
> --- /dev/null
> +++ b/kernel/kexec_file_elf.c
> @@ -0,0 +1,574 @@
> +/*
> + * Load ELF vmlinux file for the kexec_file_load syscall.
> + *
> + * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
> + * Copyright (C) 2004  IBM Corp.
> + * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
> + * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
> + * Copyright (C) 2016  IBM Corporation
> + *
> + * Based on kexec-tools' kexec-elf-exec.c and kexec-elf-ppc64.c.
> + * Heavily modified for the kernel by
> + * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation (version 2 of the License).
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

You shouldn't be adding new license text. Instead remove those two
paragraphs and use a SPDX tag.

If you look at the file in master it already has the tag.

> +
> +#define pr_fmt(fmt)	"kexec_elf: " fmt
> +
> +#include <linux/elf.h>
> +#include <linux/kexec.h>
> +#include <linux/libfdt.h>

You don't need that do you?

> +#include <linux/module.h>
> +#include <linux/of_fdt.h>

Or that.

> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#define elf_addr_to_cpu	elf64_to_cpu

Why are we doing that rather than just using elf64_to_cpu directly?

> +#ifndef Elf_Rel
> +#define Elf_Rel		Elf64_Rel
> +#endif /* Elf_Rel */

And that?



cheers
