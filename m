Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD4215430
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 10:52:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0fSz4235zDqTb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 18:52:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0fPX59K4zDqgk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 18:49:04 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0668YU5t138873; Mon, 6 Jul 2020 04:48:59 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322pakucg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 04:48:59 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0668ZLdi021462;
 Mon, 6 Jul 2020 08:48:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 322hd7s234-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 08:48:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0668lXnj25428270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 08:47:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B73A42045;
 Mon,  6 Jul 2020 08:48:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 988734204B;
 Mon,  6 Jul 2020 08:48:53 +0000 (GMT)
Received: from [9.85.98.83] (unknown [9.85.98.83])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 08:48:53 +0000 (GMT)
Subject: Re: [PATCH v5 11/26] powerpc/book3s64/pkeys: Make
 initial_allocation_mask static
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-12-aneesh.kumar@linux.ibm.com>
 <87sge55dkh.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <275bbda9-7bdf-6474-4d79-908332ff028b@linux.ibm.com>
Date: Mon, 6 Jul 2020 14:18:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87sge55dkh.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_04:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 cotscore=-2147483648 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007060064
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/6/20 12:34 PM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> initial_allocation_mask is not used outside this file.
> 
> And never modified after init, so make it __ro_after_init as well?
> 


ok, will update reserved_allocation_maask too.

> cheers
> 
>> diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
>> index 652bad7334f3..47c81d41ea9a 100644
>> --- a/arch/powerpc/include/asm/pkeys.h
>> +++ b/arch/powerpc/include/asm/pkeys.h
>> @@ -13,7 +13,6 @@
>>   
>>   DECLARE_STATIC_KEY_FALSE(pkey_disabled);
>>   extern int max_pkey;
>> -extern u32 initial_allocation_mask; /*  bits set for the initially allocated keys */
>>   extern u32 reserved_allocation_mask; /* bits set for reserved keys */
>>   
>>   #define ARCH_VM_PKEY_FLAGS (VM_PKEY_BIT0 | VM_PKEY_BIT1 | VM_PKEY_BIT2 | \
>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
>> index a4d7287082a8..73b5ef1490c8 100644
>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>> @@ -15,11 +15,11 @@
>>   DEFINE_STATIC_KEY_FALSE(pkey_disabled);
>>   DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
>>   int  max_pkey;			/* Maximum key value supported */
>> -u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
>>   /*
>>    *  Keys marked in the reservation list cannot be allocated by  userspace
>>    */
>>   u32  reserved_allocation_mask;
>> +static u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
>>   static u64 default_amr;
>>   static u64 default_iamr;
>>   /* Allow all keys to be modified by default */
>> -- 
>> 2.26.2


-aneesh
