Return-Path: <linuxppc-dev+bounces-392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA3595BA08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:26:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRqj3GfHz2yhG;
	Fri, 23 Aug 2024 01:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724340369;
	cv=none; b=oSh4GC13+G+NZbtbb7ODhLtH2p+GQb1CLOaCxHoH8JmnCSYvV1vlP81KwnPywUT0WklcuiPlyLA6yE9Gzhtq3Rz2aDox9c+zCsoBac9wMZYXtBdjYJ7bHhRMthohwkDTJvgRFSLYtcBh9IENmg3B26uQLjBw7RiwHRiW4P/BTblhYidjtzqiQsPjfIln39AoU0bNDWi89zaWAHka1huCoU4J01kDunIZ9zvjix1uiEqtMxloNs/+XJE4cfjFOr8RbkKlYuCoxlCPwkHXgO+dlg1NGowUq3W67NHyuBJtn/RhuWw8ys+c37rqiWhhbb3BRFv/ujfK8wPBdkiexnbuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724340369; c=relaxed/relaxed;
	bh=5K1VK5olyalbLnSKxZb7iTdUmKZ6ss9pkt6ndD7Zmno=;
	h=Received:Received:Received:Subject:To:CC:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy; b=CG4HPayfTtCXgn8wc5hVeY+qDlUG1iD1SYDoDWFWPrDa7OpYibXOJsUv/+C+X04UK2ypijFyG/XCo8tSIy7+nTCTAT87PhkHM032jFtWcnXg5Co07pTb7CBitxhjASpOgAxO6p1BQS3cjhtCcI5Hir0hFPgTJFkYpilfX/7ABG8NutvoAMakpaw/UyLr9c8VZKabxSUJsxsGTbMPJRYzyrD0T8yQ904Mwd9RPAM7nB+rWxULSmd79tj0hZRRXDFW/CJb1THSDeuuV/zE1CfugDXeYxPXnBtKm0FK+OuYQ1fMcNdLzQJ576h+dVZkCcie8Ld7CyEVDL9Y/laHtshpTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqRqh2rCfz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:26:03 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WqRp33Tp0zyQQ0;
	Thu, 22 Aug 2024 23:24:43 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 4715C1800FF;
	Thu, 22 Aug 2024 23:25:24 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 22 Aug 2024 23:25:23 +0800
Subject: Re: [PATCH -next 1/4] powerpc: Remove obsoleted declaration for
 _get_SP
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "naveen@kernel.org" <naveen@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@redhat.com"
	<david@redhat.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "bgray@linux.ibm.com"
	<bgray@linux.ibm.com>, "joel@jms.id.au" <joel@jms.id.au>,
	"bhelgaas@google.com" <bhelgaas@google.com>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
 <20240822130609.786431-2-cuigaosheng1@huawei.com>
 <1c4f7f77-ad18-4956-b794-98b452d0780c@cs-soprasteria.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <48668764-8a8f-98f8-909a-8406207499d7@huawei.com>
Date: Thu, 22 Aug 2024 23:25:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <1c4f7f77-ad18-4956-b794-98b452d0780c@cs-soprasteria.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)


On 2024/8/22 22:16, LEROY Christophe wrote:
>
> Le 22/08/2024 à 15:06, Gaosheng Cui a écrit :
>> [Vous ne recevez pas souvent de courriers de cuigaosheng1@huawei.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The _get_SP() have been removed since
>> commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc"),
>> and now it is useless, so remove it.
> Not sure that commit is relevant since it relates to arch/ppc/ not
> arch/powerpc/
>
> For arch/powerpc/ I think it is commit f4db196717c6 ("[POWERPC] Remove
> _get_SP")

In commit 1da177e4c3f4, linux implemented the _get_SP function in misc.S
and declared and use it in arch/ppc/kernel/process.c, the declaration
of _get_SP in arch/powerpc/kernel/process.c was introduced in commit
14cf11af6cf608, but at this time arch/powerpc/kernel/misc_32.S has not
been introduced yet，so I think the declaration belongs to _get_SP in the
misc.S，it have been removed since commit 917f0af9e5a9.

In addition, commit f4db196717c6 is v2.6.22 but 917f0af9e5a9 is v2.6.27, so I think
it is commit 917f0af9e5a9.

anything others？thanks very much.

>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>>    arch/powerpc/kernel/process.c | 2 --
>>    1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
>> index 3b506d4c55f3..e7b70c2cc001 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -72,8 +72,6 @@
>>    #define TM_DEBUG(x...) do { } while(0)
>>    #endif
>>
>> -extern unsigned long _get_SP(void);
>> -
>>    #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>    /*
>>     * Are we running in "Suspend disabled" mode? If so we have to block any
>> --
>> 2.25.1
>>

