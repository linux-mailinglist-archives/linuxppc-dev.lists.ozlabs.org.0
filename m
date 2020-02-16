Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BAD16071A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 00:10:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LNB20f88zDqdZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 10:10:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LN8K352xzDqc2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 10:08:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=Tjud5JY7; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48LN8J49GLz9sPK;
 Mon, 17 Feb 2020 10:08:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581894512;
 bh=UGfwfF0yy+EkpZLNEVnY6eX4+r3klA7JgGD4miQZG9A=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=Tjud5JY7kdctek9g0Qr9j3o9/9xDScW3RxlRn8WIfa4VWzM8AyRI/y9JNFQDeQ5wN
 OVUA6XyZegJyV33BBojM+j0CkpsDaFHBTTuZLYgP2gqYQe5D3Uzw+wNdltJZImhF3x
 CpyPhflae6jHVS6BFywwcyi0Agncl7WolW1zGFmuKd//HVxIIgkO4drXE2cvmG8GEO
 y1gxZuUzh1qTnmZ1GZ0lDYu5ZjEw+Daor12XbTRnGdOgOBWXZgtKK1nFvxkeYDQiA9
 egy4H5Ak/QEKPYVNKm2wVtrN+LPtjGkImEaIkJ47HnCvw51xrz0wXEqAjmHAskTBXB
 EjTAQyI71Qn2A==
Received: by neuling.org (Postfix, from userid 1000)
 id 5759D2C01EC; Mon, 17 Feb 2020 10:08:32 +1100 (AEDT)
