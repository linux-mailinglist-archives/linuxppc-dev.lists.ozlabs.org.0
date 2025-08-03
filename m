Return-Path: <linuxppc-dev+bounces-10535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C0B19501
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 21:27:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bw8pt689Fz2xWc;
	Mon,  4 Aug 2025 05:27:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754249270;
	cv=none; b=ToUMKQMJ8X1aePGZEih+2hc8vD791IsdgwsTEDD1Z18RZAq5GZkw5lWmaU/K73pslqFBQUIi5XPAyvY03ahjuMRzX1/nB8iKkCU+G4GfQCsy9LGxlFjJY26YNzzNZ5gC87wW1sd3M3jHD/S1Axh8BX1icjW/gt4kvDr2PxtaiLq0zlwoSSCAgoVnx9I2ct0VR8wSt1VUJT0AEKwAPEj4YslZsKK8hgJd72ZbJ8ZOt++dlpJ/9EcPx/mLetaELOTjYeOxto12qAQJY9qE+dt69QWk51wz84bClyY6EJkf0JudmP9XmkHbXqmnCqKiE7d/IrdvfNZi7FYPubNX8bx2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754249270; c=relaxed/relaxed;
	bh=RfrqAAo+hh5/BEGgrtHJRzmnixP9YlHQg7As53WrRgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHRUIK4QkUZ7qJi2y4xPMkBjjRCdo6N4HDDHy8DqN5SiY5gExRvgo2v7iNTgUH/MoKIaC0BPpFEx6C/KGFZ007IKf90dFZpYf+zNWoyHYMguOWGztMOmHU72ZT+jVN9ATrSnsoXh9QNM/L/klwVq993gkfIOXXgtu6g4pMMIBhVd9cbIp1sTBFILB2IW6KYmHMyoTQrQMjNZxQboXVsSl7qrt5kTQsLNpO3sRUQFXWIR3aeaAvk6ROo6sj6VevmHq0vmYvubdgOItoKh73aR53yCye20w1fXNJ9SqCFJBweF88nFe8QKvRA6KUp3JGnWyTlL4kaIVEW54L8DmytP4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sr2UENSm; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sr2UENSm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bw8pr0SQxz2xCW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 05:27:46 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55b975b459aso1908978e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Aug 2025 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754249260; x=1754854060; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfrqAAo+hh5/BEGgrtHJRzmnixP9YlHQg7As53WrRgM=;
        b=Sr2UENSm4pibTDL+AI6rsuFn9REfGJUz2zRPIoBUoAVAgm8PmIZ43O1qX33CuvjoSe
         Q3aDuKaoVL9oNlam0jK3b7nd88dIl7iRGnmTQelIObdD11GwWtFETjtUWU5TyhgQw10r
         8AA9XVZBEjOVXhWq7ZCD8K5WLZadn2Bn2hlBku/Mp2Ech6dEACqK0oh3MyhsoJy/xxPb
         9o0uATj9i+phxt8NQsBfV9pmy9Qu4CDtc/9VRltCEkHcHXLKRhoAZhlvaNl/uLQAQtF9
         a49E22qjayw0Ukv9DbngRT/S53c1Pnvocc9YpPBr5qBOLB1Qj2m1VI+Pepz5G9ZuD9qY
         MAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754249260; x=1754854060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfrqAAo+hh5/BEGgrtHJRzmnixP9YlHQg7As53WrRgM=;
        b=RyhYxf64mdbKtzQxzlUzvU6RA8aoxo76WLX+HkuHti+FmSSerlwZr8lmjxIIofrIV+
         rm0Lk9DduhlUfQVl7iYbeXoyeHe+TSkX83k2zM+QfO3NSs6pT8RfT1tlIHtVmUZx7VdF
         TgBz+Q1DVfAMv48G+cY/tBLcN3PhXPQHUf//B/d205KGJc729D7eBd9sPILCWyixgQTr
         zDcRF1G+2R+XvdEioCOBz9EW5EQNpEeMD294wtqGYQ4ceoA8z/FYaWTwC2majyOmTSn6
         TgdiZifKOeVzAgogvQgtab5ZxZzPcqDMdETSlZlNQMltbpgKsZiXOxm0cybBGBJUUcPW
         xV4g==
X-Forwarded-Encrypted: i=1; AJvYcCUqrprbOtIT4baUGGxRpfGj49wUHKo+IoBKvEfWET0hC1stl7cDGUwBy/bGly9rHJ6VIEcnoVAHAlggvBg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUmuSwfhUiCCk4TKN67yF7M5rD8R3jFJkRxH28el3f/V3Mcmkt
	LgY1Ddpg/NBcXEbuxSfl3LLXDUy4JCVQTn/OXthaw2Y6lOwzaCPdZYRl1AHE2Si/LgktCmiXlch
	4wbcdAZOmXRic9RhKr8x/FiROjHKALvQ=
X-Gm-Gg: ASbGncuPSZvqnKXTTOMAoNQ8DZKw6Iqfl5+qQvikqfGqMe0t6eXa09KxfGK8eBJK3gH
	Ht+Y+10Lc+kUP0Mbt49D5gCYmTtcAq5KqFtwXjDFLQn5OCa2oGVP8nG7Z16ba+c8cteU620NQas
	rY2d8c8BJxvdbUAv5YDhbxADck07uM6wlNxTitFDHvMXdWaLMoLjyh6FNF/nrDt9aY+83czsHGO
	yRm8Gs=
