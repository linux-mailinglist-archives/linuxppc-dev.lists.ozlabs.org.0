Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A0948FC7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 14:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdYHY1zdTz3fSV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 22:57:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdYH84fv3z3ccX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 22:57:04 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WdY9l24F4zQnYT;
	Tue,  6 Aug 2024 20:52:27 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id F1CDD18009B;
	Tue,  6 Aug 2024 20:56:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi100008.china.huawei.com (7.221.188.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 20:56:52 +0800
Message-ID: <fa26e911-adb1-8410-5e7c-1ca5a1302e77@huawei.com>
Date: Tue, 6 Aug 2024 20:56:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] powerpc: Fix a config comment typo in asm/percpu.h
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <dennis@kernel.org>,
	<tj@kernel.org>, <cl@linux.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<naveen@kernel.org>, <linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
References: <20240806112345.2387969-1-ruanjinjie@huawei.com>
 <135289c2-78bc-4a14-ad43-6d45750af293@csgroup.eu>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <135289c2-78bc-4a14-ad43-6d45750af293@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi100008.china.huawei.com (7.221.188.57)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2024/8/6 20:50, Christophe Leroy wrote:
> 
> 
> Le 06/08/2024 à 13:23, Jinjie Ruan a écrit :
>> [Vous ne recevez pas souvent de courriers de ruanjinjie@huawei.com.
>> Découvrez pourquoi ceci est important à
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> commit 0db880fc865f ("powerpc: Avoid nmi_enter/nmi_exit in real mode
>> interrupt.") has a config comment typo, fix it.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   arch/powerpc/include/asm/percpu.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/percpu.h
>> b/arch/powerpc/include/asm/percpu.h
>> index 634970ce13c6..c836b16ce30d 100644
>> --- a/arch/powerpc/include/asm/percpu.h
>> +++ b/arch/powerpc/include/asm/percpu.h
>> @@ -23,7 +23,7 @@
>> DECLARE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);
>>                  (static_key_enabled(&__percpu_first_chunk_is_paged.key))
>>   #else
>>   #define percpu_first_chunk_is_paged    false
>> -#endif /* CONFIG_PPC64 && CONFIG_SMP */
>> +#endif /* CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK && CONFIG_SMP */
> 
> The #if/#else/#endif section is small and doesn't nest additional
> #ifdefs so the comment is useless and should be removed completely.

OK, I'll send v2 to remove it, thank you!

> 
> Christophe
> 