Message-ID: <66bd9d8eb682cda2d22bea0fd4035ea8e0a3c1fb.camel@neuling.org>
Subject: Re: [PATCH v7 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
From: Michael Neuling <mikey@neuling.org>
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com,  christophe.leroy@c-s.fr,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Date: Mon, 17 Feb 2020 10:08:32 +1100
In-Reply-To: <20200213004752.11019-5-dja@axtens.net>
References: <20200213004752.11019-1-dja@axtens.net>
 <20200213004752.11019-5-dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel.=20

Can you start this commit message with a simple description of what you are
actually doing? This reads like you've been on a long journey to Mordor and
back, which as a reader of this patch in the long distant future, I don't c=
are
about. I just want to know what you're implementing.

Also I'm struggling to review this as I don't know what software or hardwar=
e
mechanisms you are using to perform sanitisation.

Mikey

On Thu, 2020-02-13 at 11:47 +1100, Daniel Axtens wrote:
> KASAN support on Book3S is a bit tricky to get right:
>=20
>  - It would be good to support inline instrumentation so as to be able to
>    catch stack issues that cannot be caught with outline mode.
>=20
>  - Inline instrumentation requires a fixed offset.
>=20
>  - Book3S runs code in real mode after booting. Most notably a lot of KVM
>    runs in real mode, and it would be good to be able to instrument it.
>=20
>  - Because code runs in real mode after boot, the offset has to point to
>    valid memory both in and out of real mode.
>=20
>     [ppc64 mm note: The kernel installs a linear mapping at effective
>     address c000... onward. This is a one-to-one mapping with physical
>     memory from 0000... onward. Because of how memory accesses work on
>     powerpc 64-bit Book3S, a kernel pointer in the linear map accesses th=
e
>     same memory both with translations on (accessing as an 'effective
>     address'), and with translations off (accessing as a 'real
>     address'). This works in both guests and the hypervisor. For more
>     details, see s5.7 of Book III of version 3 of the ISA, in particular
>     the Storage Control Overview, s5.7.3, and s5.7.5 - noting that this
>     KASAN implementation currently only supports Radix.]
>=20
> One approach is just to give up on inline instrumentation. This way all
> checks can be delayed until after everything set is up correctly, and the
> address-to-shadow calculations can be overridden. However, the features a=
nd
> speed boost provided by inline instrumentation are worth trying to do
> better.
>=20
> If _at compile time_ it is known how much contiguous physical memory a
> system has, the top 1/8th of the first block of physical memory can be se=
t
> aside for the shadow. This is a big hammer and comes with 3 big
> consequences:
>=20
>  - there's no nice way to handle physically discontiguous memory, so only
>    the first physical memory block can be used.
>=20
>  - kernels will simply fail to boot on machines with less memory than
>    specified when compiling.
>=20
>  - kernels running on machines with more memory than specified when
>    compiling will simply ignore the extra memory.
>=20
> Implement and document KASAN this way. The current implementation is Radi=
x
> only.
>=20
> Despite the limitations, it can still find bugs,
> e.g. http://patchwork.ozlabs.org/patch/1103775/
>=20
> At the moment, this physical memory limit must be set _even for outline
> mode_. This may be changed in a later series - a different implementation
> could be added for outline mode that dynamically allocates shadow at a
> fixed offset. For example, see https://patchwork.ozlabs.org/patch/795211/
>=20
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix versio=
n
> Cc: Christophe Leroy <christophe.leroy@c-s.fr> # ppc32 version
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>=20
> ---
> Changes since v6:
>  - rework kasan_late_init support, which also fixes book3e problem that
> snowpatch
>    picked up (I think)
>  - fix a checkpatch error that snowpatch picked up
>  - don't needlessly move the include in kasan.h
>=20
> Changes since v5:
>  - rebase on powerpc/merge, with Christophe's latest changes integrating
>    kasan-vmalloc
>  - documentation tweaks based on latest 32-bit changes
>=20
> Changes since v4:
>  - fix some ppc32 build issues
>  - support ptdump
>  - clean up the header file. It turns out we don't need or use
> KASAN_SHADOW_SIZE,
>    so just dump it, and make KASAN_SHADOW_END the thing that varies betwe=
en 32
>    and 64 bit. As part of this, make sure KASAN_SHADOW_OFFSET is only
> configured for
>    32 bit - it is calculated in the Makefile for ppc64.
>  - various cleanups
>=20
> Changes since v3:
>  - Address further feedback from Christophe.
>  - Drop changes to stack walking, it looks like the issue I observed is
>    related to that particular stack, not stack-walking generally.
>=20
> Changes since v2:
>=20
>  - Address feedback from Christophe around cleanups and docs.
>  - Address feedback from Balbir: at this point I don't have a good soluti=
on
>    for the issues you identify around the limitations of the inline
> implementation
>    but I think that it's worth trying to get the stack instrumentation
> support.
>    I'm happy to have an alternative and more flexible outline mode - I ha=
d
>    envisoned this would be called 'lightweight' mode as it imposes fewer
> restrictions.
>    I've linked to your implementation. I think it's best to add it in a
> follow-up series.
>  - Made the default PHYS_MEM_SIZE_FOR_KASAN value 1024MB. I think most pe=
ople
> have
>    guests with at least that much memory in the Radix 64s case so it's a =
much
>    saner default - it means that if you just turn on KASAN without readin=
g the
>    docs you're much more likely to have a bootable kernel, which you will
> never
>    have if the value is set to zero! I'm happy to bikeshed the value if w=
e
> want.
>=20
> Changes since v1:
>  - Landed kasan vmalloc support upstream
>  - Lots of feedback from Christophe.
>=20
> Changes since the rfc:
>=20
>  - Boots real and virtual hardware, kvm works.
>=20
>  - disabled reporting when we're checking the stack for exception
>    frames. The behaviour isn't wrong, just incompatible with KASAN.
>=20
>  - Documentation!
>=20
>  - Dropped old module stuff in favour of KASAN_VMALLOC.
>=20
> The bugs with ftrace and kuap were due to kernel bloat pushing
> prom_init calls to be done via the plt. Because we did not have
> a relocatable kernel, and they are done very early, this caused
> everything to explode. Compile with CONFIG_RELOCATABLE!
> ---
>  Documentation/dev-tools/kasan.rst            |   9 +-
>  Documentation/powerpc/kasan.txt              | 112 ++++++++++++++++++-
>  arch/powerpc/Kconfig                         |   2 +
>  arch/powerpc/Kconfig.debug                   |  23 +++-
>  arch/powerpc/Makefile                        |  11 ++
>  arch/powerpc/include/asm/book3s/64/hash.h    |   4 +
>  arch/powerpc/include/asm/book3s/64/pgtable.h |   7 ++
>  arch/powerpc/include/asm/book3s/64/radix.h   |   5 +
>  arch/powerpc/include/asm/kasan.h             |  11 +-
>  arch/powerpc/kernel/prom.c                   |  61 +++++++++-
>  arch/powerpc/mm/kasan/Makefile               |   1 +
>  arch/powerpc/mm/kasan/init_book3s_64.c       |  73 ++++++++++++
>  arch/powerpc/mm/ptdump/ptdump.c              |  10 +-
>  arch/powerpc/platforms/Kconfig.cputype       |   1 +
>  14 files changed, 320 insertions(+), 10 deletions(-)
>  create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c
>=20
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-
> tools/kasan.rst
> index 012ef3d91d1f..5722de91ccce 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -22,8 +22,9 @@ global variables yet.
>  Tag-based KASAN is only supported in Clang and requires version 7.0.0 or
> later.
> =20
>  Currently generic KASAN is supported for the x86_64, arm64, xtensa, s390=
 and
> -riscv architectures. It is also supported on 32-bit powerpc kernels. Tag=
-
> based=20
> -KASAN is supported only on arm64.
> +riscv architectures. It is also supported on powerpc, for 32-bit kernels=
, and
> +for 64-bit kernels running under the Radix MMU. Tag-based KASAN is suppo=
rted
> +only on arm64.
> =20
>  Usage
>  -----
> @@ -257,8 +258,8 @@ CONFIG_KASAN_VMALLOC
> =20
>  With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
>  cost of greater memory usage. Currently this supported on x86, s390
> -and 32-bit powerpc. It is optional, except on 32-bit powerpc kernels
> -with module support, where it is required.
> +and powerpc. It is optional, except on 64-bit powerpc kernels, and on
> +32-bit powerpc kernels with module support, where it is required.
> =20
>  This works by hooking into vmalloc and vmap, and dynamically
>  allocating real shadow memory to back the mappings.
> diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasa=
n.txt
> index 26bb0e8bb18c..bf645a5cd486 100644
> --- a/Documentation/powerpc/kasan.txt
> +++ b/Documentation/powerpc/kasan.txt
> @@ -1,4 +1,4 @@
> -KASAN is supported on powerpc on 32-bit only.
> +KASAN is supported on powerpc on 32-bit and Radix 64-bit only.
> =20
>  32 bit support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -10,3 +10,113 @@ fixmap area and occupies one eighth of the total kern=
el
> virtual memory space.
> =20
>  Instrumentation of the vmalloc area is optional, unless built with modul=
es,
>  in which case it is required.
> +
> +64 bit support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Currently, only the radix MMU is supported. There have been versions for
> Book3E
> +processors floating around on the mailing list, but nothing has been mer=
ged.
> +
> +KASAN support on Book3S is a bit tricky to get right:
> +
> + - It would be good to support inline instrumentation so as to be able t=
o
> catch
> +   stack issues that cannot be caught with outline mode.
> +
> + - Inline instrumentation requires a fixed offset.
> +
> + - Book3S runs code in real mode after booting. Most notably a lot of KV=
M
> runs
> +   in real mode, and it would be good to be able to instrument it.
> +
> + - Because code runs in real mode after boot, the offset has to point to
> +   valid memory both in and out of real mode.
> +
> +One approach is just to give up on inline instrumentation. This way all
> checks
> +can be delayed until after everything set is up correctly, and the
> +address-to-shadow calculations can be overridden. However, the features =
and
> +speed boost provided by inline instrumentation are worth trying to do be=
tter.
> +
> +If _at compile time_ it is known how much contiguous physical memory a s=
ystem
> +has, the top 1/8th of the first block of physical memory can be set asid=
e for
> +the shadow. This is a big hammer and comes with 3 big consequences:
> +
> + - there's no nice way to handle physically discontiguous memory, so onl=
y the
> +   first physical memory block can be used.
> +
> + - kernels will simply fail to boot on machines with less memory than
> specified
> +   when compiling.
> +
> + - kernels running on machines with more memory than specified when comp=
iling
> +   will simply ignore the extra memory.
> +
> +At the moment, this physical memory limit must be set _even for outline
> mode_.
> +This may be changed in a future version - a different implementation cou=
ld be
> +added for outline mode that dynamically allocates shadow at a fixed offs=
et.
> +For example, see https://patchwork.ozlabs.org/patch/795211/
> +
> +This value is configured in CONFIG_PHYS_MEM_SIZE_FOR_KASAN.
> +
> +Tips
> +----
> +
> + - Compile with CONFIG_RELOCATABLE.
> +
> +   In development, boot hangs were observed when building with ftrace an=
d
> KUAP
> +   on. These ended up being due to kernel bloat pushing prom_init calls =
to be
> +   done via the PLT. Because the kernel was not relocatable, and the cal=
ls
> are
> +   done very early, this caused execution to jump off into somewhere
> +   invalid. Enabling relocation fixes this.
> +
> +NUMA/discontiguous physical memory
> +----------------------------------
> +
> +Currently the code cannot really deal with discontiguous physical memory=
.
> Only
> +physical memory that is contiguous from physical address zero can be use=
d.
> The
> +size of that memory, not total memory, must be specified when configurin=
g the
> +kernel.
> +
> +Discontiguous memory can occur on machines with memory spread across mul=
tiple
> +nodes. For example, on a Talos II with 64GB of RAM:
> +
> + - 32GB runs from 0x0 to 0x0000_0008_0000_0000,
> + - then there's a gap,
> + - then the final 32GB runs from 0x0000_2000_0000_0000 to
> 0x0000_2008_0000_0000
> +
> +This can create _significant_ issues:
> +
> + - If the machine is treated as having 64GB of _contiguous_ RAM, the
> +   instrumentation would assume that it ran from 0x0 to
> +   0x0000_0010_0000_0000. The last 1/8th - 0x0000_000e_0000_0000 to
> +   0x0000_0010_0000_0000 would be reserved as the shadow region. But whe=
n the
> +   kernel tried to access any of that, it would be trying to access page=
s
> that
> +   are not physically present.
> +
> + - If the shadow region size is based on the top address, then the shado=
w
> +   region would be 0x2008_0000_0000 / 8 =3D 0x0401_0000_0000 bytes =3D 4=
100 GB of
> +   memory, clearly more than the 64GB of RAM physically present.
> +
> +Therefore, the code currently is restricted to dealing with memory in th=
e
> node
> +starting at 0x0. For this system, that's 32GB. If a contiguous physical
> memory
> +size greater than the size of the first contiguous region of memory is
> +specified, the system will be unable to boot or even print an error mess=
age.
> +
> +The layout of a system's memory can be observed in the messages that the
> Radix
> +MMU prints on boot. The Talos II discussed earlier has:
> +
> +radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with 1.00 GiB pa=
ges
> (exec)
> +radix-mmu: Mapped 0x0000000040000000-0x0000000800000000 with 1.00 GiB pa=
ges
> +radix-mmu: Mapped 0x0000200000000000-0x0000200800000000 with 1.00 GiB pa=
ges
> +
> +As discussed, this system would be configured for 32768 MB.
> +
> +Another system prints:
> +
> +radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with 1.00 GiB pa=
ges
> (exec)
> +radix-mmu: Mapped 0x0000000040000000-0x0000002000000000 with 1.00 GiB pa=
ges
> +radix-mmu: Mapped 0x0000200000000000-0x0000202000000000 with 1.00 GiB pa=
ges
> +
> +This machine has more memory: 0x0000_0040_0000_0000 total, but only
> +0x0000_0020_0000_0000 is physically contiguous from zero, so it would be
> +configured for 131072 MB of physically contiguous memory.
> +
> +This restriction currently also affects outline mode, but this could be
> +changed in future if an alternative outline implementation is added.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 497b7d0b2d7e..f1c54c08a88e 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -169,7 +169,9 @@ config PPC
>  	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 &&
> PPC_RADIX_MMU
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_KASAN			if PPC32
> +	select HAVE_ARCH_KASAN			if PPC_BOOK3S_64 &&
> PPC_RADIX_MMU
>  	select HAVE_ARCH_KASAN_VMALLOC		if PPC32
> +	select HAVE_ARCH_KASAN_VMALLOC		if PPC_BOOK3S_64 &&
> PPC_RADIX_MMU
>  	select HAVE_ARCH_KGDB
>  	select HAVE_ARCH_MMAP_RND_BITS
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> index 0b063830eea8..faed301a3b10 100644
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -394,7 +394,28 @@ config PPC_FAST_ENDIAN_SWITCH
>  	help
>  	  If you're unsure what this is, say N.
> =20
> +config PHYS_MEM_SIZE_FOR_KASAN
> +	int "Contiguous physical memory size for KASAN (MB)" if KASAN &&
> PPC_BOOK3S_64
> +	default 1024
> +	help
> +
> +	  To get inline instrumentation support for KASAN on 64-bit Book3S
> +	  machines, you need to know how much contiguous physical memory your
> +	  system has. A shadow offset will be calculated based on this figure,
> +	  which will be compiled in to the kernel. KASAN will use this offset
> +	  to access its shadow region, which is used to verify memory accesses.
> +
> +	  If you attempt to boot on a system with less memory than you specify
> +	  here, your system will fail to boot very early in the process. If you
> +	  boot on a system with more memory than you specify, the extra memory
> +	  will wasted - it will be reserved and not used.
> +
> +	  For systems with discontiguous blocks of physical memory, specify the
> +	  size of the block starting at 0x0. You can determine this by looking
> +	  at the memory layout info printed to dmesg by the radix MMU code
> +	  early in boot. See Documentation/powerpc/kasan.txt.
> +
>  config KASAN_SHADOW_OFFSET
>  	hex
> -	depends on KASAN
> +	depends on KASAN && PPC32
>  	default 0xe0000000
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index f35730548e42..eb47dc768c0a 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -230,6 +230,17 @@ ifdef CONFIG_476FPE_ERR46
>  		-T $(srctree)/arch/powerpc/platforms/44x/ppc476_modules.lds
>  endif
> =20
> +ifdef CONFIG_PPC_BOOK3S_64
> +# The KASAN shadow offset is such that linear map (0xc000...) is shadowe=
d by
> +# the last 8th of linearly mapped physical memory. This way, if the code=
 uses
> +# 0xc addresses throughout, accesses work both in in real mode (where th=
e top
> +# bits are ignored) and outside of real mode.
> +#
> +# 0xc000000000000000 >> 3 =3D 0xa800000000000000 =3D 1210567579837189324=
8
> +KASAN_SHADOW_OFFSET =3D $(shell echo 7 \* 1024 \* 1024 \*
> $(CONFIG_PHYS_MEM_SIZE_FOR_KASAN) / 8 + 12105675798371893248 | bc)
> +KBUILD_CFLAGS +=3D -DKASAN_SHADOW_OFFSET=3D$(KASAN_SHADOW_OFFSET)UL
> +endif
> +
>  # No AltiVec or VSX instructions when building kernel
>  KBUILD_CFLAGS +=3D $(call cc-option,-mno-altivec)
>  KBUILD_CFLAGS +=3D $(call cc-option,-mno-vsx)
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h
> b/arch/powerpc/include/asm/book3s/64/hash.h
> index 2781ebf6add4..fce329b8452e 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -18,6 +18,10 @@
>  #include <asm/book3s/64/hash-4k.h>
>  #endif
> =20
> +#define H_PTRS_PER_PTE		(1 << H_PTE_INDEX_SIZE)
> +#define H_PTRS_PER_PMD		(1 << H_PMD_INDEX_SIZE)
> +#define H_PTRS_PER_PUD		(1 << H_PUD_INDEX_SIZE)
> +
>  /* Bits to set in a PMD/PUD/PGD entry valid bit*/
>  #define HASH_PMD_VAL_BITS		(0x8000000000000000UL)
>  #define HASH_PUD_VAL_BITS		(0x8000000000000000UL)
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h
> b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 201a69e6a355..309fb925a96e 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -231,6 +231,13 @@ extern unsigned long __pmd_frag_size_shift;
>  #define PTRS_PER_PUD	(1 << PUD_INDEX_SIZE)
>  #define PTRS_PER_PGD	(1 << PGD_INDEX_SIZE)
> =20
> +#define MAX_PTRS_PER_PTE	((H_PTRS_PER_PTE > R_PTRS_PER_PTE) ? \
> +				  H_PTRS_PER_PTE : R_PTRS_PER_PTE)
> +#define MAX_PTRS_PER_PMD	((H_PTRS_PER_PMD > R_PTRS_PER_PMD) ? \
> +				  H_PTRS_PER_PMD : R_PTRS_PER_PMD)
> +#define MAX_PTRS_PER_PUD	((H_PTRS_PER_PUD > R_PTRS_PER_PUD) ? \
> +				  H_PTRS_PER_PUD : R_PTRS_PER_PUD)
> +
>  /* PMD_SHIFT determines what a second-level page table entry can map */
>  #define PMD_SHIFT	(PAGE_SHIFT + PTE_INDEX_SIZE)
>  #define PMD_SIZE	(1UL << PMD_SHIFT)
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h
> b/arch/powerpc/include/asm/book3s/64/radix.h
> index d97db3ad9aae..4f826259de71 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -35,6 +35,11 @@
>  #define RADIX_PMD_SHIFT		(PAGE_SHIFT + RADIX_PTE_INDEX_SIZE)
>  #define RADIX_PUD_SHIFT		(RADIX_PMD_SHIFT + RADIX_PMD_INDEX_SIZE)
>  #define RADIX_PGD_SHIFT		(RADIX_PUD_SHIFT + RADIX_PUD_INDEX_SIZE)
> +
> +#define R_PTRS_PER_PTE		(1 << RADIX_PTE_INDEX_SIZE)
> +#define R_PTRS_PER_PMD		(1 << RADIX_PMD_INDEX_SIZE)
> +#define R_PTRS_PER_PUD		(1 << RADIX_PUD_INDEX_SIZE)
> +
>  /*
>   * Size of EA range mapped by our pagetables.
>   */
> diff --git a/arch/powerpc/include/asm/kasan.h
> b/arch/powerpc/include/asm/kasan.h
> index fbff9ff9032e..b21d3ef88214 100644
> --- a/arch/powerpc/include/asm/kasan.h
> +++ b/arch/powerpc/include/asm/kasan.h
> @@ -21,11 +21,18 @@
>  #define KASAN_SHADOW_START	(KASAN_SHADOW_OFFSET + \
>  				 (PAGE_OFFSET >> KASAN_SHADOW_SCALE_SHIFT))
> =20
> +#ifdef CONFIG_KASAN_SHADOW_OFFSET
>  #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
> +#endif
> =20
> +#ifdef CONFIG_PPC32
>  #define KASAN_SHADOW_END	0UL
> +#endif
> =20
> -#define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
> +#ifdef CONFIG_PPC_BOOK3S_64
> +#define KASAN_SHADOW_END	(KASAN_SHADOW_OFFSET + \
> +				 (RADIX_VMEMMAP_END >>
> KASAN_SHADOW_SCALE_SHIFT))
> +#endif
> =20
>  #ifdef CONFIG_KASAN
>  void kasan_early_init(void);
> @@ -38,5 +45,5 @@ static inline void kasan_mmu_init(void) { }
>  static inline void kasan_late_init(void) { }
>  #endif
> =20
> -#endif /* __ASSEMBLY */
> +#endif /* !__ASSEMBLY__ */
>  #endif
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 6620f37abe73..2857c3d44e9c 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -72,6 +72,7 @@ unsigned long tce_alloc_start, tce_alloc_end;
>  u64 ppc64_rma_size;
>  #endif
>  static phys_addr_t first_memblock_size;
> +static phys_addr_t top_phys_addr;
>  static int __initdata boot_cpu_count;
> =20
>  static int __init early_parse_mem(char *p)
> @@ -449,6 +450,26 @@ static bool validate_mem_limit(u64 base, u64 *size)
>  {
>  	u64 max_mem =3D 1UL << (MAX_PHYSMEM_BITS);
> =20
> +	/*
> +	 * To handle the NUMA/discontiguous memory case, don't allow a block
> +	 * to be added if it falls completely beyond the configured physical
> +	 * memory. Print an informational message.
> +	 *
> +	 * Frustratingly we also see this with qemu - it seems to split the
> +	 * specified memory into a number of smaller blocks. If this happens
> +	 * under qemu, it probably represents misconfiguration. So we want
> +	 * the message to be noticeable, but not shouty.
> +	 *
> +	 * See Documentation/powerpc/kasan.txt
> +	 */
> +	if (IS_ENABLED(CONFIG_KASAN) &&
> +	    (base >=3D ((u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN * SZ_1M))) {
> +		pr_warn("KASAN: not adding memory block at %llx (size %llx)\n"
> +			"This could be due to discontiguous memory or kernel
> misconfiguration.",
> +			base, *size);
> +		return false;
> +	}
> +
>  	if (base >=3D max_mem)
>  		return false;
>  	if ((base + *size) > max_mem)
> @@ -572,8 +593,10 @@ void __init early_init_dt_add_memory_arch(u64 base, =
u64
> size)
> =20
>  	/* Add the chunk to the MEMBLOCK list */
>  	if (add_mem_to_memblock) {
> -		if (validate_mem_limit(base, &size))
> +		if (validate_mem_limit(base, &size)) {
>  			memblock_add(base, size);
> +			top_phys_addr =3D max(top_phys_addr, (phys_addr_t)(base +
> size));
> +		}
>  	}
>  }
> =20
> @@ -613,6 +636,8 @@ static void __init early_reserve_mem_dt(void)
>  static void __init early_reserve_mem(void)
>  {
>  	__be64 *reserve_map;
> +	phys_addr_t kasan_shadow_start;
> +	phys_addr_t kasan_memory_size;
> =20
>  	reserve_map =3D (__be64 *)(((unsigned long)initial_boot_params) +
>  			fdt_off_mem_rsvmap(initial_boot_params));
> @@ -651,6 +676,40 @@ static void __init early_reserve_mem(void)
>  		return;
>  	}
>  #endif
> +
> +	if (IS_ENABLED(CONFIG_KASAN) && IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
> +		kasan_memory_size =3D
> +			((phys_addr_t)CONFIG_PHYS_MEM_SIZE_FOR_KASAN * SZ_1M);
> +
> +		if (top_phys_addr < kasan_memory_size) {
> +			/*
> +			 * We are doomed. We shouldn't even be able to get this
> +			 * far, but we do in qemu. If we continue and turn
> +			 * relocations on, we'll take fatal page faults for
> +			 * memory that's not physically present. Instead,
> +			 * panic() here: it will be saved to __log_buf even if
> +			 * it doesn't get printed to the console.
> +			 */
> +			panic("Tried to boot a KASAN kernel configured for %u MB
> with only %llu MB! Aborting.",
> +			      CONFIG_PHYS_MEM_SIZE_FOR_KASAN,
> +			      (u64)(top_phys_addr * SZ_1M));
> +		} else if (top_phys_addr > kasan_memory_size) {
> +			/* print a biiiig warning in hopes people notice */
> +			pr_err("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n"
> +				"Physical memory exceeds compiled-in maximum!\n"
> +				"This kernel was compiled for KASAN with %u MB
> physical memory.\n"
> +				"The physical memory detected is at least %llu
> MB.\n"
> +				"Memory above the compiled limit will not be
> used!\n"
> +				"=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n",
> +				CONFIG_PHYS_MEM_SIZE_FOR_KASAN,
> +				(u64)(top_phys_addr * SZ_1M));
> +		}
> +
> +		kasan_shadow_start =3D _ALIGN_DOWN(kasan_memory_size * 7 / 8,
> PAGE_SIZE);
> +		DBG("reserving %llx -> %llx for KASAN",
> +		    kasan_shadow_start, top_phys_addr);
> +		memblock_reserve(kasan_shadow_start, top_phys_addr -
> kasan_shadow_start);
> +	}
>  }
> =20
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makef=
ile
> index 36a4e1b10b2d..f02b15c78e4d 100644
> --- a/arch/powerpc/mm/kasan/Makefile
> +++ b/arch/powerpc/mm/kasan/Makefile
> @@ -3,3 +3,4 @@
>  KASAN_SANITIZE :=3D n
> =20
>  obj-$(CONFIG_PPC32)           +=3D init_32.o
> +obj-$(CONFIG_PPC_BOOK3S_64)   +=3D init_book3s_64.o
> diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c
> b/arch/powerpc/mm/kasan/init_book3s_64.c
> new file mode 100644
> index 000000000000..1c95fe6495c7
> --- /dev/null
> +++ b/arch/powerpc/mm/kasan/init_book3s_64.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KASAN for 64-bit Book3S powerpc
> + *
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Daniel Axtens <dja@axtens.net>
> + */
> +
> +#define DISABLE_BRANCH_PROFILING
> +
> +#include <linux/kasan.h>
> +#include <linux/printk.h>
> +#include <linux/sched/task.h>
> +#include <asm/pgalloc.h>
> +
> +void __init kasan_init(void)
> +{
> +	int i;
> +	void *k_start =3D kasan_mem_to_shadow((void *)RADIX_KERN_VIRT_START);
> +	void *k_end =3D kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
> +
> +	pte_t pte =3D  pte_mkpte(pfn_pte(virt_to_pfn(kasan_early_shadow_page),
> +				       PAGE_KERNEL));
> +
> +	if (!early_radix_enabled())
> +		panic("KASAN requires radix!");
> +
> +	for (i =3D 0; i < PTRS_PER_PTE; i++)
> +		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
> +			     &kasan_early_shadow_pte[i], pte, 0);
> +
> +	for (i =3D 0; i < PTRS_PER_PMD; i++)
> +		pmd_populate_kernel(&init_mm, &kasan_early_shadow_pmd[i],
> +				    kasan_early_shadow_pte);
> +
> +	for (i =3D 0; i < PTRS_PER_PUD; i++)
> +		pud_populate(&init_mm, &kasan_early_shadow_pud[i],
> +			     kasan_early_shadow_pmd);
> +
> +	memset((void *)KASAN_SHADOW_START, KASAN_SHADOW_INIT,
> +	       ((u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN *
> +		     SZ_1M >> KASAN_SHADOW_SCALE_SHIFT));
> +
> +	kasan_populate_early_shadow(kasan_mem_to_shadow((void
> *)RADIX_KERN_VIRT_START),
> +				    kasan_mem_to_shadow((void
> *)RADIX_VMALLOC_START));
> +
> +	/* leave a hole here for vmalloc */
> +
> +	kasan_populate_early_shadow(
> +		kasan_mem_to_shadow((void *)RADIX_VMALLOC_END),
> +		kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END));
> +
> +	flush_tlb_kernel_range((unsigned long)k_start, (unsigned long)k_end);
> +
> +	/* mark early shadow region as RO and wipe */
> +	pte =3D pte_mkpte(pfn_pte(virt_to_pfn(kasan_early_shadow_page),
> PAGE_KERNEL_RO));
> +	for (i =3D 0; i < PTRS_PER_PTE; i++)
> +		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
> +			     &kasan_early_shadow_pte[i], pte, 0);
> +
> +	/*
> +	 * clear_page relies on some cache info that hasn't been set up yet.
> +	 * It ends up looping ~forever and blows up other data.
> +	 * Use memset instead.
> +	 */
> +	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
> +
> +	/* Enable error messages */
> +	init_task.kasan_depth =3D 0;
> +	pr_info("KASAN init done (64-bit Book3S heavyweight mode)\n");
> +}
> +
> +void __init kasan_late_init(void) { }
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptd=
ump.c
> index 206156255247..b982dc5441c0 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -73,6 +73,10 @@ struct addr_marker {
> =20
>  static struct addr_marker address_markers[] =3D {
>  	{ 0,	"Start of kernel VM" },
> +#if defined(CONFIG_PPC64) && defined(CONFIG_KASAN)
> +	{ 0,	"kasan shadow mem start" },
> +	{ 0,	"kasan shadow mem end" },
> +#endif
>  	{ 0,	"vmalloc() Area" },
>  	{ 0,	"vmalloc() End" },
>  #ifdef CONFIG_PPC64
> @@ -92,10 +96,10 @@ static struct addr_marker address_markers[] =3D {
>  #endif
>  	{ 0,	"Fixmap start" },
>  	{ 0,	"Fixmap end" },
> -#endif
>  #ifdef CONFIG_KASAN
>  	{ 0,	"kasan shadow mem start" },
>  	{ 0,	"kasan shadow mem end" },
> +#endif
>  #endif
>  	{ -1,	NULL },
>  };
> @@ -317,6 +321,10 @@ static void populate_markers(void)
>  	int i =3D 0;
> =20
>  	address_markers[i++].start_address =3D PAGE_OFFSET;
> +#if defined(CONFIG_PPC64) && defined(CONFIG_KASAN)
> +	address_markers[i++].start_address =3D KASAN_SHADOW_START;
> +	address_markers[i++].start_address =3D KASAN_SHADOW_END;
> +#endif
>  	address_markers[i++].start_address =3D VMALLOC_START;
>  	address_markers[i++].start_address =3D VMALLOC_END;
>  #ifdef CONFIG_PPC64
> diff --git a/arch/powerpc/platforms/Kconfig.cputype
> b/arch/powerpc/platforms/Kconfig.cputype
> index 6caedc88474f..cedc86686e65 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -99,6 +99,7 @@ config PPC_BOOK3S_64
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select IRQ_WORK
>  	select PPC_MM_SLICES
> +	select KASAN_VMALLOC if KASAN
> =20
>  config PPC_BOOK3E_64
>  	bool "Embedded processors"

