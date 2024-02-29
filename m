Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B416686C53A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 10:31:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlmF22PFkz3vcG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 20:31:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlmDb560Tz3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 20:30:54 +1100 (AEDT)
X-UUID: 24b017bdb2e34ae8b18dac649537834a-20240229
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:080b2373-30c8-484d-a9e2-158fffc50fff,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-INFO: VERSION:1.1.37,REQID:080b2373-30c8-484d-a9e2-158fffc50fff,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-META: VersionHash:6f543d0,CLOUDID:8dbe57ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:240229172943HMO26OBX,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|64|6
	6|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 24b017bdb2e34ae8b18dac649537834a-20240229
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 619597757; Thu, 29 Feb 2024 17:29:41 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 66BB4E000EBC;
	Thu, 29 Feb 2024 17:29:41 +0800 (CST)
X-ns-mid: postfix-65E04E85-347519924
Received: from [172.20.15.254] (unknown [172.20.15.254])
	by mail.kylinos.cn (NSMail) with ESMTPA id 40885E000EBC;
	Thu, 29 Feb 2024 17:28:54 +0800 (CST)
Message-ID: <d0ac1160-13ae-4753-a4c8-4d78056e923e@kylinos.cn>
Date: Thu, 29 Feb 2024 17:28:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm: Code cleanup for __hash_page_thp
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com
References: <20240125092624.537564-1-chentao@kylinos.cn>
 <87h6hva4b0.fsf@mail.lhotse>
 <f3b53f0e-58ce-4b2d-ba91-f347da73f9f3@kylinos.cn>
 <87jzmq5tjr.fsf@mail.lhotse> <87bk80kjup.fsf@kernel.org>
 <87wmqng5dz.fsf@mail.lhotse>
Content-Language: en-US
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <87wmqng5dz.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks all for the reply.
On 2024/2/29 14:18, Michael Ellerman wrote:
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> Kunwu Chan <chentao@kylinos.cn> writes:
>>>> On 2024/2/26 18:49, Michael Ellerman wrote:
>>>>> Kunwu Chan <chentao@kylinos.cn> writes:
>>>>>> This part was commented from commit 6d492ecc6489
>>>>>> ("powerpc/THP: Add code to handle HPTE faults for hugepages")
>>>>>> in about 11 years before.
>>>>>>
>>>>>> If there are no plans to enable this part code in the future,
>>>>>> we can remove this dead code.
>>>>>
>>>>> I agree the code can go. But I'd like it to be replaced with a comment
>>>>> explaining what the dead code was trying to say.
>>>
>>>> Thanks, i'll update a new patch with the following comment:
>>>>       /*
>>>>       * No CPU has hugepages but lacks no execute, so we
>>>>       * don't need to worry about cpu no CPU_FTR_COHERENT_ICACHE feature case
>>>>       */
>>>
>>> Maybe wait until we can get some input from Aneesh. I'm not sure the
>>> code/comment are really up to date.
>>
>> How about?
>>
>> modified   arch/powerpc/mm/book3s64/hash_hugepage.c
>> @@ -58,17 +58,13 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
>>   		return 0;
>>   
>>   	rflags = htab_convert_pte_flags(new_pmd, flags);
>> +	/*
>> +	 * THPs are only supported on platforms that can do mixed page size
>> +	 * segments (MPSS) and all such platforms have coherent icache. Hence we
>> +	 * don't need to do lazy icache flush (hash_page_do_lazy_icache()) on
>> +	 * noexecute fault.
>> +	 */
> 
I'll use this comment in v2 patch.
And add two Suggested-by: label for you.

> Yeah thanks that looks good.
> 
> It could say "see eg. __hash_page_4K()", but that's probably unnecessary
> as it mentions hash_page_do_lazy_icache(), and anyone interested is just
> going to grep for that anyway.
> 
> cheers
-- 
Thanks,
   Kunwu

