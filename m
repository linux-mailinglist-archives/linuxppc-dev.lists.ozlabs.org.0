Return-Path: <linuxppc-dev+bounces-611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC8A960C8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 15:51:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtTVg5GhYz2yVG;
	Tue, 27 Aug 2024 23:51:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724749983;
	cv=none; b=VxCUcHNDo5vZF2CLMrpnd1r/uDE6DAILVz/TqgVFSg8yStEgHLDDyHViPHIm03d1xbM8+5xOs5RTD+GY+MQCEzZXUjmHCJAgyxToGfuaPVbrl5/TIvytB+jI4eU/bkIL3B52TIE/wXbeNHt8/bhXyRh8mYuxFnBh3Q2Hm3uivxMu9ZW7d89DfnuSal8KiDUScXD6HkWdFAVbfIs4N2Mw/nvnQI4xVBJyzzyhEJzXth2Z+LRVRFNevs0U9gMaN2URahESAdPuXG6QP88lVwTmECLYVQZmSkT95xQieze8QO8w2ii5Mwpim1VLMKc+djLNsJ/rbClPExjtp1vebRzWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724749983; c=relaxed/relaxed;
	bh=NuhLoQecOq0Z//Uf9Etm5nsf1UiggoC41NXx4EtmKFI=;
	h=Received:Received:DKIM-Signature:Received:X-Gm-Message-State:
	 X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding; b=Q8+Y14XOeiVrG1p/lWaBl/yav+zgfnp7NOmZmbgCZhH8Yl3PVXpv42DtehJ00tqBW0Cuv5tbPc7IIQLZ7QELWa97wmZdY59NNKt7pmz16iNizB+qQ1zmdJT2KJUSSZt3/MInDCGHRSXqfycdZJqC+G2ll1PQW26j84S0rsEJB32I7fzgdRqrXQ3bf5fIPrHLNESRWyYH849Qh1DqjX4Y8OVYSjMytNd2PYys48E4a6S9uczPZYhYlwuXFKD3SzdkSe0Flb3wnz542FuE3N9ZUKWVs+3fIOCyjUawlmZwoc1z9B0szxZ/QB9qygsTg6SqV8QHqrJKjEFDCr5T7OOg9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PrA01tKR; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PrA01tKR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtMJv1GKBz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 19:13:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08001A416D8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 09:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A61C8B7A4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 09:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724749980;
	bh=JxBQoVGyG+qnPOwGjG78VRBfznoWP5yyUz2/W3rfI0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PrA01tKRAv67667BhlYHwLAguaIpMvgYRwoz9RHhkkU4fdYgs3z1puwLLFt4z1yBy
	 upl6LRUGvlrtoGBB5IcTtB1SIWyk4uf34i3TaDnu7ViPYAmhlkvfoGspCTH3Kkt1OZ
	 /O1QYNB/5dewc14K70kKCELmMILYtHplTFZysZa8OvWZ9Et+lGPSOmRBAUbQ+RDXjS
	 5BCOahxLoEdHRh+qcvbmct22T/FUwQfssUtUREWQhhj7F8TTtmUpQmPOogWPiBWftb
	 mzQhUYovXDdNpWHvgNcGM7uqCprn3YOGPUuoQ0i32h9aS6WJAuIGs9lrdIi8fgVO5T
	 IlFDEbRg2r/zw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5343d2af735so3736215e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 02:13:00 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz0LGevYM3HDqFAHxlKXduFm35QkV6Db6Noln7i6u9VwmWOOxqh
	6iHPbK31U77DzobdGmiWyyRWc2mo+MNk6zJquycCem9SuBeBUbI6ZfdT9DaBMa9/wF/L72k4pME
	0taPI/vGVcfFxovYTFIqRSq8/Su0=
X-Google-Smtp-Source: AGHT+IFpCvVGtqFkt0e1lRXvFIGTnLGle1JtCtNw8SoAQ03bNvZsLp6/AZo8+h9NMyIwcFL6WJlC0PGYw5oMpoctElo=
X-Received: by 2002:a05:6512:2c8a:b0:52c:e0e1:9ae3 with SMTP id
 2adb3069b0e04-5344e500a1fmr1501367e87.57.1724749979251; Tue, 27 Aug 2024
 02:12:59 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.1720942106.git.naveen@kernel.org> <9cf2cdddba74ec167ae1af5ec189bba8f704fb51.1720942106.git.naveen@kernel.org>
In-Reply-To: <9cf2cdddba74ec167ae1af5ec189bba8f704fb51.1720942106.git.naveen@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 27 Aug 2024 18:12:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQV+B=Jx1o3j3YkVL6CuTz5uPUnS+340KGA7aKs2eLxXw@mail.gmail.com>
Message-ID: <CAK7LNAQV+B=Jx1o3j3YkVL6CuTz5uPUnS+340KGA7aKs2eLxXw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 12/17] powerpc64/ftrace: Move ftrace sequence out
 of line
