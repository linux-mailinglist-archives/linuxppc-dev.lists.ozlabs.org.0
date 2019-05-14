Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C391C392
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 09:01:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4537rP53d2zDq9J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 17:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4537kY4byZzDqJk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 16:56:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4537kY0Mcqz9sML;
 Tue, 14 May 2019 16:56:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Vitaly Bordug <vitb@kernel.crashing.org>,
 Scott Wood <oss@buserror.net>
Subject: Re: [PATCH 2/2] powerpc/8xx: Add microcode patch to move SMC
 parameter RAM.
In-Reply-To: <dd715639629639505ef4edd36d5a1aa4361e6edf.1557487355.git.christophe.leroy@c-s.fr>
References: <35488171038e3d40e7680b8513dfbd52ff7b6ef2.1557487355.git.christophe.leroy@c-s.fr>
 <dd715639629639505ef4edd36d5a1aa4361e6edf.1557487355.git.christophe.leroy@c-s.fr>
Date: Tue, 14 May 2019 16:56:04 +1000
Message-ID: <87a7fptth7.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Some SCC functions like the QMC requires an extended parameter RAM.
> On modern 8xx (ie 866 and 885), SPI area can already be relocated,
> allowing the use of those functions on SCC2. But SCC3 and SCC4
> parameter RAM collide with SMC1 and SMC2 parameter RAMs.
>
> This patch adds microcode to allow the relocation of both SMC1 and
> SMC2, and relocate them at offsets 0x1ec0 and 0x1fc0.
> Those offsets are by default for the CPM1 DSP1 and DSP2, but there
> is no kernel driver using them at the moment so this area can be
> reused.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/platforms/8xx/Kconfig      |   7 ++
>  arch/powerpc/platforms/8xx/micropatch.c | 109 +++++++++++++++++++++++++++++++-
>  2 files changed, 114 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
> index 33a9042fca80..dc4423daf7d4 100644
> --- a/arch/powerpc/platforms/8xx/micropatch.c
> +++ b/arch/powerpc/platforms/8xx/micropatch.c
> @@ -622,6 +622,86 @@ static uint patch_2f00[] __initdata = {
>  };
>  #endif
>  
> +/*
> + * SMC relocation patch arrays.
> + */
> +
> +#ifdef CONFIG_SMC_UCODE_PATCH
> +
> +static uint patch_2000[] __initdata = {
> +	0x3fff0000, 0x3ffd0000, 0x3ffb0000, 0x3ff90000,
> +	0x5fefeff8, 0x5f91eff8, 0x3ff30000, 0x3ff10000,
> +	0x3a11e710, 0xedf0ccb9, 0xf318ed66, 0x7f0e5fe2,

Do we have any doc on what these values are?

I get that it's microcode but do we have any more detail than that?
What's the source etc?

cheers
