Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C8966339D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:59:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrSXV6kw9z3cMR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:59:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SXyWMObF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SXyWMObF;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrSWX12crz2yxB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 08:58:47 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id q9so6870227pgq.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 13:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8mtKWc4WmtGm6NDppB1FPmywRJwZewn7Wl9vLbuK9vw=;
        b=SXyWMObFZXeTNyQecHi104uVS3C5VVNdbITrtvMou5aDqzX/U4NRz7uvEIsM8Onyco
         x8qqLrvh0HSwV3fczYkK93qVBE1SWVIm5mK9HzYglylMhUJMaXqn7bL6FtcjEoZEo/fo
         OcjstuljDhRYrS830xjpdSB77YwrYtXuM+PYffd8oCYXe+qhIHx87mShQzdUWimUiypY
         QNKHUicr800mVPn0COXPqDU4vjZAVpA83JY6L6WaC9XuTG0bw7sSTuItcNytIXboiUkK
         JB8evh3Cgq1lCllojmImBjDJpZSraooL+3WVJsi+rOxRCXx/O5eGPvvgudRNalID0dyL
         rXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mtKWc4WmtGm6NDppB1FPmywRJwZewn7Wl9vLbuK9vw=;
        b=TWAU7ndt+DUTWdEOQ354hhsgkXpY8DxCQhvadfWML6xMmssG4raYjj7BFQULnb/2Li
         6Nx1Y1P6AASa3cwzb20QBMHbYH5UmBOOeMB5iYk/iP31qtLmaerIMKCpBSbXRc+n7054
         ogSiY3gbDJdtrsSc00/ncNjPa9ebeOiUsbRHCuQ/dOIRjqlJpHi3b75P6yWUV48BAOc/
         9g3axeXZM0+O01SfwoM6ilfULnbQZJg0p4pWI1Aqyc81f7F21u9KoHx1oM1zDLcmaOdw
         stAL6FcNniR/iJMFajXGCFohw0dp91xDOsOviV96MevFEnla6IuVdsDOuYJ4uIsLy1Kt
         R80Q==
X-Gm-Message-State: AFqh2kooerVOwrVhVcq6x0XkROLneM/3YZkKZPd0PQO5kL1yXGNH4e0C
	S7NFdaEOBPPSWxjezoKpl7qzE307PPMVA1T2ri1fuw==
X-Google-Smtp-Source: AMrXdXsTlZoISLITCF02n+J4dXMcvFqFszZPB4liS+mZyZpp5BBYwkngdTAnTeTZgwlDRJLb/yCfd+smm6q/Dgm9C1w=
X-Received: by 2002:a63:4943:0:b0:478:e6cf:c24c with SMTP id
 y3-20020a634943000000b00478e6cfc24cmr5128347pgk.365.1673301523884; Mon, 09
 Jan 2023 13:58:43 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 13:58:32 -0800
Message-ID: <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns that ASFLAGS contains '-s', which is a linking phase option, so it
> is unused.
>
>   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
>
> Looking at the GAS sources, '-s' is only useful when targeting Solaris
> and it is ignored for the powerpc target so just drop the flag
> altogether, as it is not needed.

Do you have any more info where you found this?  I don't see -s
documented as an assembler flag.
https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
https://sourceware.org/binutils/docs/as/Invoking.html

The patch seems fine to me, but what was this ever supposed to be?
FWICT it predates git history (looking at
arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 6a977b0d8ffc..45c0cc5d34b6 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -51,10 +51,10 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
>  ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
>
>  CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> -AS32FLAGS := -D__VDSO32__ -s
> +AS32FLAGS := -D__VDSO32__
>
>  CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> -AS64FLAGS := -D__VDSO64__ -s
> +AS64FLAGS := -D__VDSO64__
>
>  targets += vdso32.lds
>  CPPFLAGS_vdso32.lds += -P -C -Upowerpc
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
