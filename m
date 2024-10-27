Return-Path: <linuxppc-dev+bounces-2621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424679B1CB7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2024 10:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xbrcz6b7kz2yDM;
	Sun, 27 Oct 2024 20:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730020915;
	cv=none; b=SaH0/3oJgc9DiADvajHo/k+8EIB3D/Erj3cvMASbePAIkyqMshPV8MONq00UHO9aAEvr3d3bA/lNaWTCdUfj++fromC7Q+WpFCvbMr5h1vZCnySch54OoCe1AcP/ZxlZ9Tkky4xAYu0rOx4+9JUdD5z051Z3hjUivPM2fQnZDnzR8GIj2lJXyIO8AKRRBrxiesC4LShLUX217VYvbNrxUotMnoEEHK0RhYs1DWI0Z2I1QcNPqnMQmzbUG59TYGHKFNBFnYB5wqD5RKBOo2j2d2KrW1JKEhnWLYaJ1kSIUDvJLkiGFqwSrgkk/BuMfSJo0Dg5rWKGtwSYZlVvBWz5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730020915; c=relaxed/relaxed;
	bh=5pHUm7Z6Z19d+vQZMhRBoR17RCwP/vX35Z60dap7l8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hb/7AVyz1SBOUrG6hlqmjWqyTA8JQC58iDCPRcObfuDYat04xZ+Z7t10d4Q6V1Co8SYr1GQmMPLBaQm9kBThhUrel/j25+w8B0WHZYXgmtqSZthd7bDI5U2V+09+5Ho5mIxP4r+c44Btvdal82R6xUPmy63bp2qWHxFIzL2fToF5x2Pg6/rnhnLhw8ybIUHCue+QBqf2KW5sbQskQf+fE1piRJmUkKlt+jToxD507qiodmDIVdf84ibTxT5jn9sMfcRb+BwVfQlf3DtGdM+ElNt30PPdeEUZdq3/krlgT5JQTQ8C/busdWG/Uc8Gw+ASLS+Dfllfut97Q+hySSpjNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n5DDEy4+; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n5DDEy4+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xbrcy5F9Zz2y66
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 20:21:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B855A40EB5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 09:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C2AC4CEE9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730020912;
	bh=Hhva42WPCShAFFkXmCOYCeH5zalvUU7wEkwSbU5sfHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n5DDEy4+ez5iIRNSlZLIh0/6u/o9dBtmMQ3Qnrw5YX0TjsNcqb//7mbzdZa3iFYyA
	 vgOphpGVRof5tqvAwK9GeiLDHr5aKa3EGzTJo3UYGTkV0tr123xcNnWCKlEO9mWRlp
	 8jFhmzIfYo587Y8MHTISZ1Ge/XW654DS3fJIfsoPLBumyYowonPPTWd9O1dM+zjGS0
	 cKA2nsWz69tHXiEaTiTvXjap+ul1scYk7wUs09+8v2qp4Q7qwo4DwdeU//aBwHCNoF
	 w5/cE7ii8desYpS4j3L4IdC5OEQeh0oG1r59NuXzdAcjYGg7VfQyM0AEKAddyvwQK9
	 yqg/w4iMcLqLA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f1292a9bso4020959e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 02:21:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YwfUOhEK8lOsF9DF5tKjR6NOraRpZ+sB/jywIz+lGqbpPhmRR5L
	gfb1yv+/aRnF980gRTDLq08cAE2Xbn+0KAhxvHI/bekhAKs6BiJYiCtZRF8syJb1lh+0NLIF9ON
	kOTWC2q3GYVxkHhXimkocOUJsO54=
