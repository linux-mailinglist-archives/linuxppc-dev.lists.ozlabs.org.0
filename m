Return-Path: <linuxppc-dev+bounces-1894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B736A996FD0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 17:36:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNxnw3nfyz3bbR;
	Thu, 10 Oct 2024 02:36:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728488212;
	cv=none; b=ipYUZ0MB3IQewer4xIOaZ4CNqS3j9I7VrZYj8xJsjagxcflYLK1sKvbFKvb3Pg8YdCpVu7kacCALA4EophtDYEIKHM/+RPz1cmiuI+fe/1pecCBWP/RnZYYZaYxGpq5pOBUAjtn9xwnsIqvxz/jQxHBSbpql4Pz8BZwEoVu3GSrdHza/xGKPlu3ic/1493+/ZqxlJZaCOoszWjco2FbgKFhDswWsVSvmFWlcA72xoeI6h/pTGzvqSIMdmlTndt80w/V9IZ+9j5zTrqOMl8pLerF3HhbsxzkTVnQVpuJKtn1QEaJKRjDgVYDMd8ztYlk0+DP68JOlYV5EvyJci8RBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728488212; c=relaxed/relaxed;
	bh=zt7UYEgR0CArmQbFiJgoVvVd8dTPOUuj2gKNJ2LIx2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQQ8bMpe1PmcGoHpHa4QGDLxEZ85VeGm5O2uJXvAniKkzdOy//Kx4xsCzEP9w+nq00gVzBoDP+DiBszSqqmmBmx/29ry4OpMHTYehxK7uPzlyjdFigim5VV8C1x5QndeZml8VOwtmEEH0+CKlrVIPEh8SznlrbAzGbph/7v9aN3TSQBbpNKlqshJc7TZu37HTXfqG+c/hlxyZqyoi1BCTgn5z/8Ep7D3hUnUlm1gbOgDUvafHjtHP1twC8nGj5PponqUk9d6veY7IhaYZ4eGnBOPBFI3KDqHxTnSc+AhYtWt2GJAzP9sLb07bN4IUyD67tRA0Ytx6gN+ibZGUqU35A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aFymucgi; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aFymucgi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNxnv0q4Cz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 02:36:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE29B5C589D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 15:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B341C4CEC5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728488208;
	bh=5W/eU0wvAS76JaKdlOSIGQ7kJOMA6WDcLObcwgbmvp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aFymucgibUGQ4oF6G5DJqtrSLbWtFTV2T+it2VrzAD3MWPqXS/QY7ilPKtdYxcSax
	 r/IGdt2OkOjtRzbqo30v+YiMjNW/G+zylnDs4S2pFKY4k22BrTfyMEg6jtLVkorMy+
	 IM6Ix5KCL0vsHEh1Z7EBT0vAGcKJJEPSZcCaPww2rrQSrSueHkhnS7l+WX6i5pvgsJ
	 7vsXwnUNyZNm0pYB0N+07bixMXdiC3/fUUrfov5l9cLBT4mfjVja4lWV+ohZmcG0e4
	 Jkpdtj9gNXBcdqIs6JMhEfXBDVXH7SWikMFbcp0TvxczgGZnGyKnab4lgSIFSiCSQ1
	 U524DPXujqU+w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398df2c871so7784749e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Oct 2024 08:36:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YxTU9c0NJs3DCZJmK1gcySCRlxdPUwUjT4r/o8PDlLLJ5qpgVVk
	oDyOKuIDhd+yzsyEeAxHxtUmc8nWvWjFCIAihztPXACic0BeGTsEZZ5B1oomLxGKR8dyP7HF2Hw
	68MRmsTCwqyxt854mZFpgY7/Ts7w=
