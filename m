Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D04CB33FD4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 03:38:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1B5g62jMz3bxV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 13:37:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1B5M2tlgz2yRy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 13:37:41 +1100 (AEDT)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F1B312bPkz90G6;
 Thu, 18 Mar 2021 10:35:41 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 10:37:26 +0800
Subject: Re: [PATCH] powerpc: arch/powerpc/kernel/setup_64.c - cleanup warnings
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Axtens <dja@axtens.net>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <akpm@linux-foundation.org>, <aneesh.kumar@linux.ibm.com>, <rppt@kernel.org>, 
 <ardb@kernel.org>, <clg@kaod.org>, <christophe.leroy@csgroup.eu>
References: <20210316041148.29694-1-heying24@huawei.com>
 <87wnu6bhvi.fsf@dja-thinkpad.axtens.net>
 <f0130916-a8f3-75ba-b5da-7d37d9139ff3@huawei.com>
 <87tupab4a1.fsf@dja-thinkpad.axtens.net> <877dm6ouw5.fsf@mpe.ellerman.id.au>
From: "heying (H)" <heying24@huawei.com>
Message-ID: <aa312971-cedd-38bf-ac5c-6f3d4ff2c208@huawei.com>
Date: Thu, 18 Mar 2021 10:37:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <877dm6ouw5.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-CFilter-Loop: Reflected
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/3/17 19:57, Michael Ellerman 写道:
> Daniel Axtens <dja@axtens.net> writes:
>> "heying (H)" <heying24@huawei.com> writes:
>>
>>> Thank you for your reply.
>>>
>>> 在 2021/3/17 11:04, Daniel Axtens 写道:
>>>> Hi He Ying,
>>>>
>>>> Thank you for this patch.
>>>>
>>>> I'm not sure what the precise rules for Fixes are, but I wonder if this
>>>> should have:
>>>>
>>>> Fixes: 9a32a7e78bd0 ("powerpc/64s: flush L1D after user accesses")
>>>> Fixes: f79643787e0a ("powerpc/64s: flush L1D on kernel entry")
>>> Is that necessary for warning cleanups? I thought 'Fixes' tags are
>>> needed only for
>>>
>>> bugfix patches. Can someone tell me whether I am right?
>> Yeah, I'm not sure either. Hopefully mpe will let us know.
> It's not necessary to add a Fixes tag for a patch like this, but you can
> add one if you think it's important that the fix gets backported.
>
> I don't think the cleanups in this case are that important, so I
> wouldn't bother with a Fixes tag.
Okay. That's a good explanation to me. Thanks.


