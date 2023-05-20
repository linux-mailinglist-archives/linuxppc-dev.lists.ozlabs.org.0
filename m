Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B260A70AA77
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 20:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNsjh4LVMz3fLm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 May 2023 04:31:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCTE6+xf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCTE6+xf;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNshn5CM4z3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 May 2023 04:30:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9022A609FF;
	Sat, 20 May 2023 18:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0881BC433EF;
	Sat, 20 May 2023 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684607430;
	bh=7bZMk9WzE2kSRLSK4qtNwbAEcU/FLgU3JXmCsmrWl1o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=FCTE6+xf0QXhixNgNnAr22sq6rNmQtfXERoWAsWb/jq6ncfvg26koZ7JWCoW4ZVbK
	 Yx3fsfnnPa5TuGTFmHiZv0r2tlIi8jn06zCpzbqpsF0c0lilEIaeUft+PLkncPtgzB
	 i1Z1c+MzJG1e2FvyIGgQlJOpy5GShYEkCDDcmflrAo/1i/5rYtqt4cucBmEuF902kg
	 C97kauR35q50Pks0pE42bc0/pBcxRb1gIUYG+oIlAfHjr8u/R6lYfaGl/OZxgfOh8k
	 Il6tsHpsoCTQfFmpbxviLgNdnTddjDotqMviT7QRKKNUeHfFabhAyWV0W9Ns0ysnes
	 n1T+dZIGV00ag==
Date: Sat, 20 May 2023 23:58:01 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20230519192600.2593506-1-naveen@kernel.org>
	<3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
In-Reply-To: <3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1684606745.vlpj5zhydx.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 19/05/2023 =C3=A0 21:26, Naveen N Rao a =C3=A9crit=C2=A0:
>> [Vous ne recevez pas souvent de courriers de naveen@kernel.org. D=C3=A9c=
ouvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutSenderId=
entification ]
>>=20
>> Refactor ftrace code and move to using ftrace_replace_code() to help
>> simplify and make the code more maintainable.
>>=20
>> - The existing ftrace.c code is moved to a separate file so that ppc64
>>    elfv1 and clang -pg only support continue. This makes it possible to
>>    converge ppc32 and ppc64 support further.
>> - Drop code to re-purpose compiler-generated long branches for ftrace
>>    use in support of large kernels. We still retain the ftrace stubs at
>>    the end of .text, so we now support kernels upto ~64MB.
>> - Add ftrace_init_nop() to keep boot-time validations and init separate
>>    from runtime.
>> - Implement ftrace_replace_code() to simplify overall ftrace setup. This
>>    will be especially useful when adding ability to nop out 'mflr r0'
>>    later, and for other subsequent ftrace features.
>> - Add support for -fpatchable-function-entry. On ppc64, this needs gcc
>>    v13.1 so that the nops are generated at LEP. This also moves ppc32 to
>>    using the same two-instruction sequence as that of ppc64.
>>=20
>> This applies atop patches 1-3 of Nick's series for elfv2 conversion, as
>> well as Nick's patch enabling -mprofile-kernel for elfv2 BE:
>> - https://lore.kernel.org/all/20230505071850.228734-1-npiggin@gmail.com/
>> - https://lore.kernel.org/all/20230506011814.8766-1-npiggin@gmail.com/
>>=20
>> This builds for me and passes a quick test, posting this as an early
>> RFC.
>>=20
>> Signed-off-by: Naveen N Rao <naveen@kernel.org>
>=20
> Looks good, works on PPC32 but I observed some performance degradation,=20
> around 25% more time needed to activate function tracer and around 10%=20
> more time needed to de-activate function tracer (by writting=20
> function/nop into /sys/kernel/debug/tracing/current_tracer.
>=20
> Note that the trampoline at end of .text is only on PPC64 at the moment,=20
> so if PPC32 kernel goes beyond 32M we will have a problem (it happens=20
> with allyesconfig). It should be easy to extend it to PPC32.

Indeed, let me make that change.

>=20
> At the begining of ftrace_replace_code(), don't you miss:
>=20
> 	if (unlikely(ftrace_disabled))
> 		return;

ftrace_disabled is a static, so it can't be tested here. FWIW, x86 also=20
implements ftrace_replace_code(), and doesn't test ftrace_disabled.

Looking at the call path, it looks like it gets tested much before, so=20
may not be necessary. It sure would be good to get Steven's view on=20
this.

>=20
> Below fix needed in order to build:
>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace.c=20
> b/arch/powerpc/kernel/trace/ftrace.c
> index a9d57f338bd7..81d5bd69b660 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -96,7 +96,6 @@ static unsigned long find_ftrace_tramp(unsigned long ip=
)
>=20
>   static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long=20
> addr, ppc_inst_t *call_inst)
>   {
> -	struct module *mod =3D rec->arch.mod;
>   	unsigned long ip =3D rec->ip;
>   	unsigned long stub;
>=20
> @@ -112,7 +111,11 @@ static int ftrace_get_call_inst(struct dyn_ftrace=20
> *rec, unsigned long addr, ppc_
>   		}
>   	} else if (IS_ENABLED(CONFIG_MODULES)) {
>   		/* Module code would be going to one of the module stubs */
> +#ifdef CONFIG_MODULES
> +		struct module *mod =3D rec->arch.mod;
> +
>   		stub =3D (addr =3D=3D (unsigned long)ftrace_caller ? mod->arch.tramp =
:=20
> mod->arch.tramp_regs);
> +#endif
>   	} else {
>   		return -EINVAL;
>   	}

Thanks! I'll fold this in.


- Naveen

