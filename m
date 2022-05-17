Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0973852A194
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 14:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bB46vQ2z3cFx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 22:33:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CN6Ir2m2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2b9R31pbz3bq9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 22:32:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CN6Ir2m2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L2b9Q5m93z4xPw;
 Tue, 17 May 2022 22:32:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652790747;
 bh=iPn8VpjXT6Fw2nPlyJsc7Kml1uDcPFQ9flf3qBEJjjY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CN6Ir2m2QxZ5YIVr+X6179Lq5og6ehnVebKFaHrKeLRp3PNZ3cAt7Z0ek42j+wGZD
 6RwDDNu0d9iM6Dr8/uj48TcauQ4F8h0zaNuWZnt9oV65JA6cEZydJnMSMjkLqhB9QG
 7sp3/3gg/YcLw5gQGJy9qP8TVOt8OaBGNo1qySqz0JnnNyHt/HHUQZvonAUXfw5hoN
 a7bqbyXiUkctZldrR9BeTu99bCY6m/w6flr6zBPqFKBISVKGsrV++rteckMpNQpTni
 H+plD+PJEBVUYtoO6wAuHETdDwlzJdySk+PnEkDarFmZa28w4Ux7W+2oSFc80MBv75
 16iYR2GxBDOEQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
In-Reply-To: <1652772528.r6qrwbbda5.naveen@linux.ibm.com>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
 <1652772528.r6qrwbbda5.naveen@linux.ibm.com>
Date: Tue, 17 May 2022 22:32:09 +1000
Message-ID: <877d6kpcfq.fsf@mpe.ellerman.id.au>
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
Cc: amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
> Michael Ellerman wrote:
>>
>> diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
>> index eb9c81e1c218..0aee255e9cbb 100644
>> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
>> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
>> @@ -22,12 +22,15 @@
>>  .macro cvdso_call funct call_time=0
>>    .cfi_startproc
>>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>>  	mflr		r0
>> -  .cfi_register lr, r0
>>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>>  	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
>
> <snip>
>
>> @@ -46,6 +50,7 @@
>>  	mtlr		r0
>>    .cfi_restore lr
>>  	addi		r1, r1, 2 * PPC_MIN_STKFRM
>> +  .cfi_def_cfa_offset 0
>
> Should this be .cfi_adjust_cfa_offset, given that we used that at the
> start of the function?
 
AIUI "adjust x" is offset += x, whereas "def x" is offset = x.

So we could use adjust here, but we'd need to adjust by -(2 * PPC_MIN_STKFRM).

It seemed clearer to just set the offset back to 0, which is what it is
at the start of the function.

But I'm not a CFI expert at all, so I'll defer to anyone else who has an
opinion :)

cheers
