Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9648FC18
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 10:57:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jc9Sw19rGz30R0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 20:57:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EwL4Wek3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jc9S975XNz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 20:57:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EwL4Wek3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jc9S923Drz4y4h;
 Sun, 16 Jan 2022 20:57:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1642327033;
 bh=N08XI31uYyR5BAojNcsnm+Op+iSO31kfRX00ERHxu2Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EwL4Wek3C46KGbA7Kuu0RWXC1oLwqaL8qZ9AjzlAeErBs/vhBOzgrCAgmcJ7Hix7+
 rSDEG6heCxito8pxjfizwOVGE812icSgeOo1z8/RsK6OtMPsPkYcNkuW50c8NNDJaT
 8K8lOVGHRIFNzZKyPYMTWmZxmr6LcWAIWBzMuhPV+jWXsA4SPYMU4liY9FYSbZLy4k
 Wjn7Wavl7fqsrBzZfbhyoYrO8MbJbbyNJr1H8Z4r10UAhPuhvJDDPhZl+LNdyBH3ve
 k2P65dg6rKIQ8E1cqyFlGI3K5HmTG/KHImXwKYHYhWFEBZgdtViR26PRk+e6qkNOVg
 NYnBnlpOCjqWA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc: Add missing SPDX license identifiers
In-Reply-To: <4f2631b68df111c623a00c7c11af0ec474507ed3.1642157336.git.christophe.leroy@csgroup.eu>
References: <4f2631b68df111c623a00c7c11af0ec474507ed3.1642157336.git.christophe.leroy@csgroup.eu>
Date: Sun, 16 Jan 2022 20:57:06 +1100
Message-ID: <87o84c0zrh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Several files are missing SPDX license identifiers.
>
> Add to them the default kernel license identifier, ie GPL-2.0.

I'm not sure if that's OK, or if we're supposed to make some effort to
determine if the files were intended to be licensed some other way. eg.
if a file was added as part of a commit with other files licensed
GPL-2.0-or-later, maybe the intention was to license all files in that
commit that way. But I'm not sure what the process is meant to be.

Can you resend this and the other one and Cc Thomas, Greg and the SPDX
list (linux-spdx@vger.kernel.org). Hopefully they can tell us what to
do.

cheers