X-Google-Smtp-Source: AGHT+IEh0pkPe95z3+vGGbihQ33Ty6irIuzQUDpa5OxuO3EiJmT/oYz/ntsug87P4Dyb4fZP+lu8a54BT1HcdNutw4I=
X-Received: by 2002:ac2:4c46:0:b0:54b:117b:b54b with SMTP id
 2adb3069b0e04-55b97b87f09mr2012427e87.54.1754249259263; Sun, 03 Aug 2025
 12:27:39 -0700 (PDT)
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
References: <20250717142732.292822-1-snovitoll@gmail.com> <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
 <CACzwLxjD0oXGGm2dkDdXjX0sxoNC2asQbjigkDWGCn48bitxSw@mail.gmail.com> <f7051d82-559f-420d-a766-6126ba2ed5ab@gmail.com>
In-Reply-To: <f7051d82-559f-420d-a766-6126ba2ed5ab@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Mon, 4 Aug 2025 00:27:22 +0500
X-Gm-Features: Ac12FXz3Md2skCIj9ydyyjC78Y0CTvtHNSbLgGPLYuzRDoF-sD3DGjiQZnIWPLk
Message-ID: <CACzwLxjESCT_=1BG2rWiaxz1wCYbVWHAvf+v4=S5dzeHJ8c97g@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove
 arch-specific implementations
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: hca@linux.ibm.com, akpm@linux-foundation.org, 
	kasan-dev <kasan-dev@googlegroups.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 23, 2025 at 10:33=E2=80=AFPM Andrey Ryabinin <ryabinin.a.a@gmai=
l.com> wrote:
>
> ...
>
> I don't know if it's a real problem or not. I'm just pointing out that we=
 might
> have tricky use case here and maybe that's a problem, because nobody had =
such use
> case in mind. But maybe it's just fine.
> I think we just need to boot test it, to see if this works.
> ...
> powerpc used static key same way before your patches, so powerpc should b=
e fine.

Hello,

Just heads up that I am still working on v4.
While I can verify the success on compile and booting with my changes
on x86, arm with SW/HW_TAGS modes, I'm having issues with PowerPC, UML
arch that selects ARCH_DEFER_KASAN.

Adding Christophe Leroy in TO. Please advise on the powerpc panic issue.

I started from scratch again, cherry picking changes one by one,
and verifying on powerpc which does select ARCH_DEFER_KASAN
and on arm64 with HW_TAGS on. While HW_TAGS works and boots
with the git diff [4], powerpc panics on botting, so I could've used the he=
lp,
while I'm trying to figure it out myself.

I know that PowerPC used the static key before and
I use the function to enable it and check it. Stuck in here.

TL;DR of upcoming v4 changes:

I've left the only check `kasan_enabled()` in include/linux/kasan-enabled.h
for the upcoming PATCH v4, removing kasan_shadow_initialized() from v3.
Because currently [1] in mainline, if HW_TAGS is enabled,
kasan_enabled() checks the static flag, otherwise IS_ENABLED(CONFIG_KASAN).

Andrey Konovalov mentioned in v2 to have a separate kasan_enabled()
to check if KASAN enabled at all and kasan_shadow_initialized() if
shadow memory is ready. AFAIU, the single kasan_enabled() covers both
scenarios separately in ARCH_DEFER_KASAN, and it doesn't need to
have a separate check in either case. Please correct me if I'm wrong.

[1] https://elixir.bootlin.com/linux/v6.16/source/include/linux/kasan-enabl=
ed.h#L11

Also kasan_arch_is_ready() is replaced with kasan_enabled() as I did in v1-=
v2,
since we control runtime/compile time checks via the single function.

#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
static __always_inline bool kasan_enabled(void)
{
        return static_branch_likely(&kasan_flag_enabled);
}
...

=3D=3D UML issue

Currently [2], UML uses integer flag, so adding ARCH_DEFER_KASAN
which relies on CONFIG_STATIC_LINK to arch/um/Kconfig seems problematic, or=
 no?
I was trying to boot the ./linux ARCH=3Dum and replacing ".kasan_init"
section with
__init kasan_init

and calling kasan_init() at the end of `__init arch_mm_preinit()` - I
got segfault,
couldn't get help from gdb or strace. I guess the patching just didn't work=
.

[2] https://elixir.bootlin.com/linux/v6.16/source/arch/um/kernel/mem.c#L35

#ifdef CONFIG_KASAN
void __init kasan_init(void)
{
        /*
        * kasan_map_memory will map all of the required address space and
        * the host machine will allocate physical memory as necessary.
        */
        kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
        init_task.kasan_depth =3D 0;
        kasan_init_generic();
}
#endif

and removed ".kasan_init" section from:
arch/um/include/asm/common.lds.S
arch/um/kernel/dyn.lds.S

So not sure if I should actually keep kasan_arch_is_ready for UML code
that can not
use kasan_enabled() as STATIC_LINK is not enabled in UML defconfig.

=3D=3D PowerPC panic

I've following this instruction to compile properly kernel for powerpc
https://github.com/linuxppc/wiki/wiki/Building-powerpc-kernels,

because compiling with clang and defconfig didn't boot the QEMU.

export CROSS_COMPILE=3Dpowerpc64le-linux-gnu-
export ARCH=3Dpowerpc
make ppc64le_defconfig

Running it in QEMU, I'm currently receiving the kernel panic [3].
**Without** git diff below [4], the QEMU boots with KASAN successfully.

I'm trying to understand the root-cause:
        ftrace_process_locs -> ftrace_init -> start_kernel()
