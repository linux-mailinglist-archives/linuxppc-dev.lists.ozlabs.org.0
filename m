Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B366E3EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 17:45:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxFB364pGz3cf5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 03:45:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V+as7j+j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V+as7j+j;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxF971pvlz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 03:44:26 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HGOgqU010825;
	Tue, 17 Jan 2023 16:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=FFBJAnc62+VOJW9ulWQHpHJqkKlqLemv/JHJcyNQwpY=;
 b=V+as7j+jZ50UJuDaIanJoFhHG6H7j1nmOTKEStKaxlTQ6TrmGeQeKCkvRnGbJ+hCjxIC
 moU1KMR6m8q84yuQsCkyeGXniRNNeNo2d2k9VQXhHO1k6P7X7n5e/N8Hvl4Xqzu3Ob7O
 o3nnZSXNmPrUjAhNv1gbiTaERoZ9nGeWJY06JDxmbMpMjM+tDlQDP91+YB/QcpWCOT+7
 aOt2BnHMba2spfd4s2diN/m4gbS4rQTDxN6WtHWbCwqA9nEclmAINJHqtRkVyQ7r83YN
 en6F3/LKLAdUNZFPkDLnFx5ouf5PX0Mo/XAOP8+oaNAJhi8pEIqGvjKozNhsB3+reyDk Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5wqy33tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 16:44:19 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HElGvV013863;
	Tue, 17 Jan 2023 16:44:19 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5wqy33t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 16:44:19 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HEvHQX025497;
	Tue, 17 Jan 2023 16:44:18 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3n3m17pk3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 16:44:18 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30HGiGIl28377630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jan 2023 16:44:16 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A80C5805D;
	Tue, 17 Jan 2023 16:44:16 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53EBF58058;
	Tue, 17 Jan 2023 16:44:16 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Jan 2023 16:44:16 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Laurent Dufour
 <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: upgrade internal arch spinlocks
In-Reply-To: <87k01n9vo7.fsf@mpe.ellerman.id.au>
References: <20230110044255.122616-1-nathanl@linux.ibm.com>
 <3c4f68a0-b1f9-d456-ab12-9ea75263d94c@linux.ibm.com>
 <87zganpsvy.fsf@linux.ibm.com> <87k01n9vo7.fsf@mpe.ellerman.id.au>
Date: Tue, 17 Jan 2023 10:44:16 -0600
Message-ID: <87ilh55cwv.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M0m48J8irJyRHvPc1TByugweUz1lAbfP
X-Proofpoint-ORIG-GUID: Fery7vFN3QiGjslvbJbeCNnum_IMBbHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_08,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1011
 mlxlogscore=871 spamscore=0 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170133
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> On 10/01/2023 05:42:55, Nathan Lynch wrote:
>>>> --- a/arch/powerpc/include/asm/rtas-types.h
>>>> +++ b/arch/powerpc/include/asm/rtas-types.h
>>>> @@ -18,7 +18,7 @@ struct rtas_t {
>>>>  	unsigned long entry;		/* physical address pointer */
>>>>  	unsigned long base;		/* physical address pointer */
>>>>  	unsigned long size;
>>>> -	arch_spinlock_t lock;
>>>> +	raw_spinlock_t lock;
>>>>  	struct rtas_args args;
>>>>  	struct device_node *dev;	/* virtual address pointer */
>>>>  };
>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>> index deded51a7978..a834726f18e3 100644
>>>> --- a/arch/powerpc/kernel/rtas.c
>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>> @@ -61,7 +61,7 @@ static inline void do_enter_rtas(unsigned long args)
>>>>  }
>>>>  
>>>>  struct rtas_t rtas = {
>>>> -	.lock = __ARCH_SPIN_LOCK_UNLOCKED
>>>> +	.lock = __RAW_SPIN_LOCK_UNLOCKED(rtas.lock),
>>>>  };
>>>>  EXPORT_SYMBOL(rtas);
>>>
>>> This is not the scope of this patch, but the RTAS's lock is externalized
>>> through the structure rtas_t, while it is only used in that file.
>>>
>>> I think, this would be good, in case of future change about that lock, and
>>> in order to not break KABI, to move it out of that structure, and to define
>>> it statically in that file.
>>
>> Thanks for pointing this out.
>>
>> /* rtas-types.h */
>> struct rtas_t {
>> 	unsigned long entry;		/* physical address pointer */
>> 	unsigned long base;		/* physical address pointer */
>> 	unsigned long size;
>> 	raw_spinlock_t lock;
>> 	struct rtas_args args;
>> 	struct device_node *dev;	/* virtual address pointer */
>> };
>>
>> /* rtas.h */
>> extern struct rtas_t rtas;
>>
>> There's C and asm code outside of rtas.c that accesses rtas.entry,
>> rtas.base, rtas.size, and rtas.dev. But as you say, rtas.lock is used
>> only in rtas.c, and it's hard to imagine any legitimate external
>> use. This applies to the args member as well, since accesses must occur
>> under the lock.
>>
>> Making the lock and args private to rtas.c seems desirable on its own,
>> so I think that should be done first as a cleanup, followed by the
>> riskier arch -> raw lock conversion.
>
> I don't see any reason why `rtas` is exported at all.
>
> There might have been in the past, but I don't see one any more.
>
> So I'd be happy if we removed the EXPORT entirely. If it breaks
> something we can always put it back.

Agreed, I see no accesses of the rtas struct from code that can be built
as a module, and we can introduce nicer accessor functions in the future
if need arises. I will incorporate removal of EXPORT_SYMBOL(rtas).
