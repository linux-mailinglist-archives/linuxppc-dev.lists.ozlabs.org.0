Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10E1DB729
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 16:34:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RwHw5YqhzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 00:34:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RwCK5sfKzDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 00:30:36 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04KECjjs117499; Wed, 20 May 2020 10:29:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312wsk3d06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 10:29:57 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04KECqZZ117893;
 Wed, 20 May 2020 10:29:55 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312wsk3cs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 10:29:54 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04KEMbFv002186;
 Wed, 20 May 2020 14:29:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 313xas3t99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 14:29:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04KETdl846727374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 14:29:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8847AE056;
 Wed, 20 May 2020 14:29:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D5BCAE04D;
 Wed, 20 May 2020 14:29:38 +0000 (GMT)
Received: from [9.85.85.147] (unknown [9.85.85.147])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 May 2020 14:29:37 +0000 (GMT)
Subject: Re: [Regression 5.7-rc1] Random hangs on 32-bit PowerPC (PowerBook6,7)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rui Salvaterra <rsalvaterra@gmail.com>
References: <CALjTZvZ69v3Z=8MY28F+p8v8_Z5e+7NrH0PAJ7TGD9kh6Ab7bw@mail.gmail.com>
 <3729805f-2638-6f0e-55fa-bd7d5c173899@csgroup.eu>
 <CALjTZvZ0gjZOpx7GuJ4ccawqpyOjr4N_C7UCQQHrrFR1Ojrh4g@mail.gmail.com>
 <d4f02b20-8b3e-fd88-6857-c2e4dc7786da@csgroup.eu>
 <CALjTZvZ1NyVOhX+qJZSqO_8shn9yD76DBBg0t9UeFUyzom=PBw@mail.gmail.com>
 <c00ed41c-e13e-6bd6-4084-501ca14adb4c@csgroup.eu>
 <877dx6g1rr.fsf@linux.ibm.com>
 <dbaa79c9-dfae-9cb1-cac4-3a198ca28cf0@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <73e4b911-79da-1b40-6f32-00bf23cca300@linux.ibm.com>
Date: Wed, 20 May 2020 19:59:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <dbaa79c9-dfae-9cb1-cac4-3a198ca28cf0@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_09:2020-05-19,
 2020-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 cotscore=-2147483648 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005200118
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/20 7:23 PM, Christophe Leroy wrote:
> 
> 
> Le 20/05/2020 à 15:43, Aneesh Kumar K.V a écrit :
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>
>>> Le 18/05/2020 à 17:19, Rui Salvaterra a écrit :
>>>> Hi again, Christophe,
>>>>
>>>> On Mon, 18 May 2020 at 15:03, Christophe Leroy
>>>> <christophe.leroy@csgroup.eu> wrote:
>>>>>
>>>>> Can you try reverting 697ece78f8f749aeea40f2711389901f0974017a ? It 
>>>>> may
>>>>> have broken swap.
>>>>
>>>> Yeah, that was a good call. :) Linux 5.7-rc1 with the revert on top
>>>> survives the beating. I'll be happy to test a definitive patch!
>>>>
>>>
>>> Yeah I discovered recently that the way swap is implemented on powerpc
>>> expects RW and other important bits not be one of the 3 least
>>> significant bits (see __pte_to_swp_entry() )
>>
>> The last 3 bits are there to track the _PAGE_PRESENT right? What is the
>> RW dependency there? Are you suggesting of read/write migration entry?
>> A swap entry should not retain the pte rw bits right?
>>
>> A swap entry is built using swap type + offset. And it should not have a
>> dependency on pte RW bits. Along with type and offset we also should
>> have the ability to mark it as a pte entry and also set not present
>> bits. With that understanding what am I missing here?
> 
> That's probably me who is missing something, I have not digged into the 
> swap functionning yet indeed, so that was only my first feeling.
> 
> By the way, the problems is definitely due to the order changes in the 
> PTE bits, whether that's because _PAGE_RW was moved to the last 3 bits 
> or whether that's because _PAGE_PRESENT was moved out of the last 3 
> bits, I don't know yet.
> 
> My (bad) understanding is from the fact that  __pte_to_swp_entry() is a 
> right shift by 3 bits, so it looses the last 3 bits, and therefore 
> __swp_entry_to_pte(__pte_to_swp_entry(pte)) looses the last 3 bits of a 
> PTE.
> 
> Is there somewhere a description of how swap works exactly ?
> 

Looking at  __set_pte_at(), I am wondering whether this was due to 
_PAGE_HASHPTE? . This would mean we end up wrongly updating some swap 
entry details. We call set_pte_at() on swap pte entries.

-aneesh



