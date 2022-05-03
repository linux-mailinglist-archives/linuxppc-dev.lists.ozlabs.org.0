Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D975A51900B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 23:24:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtCfD43Nkz3brQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 07:24:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KbRmuMDV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=KbRmuMDV; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtCdb4hTjz2xsN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 07:24:19 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id h29so25163211lfj.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 May 2022 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Owa61EB2fhSVa4P0/sBU1LyujwJ7QeNwAdTAvmWFj4g=;
 b=KbRmuMDVGYkdtKRW6O6Js0kP1T6ts1/z4yZgk4/gx3IQLRLgYYYqY1ebCgFeqrDXWw
 5s4K6LVhOclFmgiJn1M+aALKGBQa0aT0UfepywK/+p/WJLQdoZUdHLDCXe+UM9xvtcRp
 tcXph3RK4emRk+tA9fxu3FhQ4r9k9Fsda45Co8rwWCmj63w+TXhh2Ln/bBR1aiV3QpDR
 VPOe4VqPkeBKgzmVUzuwxlQUzAsIUjhmI1ToP7QhRVN9wg/cZtvfwj7afk26fhwvrfNr
 StVQJ7iRpKCbb1OQF1cXiE8kZP3gzS59Iu2BABQjs5bBvZgEJOYhdMqWYnEzuIz6bx+t
 WoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Owa61EB2fhSVa4P0/sBU1LyujwJ7QeNwAdTAvmWFj4g=;
 b=s48E4eDk8ZapFwP63tC+Gy38cIlyzMo/f+YI7JYIYzmyDN8ItdxEfh2W7wX1H+2Zf3
 OwQ2tYaHuPHbApSzOW+zGVz12MP7oeLps/FL52CSVhQgmr7t6dF2k5g9ioPKHlzT65nw
 NPdnLLycl0B60J64d9spwm8nhSECIxb+yVdid7idMoxXlRkgfAq145LAa+kbzWMygaGb
 0RJyFNHU8iQA5Ornd3mkST6I+6q5esPqx6hY8Xcicq0AmHdug2CNQdAVyLlDFt+SMLyR
 Dl7/DSvmG42Mr5VdjplWGtuAOO8EtlWFTXu2Qcjh2RMYwJrGsPp/z2SymocP6jewTGSx
 rWSg==
X-Gm-Message-State: AOAM532kWUQe17Dz7C81rjsOU5+EcERVUsW73Tz9Mchv9H0lHR6CrKq6
 frOE6D7Li+IP3+PX3H2lNGqKPPsBlg4B/kzJht9lwQ==
X-Google-Smtp-Source: ABdhPJxK5xkmBW9FyKBBl9LgAfAWaYIMBkGoWtYpc/dkYfo2hiduTQK6tFfXSZGKHsWGl/ewFZl0zXp+g5M24VmA7qo=
X-Received: by 2002:ac2:4188:0:b0:471:96f4:c1d4 with SMTP id
 z8-20020ac24188000000b0047196f4c1d4mr12374295lfh.626.1651613054879; Tue, 03
 May 2022 14:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220429064547.2334280-1-aik@ozlabs.ru>
In-Reply-To: <20220429064547.2334280-1-aik@ozlabs.ru>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 3 May 2022 14:24:03 -0700
Message-ID: <CAKwvOdmFhua9b4=DS4QYJmKg=0kT3CtEjXgfo8fnifU2t-ttPQ@mail.gmail.com>
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: llvm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b66dd6f775a4..5b783bd51260 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -476,9 +476,11 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>                 .if IHSRR_IF_HVMODE
>                 BEGIN_FTR_SECTION
>                 bne     masked_Hinterrupt
> +               b       4f
>                 FTR_SECTION_ELSE

Do you need to have the ELSE even if there's nothing in it; should it
have a nop?  The rest of the assembler changes LGTM, but withholding
RB tag until we have Kconfig dependencies in better shape.

> -               bne     masked_interrupt
>                 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
> +               bne     masked_interrupt
> +4:
>                 .elseif IHSRR
>                 bne     masked_Hinterrupt
>                 .else

-- 
Thanks,
~Nick Desaulniers
