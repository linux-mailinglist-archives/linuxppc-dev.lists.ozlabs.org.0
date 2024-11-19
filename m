Return-Path: <linuxppc-dev+bounces-3430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C6F9D1ED2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 04:27:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xsqgj0d3Vz2yYf;
	Tue, 19 Nov 2024 14:27:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731986865;
	cv=none; b=kp76lmMJtA92oq+jSr8ARHdsSVy8CJIzKYcOLXhhjp/aTacfI8npnVarsIHFFDn3KYpu7cOIM9hJZP/igwgkRSjLmi03R8NAP/KeBzrfP+/LW5e5URMy65VMA6Nv0UBypdGn8fnnT/GYMZaPPFLM+tbvQKGSTRjmkaf42YWi1mOacVXJ9Pbsi1bZq2eYtjz3LK1YLHYVHFN+qrVepyyyVYOZMzgPDuF4R26rNYKpBLnRox0z2MtJSTnh3BPthZmSkQm7g+gWi8IMlul2qxPcC0drQ/IHK+v7204qGVGHggA832N3Oq/KaS6eJ0NxGkfTQ2Y56IDBiW8Ie3CapnU1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731986865; c=relaxed/relaxed;
	bh=Y/InxUQQ7tYIxZKtHZZnpkjMoI3GWN9si3qSB5sztRA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yp4LYIMHgzQm8n8/iKnkxT2VyRXSIfkgNMlY40nzu2UfvHBcwFzCpsgv8WcEqNbDmwHnSf45NhM2FxhDzXCTI/eaTpgT1cICdiov5VU+Oib2pTfTzeqXLl7AX7rbuAcKdA3ZyJYJN2+agEzqEVWp7Hjc/60ItE03Cxr5uJT1XAKNiEzz5E7gI762BQQfBlkmS2chT3j98nRYuyLTu+7kpKdmKVVCBGXYJiu34yWrb1FmmRwDHH2r+LKgZeUDVNVozjDlscn3GKGG+NcCe8Hu2lVK/HWTZyr+pOHtTNnasLYg87a2bqfu0TsvazlYfjy6v+nqXSeGkY56aNHg+N5krg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FxYezFSq; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FxYezFSq;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xsqgh30kVz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 14:27:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731986861;
	bh=Y/InxUQQ7tYIxZKtHZZnpkjMoI3GWN9si3qSB5sztRA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FxYezFSqu4Z2+yPML76KnycCnPWSNxk7enQ/mkkSeV3P81wOjf131O21hWV9knaRA
	 nzAQKl9UVd4utpK38lcLmkVFZZQKJBMFO7oBNvaG5IpFUQErlFQnpf2G6XJoDQPLym
	 BGt6Nv4ohHDoNW7z7Buz7aJf07G13xGki7k/naS56bOtldqWRBfC1nakTm6bNytyuL
	 IinKS/x5VTvPOwhko9c83fxTYlqUs2UPCyOH/tAgbzRIsyjnNzw/ObbBzMKNYFNELy
	 yc695Ci/THzUSgYminpJJD5z6oh78PTRj/+plW0SI69uhh48Zh0Tqpbmm01dXq2Zjh
	 PRoBiYJHTghZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xsqgc4FXmz4xfX;
	Tue, 19 Nov 2024 14:27:40 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org, arnd@arndb.de
Subject: Re: [RFC PATCH 02/10] powerpc/chrp: Remove various dead code
In-Reply-To: <c00a229c-9ced-4a28-9666-b4707f317c90@csgroup.eu>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241114131114.602234-2-mpe@ellerman.id.au>
 <c00a229c-9ced-4a28-9666-b4707f317c90@csgroup.eu>
Date: Tue, 19 Nov 2024 14:27:43 +1100
Message-ID: <874j43j428.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 14/11/2024 =C3=A0 14:11, Michael Ellerman a =C3=A9crit=C2=A0:
>> Remove various bits of code that are dead now that PPC_CHRP has been
>> removed.
>>=20
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/Kconfig                 |  5 +--
>>   arch/powerpc/boot/Makefile           |  1 -
>>   arch/powerpc/include/asm/processor.h |  6 ---
>>   arch/powerpc/kernel/head_book3s_32.S | 12 ------
>>   arch/powerpc/kernel/pci_32.c         |  2 +-
>>   arch/powerpc/kernel/prom_init.c      | 56 ----------------------------
>>   6 files changed, 3 insertions(+), 79 deletions(-)
>>=20
>
>> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/=
head_book3s_32.S
>> index cb2bca76be53..c6e297fd36e2 100644
>> --- a/arch/powerpc/kernel/head_book3s_32.S
>> +++ b/arch/powerpc/kernel/head_book3s_32.S
>> @@ -256,20 +256,8 @@ __secondary_hold_acknowledge:
>>    */
>>   	START_EXCEPTION(INTERRUPT_MACHINE_CHECK, MachineCheck)
>>   	EXCEPTION_PROLOG_0
>> -#ifdef CONFIG_PPC_CHRP
>> -	mtspr	SPRN_SPRG_SCRATCH2,r1
>> -	mfspr	r1, SPRN_SPRG_THREAD
>> -	lwz	r1, RTAS_SP(r1)
>> -	cmpwi	cr1, r1, 0
>> -	bne	cr1, 7f
>> -	mfspr	r1, SPRN_SPRG_SCRATCH2
>> -#endif /* CONFIG_PPC_CHRP */
>>   	EXCEPTION_PROLOG_1
>>   7:	EXCEPTION_PROLOG_2 0x200 MachineCheck
>> -#ifdef CONFIG_PPC_CHRP
>> -	beq	cr1, 1f
>> -	twi	31, 0, 0
>> -#endif
>>   1:	prepare_transfer_to_handler
>>   	bl	machine_check_exception
>>   	b	interrupt_return
>
> Then it becomes a standard exception handler that can be set up with
>
> 	EXCEPTION(INTERRUPT_MACHINE_CHECK, MachineCheck, machine_check_exception)

Ack. And I checked the asm output is identical.

> And the comment from paulus voids.

Thanks.

cheers

