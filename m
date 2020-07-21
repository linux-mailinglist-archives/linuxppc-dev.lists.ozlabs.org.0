Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C828C227673
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 05:15:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9kHd75WMzDqRt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 13:15:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9kFw20ZBzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 13:13:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m0w7oLyK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9kFt5n5Sz9sRf;
 Tue, 21 Jul 2020 13:13:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595301235;
 bh=EoSqXwlvylHMHxLR6CYQvgQ2OeIGAlT5JoTMEhUNdIs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m0w7oLyKkmlfse5grRWAmneduN4y/iL3YRNHG7SqxAY30pTAvIw4lUOq2Zs3FekAm
 afPZ8b46fuAI61PgChkTUy/hjqnMZDdF8R7UsSewcqpd8hd1KjypPErLWPAXAXavX7
 RWzaXv9N4jeN5wNDH2OFkP+FrTMHkRDyxNuMz2l74AsW5jyPpZcH5hzdH20PN5M5NX
 Rw8Q+Uy6RMyVtbbH8jNX192nSKANbOh1YkL1tEUTU7yogdmWxCTHnbkrshlu+za+va
 y/ICUL8UqvPxw05rQOYIfBr8pr1oH6HFU/F/l6CoaPkN64AlfKNITNUlMnRQYW4C0x
 RRF5th7naeVFg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [powerpc:next-test 103/106]
 arch/powerpc/mm/book3s64/radix_pgtable.c:513:21: error: use of undeclared
 identifier 'SECTION_SIZE_BITS'
In-Reply-To: <20200720183900.Horde.y2dVSL93KA1P6bzz7IKxoA1@messagerie.si.c-s.fr>
References: <202007190428.5Q47y2Gy%lkp@intel.com>
 <87zh7w108a.fsf@linux.ibm.com>
 <20200720183900.Horde.y2dVSL93KA1P6bzz7IKxoA1@messagerie.si.c-s.fr>
Date: Tue, 21 Jul 2020 13:13:54 +1000
Message-ID: <87r1t5sgp9.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Bharata B Rao <bharata@linux.ibm.com>,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 clang-built-linux@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> a =C3=A9crit=C2=A0:
...
>>
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c=20=20
>> b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> index bba45fc0b7b2..c5bf2ef73c36 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -492,6 +492,7 @@ static int __init=20=20
>> @@ -532,6 +533,15 @@ static unsigned long radix_memory_block_size(void)
>>  	return mem_block_size;
>>  }
>>
>> +#else   /* CONFIG_MEMORY_HOTPLUG */
>> +
>> +static unsigned long radix_memory_block_size(void)
>> +{
>> +	return 1UL * 1024 * 1024 * 1024;
>
> Use SZ_1G instead ?

I've already squashed that in.

I'd take a patch to convert all cases though, I see at least:

  arch/powerpc/boot/ep8248e.c:    mem_size *=3D 1024 * 1024;
  arch/powerpc/boot/ep88xc.c:     mem_size *=3D 1024 * 1024;
  arch/powerpc/include/asm/kexec.h:#define KEXEC_SOURCE_MEMORY_LIMIT      (=
2 * 1024 * 1024 * 1024UL - 1)
  arch/powerpc/include/asm/kexec.h:#define KEXEC_DESTINATION_MEMORY_LIMIT (=
2 * 1024 * 1024 * 1024UL - 1)
  arch/powerpc/include/asm/kexec.h:#define KEXEC_CONTROL_MEMORY_LIMIT     (=
2 * 1024 * 1024 * 1024UL - 1)
  arch/powerpc/kernel/iommu.c:    if ((tbl->it_size << tbl->it_page_shift) =
>=3D (1UL * 1024 * 1024 * 1024))
  arch/powerpc/kernel/setup-common.c:                        (unsigned int)=
(total_memory / (1024 * 1024)));
  arch/powerpc/mm/book3s64/radix_pgtable.c:               mem_block_size =
=3D 1UL * 1024 * 1024 * 1024;
  arch/powerpc/mm/book3s64/radix_pgtable.c:       return 1UL * 1024 * 1024 =
* 1024;
  arch/powerpc/mm/ioremap_32.c:   if (p < 16 * 1024 * 1024)
  arch/powerpc/platforms/powernv/setup.c:         return 256UL * 1024 * 102=
4;
  arch/powerpc/platforms/pseries/cmm.c:   signed long min_mem_pages =3D (mi=
n_mem_mb * 1024 * 1024) / PAGE_SIZE;

cheers
