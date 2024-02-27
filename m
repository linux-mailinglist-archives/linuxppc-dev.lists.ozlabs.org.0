Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC03868C58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 10:34:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkXPZ4fCpz3vbf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 20:34:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkXP94xd3z3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 20:34:04 +1100 (AEDT)
X-UUID: 04dd6100f9db49eca84d0368d5430b66-20240227
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:18887999-32c5-4984-a351-bdc40445c46d,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.37,REQID:18887999-32c5-4984-a351-bdc40445c46d,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:d9a243ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:240227111434QEHVDYUI,BulkQuantity:10,Recheck:0,SF:19|44|64|66|38|24|
	17|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_OBB,
	TF_CID_SPAM_SNR
X-UUID: 04dd6100f9db49eca84d0368d5430b66-20240227
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 357849804; Tue, 27 Feb 2024 17:32:51 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 3BA63E000EBC;
	Tue, 27 Feb 2024 17:32:51 +0800 (CST)
X-ns-mid: postfix-65DDAC43-1699361025
Received: from [172.20.15.254] (unknown [172.20.15.254])
	by mail.kylinos.cn (NSMail) with ESMTPA id 78E8EE000EBC;
	Tue, 27 Feb 2024 17:32:47 +0800 (CST)
Message-ID: <407d25db-6302-49bb-952b-c53739fc4202@kylinos.cn>
Date: Tue, 27 Feb 2024 17:32:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm: Code cleanup for __hash_page_thp
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
References: <20240125092624.537564-1-chentao@kylinos.cn>
 <87h6hva4b0.fsf@mail.lhotse>
 <f3b53f0e-58ce-4b2d-ba91-f347da73f9f3@kylinos.cn>
 <87jzmq5tjr.fsf@mail.lhotse>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <87jzmq5tjr.fsf@mail.lhotse>
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
On 2024/2/27 14:07, Michael Ellerman wrote:
> Kunwu Chan <chentao@kylinos.cn> writes:
>> Thanks for the reply.
>>
>> On 2024/2/26 18:49, Michael Ellerman wrote:
>>> Kunwu Chan <chentao@kylinos.cn> writes:
>>>> This part was commented from commit 6d492ecc6489
>>>> ("powerpc/THP: Add code to handle HPTE faults for hugepages")
>>>> in about 11 years before.
>>>>
>>>> If there are no plans to enable this part code in the future,
>>>> we can remove this dead code.
>>>
>>> I agree the code can go. But I'd like it to be replaced with a comment
>>> explaining what the dead code was trying to say.
> 
>> Thanks, i'll update a new patch with the following comment:
>>       /*
>>       * No CPU has hugepages but lacks no execute, so we
>>       * don't need to worry about cpu no CPU_FTR_COHERENT_ICACHE feature case
>>       */
> 
> Maybe wait until we can get some input from Aneesh. I'm not sure the
> code/comment are really up to date.
I won't do anything until I get a reply.
I'll wait for the latest msg.

> 
> cheers
-- 
Thanks,
   Kunwu

