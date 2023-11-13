Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7117E9A87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 11:46:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hjuj99OF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STR203bsjz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 21:46:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hjuj99OF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STR145qC3z2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 21:46:00 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADAdhMk008865;
	Mon, 13 Nov 2023 10:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8qC9HU061TX3CPgJKaTK80qGymZn/7fb5x/5bbfXwGg=;
 b=Hjuj99OFlVqdcjPG1amYO/BZXvZT/sOVOV0JWIocV/TgUlIrDcZX/OlfR/ptxPhfyNBr
 F2J2aXTuMwKaSaR9uXvsaK7TkyvAHh1xwaYadgQgtD6UZkw7kcasdt5isTVChQ20Ivzm
 xg091DXVyTo8QfkXIGDoaKpF+Ra14SNTL6tFM7Ls84CAuQslfr3JRp3DaSfEYqrgNkji
 K1RtVsUZ/aB6GFvBMlwVUhxyuLSWmdXQs6LVrRwN71H2zMsoPciD2zkx9NmYnfDO20Cm
 mihLU6xRBCgHexkC52ZszOHPiRWrWoK1qg//nBfXC4JFCe8UBBGnLUu3G/EacEUlkjQB ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubj8686jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 10:45:52 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ADAeCSf011296;
	Mon, 13 Nov 2023 10:45:52 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubj8686jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 10:45:51 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADA44ns001935;
	Mon, 13 Nov 2023 10:45:51 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uakxsgr7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 10:45:51 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ADAjnYU52953462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 10:45:49 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B01520043;
	Mon, 13 Nov 2023 10:45:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BE3220040;
	Mon, 13 Nov 2023 10:45:48 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Nov 2023 10:45:47 +0000 (GMT)
Message-ID: <02b602c0-2b40-4cf9-b0ca-4bc12ac267cd@linux.ibm.com>
Date: Mon, 13 Nov 2023 16:15:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, christophe.leroy@csgroup.eu
References: <20231102132327.294050-1-aneesh.kumar@linux.ibm.com>
 <CWXLU5UP91CT.1AP3JHL6TR6UT@wheely>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <CWXLU5UP91CT.1AP3JHL6TR6UT@wheely>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I4crEGq5j2pfbrY0bpMvd3ZMsSYrbDdv
X-Proofpoint-ORIG-GUID: HP7nJTy7w-u4V4FJuOJe7vbcfY2_GtiJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=410 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311130088
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

On 11/13/23 3:46 PM, Nicholas Piggin wrote:
> On Thu Nov 2, 2023 at 11:23 PM AEST, Aneesh Kumar K.V wrote:
>> There used to be a dependency on _PAGE_PRIVILEGED with pte_savedwrite.
>> But that got dropped by
>> commit 6a56ccbcf6c6 ("mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite")
>>
>> With this change numa fault pte (pte_protnone()) gets mapped as regular user pte
>> with RWX cleared (no-access).
> 
> You mean "that" above change (not *this* change), right?
> 

With the change in this patch numa fault pte will not have _PAGE_PRIVILEGED set because 
PAGE_NONE now maps to just _PAGE_BASE


>> This also remove pte_user() from
>> book3s/64.
> 
> Nice cleanup. That was an annoying hack.
> 
>> pte_access_permitted() now checks for _PAGE_EXEC because we now support
>> EXECONLY mappings.
> 
> AFAIKS pte_exec() is not required, GUP is really only for read or
> write access. It should be a separate patch if you think it's needed.
> 

I have a v2 dropping that based on https://lore.kernel.org/linux-mm/87bkc1oe8c.fsf@linux.ibm.com 
I kept pte_user with pte_access_permitted being the only user. I can open code that
if needed. 

>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/book3s/64/pgtable.h | 23 +++++---------------
>>  arch/powerpc/mm/book3s64/hash_utils.c        | 17 +++++++++++++++
>>  2 files changed, 23 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index cb77eddca54b..7c7de7b56df0 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -17,12 +17,6 @@
>>  #define _PAGE_EXEC		0x00001 /* execute permission */
>>  #define _PAGE_WRITE		0x00002 /* write access allowed */
>>  #define _PAGE_READ		0x00004	/* read access allowed */
>> -#define _PAGE_NA		_PAGE_PRIVILEGED
>> -#define _PAGE_NAX		_PAGE_EXEC
>> -#define _PAGE_RO		_PAGE_READ
>> -#define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
>> -#define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
>> -#define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
>>  #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
>>  #define _PAGE_SAO		0x00010 /* Strong access order */
>>  #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
> 
> Did you leave PAGE_NONE as _PAGE_BASE | _PAGE_PRIVILEGED below?
> Shouldn't that be changed too? Then this patch is not only hash
> but also radix.
> 

