Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5584E67711D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jan 2023 18:30:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0Kxj1d06z3cBj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 04:30:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L3R3VeuI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L3R3VeuI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0KwV6GLDz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 04:29:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C152E60C58
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jan 2023 17:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D01CC43446
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jan 2023 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674408549;
	bh=I5pV/HoNpTTtkCpHa3T7LwdnAQwwVwXQ/luDQGSOteE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L3R3VeuI8b7SphmS83VI3MhZIjgDm6ANfUG/6GLDdAssBf8R7BhAf78erSlDbdCOA
	 SHR+IgQ6/XkSHZgpJfPyQerUVWvlHhmeN4a9pX9i1iiMGQR1NCtYmJ1cXwTwfhZX7o
	 nSUmSWPnPqViFik1ksvVU9V1IDz/9d4RBT2fojd5aUL4rHTIN4194hnchaX8aC+BTF
	 BVqo/UYoMw7a7dCGuw7CuV/Pc986UJI4q+9eT9V3NhMq3b5TVJgU4xKxtdcd/uUXK3
	 PYu79weFDNfEExeZDTIf8YARqxjWnMGBiR5AM+Sg0Tc3PNXSMv1Gk/Hn9eD63agM4/
	 o6TOm8IVHvoHg==
Received: by mail-oi1-f178.google.com with SMTP id n8so8611979oih.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jan 2023 09:29:09 -0800 (PST)
X-Gm-Message-State: AFqh2krMLNFX9fhXwUe41JlvYXPYSw4qu0SiIp0FM6kjWHTOjZXROeVV
	SomMwDdJSJNWNWm/W0hTzcG9miqk2H1cVWI2wmA=
X-Google-Smtp-Source: AMrXdXv8T6XTJrOgPfMqPTdeIlKFiVnKdMrLMQCnsb/JOpLPDdW3j/ypXqu3QgM9nVl1xzM73W2o7XvcmK9sHyhknFM=
X-Received: by 2002:a05:6808:1786:b0:35e:7c55:b015 with SMTP id
 bg6-20020a056808178600b0035e7c55b015mr1279449oib.287.1674408548537; Sun, 22
 Jan 2023 09:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 23 Jan 2023 02:28:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ-HmyKYAWbF2MHEU1FzBzKOvE2DU7Js6tntszLrtUkDg@mail.gmail.com>
