Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A91BF1D607F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 13:10:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PMyg1Kv4zDqvv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 21:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PMw65fWKzDqv4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 21:08:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N5FM2SDh; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49PMw42VYhz9sTC;
 Sat, 16 May 2020 21:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589627317;
 bh=xlRNdRKSs/1yt1XjZFyjzh4ZEGwNAvgrgcBi/dIj1sI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N5FM2SDhMEb3SpS16IWnzFxziXzH5MVUA9xzS6m/PFlG/VahrAZgwTLyGHOQ3HDkd
 eGBME/pgAkKCgcXhIKAjXpyVSbfJ5wsZ4rBYS3869ojTG2T/k7y3vW3ZhK0dJXauQg
 cs/YfaK5EoWTZsGIkrjH07PLO9KCxfRYwwhQJ1X4bkj3dRxun1E1TEdkdOKlOD4Buc
 0FtkLBg0htXzrwwVOL1SHQIPd50vGDpQcHJfs7Gi19KYp8shU9LrzOR5B4GSFLfN7Y
 RJrZxqyCSVGkrnt/xFRKbeuFcpKTOrS+8n4T0yVIFhiHX6+PQcaXh2DHxoMJI0Y1ih
 tzQPi1Wi4gB/Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 08/30] powerpc: Use a function for getting the
 instruction op code
In-Reply-To: <CACzsE9o0DNZ+fwO4Zh-oUp8B+zMukXAr_bicCi0V5PYcnJO7_A@mail.gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-9-jniethe5@gmail.com>
 <CACzsE9o0DNZ+fwO4Zh-oUp8B+zMukXAr_bicCi0V5PYcnJO7_A@mail.gmail.com>
Date: Sat, 16 May 2020 21:08:56 +1000
Message-ID: <87v9kw9lx3.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> mpe, as suggested by Christophe could you please add this.

I did that and ...

> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -2,6 +2,8 @@
>  #ifndef _ASM_INST_H
>  #define _ASM_INST_H
>
> +#include <asm/disassemble.h>

.. this eventually breaks the build in some driver, because get_ra() is
redefined.

So I've backed out this change for now.

If we want to use the macros in disassemble.h we'll need to namespace
them better, eg. make them ppc_get_ra() and so on.

cheers

>  /*
>   * Instruction data type for POWER
>   */
> @@ -15,7 +17,7 @@ static inline u32 ppc_inst_val(u32 x)
>
>  static inline int ppc_inst_primary_opcode(u32 x)
>  {
> -    return ppc_inst_val(x) >> 26;
> +    return get_op(ppc_inst_val(x));
>  }
>
>  #endif /* _ASM_INST_H */
> -- 
> 2.17.1
