Return-Path: <linuxppc-dev+bounces-5931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7807EA2B9C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 04:33:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yq01g5jx1z30Ds;
	Fri,  7 Feb 2025 14:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738899223;
	cv=none; b=lZ1cLT2ChlGwF/rQpYMboswXudVZxYyYZmsdpqz4LznqxO3DT30KNKd8rVsRgUARINPlapAChaJXRIcET4y4a4j5GTM1YK1DCPxYIbK1lQNN+Nmi9j/rLLeTzNHGPUlPKr38NI5UgeVkZp0c++IFtvwfdPGBcw/VGeIg5Wdy1xNJAH9cOvlJaI3/XHrUyC0H3C18/2UmXTSkyOxUGNYWONOreFKhedz35hWgwgDr5HML0zZ7gkd4Drg8Sl+XInWvNbmRd4c7zIxxluZwHyiBJKC+Es/hsu0zJD8JCSXJB3sPCpIXIYHVmqZc2viWI01EkL5CbE+aaVJgeQPcyqqYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738899223; c=relaxed/relaxed;
	bh=qtlF0+eelMv2IoPK4lrHlRlhEYPkdWZ7DeLBnWcod9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GiG67tm1Rdn6SFlM3CoM3Q6DZPxb46n5QlWcCW72A/u94JXtSHAIpNntg8b8DiVKP+HwOEa0w56ezi98O23MDrY6JUfWR6dPE/8BEK7eDYB31pW5tUcORwIAdd0/hrcAzYuVvzYkCK6lzlYQevnfdYKcAmALNcnlZIQJAJc90SW7W7jK6LBYqUdTIA6Hzo+xwAfN9kHi/jloRUQ7JKUJSrJdSQ13Nozvcc/81gc+WoUasqWzi1J6HSyBP8XvnybEozJMwxfA2VRu3N1yc82liiWFMFlecbNH3S9UYdg9Naw48jm52V84GvAM1JzwEGzeExJ+SvZdlHh7U1LJsPsSwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1027 seconds by postgrey-1.37 at boromir; Fri, 07 Feb 2025 14:33:40 AEDT
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yq01c6xm0z305S
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 14:33:38 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YpzZR55hNzmZB8;
	Fri,  7 Feb 2025 11:13:35 +0800 (CST)
Received: from kwepemo500008.china.huawei.com (unknown [7.202.195.163])
	by mail.maildlp.com (Postfix) with ESMTPS id 0B6C41400DD;
	Fri,  7 Feb 2025 11:16:23 +0800 (CST)
Received: from [10.67.111.172] (10.67.111.172) by
 kwepemo500008.china.huawei.com (7.202.195.163) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Feb 2025 11:16:21 +0800
Message-ID: <7960f4a0-e45e-7cfd-fa36-97732139d238@huawei.com>
Date: Fri, 7 Feb 2025 11:16:21 +0800
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
To: Steven Rostedt <rostedt@goodmis.org>
CC: Martin Kelly <martin.kelly@crowdstrike.com>, "masahiroy@kernel.org"
	<masahiroy@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "pasha.tatashin@soleen.com"
	<pasha.tatashin@soleen.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"james.clark@arm.com" <james.clark@arm.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"nicolas@fjasle.eu" <nicolas@fjasle.eu>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "nathan@kernel.org" <nathan@kernel.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "hpa@zytor.com" <hpa@zytor.com>, "surenb@google.com"
	<surenb@google.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
	"kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "bp@alien8.de"
	<bp@alien8.de>, "yeweihua4@huawei.com" <yeweihua4@huawei.com>,
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>, Amit Dang
	<amit.dang@crowdstrike.com>, "linux-modules@vger.kernel.org"
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
 <7266ee61-3085-74fc-2560-c62fc34c2148@huawei.com>
 <20250121124851.2205a8b2@gandalf.local.home>
Content-Language: en-US
From: Zheng Yejian <zhengyejian1@huawei.com>
In-Reply-To: <20250121124851.2205a8b2@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.172]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemo500008.china.huawei.com (7.202.195.163)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/1/22 01:48, Steven Rostedt wrote:
> 
> Sorry for the late reply. Forgot about this as I was focused on other end-of-year issues.
> 
> On Sat, 14 Dec 2024 16:37:59 +0800
> Zheng Yejian <zhengyejian1@huawei.com> wrote:
> 
>> The direct cause of this issue is the wrong fentry being founded by ftrace_location(),
>> following the approach of "FTRACE_MCOUNT_MAX_OFFSET", narrowing down the search range
>> and re-finding may also solve this problem, demo patch like below (not
>> fully tested):
>>
>>       diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
>>       index 9b17efb1a87d..7d34320ca9d1 100644
>>       --- a/kernel/trace/ftrace.c
>>       +++ b/kernel/trace/ftrace.c
>>       @@ -1678,8 +1678,11 @@ unsigned long ftrace_location(unsigned long ip)
>>                               goto out;
>>       
>>                       /* map sym+0 to __fentry__ */
>>       -               if (!offset)
>>       +               if (!offset) {
>>                               loc = ftrace_location_range(ip, ip + size - 1);
>>       +                       while (loc > ip && loc - ip > FTRACE_MCOUNT_MAX_OFFSET)
>>       +                               loc = ftrace_location_range(ip, loc - 1);
>>       +               }
>>               }
>>
>> Steve, Peter, what do you think?
> 
> Hmm, removing the weak functions from the __mcount_loc location should also
> solve this, as the ftrace_location_range() will not return a weak function
> if it's not part of the __mcount_loc table.
> 
> That is, would this patchset work?
> 
>    https://lore.kernel.org/all/20250102232609.529842248@goodmis.org/

I only pick patch15 and patch16 into v6.14-rc1, since most of patches in that patches
have already merged, and the issue seems gone, thanks!

> 
> -- Steve

-- 
Thanks,
Zheng Yejian


