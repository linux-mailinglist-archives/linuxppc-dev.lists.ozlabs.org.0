Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 030FC7F2E2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 14:20:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wfuz47fA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZQ3R6NqFz3d9q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 00:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wfuz47fA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZQ2b3NnZz3cNQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 00:19:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC63FCE1BB6;
	Tue, 21 Nov 2023 13:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83650C433C8;
	Tue, 21 Nov 2023 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700572768;
	bh=+zbYVpyoX77q+BR+PDZ9yD6AHd5Tt4UDqw9YHNJ+1ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wfuz47fALq7hw0yMEVncCIzhGytK4r0e/+0iRQWb40neV80ynYcputp5Oi1rdiaEY
	 NxWxVI5jvEvnuFMoYj4ALoq3lFqtfEGpiUDcESwzfQ2ZB5eTiXAO7fwL5xsYbPbozh
	 eakgvRdPBshW8JiqX7me5wleUmTNlUlpNYpfAw/S8XM4atxe8HPHgzt8bzSBptrEI9
	 Retz4vuWKxvDwKTaLDrBQwFmH6mOHcDb5SOrho7IpUtfCrBQ+MnYQKf+ftfei7JdG+
	 jASMQukwtDwiv/SPcKkuOB9ytsB3SMcWG6GwMgfBUnDdaV5ii9WzH6vlweOXcyXcSP
	 Az4I4lpjM1cxA==
Date: Tue, 21 Nov 2023 18:42:35 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/lib: Avoid array bounds warnings in vec ops
Message-ID: <i4zq3tg6gwaptnuoq2ainowffvkols2k5x7rads473zn55r27y@cvdy5yvkmj2p>
References: <20231120235436.1569255-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120235436.1569255-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, gustavo@embeddedor.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 10:54:36AM +1100, Michael Ellerman wrote:
> Building with GCC 13 (which has -array-bounds enabled) there are several

Thanks, gcc13 indeed helps reproduce the warnings.

> warnings in sstep.c along the lines of:
> 
>   In function ‘do_byte_reverse’,
>       inlined from ‘do_vec_load’ at arch/powerpc/lib/sstep.c:691:3,
>       inlined from ‘emulate_loadstore’ at arch/powerpc/lib/sstep.c:3439:9:
>   arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array bounds of ‘u8[16]’ {aka ‘unsigned char[16]’} [-Werror=array-bounds=]
>     289 |                 up[2] = byterev_8(up[1]);
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~
>   arch/powerpc/lib/sstep.c: In function ‘emulate_loadstore’:
>   arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object ‘u’ of size 16
>     681 |         } u = {};
>         |           ^
> 
> do_byte_reverse() supports a size up to 32 bytes, but in these cases the
> caller is only passing a 16 byte buffer. In practice there is no bug,
> do_vec_load() is only called from the LOAD_VMX case in emulate_loadstore().
> That in turn is only reached when analyse_instr() recognises VMX ops,
> and in all cases the size is no greater than 16:
> 
>   $ git grep -w LOAD_VMX arch/powerpc/lib/sstep.c
>   arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 1);
>   arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 2);
>   arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 4);
>   arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 16);
> 
> Similarly for do_vec_store().
> 
> Although the warning is incorrect, the code would be safer if it clamped
> the size from the caller to the known size of the buffer. Do that using
> min_t().

But, do_vec_load() and do_vec_store() assume that the maximum size is 16 
(the address_ok() check as an example). So, should we be considering a 
bigger hammer to help detect future incorrect use?

Something like the below?

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a4ab8625061a..ac22136032b8 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -680,6 +680,9 @@ static nokprobe_inline int do_vec_load(int rn, unsigned long ea,
                u8 b[sizeof(__vector128)];
        } u = {};
 
+       if (WARN_ON_ONCE(size > sizeof(u)))
+               return -EINVAL;
+
        if (!address_ok(regs, ea & ~0xfUL, 16))
                return -EFAULT;
        /* align to multiple of size */
@@ -707,6 +710,9 @@ static nokprobe_inline int do_vec_store(int rn, unsigned long ea,
                u8 b[sizeof(__vector128)];
        } u;
 
+       if (WARN_ON_ONCE(size > sizeof(u)))
+               return -EINVAL;
+
        if (!address_ok(regs, ea & ~0xfUL, 16))
                return -EFAULT;
        /* align to multiple of size */


- Naveen