To: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, 
	Vishal Chourasia <vishalc@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 5:29=E2=80=AFPM Naveen N Rao <naveen@kernel.org> wr=
ote:
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
> Signed-off-by: Naveen N Rao <naveen@kernel.org>



> diff --git a/arch/powerpc/tools/Makefile b/arch/powerpc/tools/Makefile
> new file mode 100644
> index 000000000000..31dd3151c272
> --- /dev/null
> +++ b/arch/powerpc/tools/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +quiet_cmd_gen_ftrace_ool_stubs =3D FTRACE  $@


This is not "FTRACE".

"GEN" or something like that.



> +      cmd_gen_ftrace_ool_stubs =3D $< $(objtree)/vmlinux.o $@
> +
> +targets +=3D .arch.vmlinux.o
> +.arch.vmlinux.o: $(srctree)/arch/powerpc/tools/ftrace-gen-ool-stubs.sh $=
(objtree)/vmlinux.o FORCE
> +       $(call if_changed,gen_ftrace_ool_stubs)
> +
> +clean-files +=3D $(objtree)/.arch.vmlinux.S $(objtree)/.arch.vmlinux.o



This is wrong. $(objtree) is always '.'

It will attempt to clean up:

arch/powerpc/tools/.arch.vmlinux.S
arch/powerpc/tools/.arch.vmlinux.o



You must not create the intermediate file,
.arch.vmlinux.S at the top directory because
this build step is pretty much PowerPC-specific.


Rather, I'd recommend to create *.S and *.o in
arch/powerpc/tools/:

arch/powerpc/tools/vmlinux.S
arch/powerpc/tools/vmlinux.o




When you submit the next version, please run 'make clean'
and confirm that any powerpc-specific build artifacts
not being left-over.






> diff --git a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh b/arch/powerpc/to=
ols/ftrace-gen-ool-stubs.sh
> new file mode 100755
> index 000000000000..0b85cd5262ff
> --- /dev/null
> +++ b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# Error out on error
> +set -e
> +
> +is_enabled() {
> +       grep -q "^$1=3Dy" include/config/auto.conf
> +}
> +
> +vmlinux_o=3D${1}
> +arch_vmlinux_o=3D${2}
> +arch_vmlinux_S=3D$(dirname ${arch_vmlinux_o})/$(basename ${arch_vmlinux_=
o} .o).S
> +
> +RELOCATION=3DR_PPC64_ADDR64
> +if is_enabled CONFIG_PPC32; then
> +       RELOCATION=3DR_PPC_ADDR32
> +fi
> +
> +num_ool_stubs_text=3D$(${CROSS_COMPILE}objdump -r -j __patchable_functio=
n_entries ${vmlinux_o} |
> +                    grep -v ".init.text" | grep "${RELOCATION}" | wc -l)
> +num_ool_stubs_inittext=3D$(${CROSS_COMPILE}objdump -r -j __patchable_fun=
ction_entries ${vmlinux_o} |
> +                        grep ".init.text" | grep "${RELOCATION}" | wc -l=
)
> +
> +cat > ${arch_vmlinux_S} <<EOF
> +#include <asm/asm-offsets.h>
> +#include <linux/linkage.h>
> +
> +.pushsection .tramp.ftrace.text,"aw"
> +SYM_DATA(ftrace_ool_stub_text_end_count, .long ${num_ool_stubs_text})
> +
> +SYM_CODE_START(ftrace_ool_stub_text_end)
> +       .space ${num_ool_stubs_text} * FTRACE_OOL_STUB_SIZE
> +SYM_CODE_END(ftrace_ool_stub_text_end)
> +.popsection
> +
> +.pushsection .tramp.ftrace.init,"aw"
> +SYM_DATA(ftrace_ool_stub_inittext_count, .long ${num_ool_stubs_inittext}=
)
> +
> +SYM_CODE_START(ftrace_ool_stub_inittext)
> +       .space ${num_ool_stubs_inittext} * FTRACE_OOL_STUB_SIZE
> +SYM_CODE_END(ftrace_ool_stub_inittext)
> +.popsection
> +EOF
> +
> +${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
> +      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
> +      -c -o ${arch_vmlinux_o} ${arch_vmlinux_S}


Please do not compile this within a shell script.

scripts/Makefile.build provides rule_as_o_S to do this.




[1] vmlinux.o --> arch/powerpc/tools/vmlinux.S

[2] arch/powerpc/tools/vmlinux.S --> arch/powerpc/tools/vmlinux.o


Please split these in separate build rules.





> --
> 2.45.2
>


--
Best Regards
Masahiro Yamada

