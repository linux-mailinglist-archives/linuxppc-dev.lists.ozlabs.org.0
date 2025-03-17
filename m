Return-Path: <linuxppc-dev+bounces-7128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28174A64C86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 12:29:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGXnB3zdwz2yhD;
	Mon, 17 Mar 2025 22:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742210974;
	cv=none; b=C5s6l+b2p9Aan5Mvi8Gn8C1LrquJ4LtmJ5fsfAha3EYg3wxrEgcYzEkkBYAYSa0jvuPjU2/SbCr3gn9YbGLoYhsoO0oBKU6JdyjB+4vak4Vbm+Tlk2YgDz7j7K3paQEvbc//BFabC+HmcOxAcHAqRsnQrV4BHCp5aICdQZ09QdBOZ0jp9ipg37XFfXiMgQDiuifjC1WqJgKQEuoNqKuIUNHP3mxEWcs2Njy3NcvUv05GGtasthc8KvBSgegdkbIXUswcTSpCDttqh/Fu96zNPipDRHWFx7VFpokxbje9gTmwq8uk42eb0EOKwx0Klc3lDXco6SnrOnFHwmPZp+mBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742210974; c=relaxed/relaxed;
	bh=tAmGDM/+7YlnQdB/9oOG+i2eP94QiP9D93TdqzjP8uQ=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QfrkNX7sxWRHsenVwftl4sskGk0CoMGXxcaBIq4LHghmNePo0JqGv0XtCb+oSKCfPt64sCYxnPre3l02LG33zWTru02eiuwZa/OylEbyiNp/1gKrtYFqwVNQkZY86IQa2cR+kPOK+79EOMDFN/0o18UNaQLJN33wWG8POW2c01kj3FlFSOqJFzV8lt1mj/g1EjxmhSVfv4EBkI2HE1QvwUMLVaWZ6TU9zVEVHQ8keeiSmpp1SORahFX6Qj+/YPujwglqe0AlPFdDN9X+6qqdHaO1RC8CD99DtW4BA+HJqSPOR7cbarPdRWKnsnTo3dllkaB1R+j8VQpasuV1tSSNjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGXn76h3Wz2ygm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 22:29:29 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZGXmj58Ndz1d0LT;
	Mon, 17 Mar 2025 19:29:09 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id B3002140360;
	Mon, 17 Mar 2025 19:29:20 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 17 Mar 2025 19:29:19 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v12 2/4] arch_topology: Support SMT control for OF based
 system
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
References: <20250311075143.61078-1-yangyicong@huawei.com>
 <20250311075143.61078-3-yangyicong@huawei.com>
 <2bd3aa0a-d700-46bf-81d1-a5fb0364d1e0@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <c88e5b78-37b7-3023-7842-56a93fe119d2@huawei.com>
Date: Mon, 17 Mar 2025 19:29:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
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
In-Reply-To: <2bd3aa0a-d700-46bf-81d1-a5fb0364d1e0@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-3.3 required=3.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/3/17 17:56, Dietmar Eggemann wrote:
> On 11/03/2025 08:51, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> On building the topology from the devicetree, we've already gotten the
>> SMT thread number of each core. Update the largest SMT thread number
>> and enable the SMT control by the end of topology parsing.
>>
>> The framework's SMT control provides two interface to the users [1]
>> through /sys/devices/system/cpu/smt/control:
>> 1) enable SMT by writing "on" and disable by "off"
>> 2) enable SMT by writing max_thread_number or disable by writing 1
>>
>> Both method support to completely disable/enable the SMT cores so both
>> work correctly for symmetric SMT platform and asymmetric platform with
>> non-SMT and one type SMT cores like:
>> core A: 1 thread
>> core B: X (X!=1) threads
>>
>> Note that for a theoretically possible multiple SMT-X (X>1) core
>> platform the SMT control is also supported as expected but only
>> by writing the "on/off" method.
> 
> Here we still have a little misunderstanding. IMHO, even on such a
> system 2) would work too.
> 


yes but only by writing the max_thread_number. e.g. a system with SMT number
of 1 (no SMT core), X, Y (Y > X), 1 works same as "off" and Y works same as
"on", as you shown below. write X will be blocked by the CPU framework:
estuary:/sys/devices/system/cpu/smt$ cat control
off
# emulated CPU 0-7,16-22 as SMT-2, CPU 8-11,24-27 as SMT-4
estuary:/sys/devices/system/cpu/smt$ cat ../online
0,2,4,6,8,12-16,18,20,22,24,28-31
estuary:/sys/devices/system/cpu/smt$ echo 2 > control
bash: echo: write error: Invalid argument
estuary:/sys/devices/system/cpu/smt$ echo 4 > control
estuary:/sys/devices/system/cpu/smt$ cat ../online
0-31

so method 1) will always match the expectation to fully enable/disable the
SMT on all cores, that's I mean here. But 2) won't work if user expected
to write 2 to enable SMT-2 (I think it'll will work if we support
CONFIG_SMT_NUM_THREADS_DYNAMIC on arm64 later).

Thanks.

> My qemu example with SMT-1, SMT-2 and SMT-4 in one system from your v11:
> 
> # cat /proc/schedstat | grep -v "^v\|^t" | awk '{print $1" "$2" "$3}'
> cpu0 0 0
> domain0 MC ff
> cpu1 0 0
> domain0 MC ff
> cpu2 0 0
> domain0 SMT 0c
> domain1 MC ff
> cpu3 0 0
> domain0 SMT 0c
> domain1 MC ff
> cpu4 0 0
> domain0 SMT f0
> domain1 MC ff
> cpu5 0 0
> domain0 SMT f0
> domain1 MC ff
> cpu6 0 0
> domain0 SMT f0
> domain1 MC ff
> cpu7 0 0
> domain0 SMT f0
> domain1 MC ff
> 
> # cat /proc/cpuinfo | grep ^processor
> processor	: 0
> processor	: 1
> processor	: 2
> processor	: 3
> processor	: 4
> processor	: 5
> processor	: 6
> processor	: 7
> 
> # echo 1 > /sys/devices/system/cpu/smt/control
> 
> # cat /proc/cpuinfo | grep ^processor
> processor	: 0
> processor	: 1
> processor	: 2
> processor	: 4
> 
> # echo 4 > /sys/devices/system/cpu/smt/control
> 
> # cat /proc/cpuinfo | grep ^processor
> processor	: 0
> processor	: 1
> processor	: 2
> processor	: 3
> processor	: 4
> processor	: 5
> processor	: 6
> processor	: 7
> 
> Whats doesn't work is to echoing a '2' but that's not
> 'max_thread_number' of the system.
> 
> [...]
> 
> .
> 

