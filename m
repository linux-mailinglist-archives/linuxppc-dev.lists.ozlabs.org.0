Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC243AD6EB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 05:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6LGy6c8wz3c1W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 13:04:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cGqxZITi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=aoo4=ln=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cGqxZITi; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6LGV3RWnz2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:03:46 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G6LGS3Ccdz9sWk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:03:44 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G6LGS2nFDz9sWM; Sat, 19 Jun 2021 13:03:44 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cGqxZITi; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G6LGS1V5Yz9sRf;
 Sat, 19 Jun 2021 13:03:42 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so1928167pjb.0; 
 Fri, 18 Jun 2021 20:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=qd5Se1wUdT2cUDPGsyOoAhLuXTJMOFXzE2ZorbnEGf4=;
 b=cGqxZITiN0AnVcYGc3cXVbI1mx+kmRmqrpv1a9l9KvxOMl7tjXYe1VtJzUKjBcg+g7
 wi6Kvk3XuzD2Q6cc1KrfrYvJjVa7gf2L1/W/qO7+PgPP7gb0rcTjCHyjdxBcCnQLN330
 VPA1l98r6MlQAYXIVl/BBX4bLMM23L9q8+oonY/LYLAqAP3W3Bh/bOEyji41EBxsYucN
 RrT7KRR3O2mDdgZTHcHQDMJN7LzlMi6q57MR+T62ZjPwvmd2eROxlR7dzgbbARLge6U7
 BsWkrg/tVTmxpTt3dBDa0C7Bwv7U3Q8mj8bqjriEBkMn70VWIu5ZTmnhMZfaqF7uoY7w
 Pxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=qd5Se1wUdT2cUDPGsyOoAhLuXTJMOFXzE2ZorbnEGf4=;
 b=psbPIIC926gQk6CxKlJql5usgEvAuRurlmrXP3I2VYoLImOe884LfspR2iACnTF6vo
 DUKI2n7DQyWeMgBn7eQW0VNFPzRUoKltypQlBhMVDg+q/3KFMANTqooPc+f8Uq8HX1rd
 /+B8yKa9kolPcon5xB9J9kVIbWXkVPY35z8VML41IFJtAc+daNIvoiE7pBIcO1a2VSRL
 X0nf0d40CH9nusN8+nSsvXeKvyoPOLtpTlJ77CppJDUslgr+Lt9EN73wlQ9u+wT8U1No
 C9koGWyEpR1ar43eUM2HjTL3z/ZERPz8TyCblQUxzTnm1W/nhhicWKl7LwdInzDNbj7P
 3Mmg==
X-Gm-Message-State: AOAM530NSDRWoEyXqivPEaIL1zmqL2+BrmhF8EgmS1obMfvac230TIly
 jrPjTBJFX/wciGv0dXLYZ7UwIyJ1JWY=
X-Google-Smtp-Source: ABdhPJwomcl0xVkvX5Fm2jJdJWWZxEpwRtQ+8bm3ZPqdB+3ty9XL+MEF96t5EHXFadjTrGbtZ8Av2Q==
X-Received: by 2002:a17:902:b48b:b029:118:b709:9f50 with SMTP id
 y11-20020a170902b48bb0290118b7099f50mr7748073plr.74.1624071818769; 
 Fri, 18 Jun 2021 20:03:38 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id x2sm9336806pfp.155.2021.06.18.20.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:03:38 -0700 (PDT)
Date: Sat, 19 Jun 2021 13:03:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/9] powerpc: Add Microwatt platform
To: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwWbZVREsVug9R0@thinks.paulus.ozlabs.org>
In-Reply-To: <YMwWbZVREsVug9R0@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1624071540.0w83jhkdb0.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 18, 2021 1:43 pm:
> Microwatt is a FPGA-based implementation of the Power ISA.  It
> currently only implements little-endian 64-bit mode, and does
> not (yet) support SMP, VMX, VSX or transactional memory.  It has an
> optional FPU, and an optional MMU (required for running Linux,
> obviously) which implements a configurable radix tree but not
> hypervisor mode or nested radix translation.
>=20
> This adds a new machine type to support FPGA-based SoCs with a
> Microwatt core.  CONFIG_MATH_EMULATION can be selected for Microwatt
> SOCs which don't have the FPU.