AFAIU, some code before kasan_init() is trying to do an instrumented
access(store/load) that ends up in __asan_*,
but shadow memory is not mapped yet.

My guess is that the issue is how we prepare the shadow mem.
differently in PPC_BOOK3S_64:
arch/powerpc/mm/kasan/init_book3s_64.c
and in PPC_BOOK3E_64:
arch/powerpc/mm/kasan/init_book3e_64.c

Like BOOK3S requires RADIX_MMU,
so I can't verify ARCH_DEFER_KASAN on BOOK3E.



[3]
$ ./run-qemu-powerpc.sh ./linux-kasan
+ IMAGE=3D./images/rootfs-el.cpio.gz
+ KERNEL=3D./linux-kasan
+ qemu-system-ppc64 -M pseries -m 1G -nographic -vga none -kernel
./linux-kasan/vmlinux -initrd ./images/rootfs-el.cpio.gz -append
noreboot -device e1000e,netdev=3Dnic -netdev user,id=3Dnic -s -pidfile
vm.pid
qemu-system-ppc64: warning: TCG doesn't support requested feature,
cap-cfpc=3Dworkaround
qemu-system-ppc64: warning: TCG doesn't support requested feature,
cap-sbbc=3Dworkaround
qemu-system-ppc64: warning: TCG doesn't support requested feature,
cap-ibs=3Dworkaround
qemu-system-ppc64: warning: TCG doesn't support requested feature,
cap-ccf-assist=3Don


SLOF **********************************************************************
QEMU Starting
 Build Date =3D Mar  5 2025 10:48:26
 FW Version =3D release 20210711
 Press "s" to enter Open Firmware.

Populating /vdevice methods
Populating /vdevice/vty@71000000
Populating /vdevice/nvram@71000001
Populating /vdevice/v-scsi@71000002
       SCSI: Looking for devices
          8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
Populating /pci@800000020000000
                     00 0000 (D) : 8086 10d3    network [ ethernet ]
No NVRAM common partition, re-initializing...
Scanning USB
Using default console: /vdevice/vty@71000000
Detected RAM kernel at 400000 (497c180 bytes)

  Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php

