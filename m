Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ED17FEB1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 09:47:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgqZ41GZ5z3dHj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 19:47:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgqYX5z9Qz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 19:46:39 +1100 (AEDT)
X-UUID: bbf83f5519c64001820e8adab843fb59-20231130
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:1f045da6-0a69-490e-9e7e-fc6b65c2ccdc,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:1,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-4
X-CID-INFO: VERSION:1.1.33,REQID:1f045da6-0a69-490e-9e7e-fc6b65c2ccdc,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:1,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-4
X-CID-META: VersionHash:364b77b,CLOUDID:44b920fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:2311301645260GQJUH6C,BulkQuantity:0,Recheck:0,SF:24|17|19|44|64|66|3
	8|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: bbf83f5519c64001820e8adab843fb59-20231130
X-User: chentao@kylinos.cn
Received: from [172.20.15.254] [(116.128.244.169)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 534903993; Thu, 30 Nov 2023 16:45:23 +0800
Message-ID: <5586e0f0-8e4f-4096-8383-bf3f80fae6f7@kylinos.cn>
Date: Thu, 30 Nov 2023 16:45:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm: Fix null-pointer dereference in
 pgtable_cache_add
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "npiggin@gmail.com" <npiggin@gmail.com>
References: <20231122090026.11728-1-chentao@kylinos.cn>
 <32077b74-7335-4f4d-8858-c53c820150d0@csgroup.eu>
 <9d871364-7baa-4daf-8b0c-3fbfbede6fdb@kylinos.cn>
 <1701224210300483.328.seg@mailgw>
Content-Language: en-US
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <1701224210300483.328.seg@mailgw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kunwu.chan@hotmail.com" <kunwu.chan@hotmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for your reply.

Ok, I know what you mean, when name is NULL. The process should be 
aborted and the specific reason for the error should be printed, not 
just return.

I will update v2 patch with "panic".

Thanks again,
Kunwu

On 2023/11/28 19:32, Michael Ellerman wrote:
> Kunwu Chan <chentao@kylinos.cn> writes:
>> Hi Christophe,
>>
>> Thanks for your reply.
>> It's my bad. According your reply, i read the code in
>> sysfs_do_create_link_sd.There is a null pointer check indeed.
>>
>> My intention was to check null pointer after memory allocation.
>> Whether we can add a comment here for someone like me, the null pointer
>> check is no need here?
> 
> I don't mind there being a NULL check for name.
> 
> But the code shouldn't silently return if name can't be allocated.
> Notice that if we can't create the cache we *panic*. A failure to
> allocate name, which causes us to skip the cache creation, needs to also
> panic.
> 
> cheers
> 
>> On 2023/11/24 23:17, Christophe Leroy wrote:
>>>
>>>
>>> Le 22/11/2023 à 10:00, Kunwu Chan a écrit :
>>>> [Vous ne recevez pas souvent de courriers de chentao@kylinos.cn. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> kasprintf() returns a pointer to dynamically allocated memory
>>>> which can be NULL upon failure. Ensure the allocation was successful
>>>> by checking the pointer validity.
>>>
>>> Are you sure this is needed ? Did you check what happens what name is NULL ?
>>>
>>> If I followed stuff correctly, I end up in function
>>> sysfs_do_create_link_sd() which already handles the NULL name case which
>>> a big hammer warning.
>>>
>>>>
>>>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>>>> ---
>>>>     arch/powerpc/mm/init-common.c | 2 ++
>>>>     1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
>>>> index 119ef491f797..0884fc601c46 100644
>>>> --- a/arch/powerpc/mm/init-common.c
>>>> +++ b/arch/powerpc/mm/init-common.c
>>>> @@ -139,6 +139,8 @@ void pgtable_cache_add(unsigned int shift)
>>>>
>>>>            align = max_t(unsigned long, align, minalign);
>>>>            name = kasprintf(GFP_KERNEL, "pgtable-2^%d", shift);
>>>> +       if (!name)
>>>> +               return;
>>>>            new = kmem_cache_create(name, table_size, align, 0, ctor(shift));
>>>>            if (!new)
>>>>                    panic("Could not allocate pgtable cache for order %d", shift);
>>>> --
>>>> 2.34.1
>>>>
