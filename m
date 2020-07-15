Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C802202ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 05:28:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B62ss0mQRzDqcG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 13:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ZEbB4gSy; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B62qw35BHzDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 13:27:03 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id p205so726217iod.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/6qvp5WHZj/oa9tsQs7daglYAIrSHRjqnbn4LJYVqYM=;
 b=ZEbB4gSyyVHw+IqRwjZPPSBGmJ1kW6qrI3GlqPzdjDUvIsbGFKVZ+/nKoDRVsb50DA
 xwru94gf4SU4rS8VnQlP4S8oo+/KGKnprsAgKDgnODbTRc1yV0SBjDlAL6hamUrpX7dg
 nEx9aWnWfqbkS4I82KGBsr1NbL5lrFwJwGnhQ+E1yC0BlfiSgYTF1a7DenrZ8qr2mPuh
 R4BQKmo4xnSbLNVEXs4GdOGxxkS6o2Xs7mjqBXcPRR2LMkuZUcCB9lzKL+kNAFm+L/1l
 cFRBkY5q26k0Lf4O5yj8NY0qaU/9G/8KOfklwi2xPEUDGOsg7HalAHkigm9R86E4PF1F
 GAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/6qvp5WHZj/oa9tsQs7daglYAIrSHRjqnbn4LJYVqYM=;
 b=UZRhrvaH69sTnguiHx662eDZu0BYJiL6pEiae659y0icFjxh3K+OKz65tjcgMfX8m5
 oP9r8A1qz6RutTR1Z8dSY7DRI9HUGSgVyrNuNFOz7Hq7d9979gOz9vKdx4lSP7LBtDBQ
 Y/+2NN1VGN2SNdb65dua5MU7XjEN1teR4BcfYJUHe7G3LzOJfSAHClgXcyjRMo8/Uol6
 v5m2ExrslqJAq/Y+mzU1+8NZV6C+vYhNwMLzKU7BfaL2A9DagG3fmFbTGAxVmyl9ayyo
 q7hYDaJzD3aBTu8l2JnD5EcVbrIs9E+ZTJk+F1DrtYs/TB80fMrX8rUzMktrznKbcE6E
 XFcQ==
X-Gm-Message-State: AOAM530JRr5XViecLbFX2lsRuqdiTp0sjqfmga9dskc4jGjY6jdfmlKj
 fokIQEUKy/ng342rTcYtpDSIEGofpfcrjrm8hLefVQ==
X-Google-Smtp-Source: ABdhPJzxESu7ZTsM8aFjcJhDG3lJKuIu8Kw/lLhq4wzNp1GQnFoGez4u1gAOdT+YRS9L0Tnnx500tXibztageq3WwBw=
X-Received: by 2002:a6b:c80a:: with SMTP id y10mr8120079iof.67.1594783621833; 
 Tue, 14 Jul 2020 20:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200714145049.2496163-1-lee.jones@linaro.org>
 <20200714145049.2496163-6-lee.jones@linaro.org>
In-Reply-To: <20200714145049.2496163-6-lee.jones@linaro.org>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 14 Jul 2020 20:26:50 -0700
Message-ID: <CAOesGMjCZMyWLe+tpNFstC88odeSCKS8bM6Oj9cpaj6j7U94rQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] cpufreq/arch: powerpc: pasemi: Move prototypes to
 shared header
To: Lee Jones <lee.jones@linaro.org>
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
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, viresh kumar <viresh.kumar@linaro.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 7:50 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> If function callers and providers do not share the same prototypes the
> compiler complains of missing prototypes.  Fix this by moving the
> already existing prototypes out to a mutually convenient location.
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/cpufreq/pasemi-cpufreq.c:109:5: warning: no previous prototype f=
or =E2=80=98check_astate=E2=80=99 [-Wmissing-prototypes]
>  109 | int check_astate(void)
>  | ^~~~~~~~~~~~
>  drivers/cpufreq/pasemi-cpufreq.c:114:6: warning: no previous prototype f=
or =E2=80=98restore_astate=E2=80=99 [-Wmissing-prototypes]
>  114 | void restore_astate(int cpu)
>  | ^~~~~~~~~~~~~~
>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  arch/powerpc/platforms/pasemi/pasemi.h    | 15 ------------
>  arch/powerpc/platforms/pasemi/powersave.S |  2 ++
>  drivers/cpufreq/pasemi-cpufreq.c          |  1 +
>  include/linux/platform_data/pasemi.h      | 28 +++++++++++++++++++++++
>  4 files changed, 31 insertions(+), 15 deletions(-)
>  create mode 100644 include/linux/platform_data/pasemi.h
>
> diff --git a/arch/powerpc/platforms/pasemi/pasemi.h b/arch/powerpc/platfo=
rms/pasemi/pasemi.h
> index 70b56048ed1be..528d81ef748ad 100644
> --- a/arch/powerpc/platforms/pasemi/pasemi.h
> +++ b/arch/powerpc/platforms/pasemi/pasemi.h
> @@ -15,21 +15,6 @@ extern void __init pasemi_map_registers(void);
>  extern void idle_spin(void);
>  extern void idle_doze(void);
>
> -/* Restore astate to last set */
> -#ifdef CONFIG_PPC_PASEMI_CPUFREQ
> -extern int check_astate(void);
> -extern void restore_astate(int cpu);
> -#else
> -static inline int check_astate(void)
> -{
> -       /* Always return >0 so we never power save */
> -       return 1;
> -}
> -static inline void restore_astate(int cpu)
> -{
> -}
> -#endif
> -
>  extern struct pci_controller_ops pasemi_pci_controller_ops;
>
>  #endif /* _PASEMI_PASEMI_H */
> diff --git a/arch/powerpc/platforms/pasemi/powersave.S b/arch/powerpc/pla=
tforms/pasemi/powersave.S
> index d0215d5329ca7..7747b48963286 100644
> --- a/arch/powerpc/platforms/pasemi/powersave.S
> +++ b/arch/powerpc/platforms/pasemi/powersave.S
> @@ -5,6 +5,8 @@
>   * Maintained by: Olof Johansson <olof@lixom.net>
>   */
>
> +#include <linux/platform_data/pasemi.h>
> +
>  #include <asm/processor.h>
>  #include <asm/page.h>
>  #include <asm/ppc_asm.h>
> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cp=
ufreq.c
> index c66f566a854cb..c6bb3ecc90ef3 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -15,6 +15,7 @@
>  #include <linux/timer.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/platform_data/pasemi.h>
>
>  #include <asm/hw_irq.h>
>  #include <asm/io.h>
> diff --git a/include/linux/platform_data/pasemi.h b/include/linux/platfor=
m_data/pasemi.h
> new file mode 100644
> index 0000000000000..3fed0687fcc9a
> --- /dev/null
> +++ b/include/linux/platform_data/pasemi.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 Linaro Ltd.
> + *
> + * Author: Lee Jones <lee.jones@linaro.org>
> + */

Absolutely not. It's neither your copyright, nor your authorship.


-Olof
