Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF93618F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 06:35:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM3Kc3xk5z3c0l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 14:35:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SeofBIy3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=tony.ambardar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SeofBIy3; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM3K70C1Dz30Dl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:34:48 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id k25so26492542iob.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 21:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wj0LmQcX4T3RD/LCUSwlZuN9U0k4EZ8z0GPjE5eqJ+c=;
 b=SeofBIy31lvaGo4ip2O0oyx2LsxzePZb/9lOB5C9/D+k6qqrK4+LfDdJT4Mtoj5Rw9
 QPXKrV/lFBRuv/SJ5LnbvZBDIK6pm+jc6J4mvF8ccSsB6avWE0IHq6EbS2DvYJZXC/jm
 i0ta7IKIkkgq/MX5hpCxGaA7mixRoz0T2cZ8dMDtx5RrFgFSteRq5nns1W2HlOoVv2fG
 LB/cwCQ6SO0DLfWqoHzZbzqBqZwM5zF+snorjJSGY8KpJBvNQ+cni0oeEJRFHot9ovle
 tlVN1aCCYLMa49lJ3RxGzhSTGdpbFQmRearzZmcvCGKONJuOWN4MllJizUsi3PIGCLax
 i39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wj0LmQcX4T3RD/LCUSwlZuN9U0k4EZ8z0GPjE5eqJ+c=;
 b=fyoOr/fWLZ3QJXBzuuPdy4IMFgTIJasJr0T6U4c/hQrr+Rp8IjOLaWAYyL30i3bzwf
 5nTW1dX3piRlwUKsaW79zd2r9MeHwcnN11Uq8ATaC2YnUePPq/y+uTQzOdPaOvZJmMLT
 2psB4Vckabkad56U18y8/Ow6/Y9R79g38zkaLfqueSdo6E56q5zPBRi2oqO7U/eN+p9l
 zMvxFr4L2T7VQ/0i9MLx1GgRiWKvnqpezxs5pdounX8Bpc+vyWYYcBXKKKTzzCrkiL3p
 KOJm86OlhLHcRF3cPGaLEQDlX0deM5hbq6NCBbhibGPo6T50Q9Ie928VaSXiyPzzRggf
 P0zg==
X-Gm-Message-State: AOAM530bpQNcGC3KAdSMvgYp0IaAIEhQfcii6GrtnkpMFivHMrtOvjT5
 WH9T7KWl0m8Py44SKG0un0QHHOQDTMoNEGhfJkk=
X-Google-Smtp-Source: ABdhPJytOPUOKUWf/eTtPMePF5L6DxvqY6VglSQ6/SSxDKWH2L5q4cw/KTLhsa10kl+UaBOEIqA4+If5fE/i8rTFXOI=
X-Received: by 2002:a5d:8ad2:: with SMTP id e18mr2068967iot.51.1618547685088; 
 Thu, 15 Apr 2021 21:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200917000757.1232850-1-Tony.Ambardar@gmail.com>
 <20200917135437.1238787-1-Tony.Ambardar@gmail.com>
In-Reply-To: <20200917135437.1238787-1-Tony.Ambardar@gmail.com>
From: Tony Ambardar <tony.ambardar@gmail.com>
Date: Thu, 15 Apr 2021 21:34:36 -0700
Message-ID: <CAPGftE-Q+Q479j7SikDBQLiM+VKbpXpRYnTeEJeAHeZrh_Ok2A@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc: fix EDEADLOCK redefinition error in
 uapi/asm/errno.h
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 LKML <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Rosen Penev <rosenp@gmail.com>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

The latest version of this patch addressed all feedback I'm aware of
when submitted last September, and I've seen no further comments from
reviewers since then.

Could you please let me know where this stands and if anything further
is needed?

Kind regards,
Tony

On Thu, 17 Sept 2020 at 06:54, Tony Ambardar <tony.ambardar@gmail.com> wrote:
>
> A few archs like powerpc have different errno.h values for macros
> EDEADLOCK and EDEADLK. In code including both libc and linux versions of
> errno.h, this can result in multiple definitions of EDEADLOCK in the
> include chain. Definitions to the same value (e.g. seen with mips) do
> not raise warnings, but on powerpc there are redefinitions changing the
> value, which raise warnings and errors (if using "-Werror").
>
> Guard against these redefinitions to avoid build errors like the following,
> first seen cross-compiling libbpf v5.8.9 for powerpc using GCC 8.4.0 with
> musl 1.1.24:
>
>   In file included from ../../arch/powerpc/include/uapi/asm/errno.h:5,
>                    from ../../include/linux/err.h:8,
>                    from libbpf.c:29:
>   ../../include/uapi/asm-generic/errno.h:40: error: "EDEADLOCK" redefined [-Werror]
>    #define EDEADLOCK EDEADLK
>
>   In file included from toolchain-powerpc_8540_gcc-8.4.0_musl/include/errno.h:10,
>                    from libbpf.c:26:
>   toolchain-powerpc_8540_gcc-8.4.0_musl/include/bits/errno.h:58: note: this is the location of the previous definition
>    #define EDEADLOCK       58
>
>   cc1: all warnings being treated as errors
>
> CC: Stable <stable@vger.kernel.org>
> Reported-by: Rosen Penev <rosenp@gmail.com>
> Signed-off-by: Tony Ambardar <Tony.Ambardar@gmail.com>
> ---
> v1 -> v2:
>  * clean up commit description formatting
>
> v2 -> v3: (per Michael Ellerman)
>  * drop indeterminate 'Fixes' tags, request stable backports instead
> ---
>  arch/powerpc/include/uapi/asm/errno.h       | 1 +
>  tools/arch/powerpc/include/uapi/asm/errno.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/include/uapi/asm/errno.h b/arch/powerpc/include/uapi/asm/errno.h
> index cc79856896a1..4ba87de32be0 100644
> --- a/arch/powerpc/include/uapi/asm/errno.h
> +++ b/arch/powerpc/include/uapi/asm/errno.h
> @@ -2,6 +2,7 @@
>  #ifndef _ASM_POWERPC_ERRNO_H
>  #define _ASM_POWERPC_ERRNO_H
>
> +#undef EDEADLOCK
>  #include <asm-generic/errno.h>
>
>  #undef EDEADLOCK
> diff --git a/tools/arch/powerpc/include/uapi/asm/errno.h b/tools/arch/powerpc/include/uapi/asm/errno.h
> index cc79856896a1..4ba87de32be0 100644
> --- a/tools/arch/powerpc/include/uapi/asm/errno.h
> +++ b/tools/arch/powerpc/include/uapi/asm/errno.h
> @@ -2,6 +2,7 @@
>  #ifndef _ASM_POWERPC_ERRNO_H
>  #define _ASM_POWERPC_ERRNO_H
>
> +#undef EDEADLOCK
>  #include <asm-generic/errno.h>
>
>  #undef EDEADLOCK
> --
> 2.25.1
>
