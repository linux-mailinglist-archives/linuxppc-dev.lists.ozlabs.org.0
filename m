Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B224342E0F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 20:16:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVczD2nDtz2ypf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 05:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bb3x+Vj+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=bb3x+Vj+; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVcyX3wqZz2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 05:15:30 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id u18so29852716lfd.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nNs+G0jVD2dj+3QPCBepQC7w71O0qpj+2enPjKIhfHo=;
 b=bb3x+Vj+uVIsxGXCp/tCicQgGOOTKP0OfRO57tDFOuoQtwrTfQsKCmS4Dn98dBUHnL
 IsDY1cOB29uxQCGfA3SzIQojrPsGf2lvtFN2djaHlxgWSV1BPUlifpG4WoPVDJPfIvnH
 2Sj/poRRd3zSkPly80whiTnHAWTBZGXnYuum9q4ZGl2kUj9N0hILg0xGyJOA5o0CQB7r
 fKiJkRDoPsOnwJG2HT1vvNAK0pwDnQj3E54mNCNmEPRKnnzjxD/OB9ZeXoSfxYAhi0ec
 vrhhQvq2n5KrZ3bNBNm4/w8HFP1m7PKB2UuGM9excovNE1ufpulANm00q110V3jOH43K
 j1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nNs+G0jVD2dj+3QPCBepQC7w71O0qpj+2enPjKIhfHo=;
 b=dovliePTCvlBmH36vySaCDoo1lh9RMm8oho8tcI3BYwhHnH7fh0ufPFf7jxWD6ekcc
 YcporEIKNdorPhQTNwrhWK1mE+BzmO4ZSUcgFjSt/dsrjqcX7n5rUBrzNvgODu4Xux3Y
 3UCLhF1XZhyAd6LYxolZRt09GvA7WjObNNblezzHq2IkqJ3EM9PJFYn6/NgBgwdg/TL4
 XFQiaHTsQvMThALwPt7+HSX5gL4Xlal/JVkElGykk+dmTnRkf92udU9JNiyFfmg0JSFA
 PRvjLo/UB2r+eB00bAC3raHtvODrshx8JbH9KaAfUi+UjDWf95CMs8rIu1xsx8pPcL36
 ps/Q==
X-Gm-Message-State: AOAM5338vU+4waa4Ei5KLutA1b0EdpHSaINKT3O/JLbkm+r7M+GSz1yQ
 3t9k4QdPrYD3rvxatTgdYYwJzHultpXN/LWwndeFAbNqH72Wmw==
X-Google-Smtp-Source: ABdhPJzw201p0Me8UoPJUf744ySbtQZUgFia2EVV686wg86DCCgGVrC7sAVDFcRLxkbXWJScchfCQIH9656aZEsjSLY=
X-Received: by 2002:a2e:8695:: with SMTP id l21mr7244959lji.339.1634235321228; 
 Thu, 14 Oct 2021 11:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211014024424.528848-1-mpe@ellerman.id.au>
In-Reply-To: <20211014024424.528848-1-mpe@ellerman.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Oct 2021 11:15:09 -0700
Message-ID: <CAKwvOdkcWCFEWxjwPcABA=6qWas+wuVcdDS=T1Oh-j81fYxxFg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/dcr: Use cmplwi instead of 3-argument cmpli
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 7:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> In dcr-low.S we use cmpli with three arguments, instead of four
> arguments as defined in the ISA:
>
>         cmpli   cr0,r3,1024
>
> This appears to be a PPC440-ism, looking at the "PPC440x5 CPU Core
> User=E2=80=99s Manual" it shows cmpli having no L field, but implied to b=
e 0 due
> to the core being 32-bit. It mentions that the ISA defines four
> arguments and recommends using cmplwi.
>
> dcr-low.S is only built 32-bit, because it is only built when
> DCR_NATIVE=3Dy, which is only selected by 40x and 44x. Looking at the
> generated code (with gcc/gas) we see cmplwi as expected.
>
> Although gas is happy with the 3-argument version when building for
> 32-bit, the LLVM assembler is not and errors out with:
>
>   arch/powerpc/sysdev/dcr-low.S:27:10: error: invalid operand for instruc=
tion
>    cmpli 0,%r3,1024; ...
>            ^
>
> Switching to the four argument version avoids any confusion when reading
> the ISA, fixes the issue with the LLVM assembler, and also means the
> code could be built 64-bit in future (though that's very unlikely).

Thank you Michael.  We've definitely run into a few cases where GAS
allowed for various short-hand forms of various instructions (a fair
amount of recent work was around 32b ARM and THUMB parity in LLVM).
LLVM's assembler is mostly generated from a high level description of
the instruction formats, so it's not always as flexible as a hand
written parser would be. (There is a mix of hand written arch specific
parsing, but most of the parser is arch agnostic, and all of the
instruction descriptions are described in an LLVM specific high level
language called tablegen which generates C++ that is used by the
assembler, but also the disassembler, the compiler, and even the
linker if need be).

Link: https://github.com/ClangBuiltLinux/linux/issues/1419
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/sysdev/dcr-low.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/sysdev/dcr-low.S b/arch/powerpc/sysdev/dcr-low.=
S
> index efeeb1b885a1..329b9c4ae542 100644
> --- a/arch/powerpc/sysdev/dcr-low.S
> +++ b/arch/powerpc/sysdev/dcr-low.S
> @@ -11,7 +11,7 @@
>  #include <asm/export.h>
>
>  #define DCR_ACCESS_PROLOG(table) \
> -       cmpli   cr0,r3,1024;     \
> +       cmplwi  cr0,r3,1024;     \
>         rlwinm  r3,r3,4,18,27;   \
>         lis     r5,table@h;      \
>         ori     r5,r5,table@l;   \
> --
> 2.25.1
>


--=20
Thanks,
~Nick Desaulniers
