Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C8B667D59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 19:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtC9K5gDfz3fBJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 05:04:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LmNrxNiZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=sedat.dilek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LmNrxNiZ;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtC8M4sNzz2yg5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 05:03:13 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id s22so20170033ljp.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 10:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndh3l6uBoXa06zj+WBg5LiMdLFR8aWNRgARJ4DfSidI=;
        b=LmNrxNiZmnVFVPOM8BmikHO+4MdtaTs310NFHCrQYh4OmFV5ncP+XH0c5dQn01fuwx
         n5W72KOXp97Bj7YGCaO+z3yCVVIFae1JbKOuUx15pk1F3J3j36/X+daLs+rGgB6Nu/6X
         2YYgycZXiW3ADy31jqqUzgaR6RqVP6Z3joMShb/qD9lPd5woGyZKRdvyULhnqPp+KGTx
         Ohq1acwDyvdHJ9p3h+pcfbKHd2I8DbNWwZazTj7QDILzRh2vWEl0UUdCyyY5e6w0G85o
         hnqIlntQ6RfWEpqrc8MRRd3+k369cYBzvHCRGDUBXCY2cWVyRnAYwvfWQHJ92Xp9QFxr
         9X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ndh3l6uBoXa06zj+WBg5LiMdLFR8aWNRgARJ4DfSidI=;
        b=jKisFX9n9iRpI8w/3shH9vYkSRa0Mn4zZNsbp+sZPNiYA1ox/ZNMtxmqnDTkPo4pAR
         DpeCjCvtWcbDh7p7Qa2Pp3k7bMit/1nXpOlstdh+DDkWhoMFCQCB9KiMc3bg5IqjD3vF
         TFqCzhGx0cw8twixuPyLpAqT3AlAsh8KGky91d4739p6ftBhpdOzTxb1qtWiMXWiH065
         61WmuMPUEaFjg75YkJxRAX3O1ZgEriy1tZ4Hzko1Ip7vqrU/sBeZkJsLrSXjixhGGjGk
         ne2gj5Sx4cYXJu7LJZSNClkcgrsKCcLDYwtoMq7JHzRgWEIzEBpoIyOH0/7Z968M0SEm
         XNbw==
X-Gm-Message-State: AFqh2ko0kMP+d1wPkMB4kWbCzVt1fgOWWo5boOvco0wjsa1hZAW53HiM
	3DhjDShqGOxYJn2LHq/1Jpi4vm6KP6ynnOCHz8k=
X-Google-Smtp-Source: AMrXdXuetufdJJeJC/X+XoCQxfcd8EltY+2hSGpOCciWaJv9pAZNP5cadqHRPbtuWDUUhvtwkyKs6ebexWS/akbSPeI=
X-Received: by 2002:a05:651c:124f:b0:27f:c535:5ec2 with SMTP id
 h15-20020a05651c124f00b0027fc5355ec2mr2707171ljh.204.1673546587258; Thu, 12
 Jan 2023 10:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org> <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 12 Jan 2023 19:02:30 +0100
Message-ID: <CA+icZUUgq-dnSTRbdynPA8bEWg6SsCE9GYBMF6iViVmo9DfaFA@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
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
Reply-To: sedat.dilek@gmail.com
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 4:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> are several warnings in the PowerPC vDSO:
>
>   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
>
>   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
>
> The first group of warnings point out that linker flags were being added
> to all invocations of $(CC), even though they will only be used during
> the final vDSO link. Move those flags to ldflags-y.
>
> The second group of warnings are compiler or assembler flags that will
> be unused during linking. Filter them out from KBUILD_CFLAGS so that
> they are not used during linking.
>
> Additionally, '-z noexecstack' was added directly to the ld_and_check
> rule in commit 1d53c0192b15 ("powerpc/vdso: link with -z noexecstack")
> but now that there is a common ldflags variable, it can be moved there.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 45c0cc5d34b6..4337b3aa9171 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
>  UBSAN_SANITIZE := n
>  KASAN_SANITIZE := n
>
> -ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> -ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> -
> -CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> +ccflags-y := -fno-common -fno-builtin
> +ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack
> +ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> +# Filter flags that clang will warn are unused for linking
> +ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> +
> +CC32FLAGS := -m32
> +LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
>  AS32FLAGS := -D__VDSO32__
>
> -CC64FLAGS := -Wl,-soname=linux-vdso64.so.1

Set CC64FLAGS := -m64 ?

> +LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
>  AS64FLAGS := -D__VDSO64__
>
>  targets += vdso32.lds
> @@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
>
>  # actual build commands
>  quiet_cmd_vdso32ld_and_check = VDSO32L $@
> -      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> +      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
>  quiet_cmd_vdso32as = VDSO32A $@
>        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
>  quiet_cmd_vdso32cc = VDSO32C $@
>        cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
>
>  quiet_cmd_vdso64ld_and_check = VDSO64L $@
> -      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> +      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)

If no CC64FLAGS := xxx is set, this can go?

-Sedat-

>  quiet_cmd_vdso64as = VDSO64A $@
>        cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
>
>
> --
> 2.39.0
>