X-Google-Smtp-Source: AGHT+IErCEsVSBygSrHOAxgDw+LlqbSlTSSpSn7uhv6ysjnosQXrEtX5GI4xz8sB9o22daBlWO7gKFAhl8OpeL3/vv0=
X-Received: by 2002:a05:6512:b84:b0:539:9155:e8bf with SMTP id
 2adb3069b0e04-539c92756b3mr448385e87.12.1728488207156; Wed, 09 Oct 2024
 08:36:47 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240915205648.830121-1-hbathini@linux.ibm.com> <20240915205648.830121-14-hbathini@linux.ibm.com>
In-Reply-To: <20240915205648.830121-14-hbathini@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 10 Oct 2024 00:36:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREkj5OQ_HA2H=iV_32qdOcaguCOBKV1j+dJW0YaQh3UA@mail.gmail.com>
Message-ID: <CAK7LNAREkj5OQ_HA2H=iV_32qdOcaguCOBKV1j+dJW0YaQh3UA@mail.gmail.com>
Subject: Re: [PATCH v5 13/17] powerpc64/ftrace: Support .text larger than 32MB
 with out-of-line stubs
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Naveen N. Rao" <naveen@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Sep 16, 2024 at 5:58=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
> From: Naveen N Rao <naveen@kernel.org>
>
> We are restricted to a .text size of ~32MB when using out-of-line
> function profile sequence. Allow this to be extended up to the previous
> limit of ~64MB by reserving space in the middle of .text.
>
> A new config option CONFIG_PPC_FTRACE_OUT_OF_LINE_NUM_RESERVE is
> introduced to specify the number of function stubs that are reserved in
> .text. On boot, ftrace utilizes stubs from this area first before using
> the stub area at the end of .text.
>
> A ppc64le defconfig has ~44k functions that can be traced. A more
> conservative value of 32k functions is chosen as the default value of
> PPC_FTRACE_OUT_OF_LINE_NUM_RESERVE so that we do not allot more space
> than necessary by default. If building a kernel that only has 32k
> trace-able functions, we won't allot any more space at the end of .text
> during the pass on vmlinux.o. Otherwise, only the remaining functions
> get space for stubs at the end of .text. This default value should help
> cover a .text size of ~48MB in total (including space reserved at the
> end of .text which can cover up to 32MB), which should be sufficient for
> most common builds. For a very small kernel build, this can be set to 0.
> Or, this can be bumped up to a larger value to support vmlinux .text
> size up to ~64MB.
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>
> Changes in v5:
> * num_ool_stubs_text_end used for setting up ftrace_ool_stub_text_end
>   set to zero instead of computing to some random negative value when
>   not required.
>
>  arch/powerpc/Kconfig                       | 12 ++++++++++++
>  arch/powerpc/include/asm/ftrace.h          |  6 ++++--
>  arch/powerpc/kernel/trace/ftrace.c         | 21 +++++++++++++++++----
>  arch/powerpc/kernel/trace/ftrace_entry.S   |  8 ++++++++
>  arch/powerpc/tools/Makefile                |  2 +-
>  arch/powerpc/tools/ftrace-gen-ool-stubs.sh | 16 ++++++++++++----
>  6 files changed, 54 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index bae96b65f295..a0ce00368bab 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -573,6 +573,18 @@ config PPC_FTRACE_OUT_OF_LINE
>         depends on PPC64
>         select ARCH_WANTS_PRE_LINK_VMLINUX
>
> +config PPC_FTRACE_OUT_OF_LINE_NUM_RESERVE
> +       int "Number of ftrace out-of-line stubs to reserve within .text"
> +       default 32768 if PPC_FTRACE_OUT_OF_LINE
> +       default 0

This entry is meaningless when CONFIG_PPC_FTRACE_OUT_OF_LINE=3Dn.

           depends on PPC_FTRACE_OUT_OF_LINE
           default 32768