>
> DTS files are handled in a separate commit.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Makefile                                        | 1 +
>  arch/powerpc/boot/44x.h                                      | 1 +
>  arch/powerpc/boot/4xx.h                                      | 1 +
>  arch/powerpc/boot/crtsavres.S                                | 1 +
>  arch/powerpc/boot/dummy.c                                    | 1 +
>  arch/powerpc/boot/install.sh                                 | 1 +
>  arch/powerpc/boot/ops.h                                      | 1 +
>  arch/powerpc/boot/serial.c                                   | 1 +
>  arch/powerpc/boot/simple_alloc.c                             | 1 +
>  arch/powerpc/include/asm/8xx_immap.h                         | 1 +
>  arch/powerpc/include/asm/asm-compat.h                        | 1 +
>  arch/powerpc/include/asm/asm-const.h                         | 1 +
>  arch/powerpc/include/asm/asm-offsets.h                       | 1 +
>  arch/powerpc/include/asm/cpm.h                               | 1 +
>  arch/powerpc/include/asm/dtl.h                               | 1 +
>  arch/powerpc/include/asm/edac.h                              | 1 +
>  arch/powerpc/include/asm/ehv_pic.h                           | 1 +
>  arch/powerpc/include/asm/emergency-restart.h                 | 1 +
>  arch/powerpc/include/asm/epapr_hcalls.h                      | 1 +
>  arch/powerpc/include/asm/fixmap.h                            | 1 +
>  arch/powerpc/include/asm/floppy.h                            | 1 +
>  arch/powerpc/include/asm/fs_pd.h                             | 1 +
>  arch/powerpc/include/asm/fsl_hcalls.h                        | 1 +
>  arch/powerpc/include/asm/hydra.h                             | 1 +
>  arch/powerpc/include/asm/ibmebus.h                           | 1 +
>  arch/powerpc/include/asm/kgdb.h                              | 1 +
>  arch/powerpc/include/asm/membarrier.h                        | 1 +
>  arch/powerpc/include/asm/module.lds.h                        | 1 +
>  arch/powerpc/include/asm/mpc52xx.h                           | 1 +
>  arch/powerpc/include/asm/mpc52xx_psc.h                       | 1 +
>  arch/powerpc/include/asm/pmac_feature.h                      | 1 +
>  arch/powerpc/include/asm/ppc_asm.h                           | 1 +
>  arch/powerpc/include/asm/pte-walk.h                          | 1 +
>  arch/powerpc/include/asm/rheap.h                             | 1 +
>  arch/powerpc/include/asm/sfp-machine.h                       | 1 +
>  arch/powerpc/include/asm/vmalloc.h                           | 1 +
>  arch/powerpc/include/asm/word-at-a-time.h                    | 1 +
>  arch/powerpc/kernel/interrupt_64.S                           | 1 +
>  arch/powerpc/kernel/kgdb.c                                   | 1 +
>  arch/powerpc/kernel/ptrace/ptrace.c                          | 1 +
>  arch/powerpc/kernel/ptrace/ptrace32.c                        | 1 +
>  arch/powerpc/kernel/signal.c                                 | 1 +
>  arch/powerpc/kernel/signal.h                                 | 1 +
>  arch/powerpc/kernel/vdso32/note.S                            | 1 +
>  arch/powerpc/kernel/vdso64/note.S                            | 1 +
>  arch/powerpc/kvm/mpic.c                                      | 1 +
>  arch/powerpc/lib/crtsavres.S                                 | 1 +
>  arch/powerpc/lib/restart_table.c                             | 1 +
>  arch/powerpc/lib/rheap.c                                     | 1 +
>  arch/powerpc/mm/book3s64/hash_4k.c                           | 1 +
>  arch/powerpc/mm/book3s64/hash_64k.c                          | 1 +
>  arch/powerpc/mm/book3s64/hash_hugepage.c                     | 1 +
>  arch/powerpc/mm/hugetlbpage.c                                | 1 +
>  arch/powerpc/perf/req-gen/_end.h                             | 1 +
>  arch/powerpc/platforms/44x/fsp2.h                            | 1 +
>  arch/powerpc/platforms/4xx/pci.c                             | 1 +
>  arch/powerpc/platforms/4xx/pci.h                             | 1 +
>  arch/powerpc/platforms/52xx/efika.c                          | 1 +
>  arch/powerpc/platforms/52xx/mpc52xx_common.c                 | 1 +
>  arch/powerpc/platforms/52xx/mpc52xx_pci.c                    | 1 +
>  arch/powerpc/platforms/52xx/mpc52xx_pic.c                    | 1 +
>  arch/powerpc/platforms/85xx/ksi8560.c                        | 1 +
>  arch/powerpc/platforms/85xx/p1022_ds.c                       | 1 +
>  arch/powerpc/platforms/85xx/p1022_rdk.c                      | 1 +
>  arch/powerpc/platforms/8xx/ep88xc.c                          | 1 +
>  arch/powerpc/platforms/8xx/mpc86xads.h                       | 1 +
>  arch/powerpc/platforms/8xx/mpc86xads_setup.c                 | 1 +
>  arch/powerpc/platforms/8xx/mpc885ads.h                       | 1 +
>  arch/powerpc/platforms/8xx/mpc885ads_setup.c                 | 1 +
>  arch/powerpc/platforms/8xx/mpc8xx.h                          | 1 +
>  arch/powerpc/platforms/8xx/pic.c                             | 1 +
>  arch/powerpc/platforms/8xx/pic.h                             | 1 +
>  arch/powerpc/platforms/8xx/tqm8xx_setup.c                    | 1 +
>  arch/powerpc/platforms/cell/spufs/spu_restore_dump.h_shipped | 1 +
>  arch/powerpc/platforms/cell/spufs/spu_save_dump.h_shipped    | 1 +
>  arch/powerpc/platforms/chrp/gg2.h                            | 1 +
>  arch/powerpc/platforms/embedded6xx/linkstation.c             | 1 +
>  arch/powerpc/platforms/embedded6xx/ls_uart.c                 | 1 +
>  arch/powerpc/platforms/embedded6xx/mpc10x.h                  | 1 +
>  arch/powerpc/platforms/embedded6xx/storcenter.c              | 1 +
>  arch/powerpc/platforms/microwatt/Makefile                    | 1 +
>  arch/powerpc/platforms/microwatt/setup.c                     | 1 +
>  arch/powerpc/platforms/pseries/ibmebus.c                     | 1 +
>  arch/powerpc/sysdev/cpm2.c                                   | 1 +
>  arch/powerpc/sysdev/cpm2_pic.c                               | 1 +
>  arch/powerpc/sysdev/ehv_pic.c                                | 1 +
>  arch/powerpc/sysdev/ge/ge_pic.c                              | 1 +
>  arch/powerpc/sysdev/mpic.c                                   | 1 +
>  arch/powerpc/sysdev/rtc_cmos_setup.c                         | 1 +
>  arch/powerpc/tools/ci-build.sh                               | 1 +
>  arch/powerpc/tools/head_check.sh                             | 1 +
>  arch/powerpc/xmon/ppc.h                                      | 1 +
>  92 files changed, 92 insertions(+)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 5f16ac1583c5..b0298c5a78d3 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
>  # This file is included by the global makefile so that you can add your =
own
>  # architecture-specific flags and dependencies.
>  #
> diff --git a/arch/powerpc/boot/44x.h b/arch/powerpc/boot/44x.h
> index 02563443788a..16a4c47c8c41 100644
> --- a/arch/powerpc/boot/44x.h
> +++ b/arch/powerpc/boot/44x.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * PowerPC 44x related functions
>   *
> diff --git a/arch/powerpc/boot/4xx.h b/arch/powerpc/boot/4xx.h
> index 7dc5d45361bc..f13267f67155 100644
> --- a/arch/powerpc/boot/4xx.h
> +++ b/arch/powerpc/boot/4xx.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * PowerPC 4xx related functions
>   *
> diff --git a/arch/powerpc/boot/crtsavres.S b/arch/powerpc/boot/crtsavres.S
> index 085fb2b9a8b8..068f3b8b6c58 100644
> --- a/arch/powerpc/boot/crtsavres.S
> +++ b/arch/powerpc/boot/crtsavres.S
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Special support for eabi and SVR4
>   *
> diff --git a/arch/powerpc/boot/dummy.c b/arch/powerpc/boot/dummy.c
> index 31dbf45bf99c..3f9ccbf52783 100644
> --- a/arch/powerpc/boot/dummy.c
> +++ b/arch/powerpc/boot/dummy.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  int main(void)
>  {
>  	return 0;
> diff --git a/arch/powerpc/boot/install.sh b/arch/powerpc/boot/install.sh
> index 14473150ddb4..62479150e772 100644
> --- a/arch/powerpc/boot/install.sh
> +++ b/arch/powerpc/boot/install.sh
> @@ -1,4 +1,5 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
>  #
>  # This file is subject to the terms and conditions of the GNU General Pu=
blic
>  # License.  See the file "COPYING" in the main directory of this archive
> diff --git a/arch/powerpc/boot/ops.h b/arch/powerpc/boot/ops.h
> index 6455fc9a244f..eafdb44bb6ed 100644
> --- a/arch/powerpc/boot/ops.h
> +++ b/arch/powerpc/boot/ops.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Global definition of all the bootwrapper operations.
>   *
> diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
> index 54d2522be485..8aebbeda735c 100644
> --- a/arch/powerpc/boot/serial.c
> +++ b/arch/powerpc/boot/serial.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Generic serial console support
>   *
> diff --git a/arch/powerpc/boot/simple_alloc.c b/arch/powerpc/boot/simple_=
alloc.c
> index 65ec135d0157..5b3c2fb16860 100644
> --- a/arch/powerpc/boot/simple_alloc.c
> +++ b/arch/powerpc/boot/simple_alloc.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Implement primitive realloc(3) functionality.
>   *
> diff --git a/arch/powerpc/include/asm/8xx_immap.h b/arch/powerpc/include/=
asm/8xx_immap.h
> index bdf0563ba423..0cd91d52e3fd 100644
> --- a/arch/powerpc/include/asm/8xx_immap.h
> +++ b/arch/powerpc/include/asm/8xx_immap.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * MPC8xx Internal Memory Map
>   * Copyright (c) 1997 Dan Malek (dmalek@jlc.net)
> diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include=
/asm/asm-compat.h
> index 2b736d9fbb1b..a6cdaf40d7b4 100644
> --- a/arch/powerpc/include/asm/asm-compat.h
> +++ b/arch/powerpc/include/asm/asm-compat.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ASM_POWERPC_ASM_COMPAT_H
>  #define _ASM_POWERPC_ASM_COMPAT_H
>=20=20
> diff --git a/arch/powerpc/include/asm/asm-const.h b/arch/powerpc/include/=
asm/asm-const.h
> index bfb3c3534877..922ba500c3f2 100644
> --- a/arch/powerpc/include/asm/asm-const.h
> +++ b/arch/powerpc/include/asm/asm-const.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ASM_POWERPC_ASM_CONST_H
>  #define _ASM_POWERPC_ASM_CONST_H
>=20=20
> diff --git a/arch/powerpc/include/asm/asm-offsets.h b/arch/powerpc/includ=
e/asm/asm-offsets.h
> index d370ee36a182..9f8535716392 100644
> --- a/arch/powerpc/include/asm/asm-offsets.h
> +++ b/arch/powerpc/include/asm/asm-offsets.h
> @@ -1 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #include <generated/asm-offsets.h>
> diff --git a/arch/powerpc/include/asm/cpm.h b/arch/powerpc/include/asm/cp=
m.h
> index ce483b0f8a4d..475781aa71c5 100644
> --- a/arch/powerpc/include/asm/cpm.h
> +++ b/arch/powerpc/include/asm/cpm.h
> @@ -1 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #include <soc/fsl/cpm.h>
> diff --git a/arch/powerpc/include/asm/dtl.h b/arch/powerpc/include/asm/dt=
l.h
> index 1625888f27ef..1368c2963dfd 100644
> --- a/arch/powerpc/include/asm/dtl.h
> +++ b/arch/powerpc/include/asm/dtl.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ASM_POWERPC_DTL_H
>  #define _ASM_POWERPC_DTL_H
>=20=20
> diff --git a/arch/powerpc/include/asm/edac.h b/arch/powerpc/include/asm/e=
dac.h
> index 5571e23d253e..d10e4ea565bb 100644
> --- a/arch/powerpc/include/asm/edac.h
> +++ b/arch/powerpc/include/asm/edac.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * PPC EDAC common defs
>   *
> diff --git a/arch/powerpc/include/asm/ehv_pic.h b/arch/powerpc/include/as=
m/ehv_pic.h
> index dc7d48e3ea90..fecf32db2014 100644
> --- a/arch/powerpc/include/asm/ehv_pic.h
> +++ b/arch/powerpc/include/asm/ehv_pic.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * EHV_PIC private definitions and structure.
>   *
> diff --git a/arch/powerpc/include/asm/emergency-restart.h b/arch/powerpc/=
include/asm/emergency-restart.h
> index 3711bd9d50bd..ba702050dced 100644
> --- a/arch/powerpc/include/asm/emergency-restart.h
> +++ b/arch/powerpc/include/asm/emergency-restart.h
> @@ -1 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #include <asm-generic/emergency-restart.h>
> diff --git a/arch/powerpc/include/asm/epapr_hcalls.h b/arch/powerpc/inclu=
de/asm/epapr_hcalls.h
> index c99ba08a408d..07cc9c8d48fe 100644
> --- a/arch/powerpc/include/asm/epapr_hcalls.h
> +++ b/arch/powerpc/include/asm/epapr_hcalls.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * ePAPR hcall interface
>   *
> diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm=
/fixmap.h
> index 947b5b9c4424..62d1ba66ea7d 100644
> --- a/arch/powerpc/include/asm/fixmap.h
> +++ b/arch/powerpc/include/asm/fixmap.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * fixmap.h: compile-time virtual memory allocation
>   *
> diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm=
/floppy.h
> index f8ce178b43b7..d84e3ef8ed4b 100644
> --- a/arch/powerpc/include/asm/floppy.h
> +++ b/arch/powerpc/include/asm/floppy.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Architecture specific parts of the Floppy driver
>   *
> diff --git a/arch/powerpc/include/asm/fs_pd.h b/arch/powerpc/include/asm/=
fs_pd.h
> index 8def56ec05c6..ae13bdea65d5 100644
> --- a/arch/powerpc/include/asm/fs_pd.h
> +++ b/arch/powerpc/include/asm/fs_pd.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Platform information definitions.
>   *
> diff --git a/arch/powerpc/include/asm/fsl_hcalls.h b/arch/powerpc/include=
/asm/fsl_hcalls.h
> index b889d13547fd..07d88dc7b24a 100644
> --- a/arch/powerpc/include/asm/fsl_hcalls.h
> +++ b/arch/powerpc/include/asm/fsl_hcalls.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Freescale hypervisor call interface
>   *
> diff --git a/arch/powerpc/include/asm/hydra.h b/arch/powerpc/include/asm/=
hydra.h
> index d024447283a0..94cce3047058 100644
> --- a/arch/powerpc/include/asm/hydra.h
> +++ b/arch/powerpc/include/asm/hydra.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   *  include/asm-ppc/hydra.h -- Mac I/O `Hydra' definitions
>   *
> diff --git a/arch/powerpc/include/asm/ibmebus.h b/arch/powerpc/include/as=
m/ibmebus.h
> index 088f95b2e14f..866b17f80c61 100644
> --- a/arch/powerpc/include/asm/ibmebus.h
> +++ b/arch/powerpc/include/asm/ibmebus.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * IBM PowerPC eBus Infrastructure Support.
>   *
> diff --git a/arch/powerpc/include/asm/kgdb.h b/arch/powerpc/include/asm/k=
gdb.h
> index a9e098a3b881..28bf91f99f34 100644
> --- a/arch/powerpc/include/asm/kgdb.h
> +++ b/arch/powerpc/include/asm/kgdb.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * The PowerPC (32/64) specific defines / externs for KGDB.  Based on
>   * the previous 32bit and 64bit specific files, which had the following
> diff --git a/arch/powerpc/include/asm/membarrier.h b/arch/powerpc/include=
/asm/membarrier.h
> index de7f79157918..012bba812c3a 100644
> --- a/arch/powerpc/include/asm/membarrier.h
> +++ b/arch/powerpc/include/asm/membarrier.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ASM_POWERPC_MEMBARRIER_H
>  #define _ASM_POWERPC_MEMBARRIER_H
>=20=20
> diff --git a/arch/powerpc/include/asm/module.lds.h b/arch/powerpc/include=
/asm/module.lds.h
> index cea5dc124be4..a4dd672e8c6a 100644
> --- a/arch/powerpc/include/asm/module.lds.h
> +++ b/arch/powerpc/include/asm/module.lds.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /* Force alignment of .toc section.  */
>  SECTIONS
>  {
> diff --git a/arch/powerpc/include/asm/mpc52xx.h b/arch/powerpc/include/as=
m/mpc52xx.h
> index ce1e0aabaa64..604d6c3651e8 100644
> --- a/arch/powerpc/include/asm/mpc52xx.h
> +++ b/arch/powerpc/include/asm/mpc52xx.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Prototypes, etc. for the Freescale MPC52xx embedded cpu chips
>   * May need to be cleaned as the port goes on ...
> diff --git a/arch/powerpc/include/asm/mpc52xx_psc.h b/arch/powerpc/includ=
e/asm/mpc52xx_psc.h
> index ec995b289280..d42245686250 100644
> --- a/arch/powerpc/include/asm/mpc52xx_psc.h
> +++ b/arch/powerpc/include/asm/mpc52xx_psc.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * include/asm-ppc/mpc52xx_psc.h
>   *
> diff --git a/arch/powerpc/include/asm/pmac_feature.h b/arch/powerpc/inclu=
de/asm/pmac_feature.h
> index e08e829261b6..5fe92ff953b1 100644
> --- a/arch/powerpc/include/asm/pmac_feature.h
> +++ b/arch/powerpc/include/asm/pmac_feature.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Definition of platform feature hooks for PowerMacs
>   *
> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/as=
m/ppc_asm.h
> index 3c06a33b5da4..d9c6f12e6d3e 100644
> --- a/arch/powerpc/include/asm/ppc_asm.h
> +++ b/arch/powerpc/include/asm/ppc_asm.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright (C) 1995-1999 Gary Thomas, Paul Mackerras, Cort Dougan.
>   */
> diff --git a/arch/powerpc/include/asm/pte-walk.h b/arch/powerpc/include/a=
sm/pte-walk.h
> index 714a35f0d425..dc8bd55e749f 100644
> --- a/arch/powerpc/include/asm/pte-walk.h
> +++ b/arch/powerpc/include/asm/pte-walk.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ASM_POWERPC_PTE_WALK_H
>  #define _ASM_POWERPC_PTE_WALK_H
>=20=20
> diff --git a/arch/powerpc/include/asm/rheap.h b/arch/powerpc/include/asm/=
rheap.h
> index 8e83703d6736..cd6455e594e4 100644
> --- a/arch/powerpc/include/asm/rheap.h
> +++ b/arch/powerpc/include/asm/rheap.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * include/asm-ppc/rheap.h
>   *
> diff --git a/arch/powerpc/include/asm/sfp-machine.h b/arch/powerpc/includ=
e/asm/sfp-machine.h
> index 8b957aabb826..17b376ff8212 100644
> --- a/arch/powerpc/include/asm/sfp-machine.h
> +++ b/arch/powerpc/include/asm/sfp-machine.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /* Machine-dependent software floating-point definitions.  PPC version.
>     Copyright (C) 1997 Free Software Foundation, Inc.
>     This file is part of the GNU C Library.
> diff --git a/arch/powerpc/include/asm/vmalloc.h b/arch/powerpc/include/as=
m/vmalloc.h
> index 4c69ece52a31..6f8df6b07c8a 100644
> --- a/arch/powerpc/include/asm/vmalloc.h
> +++ b/arch/powerpc/include/asm/vmalloc.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ASM_POWERPC_VMALLOC_H
>  #define _ASM_POWERPC_VMALLOC_H
>=20=20
> diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/inc=
lude/asm/word-at-a-time.h
> index f3f4710d4ff5..96245747720d 100644
> --- a/arch/powerpc/include/asm/word-at-a-time.h
> +++ b/arch/powerpc/include/asm/word-at-a-time.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ASM_WORD_AT_A_TIME_H
>  #define _ASM_WORD_AT_A_TIME_H
>=20=20
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index 92088f848266..46e886c4264b 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #include <asm/asm-offsets.h>
>  #include <asm/bug.h>
>  #ifdef CONFIG_PPC_BOOK3S
> diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
> index 9f8d0fa7b718..10d64d54d2a1 100644
> --- a/arch/powerpc/kernel/kgdb.c
> +++ b/arch/powerpc/kernel/kgdb.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * PowerPC backend to the KGDB stub.
>   *
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/pt=
race/ptrace.c
> index 7c7093c17c45..0be1c76a0e65 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   *  PowerPC version
>   *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
> diff --git a/arch/powerpc/kernel/ptrace/ptrace32.c b/arch/powerpc/kernel/=
ptrace/ptrace32.c
> index 19c224808982..adffe6f1e7d8 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace32.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace32.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * ptrace for 32-bit processes running on a 64-bit kernel.
>   *
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index b93b87df499d..d541b6e00069 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Common signal handling code for both 32 and 64 bits
>   *
> diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
> index 618aeccdf691..b2e398dae4fc 100644
> --- a/arch/powerpc/kernel/signal.h
> +++ b/arch/powerpc/kernel/signal.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   *    Copyright (c) 2007 Benjamin Herrenschmidt, IBM Corporation
>   *    Extracted from signal_32.c and signal_64.c
> diff --git a/arch/powerpc/kernel/vdso32/note.S b/arch/powerpc/kernel/vdso=
32/note.S
> index 227a7327399e..1698e72d4cbf 100644
> --- a/arch/powerpc/kernel/vdso32/note.S
> +++ b/arch/powerpc/kernel/vdso32/note.S
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * This supplies .note.* sections to go into the PT_NOTE inside the vDSO=
 text.
>   * Here we can supply some information useful to userland.
> diff --git a/arch/powerpc/kernel/vdso64/note.S b/arch/powerpc/kernel/vdso=
64/note.S
> index dc2a509f7e8a..bd1fa23597d6 100644
> --- a/arch/powerpc/kernel/vdso64/note.S
> +++ b/arch/powerpc/kernel/vdso64/note.S
> @@ -1 +1,2 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #include "../vdso32/note.S"
> diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
> index 23e9c2bd9f27..e0982f87150a 100644
> --- a/arch/powerpc/kvm/mpic.c
> +++ b/arch/powerpc/kvm/mpic.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * OpenPIC emulation
>   *
> diff --git a/arch/powerpc/lib/crtsavres.S b/arch/powerpc/lib/crtsavres.S
> index 7e5e1c28e56a..d704cf81c19f 100644
> --- a/arch/powerpc/lib/crtsavres.S
> +++ b/arch/powerpc/lib/crtsavres.S
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Special support for eabi and SVR4
>   *
> diff --git a/arch/powerpc/lib/restart_table.c b/arch/powerpc/lib/restart_=
table.c
> index bccb662c1b7b..aaf89522d23e 100644
> --- a/arch/powerpc/lib/restart_table.c
> +++ b/arch/powerpc/lib/restart_table.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  #include <asm/interrupt.h>
>  #include <asm/kprobes.h>
>=20=20
> diff --git a/arch/powerpc/lib/rheap.c b/arch/powerpc/lib/rheap.c
> index 6aa774aa5b16..4dbe073766bf 100644
> --- a/arch/powerpc/lib/rheap.c
> +++ b/arch/powerpc/lib/rheap.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * A Remote Heap.  Remote means that we don't touch the memory that the
>   * heap points to. Normal heap implementations use the memory they manage
> diff --git a/arch/powerpc/mm/book3s64/hash_4k.c b/arch/powerpc/mm/book3s6=
4/hash_4k.c
> index 7de1a8a0c62a..847364aa7a55 100644
> --- a/arch/powerpc/mm/book3s64/hash_4k.c
> +++ b/arch/powerpc/mm/book3s64/hash_4k.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright IBM Corporation, 2015
>   * Author Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> diff --git a/arch/powerpc/mm/book3s64/hash_64k.c b/arch/powerpc/mm/book3s=
64/hash_64k.c
> index 998c6817ed47..e302942138ee 100644
> --- a/arch/powerpc/mm/book3s64/hash_64k.c
> +++ b/arch/powerpc/mm/book3s64/hash_64k.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright IBM Corporation, 2015
>   * Author Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/b=
ook3s64/hash_hugepage.c
> index c0fabe6c5a12..bb6a63e946be 100644
> --- a/arch/powerpc/mm/book3s64/hash_hugepage.c
> +++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright IBM Corporation, 2013
>   * Author Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index ddead41e2194..5cdd7a587e09 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * PPC Huge TLB Page Support for Kernel.
>   *
> diff --git a/arch/powerpc/perf/req-gen/_end.h b/arch/powerpc/perf/req-gen=
/_end.h
> index 8a406980b6bf..6687fccd3752 100644
> --- a/arch/powerpc/perf/req-gen/_end.h
> +++ b/arch/powerpc/perf/req-gen/_end.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>=20=20
>  #undef REQ_GEN_PREFIX
>  #undef REQUEST_BEGIN
> diff --git a/arch/powerpc/platforms/44x/fsp2.h b/arch/powerpc/platforms/4=
4x/fsp2.h
> index 9e1d52754c8b..ae637bf2b58b 100644
> --- a/arch/powerpc/platforms/44x/fsp2.h
> +++ b/arch/powerpc/platforms/44x/fsp2.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _ASM_POWERPC_FSP_DCR_H_
>  #define _ASM_POWERPC_FSP_DCR_H_
>  #ifdef __KERNEL__
> diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4x=
x/pci.c
> index 24f41e178cbc..1dabc65d5b3e 100644
> --- a/arch/powerpc/platforms/4xx/pci.c
> +++ b/arch/powerpc/platforms/4xx/pci.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * PCI / PCI-X / PCI-Express support for 4xx parts
>   *
> diff --git a/arch/powerpc/platforms/4xx/pci.h b/arch/powerpc/platforms/4x=
x/pci.h
> index bb4821938ab1..364838cc90ff 100644
> --- a/arch/powerpc/platforms/4xx/pci.h
> +++ b/arch/powerpc/platforms/4xx/pci.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * PCI / PCI-X / PCI-Express support for 4xx parts
>   *
> diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms=
/52xx/efika.c
> index 3b7d70d71692..8a5563ccac30 100644
> --- a/arch/powerpc/platforms/52xx/efika.c
> +++ b/arch/powerpc/platforms/52xx/efika.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Efika 5K2 platform code
>   * Some code really inspired from the lite5200b platform.
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/=
platforms/52xx/mpc52xx_common.c
> index 565e3a83dc9e..15608a2e8d72 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   *
>   * Utility functions for the Freescale MPC52xx.
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pci.c b/arch/powerpc/pla=
tforms/52xx/mpc52xx_pci.c
> index af0f79995214..014e6abb10d0 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_pci.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * PCI code for the Freescale MPC52xx embedded CPU.
>   *
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pic.c b/arch/powerpc/pla=
tforms/52xx/mpc52xx_pic.c
> index 76a8102bdb98..3b1b3421de3c 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_pic.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   *
>   * Programmable Interrupt Controller functions for the Freescale MPC52xx.
> diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platfor=
ms/85xx/ksi8560.c
> index 6ef8580fdc0e..8c235d9e876a 100644
> --- a/arch/powerpc/platforms/85xx/ksi8560.c
> +++ b/arch/powerpc/platforms/85xx/ksi8560.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Board setup routines for the Emerson KSI8560
>   *
> diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platfo=
rms/85xx/p1022_ds.c
> index 1f1af0557470..4770108d2d32 100644
> --- a/arch/powerpc/platforms/85xx/p1022_ds.c
> +++ b/arch/powerpc/platforms/85xx/p1022_ds.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * P1022DS board specific routines
>   *
> diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platf=
orms/85xx/p1022_rdk.c
> index fd9e3e7ef234..ab12a8eb80a8 100644
> --- a/arch/powerpc/platforms/85xx/p1022_rdk.c
> +++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * P1022 RDK board specific routines
>   *
> diff --git a/arch/powerpc/platforms/8xx/ep88xc.c b/arch/powerpc/platforms=
/8xx/ep88xc.c
> index ebcf34a14789..46daa968aa2d 100644
> --- a/arch/powerpc/platforms/8xx/ep88xc.c
> +++ b/arch/powerpc/platforms/8xx/ep88xc.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Platform setup for the Embedded Planet EP88xC board
>   *
> diff --git a/arch/powerpc/platforms/8xx/mpc86xads.h b/arch/powerpc/platfo=
rms/8xx/mpc86xads.h
> index 17b1fe75e0b2..fb3ee1fc5709 100644
> --- a/arch/powerpc/platforms/8xx/mpc86xads.h
> +++ b/arch/powerpc/platforms/8xx/mpc86xads.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * A collection of structures, addresses, and values associated with
>   * the Freescale MPC86xADS board.
> diff --git a/arch/powerpc/platforms/8xx/mpc86xads_setup.c b/arch/powerpc/=
platforms/8xx/mpc86xads_setup.c
> index 8d02f5ff4481..3676df5d6e37 100644
> --- a/arch/powerpc/platforms/8xx/mpc86xads_setup.c
> +++ b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*arch/powerpc/platforms/8xx/mpc86xads_setup.c
>   *
>   * Platform setup for the Freescale mpc86xads board
> diff --git a/arch/powerpc/platforms/8xx/mpc885ads.h b/arch/powerpc/platfo=
rms/8xx/mpc885ads.h
> index 19412f76fa3b..c41f98ea1c06 100644
> --- a/arch/powerpc/platforms/8xx/mpc885ads.h
> +++ b/arch/powerpc/platforms/8xx/mpc885ads.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * A collection of structures, addresses, and values associated with
>   * the Freescale MPC885ADS board.
> diff --git a/arch/powerpc/platforms/8xx/mpc885ads_setup.c b/arch/powerpc/=
platforms/8xx/mpc885ads_setup.c
> index a0c83c1905c6..5946f86d38f1 100644
> --- a/arch/powerpc/platforms/8xx/mpc885ads_setup.c
> +++ b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Platform setup for the Freescale mpc885ads board
>   *
> diff --git a/arch/powerpc/platforms/8xx/mpc8xx.h b/arch/powerpc/platforms=
/8xx/mpc8xx.h
> index 31cc2ecace42..3baa2def744e 100644
> --- a/arch/powerpc/platforms/8xx/mpc8xx.h
> +++ b/arch/powerpc/platforms/8xx/mpc8xx.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Prototypes, etc. for the Freescale MPC8xx embedded cpu chips
>   * May need to be cleaned as the port goes on ...
> diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8x=
x/pic.c
> index f2ba837249d6..4130cea17239 100644
> --- a/arch/powerpc/platforms/8xx/pic.c
> +++ b/arch/powerpc/platforms/8xx/pic.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  #include <linux/kernel.h>
>  #include <linux/stddef.h>
>  #include <linux/sched.h>
> diff --git a/arch/powerpc/platforms/8xx/pic.h b/arch/powerpc/platforms/8x=
x/pic.h
> index 9fe00eebdc8b..45ec3966a2ce 100644
> --- a/arch/powerpc/platforms/8xx/pic.h
> +++ b/arch/powerpc/platforms/8xx/pic.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _PPC_KERNEL_MPC8xx_H
>  #define _PPC_KERNEL_MPC8xx_H
>=20=20
> diff --git a/arch/powerpc/platforms/8xx/tqm8xx_setup.c b/arch/powerpc/pla=
tforms/8xx/tqm8xx_setup.c
> index 4cea8b1afa44..e8bbe1df929f 100644
> --- a/arch/powerpc/platforms/8xx/tqm8xx_setup.c
> +++ b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Platform setup for the MPC8xx based boards from TQM.
>   *
> diff --git a/arch/powerpc/platforms/cell/spufs/spu_restore_dump.h_shipped=
 b/arch/powerpc/platforms/cell/spufs/spu_restore_dump.h_shipped
> index f383b027e8bf..f997a8c9edd2 100644
> --- a/arch/powerpc/platforms/cell/spufs/spu_restore_dump.h_shipped
> +++ b/arch/powerpc/platforms/cell/spufs/spu_restore_dump.h_shipped
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * spu_restore_dump.h: Copyright (C) 2005 IBM.
>   * Hex-dump auto generated from spu_restore.c.
> diff --git a/arch/powerpc/platforms/cell/spufs/spu_save_dump.h_shipped b/=
arch/powerpc/platforms/cell/spufs/spu_save_dump.h_shipped
> index b9f81ac8a632..f85f798e270e 100644
> --- a/arch/powerpc/platforms/cell/spufs/spu_save_dump.h_shipped
> +++ b/arch/powerpc/platforms/cell/spufs/spu_save_dump.h_shipped
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * spu_save_dump.h: Copyright (C) 2005 IBM.
>   * Hex-dump auto generated from spu_save.c.
> diff --git a/arch/powerpc/platforms/chrp/gg2.h b/arch/powerpc/platforms/c=
hrp/gg2.h
> index 341ae55b99fb..4d984bf6917c 100644
> --- a/arch/powerpc/platforms/chrp/gg2.h
> +++ b/arch/powerpc/platforms/chrp/gg2.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   *  include/asm-ppc/gg2.h -- VLSI VAS96011/12 `Golden Gate 2' register d=
efinitions
>   *
> diff --git a/arch/powerpc/platforms/embedded6xx/linkstation.c b/arch/powe=
rpc/platforms/embedded6xx/linkstation.c
> index eb8342e7f84e..02514e2ad67e 100644
> --- a/arch/powerpc/platforms/embedded6xx/linkstation.c
> +++ b/arch/powerpc/platforms/embedded6xx/linkstation.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Board setup routines for the Buffalo Linkstation / Kurobox Platform.
>   *
> diff --git a/arch/powerpc/platforms/embedded6xx/ls_uart.c b/arch/powerpc/=
platforms/embedded6xx/ls_uart.c
> index 9d891bd5df5a..87e1264d0c9c 100644
> --- a/arch/powerpc/platforms/embedded6xx/ls_uart.c
> +++ b/arch/powerpc/platforms/embedded6xx/ls_uart.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * AVR power-management chip interface for the Buffalo Linkstation /
>   * Kurobox Platform.
> diff --git a/arch/powerpc/platforms/embedded6xx/mpc10x.h b/arch/powerpc/p=
latforms/embedded6xx/mpc10x.h
> index 5ad12023e562..1f410e478ad5 100644
> --- a/arch/powerpc/platforms/embedded6xx/mpc10x.h
> +++ b/arch/powerpc/platforms/embedded6xx/mpc10x.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Common routines for the Motorola SPS MPC106/8240/107 Host bridge/Mem
>   * ctlr/EPIC/etc.
> diff --git a/arch/powerpc/platforms/embedded6xx/storcenter.c b/arch/power=
pc/platforms/embedded6xx/storcenter.c
> index e188b90f7016..ac29d1d1a7b4 100644
> --- a/arch/powerpc/platforms/embedded6xx/storcenter.c
> +++ b/arch/powerpc/platforms/embedded6xx/storcenter.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Board setup routines for the storcenter
>   *
> diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/pla=
tforms/microwatt/Makefile
> index 116d6d3ad3f0..7defeadac694 100644
> --- a/arch/powerpc/platforms/microwatt/Makefile
> +++ b/arch/powerpc/platforms/microwatt/Makefile
> @@ -1 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
>  obj-y	+=3D setup.o rng.o
> diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/plat=
forms/microwatt/setup.c
> index 0b02603bdb74..fe6c242f788f 100644
> --- a/arch/powerpc/platforms/microwatt/setup.c
> +++ b/arch/powerpc/platforms/microwatt/setup.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Microwatt FPGA-based SoC platform setup code.
>   *
> diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/plat=
forms/pseries/ibmebus.c
> index 7ee3ed7d6cc2..517ded1fe467 100644
> --- a/arch/powerpc/platforms/pseries/ibmebus.c
> +++ b/arch/powerpc/platforms/pseries/ibmebus.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * IBM PowerPC IBM eBus Infrastructure Support.
>   *
> diff --git a/arch/powerpc/sysdev/cpm2.c b/arch/powerpc/sysdev/cpm2.c
> index 3f130312b6e9..16ce448f0029 100644
> --- a/arch/powerpc/sysdev/cpm2.c
> +++ b/arch/powerpc/sysdev/cpm2.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * General Purpose functions for the global management of the
>   * 8260 Communication Processor Module.
> diff --git a/arch/powerpc/sysdev/cpm2_pic.c b/arch/powerpc/sysdev/cpm2_pi=
c.c
> index 9e86074719a9..91850496f2e5 100644
> --- a/arch/powerpc/sysdev/cpm2_pic.c
> +++ b/arch/powerpc/sysdev/cpm2_pic.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Platform information definitions.
>   *
> diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
> index 00705258ecf9..2eb956ffcd27 100644
> --- a/arch/powerpc/sysdev/ehv_pic.c
> +++ b/arch/powerpc/sysdev/ehv_pic.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   *  Driver for ePAPR Embedded Hypervisor PIC
>   *
> diff --git a/arch/powerpc/sysdev/ge/ge_pic.c b/arch/powerpc/sysdev/ge/ge_=
pic.c
> index 02553a8ce191..73dfe371c783 100644
> --- a/arch/powerpc/sysdev/ge/ge_pic.c
> +++ b/arch/powerpc/sysdev/ge/ge_pic.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Interrupt handling for GE FPGA based PIC
>   *
> diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
> index d5cb48b61bbd..5071c776eed4 100644
> --- a/arch/powerpc/sysdev/mpic.c
> +++ b/arch/powerpc/sysdev/mpic.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   *  arch/powerpc/kernel/mpic.c
>   *
> diff --git a/arch/powerpc/sysdev/rtc_cmos_setup.c b/arch/powerpc/sysdev/r=
tc_cmos_setup.c
> index af0f9beddca9..25ba1e7306de 100644
> --- a/arch/powerpc/sysdev/rtc_cmos_setup.c
> +++ b/arch/powerpc/sysdev/rtc_cmos_setup.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Setup code for PC-style Real-Time Clock.
>   *
> diff --git a/arch/powerpc/tools/ci-build.sh b/arch/powerpc/tools/ci-build=
.sh
> index 420df6ec5a2f..a861fd722495 100755
> --- a/arch/powerpc/tools/ci-build.sh
> +++ b/arch/powerpc/tools/ci-build.sh
> @@ -1,4 +1,5 @@
>  #!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
>=20=20
>  if [[ -z "$TARGET" || -z "$IMAGE" ]]; then
>      echo "Error: required environment variables not set!"
> diff --git a/arch/powerpc/tools/head_check.sh b/arch/powerpc/tools/head_c=
heck.sh
> index 689907cda996..cc055b0ed995 100644
> --- a/arch/powerpc/tools/head_check.sh
> +++ b/arch/powerpc/tools/head_check.sh
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
>  # Copyright =C2=A9 2016 IBM Corporation
>=20=20
>  # This program is free software; you can redistribute it and/or
> diff --git a/arch/powerpc/xmon/ppc.h b/arch/powerpc/xmon/ppc.h
> index d00f33dcf192..4f8db773e01c 100644
> --- a/arch/powerpc/xmon/ppc.h
> +++ b/arch/powerpc/xmon/ppc.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /* ppc.h -- Header file for PowerPC opcode table
>     Copyright (C) 1994-2016 Free Software Foundation, Inc.
>     Written by Ian Lance Taylor, Cygnus Support
> --=20
> 2.33.1