>=20
>=20
> Christophe
>=20
>> ---
>>   arch/powerpc/Kconfig                          |  10 +
>>   arch/powerpc/Makefile                         |   5 +
>>   arch/powerpc/include/asm/ftrace.h             |  10 +-
>>   arch/powerpc/include/asm/module.h             |   4 -
>>   arch/powerpc/kernel/trace/Makefile            |   8 +-
>>   arch/powerpc/kernel/trace/ftrace.c            | 816 +++++------------
>>   arch/powerpc/kernel/trace/ftrace_pg.c         | 846 ++++++++++++++++++
>>   .../gcc-check-fpatchable-function-entry.sh    |  20 +
>>   8 files changed, 1106 insertions(+), 613 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/trace/ftrace_pg.c
>>   create mode 100755 arch/powerpc/tools/gcc-check-fpatchable-function-en=
try.sh
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 902b6b99f7ecd5..6db94723af7d30 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -187,6 +187,7 @@ config PPC
>>          select DYNAMIC_FTRACE                   if FUNCTION_TRACER
>>          select EDAC_ATOMIC_SCRUB
>>          select EDAC_SUPPORT
>> +       select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if ARCH_USING_=
PATCHABLE_FUNCTION_ENTRY
>>          select GENERIC_ATOMIC64                 if PPC32
>>          select GENERIC_CLOCKEVENTS_BROADCAST    if SMP
>>          select GENERIC_CMOS_UPDATE
>> @@ -552,6 +553,15 @@ config MPROFILE_KERNEL
>>          def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mpro=
file-kernel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
>>          def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mpro=
file-kernel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
>>=20
>> +config ARCH_HAS_PATCHABLE_FUNCTION_ENTRY_AT_LEP
>> +       depends on PPC64_ELF_ABI_V2 && FUNCTION_TRACER
>> +       def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatc=
hable-function-entry.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
>> +       def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatc=
hable-function-entry.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
>> +
>> +config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>> +       depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
>> +       def_bool ARCH_HAS_PATCHABLE_FUNCTION_ENTRY_AT_LEP || (PPC32 && $=
(cc-option, -fpatchable-function-entry=3D2))
>> +
>>   config HOTPLUG_CPU
>>          bool "Support for enabling/disabling CPUs"
>>          depends on SMP && (PPC_PSERIES || \
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index dca73f673d7046..de39478b1c9e9f 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -148,11 +148,16 @@ CFLAGS-$(CONFIG_PPC32)    +=3D $(call cc-option, $=
(MULTIPLEWORD))
>>   CFLAGS-$(CONFIG_PPC32) +=3D $(call cc-option,-mno-readonly-in-sdata)
>>=20
>>   ifdef CONFIG_FUNCTION_TRACER
>> +ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>> +KBUILD_CPPFLAGS        +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>> +CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
>> +else
>>   CC_FLAGS_FTRACE :=3D -pg
>>   ifdef CONFIG_MPROFILE_KERNEL
>>   CC_FLAGS_FTRACE +=3D -mprofile-kernel
>>   endif
>>   endif
>> +endif
>>=20
>>   CFLAGS-$(CONFIG_TARGET_CPU_BOOL) +=3D -mcpu=3D$(CONFIG_TARGET_CPU)
>>   AFLAGS-$(CONFIG_TARGET_CPU_BOOL) +=3D -mcpu=3D$(CONFIG_TARGET_CPU)
>> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/as=
m/ftrace.h
>> index 91c049d51d0e10..d1a16543a37b00 100644
>> --- a/arch/powerpc/include/asm/ftrace.h
>> +++ b/arch/powerpc/include/asm/ftrace.h
>> @@ -22,18 +22,26 @@ extern void _mcount(void);
>>=20
>>   static inline unsigned long ftrace_call_adjust(unsigned long addr)
>>   {
>> -       /* relocation of mcount call site is the same as the address */
>> +       if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
>> +               addr +=3D MCOUNT_INSN_SIZE;
>> +
>>          return addr;
>>   }
>>=20
>>   unsigned long prepare_ftrace_return(unsigned long parent, unsigned lon=
g ip,
>>                                      unsigned long sp);
>>=20
>> +struct module;
>> +struct dyn_ftrace;
>>   struct dyn_arch_ftrace {
>>          struct module *mod;
>>   };
>>=20
>>   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
>> +#define ftrace_need_init_nop() (true)
>> +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>> +#define ftrace_init_nop ftrace_init_nop
>> +
>>   struct ftrace_regs {
>>          struct pt_regs regs;
>>   };
>> diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/as=
m/module.h
>> index ac53606c259430..a8e2e8339fb7f4 100644
>> --- a/arch/powerpc/include/asm/module.h
>> +++ b/arch/powerpc/include/asm/module.h
>> @@ -75,10 +75,6 @@ struct mod_arch_specific {
>>   #endif
>>=20
>>   #ifdef CONFIG_DYNAMIC_FTRACE
>> -#    ifdef MODULE
>> -       asm(".section .ftrace.tramp,\"ax\",@nobits; .align 3; .previous"=
);
>> -#    endif     /* MODULE */
>> -
>>   int module_trampoline_target(struct module *mod, unsigned long trampol=
ine,
>>                               unsigned long *target);
>>   int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sechdrs=
);
>> diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/tr=
ace/Makefile
>> index b16a9f9c0b35f2..2296bbbd775ac8 100644
>> --- a/arch/powerpc/kernel/trace/Makefile
>> +++ b/arch/powerpc/kernel/trace/Makefile
>> @@ -8,13 +8,13 @@ ifdef CONFIG_FUNCTION_TRACER
>>   CFLAGS_REMOVE_ftrace.o =3D $(CC_FLAGS_FTRACE)
>>   endif
>>=20
>> -obj32-$(CONFIG_FUNCTION_TRACER)                +=3D ftrace_mprofile.o
>> +obj32-$(CONFIG_FUNCTION_TRACER)                +=3D ftrace_mprofile.o f=
trace.o
>>   ifdef CONFIG_MPROFILE_KERNEL
>> -obj64-$(CONFIG_FUNCTION_TRACER)                +=3D ftrace_mprofile.o
>> +obj64-$(CONFIG_FUNCTION_TRACER)                +=3D ftrace_mprofile.o f=
trace.o
>>   else
>> -obj64-$(CONFIG_FUNCTION_TRACER)                +=3D ftrace_64_pg.o
>> +obj64-$(CONFIG_FUNCTION_TRACER)                +=3D ftrace_64_pg.o ftra=
ce_pg.o
>>   endif
>> -obj-$(CONFIG_FUNCTION_TRACER)          +=3D ftrace_low.o ftrace.o
>> +obj-$(CONFIG_FUNCTION_TRACER)          +=3D ftrace_low.o
>>   obj-$(CONFIG_TRACING)                  +=3D trace_clock.o
>>=20
>>   obj-$(CONFIG_PPC64)                    +=3D $(obj64-y)
>> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tr=
ace/ftrace.c
>> index a47f303734233b..a9d57f338bd78e 100644
>> --- a/arch/powerpc/kernel/trace/ftrace.c
>> +++ b/arch/powerpc/kernel/trace/ftrace.c
>> @@ -28,64 +28,52 @@
>>   #include <asm/syscall.h>
>>   #include <asm/inst.h>
>>=20
>> -/*
>> - * We generally only have a single long_branch tramp and at most 2 or 3=
 plt
>> - * tramps generated. But, we don't use the plt tramps currently. We als=
o allot
>> - * 2 tramps after .text and .init.text. So, we only end up with around =
3 usable
>> - * tramps in total. Set aside 8 just to be sure.
>> - */
>> -#define        NUM_FTRACE_TRAMPS       8
>> +#define        NUM_FTRACE_TRAMPS       2
>>   static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
>>=20
>> -static ppc_inst_t
>> -ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
>> +static ppc_inst_t ftrace_create_branch_inst(unsigned long ip, unsigned =
long addr, int link)
>>   {
>>          ppc_inst_t op;
>>=20
>> -       addr =3D ppc_function_entry((void *)addr);
>> -
>> -       /* if (link) set op to 'bl' else 'b' */
>> +       WARN_ON(!is_offset_in_branch_range(addr - ip));
>>          create_branch(&op, (u32 *)ip, addr, link ? BRANCH_SET_LINK : 0)=
;
>>=20
>>          return op;
>>   }
>>=20
>> -static inline int
>> -ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
>> +static inline int ftrace_read_inst(unsigned long ip, ppc_inst_t *op)
>>   {
>> -       ppc_inst_t replaced;
>> -
>> -       /*
>> -        * Note:
>> -        * We are paranoid about modifying text, as if a bug was to happ=
en, it
>> -        * could cause us to read or write to someplace that could cause=
 harm.
>> -        * Carefully read and modify the code with probe_kernel_*(), and=
 make
>> -        * sure what we read is what we expected it to be before modifyi=
ng it.
>> -        */
>> -
>> -       /* read the text we want to modify */
>> -       if (copy_inst_from_kernel_nofault(&replaced, (void *)ip))
>> +       if (copy_inst_from_kernel_nofault(op, (void *)ip)) {
>> +               pr_err("0x%lx: fetching instruction failed\n", ip);
>>                  return -EFAULT;
>> -
>> -       /* Make sure it is what we expect it to be */
>> -       if (!ppc_inst_equal(replaced, old)) {
>> -               pr_err("%p: replaced (%08lx) !=3D old (%08lx)", (void *)=
ip,
>> -                      ppc_inst_as_ulong(replaced), ppc_inst_as_ulong(ol=
d));
>> -               return -EINVAL;
>>          }
>>=20
>> -       /* replace the text with the new text */
>> -       return patch_instruction((u32 *)ip, new);
>> +       return 0;
>>   }
>>=20
>> -/*
>> - * Helper functions that are the same for both PPC64 and PPC32.
>> - */
>> -static int test_24bit_addr(unsigned long ip, unsigned long addr)
>> +static inline int ftrace_validate_inst(unsigned long ip, ppc_inst_t ins=
t)
>>   {
>> -       addr =3D ppc_function_entry((void *)addr);
>> +       ppc_inst_t op;
>> +       int ret;
>>=20
>> -       return is_offset_in_branch_range(addr - ip);
>> +       ret =3D ftrace_read_inst(ip, &op);
>> +       if (!ret && !ppc_inst_equal(op, inst)) {
>> +               pr_err("0x%lx: expected (%08lx) !=3D found (%08lx)\n",
>> +                               ip, ppc_inst_as_ulong(inst), ppc_inst_as=
_ulong(op));
>> +               ret =3D -EINVAL;
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +static inline int ftrace_modify_code(unsigned long ip, ppc_inst_t old, =
ppc_inst_t new)
>> +{
>> +       int ret =3D ftrace_validate_inst(ip, old);
>> +
>> +       if (!ret)
>> +               ret =3D patch_instruction((u32 *)ip, new);
>> +
>> +       return ret;
>>   }
>>=20
>>   static int is_bl_op(ppc_inst_t op)
>> @@ -93,138 +81,11 @@ static int is_bl_op(ppc_inst_t op)
>>          return (ppc_inst_val(op) & ~PPC_LI_MASK) =3D=3D PPC_RAW_BL(0);
>>   }
>>=20
>> -static int is_b_op(ppc_inst_t op)
>> -{
>> -       return (ppc_inst_val(op) & ~PPC_LI_MASK) =3D=3D PPC_RAW_BRANCH(0=
);
>> -}
>> -
>> -static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
>> -{
>> -       int offset;
>> -
>> -       offset =3D PPC_LI(ppc_inst_val(op));
>> -       /* make it signed */
>> -       if (offset & 0x02000000)
>> -               offset |=3D 0xfe000000;
>> -
>> -       return ip + (long)offset;
>> -}
>> -
>> -#ifdef CONFIG_MODULES
>> -static int
>> -__ftrace_make_nop(struct module *mod,
>> -                 struct dyn_ftrace *rec, unsigned long addr)
>> -{
>> -       unsigned long entry, ptr, tramp;
>> -       unsigned long ip =3D rec->ip;
>> -       ppc_inst_t op, pop;
>> -
>> -       /* read where this goes */
>> -       if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
>> -               pr_err("Fetching opcode failed.\n");
>> -               return -EFAULT;
>> -       }
>> -
>> -       /* Make sure that this is still a 24bit jump */
>> -       if (!is_bl_op(op)) {
>> -               pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as=
_ulong(op));
>> -               return -EINVAL;
>> -       }
>> -
>> -       /* lets find where the pointer goes */
>> -       tramp =3D find_bl_target(ip, op);
>> -
>> -       pr_devel("ip:%lx jumps to %lx", ip, tramp);
>> -
>> -       if (module_trampoline_target(mod, tramp, &ptr)) {
>> -               pr_err("Failed to get trampoline target\n");
>> -               return -EFAULT;
>> -       }
>> -
>> -       pr_devel("trampoline target %lx", ptr);
>> -
>> -       entry =3D ppc_global_function_entry((void *)addr);
>> -       /* This should match what was called */
>> -       if (ptr !=3D entry) {
>> -               pr_err("addr %lx does not match expected %lx\n", ptr, en=
try);
>> -               return -EINVAL;
>> -       }
>> -
>> -       if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
>> -               if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))=
) {
>> -                       pr_err("Fetching instruction at %lx failed.\n", =
ip - 4);
>> -                       return -EFAULT;
>> -               }
>> -
>> -               /* We expect either a mflr r0, or a std r0, LRSAVE(r1) *=
/
>> -               if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
>> -                   !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
>> -                       pr_err("Unexpected instruction %08lx around bl _=
mcount\n",
>> -                              ppc_inst_as_ulong(op));
>> -                       return -EINVAL;
>> -               }
>> -       } else if (IS_ENABLED(CONFIG_PPC64)) {
>> -               /*
>> -                * Check what is in the next instruction. We can see ld =
r2,40(r1), but
>> -                * on first pass after boot we will see mflr r0.
>> -                */
>> -               if (copy_inst_from_kernel_nofault(&op, (void *)(ip + 4))=
) {
>> -                       pr_err("Fetching op failed.\n");
>> -                       return -EFAULT;
>> -               }
>> -
>> -               if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
>> -                       pr_err("Expected %08lx found %08lx\n", PPC_INST_=
LD_TOC,
>> -                              ppc_inst_as_ulong(op));
>> -                       return -EINVAL;
>> -               }
>> -       }
>> -
>> -       /*
>> -        * When using -mprofile-kernel or PPC32 there is no load to jump=
 over.
>> -        *
>> -        * Otherwise our original call site looks like:
>> -        *
>> -        * bl <tramp>
>> -        * ld r2,XX(r1)
>> -        *
>> -        * Milton Miller pointed out that we can not simply nop the bran=
ch.
>> -        * If a task was preempted when calling a trace function, the no=
ps
>> -        * will remove the way to restore the TOC in r2 and the r2 TOC w=
ill
>> -        * get corrupted.
>> -        *
>> -        * Use a b +8 to jump over the load.
>> -        * XXX: could make PCREL depend on MPROFILE_KERNEL
>> -        * XXX: check PCREL && MPROFILE_KERNEL calling sequence
>> -        */
>> -       if (IS_ENABLED(CONFIG_MPROFILE_KERNEL) || IS_ENABLED(CONFIG_PPC3=
2))
>> -               pop =3D ppc_inst(PPC_RAW_NOP());
>> -       else
>> -               pop =3D ppc_inst(PPC_RAW_BRANCH(8));      /* b +8 */
>> -
>> -       if (patch_instruction((u32 *)ip, pop)) {
>> -               pr_err("Patching NOP failed.\n");
>> -               return -EPERM;
>> -       }
>> -
>> -       return 0;
>> -}
>> -#else
>> -static int __ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec=
, unsigned long addr)
>> -{
>> -       return 0;
>> -}
>> -#endif /* CONFIG_MODULES */
>> -
>>   static unsigned long find_ftrace_tramp(unsigned long ip)
>>   {
>>          int i;
>>=20
>> -       /*
>> -        * We have the compiler generated long_branch tramps at the end
>> -        * and we prefer those
>> -        */
>> -       for (i =3D NUM_FTRACE_TRAMPS - 1; i >=3D 0; i--)
>> +       for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
>>                  if (!ftrace_tramps[i])
>>                          continue;
>>                  else if (is_offset_in_branch_range(ftrace_tramps[i] - i=
p))
>> @@ -233,449 +94,200 @@ static unsigned long find_ftrace_tramp(unsigned l=
ong ip)
>>          return 0;
>>   }
>>=20
>> -static int add_ftrace_tramp(unsigned long tramp)
>> +static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long a=
ddr, ppc_inst_t *call_inst)
>>   {
>> -       int i;
>> -
>> -       for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
>> -               if (!ftrace_tramps[i]) {
>> -                       ftrace_tramps[i] =3D tramp;
>> -                       return 0;
>> -               }
>> -
>> -       return -1;
>> -}
>> -
>> -/*
>> - * If this is a compiler generated long_branch trampoline (essentially,=
 a
>> - * trampoline that has a branch to _mcount()), we re-write the branch t=
o
>> - * instead go to ftrace_[regs_]caller() and note down the location of t=
his
>> - * trampoline.
>> - */
>> -static int setup_mcount_compiler_tramp(unsigned long tramp)
>> -{
>> -       int i;
>> -       ppc_inst_t op;
>> -       unsigned long ptr;
>> -
>> -       /* Is this a known long jump tramp? */
>> -       for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
>> -               if (ftrace_tramps[i] =3D=3D tramp)
>> -                       return 0;
>> -
>> -       /* New trampoline -- read where this goes */
>> -       if (copy_inst_from_kernel_nofault(&op, (void *)tramp)) {
>> -               pr_debug("Fetching opcode failed.\n");
>> -               return -1;
>> -       }
>> -
>> -       /* Is this a 24 bit branch? */
>> -       if (!is_b_op(op)) {
>> -               pr_debug("Trampoline is not a long branch tramp.\n");
>> -               return -1;
>> -       }
>> -
>> -       /* lets find where the pointer goes */
>> -       ptr =3D find_bl_target(tramp, op);
>> -
>> -       if (ptr !=3D ppc_global_function_entry((void *)_mcount)) {
>> -               pr_debug("Trampoline target %p is not _mcount\n", (void =
*)ptr);
>> -               return -1;
>> -       }
>> -
>> -       /* Let's re-write the tramp to go to ftrace_[regs_]caller */
>> -       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
>> -               ptr =3D ppc_global_function_entry((void *)ftrace_regs_ca=
ller);
>> -       else
>> -               ptr =3D ppc_global_function_entry((void *)ftrace_caller)=
;
>> -
>> -       if (patch_branch((u32 *)tramp, ptr, 0)) {
>> -               pr_debug("REL24 out of range!\n");
>> -               return -1;
>> -       }
>> -
>> -       if (add_ftrace_tramp(tramp)) {
>> -               pr_debug("No tramp locations left\n");
>> -               return -1;
>> -       }
>> -
>> -       return 0;
>> -}
>> -
>> -static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned lo=
ng addr)
>> -{
>> -       unsigned long tramp, ip =3D rec->ip;
>> -       ppc_inst_t op;
>> -
>> -       /* Read where this goes */
>> -       if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
>> -               pr_err("Fetching opcode failed.\n");
>> -               return -EFAULT;
>> -       }
>> -
>> -       /* Make sure that this is still a 24bit jump */
>> -       if (!is_bl_op(op)) {
>> -               pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as=
_ulong(op));
>> -               return -EINVAL;
>> -       }
>> -
>> -       /* Let's find where the pointer goes */
>> -       tramp =3D find_bl_target(ip, op);
>> -
>> -       pr_devel("ip:%lx jumps to %lx", ip, tramp);
>> -
>> -       if (setup_mcount_compiler_tramp(tramp)) {
>> -               /* Are other trampolines reachable? */
>> -               if (!find_ftrace_tramp(ip)) {
>> -                       pr_err("No ftrace trampolines reachable from %ps=
\n",
>> -                                       (void *)ip);
>> -                       return -EINVAL;
>> -               }
>> -       }
>> -
>> -       if (patch_instruction((u32 *)ip, ppc_inst(PPC_RAW_NOP()))) {
>> -               pr_err("Patching NOP failed.\n");
>> -               return -EPERM;
>> -       }
>> -
>> -       return 0;
>> -}
>> -
>> -int ftrace_make_nop(struct module *mod,
>> -                   struct dyn_ftrace *rec, unsigned long addr)
>> -{
>> -       unsigned long ip =3D rec->ip;
>> -       ppc_inst_t old, new;
>> -
>> -       /*
>> -        * If the calling address is more that 24 bits away,
>> -        * then we had to use a trampoline to make the call.
>> -        * Otherwise just update the call site.
>> -        */
>> -       if (test_24bit_addr(ip, addr)) {
>> -               /* within range */
>> -               old =3D ftrace_call_replace(ip, addr, 1);
>> -               new =3D ppc_inst(PPC_RAW_NOP());
>> -               return ftrace_modify_code(ip, old, new);
>> -       } else if (core_kernel_text(ip)) {
>> -               return __ftrace_make_nop_kernel(rec, addr);
>> -       } else if (!IS_ENABLED(CONFIG_MODULES)) {
>> -               return -EINVAL;
>> -       }
>> -
>> -       /*
>> -        * Out of range jumps are called from modules.
>> -        * We should either already have a pointer to the module
>> -        * or it has been passed in.
>> -        */
>> -       if (!rec->arch.mod) {
>> -               if (!mod) {
>> -                       pr_err("No module loaded addr=3D%lx\n", addr);
>> -                       return -EFAULT;
>> -               }
>> -               rec->arch.mod =3D mod;
>> -       } else if (mod) {
>> -               if (mod !=3D rec->arch.mod) {
>> -                       pr_err("Record mod %p not equal to passed in mod=
 %p\n",
>> -                              rec->arch.mod, mod);
>> -                       return -EINVAL;
>> -               }
>> -               /* nothing to do if mod =3D=3D rec->arch.mod */
>> -       } else
>> -               mod =3D rec->arch.mod;
>> -
>> -       return __ftrace_make_nop(mod, rec, addr);
>> -}
>> -
>> -#ifdef CONFIG_MODULES
>> -/*
>> - * Examine the existing instructions for __ftrace_make_call.
>> - * They should effectively be a NOP, and follow formal constraints,
>> - * depending on the ABI. Return false if they don't.
>> - */
>> -static bool expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t =
op1)
>> -{
>> -       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
>> -               return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
>> -       else
>> -               return ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) =
&&
>> -                      ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC));
>> -}
>> -
>> -static int
>> -__ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>> -{
>> -       ppc_inst_t op[2];
>> -       void *ip =3D (void *)rec->ip;
>> -       unsigned long entry, ptr, tramp;
>>          struct module *mod =3D rec->arch.mod;
>> -
>> -       /* read where this goes */
>> -       if (copy_inst_from_kernel_nofault(op, ip))
>> -               return -EFAULT;
>> -
>> -       if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) &&
>> -           copy_inst_from_kernel_nofault(op + 1, ip + 4))
>> -               return -EFAULT;
>> -
>> -       if (!expected_nop_sequence(ip, op[0], op[1])) {
>> -               pr_err("Unexpected call sequence at %p: %08lx %08lx\n", =
ip,
>> -                      ppc_inst_as_ulong(op[0]), ppc_inst_as_ulong(op[1]=
));
>> -               return -EINVAL;
>> -       }
>> -
>> -       /* If we never set up ftrace trampoline(s), then bail */
>> -       if (!mod->arch.tramp ||
>> -           (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !mod->arch.t=
ramp_regs)) {
>> -               pr_err("No ftrace trampoline\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && rec->flags & =
FTRACE_FL_REGS)
>> -               tramp =3D mod->arch.tramp_regs;
>> -       else
>> -               tramp =3D mod->arch.tramp;
>> -
>> -       if (module_trampoline_target(mod, tramp, &ptr)) {
>> -               pr_err("Failed to get trampoline target\n");
>> -               return -EFAULT;
>> -       }
>> -
>> -       pr_devel("trampoline target %lx", ptr);
>> -
>> -       entry =3D ppc_global_function_entry((void *)addr);
>> -       /* This should match what was called */
>> -       if (ptr !=3D entry) {
>> -               pr_err("addr %lx does not match expected %lx\n", ptr, en=
try);
>> -               return -EINVAL;
>> -       }
>> -
>> -       if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
>> -               pr_err("REL24 out of range!\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       return 0;
>> -}
>> -#else
>> -static int __ftrace_make_call(struct dyn_ftrace *rec, unsigned long add=
r)
>> -{
>> -       return 0;
>> -}
>> -#endif /* CONFIG_MODULES */
>> -
>> -static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned l=
ong addr)
>> -{
>> -       ppc_inst_t op;
>> -       void *ip =3D (void *)rec->ip;
>> -       unsigned long tramp, entry, ptr;
>> -
>> -       /* Make sure we're being asked to patch branch to a known ftrace=
 addr */
>> -       entry =3D ppc_global_function_entry((void *)ftrace_caller);
>> -       ptr =3D ppc_global_function_entry((void *)addr);
>> -
>> -       if (ptr !=3D entry && IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS=
))
>> -               entry =3D ppc_global_function_entry((void *)ftrace_regs_=
caller);
>> -
>> -       if (ptr !=3D entry) {
>> -               pr_err("Unknown ftrace addr to patch: %ps\n", (void *)pt=
r);
>> -               return -EINVAL;
>> -       }
>> -
>> -       /* Make sure we have a nop */
>> -       if (copy_inst_from_kernel_nofault(&op, ip)) {
>> -               pr_err("Unable to read ftrace location %p\n", ip);
>> -               return -EFAULT;
>> -       }
>> -
>> -       if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_NOP()))) {
>> -               pr_err("Unexpected call sequence at %p: %08lx\n",
>> -                      ip, ppc_inst_as_ulong(op));
>> -               return -EINVAL;
>> -       }
>> -
>> -       tramp =3D find_ftrace_tramp((unsigned long)ip);
>> -       if (!tramp) {
>> -               pr_err("No ftrace trampolines reachable from %ps\n", ip)=
;
>> -               return -EINVAL;
>> -       }
>> -
>> -       if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
>> -               pr_err("Error patching branch to ftrace tramp!\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       return 0;
>> -}
>> -
>> -int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>> -{
>>          unsigned long ip =3D rec->ip;
>> -       ppc_inst_t old, new;
>> +       unsigned long stub;
>>=20
>> -       /*
>> -        * If the calling address is more that 24 bits away,
>> -        * then we had to use a trampoline to make the call.
>> -        * Otherwise just update the call site.
>> -        */
>> -       if (test_24bit_addr(ip, addr)) {
>> -               /* within range */
>> -               old =3D ppc_inst(PPC_RAW_NOP());
>> -               new =3D ftrace_call_replace(ip, addr, 1);
>> -               return ftrace_modify_code(ip, old, new);
>> +       if (is_offset_in_branch_range(addr - ip)) {
>> +               /* Within range */
>> +               stub =3D addr;
>>          } else if (core_kernel_text(ip)) {
>> -               return __ftrace_make_call_kernel(rec, addr);
>> -       } else if (!IS_ENABLED(CONFIG_MODULES)) {
>> -               /* We should not get here without modules */
>> +               /* We would be branching to one of our ftrace stubs */
>> +               stub =3D find_ftrace_tramp(ip);
>> +               if (!stub) {
>> +                       pr_err("0x%lx: No ftrace stubs reachable\n", ip)=
;
>> +                       return -EINVAL;
>> +               }
>> +       } else if (IS_ENABLED(CONFIG_MODULES)) {
>> +               /* Module code would be going to one of the module stubs=
 */
>> +               stub =3D (addr =3D=3D (unsigned long)ftrace_caller ? mod=
->arch.tramp : mod->arch.tramp_regs);
>> +       } else {
>>                  return -EINVAL;
>>          }
>>=20
>> -       /*
>> -        * Out of range jumps are called from modules.
>> -        * Being that we are converting from nop, it had better
>> -        * already have a module defined.
>> -        */
>> -       if (!rec->arch.mod) {
>> -               pr_err("No module loaded\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       return __ftrace_make_call(rec, addr);
>> +       *call_inst =3D ftrace_create_branch_inst(ip, stub, 1);
>> +       return 0;
>>   }
>>=20
>>   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>> -#ifdef CONFIG_MODULES
>> -static int
>> -__ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>> -                                       unsigned long addr)
>> +int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, =
unsigned long addr)
>>   {
>> -       ppc_inst_t op;
>> -       unsigned long ip =3D rec->ip;
>> -       unsigned long entry, ptr, tramp;
>> -       struct module *mod =3D rec->arch.mod;
>> +       /* This should never be called since we override ftrace_replace_=
code() */
>> +       WARN_ON(1);
>> +       return -EINVAL;
>> +}
>> +#endif
>>=20
>> -       /* If we never set up ftrace trampolines, then bail */
>> -       if (!mod->arch.tramp || !mod->arch.tramp_regs) {
>> -               pr_err("No ftrace trampoline\n");
>> +int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>> +{
>> +       ppc_inst_t old, new;
>> +       int ret;
>> +
>> +       /* This can only ever be called during module load */
>> +       if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(rec-=
>ip)))
>> +               return -EINVAL;
>> +
>> +       old =3D ppc_inst(PPC_RAW_NOP());
>> +       ret =3D ftrace_get_call_inst(rec, addr, &new);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return ftrace_modify_code(rec->ip, old, new);
>> +}
>> +
>> +int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigne=
d long addr)
>> +{
>> +       /*
>> +        * This should never be called since we override ftrace_replace_=
code(),
>> +        * as well as ftrace_init_nop()
>> +        */
>> +       WARN_ON(1);
>> +       return -EINVAL;
>> +}
>> +
>> +void ftrace_replace_code(int enable)
>> +{
>> +       ppc_inst_t old, new, nop_inst, call_inst, new_call_inst;
>> +       unsigned long ip, new_addr, addr;
>> +       struct ftrace_rec_iter *iter;
>> +       struct dyn_ftrace *rec;
>> +       int ret =3D 0, update;
>> +
>> +       for_ftrace_rec_iter(iter) {
>> +               rec =3D ftrace_rec_iter_record(iter);
>> +               update =3D ftrace_test_record(rec, enable);
>> +               ip =3D rec->ip;
>> +               new_addr =3D 0;
>> +
>> +               switch (update) {
>> +               case FTRACE_UPDATE_IGNORE:
>> +               default:
>> +                       continue;
>> +               case FTRACE_UPDATE_MODIFY_CALL:
>> +                       addr =3D ftrace_get_addr_curr(rec);
>> +                       new_addr =3D ftrace_get_addr_new(rec);
>> +                       break;
>> +               case FTRACE_UPDATE_MAKE_CALL:
>> +                       addr =3D ftrace_get_addr_new(rec);
>> +                       break;
>> +               case FTRACE_UPDATE_MAKE_NOP:
>> +                       addr =3D ftrace_get_addr_curr(rec);
>> +                       break;
>> +               }
>> +               nop_inst =3D ppc_inst(PPC_RAW_NOP());
>> +               ret =3D ftrace_get_call_inst(rec, addr, &call_inst);
>> +               if (!ret && new_addr)
>> +                       ret =3D ftrace_get_call_inst(rec, new_addr, &new=
_call_inst);
>> +               if (ret)
>> +                       goto out;
>> +
>> +               switch (update) {
>> +               case FTRACE_UPDATE_MODIFY_CALL:
>> +                       old =3D call_inst;
>> +                       new =3D new_call_inst;
>> +                       break;
>> +               case FTRACE_UPDATE_MAKE_CALL:
>> +                       old =3D nop_inst;
>> +                       new =3D call_inst;
>> +                       break;
>> +               case FTRACE_UPDATE_MAKE_NOP:
>> +                       new =3D nop_inst;
>> +                       old =3D call_inst;
>> +                       break;
>> +               }
>> +
>> +               /* old =3D=3D new when going to .ftrace.text stub for mo=
dify */
>> +               if (!ppc_inst_equal(old, new))
>> +                       ret =3D ftrace_modify_code(ip, old, new);
>> +               if (ret)
>> +                       goto out;
>> +               ftrace_update_record(rec, enable);
>> +       }
>> +
>> +out:
>> +       if (ret)
>> +               ftrace_bug(ret, rec);
>> +       return;
>> +}
>> +
>> +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>> +{
>> +       unsigned long addr, ip =3D rec->ip;
>> +       ppc_inst_t old, new;
>> +       int ret =3D 0;
>> +
>> +       /* Verify instructions surrounding the ftrace location */
>> +       if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
>> +               /* Expect nops */
>> +               ret =3D ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NO=
P()));
>> +               if (!ret)
>> +                       ret =3D ftrace_validate_inst(ip, ppc_inst(PPC_RA=
W_NOP()));
>> +       } else if (IS_ENABLED(CONFIG_PPC32)) {
>> +               /* Expected sequence: 'mflr r0', 'stw r0,4(r1)', 'bl _mc=
ount' */
>> +               ret =3D ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MF=
LR(_R0)));
>> +               if (!ret)
>> +                       ret =3D ftrace_validate_inst(ip - 4, ppc_inst(PP=
C_RAW_STW(_R0, _R1, 4)));
>> +       } else if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
>> +               /* Expected sequence: 'mflr r0', 'bl _mcount' */
>> +               ret =3D ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_MF=
LR(_R0)));
>> +       } else {
>>                  return -EINVAL;
>>          }
>>=20
>> -       /* read where this goes */
>> -       if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
>> -               pr_err("Fetching opcode failed.\n");
>> -               return -EFAULT;
>> -       }
>> +       if (ret)
>> +               return ret;
>>=20
>> -       /* Make sure that this is still a 24bit jump */
>> -       if (!is_bl_op(op)) {
>> -               pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as=
_ulong(op));
>> -               return -EINVAL;
>> -       }
>> -
>> -       /* lets find where the pointer goes */
>> -       tramp =3D find_bl_target(ip, op);
>> -       entry =3D ppc_global_function_entry((void *)old_addr);
>> -
>> -       pr_devel("ip:%lx jumps to %lx", ip, tramp);
>> -
>> -       if (tramp !=3D entry) {
>> -               /* old_addr is not within range, so we must have used a =
trampoline */
>> -               if (module_trampoline_target(mod, tramp, &ptr)) {
>> -                       pr_err("Failed to get trampoline target\n");
>> +       if (!core_kernel_text(ip)) {
>> +               if (!mod) {
>> +                       pr_err("0x%lx: No module provided for non-kernel=
 address\n", ip);
>>                          return -EFAULT;
>>                  }
>> -
>> -               pr_devel("trampoline target %lx", ptr);
>> -
>> -               /* This should match what was called */
>> -               if (ptr !=3D entry) {
>> -                       pr_err("addr %lx does not match expected %lx\n",=
 ptr, entry);
>> -                       return -EINVAL;
>> -               }
>> +               rec->arch.mod =3D mod;
>>          }
>>=20
>> -       /* The new target may be within range */
>> -       if (test_24bit_addr(ip, addr)) {
>> -               /* within range */
>> -               if (patch_branch((u32 *)ip, addr, BRANCH_SET_LINK)) {
>> -                       pr_err("REL24 out of range!\n");
>> -                       return -EINVAL;
>> -               }
>> -
>> -               return 0;
>> -       }
>> -
>> -       if (rec->flags & FTRACE_FL_REGS)
>> -               tramp =3D mod->arch.tramp_regs;
>> -       else
>> -               tramp =3D mod->arch.tramp;
>> -
>> -       if (module_trampoline_target(mod, tramp, &ptr)) {
>> -               pr_err("Failed to get trampoline target\n");
>> -               return -EFAULT;
>> -       }
>> -
>> -       pr_devel("trampoline target %lx", ptr);
>> -
>> -       entry =3D ppc_global_function_entry((void *)addr);
>> -       /* This should match what was called */
>> -       if (ptr !=3D entry) {
>> -               pr_err("addr %lx does not match expected %lx\n", ptr, en=
try);
>> -               return -EINVAL;
>> -       }
>> -
>> -       if (patch_branch((u32 *)ip, tramp, BRANCH_SET_LINK)) {
>> -               pr_err("REL24 out of range!\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       return 0;
>> -}
>> -#else
>> -static int __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long o=
ld_addr, unsigned long addr)
>> -{
>> -       return 0;
>> -}
>> -#endif
>> -
>> -int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>> -                       unsigned long addr)
>> -{
>> -       unsigned long ip =3D rec->ip;
>> -       ppc_inst_t old, new;
>> -
>> -       /*
>> -        * If the calling address is more that 24 bits away,
>> -        * then we had to use a trampoline to make the call.
>> -        * Otherwise just update the call site.
>> -        */
>> -       if (test_24bit_addr(ip, addr) && test_24bit_addr(ip, old_addr)) =
{
>> -               /* within range */
>> -               old =3D ftrace_call_replace(ip, old_addr, 1);
>> -               new =3D ftrace_call_replace(ip, addr, 1);
>> -               return ftrace_modify_code(ip, old, new);
>> -       } else if (core_kernel_text(ip)) {
>> +       /* Nop-out the ftrace location */
>> +       new =3D ppc_inst(PPC_RAW_NOP());
>> +       addr =3D MCOUNT_ADDR;
>> +       if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
>> +               /* we instead patch-in the 'mflr r0' */
>> +               old =3D ppc_inst(PPC_RAW_NOP());
>> +               new =3D ppc_inst(PPC_RAW_MFLR(_R0));
>> +               ret =3D ftrace_modify_code(ip - 4, old, new);
>> +       } else if (is_offset_in_branch_range(addr - ip)) {
>> +               /* Within range */
>> +               old =3D ftrace_create_branch_inst(ip, addr, 1);
>> +               ret =3D ftrace_modify_code(ip, old, new);
>> +       } else if (core_kernel_text(ip) || (IS_ENABLED(CONFIG_MODULES) &=
& mod)) {
>>                  /*
>> -                * We always patch out of range locations to go to the r=
egs
>> -                * variant, so there is nothing to do here
>> +                * We would be branching to a toolchain-generated stub, =
or to the module _mcount
>> +                * stub. Let's just confirm we have a 'bl' here.
>>                   */
>> -               return 0;
>> -       } else if (!IS_ENABLED(CONFIG_MODULES)) {
>> -               /* We should not get here without modules */
>> +               ret =3D ftrace_read_inst(ip, &old);
>> +               if (ret)
>> +                       return ret;
>> +               if (!is_bl_op(old)) {
>> +                       pr_err("0x%lx: expected (bl) !=3D found (%08lx)\=
n", ip, ppc_inst_as_ulong(old));
>> +                       return -EINVAL;
>> +               }
>> +               ret =3D patch_instruction((u32 *)ip, new);
>> +       } else {
>>                  return -EINVAL;
>>          }
>>=20
>> -       /*
>> -        * Out of range jumps are called from modules.
>> -        */
>> -       if (!rec->arch.mod) {
>> -               pr_err("No module loaded\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       return __ftrace_modify_call(rec, old_addr, addr);
>> +       return ret;
>>   }
>> -#endif
>>=20
>>   int ftrace_update_ftrace_func(ftrace_func_t func)
>>   {
>> @@ -684,14 +296,14 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>>          int ret;
>>=20
>>          old =3D ppc_inst_read((u32 *)&ftrace_call);
>> -       new =3D ftrace_call_replace(ip, (unsigned long)func, 1);
>> +       new =3D ftrace_create_branch_inst(ip, ppc_function_entry(func), =
1);
>>          ret =3D ftrace_modify_code(ip, old, new);
>>=20
>>          /* Also update the regs callback function */
>>          if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !ret) {
>>                  ip =3D (unsigned long)(&ftrace_regs_call);
>>                  old =3D ppc_inst_read((u32 *)&ftrace_regs_call);
>> -               new =3D ftrace_call_replace(ip, (unsigned long)func, 1);
>> +               new =3D ftrace_create_branch_inst(ip, ppc_function_entry=
(func), 1);
>>                  ret =3D ftrace_modify_code(ip, old, new);
>>          }
>>=20
>> @@ -723,6 +335,17 @@ void ftrace_free_init_tramp(void)
>>                  }
>>   }
>>=20
>> +static void __init add_ftrace_tramp(unsigned long tramp)
>> +{
>> +       int i;
>> +
>> +       for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
>> +               if (!ftrace_tramps[i]) {
>> +                       ftrace_tramps[i] =3D tramp;
>> +                       return;
>> +               }
>> +}
>> +
>>   int __init ftrace_dyn_arch_init(void)
>>   {
>>          int i;
>> @@ -745,14 +368,9 @@ int __init ftrace_dyn_arch_init(void)
>>          };
>>   #endif
>>=20
>> -       unsigned long addr;
>> +       unsigned long addr =3D FTRACE_REGS_ADDR;
>>          long reladdr;
>>=20
>> -       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
>> -               addr =3D ppc_global_function_entry((void *)ftrace_regs_c=
aller);
>> -       else
>> -               addr =3D ppc_global_function_entry((void *)ftrace_caller=
);
>> -
>>          if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
>>                  for (i =3D 0; i < 2; i++) {
>>                          reladdr =3D addr - (unsigned long)tramp[i];
>> @@ -804,8 +422,8 @@ static int ftrace_modify_ftrace_graph_caller(bool en=
able)
>>          if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_ARGS))
>>                  return 0;
>>=20
>> -       old =3D ftrace_call_replace(ip, enable ? stub : addr, 0);
>> -       new =3D ftrace_call_replace(ip, enable ? addr : stub, 0);
>> +       old =3D ftrace_create_branch_inst(ip, enable ? stub : addr, 0);
>> +       new =3D ftrace_create_branch_inst(ip, enable ? addr : stub, 0);
>>=20
>>          return ftrace_modify_code(ip, old, new);
>>   }
>> @@ -864,13 +482,3 @@ unsigned long prepare_ftrace_return(unsigned long p=
arent, unsigned long ip,
>>   }
>>   #endif
>>   #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
>> -
>> -#ifdef CONFIG_PPC64_ELF_ABI_V1
>> -char *arch_ftrace_match_adjust(char *str, const char *search)
>> -{
>> -       if (str[0] =3D=3D '.' && search[0] !=3D '.')
>> -               return str + 1;
>> -       else
>> -               return str;
>> -}
>> -#endif /* CONFIG_PPC64_ELF_ABI_V1 */
>> diff --git a/arch/powerpc/kernel/trace/ftrace_pg.c b/arch/powerpc/kernel=
/trace/ftrace_pg.c
>> new file mode 100644
>> index 00000000000000..7b85c3b460a3c0
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/trace/ftrace_pg.c
>> @@ -0,0 +1,846 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Code for replacing ftrace calls with jumps.
>> + *
>> + * Copyright (C) 2007-2008 Steven Rostedt <srostedt@redhat.com>
>> + *
>> + * Thanks goes out to P.A. Semi, Inc for supplying me with a PPC64 box.
>> + *
>> + * Added function graph tracer code, taken from x86 that was written
>> + * by Frederic Weisbecker, and ported to PPC by Steven Rostedt.
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) "ftrace-powerpc: " fmt
>> +
>> +#include <linux/spinlock.h>
>> +#include <linux/hardirq.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/module.h>
>> +#include <linux/ftrace.h>
>> +#include <linux/percpu.h>
>> +#include <linux/init.h>
>> +#include <linux/list.h>
>> +
>> +#include <asm/cacheflush.h>
>> +#include <asm/code-patching.h>
>> +#include <asm/ftrace.h>
>> +#include <asm/syscall.h>
>> +#include <asm/inst.h>
>> +
>> +/*
>> + * We generally only have a single long_branch tramp and at most 2 or 3=
 plt
>> + * tramps generated. But, we don't use the plt tramps currently. We als=
o allot
>> + * 2 tramps after .text and .init.text. So, we only end up with around =
3 usable
>> + * tramps in total. Set aside 8 just to be sure.
>> + */
>> +#define        NUM_FTRACE_TRAMPS       8
>> +static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
>> +
>> +static ppc_inst_t
>> +ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
>> +{
>> +       ppc_inst_t op;
>> +
>> +       addr =3D ppc_function_entry((void *)addr);
>> +
>> +       /* if (link) set op to 'bl' else 'b' */
>> +       create_branch(&op, (u32 *)ip, addr, link ? BRANCH_SET_LINK : 0);
>> +
>> +       return op;
>> +}
>> +
>> +static inline int
>> +ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
>> +{
>> +       ppc_inst_t replaced;
>> +
>> +       /*
>> +        * Note:
>> +        * We are paranoid about modifying text, as if a bug was to happ=
en, it
>> +        * could cause us to read or write to someplace that could cause=
 harm.
>> +        * Carefully read and modify the code with probe_kernel_*(), and=
 make
>> +        * sure what we read is what we expected it to be before modifyi=
ng it.
>> +        */
>> +
>> +       /* read the text we want to modify */
>> +       if (copy_inst_from_kernel_nofault(&replaced, (void *)ip))
>> +               return -EFAULT;
>> +
>> +       /* Make sure it is what we expect it to be */
>> +       if (!ppc_inst_equal(replaced, old)) {
>> +               pr_err("%p: replaced (%08lx) !=3D old (%08lx)", (void *)=
ip,
>> +                      ppc_inst_as_ulong(replaced), ppc_inst_as_ulong(ol=
d));
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* replace the text with the new text */
>> +       return patch_instruction((u32 *)ip, new);
>> +}
>> +
>> +/*
>> + * Helper functions that are the same for both PPC64 and PPC32.
>> + */
>> +static int test_24bit_addr(unsigned long ip, unsigned long addr)
>> +{
>> +       addr =3D ppc_function_entry((void *)addr);
>> +
>> +       return is_offset_in_branch_range(addr - ip);
>> +}
>> +
>> +static int is_bl_op(ppc_inst_t op)
>> +{
>> +       return (ppc_inst_val(op) & ~PPC_LI_MASK) =3D=3D PPC_RAW_BL(0);
>> +}
>> +
>> +static int is_b_op(ppc_inst_t op)
>> +{
>> +       return (ppc_inst_val(op) & ~PPC_LI_MASK) =3D=3D PPC_RAW_BRANCH(0=
);
>> +}
>> +
>> +static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
>> +{
>> +       int offset;
>> +
>> +       offset =3D PPC_LI(ppc_inst_val(op));
>> +       /* make it signed */
>> +       if (offset & 0x02000000)
>> +               offset |=3D 0xfe000000;
>> +
>> +       return ip + (long)offset;
>> +}
>> +
>> +#ifdef CONFIG_MODULES
>> +static int
>> +__ftrace_make_nop(struct module *mod,
>> +                 struct dyn_ftrace *rec, unsigned long addr)
>> +{
>> +       unsigned long entry, ptr, tramp;
>> +       unsigned long ip =3D rec->ip;
>> +       ppc_inst_t op, pop;
>> +
>> +       /* read where this goes */
>> +       if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
>> +               pr_err("Fetching opcode failed.\n");
>> +               return -EFAULT;
>> +       }
>> +
>> +       /* Make sure that this is still a 24bit jump */
>> +       if (!is_bl_op(op)) {
>> +               pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as=
_ulong(op));
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* lets find where the pointer goes */
>> +       tramp =3D find_bl_target(ip, op);
>> +
>> +       pr_devel("ip:%lx jumps to %lx", ip, tramp);
>> +
>> +       if (module_trampoline_target(mod, tramp, &ptr)) {
>> +               pr_err("Failed to get trampoline target\n");
>> +               return -EFAULT;
>> +       }
>> +
>> +       pr_devel("trampoline target %lx", ptr);
>> +
>> +       entry =3D ppc_global_function_entry((void *)addr);
>> +       /* This should match what was called */
>> +       if (ptr !=3D entry) {
>> +               pr_err("addr %lx does not match expected %lx\n", ptr, en=
try);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
>> +               if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))=
) {
>> +                       pr_err("Fetching instruction at %lx failed.\n", =
ip - 4);
>> +                       return -EFAULT;
>> +               }
>> +
>> +               /* We expect either a mflr r0, or a std r0, LRSAVE(r1) *=
/
>> +               if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
>> +                   !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
>> +                       pr_err("Unexpected instruction %08lx around bl _=
mcount\n",
>> +                              ppc_inst_as_ulong(op));
>> +                       return -EINVAL;
>> +               }
>> +       } else if (IS_ENABLED(CONFIG_PPC64)) {
>> +               /*
>> +                * Check what is in the next instruction. We can see ld =
r2,40(r1), but
>> +                * on first pass after boot we will see mflr r0.
>> +                */
>> +               if (copy_inst_from_kernel_nofault(&op, (void *)(ip + 4))=
) {
>> +                       pr_err("Fetching op failed.\n");
>> +                       return -EFAULT;
>> +               }
>> +
>> +               if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
>> +                       pr_err("Expected %08lx found %08lx\n", PPC_INST_=
LD_TOC,
>> +                              ppc_inst_as_ulong(op));
>> +                       return -EINVAL;
>> +               }
>> +       }
>> +
>> +       /*
>> +        * When using -mprofile-kernel or PPC32 there is no load to jump=
 over.
>> +        *
>> +        * Otherwise our original call site looks like:
>> +        *
>> +        * bl <tramp>
>> +        * ld r2,XX(r1)
>> +        *
>> +        * Milton Miller pointed out that we can not simply nop the bran=
ch.
>> +        * If a task was preempted when calling a trace function, the no=
ps
>> +        * will remove the way to restore the TOC in r2 and the r2 TOC w=
ill
>> +        * get corrupted.
>> +        *
>> +        * Use a b +8 to jump over the load.
>> +        */
>> +       if (IS_ENABLED(CONFIG_MPROFILE_KERNEL) || IS_ENABLED(CONFIG_PPC3=
2))
>> +               pop =3D ppc_inst(PPC_RAW_NOP());
>> +       else
>> +               pop =3D ppc_inst(PPC_RAW_BRANCH(8));      /* b +8 */
>> +
>> +       if (patch_instruction((u32 *)ip, pop)) {
>> +               pr_err("Patching NOP failed.\n");
>> +               return -EPERM;
>> +       }
>> +
>> +       return 0;
>> +}
>> +#else
>> +static int __ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec=
, unsigned long addr)
>> +{
>> +       return 0;
>> +}
>> +#endif /* CONFIG_MODULES */
>> +
>> +static unsigned long find_ftrace_tramp(unsigned long ip)
>> +{
>> +       int i;
>> +
>> +       /*
>> +        * We have the compiler generated long_branch tramps at the end
>> +        * and we prefer those
>> +        */
>> +       for (i =3D NUM_FTRACE_TRAMPS - 1; i >=3D 0; i--)
>> +               if (!ftrace_tramps[i])
>> +                       continue;
>> +               else if (is_offset_in_branch_range(ftrace_tramps[i] - ip=
))
>> +                       return ftrace_tramps[i];
>> +
>> +       return 0;
>> +}
>> +
>> +static int add_ftrace_tramp(unsigned long tramp)
>> +{
>> +       int i;
>> +
>> +       for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
>> +               if (!ftrace_tramps[i]) {
>> +                       ftrace_tramps[i] =3D tramp;
>> +                       return 0;
>> +               }
>> +
>> +       return -1;
>> +}
>> +
>> +/*
>> + * If this is a compiler generated long_branch trampoline (essentially,=
 a
>> + * trampoline that has a branch to _mcount()), we re-write the branch t=
o
>> + * instead go to ftrace_[regs_]caller() and note down the location of t=
his
>> + * trampoline.
>> + */
>> +static int setup_mcount_compiler_tramp(unsigned long tramp)
>> +{
>> +       int i;
>> +       ppc_inst_t op;
>> +       unsigned long ptr;
>> +
>> +       /* Is this a known long jump tramp? */
>> +       for (i =3D 0; i < NUM_FTRACE_TRAMPS; i++)
>> +               if (ftrace_tramps[i] =3D=3D tramp)
>> +                       return 0;
>> +
>> +       /* New trampoline -- read where this goes */
>> +       if (copy_inst_from_kernel_nofault(&op, (void *)tramp)) {
>> +               pr_debug("Fetching opcode failed.\n");
>> +               return -1;
>> +       }
>> +
>> +       /* Is this a 24 bit branch? */
>> +       if (!is_b_op(op)) {
>> +               pr_debug("Trampoline is not a long branch tramp.\n");
>> +               return -1;
>> +       }
>> +
>> +       /* lets find where the pointer goes */
>> +       ptr =3D find_bl_target(tramp, op);
>> +
>> +       if (ptr !=3D ppc_global_function_entry((void *)_mcount)) {
>> +               pr_debug("Trampoline target %p is not _mcount\n", (void =
*)ptr);
>> +               return -1;
>> +       }
>> +
>> +       /* Let's re-write the tramp to go to ftrace_[regs_]caller */
>> +       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
>> +               ptr =3D ppc_global_function_entry((void *)ftrace_regs_ca=
ller);
>> +       else
>> +               ptr =3D ppc_global_function_entry((void *)ftrace_caller)=
;
>> +
>> +       if (patch_branch((u32 *)tramp, ptr, 0)) {
>> +               pr_debug("REL24 out of range!\n");
>> +               return -1;
>> +       }
>> +
>> +       if (add_ftrace_tramp(tramp)) {
>> +               pr_debug("No tramp locations left\n");
>> +               return -1;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned lo=
ng addr)
>> +{
>> +       unsigned long tramp, ip =3D rec->ip;
>> +       ppc_inst_t op;
>> +
>> +       /* Read where this goes */
>> +       if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
>> +               pr_err("Fetching opcode failed.\n");
>> +               return -EFAULT;
>> +       }
>> +
>> +       /* Make sure that this is still a 24bit jump */
>> +       if (!is_bl_op(op)) {
>> +               pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as=
_ulong(op));
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* Let's find where the pointer goes */
>> +       tramp =3D find_bl_target(ip, op);
>> +
>> +       pr_devel("ip:%lx jumps to %lx", ip, tramp);
>> +
>> +       if (setup_mcount_compiler_tramp(tramp)) {
>> +               /* Are other trampolines reachable? */
>> +               if (!find_ftrace_tramp(ip)) {
>> +                       pr_err("No ftrace trampolines reachable from %ps=
\n",
>> +                                       (void *)ip);
>> +                       return -EINVAL;
>> +               }
>> +       }
>> +
>> +       if (patch_instruction((u32 *)ip, ppc_inst(PPC_RAW_NOP()))) {
>> +               pr_err("Patching NOP failed.\n");
>> +               return -EPERM;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +int ftrace_make_nop(struct module *mod,
>> +                   struct dyn_ftrace *rec, unsigned long addr)
>> +{
>> +       unsigned long ip =3D rec->ip;
>> +       ppc_inst_t old, new;
>> +
>> +       /*
>> +        * If the calling address is more that 24 bits away,
>> +        * then we had to use a trampoline to make the call.
>> +        * Otherwise just update the call site.
>> +        */
>> +       if (test_24bit_addr(ip, addr)) {
>> +               /* within range */
>> +               old =3D ftrace_call_replace(ip, addr, 1);
>> +               new =3D ppc_inst(PPC_RAW_NOP());
>> +               return ftrace_modify_code(ip, old, new);
>> +       } else if (core_kernel_text(ip)) {
>> +               return __ftrace_make_nop_kernel(rec, addr);
>> +       } else if (!IS_ENABLED(CONFIG_MODULES)) {
>> +               return -EINVAL;
>> +       }
>> +
>> +       /*
>> +        * Out of range jumps are called from modules.
>> +        * We should either already have a pointer to the module
>> +        * or it has been passed in.
>> +        */
>> +       if (!rec->arch.mod) {
>> +               if (!mod) {
>> +                       pr_err("No module loaded addr=3D%lx\n", addr);
>> +                       return -EFAULT;
>> +               }
>> +               rec->arch.mod =3D mod;
>> +       } else if (mod) {
>> +               if (mod !=3D rec->arch.mod) {
>> +                       pr_err("Record mod %p not equal to passed in mod=
 %p\n",
>> +                              rec->arch.mod, mod);
>> +                       return -EINVAL;
>> +               }
>> +               /* nothing to do if mod =3D=3D rec->arch.mod */
>> +       } else
>> +               mod =3D rec->arch.mod;
>> +
>> +       return __ftrace_make_nop(mod, rec, addr);
>> +}
>> +
>> +#ifdef CONFIG_MODULES
>> +/*
>> + * Examine the existing instructions for __ftrace_make_call.
>> + * They should effectively be a NOP, and follow formal constraints,
>> + * depending on the ABI. Return false if they don't.
>> + */
>> +static bool expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t =
op1)
>> +{
>> +       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
>> +               return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
>> +       else
>> +               return ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) =
&&
>> +                      ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC));
>> +}
>> +
>> +static int
>> +__ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>> +{
>> +       ppc_inst_t op[2];
>> +       void *ip =3D (void *)rec->ip;
>> +       unsigned long entry, ptr, tramp;
>> +       struct module *mod =3D rec->arch.mod;
>> +
>> +       /* read where this goes */
>> +       if (copy_inst_from_kernel_nofault(op, ip))
>> +               return -EFAULT;
>> +
>> +       if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) &&
>> +           copy_inst_from_kernel_nofault(op + 1, ip + 4))
>> +               return -EFAULT;
>> +
>> +       if (!expected_nop_sequence(ip, op[0], op[1])) {
>> +               pr_err("Unexpected call sequence at %p: %08lx %08lx\n", =
ip,
>> +                      ppc_inst_as_ulong(op[0]), ppc_inst_as_ulong(op[1]=
));
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* If we never set up ftrace trampoline(s), then bail */
>> +       if (!mod->arch.tramp ||
>> +           (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !mod->arch.t=
ramp_regs)) {
>> +               pr_err("No ftrace trampoline\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && rec->flags & =
FTRACE_FL_REGS)
>> +               tramp =3D mod->arch.tramp_regs;
>> +       else
>> +               tramp =3D mod->arch.tramp;
>> +
>> +       if (module_trampoline_target(mod, tramp, &ptr)) {
>> +               pr_err("Failed to get trampoline target\n");
>> +               return -EFAULT;
>> +       }
>> +
>> +       pr_devel("trampoline target %lx", ptr);
>> +
>> +       entry =3D ppc_global_function_entry((void *)addr);
>> +       /* This should match what was called */
>> +       if (ptr !=3D entry) {
>> +               pr_err("addr %lx does not match expected %lx\n", ptr, en=
try);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
>> +               pr_err("REL24 out of range!\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       return 0;
>> +}
>> +#else
>> +static int __ftrace_make_call(struct dyn_ftrace *rec, unsigned long add=
r)
>> +{
>> +       return 0;
>> +}
>> +#endif /* CONFIG_MODULES */
>> +
>> +static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned l=
ong addr)
>> +{
>> +       ppc_inst_t op;
>> +       void *ip =3D (void *)rec->ip;
>> +       unsigned long tramp, entry, ptr;
>> +
>> +       /* Make sure we're being asked to patch branch to a known ftrace=
 addr */
>> +       entry =3D ppc_global_function_entry((void *)ftrace_caller);
>> +       ptr =3D ppc_global_function_entry((void *)addr);
>> +
>> +       if (ptr !=3D entry && IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS=
))
>> +               entry =3D ppc_global_function_entry((void *)ftrace_regs_=
caller);
>> +
>> +       if (ptr !=3D entry) {
>> +               pr_err("Unknown ftrace addr to patch: %ps\n", (void *)pt=
r);
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* Make sure we have a nop */
>> +       if (copy_inst_from_kernel_nofault(&op, ip)) {
>> +               pr_err("Unable to read ftrace location %p\n", ip);
>> +               return -EFAULT;
>> +       }
>> +
>> +       if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_NOP()))) {
>> +               pr_err("Unexpected call sequence at %p: %08lx\n",
>> +                      ip, ppc_inst_as_ulong(op));
>> +               return -EINVAL;
>> +       }
>> +
>> +       tramp =3D find_ftrace_tramp((unsigned long)ip);
>> +       if (!tramp) {
>> +               pr_err("No ftrace trampolines reachable from %ps\n", ip)=
;
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
>> +               pr_err("Error patching branch to ftrace tramp!\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>> +{
>> +       unsigned long ip =3D rec->ip;
>> +       ppc_inst_t old, new;
>> +
>> +       /*
>> +        * If the calling address is more that 24 bits away,
>> +        * then we had to use a trampoline to make the call.
>> +        * Otherwise just update the call site.
>> +        */
>> +       if (test_24bit_addr(ip, addr)) {
>> +               /* within range */
>> +               old =3D ppc_inst(PPC_RAW_NOP());
>> +               new =3D ftrace_call_replace(ip, addr, 1);
>> +               return ftrace_modify_code(ip, old, new);
>> +       } else if (core_kernel_text(ip)) {
>> +               return __ftrace_make_call_kernel(rec, addr);
>> +       } else if (!IS_ENABLED(CONFIG_MODULES)) {
>> +               /* We should not get here without modules */
>> +               return -EINVAL;
>> +       }
>> +
>> +       /*
>> +        * Out of range jumps are called from modules.
>> +        * Being that we are converting from nop, it had better
>> +        * already have a module defined.
>> +        */
>> +       if (!rec->arch.mod) {
>> +               pr_err("No module loaded\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       return __ftrace_make_call(rec, addr);
>> +}
>> +
>> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>> +#ifdef CONFIG_MODULES
>> +static int
>> +__ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>> +                                       unsigned long addr)
>> +{
>> +       ppc_inst_t op;
>> +       unsigned long ip =3D rec->ip;
>> +       unsigned long entry, ptr, tramp;
>> +       struct module *mod =3D rec->arch.mod;
>> +
>> +       /* If we never set up ftrace trampolines, then bail */
>> +       if (!mod->arch.tramp || !mod->arch.tramp_regs) {
>> +               pr_err("No ftrace trampoline\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* read where this goes */
>> +       if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
>> +               pr_err("Fetching opcode failed.\n");
>> +               return -EFAULT;
>> +       }
>> +
>> +       /* Make sure that this is still a 24bit jump */
>> +       if (!is_bl_op(op)) {
>> +               pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as=
_ulong(op));
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* lets find where the pointer goes */
>> +       tramp =3D find_bl_target(ip, op);
>> +       entry =3D ppc_global_function_entry((void *)old_addr);
>> +
>> +       pr_devel("ip:%lx jumps to %lx", ip, tramp);
>> +
>> +       if (tramp !=3D entry) {
>> +               /* old_addr is not within range, so we must have used a =
trampoline */
>> +               if (module_trampoline_target(mod, tramp, &ptr)) {
>> +                       pr_err("Failed to get trampoline target\n");
>> +                       return -EFAULT;
>> +               }
>> +
>> +               pr_devel("trampoline target %lx", ptr);
>> +
>> +               /* This should match what was called */
>> +               if (ptr !=3D entry) {
>> +                       pr_err("addr %lx does not match expected %lx\n",=
 ptr, entry);
>> +                       return -EINVAL;
>> +               }
>> +       }
>> +
>> +       /* The new target may be within range */
>> +       if (test_24bit_addr(ip, addr)) {
>> +               /* within range */
>> +               if (patch_branch((u32 *)ip, addr, BRANCH_SET_LINK)) {
>> +                       pr_err("REL24 out of range!\n");
>> +                       return -EINVAL;
>> +               }
>> +
>> +               return 0;
>> +       }
>> +
>> +       if (rec->flags & FTRACE_FL_REGS)
>> +               tramp =3D mod->arch.tramp_regs;
>> +       else
>> +               tramp =3D mod->arch.tramp;
>> +
>> +       if (module_trampoline_target(mod, tramp, &ptr)) {
>> +               pr_err("Failed to get trampoline target\n");
>> +               return -EFAULT;
>> +       }
>> +
>> +       pr_devel("trampoline target %lx", ptr);
>> +
>> +       entry =3D ppc_global_function_entry((void *)addr);
>> +       /* This should match what was called */
>> +       if (ptr !=3D entry) {
>> +               pr_err("addr %lx does not match expected %lx\n", ptr, en=
try);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (patch_branch((u32 *)ip, tramp, BRANCH_SET_LINK)) {
>> +               pr_err("REL24 out of range!\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       return 0;
>> +}
>> +#else
>> +static int __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long o=
ld_addr, unsigned long addr)
>> +{
>> +       return 0;
>> +}
>> +#endif
>> +
>> +int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>> +                       unsigned long addr)
>> +{
>> +       unsigned long ip =3D rec->ip;
>> +       ppc_inst_t old, new;
>> +
>> +       /*
>> +        * If the calling address is more that 24 bits away,
>> +        * then we had to use a trampoline to make the call.
>> +        * Otherwise just update the call site.
>> +        */
>> +       if (test_24bit_addr(ip, addr) && test_24bit_addr(ip, old_addr)) =
{
>> +               /* within range */
>> +               old =3D ftrace_call_replace(ip, old_addr, 1);
>> +               new =3D ftrace_call_replace(ip, addr, 1);
>> +               return ftrace_modify_code(ip, old, new);
>> +       } else if (core_kernel_text(ip)) {
>> +               /*
>> +                * We always patch out of range locations to go to the r=
egs
>> +                * variant, so there is nothing to do here
>> +                */
>> +               return 0;
>> +       } else if (!IS_ENABLED(CONFIG_MODULES)) {
>> +               /* We should not get here without modules */
>> +               return -EINVAL;
>> +       }
>> +
>> +       /*
>> +        * Out of range jumps are called from modules.
>> +        */
>> +       if (!rec->arch.mod) {
>> +               pr_err("No module loaded\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       return __ftrace_modify_call(rec, old_addr, addr);
>> +}
>> +#endif
>> +
>> +int ftrace_update_ftrace_func(ftrace_func_t func)
>> +{
>> +       unsigned long ip =3D (unsigned long)(&ftrace_call);
>> +       ppc_inst_t old, new;
>> +       int ret;
>> +
>> +       old =3D ppc_inst_read((u32 *)&ftrace_call);
>> +       new =3D ftrace_call_replace(ip, (unsigned long)func, 1);
>> +       ret =3D ftrace_modify_code(ip, old, new);
>> +
>> +       /* Also update the regs callback function */
>> +       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !ret) {
>> +               ip =3D (unsigned long)(&ftrace_regs_call);
>> +               old =3D ppc_inst_read((u32 *)&ftrace_regs_call);
>> +               new =3D ftrace_call_replace(ip, (unsigned long)func, 1);
>> +               ret =3D ftrace_modify_code(ip, old, new);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +/*
>> + * Use the default ftrace_modify_all_code, but without
>> + * stop_machine().
>> + */
>> +void arch_ftrace_update_code(int command)
>> +{
>> +       ftrace_modify_all_code(command);
>> +}
>> +
>> +#ifdef CONFIG_PPC64
>> +#define PACATOC offsetof(struct paca_struct, kernel_toc)
>> +
>> +extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
>> +
>> +void ftrace_free_init_tramp(void)
>> +{
>> +       int i;
>> +
>> +       for (i =3D 0; i < NUM_FTRACE_TRAMPS && ftrace_tramps[i]; i++)
>> +               if (ftrace_tramps[i] =3D=3D (unsigned long)ftrace_tramp_=
init) {
>> +                       ftrace_tramps[i] =3D 0;
>> +                       return;
>> +               }
>> +}
>> +
>> +int __init ftrace_dyn_arch_init(void)
>> +{
>> +       int i;
>> +       unsigned int *tramp[] =3D { ftrace_tramp_text, ftrace_tramp_init=
 };
>> +       u32 stub_insns[] =3D {
>> +               PPC_RAW_LD(_R12, _R13, PACATOC),
>> +               PPC_RAW_ADDIS(_R12, _R12, 0),
>> +               PPC_RAW_ADDI(_R12, _R12, 0),
>> +               PPC_RAW_MTCTR(_R12),
>> +               PPC_RAW_BCTR()
>> +       };
>> +       unsigned long addr;
>> +       long reladdr;
>> +
>> +       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
>> +               addr =3D ppc_global_function_entry((void *)ftrace_regs_c=
aller);
>> +       else
>> +               addr =3D ppc_global_function_entry((void *)ftrace_caller=
);
>> +
>> +       reladdr =3D addr - kernel_toc_addr();
>> +
>> +       if (reladdr >=3D SZ_2G || reladdr < -(long)SZ_2G) {
>> +               pr_err("Address of %ps out of range of kernel_toc.\n",
>> +                               (void *)addr);
>> +               return -1;
>> +       }
>> +
>> +       for (i =3D 0; i < 2; i++) {
>> +               memcpy(tramp[i], stub_insns, sizeof(stub_insns));
>> +               tramp[i][1] |=3D PPC_HA(reladdr);
>> +               tramp[i][2] |=3D PPC_LO(reladdr);
>> +               add_ftrace_tramp((unsigned long)tramp[i]);
>> +       }
>> +
>> +       return 0;
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
>> +
>> +extern void ftrace_graph_call(void);
>> +extern void ftrace_graph_stub(void);
>> +
>> +static int ftrace_modify_ftrace_graph_caller(bool enable)
>> +{
>> +       unsigned long ip =3D (unsigned long)(&ftrace_graph_call);
>> +       unsigned long addr =3D (unsigned long)(&ftrace_graph_caller);
>> +       unsigned long stub =3D (unsigned long)(&ftrace_graph_stub);
>> +       ppc_inst_t old, new;
>> +
>> +       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_ARGS))
>> +               return 0;
>> +
>> +       old =3D ftrace_call_replace(ip, enable ? stub : addr, 0);
>> +       new =3D ftrace_call_replace(ip, enable ? addr : stub, 0);
>> +
>> +       return ftrace_modify_code(ip, old, new);
>> +}
>> +
>> +int ftrace_enable_ftrace_graph_caller(void)
>> +{
>> +       return ftrace_modify_ftrace_graph_caller(true);
>> +}
>> +
>> +int ftrace_disable_ftrace_graph_caller(void)
>> +{
>> +       return ftrace_modify_ftrace_graph_caller(false);
>> +}
>> +
>> +/*
>> + * Hook the return address and push it in the stack of return addrs
>> + * in current thread info. Return the address we want to divert to.
>> + */
>> +static unsigned long
>> +__prepare_ftrace_return(unsigned long parent, unsigned long ip, unsigne=
d long sp)
>> +{
>> +       unsigned long return_hooker;
>> +       int bit;
>> +
>> +       if (unlikely(ftrace_graph_is_dead()))
>> +               goto out;
>> +
>> +       if (unlikely(atomic_read(&current->tracing_graph_pause)))
>> +               goto out;
>> +
>> +       bit =3D ftrace_test_recursion_trylock(ip, parent);
>> +       if (bit < 0)
>> +               goto out;
>> +
>> +       return_hooker =3D ppc_function_entry(return_to_handler);
>> +
>> +       if (!function_graph_enter(parent, ip, 0, (unsigned long *)sp))
>> +               parent =3D return_hooker;
>> +
>> +       ftrace_test_recursion_unlock(bit);
>> +out:
>> +       return parent;
>> +}
>> +
>> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
>> +void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
>> +                      struct ftrace_ops *op, struct ftrace_regs *fregs)
>> +{
>> +       fregs->regs.link =3D __prepare_ftrace_return(parent_ip, ip, freg=
s->regs.gpr[1]);
>> +}
>> +#else
>> +unsigned long prepare_ftrace_return(unsigned long parent, unsigned long=
 ip,
>> +                                   unsigned long sp)
>> +{
>> +       return __prepare_ftrace_return(parent, ip, sp);
>> +}
>> +#endif
>> +#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
>> +
>> +#ifdef CONFIG_PPC64_ELF_ABI_V1
>> +char *arch_ftrace_match_adjust(char *str, const char *search)
>> +{
>> +       if (str[0] =3D=3D '.' && search[0] !=3D '.')
>> +               return str + 1;
>> +       else
>> +               return str;
>> +}
>> +#endif /* CONFIG_PPC64_ELF_ABI_V1 */
>> diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b=
/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
>> new file mode 100755
>> index 00000000000000..410e349cc48428
>> --- /dev/null
>> +++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
>> @@ -0,0 +1,20 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +set -e
>> +set -o pipefail
>> +
>> +# To debug, uncomment the following line
>> +# set -x
>> +
>> +# Output from -fpatchable-function-entry can only vary on 64le, so this=
 should
>> +# not be invoked for other targets. Therefore we can pass in -m64 and -=
mabi
>> +# explicitly, to take care of toolchains defaulting to other targets.
>> +
>> +# Test whether the nops are generated before the global entry point.
>> +echo "int x; int func() { return x; }" | \
>> +    $* -m64 -mabi=3Delfv2 -S -x c -O2 -fpatchable-function-entry=3D2,2 =
- -o - 2> /dev/null | \
>> +    awk 'BEGIN { RS =3D ";" } /nop\n[[:space:]]*nop\n.*\nfunc:/ { print=
 $0 }' | \
>> +    grep -q "func:" || exit 0
>> +
>> +exit 1
>>=20
>> base-commit: 6d40746dbb75f85a18a0df005f1a8d6147abec22
>> prerequisite-patch-id: 3862cf6dc646260228e50b70c316cf15b1d7f384
>> prerequisite-patch-id: 859f60071f4e425c806fc7fe6c59e268232050a4
>> prerequisite-patch-id: ef23f712e50f106d689a550dae0f816285c1db3b
>> prerequisite-patch-id: 8c6d31bb6ac4e4bef086fe502efa660ae99a96ca
>> --
>> 2.40.1
>>=20
>=20
