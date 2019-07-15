Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E8A69987
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 19:05:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nVJn16rCzDqTD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 03:05:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nVGg5Tn3zDqT4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 03:03:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45nVGW70Kkz9v6sM;
 Mon, 15 Jul 2019 19:03:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6-l72iaIQAXe; Mon, 15 Jul 2019 19:03:15 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45nVGW5x2hz9v6sL;
 Mon, 15 Jul 2019 19:03:15 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 986702436; Mon, 15 Jul 2019 19:03:22 +0200 (CEST)
Received: from 37.165.107.183 ([37.165.107.183]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Mon, 15 Jul 2019 19:03:22 +0200
Date: Mon, 15 Jul 2019 19:03:22 +0200
Message-ID: <20190715190322.Horde.n1joFeQA_2PKT82_Wohz2Q1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/4] powerpc/32: activate ARCH_HAS_PMEM_API and
 ARCH_HAS_UACCESS_FLUSHCACHE
References: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
 <0e779b35cf66fd4aa5ec0ec09fb7820f6c518cb3.1557824379.git.christophe.leroy@c-s.fr>
 <87y30z94hp.fsf@concordia.ellerman.id.au>
In-Reply-To: <87y30z94hp.fsf@concordia.ellerman.id.au>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> PPC32 also have flush_dcache_range() so it can also support
>> ARCH_HAS_PMEM_API and ARCH_HAS_UACCESS_FLUSHCACHE without changes.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>  arch/powerpc/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index d7996cfaceca..cf6e30f637be 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -127,13 +127,13 @@ config PPC
>>  	select ARCH_HAS_KCOV
>>  	select ARCH_HAS_MMIOWB			if PPC64
>>  	select ARCH_HAS_PHYS_TO_DMA
>> -	select ARCH_HAS_PMEM_API                if PPC64
>> +	select ARCH_HAS_PMEM_API
>>  	select ARCH_HAS_PTE_SPECIAL
>>  	select ARCH_HAS_MEMBARRIER_CALLBACKS
>>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC64
>>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) &&=20=
=20
>>=20!RELOCATABLE && !HIBERNATION)
>>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>> -	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
>> +	select ARCH_HAS_UACCESS_FLUSHCACHE
>>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>>  	select ARCH_HAS_ZONE_DEVICE		if PPC_BOOK3S_64
>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>
> This didn't build for me, probably due to something that's changed in
> the long period between you posting it and me applying it?
>
> corenet32_smp_defconfig:
>
>   powerpc64-unknown-linux-gnu-ld: lib/iov_iter.o: in function=20=20
>=20`_copy_from_iter_flushcache':
>   powerpc64-unknown-linux-gnu-ld:=20=20
>=20/scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined=20=
=20
>=20reference to `memcpy_page_flushcache'
>   powerpc64-unknown-linux-gnu-ld:=20=20
>=20/scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined=20=
=20
>=20reference to `memcpy_flushcache'
>   powerpc64-unknown-linux-gnu-ld:=20=20
>=20/scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined=20=
=20
>=20reference to `__copy_from_user_flushcache'
>   powerpc64-unknown-linux-gnu-ld:=20=20
>=20/scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined=20=
=20
>=20reference to `memcpy_flushcache'
>


Looks like arch/powerpc/lib/Makefile only builds pmem.o for ppc64

Moving it from obj64-y to obj-y should do it.

I'll update the patch when I'm back in two weeks unless you can fix it befo=
re.

Christophe


