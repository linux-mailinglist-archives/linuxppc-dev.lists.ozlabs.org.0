Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B13455EA73C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbk9v6cNbz3c8c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 23:29:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EzP2UwV8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbk9S04wfz2xZ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 23:28:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EzP2UwV8;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mbk9N4CCkz4x1D;
	Mon, 26 Sep 2022 23:28:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664198920;
	bh=zvKH5nBpKoedTSv4CoKLnBqONfXJfqceCqtSOshjHnM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EzP2UwV8n9IdRIOv44hZp154/FZH46ER5xshwyuRfwhdVozObC/l0lEzcDAxBC/2b
	 6s2kG8X4imYI6+C1gSGm0LZ0ElJqPeWr/rznrXk9VQyHY6cQpdxe9fcHjfltNhiQ+g
	 ibXAwhBg8p82u880DztFZsAnRadAa9LpmvAxQ4ZZqyvdTCUN/CpbmKViYyZ+1mfB4n
	 yFq983ZLf1ftSLAdxFsSdR2mSkxTzwplPmHBw4rgee3Y+PoIYJW8MVOyq0ZJNyJraT
	 MICYabb3WlW9MT2aG0n3HxnDbPwDtyweSQRYOzRoXZiXLubUXcQawy56vSnjzyY7F+
	 5+h1uEDJx/trg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc: Ignore DSI error caused by the copy/paste
 instruction
In-Reply-To: <12b8c238593b835837dbb8ce664c50dcaf9ecb3d.camel@linux.ibm.com>
References: <12b8c238593b835837dbb8ce664c50dcaf9ecb3d.camel@linux.ibm.com>
Date: Mon, 26 Sep 2022 23:28:37 +1000
Message-ID: <87leq6z2m2.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> DSI error will be generated when the paste operation is issued on
> the suspended NX window due to NX state changes. The hypervisor

Please spell out DSI and NX on the first usage.

> expects the partition to ignore this error during page pault
> handling. To differentiate DSI caused by an actual HW configuration
> or by the NX window, a new =E2=80=9Cibm,pi-features=E2=80=9D type value i=
s defined.
> Byte 0, bit 3 of pi-attribute-specifier-type is now defined to
> indicate this DSI error. If this error is not ignored, the user
> space can get SIGBUS when the NX request is issued.
>
> This patch adds changes to read ibm,pi-features property and ignore
> DSI error in the page fault handling if CPU_FTR_NX_DSI if defined.
>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
> v2: Code cleanup as suggested by Christophe Leroy=20
>
>  arch/powerpc/include/asm/cputable.h |  5 ++--
>  arch/powerpc/kernel/prom.c          | 36 +++++++++++++++++++++--------
>  arch/powerpc/mm/fault.c             | 17 +++++++++++++-
>  3 files changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/a=
sm/cputable.h
> index ae8c3e13cfce..8dc9949b6365 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -192,6 +192,7 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
>  #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
>  #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
> +#define CPU_FTR_NX_DSI			LONG_ASM_CONST(0x0010000000000000)

Can we make this an MMU feature?

We have a lot more free MMU feature bits, it should just be a case of
s/cpu/mmu/ pretty much everywhere you use it.

>  #ifndef __ASSEMBLY__
>=20=20
> @@ -429,7 +430,7 @@ static inline void cpu_feature_keys_init(void) { }
>  	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
>  	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
>  	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_P9_TLBIE_STQ_BUG | \
> -	    CPU_FTR_P9_TLBIE_ERAT_BUG | CPU_FTR_P9_TIDR)
> +	    CPU_FTR_P9_TLBIE_ERAT_BUG | CPU_FTR_P9_TIDR | CPU_FTR_NX_DSI)
>  #define CPU_FTRS_POWER9_DD2_0 (CPU_FTRS_POWER9 | CPU_FTR_P9_RADIX_PREFET=
CH_BUG)
>  #define CPU_FTRS_POWER9_DD2_1 (CPU_FTRS_POWER9 | \
>  			       CPU_FTR_P9_RADIX_PREFETCH_BUG | \
> @@ -451,7 +452,7 @@ static inline void cpu_feature_keys_init(void) { }
>  	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
>  	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
>  	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
> -	    CPU_FTR_DAWR | CPU_FTR_DAWR1)
> +	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | CPU_FTR_NX_DSI)

You're turning that bit on by default for Power9 and Power10 - is that
correct?

If so do you have a documentation source for that?

cheers
