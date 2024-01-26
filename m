Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640683D244
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 02:53:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLgh01psfz3cYP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 12:53:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLggX5BVHz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 12:52:39 +1100 (AEDT)
X-UUID: 6a7b8463e0a645f28ededf1d58389596-20240126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:59037ac4-36cb-470d-b716-35c6b8b38542,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35,REQID:59037ac4-36cb-470d-b716-35c6b8b38542,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:96a14483-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:240125214804HZSUUVB8,BulkQuantity:5,Recheck:0,SF:38|24|17|19|44|64|6
	6|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 6a7b8463e0a645f28ededf1d58389596-20240126
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 446807232; Fri, 26 Jan 2024 09:51:23 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 3F65EE000EB9;
	Fri, 26 Jan 2024 09:51:23 +0800 (CST)
X-ns-mid: postfix-65B3101B-180436399
Received: from [172.20.15.234] (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id E878EE000EB9;
	Fri, 26 Jan 2024 09:51:15 +0800 (CST)
Message-ID: <e27dfc1a-ec0a-4b04-b7dd-9e664595ef8d@kylinos.cn>
Date: Fri, 26 Jan 2024 09:51:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm/hash: Code cleanup
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com
References: <20240125094636.539372-1-chentao@kylinos.cn>
 <e017718b-d385-41de-9139-0265cf3e6149@kernel.org>
Content-Language: en-US
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <e017718b-d385-41de-9139-0265cf3e6149@kernel.org>
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

On 2024/1/25 21:47, Aneesh Kumar K.V wrote:
> On 1/25/24 3:16 PM, Kunwu Chan wrote:
>> This part was commented in about 17 years before.
>> If there are no plans to enable this part code in the future,
>> we can remove this dead code.
>>
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>> ---
>>   arch/powerpc/include/asm/book3s/64/mmu-hash.h | 22 -------------------
>>   1 file changed, 22 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>> index 1c4eebbc69c9..d39ec7134a78 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>> @@ -731,26 +731,6 @@ struct hash_mm_context {
>>   #endif /* CONFIG_PPC_SUBPAGE_PROT */
>>   };
>>   
>> -#if 0
>> -/*
>> - * The code below is equivalent to this function for arguments
>> - * < 2^VSID_BITS, which is all this should ever be called
>> - * with.  However gcc is not clever enough to compute the
>> - * modulus (2^n-1) without a second multiply.
>> - */
>> -#define vsid_scramble(protovsid, size) \
>> -	((((protovsid) * VSID_MULTIPLIER_##size) % VSID_MODULUS_##size))
>> -
>> -/* simplified form avoiding mod operation */
>> -#define vsid_scramble(protovsid, size) \
>> -	({								 \
>> -		unsigned long x;					 \
>> -		x = (protovsid) * VSID_MULTIPLIER_##size;		 \
>> -		x = (x >> VSID_BITS_##size) + (x & VSID_MODULUS_##size); \
>> -		(x + ((x+1) >> VSID_BITS_##size)) & VSID_MODULUS_##size; \
>> -	})
>> -
>> -#else /* 1 */
>>   static inline unsigned long vsid_scramble(unsigned long protovsid,
>>   				  unsigned long vsid_multiplier, int vsid_bits)
>>   {
>> @@ -764,8 +744,6 @@ static inline unsigned long vsid_scramble(unsigned long protovsid,
>>   	return (vsid + ((vsid + 1) >> vsid_bits)) & vsid_modulus;
>>   }
>>   
>> -#endif /* 1 */
>> -
>>   /* Returns the segment size indicator for a user address */
>>   static inline int user_segment_size(unsigned long addr)
>>   {
> 
> That was done to make sure one can follow the actual compiled code better.
Thanks for your explanation. It's my bad.
> 
> -aneesh
> 
-- 
Thanks,
   Kunwu

