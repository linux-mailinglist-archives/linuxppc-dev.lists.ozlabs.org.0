Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDA01F5342
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:33:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hlGr4rtHzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:33:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hkKX1GLJzDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 20:50:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ELYaS5r+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49hkKW2Mx2z9sQx;
 Wed, 10 Jun 2020 20:50:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591786223;
 bh=N/f4Suhgc7bFNxR90vjogtkFPQXJVa9a3c+PtUPM2ys=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ELYaS5r+W8UFB27PlzXSY/+DAHWj5iaGQzZTuZhQMBJw47c0RiUPE3X9LfJSDS9TE
 SWfYz1WHJuBt8DJoSCDQm1DiHyeJC1hVkZl7iZbLiDultZnJOPiy1JU3GoefgsvDLD
 1A1boa5/gfBx0Ql5mDk9halxkt2jM5nN+Nx0cNrJBhVvWcV7MXVwZeU6DTzEZZtaG0
 bHGRPoUczlPgUZufLCJU9Ng0TE0Fzcdd15/I3l2L0dk9GnIOmjRNa4/jYJwaR6VlMs
 dzJsGZlDTLtJveSt7ZD+JbBnenngo3H+Rl6A7oiQT9xPp1p7lIVQOndlo3uNafYCM2
 eJXGgix9THv0Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Balamuruhan S <bala24@linux.ibm.com>
Subject: Re: [PATCH 1/6] powerpc/ppc-opcode: introduce PPC_RAW_* macros for
 base instruction encoding
In-Reply-To: <20200526081523.92463-2-bala24@linux.ibm.com>
References: <20200526081523.92463-1-bala24@linux.ibm.com>
 <20200526081523.92463-2-bala24@linux.ibm.com>
Date: Wed, 10 Jun 2020 20:50:49 +1000
Message-ID: <87mu5bfb3q.fsf@mpe.ellerman.id.au>
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balamuruhan S <bala24@linux.ibm.com> writes:
> Introduce PPC_RAW_* macros to have all the bare encoding of ppc
> instructions. Move `VSX_XX*()` and `TMRN()` macros up to reuse it.
>
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h | 183 ++++++++++++++++++++++++--
>  1 file changed, 175 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
> index 2a39c716c343..e3540be1fc17 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -431,6 +431,181 @@
>  #define __PPC_EH(eh)	0
>  #endif
>  
> +/* Base instruction encoding */
> +#define PPC_RAW_CP_ABORT		(PPC_INST_CP_ABORT)
> +#define PPC_RAW_COPY(a, b)		(PPC_INST_COPY | ___PPC_RA(a) | \
> +						___PPC_RB(b))
> +#define PPC_RAW_DARN(t, l)		(PPC_INST_DARN | ___PPC_RT(t) | \
> +						(((l) & 0x3) << 16))

I know you're copying the existing formatting by wrapping these lines,
but please don't.

It hurts rather than improves readability.

For a line like the one above, just let it be long, eg:

#define PPC_RAW_DARN(t, l)		(PPC_INST_DARN | ___PPC_RT(t) | (((l) & 0x3) << 16))

Yeah it's 91 columns but who cares.

For the really long ones like:

> +#define PPC_RAW_TLBIE_5(rb, rs, ric, prs, r) \
> +					(PPC_INST_TLBIE | \
> +						___PPC_RB(rb) | \
> +						___PPC_RS(rs) | \
> +						___PPC_RIC(ric) | \
> +						___PPC_PRS(prs) | \
> +						___PPC_R(r))

I think this is the best option:

#define PPC_RAW_TLBIE_5(rb, rs, ric, prs, r) \
	(PPC_INST_TLBIE | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))


Which is long, but I don't think wrapping it helps.

If we didn't have those ridiculous ___PPC_RX macros it would be a bit
shorter, but I guess that's a rework for another day.


cheers