The only thing I can think of is you may want to select PPC_RADIX and=20
other possible things that are required, but that's not a big deal at=20
the moment. I have a few kernel size reduction config patches (like=20
CONFIG_PPC_HASH) I might be able to upstream now for Microwatt, so I
could do a bit of a pass over the Kconfig stuff at that point.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/Kconfig                      |  2 +-
>  arch/powerpc/platforms/Kconfig            |  1 +
>  arch/powerpc/platforms/Makefile           |  1 +
>  arch/powerpc/platforms/microwatt/Kconfig  |  9 +++++++++
>  arch/powerpc/platforms/microwatt/Makefile |  1 +
>  arch/powerpc/platforms/microwatt/setup.c  | 23 +++++++++++++++++++++++
>  6 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/platforms/microwatt/Kconfig
>  create mode 100644 arch/powerpc/platforms/microwatt/Makefile
>  create mode 100644 arch/powerpc/platforms/microwatt/setup.c
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 386ae12d8523..5ce51c38a346 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -422,7 +422,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
> =20
>  config MATH_EMULATION
>  	bool "Math emulation"
> -	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
> +	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE || PPC_MICROWATT
>  	select PPC_FPU_REGS
>  	help
>  	  Some PowerPC chips designed for embedded applications do not have
> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kcon=
fig
> index 7a5e8f4541e3..74be4d06afbf 100644
> --- a/arch/powerpc/platforms/Kconfig
> +++ b/arch/powerpc/platforms/Kconfig
> @@ -20,6 +20,7 @@ source "arch/powerpc/platforms/embedded6xx/Kconfig"
>  source "arch/powerpc/platforms/44x/Kconfig"
>  source "arch/powerpc/platforms/40x/Kconfig"
>  source "arch/powerpc/platforms/amigaone/Kconfig"
> +source "arch/powerpc/platforms/microwatt/Kconfig"
> =20
>  config KVM_GUEST
>  	bool "KVM Guest support"
> diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Mak=
efile
> index 143d4417f6cc..edcb54cdb1a8 100644
> --- a/arch/powerpc/platforms/Makefile
> +++ b/arch/powerpc/platforms/Makefile
> @@ -22,3 +22,4 @@ obj-$(CONFIG_PPC_CELL)		+=3D cell/
>  obj-$(CONFIG_PPC_PS3)		+=3D ps3/
>  obj-$(CONFIG_EMBEDDED6xx)	+=3D embedded6xx/
>  obj-$(CONFIG_AMIGAONE)		+=3D amigaone/
> +obj-$(CONFIG_PPC_MICROWATT)	+=3D microwatt/
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/plat=
forms/microwatt/Kconfig
> new file mode 100644
> index 000000000000..3be01e78ce57
> --- /dev/null
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config PPC_MICROWATT
> +	depends on PPC_BOOK3S_64 && !SMP
> +	bool "Microwatt SoC platform"
> +	select PPC_XICS
> +	select PPC_NATIVE
> +	help
> +          This option enables support for FPGA-based Microwatt implement=
ations.
> +
> diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/pla=
tforms/microwatt/Makefile
> new file mode 100644
> index 000000000000..e6885b3b2ee7
> --- /dev/null
> +++ b/arch/powerpc/platforms/microwatt/Makefile
> @@ -0,0 +1 @@
> +obj-y	+=3D setup.o
> diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/plat=
forms/microwatt/setup.c
> new file mode 100644
> index 000000000000..d80d52612672
> --- /dev/null
> +++ b/arch/powerpc/platforms/microwatt/setup.c
> @@ -0,0 +1,23 @@
> +/*
> + * Microwatt FPGA-based SoC platform setup code.
> + *
> + * Copyright 2020 Paul Mackerras (paulus@ozlabs.org), IBM Corp.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/stddef.h>
> +#include <linux/init.h>
> +#include <asm/machdep.h>
> +#include <asm/time.h>
> +
> +static int __init microwatt_probe(void)
> +{
> +	return of_machine_is_compatible("microwatt-soc");
> +}
> +
> +define_machine(microwatt) {
> +	.name			=3D "microwatt",
> +	.probe			=3D microwatt_probe,
> +	.calibrate_decr		=3D generic_calibrate_decr,
> +};
> --=20
> 2.31.1
>=20
>=20
