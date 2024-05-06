Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F48BD32B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 18:52:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hsP3sHxJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY6rf16R8z3cSX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 02:52:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hsP3sHxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY6qs5n94z30PH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 02:51:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9ED361367
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 16:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF61C4AF67
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715014277;
	bh=AMrympawOjdeqW9f3Vyqh5sM6zoI+AfndTaZX7ITQoQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hsP3sHxJWLiUmTsobNxs7HQPtyzSRtvWv/XoNr/mJvVe/espwvzAVNK3AUTkFvJ89
	 1p1tlz8D7IgDpOBNEcLaJbUNikEtX+jUUtNDIFyWPYxIhJ57I8aXtmOA8/zP7um1kr
	 g7zsgOYwpa9RNPJR1uViovmm0r4hVW7JxMyODrKQh0brYHV9plr7ruacrSw2Dgvsj0
	 d6VLS69UekN6J2VYW9DbFPYpGy6VwQsJiZ9+WI+yfRnn3DVeMTv4pDxlYQ0aKKqvPu
	 JgyPwm0YfhUayBzYROBZYAxSDH15A2gpwFktsIjxXi89+3Kz0CqlyQNQbtK0/E/TjJ
	 H8SsYu3bBYhJg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518931f8d23so2124064e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 09:51:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU4e5yKp/DLZEp2I4DYe8DJMx6dN9MePRVBnJSllCWlZO9v/X+Lqn6V8C69ruIQfzsMx5Cm24AuGYYX4tvvs4p0DWfPwvnlnXHRuY1yg==
X-Gm-Message-State: AOJu0YyoQdnRI5qwxwbhKUo+Sy/92Ll85qpqppcmpw3QQtLkAm33l0EJ
	8+HawBtPEDeq6poNHGTgTe4ehRueu0+wz5S3e1uX/L23z/wgQ16XYj4vUzub5UbN0MepZhagMX/
	Fcw0htDX5rYfGu9Rxu6Ag3PGGBgo=
X-Google-Smtp-Source: AGHT+IE8hVovKnq/Ao7KxUYrqkQ4fC2FP7pNSUs9xbUvQ7dbatg5c3eWqHbdWP0PSsmH0IOQoad07uIVI9rGwmkCLIM=
X-Received: by 2002:ac2:599a:0:b0:51c:cd6d:ad21 with SMTP id
 w26-20020ac2599a000000b0051ccd6dad21mr6675070lfn.47.1715014276154; Mon, 06
 May 2024 09:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240422092206.147078-1-sv@linux.ibm.com> <20240422092206.147078-2-sv@linux.ibm.com>
In-Reply-To: <20240422092206.147078-2-sv@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 May 2024 01:50:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNASi9Pw2XLj0pegyKCOew1FCNx9=5pDpgCMH6C_VFzPe0A@mail.gmail.com>
Message-ID: <CAK7LNASi9Pw2XLj0pegyKCOew1FCNx9=5pDpgCMH6C_VFzPe0A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] objtool/powerpc: Enhance objtool to fixup
 alternate feature relative addresses
