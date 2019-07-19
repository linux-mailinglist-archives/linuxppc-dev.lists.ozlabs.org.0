Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873D6D90E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 04:27:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qZfd11MDzDqfY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 12:27:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qZcR4pjMzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 12:25:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45qZcM6nMkz9sBF; Fri, 19 Jul 2019 12:25:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45qZcM21Yjz9s7T;
 Fri, 19 Jul 2019 12:25:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v4 4/8] KVM: PPC: Ultravisor: Use UV_WRITE_PATE ucall to
 register a PATE
In-Reply-To: <6688060f-3744-cae5-635e-f1ee3ff48c19@linux.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-5-cclaudio@linux.ibm.com>
 <87ims8g24r.fsf@concordia.ellerman.id.au>
 <6688060f-3744-cae5-635e-f1ee3ff48c19@linux.ibm.com>
Date: Fri, 19 Jul 2019 12:25:54 +1000
Message-ID: <87ef2m92vh.fsf@concordia.ellerman.id.au>
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
Cc: Ryan Grimm <grimm@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> On 7/11/19 9:57 AM, Michael Ellerman wrote:
>>>  static pmd_t *get_pmd_from_cache(struct mm_struct *mm)
>>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm=
/book3s64/radix_pgtable.c
>>> index 8904aa1243d8..da6a6b76a040 100644
>>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>>> @@ -656,8 +656,10 @@ void radix__early_init_mmu_secondary(void)
>>>  		lpcr =3D mfspr(SPRN_LPCR);
>>>  		mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
>>>=20=20
>>> -		mtspr(SPRN_PTCR,
>>> -		      __pa(partition_tb) | (PATB_SIZE_SHIFT - 12));
>>> +		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>>> +			mtspr(SPRN_PTCR, __pa(partition_tb) |
>>> +			      (PATB_SIZE_SHIFT - 12));
>>> +
>>>  		radix_init_amor();
>>>  	}
>>>=20=20
>>> @@ -673,7 +675,8 @@ void radix__mmu_cleanup_all(void)
>>>  	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
>>>  		lpcr =3D mfspr(SPRN_LPCR);
>>>  		mtspr(SPRN_LPCR, lpcr & ~LPCR_UPRT);
>>> -		mtspr(SPRN_PTCR, 0);
>>> +		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>>> +			mtspr(SPRN_PTCR, 0);
>>>  		powernv_set_nmmu_ptcr(0);
>>>  		radix__flush_tlb_all();
>>>  	}
>> There's four of these case where we skip touching the PTCR, which is
>> right on the borderline of warranting an accessor. I guess we can do it
>> as a cleanup later.
>
> I agree.
>
> Since the kernel doesn't need to access a big number of ultravisor
> privileged registers, maybe we can define mtspr_<reg> and mfspr_<reg>
> inline functions that in ultravisor.h that skip touching the register if =
an
> ultravisor is present and and the register is ultravisor privileged. Thus,
> we don't need to replicate comments and that also would make it easier for
> developers to know what are the ultravisor privileged registers.
>
> Something like this:
>
> --- a/arch/powerpc/include/asm/ultravisor.h
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -10,10 +10,21 @@
> =C2=A0
> =C2=A0#include <asm/ultravisor-api.h>
> =C2=A0#include <asm/asm-prototypes.h>
> +#include <asm/reg.h>
> =C2=A0
> =C2=A0int early_init_dt_scan_ultravisor(unsigned long node, const char *u=
name,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int depth, void *data);
> =C2=A0
> +static inline void mtspr_ptcr(unsigned long val)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the ultravisor firmware =
is present, it maintains the partition
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * table. PTCR becomes ultravi=
sor privileged only for writing.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!firmware_has_feature(FW_FEATUR=
E_ULTRAVISOR))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mtspr(SPRN_PTCR, val);
> +}
+
> =C2=A0static inline int uv_register_pate(u64 lpid, u64 dw0, u64 dw1)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ucall_norets(UV_WRITE_P=
ATE, lpid, dw0, dw1);
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c
> b/arch/powerpc/mm/book3s64/pgtable.c
> index e1bbc48e730f..25156f9dfde8 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -220,7 +220,7 @@ void __init mmu_partition_table_init(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 64 K size.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptcr =3D __pa(partition_tb) | =
(PATB_SIZE_SHIFT - 12);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtspr(SPRN_PTCR, ptcr);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mtspr_ptcr(ptcr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 powernv_set_nmmu_ptcr(ptcr);
> =C2=A0}
>
> What do you think?

I don't think that's actually clearer.

If the logic was always:

  if (ultravisor)
     do_ucall()
  else
     mtspr()

Then a wrapper called eg. set_ptcr() would make sense.

But because in some cases you do a ucall and some you don't, I don't
think it helps to hide that in an accessor like above.

That is confusing to a reader who sees all this code to setup a value
and then the write to PTCR does nothing.

And in fact you didn't explain why it's OK for those cases to not do the
write at all.

> An alternative could be to change the mtspr() and mfspr() macros as we
> proposed in the v1, but access to non-ultravisor privileged registers wou=
ld
> be performance impacted because we always would need to check if the
> register is one of the few ultravisor registers that the kernel needs to
> access.

Yeah that and it would be very confusing to a reader who sees:

    ptcr =3D ...;
    mtspr(SPRN_PTCR, ptcr);
    ...

And then they discover the mtspr does *nothing* when the Ultravisor is
enabled.

cheers
