Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4905BB6AF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 08:37:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MV1T25qhXz3c23
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 16:37:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=olgxC1QJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MV1SS51Cwz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 16:36:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=olgxC1QJ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MV1SQ6z6Sz4xD1;
	Sat, 17 Sep 2022 16:36:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663396615;
	bh=83TuWJnJ4LAwUTVqi5WLHgvtBfN7qAOSVTKsDNRBZ38=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=olgxC1QJs4bgYHa3cI5qQ43mnhiLHFtzc5kbZjLsatCYiYVXUdgq7+KOhoQ4Kx6qK
	 ncgViKZVhr0/evSNVyGT/tLUrQcsT8NcIsNBggvgXnw/NHR/KrksRFk7BTqRB5/+Yr
	 ZlRXRcrZhL/el9X9ZYQwnUcKVBCc63aNm/M3aX0rvYzdkCVsFNB8xUIUPidDYBey0x
	 93OvkJWmQofNwbfYdh/1otWRztMlTfv613mM7DjUXQi58zmM2R/9Xro/fdTgdXY9Xi
	 8Ra1NBOqwpdrDeGtFNlrqI4Ufvezx0CKBuiRvu/NVixvwMuZ83W2/d4fOuxnBpN0r/
	 t995IdXQcURCA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 6/7] powerpc/64/build: merge .got and .toc input
 sections
In-Reply-To: <d54b206c-0254-9def-d558-50c82a89f461@csgroup.eu>
References: <20220916040755.2398112-1-npiggin@gmail.com>
 <20220916040755.2398112-7-npiggin@gmail.com>
 <d54b206c-0254-9def-d558-50c82a89f461@csgroup.eu>
Date: Sat, 17 Sep 2022 16:36:54 +1000
Message-ID: <87sfkqld6h.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 16/09/2022 =C3=A0 06:07, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Follow the binutils ld internal linker script and merge .got and .toc
>> input sections in the .got output section.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kernel/vmlinux.lds.S | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vml=
inux.lds.S
>> index 737825ae2ae0..3d96d51c8a5f 100644
>> --- a/arch/powerpc/kernel/vmlinux.lds.S
>> +++ b/arch/powerpc/kernel/vmlinux.lds.S
>> @@ -169,13 +169,12 @@ SECTIONS
>>   	}
>>=20=20=20
>>   	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
>> -		*(.got)
>> +		*(.got .toc)
>
> At the begining I was thinking that this change would jeopardise the=20
> below, but in fact the #ifdef below is pointless, because prom_init.o is=
=20
> built only when CONFIG_PPC_OF_BOOT_TRAMPOLINE is selected but=20
> CONFIG_PPC_OF_BOOT_TRAMPOLINE selects CONFIG_RELOCATABLE
>
> So all __prom_init_toc_ stuff can go away :
>
> arch/powerpc/include/asm/sections.h:extern char __prom_init_toc_start[];
> arch/powerpc/include/asm/sections.h:extern char __prom_init_toc_end[];
> arch/powerpc/kernel/prom_init_check.sh:__prom_init_toc_start=20
> __prom_init_toc_end btext_setup_display TOC.
> arch/powerpc/kernel/vmlinux.lds.S:              __prom_init_toc_start =3D=
 .;
> arch/powerpc/kernel/vmlinux.lds.S:              __prom_init_toc_end =3D .;

Yes you're right.

Missed cleanup by me in 24d33ac5b8ff ("powerpc/64s: Make prom_init require =
RELOCATABLE").

I'll send a patch tomorrow.

cheers
