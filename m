Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4524188568
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 14:25:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hYnm0WSFzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 00:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hYYC5DRdzDqfB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 00:14:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48hYYB1926z9sRR; Wed, 18 Mar 2020 00:14:37 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3670664b5da555a2a481449b3baafff113b0ac35
In-Reply-To: <20200109183912.5fcb52aa@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Message-Id: <48hYYB1926z9sRR@ozlabs.org>
Date: Wed, 18 Mar 2020 00:14:37 +1100 (AEDT)
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
Cc: PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-01-09 at 07:39:12 UTC, Stephen Rothwell wrote:
> ev_byte_channel_send() assumes that its third argument is a 16 byte array.
> Some places where it is called it may not be (or we can't easily tell
> if it is).  Newer compilers have started producing warnings about this,
> so make sure we actually pass a 16 byte array.
> 
> There may be more elegant solutions to this, but the driver is quite
> old and hasn't been updated in many years.
> 
> The warnings (from a powerpc allyesconfig build) are:
> 
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:250,
>                  from include/linux/bitops.h:29,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:109,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/gfp.h:5,
>                  from include/linux/slab.h:15,
>                  from drivers/tty/ehv_bytechan.c:24:
> drivers/tty/ehv_bytechan.c: In function =E2=80=98ehv_bc_udbg_putc=E2=80=99:
> arch/powerpc/include/asm/epapr_hcalls.h:298:20: warning: array subscript 1 =
> is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
>   298 |  r6 =3D be32_to_cpu(p[1]);
> include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
> ro =E2=80=98__be32_to_cpu=E2=80=99
>    40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
>       |                                                   ^
> arch/powerpc/include/asm/epapr_hcalls.h:298:7: note: in expansion of macro =
> =E2=80=98be32_to_cpu=E2=80=99
>   298 |  r6 =3D be32_to_cpu(p[1]);
>       |       ^~~~~~~~~~~
> drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
> =80=99
>   166 | static void ehv_bc_udbg_putc(char c)
>       |             ^~~~~~~~~~~~~~~~
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:250,
>                  from include/linux/bitops.h:29,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:109,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/gfp.h:5,
>                  from include/linux/slab.h:15,
>                  from drivers/tty/ehv_bytechan.c:24:
> arch/powerpc/include/asm/epapr_hcalls.h:299:20: warning: array subscript 2 =
> is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
>   299 |  r7 =3D be32_to_cpu(p[2]);
> include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
> ro =E2=80=98__be32_to_cpu=E2=80=99
>    40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
>       |                                                   ^
> arch/powerpc/include/asm/epapr_hcalls.h:299:7: note: in expansion of macro =
> =E2=80=98be32_to_cpu=E2=80=99
>   299 |  r7 =3D be32_to_cpu(p[2]);
>       |       ^~~~~~~~~~~
> drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
> =80=99
>   166 | static void ehv_bc_udbg_putc(char c)
>       |             ^~~~~~~~~~~~~~~~
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:250,
>                  from include/linux/bitops.h:29,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:109,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/gfp.h:5,
>                  from include/linux/slab.h:15,
>                  from drivers/tty/ehv_bytechan.c:24:
> arch/powerpc/include/asm/epapr_hcalls.h:300:20: warning: array subscript 3 =
> is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
>   300 |  r8 =3D be32_to_cpu(p[3]);
> include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
> ro =E2=80=98__be32_to_cpu=E2=80=99
>    40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
>       |                                                   ^
> arch/powerpc/include/asm/epapr_hcalls.h:300:7: note: in expansion of macro =
> =E2=80=98be32_to_cpu=E2=80=99
>   300 |  r8 =3D be32_to_cpu(p[3]);
>       |       ^~~~~~~~~~~
> drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
> =80=99
>   166 | static void ehv_bc_udbg_putc(char c)
>       |             ^~~~~~~~~~~~~~~~
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:250,
>                  from include/linux/bitops.h:29,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:109,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/gfp.h:5,
>                  from include/linux/slab.h:15,
>                  from drivers/tty/ehv_bytechan.c:24:
> arch/powerpc/include/asm/epapr_hcalls.h:298:20: warning: array subscript 1 =
> is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
>   298 |  r6 =3D be32_to_cpu(p[1]);
> include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
> ro =E2=80=98__be32_to_cpu=E2=80=99
>    40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
>       |                                                   ^
> arch/powerpc/include/asm/epapr_hcalls.h:298:7: note: in expansion of macro =
> =E2=80=98be32_to_cpu=E2=80=99
>   298 |  r6 =3D be32_to_cpu(p[1]);
>       |       ^~~~~~~~~~~
> drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
> =80=99
>   166 | static void ehv_bc_udbg_putc(char c)
>       |             ^~~~~~~~~~~~~~~~
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:250,
>                  from include/linux/bitops.h:29,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:109,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/gfp.h:5,
>                  from include/linux/slab.h:15,
>                  from drivers/tty/ehv_bytechan.c:24:
> arch/powerpc/include/asm/epapr_hcalls.h:299:20: warning: array subscript 2 =
> is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
>   299 |  r7 =3D be32_to_cpu(p[2]);
> include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
> ro =E2=80=98__be32_to_cpu=E2=80=99
>    40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
>       |                                                   ^
> arch/powerpc/include/asm/epapr_hcalls.h:299:7: note: in expansion of macro =
> =E2=80=98be32_to_cpu=E2=80=99
>   299 |  r7 =3D be32_to_cpu(p[2]);
>       |       ^~~~~~~~~~~
> drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
> =80=99
>   166 | static void ehv_bc_udbg_putc(char c)
>       |             ^~~~~~~~~~~~~~~~
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:250,
>                  from include/linux/bitops.h:29,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:109,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/gfp.h:5,
>                  from include/linux/slab.h:15,
>                  from drivers/tty/ehv_bytechan.c:24:
> arch/powerpc/include/asm/epapr_hcalls.h:300:20: warning: array subscript 3 =
> is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
>   300 |  r8 =3D be32_to_cpu(p[3]);
> include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
> ro =E2=80=98__be32_to_cpu=E2=80=99
>    40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
>       |                                                   ^
> arch/powerpc/include/asm/epapr_hcalls.h:300:7: note: in expansion of macro =
> =E2=80=98be32_to_cpu=E2=80=99
>   300 |  r8 =3D be32_to_cpu(p[3]);
>       |       ^~~~~~~~~~~
> drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
> =80=99
>   166 | static void ehv_bc_udbg_putc(char c)
>       |             ^~~~~~~~~~~~~~~~
> 
> Fixes: dcd83aaff1c8 ("tty/powerpc: introduce the ePAPR embedded hypervisor =
> byte channel driver")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3670664b5da555a2a481449b3baafff113b0ac35

cheers
