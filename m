Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CB8B9378
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 04:49:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DFAmDOHK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVJL63Ck9z3cW7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 12:49:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DFAmDOHK;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVJKL2mlHz3cSK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 12:48:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714618114;
	bh=LrVjbcwBL6zqpz2GG6XF8+fyAJ6JNCKelE3eQyc4qns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DFAmDOHKbB0/pXHOtl1L1kb9Za3gqyI12JbPRfI06fypIE/4Z2D6OfqiCXiPouTAP
	 Kf+S2wi/H2umKd0qRPfHrYYe911aKVxBmQPdXVAWX4SfPgcxwhDDXWMKiFUqim0CGQ
	 LLo3Uu8pKCyfY3CXqatAhzgMQZBNaki6OMNtMxmzftCGOfRpBMuKnA+3pAg8ry+ptm
	 4TsScYial9tXade9MIURQjYPpMwSU0VrkklYW8aRHuzTEiCO0/pw/2sQW6kpRWFF+e
	 aREwi066iccvWuMO3V5ckfoo4aPNPbgWj+a5RCtOLqTgJcrSo63/44l/TK0cdXenwU
	 mOJajHxCpdj8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VVJKG2ZdYz4x0C;
	Thu,  2 May 2024 12:48:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] powerpc: Set _IO_BASE to POISON_POINTER_DELTA not 0 for
 CONFIG_PCI=n
In-Reply-To: <20240501162056.GA2458112@dev-arch.thelio-3990X>
References: <20240430140440.200871-1-mpe@ellerman.id.au>
 <20240501162056.GA2458112@dev-arch.thelio-3990X>
Date: Thu, 02 May 2024 12:48:31 +1000
Message-ID: <87y18tc4jk.fsf@mail.lhotse>
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
Cc: naresh.kamboju@linaro.org, linuxppc-dev@lists.ozlabs.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> Hi Michael,
>
> On Wed, May 01, 2024 at 12:04:40AM +1000, Michael Ellerman wrote:
...
>> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
>> index 08c550ed49be..1cd6eb6c8101 100644
>> --- a/arch/powerpc/include/asm/io.h
>> +++ b/arch/powerpc/include/asm/io.h
>> @@ -37,7 +37,7 @@ extern struct pci_dev *isa_bridge_pcidev;
>>   * define properly based on the platform
>>   */
>>  #ifndef CONFIG_PCI
>> -#define _IO_BASE	0
>> +#define _IO_BASE	POISON_POINTER_DELTA
>
> This works for CONFIG_PPC64 but not CONFIG_PPC32 (so tinyconfig and
> allnoconfig like Naresh reported) because CONFIG_ILLEGAL_POINTER_VALUE
> is defined as 0 in that case.
>
>   $ grep -P 'CONFIG_(ILLEGAL_POINTER_VALUE|PCI|PPC32)' .config
>   CONFIG_PPC32=y
>   CONFIG_ILLEGAL_POINTER_VALUE=0

:facepalm:

Looks like we can fix the compiler warnings just by doing the arithmetic
before casting to void *. I'll send a v2.

cheers
