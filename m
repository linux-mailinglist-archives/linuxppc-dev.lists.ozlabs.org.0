Return-Path: <linuxppc-dev+bounces-4126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC769F1D9B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2024 09:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y9Knp56f6z2yGT;
	Sat, 14 Dec 2024 19:56:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734166606;
	cv=none; b=fWHv6Mhf28obHNYabvdyIplHXBTQAybKs/QFLOE0NPOK2zAnGdmSX+qSFkM/D13Qwb46hKIs1N8uIoVJpnl5PvLzArEi/LCJE2kM6E1Cgv/cpNtmwto9cPxn0x7aMyTfEW8qcP7f4YgmQxOkPVN1gfY8yiIRw8IfL8lHXpwUvg/UruvGDex0COhEWVlTDeu3lAJ4XmwzapA1J8k6PbsMIhtlepsEaO0ogv4nLc0kn3xaCpIaaarWK7zN7/NIrcJSo5KU/WOVf9kiwp6puiHoPNYzGRWq6GJaTTZlbFd/9E/SMNTPn5/AXlwQEbCaXDOJkQAiPwksd924/qdWmDfFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734166606; c=relaxed/relaxed;
	bh=Icnl6ZP/Ym0aw0YNz8bnj3d57dL7pTd9MGyM8XjuPyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pbl0H4simTtkwCK/D8yLp1oudMKjqU8NHpV5b3JPvMNk/rW+uBvklbIxLy7xb2dHlw6J3w5kgv+r7J1PV6acB0QtO4Rj/kkWKoSoRU/ZPuQ7DG3CDzsXQl4uBGQu6RCLnilmxZ2oOu7YnHAF2QKvXPFyBOsxPBd9PtBUaZjJNdXdpsKf+gw6UY6FhyeiWZqoAwnDQ5jtvHypzv30TVD84Uws4hyi7CbiPGPREIa3fDrh6lgoFnZhWHUqxRHSaPvps7q5Ry8Z0jLwmh/bPLj8O9FDleevPW4Xm/dRYgVSf1tM02H4H3Zl5oIyOiN6g8eEjs85APG1NQFfLRnSvx1eDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1096 seconds by postgrey-1.37 at boromir; Sat, 14 Dec 2024 19:56:44 AEDT
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y9Knm16n6z2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 19:56:39 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Y9KNp5ZCgz20lpM;
	Sat, 14 Dec 2024 16:38:34 +0800 (CST)
Received: from kwepemo500008.china.huawei.com (unknown [7.202.195.163])
	by mail.maildlp.com (Postfix) with ESMTPS id 33C09180044;
	Sat, 14 Dec 2024 16:38:17 +0800 (CST)
Received: from [10.67.111.172] (10.67.111.172) by
 kwepemo500008.china.huawei.com (7.202.195.163) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 14 Dec 2024 16:38:15 +0800
Message-ID: <7266ee61-3085-74fc-2560-c62fc34c2148@huawei.com>
Date: Sat, 14 Dec 2024 16:37:59 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 0/5] kallsyms: Emit symbol for holes in text and fix
 weak function issue
Content-Language: en-US
To: Martin Kelly <martin.kelly@crowdstrike.com>, "masahiroy@kernel.org"
	<masahiroy@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "pasha.tatashin@soleen.com"
	<pasha.tatashin@soleen.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"james.clark@arm.com" <james.clark@arm.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "nicolas@fjasle.eu"
	<nicolas@fjasle.eu>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"nathan@kernel.org" <nathan@kernel.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "surenb@google.com" <surenb@google.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "naveen.n.rao@linux.ibm.com"
	<naveen.n.rao@linux.ibm.com>, "kent.overstreet@linux.dev"
	<kent.overstreet@linux.dev>, "bp@alien8.de" <bp@alien8.de>,
	"yeweihua4@huawei.com" <yeweihua4@huawei.com>,
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>
CC: Amit Dang <amit.dang@crowdstrike.com>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
 <44353f4cd4d1cc7170d006031819550b37039dd2.camel@crowdstrike.com>
 <364aaf7c-cdc4-4e57-bb4c-f62e57c23279@csgroup.eu>
 <d25741d8a6f88d5a6c219fb53e8aa0bcc1fea982.camel@crowdstrike.com>
 <1f11e3c4-e8fd-d4ac-23cd-0ab2de9c1799@huaweicloud.com>
 <30ee9989044dad1a7083a85316d77b35f838e622.camel@crowdstrike.com>
From: Zheng Yejian <zhengyejian1@huawei.com>
In-Reply-To: <30ee9989044dad1a7083a85316d77b35f838e622.camel@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.172]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemo500008.china.huawei.com (7.202.195.163)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/12/14 03:31, Martin Kelly wrote:
> On Thu, 2024-12-12 at 17:52 +0800, Zheng Yejian wrote:
>> On 2024/12/11 04:49, Martin Kelly wrote:
>>>
>>>
>>> Zheng, do you plan to send a v3? I'd be happy to help out with this
>>> patch series if you'd like, as I'm hoping to get this issue
>>> resolved
>>> (though I am not an ftrace expert).
>>
>> Sorry to rely so late. Thanks for your feedback!
>>
>> Steve recently started a discussion of the issue in:
>>
>> https://lore.kernel.org/all/20241015100111.37adfb28@gandalf.local.home/
>> but there's no conclusion.
>>    
>> I can rebase this patch series and send a new version first, and
>> I'm also hoping to get more feedbacks and help to resolve the issue.
>>
> 
> Hi Zheng,
> 
> I may have misunderstood, but based on the final message from Steven, I
> got the sense that the idea listed in that thread didn't work out and
> we should proceed with your current approach.

This patch set attempts to add length information of symbols to kallsyms,
which can then ensure that there is only one valid fentry within the range
of function length.

However, I think this patch set actually has some performance implications,
including：
   1. Adding hole symbols may cause the symbol table to grow significantly;
   2. When parsing fentry tables, excluding invalid fentries through kallsyms lookups
      may also increase boot or module load times slightly.

The direct cause of this issue is the wrong fentry being founded by ftrace_location(),
following the approach of "FTRACE_MCOUNT_MAX_OFFSET", narrowing down the search range
and re-finding may also solve this problem, demo patch like below (not
fully tested):

     diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
     index 9b17efb1a87d..7d34320ca9d1 100644
     --- a/kernel/trace/ftrace.c
     +++ b/kernel/trace/ftrace.c
     @@ -1678,8 +1678,11 @@ unsigned long ftrace_location(unsigned long ip)
                             goto out;
     
                     /* map sym+0 to __fentry__ */
     -               if (!offset)
     +               if (!offset) {
                             loc = ftrace_location_range(ip, ip + size - 1);
     +                       while (loc > ip && loc - ip > FTRACE_MCOUNT_MAX_OFFSET)
     +                               loc = ftrace_location_range(ip, loc - 1);
     +               }
             }

Steve, Peter, what do you think?

> 
> Please consider me an interested party for this patch series, and let
> me know if there's anything I can do to help speed it along (co-
> develop, test, anything else). And of course, thanks very much for your
> work thus far!

-- 
Thanks,
Zheng Yejian


