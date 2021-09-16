Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89F40D3AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 09:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H97hp2zwkz306K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 17:18:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4H97hK2hKHz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 17:17:36 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 18G7FGqQ031443;
 Thu, 16 Sep 2021 02:15:17 -0500
Message-ID: <2c0fd775625c76c4dd09b3e923da4405a003f3bd.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: warn on emulation of dcbz instruction
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 16 Sep 2021 17:15:16 +1000
In-Reply-To: <62b33ca839f3d1d7d4b64b6f56af0bbe4d2c9057.1631716292.git.christophe.leroy@csgroup.eu>
References: <62b33ca839f3d1d7d4b64b6f56af0bbe4d2c9057.1631716292.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Finn Thain <fthain@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Stan Johnson <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-09-15 at 16:31 +0200, Christophe Leroy wrote:
> dcbz instruction shouldn't be used on non-cached memory. Using
> it on non-cached memory can result in alignment exception and
> implies a heavy handling.
> 
> Instead of silentely emulating the instruction and resulting in high
> performance degradation, warn whenever an alignment exception is
> taken due to dcbz, so that the user is made aware that dcbz
> instruction has been used unexpectedly.
> 
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/align.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/align.c
> b/arch/powerpc/kernel/align.c
> index bbb4181621dd..adc3a4a9c6e4 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -349,6 +349,7 @@ int fix_alignment(struct pt_regs *regs)
>  		if (op.type != CACHEOP + DCBZ)
>  			return -EINVAL;
>  		PPC_WARN_ALIGNMENT(dcbz, regs);
> +		WARN_ON_ONCE(1);

This is heavy handed ... It will be treated as an oops by various
things uselessly spit out a kernel backtrace. Isn't PPC_WARN_ALIGNMENT
enough ?

Ben.


