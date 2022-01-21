Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115B495C88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 10:08:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgD773YCMz3bjG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:08:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OtvVQ6ds;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OtvVQ6ds; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgD6N63bWz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 20:07:24 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20L8Gnu9024228; 
 Fri, 21 Jan 2022 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=N1UE72BJ2MEkxmkbITUrTccBF6dtlFdU1mjz7WhN36c=;
 b=OtvVQ6dsD1h9+cEXp27aDY7NQuv+ceKs15B5GhVrDr8Rbi2kUzpU3OWL/CyZKRzqC353
 yO/UMwgz4po74ajkduVCGn5QXNLE6z/KhVO546onystYtJ4GhBnMwWkEQaBwNKf+SYrg
 F9mY1IeajGhumzcUJU1g5qD4FQvvpL9p+zKbpacIyIe/3mDsywGjH3CuFjpZds3K7DfZ
 Q1DzSFhSGeip3jzoeuB9avg2QfRpx+91KXYZAcedFKaWvTGCuQsAP1SG+cfN9koUw5vC
 h6MHSKhQTjBE+UpafshlPwbDcFc6iqMbcIxSXkmfkgwBKW5wqQLkzc6zHpRVsikQf9SJ oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dqs6agw7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 09:07:12 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20L8HYp7027532;
 Fri, 21 Jan 2022 09:07:12 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dqs6agw72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 09:07:12 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20L92NwH005575;
 Fri, 21 Jan 2022 09:07:11 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3dqj1js111-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 09:07:11 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20L97ApJ29753824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 09:07:10 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D6FAB2072;
 Fri, 21 Jan 2022 09:07:10 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6E85B213B;
 Fri, 21 Jan 2022 09:07:06 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.32.214])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 09:07:06 +0000 (GMT)
X-Mailer: emacs 28.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: Re: [PATCH v7 3/7] powerpc/pmem: Add flush routines using new pmem
 store and sync instruction
In-Reply-To: <7eba6780-5ffd-54f4-feb0-b5e627ec6216@csgroup.eu>
References: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
 <20200701072235.223558-4-aneesh.kumar@linux.ibm.com>
 <7eba6780-5ffd-54f4-feb0-b5e627ec6216@csgroup.eu>
Date: Fri, 21 Jan 2022 14:37:00 +0530
Message-ID: <87sftho3t7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2pSSl9DIMjjRUIg41UlrZBGrhwygNAWy
X-Proofpoint-ORIG-GUID: MIGigJyuDxEsSAjusDTt-hF0xaYs0YNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_06,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201210060
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
Cc: oohall@gmail.com, Jeff Moyer <jmoyer@redhat.com>, msuchanek@suse.de,
 Jan Kara <jack@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 01/07/2020 =C3=A0 09:22, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> Start using dcbstps; phwsync; sequence for flushing persistent memory ra=
nge.
>> The new instructions are implemented as a variant of dcbf and hwsync and=
 on