X-Google-Smtp-Source: AGHT+IHWDEbdS6dDes0FXasZhcczxuG/y8V5MfEi19kb1OsAxqisZ47o0GkY5XeGVwsrBNUXk3HWpjxvqknLG0iETfA=
X-Received: by 2002:a05:6512:230b:b0:539:d05c:f553 with SMTP id
 2adb3069b0e04-53b348cc551mr1681456e87.21.1730020910946; Sun, 27 Oct 2024
 02:21:50 -0700 (PDT)
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
References: <20241018173632.277333-1-hbathini@linux.ibm.com> <20241018173632.277333-13-hbathini@linux.ibm.com>
In-Reply-To: <20241018173632.277333-13-hbathini@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 27 Oct 2024 18:21:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASyfxY9RJU+pvEdyd6yuB=r4C9xcvBBTLokXe_xkhM8RA@mail.gmail.com>
Message-ID: <CAK7LNASyfxY9RJU+pvEdyd6yuB=r4C9xcvBBTLokXe_xkhM8RA@mail.gmail.com>
Subject: Re: [PATCH v6 12/17] powerpc64/ftrace: Move ftrace sequence out of line
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	"Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nicholas Piggin <npiggin@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 19, 2024 at 2:38=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
> From: Naveen N Rao <naveen@kernel.org>
>
> Function profile sequence on powerpc includes two instructions at the
> beginning of each function:
>         mflr    r0
>         bl      ftrace_caller
>
> The call to ftrace_caller() gets nop'ed out during kernel boot and is
> patched in when ftrace is enabled.
>
> Given the sequence, we cannot return from ftrace_caller with 'blr' as we
> need to keep LR and r0 intact. This results in link stack (return
> address predictor) imbalance when ftrace is enabled. To address that, we
> would like to use a three instruction sequence:
>         mflr    r0
>         bl      ftrace_caller
>         mtlr    r0
>
> Further more, to support DYNAMIC_FTRACE_WITH_CALL_OPS, we need to
> reserve two instruction slots before the function. This results in a
> total of five instruction slots to be reserved for ftrace use on each
> function that is traced.
>
> Move the function profile sequence out-of-line to minimize its impact.
> To do this, we reserve a single nop at function entry using
> -fpatchable-function-entry=3D1 and add a pass on vmlinux.o to determine
> the total number of functions that can be traced. This is then used to
> generate a .S file reserving the appropriate amount of space for use as
> ftrace stubs, which is built and linked into vmlinux.
>
> On bootup, the stub space is split into separate stubs per function and
> populated with the proper instruction sequence. A pointer to the
> associated stub is maintained in dyn_arch_ftrace.
>
> For modules, space for ftrace stubs is reserved from the generic module
> stub space.
>
> This is restricted to and enabled by default only on 64-bit powerpc,
> though there are some changes to accommodate 32-bit powerpc. This is
> done so that 32-bit powerpc could choose to opt into this based on
> further tests and benchmarks.
>
> As an example, after this patch, kernel functions will have a single nop
> at function entry:
> <kernel_clone>:
>         addis   r2,r12,467
>         addi    r2,r2,-16028
>         nop
>         mfocrf  r11,8
>         ...
>
> When ftrace is enabled, the nop is converted to an unconditional branch
> to the stub associated with that function:
> <kernel_clone>:
>         addis   r2,r12,467
>         addi    r2,r2,-16028
>         b       ftrace_ool_stub_text_end+0x11b28
>         mfocrf  r11,8
>         ...
>
> The associated stub:
> <ftrace_ool_stub_text_end+0x11b28>:
>         mflr    r0
>         bl      ftrace_caller
>         mtlr    r0
>         b       kernel_clone+0xc
>         ...
>
> This change showed an improvement of ~10% in null_syscall benchmark on a
> Power 10 system with ftrace enabled.
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---

> diff --git a/arch/powerpc/tools/Makefile b/arch/powerpc/tools/Makefile
> new file mode 100644
> index 000000000000..d2e7ecd5f46f
> --- /dev/null
> +++ b/arch/powerpc/tools/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +quiet_cmd_gen_ftrace_ool_stubs =3D GEN     $@
> +      cmd_gen_ftrace_ool_stubs =3D $< "$(CONFIG_64BIT)" "$(OBJDUMP)" vml=
inux.o $@
> +
> +$(obj)/vmlinux.arch.S: $(src)/ftrace-gen-ool-stubs.sh vmlinux.o FORCE
> +       $(call if_changed,gen_ftrace_ool_stubs)
> +
> +targets +=3D vmlinux.arch.S


Makefile looks good to me.


> diff --git a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh b/arch/powerpc/to=
ols/ftrace-gen-ool-stubs.sh
> new file mode 100755
> index 000000000000..96e1ca5803e4
> --- /dev/null
> +++ b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
> @@ -0,0 +1,41 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# Error out on error
> +set -e
> +
> +is_64bit=3D"$1"
> +objdump=3D"$2"
> +vmlinux_o=3D"$3"
> +arch_vmlinux_S=3D"$4"
> +
> +RELOCATION=3DR_PPC64_ADDR64
> +if [ -z "$is_64bit" ]; then
> +       RELOCATION=3DR_PPC_ADDR32
> +fi
> +
> +num_ool_stubs_text=3D$($objdump -r -j __patchable_function_entries "$vml=
inux_o" |
> +                    grep -v ".init.text" | grep -c "$RELOCATION")
> +num_ool_stubs_inittext=3D$($objdump -r -j __patchable_function_entries "=
$vmlinux_o" |
> +                        grep ".init.text" | grep -c "$RELOCATION")
> +
> +cat > "$arch_vmlinux_S" <<EOF
> +#include <asm/asm-offsets.h>
> +#include <linux/linkage.h>
> +
> +.pushsection .tramp.ftrace.text,"aw"
> +SYM_DATA(ftrace_ool_stub_text_end_count, .long $num_ool_stubs_text)
> +
> +SYM_CODE_START(ftrace_ool_stub_text_end)
> +       .space $num_ool_stubs_text * FTRACE_OOL_STUB_SIZE
> +SYM_CODE_END(ftrace_ool_stub_text_end)
> +.popsection
> +
> +.pushsection .tramp.ftrace.init,"aw"
> +SYM_DATA(ftrace_ool_stub_inittext_count, .long $num_ool_stubs_inittext)
> +
> +SYM_CODE_START(ftrace_ool_stub_inittext)
> +       .space $num_ool_stubs_inittext * FTRACE_OOL_STUB_SIZE


To avoid the warning mention in another thread,
it is better to avoid zero .space.





> +SYM_CODE_END(ftrace_ool_stub_inittext)
> +.popsection
> +EOF
> --
> 2.47.0
>


--=20
Best Regards
Masahiro Yamada

