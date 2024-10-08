Return-Path: <linuxppc-dev+bounces-1819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE29942D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 10:53:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN8vJ3VRfz2xkr;
	Tue,  8 Oct 2024 19:53:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728377628;
	cv=none; b=IS4LZvf7Anno5l3kNrRwcLaRP0Oz67tqOBJlcXEIkt3bUFUEyxIztqGF9dh42BjI6RcSuOk8w0GRyybCtWmcYIclAmepzJHfjRJwN9Iuo1Tm0KUwNGkij+TCxyATHX201s7+ztDUAYp6Em7xcTlKzp3i1zPepSF/lsC7f0w/SeMWE/MSr/bicbXst2IOMIFZSuRpptl2mkfU8f3ZCTClzQmfpIKNih0Ur1AecG5zGPcQp88mEg8Yd0A70u5YNw2hOrBbwCu+TsIpyJZBjb9lovtuc35htc276jpJW4Aib+MRHZp5waXKp594+N1mvgRC/cFQYJ+FD+g5Db7/23I95A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728377628; c=relaxed/relaxed;
	bh=utNfZ8EiGEZYcnX/O5iWnt87sJpMFhcZjS6FGGNttHQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=JOwHw8+sRadv3mHELGh44mOulDlYqiFjQGQtXah8PtUcLUXk/KJ43UcSA/sWMDWJUJ6ZKC6HjZARJHmi/Z/f4UPz93lFOC9jpj7F2V6WmxfAExCQOq7d0C6WB9N9SlquNCQunW0Qto/yLmKfB68LeDFAxZbMxLcyz4zNqRjpbT3TJMbQfoRvri29L/RYRqdLQ82yBwfpXF1z0yB4/GquvxE7N0fS2dHpvD0PhCpQeMXfsmthgsPiw4DW0hBdaxGGwaBNBAxVW+p+q6HtGn9iFJJZimLCqm0e3j5GF2ax5rcvSBwWNT16m09VIuMl7V8nOUyAMtZV+7nfMnSzFoDVmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN8vG6mbcz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 19:53:46 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XN8pS0SVLz1HK8K;
	Tue,  8 Oct 2024 16:49:36 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 97F501A0188;
	Tue,  8 Oct 2024 16:53:40 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 8 Oct 2024 16:53:39 +0800
Message-ID: <9380c85f-6e83-4c37-a0da-fc6fa97b7e70@huawei.com>
Date: Tue, 8 Oct 2024 16:53:07 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
Subject: Re: [PATCH] powerpc/kexec: Fix the return of uninitialized variable
To: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: <chenjun102@huawei.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <naveen@kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
References: <20240930075628.125138-1-zhangzekun11@huawei.com>
 <37ee3c12-8a88-45ca-a70b-72af504e0d2b@csgroup.eu>
 <67db60e6-8f61-4907-8a7c-93cd0d4cb034@linux.ibm.com>
In-Reply-To: <67db60e6-8f61-4907-8a7c-93cd0d4cb034@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.82]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

在 2024/9/30 17:01, Madhavan Srinivasan 写道:
> 
> 
> On 9/30/24 1:57 PM, Christophe Leroy wrote:
>>
>>
>> Le 30/09/2024 à 09:56, Zhang Zekun a écrit :
>>> [Vous ne recevez pas souvent de courriers de zhangzekun11@huawei.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> The of_property_read_u64() can fail and remain the variable uninitialized,
>>
>> Replace "remain" by "leave".
>>
>>> which will then be used. Return error if we failed to read the property.
>>
>> Rewrite to avoid "we".  For instance "Return error if reading the property failed"
>>
>>>
>>> Fixes: 2e6bd221d96f ("powerpc/kexec_file: Enable early kernel OPAL calls")
>>> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
>>> ---
>>>    arch/powerpc/kexec/file_load_64.c | 9 +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
>>> index 9738adabeb1f..dc65c1391157 100644
>>> --- a/arch/powerpc/kexec/file_load_64.c
>>> +++ b/arch/powerpc/kexec/file_load_64.c
>>> @@ -736,13 +736,18 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>>>           if (dn) {
>>>                   u64 val;
> 
> Instead cant we init val as -1 ??
> Why to add check?
> 

Hi, Madhavan,

I am not sure when the default value -1 will be checked, and it would be 
more obvious to me to add check when reading property failed. Besides, 
in arch/powerpc, checking the return val when of_property_read_u64() 
failed seems to be a more common way.

Best Regards,
Zekun