>> P8 and P9 they will be executed as those instructions. We avoid using th=
em on
>> older hardware. This helps to avoid difficult to debug bugs.
>>=20
>
> Before this patch, the flush was done for all.
> After this patch, IIUC the flush is done only on CPUs having feature=20
> CPU_FTR_ARCH_207S.
>
> What about other CPUs ?
>
> I don't know much about PMEM, my concern is about the UACCESS_FLUSHCACHE=
=20
> API introduced by commit 6c44741d75a2 ("powerpc/lib: Implement=20
> UACCESS_FLUSHCACHE API")
>
> After your patch, __copy_from_user_flushcache() and memcpy_flushcache()=20
> are not doing cache flush anymore.
>
> Is that intended ?

yes, with the understanding that these functions are used with
persistent memory . We restrict the persistent memory usage to p8 and
above via commit c83040192f3763b243ece26073d61a895b4a230f

>
> I'm trying to optimise some ALSA driver that does copy_from_user +=20
> cache_flush for DMA, and I was wondering if using=20
> __copy_from_user_flushcache() was an alternative.
>
> Or is it __copy_from_user_inatomic_nocache() which has to be done for tha=
t ?
>
> Thanks
> Christophe
>
>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/cacheflush.h |  1 +
>>   arch/powerpc/lib/pmem.c               | 50 ++++++++++++++++++++++++---
>>   2 files changed, 47 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/includ=
e/asm/cacheflush.h
>> index de600b915a3c..54764c6e922d 100644
>> --- a/arch/powerpc/include/asm/cacheflush.h
>> +++ b/arch/powerpc/include/asm/cacheflush.h
>> @@ -6,6 +6,7 @@
>>=20=20=20
>>   #include <linux/mm.h>
>>   #include <asm/cputable.h>
>> +#include <asm/cpu_has_feature.h>
>>=20=20=20
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   /*
>> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
>> index 0666a8d29596..5a61aaeb6930 100644
>> --- a/arch/powerpc/lib/pmem.c
>> +++ b/arch/powerpc/lib/pmem.c
>> @@ -9,20 +9,62 @@
>>=20=20=20
>>   #include <asm/cacheflush.h>
>>=20=20=20
>> +static inline void __clean_pmem_range(unsigned long start, unsigned lon=
g stop)
>> +{
>> +	unsigned long shift =3D l1_dcache_shift();
>> +	unsigned long bytes =3D l1_dcache_bytes();
>> +	void *addr =3D (void *)(start & ~(bytes - 1));
>> +	unsigned long size =3D stop - (unsigned long)addr + (bytes - 1);
>> +	unsigned long i;
>> +
>> +	for (i =3D 0; i < size >> shift; i++, addr +=3D bytes)
>> +		asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
>> +
>> +
>> +	asm volatile(PPC_PHWSYNC ::: "memory");
>> +}
>> +
>> +static inline void __flush_pmem_range(unsigned long start, unsigned lon=
g stop)
>> +{
>> +	unsigned long shift =3D l1_dcache_shift();
>> +	unsigned long bytes =3D l1_dcache_bytes();
>> +	void *addr =3D (void *)(start & ~(bytes - 1));
>> +	unsigned long size =3D stop - (unsigned long)addr + (bytes - 1);
>> +	unsigned long i;
>> +
>> +	for (i =3D 0; i < size >> shift; i++, addr +=3D bytes)
>> +		asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
>> +
>> +
>> +	asm volatile(PPC_PHWSYNC ::: "memory");
>> +}
>> +
>> +static inline void clean_pmem_range(unsigned long start, unsigned long =
stop)
>> +{
>> +	if (cpu_has_feature(CPU_FTR_ARCH_207S))
>> +		return __clean_pmem_range(start, stop);
>> +}
>> +
>> +static inline void flush_pmem_range(unsigned long start, unsigned long =
stop)
>> +{
>> +	if (cpu_has_feature(CPU_FTR_ARCH_207S))
>> +		return __flush_pmem_range(start, stop);
>> +}
>> +
>>   /*
>>    * CONFIG_ARCH_HAS_PMEM_API symbols
>>    */
>>   void arch_wb_cache_pmem(void *addr, size_t size)
>>   {
>>   	unsigned long start =3D (unsigned long) addr;
>> -	flush_dcache_range(start, start + size);
>> +	clean_pmem_range(start, start + size);
>>   }
>>   EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
>>=20=20=20
>>   void arch_invalidate_pmem(void *addr, size_t size)
>>   {
>>   	unsigned long start =3D (unsigned long) addr;
>> -	flush_dcache_range(start, start + size);
>> +	flush_pmem_range(start, start + size);
>>   }
>>   EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
>>=20=20=20
>> @@ -35,7 +77,7 @@ long __copy_from_user_flushcache(void *dest, const voi=
d __user *src,
>>   	unsigned long copied, start =3D (unsigned long) dest;
>>=20=20=20
>>   	copied =3D __copy_from_user(dest, src, size);
>> -	flush_dcache_range(start, start + size);
>> +	clean_pmem_range(start, start + size);
>>=20=20=20
>>   	return copied;
>>   }
>> @@ -45,7 +87,7 @@ void *memcpy_flushcache(void *dest, const void *src, s=
ize_t size)
>>   	unsigned long start =3D (unsigned long) dest;
>>=20=20=20
>>   	memcpy(dest, src, size);
>> -	flush_dcache_range(start, start + size);
>> +	clean_pmem_range(start, start + size);
>>=20=20=20
>>   	return dest;
>>   }
