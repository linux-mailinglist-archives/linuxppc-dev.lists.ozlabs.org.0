Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699B58FC69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 14:36:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3R9q0dfFz3c8q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 22:35:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ql5Tzwac;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=anders.roxell@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ql5Tzwac;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3R9860MTz2y2G
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 22:35:22 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso4970066pjl.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=5w/KsvKeDQNB0nymQYwJO1nJhxYwskiJAdbQrcwrrws=;
        b=Ql5TzwacX39R2Jd3F8nwCUw2umD0dCX30wm+NAMytxnOiFhjI29r2fh4KHIe8FbJA5
         sYz4E0PDwIJi2YWeIZGBi2iV+Kzj0DYdKG+N+MawTLJhdefhUsUcV0ClrlBQcf1+CfbC
         BhOcyvxJBYHt9jAR2olKMbE/rOdvH8kuymWFoAFCIdQ3O3rDei5TMFoybUL9zX6OoiC6
         zSf7+O9WlFtOrgZpMoO4efq2+dLIYo4s6604mDZQ2A9zMsGb4t2OqoPcdUh7yyzAL4B5
         4m2ConxAm3a5QZ2B5OUxbrnEPhFZedReRM5K3lF3hX3flUt9J1LLpTzaRYKOp4znfWwG
         qROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5w/KsvKeDQNB0nymQYwJO1nJhxYwskiJAdbQrcwrrws=;
        b=opAnnJA0c65/gM1xCKvE/cCg48g5zQpiuaG3rciJREBCLxEo/dr0MfHOxU+KmnEnIP
         PUbOIVgoNUMvmW2wA5XKI3UojWjH40/egtKj1OAeItlcpIS0QxagHqKhr5R+Va2EtczL
         mgRI2atTvIukIhQJbgJZGd4h+hsx2cEo5IDg3LoLg3e6HVnEAonH0SMcUgidAzL6qREE
         QN0KWqbk1kU3FH0aVov5M3H8aDDWUvhmvZoLmG3p+jqTNkYyO3wbHo7sxEq1+Q079zct
         4063trYV/f1w8kCV0rS87XiacYnLBBJkxyThoZ4C2MciHMAdte68EDneiqWlJvgVstqm
         cmCw==
X-Gm-Message-State: ACgBeo3OT3zdBCd8uluTDw5GdMzlATctgQYmBO3wi2u8uOewLSV9zxjX
	j/j6Trx4+fsw5G5M6V6EyW8Nl2M87pMKaHxheowXZA==
X-Google-Smtp-Source: AA6agR7mxh4xlrHaACk8ACRbYeCnushTJX/xovc1OX340+zRR7qqgn2gIIKem8n7+e/FLEibg6QqXPbdXVxgjeL2ts4=
X-Received: by 2002:a17:90b:3805:b0:1f4:ebfe:558b with SMTP id
 mq5-20020a17090b380500b001f4ebfe558bmr8709936pjb.48.1660221318988; Thu, 11
 Aug 2022 05:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220810114318.3220630-1-anders.roxell@linaro.org> <87fsi3ce28.fsf@mpe.ellerman.id.au>
In-Reply-To: <87fsi3ce28.fsf@mpe.ellerman.id.au>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 11 Aug 2022 14:35:08 +0200
Message-ID: <CADYN=9L_Sgd8HTkhtM5t0eoN7ict8zX6fRCJsVvYcgp9H_QsSg@mail.gmail.com>
Subject: Re: [PATCHv3, resend] powerpc: mm: radix_tlb: rearrange the if-else block
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org, nathan@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Aug 2022 at 11:41, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Anders Roxell <anders.roxell@linaro.org> writes:
> > Clang warns:
> >
> > arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
> >                                 __tlbiel_va_range(hstart, hend, pid,
> >                                                   ^~~~~~
> > arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
> >                 unsigned long hstart, hend;
> >                                     ^
> >                                      = 0
> > arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
> >                                 __tlbiel_va_range(hstart, hend, pid,
> >                                                           ^~~~
> > arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
> >                 unsigned long hstart, hend;
> >                                           ^
> >                                            = 0
> > 2 errors generated.
>
> Which version & config are you building?

clang-13, clang-14 and clang-nightly, configs are cell_defconfig and
maple_defconfig

I'm building with tuxmake [1] like this:
$ tuxmake --runtime podman --target-arch powerpc --toolchain clang-14
--kconfig cell_defconfig

Cheers,
Anders
[1] https://tuxmake.org/
