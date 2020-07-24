Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AD122CDF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 20:43:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCykh3lw4zF1SB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 04:43:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCyhk1hT4zF15P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 04:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BCyhk0X3Rz8tT4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 04:41:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BCyhj6sZWz9sSt; Sat, 25 Jul 2020 04:41:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BCyhj03Gbz9sRK
 for <linuxppc-dev@ozlabs.org>; Sat, 25 Jul 2020 04:41:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BCyhY01t6z9v4fV;
 Fri, 24 Jul 2020 20:41:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id akcMa3G__NrR; Fri, 24 Jul 2020 20:41:16 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BCyhX67Mrz9v0k7;
 Fri, 24 Jul 2020 20:41:16 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 3DB015C6; Fri, 24 Jul 2020 20:42:34 +0200 (CEST)
Received: from 37.167.224.69 ([37.167.224.69]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Fri, 24 Jul 2020 20:42:34 +0200
Date: Fri, 24 Jul 2020 20:42:34 +0200
Message-ID: <20200724204234.Horde.hO-ZzrdZK2VFWG6f4BoOPg1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 5/9] powerpc/32s: Fix CONFIG_BOOK3S_601 uses
References: <20200724131728.1643966-1-mpe@ellerman.id.au>
 <20200724131728.1643966-5-mpe@ellerman.id.au>
In-Reply-To: <20200724131728.1643966-5-mpe@ellerman.id.au>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> We have two uses of CONFIG_BOOK3S_601, which doesn't exist. Fix them
> to use CONFIG_PPC_BOOK3S_601 which is the correct symbol.
>
> Fixes: 12c3f1fd87bf ("powerpc/32s: get rid of CPU_FTR_601 feature")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>
> I think the bug in get_cycles() at least demonstrates that no one has
> booted a 601 since v5.4. Time to drop 601?

Would be great.

I can submit a patch for that in August.

Christophe

> ---
>  arch/powerpc/include/asm/ptrace.h | 2 +-
>  arch/powerpc/include/asm/timex.h  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ptrace.h=20=20
>=20b/arch/powerpc/include/asm/ptrace.h
> index f194339cef3b..155a197c0aa1 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -243,7 +243,7 @@ static inline void set_trap_norestart(struct=20=20
>=20pt_regs *regs)
>  }
>
>  #define arch_has_single_step()	(1)
> -#ifndef CONFIG_BOOK3S_601
> +#ifndef CONFIG_PPC_BOOK3S_601
>  #define arch_has_block_step()	(true)
>  #else
>  #define arch_has_block_step()	(false)
> diff --git a/arch/powerpc/include/asm/timex.h=20=20
>=20b/arch/powerpc/include/asm/timex.h
> index d2d2c4bd8435..6047402b0a4d 100644
> --- a/arch/powerpc/include/asm/timex.h
> +++ b/arch/powerpc/include/asm/timex.h
> @@ -17,7 +17,7 @@ typedef unsigned long cycles_t;
>
>  static inline cycles_t get_cycles(void)
>  {
> -	if (IS_ENABLED(CONFIG_BOOK3S_601))
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
>  		return 0;
>
>  	return mftb();
> --
> 2.25.1