To: Sathvika Vasireddy <sv@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, peterz@infradead.org, mahesh@linux.ibm.com, mingo@kernel.org, nathan@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 22, 2024 at 6:25=E2=80=AFPM Sathvika Vasireddy <sv@linux.ibm.co=
m> wrote:
>
> Implement build-time fixup of alternate feature relative addresses for
> the out-of-line (else) patch code. Initial posting to achieve the same
> using another tool can be found at [1]. Idea is to implement this using
> objtool instead of introducing another tool since it already has elf
> parsing and processing covered.
>
> Introduce --ftr-fixup as an option to objtool to do feature fixup at
> build-time.
>
> Couple of issues and warnings encountered while implementing feature
> fixup using objtool are as follows:
>
> 1. libelf is creating corrupted vmlinux file after writing necessary
> changes to the file. Due to this, kexec is not able to load new
> kernel.
>
> It gives the following error:
>         ELF Note corrupted !
>         Cannot determine the file type of vmlinux
>
> To fix this issue, after opening vmlinux file, make a call to
> elf_flagelf (e, ELF_C_SET, ELF_F_LAYOUT). This instructs libelf not
> to touch the segment and section layout. It informs the library
> that the application will take responsibility for the layout of the
> file and that the library should not insert any padding between
> sections.
>
> 2. Fix can't find starting instruction warnings when run on vmlinux
>
> Objtool throws a lot of can't find starting instruction warnings
> when run on vmlinux with --ftr-fixup option.
>
> These warnings are seen because find_insn() function looks for
> instructions at offsets that are relative to the start of the section.
> In case of individual object files (.o), there are no can't find
> starting instruction warnings seen because the actual offset
> associated with an instruction is itself a relative offset since the
> sections start at offset 0x0.
>
> However, in case of vmlinux, find_insn() function fails to find
> instructions at the actual offset associated with an instruction
> since the sections in vmlinux do not start at offset 0x0. Due to
> this, find_insn() will look for absolute offset and not the relative
> offset. This is resulting in a lot of can't find starting instruction
> warnings when objtool is run on vmlinux.
>
> To fix this, pass offset that is relative to the start of the section
> to find_insn().
>
> find_insn() is also looking for symbols of size 0. But, objtool does
> not store empty STT_NOTYPE symbols in the rbtree. Due to this,
> for empty symbols, objtool is throwing can't find starting
> instruction warnings. Fix this by ignoring symbols that are of
> size 0 since objtool does not add them to the rbtree.
>
> 3. Objtool is throwing unannotated intra-function call warnings
> when run on vmlinux with --ftr-fixup option.
>
> One such example:
>
> vmlinux: warning: objtool: .text+0x3d94:
>                         unannotated intra-function call
>
> .text + 0x3d94 =3D c000000000008000 + 3d94 =3D c0000000000081d4
>
> c0000000000081d4: 45 24 02 48  bl c00000000002a618
> <system_reset_exception+0x8>
>
> c00000000002a610 <system_reset_exception>:
> c00000000002a610:       0e 01 4c 3c     addis   r2,r12,270
>                         c00000000002a610: R_PPC64_REL16_HA    .TOC.
> c00000000002a614:       f0 6c 42 38     addi    r2,r2,27888
>                         c00000000002a614: R_PPC64_REL16_LO    .TOC.+0x4
> c00000000002a618:       a6 02 08 7c     mflr    r0
>
> This is happening because we should be looking for destination
> symbols that are at absolute offsets instead of relative offsets.
> After fixing dest_off to point to absolute offset, there are still
> a lot of these warnings shown.
>
> In the above example, objtool is computing the destination
> offset to be c00000000002a618, which points to a completely
> different instruction. find_call_destination() is looking for this
> offset and failing. Instead, we should be looking for destination
> offset c00000000002a610 which points to system_reset_exception
> function.
>
> Even after fixing the way destination offset is computed, and
> after looking for dest_off - 0x8 in cases where the original offset
> is not found, there are still a lot of unannotated intra-function
> call warnings generated. This is due to symbols that are not
> properly annotated.
>
> So, for now, as a hack to curb these warnings, do not emit
> unannotated intra-function call warnings when objtool is run
> with --ftr-fixup option.
>
> TODO:
> This patch enables build time feature fixup only for powerpc little
> endian configs. There are boot failures with big endian configs.
> Posting this as an initial RFC to get some review comments while I work
> on big endian issues.
>
> [1]
> https://lore.kernel.org/linuxppc-dev/20170521010130.13552-1-npiggin@gmail=
.com/
>
> Co-developed-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  arch/Kconfig                              |   3 +
>  arch/powerpc/Kconfig                      |   5 +
>  arch/powerpc/Makefile                     |   5 +
>  arch/powerpc/include/asm/feature-fixups.h |  11 +-
>  arch/powerpc/kernel/vmlinux.lds.S         |  14 +-
>  arch/powerpc/lib/feature-fixups.c         |  13 +
>  scripts/Makefile.lib                      |   7 +
>  scripts/Makefile.vmlinux                  |  15 +-
>  tools/objtool/arch/powerpc/special.c      | 329 ++++++++++++++++++++++
>  tools/objtool/arch/x86/special.c          |  49 ++++
>  tools/objtool/builtin-check.c             |   2 +
>  tools/objtool/check.c                     |  38 ++-
>  tools/objtool/elf.c                       |   4 +
>  tools/objtool/include/objtool/builtin.h   |   1 +
>  tools/objtool/include/objtool/special.h   |  43 +++
>  15 files changed, 530 insertions(+), 9 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 9f066785bb71..8defdf86a69e 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1206,6 +1206,9 @@ config HAVE_UACCESS_VALIDATION
>         bool
>         select OBJTOOL
>
> +config HAVE_OBJTOOL_FTR_FIXUP
> +        bool
> +
>  config HAVE_STACK_VALIDATION
>         bool
>         help
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1c4be3373686..806285a28231 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -23,6 +23,11 @@ config 64BIT
>         bool
>         default y if PPC64
>
> +config HAVE_OBJTOOL_FTR_FIXUP
> +        bool
> +        default y if CPU_LITTLE_ENDIAN && PPC64
> +        select OBJTOOL
> +
>  config LIVEPATCH_64
>         def_bool PPC64
>         depends on LIVEPATCH
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 65261cbe5bfd..bc81847d5c3d 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -112,6 +112,11 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) :=3D -pie
>  LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) +=3D -z notext
>  LDFLAGS_vmlinux        :=3D $(LDFLAGS_vmlinux-y)
>
> +# --emit-relocs required for post-link fixup of alternate feature
> +# text section relocations.
> +LDFLAGS_vmlinux        +=3D --emit-relocs
> +KBUILD_LDFLAGS_MODULE +=3D --emit-relocs
> +
>  ifdef CONFIG_PPC64
>  ifndef CONFIG_PPC_KERNEL_PCREL
>  ifeq ($(call cc-option-yn,-mcmodel=3Dmedium),y)
> diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/inc=
lude/asm/feature-fixups.h
> index 77824bd289a3..006e2493c7c3 100644
> --- a/arch/powerpc/include/asm/feature-fixups.h
> +++ b/arch/powerpc/include/asm/feature-fixups.h
> @@ -30,12 +30,19 @@
>
>  #define START_FTR_SECTION(label)       label##1:
>
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
>  #define FTR_SECTION_ELSE_NESTED(label)                 \
>  label##2:                                              \
> -       .pushsection __ftr_alt_##label,"a";             \
> +       .pushsection __ftr_alt_##label, "ax";           \
>         .align 2;                                       \
>  label##3:
> -
> +#else
> +#define FTR_SECTION_ELSE_NESTED(label)                 \
> +label##2 : \
> +       .pushsection __ftr_alt_##label, "a";            \
> +       .align 2;                                       \
> +label##3 :
> +#endif
>
>  #ifndef CONFIG_CC_IS_CLANG
>  #define CHECK_ALT_SIZE(else_size, body_size)                   \
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmli=
nux.lds.S
> index f420df7888a7..6b1c61e8af47 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -105,8 +105,13 @@ SECTIONS
>         .text : AT(ADDR(.text) - LOAD_OFFSET) {
>                 ALIGN_FUNCTION();
>  #endif
> -               /* careful! __ftr_alt_* sections need to be close to .tex=
t */
> -               *(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlik=
ely .text.unlikely.* .fixup __ftr_alt_* .ref.text);
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +               *(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlik=
ely
> +                       .text.unlikely.* .fixup .ref.text);
> +#else
> +               *(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlik=
ely
> +                       .text.unlikely.* .fixup __ftr_alt_* .ref.text);
> +#endif
>                 *(.tramp.ftrace.text);
>                 NOINSTR_TEXT
>                 SCHED_TEXT
> @@ -276,6 +281,11 @@ SECTIONS
>                 _einittext =3D .;
>                 *(.tramp.ftrace.init);
>         } :text
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +       .__ftr_alternates.text : AT(ADDR(.__ftr_alternates.text) - LOAD_O=
FFSET) {
> +               *(__ftr_alt*);
> +       }
> +#endif
>
>         /* .exit.text is discarded at runtime, not link time,
>          * to deal with references from __bug_table
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature=
-fixups.c
> index 4f82581ca203..8c5eb7c8612f 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -44,6 +44,18 @@ static u32 *calc_addr(struct fixup_entry *fcur, long o=
ffset)
>         return (u32 *)((unsigned long)fcur + offset);
>  }
>
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +static int patch_alt_instruction(u32 *src, u32 *dest, u32 *alt_start, u3=
2 *alt_end)
> +{
> +       ppc_inst_t instr;
> +
> +       instr =3D ppc_inst_read(src);
> +
> +       raw_patch_instruction(dest, instr);
> +
> +       return 0;
> +}
> +#else
>  static int patch_alt_instruction(u32 *src, u32 *dest, u32 *alt_start, u3=
2 *alt_end)
>  {
>         int err;
> @@ -66,6 +78,7 @@ static int patch_alt_instruction(u32 *src, u32 *dest, u=
32 *alt_start, u32 *alt_e
>
>         return 0;
>  }
> +#endif
>
>  static int patch_feature_section_mask(unsigned long value, unsigned long=
 mask,
>                                       struct fixup_entry *fcur)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index c65bb0fbd136..8fff27b9bdcb 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -290,6 +290,13 @@ ifneq ($(objtool-args-y),)
>  cmd_objtool =3D $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@=
)
>  endif
>
> +cmd_objtool_vmlinux :=3D
> +ifeq ($(CONFIG_HAVE_OBJTOOL_FTR_FIXUP),y)
> +cmd_objtool_vmlinux =3D $(if $(objtool-enabled), ; $(objtool) $(objtool-=
args) $@)
> +vmlinux:
> +    $(cmd_objtool_vmlinux)



This is complete garbage.

At first, I thought it was a build rule for vmlinux,
but it is not because $(cmd_objtool_vmlinux) is indented
by 4 spaces, not a tab.

Of course, you cannot add a vmlinux build rule here.
If it had been a tab instead of 4 spaces,
Make would have shown a warning.






> +endif
> +
>  cmd_gen_objtooldep =3D $(if $(objtool-enabled), { echo ; echo '$@: $$(wi=
ldcard $(objtool))' ; } >> $(dot-target).cmd)
>
>  endif # CONFIG_OBJTOOL



--=20
Best Regards
Masahiro Yamada
