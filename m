Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042631F309
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 00:26:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhW722KrCz30Q7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 10:26:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d+H+3aD3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=d+H+3aD3; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhW6b3fKgz30M5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 10:25:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhW6R5dFBz9sRf;
 Fri, 19 Feb 2021 10:25:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613690751;
 bh=A1iDnApn4p2Z12QdBdv2P7fNoz8em07L6TSmnSqkJLE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=d+H+3aD3vrGvOJzWUBDb39y3WRwRDfLdaUcI7zbVOp8cIPktWv9phkRNnynLcQTG0
 cStJlSnpCujmFcDJPthlu8FnjlOjZFeBKiNtiZhPAO2C47V7n1KzGwoDGHPH2dR5T7
 y3+88o+wI35lGenhmTXnsjaNQiMxMemKosnAgnpSE5n6BDe7Lr4mnb7xmXODXVBNWV
 AYblEok/K3fTc9wh5eFwRu2E6gKRBsxUQ1NHhpy0VSns+xOuURWlUyQltXk9jLko6r
 0PsmLF2KpNviVGUhI18MA2H+5pBJ20fP5KdPIKZ5gvg953L/E+LjVhBi8To/lc2lB5
 hx/kZerTVeaHw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/6] powerpc/pseries: Add key to flags in
 pSeries_lpar_hpte_updateboltedpp()
In-Reply-To: <87tuqca7vi.fsf@linkitivity.dja.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-2-mpe@ellerman.id.au>
 <87tuqca7vi.fsf@linkitivity.dja.id.au>
Date: Fri, 19 Feb 2021 10:25:50 +1100
Message-ID: <87tuq9t0u9.fsf@mpe.ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>
>> The flags argument to plpar_pte_protect() (aka. H_PROTECT), includes
>> the key in bits 9-13, but currently we always set those bits to zero.
>>
>> In the past that hasn't been a problem because we always used key 0
>> for the kernel, and updateboltedpp() is only used for kernel mappings.
>>
>> However since commit d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3
>> for kernel mapping with hash translation") we are now inadvertently
>> changing the key (to zero) when we call plpar_pte_protect().
>>
>> That hasn't broken anything because updateboltedpp() is only used for
>> STRICT_KERNEL_RWX, which is currently disabled on 64s due to other
>> bugs.
>>
>> But we want to fix that, so first we need to pass the key correctly to
>> plpar_pte_protect(). In the `newpp` value the low 3 bits of the key
>> are already in the correct spot, but the high 2 bits of the key need
>> to be shifted down.
>>
>> Fixes: d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3 for kernel mappin=
g with hash translation")
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/platforms/pseries/lpar.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platfo=
rms/pseries/lpar.c
>> index 764170fdb0f7..8bbbddff7226 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -976,11 +976,13 @@ static void pSeries_lpar_hpte_updateboltedpp(unsig=
ned long newpp,
>>  	slot =3D pSeries_lpar_hpte_find(vpn, psize, ssize);
>>  	BUG_ON(slot =3D=3D -1);
>>=20=20
>> -	flags =3D newpp & 7;
>> +	flags =3D newpp & (HPTE_R_PP | HPTE_R_N);
>>  	if (mmu_has_feature(MMU_FTR_KERNEL_RO))
>>  		/* Move pp0 into bit 8 (IBM 55) */
>>  		flags |=3D (newpp & HPTE_R_PP0) >> 55;
>>=20=20
>> +	flags |=3D ((newpp & HPTE_R_KEY_HI) >> 48) | (newpp & HPTE_R_KEY_LO);
>> +
>
> I'm really confused about how these bits are getting packed into the
> flags parameter. It seems to match how they are unpacked in
> kvmppc_h_pr_protect, but I cannot figure out why they are packed in that
> order, and the LoPAR doesn't seem especially illuminating on this topic
> - although I may have missed the relevant section.

Yeah I agree it's not very clearly specified.

The hcall we're using here is H_PROTECT, which is specified in section
14.5.4.1.6 of LoPAPR v1.1.

It takes a `flags` parameter, and the description for flags says:

 * flags: AVPN, pp0, pp1, pp2, key0-key4, n, and for the CMO
   option: CMO Option flags as defined in Table 189=E2=80=9A


If you then go to the start of the parent section, 14.5.4.1, on page
405, it says:

Register Linkage (For hcall() tokens 0x04 - 0x18)
 * On Call
   * R3 function call token
   * R4 flags (see Table 178=E2=80=9A =E2=80=9CPage Frame Table Access flag=
s field definition=E2=80=9A=E2=80=9D on page 401)


Then you have to go to section 14.5.3, and on page 394 there is a list
of hcalls and their tokens (table 176), and there you can see that
H_PROTECT =3D=3D 0x18.

Finally you can look at table 178, on page 401, where it specifies the
layout of the bits for the key:

 Bit     Function
------------------
 50-54 | key0-key4


Those are big-endian bit numbers, converting to normal bit numbers you
get bits 9-13, or 0x3e00.

If you look at the kernel source we have:

#define HPTE_R_KEY_HI		ASM_CONST(0x3000000000000000)
#define HPTE_R_KEY_LO		ASM_CONST(0x0000000000000e00)

So the LO bits are already in the right place, and the HI bits just need
to be shifted down by 48.

Hope that makes it clearer :)

cheers
