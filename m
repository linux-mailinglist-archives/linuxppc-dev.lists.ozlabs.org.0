Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2872A618DD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:35:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hp0p3kClzDqC3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:35:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hnft15T8zDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hnfs0rpPz9sP6; Mon,  8 Jul 2019 11:19:32 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 22e9c88d486a0536d337d6e0973968be0a4cd4b2
In-Reply-To: <d6f628ffdeb9c7863da722a8f6ef2949e57bb360.1557824379.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Oliver O'Halloran <oohall@gmail.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 4/4] powerpc/64: reuse PPC32 static inline
 flush_dcache_range()
Message-Id: <45hnfs0rpPz9sP6@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:32 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-05-14 at 09:05:16 UTC, Christophe Leroy wrote:
> This patch drops the assembly PPC64 version of flush_dcache_range()
> and re-uses the PPC32 static inline version.
> 
> With GCC 8.1, the following code is generated:
> 
> void flush_test(unsigned long start, unsigned long stop)
> {
> 	flush_dcache_range(start, stop);
> }
> 
> 0000000000000130 <.flush_test>:
>  130:	3d 22 00 00 	addis   r9,r2,0
> 			132: R_PPC64_TOC16_HA	.data+0x8
>  134:	81 09 00 00 	lwz     r8,0(r9)
> 			136: R_PPC64_TOC16_LO	.data+0x8
>  138:	3d 22 00 00 	addis   r9,r2,0
> 			13a: R_PPC64_TOC16_HA	.data+0xc
>  13c:	80 e9 00 00 	lwz     r7,0(r9)
> 			13e: R_PPC64_TOC16_LO	.data+0xc
>  140:	7d 48 00 d0 	neg     r10,r8
>  144:	7d 43 18 38 	and     r3,r10,r3
>  148:	7c 00 04 ac 	hwsync
>  14c:	4c 00 01 2c 	isync
>  150:	39 28 ff ff 	addi    r9,r8,-1
>  154:	7c 89 22 14 	add     r4,r9,r4
>  158:	7c 83 20 50 	subf    r4,r3,r4
>  15c:	7c 89 3c 37 	srd.    r9,r4,r7
>  160:	41 82 00 1c 	beq     17c <.flush_test+0x4c>
>  164:	7d 29 03 a6 	mtctr   r9
>  168:	60 00 00 00 	nop
>  16c:	60 00 00 00 	nop
>  170:	7c 00 18 ac 	dcbf    0,r3
>  174:	7c 63 42 14 	add     r3,r3,r8
>  178:	42 00 ff f8 	bdnz    170 <.flush_test+0x40>
>  17c:	7c 00 04 ac 	hwsync
>  180:	4c 00 01 2c 	isync
>  184:	4e 80 00 20 	blr
>  188:	60 00 00 00 	nop
>  18c:	60 00 00 00 	nop
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/22e9c88d486a0536d337d6e0973968be0a4cd4b2

cheers
