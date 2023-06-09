Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFAC72A34F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBQm4YnKz3fbp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 05:46:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RWQt0Zs3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RWQt0Zs3;
	dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBPt5wmsz3f0c
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:45:21 +1000 (AEST)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-786e637f06dso788707241.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686339917; x=1688931917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85bTuSWiyHjKxAhfdvtzqeLdAW05vfW46WEl40BOct8=;
        b=RWQt0Zs330gMzU/XJRpu/ZT2nqWWPXm5GPcG6EsmhmHTJmNk75jNKDQzjCERhlh8qA
         OcIvGcNJtMmYnvdPcdlt58oafnA99Q+q39av86k5lXaWdipxp0hEpf5FrqvCOFFEFpoV
         OmOb01HcpJNC4IQOk0roth6yNJMf/DfjAEMWL23P+X5UJhn9igkhkPqbtkN/4/B8Kbzk
         eKjafJdZBTbqFDjOWZisZhvsdc1K3MTNSqw/Xl6pa76yvlti6PATKNztrhk8OVLbF1Pv
         IPMjEthtRRed5XG8F5uxEzR1bLSU7T6IiNh9kmxn+Hjpop1e5CLb6uMsV1YgM2/ABcmu
         iNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339917; x=1688931917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85bTuSWiyHjKxAhfdvtzqeLdAW05vfW46WEl40BOct8=;
        b=aouKWsP+JKXyDf7XkOO6Ji1r3HwO/kltOO1V+j1GiiDdUwpJJNe198Fk1R96U7IMb0
         6OFqjWeMwasQ0StDWKsedGTPu9E098r/AwoLGBr00We+PIhPG15UHGoj578shJuKXzvz
         VxrSVWg1l92TbVORElgfAZp62ZQbtaIkRaSrTF/D9Jms1HWLeAisM16MSuH3l4thExgi
         IPWtBykJqR9gAs9gcXnLIQasEsBHNV3zz7dawgye9C8V/SMa62rOv7K6bp/8/kUN13R0
         lnPW5Zm/ciZUfVT7BoxfYVbhxK8On+ZFvSS8wuJTXaPFfJxu1t62VJELYpvw7LP3Dd+u
         dK9w==
X-Gm-Message-State: AC+VfDyxzrJx7y/xMbSgQEtAYdfs8Q1XrGwKry9DUeYSIgpcHYDSKtL4
	pvTgREVY4PICspGZMi6KhVlmugP5ZISOTsEQ0bsPBQ==
X-Google-Smtp-Source: ACHHUZ6AePrOZMaTcA9MZgMRFQSWi7dmRNPnXVxlhTXch5hfqZy3wLZHuNcjJElugjwkfVmddujmNwflG79f4KvUXns=
X-Received: by 2002:a67:b441:0:b0:43b:46b0:988d with SMTP id
 c1-20020a67b441000000b0043b46b0988dmr1877466vsm.29.1686339916691; Fri, 09 Jun
 2023 12:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230609034501.407971-1-naveen@kernel.org>
In-Reply-To: <20230609034501.407971-1-naveen@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Jun 2023 12:45:05 -0700
Message-ID: <CAKwvOd=ZbKCtfC+pb4h3yJuZ5TMTWgR0nJ65V4161zHEY3e9EA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/ftrace: Disable ftrace on ppc32 if using clang
To: Naveen N Rao <naveen@kernel.org>
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
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 8, 2023 at 8:47=E2=80=AFPM Naveen N Rao <naveen@kernel.org> wro=
te:
>
> Ftrace on ppc32 expects a three instruction sequence at the beginning of
> each function when specifying -pg:
>         mflr    r0
>         stw     r0,4(r1)
>         bl      _mcount
>
> This is the case with all supported versions of gcc. Clang however emits
> a branch to _mcount after the function prologue, similar to the pre
> -mprofile-kernel ABI on ppc64. This is not supported.
>
> Disable ftrace on ppc32 if using clang for now. This can be re-enabled
> later if clang picks up support for -fpatchable-function-entry on ppc32.
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>

Thanks for the patch! I've filed the below bug, a link to whom I'd
like to see retained in the commit message. In the future, please file
bugs against the compiler vendors first, then include the relevant
link.

Link: https://github.com/llvm/llvm-project/issues/63220
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index bff5820b7cda14..d85e3cf4016d90 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -236,7 +236,7 @@ config PPC
>         select HAVE_FUNCTION_DESCRIPTORS        if PPC64_ELF_ABI_V1
>         select HAVE_FUNCTION_ERROR_INJECTION
>         select HAVE_FUNCTION_GRAPH_TRACER
> -       select HAVE_FUNCTION_TRACER
> +       select HAVE_FUNCTION_TRACER             if PPC64 || (PPC32 && CC_=
IS_GCC)
>         select HAVE_GCC_PLUGINS                 if GCC_VERSION >=3D 50200=
   # plugin support on gcc <=3D 5.1 is buggy on PPC
>         select HAVE_GENERIC_VDSO
>         select HAVE_HARDLOCKUP_DETECTOR_ARCH    if PPC_BOOK3S_64 && SMP
>
> base-commit: bd517a8442b6c6646a136421cd4c1b95bf4ce32b
> --
> 2.40.1
>


--=20
Thanks,
~Nick Desaulniers
