Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3258687A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 04:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkN153s9Fz3vZf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 14:16:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkN0f0txLz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 14:15:44 +1100 (AEDT)
X-UUID: c8ede15c63dc4319b205f5b6728f9dcf-20240227
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c3c17bce-c308-4406-879d-1df336acef54,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.37,REQID:c3c17bce-c308-4406-879d-1df336acef54,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:8a4cda80-4f93-4875-95e7-8c66ea833d57,B
	ulkID:240227111434QEHVDYUI,BulkQuantity:0,Recheck:0,SF:24|17|19|44|64|66|3
	8|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: c8ede15c63dc4319b205f5b6728f9dcf-20240227
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1125639519; Tue, 27 Feb 2024 11:14:32 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 4A023E000EBC;
	Tue, 27 Feb 2024 11:14:32 +0800 (CST)
X-ns-mid: postfix-65DD5398-216374431
Received: from [172.20.15.254] (unknown [172.20.15.254])
	by mail.kylinos.cn (NSMail) with ESMTPA id E330FE000EBC;
	Tue, 27 Feb 2024 11:14:28 +0800 (CST)
Message-ID: <f3b53f0e-58ce-4b2d-ba91-f347da73f9f3@kylinos.cn>
Date: Tue, 27 Feb 2024 11:14:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm: Code cleanup for __hash_page_thp
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
References: <20240125092624.537564-1-chentao@kylinos.cn>
 <87h6hva4b0.fsf@mail.lhotse>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <87h6hva4b0.fsf@mail.lhotse>
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

Thanks for the reply.

On 2024/2/26 18:49, Michael Ellerman wrote:
> Kunwu Chan <chentao@kylinos.cn> writes:
>> This part was commented from commit 6d492ecc6489
>> ("powerpc/THP: Add code to handle HPTE faults for hugepages")
>> in about 11 years before.
>>
>> If there are no plans to enable this part code in the future,
>> we can remove this dead code.
> 
> I agree the code can go. But I'd like it to be replaced with a comment
> explaining what the dead code was trying to say.
Thanks, i'll update a new patch with the following comment:
     /*
     * No CPU has hugepages but lacks no execute, so we
     * don't need to worry about cpu no CPU_FTR_COHERENT_ICACHE feature case
     */

> 
> cheers
> 
>> diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/book3s64/hash_hugepage.c
>> index c0fabe6c5a12..127a3a2c174b 100644
>> --- a/arch/powerpc/mm/book3s64/hash_hugepage.c
>> +++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
>> @@ -59,16 +59,6 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
>>   
>>   	rflags = htab_convert_pte_flags(new_pmd, flags);
>>   
>> -#if 0
>> -	if (!cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
>> -
>> -		/*
>> -		 * No CPU has hugepages but lacks no execute, so we
>> -		 * don't need to worry about that case
>> -		 */
>> -		rflags = hash_page_do_lazy_icache(rflags, __pte(old_pte), trap);
>> -	}
>> -#endif
>>   	/*
>>   	 * Find the slot index details for this ea, using base page size.
>>   	 */
>> -- 
>> 2.39.2
-- 
Thanks,
   Kunwu