> +       help
> +         Number of stubs to reserve for use by ftrace. This space is
> +         reserved within .text, and is distinct from any additional spac=
e
> +         added at the end of .text before the final vmlinux link. Set to
> +         zero to have stubs only be generated at the end of vmlinux (onl=
y
> +         if the size of vmlinux is less than 32MB). Set to a higher valu=
e
> +         if building vmlinux larger than 48MB.
> +
>  config HOTPLUG_CPU
>         bool "Support for enabling/disabling CPUs"
>         depends on SMP && (PPC_PSERIES || \
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm=
/ftrace.h
> index bdbafc668b20..28f3590ca780 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -138,8 +138,10 @@ extern unsigned int ftrace_tramp_text[], ftrace_tram=
p_init[];
>  struct ftrace_ool_stub {
>         u32     insn[4];
>  };
> -extern struct ftrace_ool_stub ftrace_ool_stub_text_end[], ftrace_ool_stu=
b_inittext[];
> -extern unsigned int ftrace_ool_stub_text_end_count, ftrace_ool_stub_init=
text_count;
> +extern struct ftrace_ool_stub ftrace_ool_stub_text_end[], ftrace_ool_stu=
b_text[],
> +                             ftrace_ool_stub_inittext[];
> +extern unsigned int ftrace_ool_stub_text_end_count, ftrace_ool_stub_text=
_count,
> +                   ftrace_ool_stub_inittext_count;
>  #endif
>  void ftrace_free_init_tramp(void);
>  unsigned long ftrace_call_adjust(unsigned long addr);
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index 1fee074388cc..bee2c54a8c04 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -168,7 +168,7 @@ static int ftrace_get_call_inst(struct dyn_ftrace *re=
c, unsigned long addr, ppc_
>  static int ftrace_init_ool_stub(struct module *mod, struct dyn_ftrace *r=
ec)
>  {
>  #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
> -       static int ool_stub_text_end_index, ool_stub_inittext_index;
> +       static int ool_stub_text_index, ool_stub_text_end_index, ool_stub=
_inittext_index;
>         int ret =3D 0, ool_stub_count, *ool_stub_index;
>         ppc_inst_t inst;
>         /*
> @@ -191,9 +191,22 @@ static int ftrace_init_ool_stub(struct module *mod, =
struct dyn_ftrace *rec)
>                 ool_stub_index =3D &ool_stub_inittext_index;
>                 ool_stub_count =3D ftrace_ool_stub_inittext_count;
>         } else if (is_kernel_text(rec->ip)) {
> -               ool_stub =3D ftrace_ool_stub_text_end;
> -               ool_stub_index =3D &ool_stub_text_end_index;
> -               ool_stub_count =3D ftrace_ool_stub_text_end_count;
> +               /*
> +                * ftrace records are sorted, so we first use up the stub=
 area within .text
> +                * (ftrace_ool_stub_text) before using the area at the en=
d of .text
> +                * (ftrace_ool_stub_text_end), unless the stub is out of =
range of the record.
> +                */
> +               if (ool_stub_text_index >=3D ftrace_ool_stub_text_count |=
|
> +                   !is_offset_in_branch_range((long)rec->ip -
> +                                              (long)&ftrace_ool_stub_tex=
t[ool_stub_text_index])) {
> +                       ool_stub =3D ftrace_ool_stub_text_end;
> +                       ool_stub_index =3D &ool_stub_text_end_index;
> +                       ool_stub_count =3D ftrace_ool_stub_text_end_count=
;
> +               } else {
> +                       ool_stub =3D ftrace_ool_stub_text;
> +                       ool_stub_index =3D &ool_stub_text_index;
> +                       ool_stub_count =3D ftrace_ool_stub_text_count;
> +               }
>  #ifdef CONFIG_MODULES
>         } else if (mod) {
>                 ool_stub =3D mod->arch.ool_stubs;
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kern=
el/trace/ftrace_entry.S
> index 5b2fc6483dce..a6bf7f841040 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -374,6 +374,14 @@ _GLOBAL(return_to_handler)
>         blr
>  #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
>
> +#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
> +SYM_DATA(ftrace_ool_stub_text_count, .long CONFIG_PPC_FTRACE_OUT_OF_LINE=
_NUM_RESERVE)
> +
> +SYM_CODE_START(ftrace_ool_stub_text)
> +       .space CONFIG_PPC_FTRACE_OUT_OF_LINE_NUM_RESERVE * FTRACE_OOL_STU=
B_SIZE
> +SYM_CODE_END(ftrace_ool_stub_text)
> +#endif
> +
>  .pushsection ".tramp.ftrace.text","aw",@progbits;
>  .globl ftrace_tramp_text
>  ftrace_tramp_text:
> diff --git a/arch/powerpc/tools/Makefile b/arch/powerpc/tools/Makefile
> index 3a389526498e..9eeb6edf02fe 100644
> --- a/arch/powerpc/tools/Makefile
> +++ b/arch/powerpc/tools/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>
>  quiet_cmd_gen_ftrace_ool_stubs =3D GEN     $@
> -      cmd_gen_ftrace_ool_stubs =3D $< vmlinux.o $@
> +      cmd_gen_ftrace_ool_stubs =3D $< $(CONFIG_PPC_FTRACE_OUT_OF_LINE_NU=
M_RESERVE) vmlinux.o $@
>
>  $(obj)/.vmlinux.arch.S: $(src)/ftrace-gen-ool-stubs.sh vmlinux.o FORCE
>         $(call if_changed,gen_ftrace_ool_stubs)
> diff --git a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh b/arch/powerpc/to=
ols/ftrace-gen-ool-stubs.sh
> index 8e0a6d4ea202..d6bd834e0868 100755
> --- a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
> +++ b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
> @@ -8,8 +8,9 @@ is_enabled() {
>         grep -q "^$1=3Dy" include/config/auto.conf
>  }
>
> -vmlinux_o=3D${1}
> -arch_vmlinux_S=3D${2}
> +vmlinux_o=3D${2}
> +arch_vmlinux_S=3D${3}
> +arch_vmlinux_o=3D$(dirname ${arch_vmlinux_S})/$(basename ${arch_vmlinux_=
S} .S).o


arch_vmlinux_o is not used in this script. Delete it.






>
>  RELOCATION=3DR_PPC64_ADDR64
>  if is_enabled CONFIG_PPC32; then
> @@ -21,15 +22,22 @@ num_ool_stubs_text=3D$(${CROSS_COMPILE}objdump -r -j =
__patchable_function_entries
>  num_ool_stubs_inittext=3D$(${CROSS_COMPILE}objdump -r -j __patchable_fun=
ction_entries ${vmlinux_o} |
>                          grep ".init.text" | grep "${RELOCATION}" | wc -l=
)
>
> +num_ool_stubs_text_builtin=3D${1}
> +if [ ${num_ool_stubs_text} -gt ${num_ool_stubs_text_builtin} ]; then
> +       num_ool_stubs_text_end=3D$(expr ${num_ool_stubs_text} - ${num_ool=
_stubs_text_builtin})
> +else
> +       num_ool_stubs_text_end=3D0
> +fi
> +
>  cat > ${arch_vmlinux_S} <<EOF
>  #include <asm/asm-offsets.h>
>  #include <linux/linkage.h>
>
>  .pushsection .tramp.ftrace.text,"aw"
> -SYM_DATA(ftrace_ool_stub_text_end_count, .long ${num_ool_stubs_text})
> +SYM_DATA(ftrace_ool_stub_text_end_count, .long ${num_ool_stubs_text_end}=
)
>
>  SYM_CODE_START(ftrace_ool_stub_text_end)
> -       .space ${num_ool_stubs_text} * FTRACE_OOL_STUB_SIZE
> +       .space ${num_ool_stubs_text_end} * FTRACE_OOL_STUB_SIZE
>  SYM_CODE_END(ftrace_ool_stub_text_end)
>  .popsection
>
> --
> 2.46.0
>


--
Best Regards
Masahiro Yamada

