Return-Path: <linuxppc-dev+bounces-7152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BE6A657C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 17:19:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGgCk27Pjz2yqs;
	Tue, 18 Mar 2025 03:19:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742228370;
	cv=none; b=YxS4tAYuYUyPFShWn/xcDawdUIbfZnLBWSumpXIHQwFdDu1qWbQ6SfIqa9G3Ou2Q6fzOW2bQ+FjUPY/mQhItrpczxBcWNWGcKuBFtEe7c1T9DTZv0xHE7JcW9GXn+RQgTY3bssjep1PR8+hrQsYTE5tHgL5qzxnrJ3S0JFIskEuqmeFvabZslnZZBR6GeXYjae/6ZRCPo6PnEf1xwJ8io7ll6Hx2QFlmk+p/GMgMOfykDzeLkmwrldCCsmLKg1AnmNkoR7VpFp62JQul1gHdshKp1ddD/CcjWUGUchpjBV/k5WzcBNy4cok2iAt8zGvOxoWqYgdGBW0gQ8/m7zfsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742228370; c=relaxed/relaxed;
	bh=z47vl0XJ7IhEChc4ZDP47YOchtvz+VbR9iiUVCc1kw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHmLu/DTI3sOnnFTw5lcl7rxMUWoT3XqjDqHe8mT56UyTSMDnub+uY8rjzo502XgnmIqyvhh4yLst7cJP0Xrv9HNLA+1Wxs1BL1U8t9tAxiIre8pTYLjESesfn/Bhx1MYWm41G1Qd8OspG0I6n/5HjgfhXMegeqRv17etzefNJsrvuELSDJl3SMcxPX8Zs7k3d72kIxOasXGiWl5fTdxyx8xTcxOqitdDzy57EVf6c6+ibPqLNBIVWxvOuxazOai4swChICnDQCMw+ojjJgqI/Eq9FnyNo9a57Wv8QH8D9IvNPb+k781Y53cSEDoFulDRcwv9RsnhJFovUY1Vkg0lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGgCj2nDJz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 03:19:28 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4273713D5;
	Mon, 17 Mar 2025 09:19:06 -0700 (PDT)
Received: from [192.168.3.45] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 194A73F63F;
	Mon, 17 Mar 2025 09:18:51 -0700 (PDT)
Message-ID: <c357e638-d523-4cd2-a15f-ed3b0b41bd22@arm.com>
Date: Mon, 17 Mar 2025 17:18:49 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
 tglx@linutronix.de, peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, pierre.gondois@arm.com,
 yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com, sshegde@linux.ibm.com
References: <20250311075143.61078-1-yangyicong@huawei.com>
 <20250311075143.61078-3-yangyicong@huawei.com>
 <2bd3aa0a-d700-46bf-81d1-a5fb0364d1e0@arm.com>
 <c88e5b78-37b7-3023-7842-56a93fe119d2@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <c88e5b78-37b7-3023-7842-56a93fe119d2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/03/2025 12:29, Yicong Yang wrote:
> On 2025/3/17 17:56, Dietmar Eggemann wrote:
>> On 11/03/2025 08:51, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

>>> Both method support to completely disable/enable the SMT cores so both
>>> work correctly for symmetric SMT platform and asymmetric platform with
>>> non-SMT and one type SMT cores like:
>>> core A: 1 thread
>>> core B: X (X!=1) threads
>>>
>>> Note that for a theoretically possible multiple SMT-X (X>1) core
>>> platform the SMT control is also supported as expected but only
>>> by writing the "on/off" method.
>>
>> Here we still have a little misunderstanding. IMHO, even on such a
>> system 2) would work too.
>>
> 
> 
> yes but only by writing the max_thread_number. e.g. a system with SMT number
> of 1 (no SMT core), X, Y (Y > X), 1 works same as "off" and Y works same as
> "on", as you shown below. write X will be blocked by the CPU framework:
> estuary:/sys/devices/system/cpu/smt$ cat control
> off
> # emulated CPU 0-7,16-22 as SMT-2, CPU 8-11,24-27 as SMT-4
> estuary:/sys/devices/system/cpu/smt$ cat ../online
> 0,2,4,6,8,12-16,18,20,22,24,28-31
> estuary:/sys/devices/system/cpu/smt$ echo 2 > control
> bash: echo: write error: Invalid argument
> estuary:/sys/devices/system/cpu/smt$ echo 4 > control
> estuary:/sys/devices/system/cpu/smt$ cat ../online
> 0-31
> 
> so method 1) will always match the expectation to fully enable/disable the
> SMT on all cores, that's I mean here. But 2) won't work if user expected
> to write 2 to enable SMT-2 (I think it'll will work if we support
> CONFIG_SMT_NUM_THREADS_DYNAMIC on arm64 later).

OK, looks like you're aware of this then. Just saying that technically
'4' would be the max thread number of the system and not '2' so it still
looks OK from this perspective. But OK, we don't have those systems now
anyway.

[...]