Booting from memory...
OF stdout device is: /vdevice/vty@71000000
Preparing to boot Linux version 6.16.0-g9a9f7176fa9d-dirty
(novitoll@PC) (powerpc64le-linux-gnu-gcc (Ubuntu
11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld (GNU Binutils for Ubuntu) 2.38)
#64 SMP Sun Aug  3 19:58:23 +05 2025
Detected machine type: 0000000000000101
command line: noreboot
Max number of cores passed to firmware: 2048 (NR_CPUS =3D 2048)
Calling ibm,client-architecture-support... done
memory layout at init:
  memory_limit : 0000000000000000 (16 MB aligned)
  alloc_bottom : 00000000053b0000
  alloc_top    : 0000000030000000
  alloc_top_hi : 0000000040000000
  rmo_top      : 0000000030000000
  ram_top      : 0000000040000000
instantiating rtas at 0x000000002fff0000... done
prom_hold_cpus: skipped
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x00000000053c0000 -> 0x00000000053c0b78
Device tree struct  0x00000000053d0000 -> 0x00000000053e0000
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x0000000000400000 ...
[    0.000000][    T0] radix-mmu: Page sizes from device-tree:
[    0.000000][    T0] radix-mmu: Page size shift =3D 12 AP=3D0x0
[    0.000000][    T0] radix-mmu: Page size shift =3D 16 AP=3D0x5
[    0.000000][    T0] radix-mmu: Page size shift =3D 21 AP=3D0x1
[    0.000000][    T0] radix-mmu: Page size shift =3D 30 AP=3D0x2
[    0.000000][    T0] Activating Kernel Userspace Access Prevention
[    0.000000][    T0] Activating Kernel Userspace Execution Prevention
[    0.000000][    T0] radix-mmu: Mapped
0x0000000000000000-0x0000000003e00000 with 2.00 MiB pages (exec)
[    0.000000][    T0] radix-mmu: Mapped
0x0000000003e00000-0x0000000040000000 with 2.00 MiB pages
[    0.000000][    T0] lpar: Using radix MMU under hypervisor
[    0.000000][    T0] Linux version 6.16.0-g9a9f7176fa9d-dirty
(novitoll@PC) (powerpc64le-linux-gnu-gcc (Ubuntu
11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld (GNU Binutils for Ubuntu) 2.38)
#64 SMP Sun Aug  3 19:58:23 +05 2025
[    0.000000][    T0] KernelAddressSanitizer initialized (generic)
[    0.000000][    T0] OF: reserved mem: Reserved memory: No
reserved-memory node in the DT
[    0.000000][    T0] Found initrd at 0xc000000004d90000:0xc0000000053ad15=
a
[    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu)
POWER9 (architected) 0x4e1200 0xf000005 of:SLOF,HEAD pSeries
[    0.000000][    T0] printk: legacy bootconsole [udbg0] enabled
[    0.000000][    T0] Partition configured for 1 cpus.
[    0.000000][    T0] CPU maps initialized for 1 thread per core
[    0.000000][    T0] numa: Partition configured for 1 NUMA nodes.
[    0.000000][    T0] ----------------------------------------------------=
-
[    0.000000][    T0] phys_mem_size     =3D 0x40000000
[    0.000000][    T0] dcache_bsize      =3D 0x80
[    0.000000][    T0] icache_bsize      =3D 0x80
[    0.000000][    T0] cpu_features      =3D 0x0001c06b8f4f9187
[    0.000000][    T0]   possible        =3D 0x003ffbfbffffb18f
[    0.000000][    T0]   always          =3D 0x0000000000000180
[    0.000000][    T0] cpu_user_features =3D 0xdc0065c2 0xaef00000
[    0.000000][    T0] mmu_features      =3D 0x3c007641
[    0.000000][    T0] firmware_features =3D 0x00000285455a445f
[    0.000000][    T0] vmalloc start     =3D 0xc008000000000000
[    0.000000][    T0] IO start          =3D 0xc00a000000000000
[    0.000000][    T0] vmemmap start     =3D 0xc00c000000000000
[    0.000000][    T0] ----------------------------------------------------=
-
[    0.000000][    T0] NODE_DATA(0) allocated [mem 0x3fb28800-0x3fb2ffff]
[    0.000000][    T0] rfi-flush: fallback displacement flush available
[    0.000000][    T0] rfi-flush: ori type flush available
[    0.000000][    T0] rfi-flush: mttrig type flush available
[    0.000000][    T0] count-cache-flush: hardware flush enabled.
[    0.000000][    T0] link-stack-flush: software flush enabled.
[    0.000000][    T0] stf-barrier: eieio barrier available
[    0.000000][    T0] PPC64 nvram contains 65536 bytes
[    0.000000][    T0] barrier-nospec: using ORI speculation barrier
[    0.000000][    T0] Zone ranges:
[    0.000000][    T0]   Normal   [mem 0x0000000000000000-0x000000003ffffff=
f]
[    0.000000][    T0]   Device   empty
[    0.000000][    T0] Movable zone start for each node
[    0.000000][    T0] Early memory node ranges
[    0.000000][    T0]   node   0: [mem 0x0000000000000000-0x000000003fffff=
ff]
[    0.000000][    T0] Initmem setup node 0 [mem
0x0000000000000000-0x000000003fffffff]
[    0.000000][    T0] percpu: Embedded 3 pages/cpu s122904 r0 d73704 u1966=
08
[    0.000000][    T0] Kernel command line: noreboot
[    0.000000][    T0] Unknown kernel command line parameters
"noreboot", will be passed to user space.
[    0.000000][    T0] printk: log buffer data + meta data: 262144 +
917504 =3D 1179648 bytes
[    0.000000][    T0] Dentry cache hash table entries: 131072 (order:
4, 1048576 bytes, linear)
[    0.000000][    T0] Inode-cache hash table entries: 65536 (order:
3, 524288 bytes, linear)
[    0.000000][    T0] Fallback order for Node 0: 0
[    0.000000][    T0] Built 1 zonelists, mobility grouping on.  Total
pages: 16384
[    0.000000][    T0] Policy zone: Normal
[    0.000000][    T0] mem auto-init: stack:off, heap alloc:off, heap free:=
off
[    0.000000][    T0] stackdepot: allocating hash table via
alloc_large_system_hash
[    0.000000][    T0] stackdepot hash table entries: 1048576 (order:
8, 16777216 bytes, linear)
[    0.000000][    T0] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0,
CPUs=3D1, Nodes=3D1
[    0.000000][    T0] BUG: Unable to handle kernel data access on
read at 0xc00e0000a83f4ff0
[    0.000000][    T0] Faulting instruction address: 0xc000000000761aec
[    0.000000][    T0] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.000000][    T0] BE PAGE_SIZE=3D64K MMU=3DRadix  SMP NR_CPUS=3D2048 N=
UMA pSeries
[    0.000000][    T0] Modules linked in:
[    0.000000][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
6.16.0-g9a9f7176fa9d-dirty #64 VOLUNTARY
[    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu)
POWER9 (architected) 0x4e1200 0xf000005 of:SLOF,HEAD pSeries
[    0.000000][    T0] NIP:  c000000000761aec LR: c0000000003fa48c
CTR: c000000000302db4
[    0.000000][    T0] REGS: c000000004687b20 TRAP: 0300   Not tainted
 (6.16.0-g9a9f7176fa9d-dirty)
[    0.000000][    T0] MSR:  8000000002001032 <SF,VEC,ME,IR,DR,RI>
CR: 24082424  XER: 00000000
[    0.000000][    T0] CFAR: c0000000003fa488 DAR: c00e0000a83f4ff0
DSISR: 40000000 IRQMASK: 3
[    0.000000][    T0] GPR00: c0000000003fa48c c000000004687dc0
c00000000230a500 c000000541fa7f80
[    0.000000][    T0] GPR04: 0000000000000008 0000000000000001
c0000000019cf044 0000000000000001
[    0.000000][    T0] GPR08: a80e000000000000 18000000a83f4ff0
0000000000000007 a80e000000000000
[    0.000000][    T0] GPR12: c00e0000008d0fb6 c000000004980000
0000000000000002 0000000002579c28
[    0.000000][    T0] GPR16: c0000000040824c0 000000000000000c
c000000006a80000 c00000000000e9f8
[    0.000000][    T0] GPR20: 0000000000010000 c0000000031e4568
c000000004840860 0000000000000000
[    0.000000][    T0] GPR24: 000000000000b9f4 0000000053b527f9
0000000000000000 c0000000031875d0
[    0.000000][    T0] GPR28: 000000053b527f80 c0000000068d0340
c0000000068d0380 0000000000000000
[    0.000000][    T0] NIP [c000000000761aec] __asan_store8+0x60/0xe0
[    0.000000][    T0] LR [c0000000003fa48c] ftrace_process_locs+0x3c0/0xa2=
0
[    0.000000][    T0] Call Trace:
[    0.000000][    T0] [c000000004687dc0] [0000000000000002] 0x2 (unreliabl=
e)
[    0.000000][    T0] [c000000004687de0] [c0000000003fa48c]
ftrace_process_locs+0x3c0/0xa20
[    0.000000][    T0] [c000000004687ee0] [c000000003065c14]
ftrace_init+0x68/0x1cc
[    0.000000][    T0] [c000000004687f50] [c00000000300a57c]
start_kernel+0x1d8/0x4e0
[    0.000000][    T0] [c000000004687fe0] [c00000000000da4c]
start_here_common+0x1c/0x20
[    0.000000][    T0] Code: 792907c6 6529ffff 6129ffff 7c234840
4081005c 39230007 792a0760 2c2a0007 40820034 3d00a80e 7929e8c2
790807c6 <7d2940ae> 7d290775 4082006c 38210020
[    0.000000][    T0] ---[ end trace 0000000000000000 ]---
[    0.000000][    T0]
[    0.000000][    T0] Kernel panic - not syncing: Attempted to kill
the idle task!
qemu-system-ppc64: OS terminated: `



[4]
---
arch/powerpc/Kconfig | 1 +
arch/powerpc/include/asm/kasan.h | 13 ----------
arch/powerpc/mm/kasan/init_32.c | 2 +-
arch/powerpc/mm/kasan/init_book3e_64.c | 2 +-
arch/powerpc/mm/kasan/init_book3s_64.c | 6 +----
include/linux/kasan-enabled.h | 24 +++++++++++++----
include/linux/kasan.h | 28 ++++++++++++++++++--
lib/Kconfig.kasan | 8 ++++++
mm/kasan/common.c | 18 ++++++++-----
mm/kasan/generic.c | 23 +++++++++-------
mm/kasan/hw_tags.c | 9 +------
mm/kasan/kasan.h | 36 +++++++++++++++++++-------
mm/kasan/shadow.c | 32 +++++------------------
mm/kasan/sw_tags.c | 2 ++
mm/kasan/tags.c | 2 +-
15 files changed, 120 insertions(+), 86 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 93402a1d9c9..11c8ef2d88e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -122,6 +122,7 @@ config PPC
# Please keep this list sorted alphabetically.
#
select ARCH_32BIT_OFF_T if PPC32
+ select ARCH_DEFER_KASAN if PPC_RADIX_MMU
select ARCH_DISABLE_KASAN_INLINE if PPC_RADIX_MMU
select ARCH_DMA_DEFAULT_COHERENT if !NOT_COHERENT_CACHE
select ARCH_ENABLE_MEMORY_HOTPLUG
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/ka=
san.h
index b5bbb94c51f..73466d3ff30 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -53,19 +53,6 @@
#endif
#ifdef CONFIG_KASAN
-#ifdef CONFIG_PPC_BOOK3S_64
-DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
-static __always_inline bool kasan_arch_is_ready(void)
-{
- if (static_branch_likely(&powerpc_kasan_enabled_key))
- return true;
- return false;
-}
-
-#define kasan_arch_is_ready kasan_arch_is_ready
-#endif
-
void kasan_early_init(void);
void kasan_mmu_init(void);
void kasan_init(void);
diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_3=
2.c
index 03666d790a5..1d083597464 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -165,7 +165,7 @@ void __init kasan_init(void)
/* At this point kasan is fully initialized. Enable error messages */
init_task.kasan_depth =3D 0;
- pr_info("KASAN init done\n");
+ kasan_init_generic();
}
void __init kasan_late_init(void)
diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c
b/arch/powerpc/mm/kasan/init_book3e_64.c
index 60c78aac0f6..0d3a73d6d4b 100644
--- a/arch/powerpc/mm/kasan/init_book3e_64.c
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -127,7 +127,7 @@ void __init kasan_init(void)
/* Enable error messages */
init_task.kasan_depth =3D 0;
- pr_info("KASAN init done\n");
+ kasan_init_generic();
}
void __init kasan_late_init(void) { }
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c
b/arch/powerpc/mm/kasan/init_book3s_64.c
index 7d959544c07..dcafa641804 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -19,8 +19,6 @@
#include <linux/memblock.h>
#include <asm/pgalloc.h>
-DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
static void __init kasan_init_phys_region(void *start, void *end)
{
unsigned long k_start, k_end, k_cur;
@@ -92,11 +90,9 @@ void __init kasan_init(void)
*/
memset(kasan_early_shadow_page, 0, PAGE_SIZE);
- static_branch_inc(&powerpc_kasan_enabled_key);
-
/* Enable error messages */
init_task.kasan_depth =3D 0;
- pr_info("KASAN init done\n");
+ kasan_init_generic();
}
void __init kasan_early_init(void) { }
diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0..32db31b6418 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,32 +4,46 @@
#include <linux/static_key.h>
-#ifdef CONFIG_KASAN_HW_TAGS
-
+#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
+/*
+ * Global runtime flag for KASAN modes that need runtime control.
+ * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
+ */
DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
+/*
+ * Runtime control for shadow memory initialization or HW_TAGS mode.
+ * Uses static key for architectures that need deferred KASAN or HW_TAGS.
+ */
static __always_inline bool kasan_enabled(void)
{
return static_branch_likely(&kasan_flag_enabled);
}
+static inline void kasan_enable(void)
+{
+ static_branch_enable(&kasan_flag_enabled);
+}
+
static inline bool kasan_hw_tags_enabled(void)
{
return kasan_enabled();
}
+#else
-#else /* CONFIG_KASAN_HW_TAGS */
-
+/* Controls whether KASAN is enabled at all (compile-time check). */
static inline bool kasan_enabled(void)
{
return IS_ENABLED(CONFIG_KASAN);
}
+static inline void kasan_enable(void) { }
+
static inline bool kasan_hw_tags_enabled(void)
{
return false;
}
-#endif /* CONFIG_KASAN_HW_TAGS */
+#endif /* CONFIG_ARCH_DEFER_KASAN || CONFIG_KASAN_HW_TAGS */
#endif /* LINUX_KASAN_ENABLED_H */
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 890011071f2..8bf0efbb751 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -543,6 +543,12 @@ void kasan_report_async(void);
#endif /* CONFIG_KASAN_HW_TAGS */
+#ifdef CONFIG_KASAN_GENERIC
+void __init kasan_init_generic(void);
+#else
+static inline void kasan_init_generic(void) { }
+#endif
+
#ifdef CONFIG_KASAN_SW_TAGS
void __init kasan_init_sw_tags(void);
#else
@@ -562,11 +568,29 @@ static inline void kasan_init_hw_tags(void) { }
#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
void kasan_populate_early_vm_area_shadow(void *start, unsigned long size);
-int kasan_populate_vmalloc(unsigned long addr, unsigned long size);
-void kasan_release_vmalloc(unsigned long start, unsigned long end,
+
+int __kasan_populate_vmalloc(unsigned long addr, unsigned long size);
+static inline int kasan_populate_vmalloc(unsigned long addr, unsigned
long size)
+{
+ if (!kasan_enabled())
+ return 0;
+ return __kasan_populate_vmalloc(addr, size);
+}
+
+void __kasan_release_vmalloc(unsigned long start, unsigned long end,
unsigned long free_region_start,
unsigned long free_region_end,
unsigned long flags);
+static inline void kasan_release_vmalloc(unsigned long start,
+ unsigned long end,
+ unsigned long free_region_start,
+ unsigned long free_region_end,
+ unsigned long flags)
+{
+ if (kasan_enabled())
+ __kasan_release_vmalloc(start, end, free_region_start,
+ free_region_end, flags);
+}
#else /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f82889a830f..4e0508022ce 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -49,6 +49,14 @@ menuconfig KASAN
if KASAN
+config ARCH_DEFER_KASAN
+ bool
+ help
+ Architectures should select this if they need to defer KASAN
+ initialization until shadow memory is properly set up. This
+ enables runtime control via static keys. Otherwise, KASAN uses
+ compile-time constants for better performance.
+
config CC_HAS_KASAN_MEMINTRINSIC_PREFIX
def_bool (CC_IS_CLANG && $(cc-option,-fsanitize=3Dkernel-address -mllvm
-asan-kernel-mem-intrinsic-prefix=3D1)) || \
(CC_IS_GCC && $(cc-option,-fsanitize=3Dkernel-address --param
asan-kernel-mem-intrinsic-prefix=3D1))
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index ed4873e18c7..dff5f7bfad1 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -32,6 +32,15 @@
#include "kasan.h"
#include "../slab.h"
+#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
+/*
+ * Definition of the unified static key declared in kasan-enabled.h.
+ * This provides consistent runtime enable/disable across KASAN modes.
+ */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
+EXPORT_SYMBOL(kasan_flag_enabled);
+#endif
+
struct slab *kasan_addr_to_slab(const void *addr)
{
if (virt_addr_valid(addr))
@@ -250,7 +259,7 @@ static inline void poison_slab_object(struct
kmem_cache *cache, void *object,
bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
unsigned long ip)
{
- if (!kasan_arch_is_ready() || is_kfence_address(object))
+ if (is_kfence_address(object))
return false;
return check_slab_allocation(cache, object, ip);
}
@@ -258,7 +267,7 @@ bool __kasan_slab_pre_free(struct kmem_cache
*cache, void *object,
bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
bool still_accessible)
{
- if (!kasan_arch_is_ready() || is_kfence_address(object))
+ if (is_kfence_address(object))
return false;
poison_slab_object(cache, object, init, still_accessible);
@@ -282,9 +291,6 @@ bool __kasan_slab_free(struct kmem_cache *cache,
void *object, bool init,
static inline bool check_page_allocation(void *ptr, unsigned long ip)
{
- if (!kasan_arch_is_ready())
- return false;
-
if (ptr !=3D page_address(virt_to_head_page(ptr))) {
kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
return true;
@@ -511,7 +517,7 @@ bool __kasan_mempool_poison_object(void *ptr,
unsigned long ip)
return true;
}
- if (is_kfence_address(ptr) || !kasan_arch_is_ready())
+ if (is_kfence_address(ptr))
return true;
slab =3D folio_slab(folio);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index d54e89f8c3e..8e597cf8fdd 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -36,6 +36,17 @@
#include "kasan.h"
#include "../slab.h"
+/*
+ * Initialize Generic KASAN and enable runtime checks.
+ * This should be called from arch kasan_init() once shadow memory is read=
y.
+ */
+void __init kasan_init_generic(void)
+{
+ kasan_enable();
+
+ pr_info("KernelAddressSanitizer initialized (generic)\n");
+}
+
/*
* All functions below always inlined so compiler could
* perform better optimizations in each of __asan_loadX/__assn_storeX
@@ -165,7 +176,7 @@ static __always_inline bool
check_region_inline(const void *addr,
size_t size, bool write,
unsigned long ret_ip)
{
- if (!kasan_arch_is_ready())
+ if (!kasan_enabled())
return true;
if (unlikely(size =3D=3D 0))
@@ -189,13 +200,10 @@ bool kasan_check_range(const void *addr, size_t
size, bool write,
return check_region_inline(addr, size, write, ret_ip);
}
-bool kasan_byte_accessible(const void *addr)
+bool __kasan_byte_accessible(const void *addr)
{
s8 shadow_byte;
- if (!kasan_arch_is_ready())
- return true;
-
shadow_byte =3D READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
return shadow_byte >=3D 0 && shadow_byte < KASAN_GRANULE_SIZE;
@@ -495,9 +503,6 @@ static void release_alloc_meta(struct
kasan_alloc_meta *meta)
static void release_free_meta(const void *object, struct kasan_free_meta *m=
eta)
{
- if (!kasan_arch_is_ready())
- return;
-
/* Check if free meta is valid. */
if (*(u8 *)kasan_mem_to_shadow(object) !=3D KASAN_SLAB_FREE_META)
return;
@@ -562,7 +567,7 @@ void kasan_save_alloc_info(struct kmem_cache
*cache, void *object, gfp_t flags)
kasan_save_track(&alloc_meta->alloc_track, flags);
}
-void kasan_save_free_info(struct kmem_cache *cache, void *object)
+void __kasan_save_free_info(struct kmem_cache *cache, void *object)
{
struct kasan_free_meta *free_meta;
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index 9a6927394b5..c8289a3feab 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -45,13 +45,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
-/*
- * Whether KASAN is enabled at all.
- * The value remains false until KASAN is initialized by kasan_init_hw_tag=
s().
- */
-DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
-EXPORT_SYMBOL(kasan_flag_enabled);
-
/*
* Whether the selected mode is synchronous, asynchronous, or asymmetric.
* Defaults to KASAN_MODE_SYNC.
@@ -260,7 +253,7 @@ void __init kasan_init_hw_tags(void)
kasan_init_tags();
/* KASAN is now initialized, enable it. */
- static_branch_enable(&kasan_flag_enabled);
+ kasan_enable();
pr_info("KernelAddressSanitizer initialized (hw-tags, mode=3D%s,
vmalloc=3D%s, stacktrace=3D%s)\n",
kasan_mode_info(),
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e6..ecb0dccfca9 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -398,7 +398,13 @@ depot_stack_handle_t kasan_save_stack(gfp_t
flags, depot_flags_t depot_flags);
void kasan_set_track(struct kasan_track *track, depot_stack_handle_t stack)=
;
void kasan_save_track(struct kasan_track *track, gfp_t flags);
void kasan_save_alloc_info(struct kmem_cache *cache, void *object, gfp_t fl=
ags);
-void kasan_save_free_info(struct kmem_cache *cache, void *object);
+
+void __kasan_save_free_info(struct kmem_cache *cache, void *object);
+static inline void kasan_save_free_info(struct kmem_cache *cache, void *ob=
ject)
+{
+ if (kasan_enabled())
+ __kasan_save_free_info(cache, object);
+}
#ifdef CONFIG_KASAN_GENERIC
bool kasan_quarantine_put(struct kmem_cache *cache, void *object);
@@ -499,6 +505,7 @@ static inline bool kasan_byte_accessible(const void *ad=
dr)
#else /* CONFIG_KASAN_HW_TAGS */
+void __kasan_poison(const void *addr, size_t size, u8 value, bool init);
/**
* kasan_poison - mark the memory range as inaccessible
* @addr: range start address, must be aligned to KASAN_GRANULE_SIZE
@@ -506,7 +513,11 @@ static inline bool kasan_byte_accessible(const void *a=
ddr)
* @value: value that's written to metadata for the range
* @init: whether to initialize the memory range (only for hardware tag-base=
d)
*/
-void kasan_poison(const void *addr, size_t size, u8 value, bool init);
+static inline void kasan_poison(const void *addr, size_t size, u8
value, bool init)
+{
+ if (kasan_enabled())
+ __kasan_poison(addr, size, value, init);
+}
/**
* kasan_unpoison - mark the memory range as accessible
@@ -521,12 +532,19 @@ void kasan_poison(const void *addr, size_t size,
u8 value, bool init);
*/
void kasan_unpoison(const void *addr, size_t size, bool init);
-bool kasan_byte_accessible(const void *addr);
+bool __kasan_byte_accessible(const void *addr);
+static inline bool kasan_byte_accessible(const void *addr)
+{
+ if (!kasan_enabled())
+ return true;
+ return __kasan_byte_accessible(addr);
+}
#endif /* CONFIG_KASAN_HW_TAGS */
#ifdef CONFIG_KASAN_GENERIC
+void __kasan_poison_last_granule(const void *address, size_t size);
/**
* kasan_poison_last_granule - mark the last granule of the memory range as
* inaccessible
@@ -536,7 +554,11 @@ bool kasan_byte_accessible(const void *addr);
* This function is only available for the generic mode, as it's the only mo=
de
* that has partially poisoned memory granules.
*/
-void kasan_poison_last_granule(const void *address, size_t size);
+static inline void kasan_poison_last_granule(const void *address, size_t s=
ize)
+{
+ if (kasan_enabled())
+ __kasan_poison_last_granule(address, size);
+}
#else /* CONFIG_KASAN_GENERIC */
@@ -544,12 +566,6 @@ static inline void
kasan_poison_last_granule(const void *address, size_t size) {
#endif /* CONFIG_KASAN_GENERIC */
-#ifndef kasan_arch_is_ready
-static inline bool kasan_arch_is_ready(void) { return true; }
-#elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
-#error kasan_arch_is_ready only works in KASAN generic outline mode!
-#endif
-
#if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
void kasan_kunit_test_suite_start(void);
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index d2c70cd2afb..90c508cad63 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -121,13 +121,10 @@ void *__hwasan_memcpy(void *dest, const void
*src, ssize_t len) __alias(__asan_m
EXPORT_SYMBOL(__hwasan_memcpy);
#endif
-void kasan_poison(const void *addr, size_t size, u8 value, bool init)
+void __kasan_poison(const void *addr, size_t size, u8 value, bool init)
{
void *shadow_start, *shadow_end;
- if (!kasan_arch_is_ready())
- return;
-
/*
* Perform shadow offset calculation based on untagged address, as
* some of the callers (e.g. kasan_poison_new_object) pass tagged
@@ -145,14 +142,11 @@ void kasan_poison(const void *addr, size_t size,
u8 value, bool init)
__memset(shadow_start, value, shadow_end - shadow_start);
}
-EXPORT_SYMBOL_GPL(kasan_poison);
+EXPORT_SYMBOL_GPL(__kasan_poison);
#ifdef CONFIG_KASAN_GENERIC
-void kasan_poison_last_granule(const void *addr, size_t size)
+void __kasan_poison_last_granule(const void *addr, size_t size)
{
- if (!kasan_arch_is_ready())
- return;
-
if (size & KASAN_GRANULE_MASK) {
u8 *shadow =3D (u8 *)kasan_mem_to_shadow(addr + size);
*shadow =3D size & KASAN_GRANULE_MASK;
@@ -353,7 +347,7 @@ static int ___alloc_pages_bulk(struct page
**pages, int nr_pages)
return 0;
}
-static int __kasan_populate_vmalloc(unsigned long start, unsigned long end=
)
+static int __kasan_populate_vmalloc_do(unsigned long start, unsigned long =
end)
{
unsigned long nr_pages, nr_total =3D PFN_UP(end - start);
struct vmalloc_populate_data data;
@@ -385,14 +379,11 @@ static int __kasan_populate_vmalloc(unsigned
long start, unsigned long end)
return ret;
}
-int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
+int __kasan_populate_vmalloc(unsigned long addr, unsigned long size)
{
unsigned long shadow_start, shadow_end;
int ret;
- if (!kasan_arch_is_ready())
- return 0;
-
if (!is_vmalloc_or_module_addr((void *)addr))
return 0;
@@ -414,7 +405,7 @@ int kasan_populate_vmalloc(unsigned long addr,
unsigned long size)
shadow_start =3D PAGE_ALIGN_DOWN(shadow_start);
shadow_end =3D PAGE_ALIGN(shadow_end);
- ret =3D __kasan_populate_vmalloc(shadow_start, shadow_end);
+ ret =3D __kasan_populate_vmalloc_do(shadow_start, shadow_end);
if (ret)
return ret;
@@ -551,7 +542,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t
*ptep, unsigned long addr,
* pages entirely covered by the free region, we will not run in to any
* trouble - any simultaneous allocations will be for disjoint regions.
*/
-void kasan_release_vmalloc(unsigned long start, unsigned long end,
+void __kasan_release_vmalloc(unsigned long start, unsigned long end,
unsigned long free_region_start,
unsigned long free_region_end,
unsigned long flags)
@@ -560,9 +551,6 @@ void kasan_release_vmalloc(unsigned long start,
unsigned long end,
unsigned long region_start, region_end;
unsigned long size;
- if (!kasan_arch_is_ready())
- return;
-
region_start =3D ALIGN(start, KASAN_MEMORY_PER_SHADOW_PAGE);
region_end =3D ALIGN_DOWN(end, KASAN_MEMORY_PER_SHADOW_PAGE);
@@ -611,9 +599,6 @@ void *__kasan_unpoison_vmalloc(const void *start,
unsigned long size,
* with setting memory tags, so the KASAN_VMALLOC_INIT flag is ignored.
*/
- if (!kasan_arch_is_ready())
- return (void *)start;
-
if (!is_vmalloc_or_module_addr(start))
return (void *)start;
@@ -636,9 +621,6 @@ void *__kasan_unpoison_vmalloc(const void *start,
unsigned long size,
*/
void __kasan_poison_vmalloc(const void *start, unsigned long size)
{
- if (!kasan_arch_is_ready())
- return;
-
if (!is_vmalloc_or_module_addr(start))
return;
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index b9382b5b6a3..275bcbbf612 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -45,6 +45,8 @@ void __init kasan_init_sw_tags(void)
kasan_init_tags();
+ kasan_enable();
+
pr_info("KernelAddressSanitizer initialized (sw-tags, stacktrace=3D%s)\n",
str_on_off(kasan_stack_collection_enabled()));
}
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index d65d48b85f9..b9f31293622 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -142,7 +142,7 @@ void kasan_save_alloc_info(struct kmem_cache
*cache, void *object, gfp_t flags)
save_stack_info(cache, object, flags, false);
}
-void kasan_save_free_info(struct kmem_cache *cache, void *object)
+void __kasan_save_free_info(struct kmem_cache *cache, void *object)
{
save_stack_info(cache, object, 0, true);
}

--
2.34.1

