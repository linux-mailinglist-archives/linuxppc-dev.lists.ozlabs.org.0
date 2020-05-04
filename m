Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 970091C340F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 10:08:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FwTW26LMzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 18:08:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SULuzyTo; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FwRY5FBvzDqTj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 18:06:31 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id u22so6480873plq.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 01:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=mCCPx1RiSJ7b6tpkuxWebd4Lr4UeuJ0iZ2tS9uFoPog=;
 b=SULuzyToF0GZpXAu16AnXpEiSejb8Rr29WULIBt0AgYZ88ooHYOgZL5legBo79hfEh
 1EPuqRJ2ZLWTCabwjHSkYRvMqjrMSJZhD5Qn6i5waZTga7Ap1G+OXem2NYzcZmL6PgHO
 /SUHL/7sl+hcLDCHeTCq08MBqCkm3vLNvBeTXvM4UL0uGEZuBLImLuNasewCP8yXhXHb
 szfXvMXKJDAa0kbsShInMB+O0GqnmA0vD7HR+JGXHZcwAAVF00B3AREnnUlff9xQRjVH
 EqC49sjfnwr8iliodEM718dLWabLkgJQKOPtHkOU8PEKuSokyIY7ry+hejBERX8AEVzY
 NE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mCCPx1RiSJ7b6tpkuxWebd4Lr4UeuJ0iZ2tS9uFoPog=;
 b=kj+x4SD+hZN+OtVeSI/fCzRQ7HBj8teg2jDjMJ3y5uRI2EDPU1Ax3ZXwvrs1nZedfa
 v3j8AyK78qtkNTJs2ufmTUNMMdeJ+iciQqxSZ/bgAfE9osl7Egkk3BjnIoT6/vXERTb1
 q+mXhnLE9jXzt6RZ/cSkJWIbRV8i/KNShiIyUMc2ylW0VUOuLh6nph+7RUNFYy3SW2VB
 MaF1YzQvqQEobyfZC44+OAL/H3mlX2I0DrY5QIaAxgfKbR2DX3sJSPqj0VafR4u7mIL8
 vSKJjLvGRrftVNDQjjMbCs2Y/YnqKUpoSJO1ejWJx1l842iov8FgOyv8rzTPepnbYoBO
 LhfQ==
X-Gm-Message-State: AGi0PuYxoJVJ7dU7E9FZGaA8gOQbDfXlzqtsTzSBUyG7/RGd8RfkOugF
 uHV8BiTlAik2rn+ElvN0RDdXdHcN
X-Google-Smtp-Source: APiQypJNIcn3EjuRBw7BwCCpXqS3KFfd6WT5+boKZZCytokijqvY+IVwPv3tHydaR7onlPWKkUOQ1g==
X-Received: by 2002:a17:902:988e:: with SMTP id
 s14mr16525498plp.179.1588579587840; 
 Mon, 04 May 2020 01:06:27 -0700 (PDT)
Received: from localhost (193-116-199-65.tpgi.com.au. [193.116.199.65])
 by smtp.gmail.com with ESMTPSA id o6sm8206024pfp.172.2020.05.04.01.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 01:06:27 -0700 (PDT)
Date: Mon, 04 May 2020 18:06:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/64s/hash: add torture_hpt kernel boot option
 to increase hash faults
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200503082236.17991-1-npiggin@gmail.com>
 <20200503082236.17991-2-npiggin@gmail.com> <874kswm9s6.fsf@linux.ibm.com>
In-Reply-To: <874kswm9s6.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1588578413.kc4rqqc8nb.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Aneesh Kumar K.V's message of May 4, 2020 5:36 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> This option increases the number of hash misses by limiting the number o=
f
>> kernel HPT entries. This helps stress test difficult to hit paths in the
>> kernel.
>>
>=20
> It would nice if we can explain in commit message how we are limiting
> the number of HPT entries.

"limiting the number of kernel HPT entries by removing them as soon as=20
possible after they are installed"?

>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  .../admin-guide/kernel-parameters.txt         |  9 +++
>>  arch/powerpc/include/asm/book3s/64/mmu-hash.h | 10 +++
>>  arch/powerpc/mm/book3s64/hash_4k.c            |  3 +
>>  arch/powerpc/mm/book3s64/hash_64k.c           |  8 +++
>>  arch/powerpc/mm/book3s64/hash_utils.c         | 66 ++++++++++++++++++-
>>  5 files changed, 95 insertions(+), 1 deletion(-)
>=20
> ....
>=20
>  =20
>> +void hpt_do_torture(unsigned long ea, unsigned long access,
>> +		    unsigned long rflags, unsigned long hpte_group)
>> +{
>> +	unsigned long last_group;
>> +	int cpu =3D raw_smp_processor_id();
>> +
>> +	last_group =3D torture_hpt_last_group[cpu];
>> +	if (last_group !=3D -1UL) {
>> +		while (mmu_hash_ops.hpte_remove(last_group) !=3D -1)
>> +			;
>> +		torture_hpt_last_group[cpu] =3D -1UL;
>> +	}
>> +
>> +#define QEMU_WORKAROUND	0
>> +
>> +	if (ea >=3D PAGE_OFFSET) {
>> +		if (!QEMU_WORKAROUND && (access & (_PAGE_READ|_PAGE_WRITE)) &&
>> +		    !(rflags & (HPTE_R_I|HPTE_R_G))) {
>> +			/* prefetch / prefetchw does not seem to set up a TLB
>> +			 * entry with the powerpc systemsim (mambo) emulator,
>> +			 * though it works with real hardware. An alternative
>> +			 * approach that would work more reliably on quirky
>> +			 * emulators like QEMU may be to remember the last
>> +			 * insertion and remove that, rather than removing the
>> +			 * current insertion. Then no prefetch is required.
>> +			 */
>> +			if ((access & _PAGE_WRITE) && (access & _PAGE_READ))
>> +				atomic_add(0, (atomic_t *)(ea & ~0x3));
>> +			else if (access & _PAGE_READ)
>> +				*(volatile char *)ea;
>> +
>> +			mb();
>> +
>> +			while (mmu_hash_ops.hpte_remove(hpte_group) !=3D -1)
>> +				;
>=20
> Do we get similar hpte faults rate, if we remove everything except the
> current inserted entry?. If so that would largely simplify the code.

Well it would remove this one branch at least. It does actually help=20
cause more faults and helps (in theory) irritate cases where you have=20
two accesses to a vmalloc page in the kernel, where the first is okay
to take a fault but the second is buggy.

I actually like the interesting behaviour it exposes in emulators too.=20
We should really fix mambo to have prefetches bring in TLBs, and fix=20
qemu to bring in TLBs more like hardware, and it could have TLB vs PTE=20
consistency checks to catch bugs like mambo does.

So I prefer leaving this in.

Thanks,
Nick
