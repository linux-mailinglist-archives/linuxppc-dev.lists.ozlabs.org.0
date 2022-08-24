Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D859F8FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 14:05:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCPtJ3s9Lz3bnj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 22:05:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OLrsQWl/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCPsk3zgGz2yQg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:04:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OLrsQWl/;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MCPsc3cdHz4xD1;
	Wed, 24 Aug 2022 22:04:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661342676;
	bh=WM428CE5s0U9r/O9GiOUsKwL6c25jSBrRzJHiPzj84A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OLrsQWl/n2ijlRvq/291/832WLT445D/N7i44+XgW+IFjuqSvzv4k0ft7iRsRf5A7
	 g4Mib5ewxlxd5AMexZ+uUwm52vn/hHRznbMV6rG8we+Z1kDhE5OpjYcTMBVpMGb8rx
	 bz0+juDMjvv/iHC8LvMu2SDFawuGcb2rAcnA2BlsIuPHgFj0EjCPuII6lIC2C2x3mr
	 dZ7fVkJizgsh1Q1HjT9VbeVzuKeXxIH5P0maaUfaGFvCRmDERfliW2gSJIjAX42H6A
	 JK1FIfV3d1klbNw8XzwNxG0ASBkJipF08X073iB01Bey9044EBaOYayuJqjuZRWsAA
	 TnfPI8DBFLiEQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/rtas: Fix RTAS MSR[HV] handling for Cell
In-Reply-To: <ae28ea837d733d5bdb86c9c2e44c74808fa5ee8b.camel@gmail.com>
References: <20220823115952.1203106-1-mpe@ellerman.id.au>
 <20220823115952.1203106-2-mpe@ellerman.id.au>
 <ae28ea837d733d5bdb86c9c2e44c74808fa5ee8b.camel@gmail.com>
Date: Wed, 24 Aug 2022 22:04:30 +1000
Message-ID: <87bks9luep.fsf@mpe.ellerman.id.au>
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
Cc: rmclure@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> On Tue, 2022-08-23 at 21:59 +1000, Michael Ellerman wrote:
>> The semi-recent changes to MSR handling when entering RTAS (firmware)
>> cause crashes on IBM Cell machines. An example trace:
...
>> diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
>> index 9a434d42e660..6ce95ddadbcd 100644
>> --- a/arch/powerpc/kernel/rtas_entry.S
>> +++ b/arch/powerpc/kernel/rtas_entry.S
>> @@ -109,8 +109,12 @@ _GLOBAL(enter_rtas)
>>  	 * its critical regions (as specified in PAPR+ section 7.2.1). MSR[S]
>>  	 * is not impacted by RFI_TO_KERNEL (only urfid can unset it). So if
>>  	 * MSR[S] is set, it will remain when entering RTAS.
>> +	 * If we're in HV mode, RTAS must also run in HV mode, so extract MSR_HV
>> +	 * from the saved MSR value and insert into the value RTAS will use.
>>  	 */
>
> Interestingly it looks like these are the first uses of these extended
> mnemonics in the kernel?

We used to have at least one use I know of in TM code, but it's since
been converted to C.

>> +	extrdi	r0, r6, 1, 63 - MSR_HV_LG
>
> Or in non-mnemonic form...
> rldicl  r0, r6, 64 - MSR_HV_LG, 63

It's rldicl all the way down.

>>  	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI)
>> +	insrdi	r6, r0, 1, 63 - MSR_HV_LG
>
> Or in non-mnemonic form...
> rldimi	r6, r0, MSR_HV_LG, 63 - MSR_HV_LG

I think the extended mnemonics are slightly more readable than the
open-coded versions?

> It is ok to use r0 as a scratch register as it is loaded with 0 afterwards anyway.

I originally used r7, but r0 is more obviously safe.

>>
>>  	li      r0,0
>>  	mtmsrd  r0,1                    /* disable RI before using SRR0/1 */
>
> Reviewed-by: Jordan Niethe <jniethe5@gmail.com>

Thanks.

cheers