A recent patch moved PAGE_NONE to pgtable-mask.h 
a5a08dc90f4513d1a78582ec24b687fad01cc843

> Why is the hash change required? Previously PAGE_NONE relied on
> privileged bit to prevent access, now you need to handle a PTE
> without that bit? In that case could that be patch 1, then the
> rest patch 2?
> 

Looking at older kernel, I guess check_pte_access used _PAGE_PRIVILEGED 
as a way to prevent access to PAGE_NONE ptes. We now depend on
_PAGE_READ

> __pte_flags_need_flush() should be updated after this too,
> basically revert commit 1abce0580b894.
> 

Will update the patch to include the revert.

>> @@ -119,9 +113,9 @@
>>  /*
>>   * user access blocked by key
>>   */
>> -#define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
>>  #define _PAGE_KERNEL_RO		 (_PAGE_PRIVILEGED | _PAGE_READ)
>>  #define _PAGE_KERNEL_ROX	 (_PAGE_PRIVILEGED | _PAGE_READ | _PAGE_EXEC)
>> +#define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
>>  #define _PAGE_KERNEL_RWX	(_PAGE_PRIVILEGED | _PAGE_DIRTY | _PAGE_RW | _PAGE_EXEC)
>>  /*
>>   * _PAGE_CHG_MASK masks of bits that are to be preserved across
> 
> No need to reorder defines.
> 

ok


> Thanks,
> Nick
> 
>> @@ -523,19 +517,14 @@ static inline bool arch_pte_access_permitted(u64 pte, bool write, bool execute)
>>  }
>>  #endif /* CONFIG_PPC_MEM_KEYS */
>>  
>> -static inline bool pte_user(pte_t pte)
>> -{
>> -	return !(pte_raw(pte) & cpu_to_be64(_PAGE_PRIVILEGED));
>> -}
>> -
>>  #define pte_access_permitted pte_access_permitted
>>  static inline bool pte_access_permitted(pte_t pte, bool write)
>>  {
>> -	/*
>> -	 * _PAGE_READ is needed for any access and will be
>> -	 * cleared for PROT_NONE
>> -	 */
>> -	if (!pte_present(pte) || !pte_user(pte) || !pte_read(pte))
>> +
>> +	if (!pte_present(pte))
>> +		return false;
>> +
>> +	if (!(pte_read(pte) || pte_exec(pte)))
>>  		return false;
>>  
>>  	if (write && !pte_write(pte))
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
>> index ad2afa08e62e..b2eda22195f0 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -310,9 +310,26 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned long flags
>>  			else
>>  				rflags |= 0x3;
>>  		}
>> +		WARN_ON(!(pteflags & _PAGE_RWX));
>>  	} else {
>>  		if (pteflags & _PAGE_RWX)
>>  			rflags |= 0x2;
>> +		else {
>> +			/*
>> +			 * PAGE_NONE will get mapped to 0b110 (slb key 1 no access)
>> +			 * We picked 0b110 instead of 0b000 so that slb key 0 will
>> +			 * get only read only access for the same rflags.
>> +			 */
>> +			if (mmu_has_feature(MMU_FTR_KERNEL_RO))
>> +				rflags |= (HPTE_R_PP0 | 0x2);
>> +			/*
>> +			 * rflags = HPTE_R_N
>> +			 * Without KERNEL_RO feature this will result in slb
>> +			 * key 0 with read/write. But ISA only supports that.
>> +			 * There is no key 1 no-access and key 0 read-only
>> +			 * pp bit support.
>> +			 */
>> +		}
>>  		if (!((pteflags & _PAGE_WRITE) && (pteflags & _PAGE_DIRTY)))
>>  			rflags |= 0x1;
>>  	}
> 

V2 is also dropping the above change, because we will never have hash table entries inserted. 

This is added to commit message.

    Hash fault handling code did get some WARN_ON added because those
    functions are not expected to get called with _PAGE_READ cleared.
    commit 18061c17c8ec ("powerpc/mm: Update PROTFAULT handling in the page fault path")
    explains the details.



-aneesh