Message-ID: <CAK7LNAQ-HmyKYAWbF2MHEU1FzBzKOvE2DU7Js6tntszLrtUkDg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: trix@redhat.com, dave.hansen@linux.intel.com, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>, x86@kernel.org, mingo@redhat.com, llvm@lists.linux.dev, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, npiggin@gmail.com, bp@alien8.de, tglx@linutronix.de, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, ndesaulniers@google.com, linux-mips@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 12:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi all,
>
> Clang can emit a few different warnings when it encounters a flag that it
> recognizes but does not support internally. These warnings are elevated to
> errors within {as,cc}-option via -Werror to catch unsupported flags that should
> not be added to KBUILD_{A,C}FLAGS; see commit c3f0d0bc5b01 ("kbuild, LLVMLinux:
> Add -Werror to cc-option to support clang").
>
> If an unsupported flag is unconditionally to KBUILD_{A,C}FLAGS, all subsequent
> {as,cc}-option will always fail, preventing supported and even potentially
> necessary flags from getting adding to the tool flags.
>
> One would expect these warnings to be visible in the kernel build logs since
> they are added to KBUILD_{A,C}FLAGS but unfortunately, these warnings are
> hidden with clang's -Qunused-arguments flag, which is added to KBUILD_CPPFLAGS
> and used for both compiling and assembling files.
>
> Patches 1-4 address the internal inconsistencies of invoking the assembler
> within kbuild by using KBUILD_AFLAGS consistently and using '-x
> assembler-with-cpp' over '-x assembler'. This matches how assembly files are
> built across the kernel and helps avoid problems in situations where macro
> definitions or warning flags are present in KBUILD_AFLAGS, which cause
> instances of -Wunused-command-line-argument when the preprocessor is not called
> to consume them. There were a couple of places in architecture code where this
> change would break things so those are fixed first.
>
> Patches 5-12 clean up warnings that will show up when -Qunused-argument is
> dropped. I hope none of these are controversial.
>
> Patch 13 turns two warnings into errors so that the presence of unused flags
> cannot be easily ignored.
>
> Patch 14 drops -Qunused-argument. This is done last so that it can be easily
> reverted if need be.
>
> This series has seen my personal test framework, which tests several different
> configurations and architectures, with LLVM tip of tree (16.0.0). I have done
> defconfig, allmodconfig, and allnoconfig builds for arm, arm64, i386, mips,
> powerpc, riscv, s390, and x86_64 with GCC 12.2.0 as well but I am hoping the
> rest of the test infrastructure will catch any lurking problems.
>
> I would like this series to stay together so that there is no opportunity for
> breakage so please consider giving acks so that this can be carried via the
> kbuild tree (and many thanks to the people who have already provided such
> tags).


All applied to linux-kbuild. Thanks.

I left small comments in 07/14.








> ---
> Changes in v2:
> - Pick up tags where provided (thank you everyone!)
> - Patch 6 and 9: Clarify that '-s' is a compiler flag that is only relevant to
>   the linking phase and remove all mention of the assembler's '-s' flag, as the
>   assembler is never directly invoked (Nick, Segher)
> - Patch 7: Move '-z noexecstack' into new ldflags-y variable (Nick)
> - Patch 8: Reword commit message to explain the problem in a clearer manner
>   (Nick)
> - Link to v1: https://lore.kernel.org/r/20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org
>
> ---
> Nathan Chancellor (12):
>       MIPS: Always use -Wa,-msoft-float and eliminate GAS_HAS_SET_HARDFLOAT
>       MIPS: Prefer cc-option for additions to cflags
>       powerpc: Remove linker flag from KBUILD_AFLAGS
>       powerpc/vdso: Remove unused '-s' flag from ASFLAGS
>       powerpc/vdso: Improve linker flags
>       powerpc/vdso: Remove an unsupported flag from vgettimeofday-32.o with clang
>       s390/vdso: Drop unused '-s' flag from KBUILD_AFLAGS_64
>       s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
>       s390/purgatory: Remove unused '-MD' and unnecessary '-c' flags
>       drm/amd/display: Do not add '-mhard-float' to dml_ccflags for clang
>       kbuild: Turn a couple more of clang's unused option warnings into errors
>       kbuild: Stop using '-Qunused-arguments' with clang
>
> Nick Desaulniers (2):
>       x86/boot/compressed: prefer cc-option for CFLAGS additions
>       kbuild: Update assembler calls to use proper flags and language target
>
>  Makefile                                    |  1 -
>  arch/mips/Makefile                          | 13 ++-------
>  arch/mips/include/asm/asmmacro-32.h         |  4 +--
>  arch/mips/include/asm/asmmacro.h            | 42 ++++++++++++++---------------
>  arch/mips/include/asm/fpregdef.h            | 14 ----------
>  arch/mips/include/asm/mipsregs.h            | 20 +++-----------
>  arch/mips/kernel/genex.S                    |  2 +-
>  arch/mips/kernel/r2300_fpu.S                |  4 +--
>  arch/mips/kernel/r4k_fpu.S                  | 12 ++++-----
>  arch/mips/kvm/fpu.S                         |  6 ++---
>  arch/mips/loongson2ef/Platform              |  2 +-
>  arch/powerpc/Makefile                       |  2 +-
>  arch/powerpc/kernel/vdso/Makefile           | 25 +++++++++++------
>  arch/s390/kernel/vdso64/Makefile            |  4 +--
>  arch/s390/purgatory/Makefile                |  2 +-
>  arch/x86/boot/compressed/Makefile           |  2 +-
>  drivers/gpu/drm/amd/display/dc/dml/Makefile |  3 ++-
>  scripts/Kconfig.include                     |  2 +-
>  scripts/Makefile.clang                      |  2 ++
>  scripts/Makefile.compiler                   |  8 +++---
>  scripts/as-version.sh                       |  2 +-
>  21 files changed, 74 insertions(+), 98 deletions(-)
> ---
> base-commit: 88603b6dc419445847923fcb7fe5080067a30f98
> change-id: 20221228-drop-qunused-arguments-0c5c7dae54fb
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--
Best Regards
Masahiro Yamada
