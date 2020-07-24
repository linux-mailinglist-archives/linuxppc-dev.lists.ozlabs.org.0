Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EDF22C3AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 12:49:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCmDd6CLszF0c7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 20:49:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCmBY31TlzF0TM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 20:48:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cZVALkkN; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BCmBY1V52z9sSy;
 Fri, 24 Jul 2020 20:48:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595587685;
 bh=BiWI6Gx3zD+eYwA8dq9pKW2TfbxpbvO3yN7QDW+ASAM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cZVALkkNQ4Giu7I3ZcRlW/chIhziAs4RDawx6epmZy3RBhiXAW8LuEX1qVhQ/HXKI
 Z02vbouIRYr+mPIogt2YHWvIFTiWNvfGanpJ1DdljxFBwQRGqZFXWrx4BBXEyVRZhI
 1MQ6hfh8jmc/rPINiylTdUS15OJQo8TVcsUMoo0lqb7csbU3QdmtHMLyS9DWXksmAE
 XvyTW7lxQK+awJ4ynvQfRduSfPPTZ6zMEdBARkCWb8ygkxWtxSeyawaEMvgCOWnVAP
 D8g8OSRgjrg7gkkQI1VJSi6zPxC824ISTBcUvNivLoMXFq3Iv2szWODI6FIyYVmLsH
 oY3iGt76Sm1YQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bill Wendling <morbo@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v 1/1] powerpc/64s: allow for clang's objdump differences
In-Reply-To: <20200724001605.3718561-1-morbo@google.com>
References: <20200724001605.3718561-1-morbo@google.com>
Date: Fri, 24 Jul 2020 20:48:04 +1000
Message-ID: <87sgdhp4t7.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bill,

Bill Wendling <morbo@google.com> writes:
> Clang's objdump emits slightly different output from GNU's objdump,
> causing a list of warnings to be emitted during relocatable builds.
> E.g., clang's objdump emits this:
>
>    c000000000000004: 2c 00 00 48  b  0xc000000000000030
>    ...
>    c000000000005c6c: 10 00 82 40  bf 2, 0xc000000000005c7c
>
> while GNU objdump emits:
>
>    c000000000000004: 2c 00 00 48  b    c000000000000030 <__start+0x30>
>    ...
>    c000000000005c6c: 10 00 82 40  bne  c000000000005c7c <masked_interrupt+0x3c>
>
> Adjust llvm-objdump's output to remove the extraneous '0x' and convert
> 'bf' and 'bt' to 'bne' and 'beq' resp. to more closely match GNU
> objdump's output.
>
> Note that clang's objdump doesn't yet output the relocation symbols on
> PPC.
>
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  arch/powerpc/tools/unrel_branch_check.sh | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
> index 77114755dc6f..71ce86b68d18 100755
> --- a/arch/powerpc/tools/unrel_branch_check.sh
> +++ b/arch/powerpc/tools/unrel_branch_check.sh
> @@ -31,6 +31,9 @@ grep -e "^c[0-9a-f]*:[[:space:]]*\([0-9a-f][0-9a-f][[:space:]]\)\{4\}[[:space:]]
>  grep -v '\<__start_initialization_multiplatform>' |
>  grep -v -e 'b.\?.\?ctr' |
>  grep -v -e 'b.\?.\?lr' |
> +sed 's/\bbt.\?[[:space:]]*[[:digit:]][[:digit:]]*,/beq/' |
> +sed 's/\bbf.\?[[:space:]]*[[:digit:]][[:digit:]]*,/bne/' |
> +sed 's/[[:space:]]0x/ /' |
>  sed 's/://' |

I know you followed the example in the script of just doing everything
as a separate entry in the pipeline, but I think we could consolidate
all the seds into one?

eg:

sed -e 's/\bbt.\?[[:space:]]*[[:digit:]][[:digit:]]*,/beq/' \
    -e 's/\bbf.\?[[:space:]]*[[:digit:]][[:digit:]]*,/bne/' \
    -e 's/[[:space:]]0x/ /' \
    -e 's/://' |

Does that work?

cheers
