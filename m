Return-Path: <linuxppc-dev+bounces-6679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AC8A4D871
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 10:32:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6VpZ1j1Gz30WS;
	Tue,  4 Mar 2025 20:32:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741080774;
	cv=none; b=KoXb+ndqTeRlocgXyCtrt6lgB6qsH2KI0m15CWbu69D5oS1A9vjPIUhjjgsk4gFAksUr9JeqYYH4SqiIui2PWObCnd1VUJx3KZITbY4wEtZSnRC7viaosTK3Kp+jmZMdZJBhW2cPKEjSdpvWhqPEglmc9akmT6Lw1C2sM/0NEtnXMlEWhpUWfZH6e+gCWghjzzBfDdotoUqUNwu5aKcH3yujcU20yCljs3v10N+Nw9+Kl5XmtAaWz6O9/ZqtLOtbamSOL3hz8Zt5JT/UE69odQ5RB7ZiogIerQE4El9AI/Ta7CeF8CGvmVVzvFPnJljP4BnR/88Yivf0UiVa/mptug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741080774; c=relaxed/relaxed;
	bh=3XSDmssemR4TkQFiq7Jxa4Dv0YRrXqVa8+1ku5HSWRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kmCPgPFgX75zRRKLJ71OPiILmTeIL8SYHOwQwjcKflqej8DdaFAdPFYk2PnE6r1JL5WuXCbkTRPj5b/xY9iDe03D2HqoDgQvq9na+oYJmxRQpKapd8CpBjtPA5/6dkcJWLV0SzaaQ1+T6aTj9+L6ACY3TKHP2eQZPQdPMMb0cr8geOIguPgtCM91mhD3gaQQPOmPjFAcEUfdIwFyZRGCMQY3LQWFr1uZzEErxr5a4NzjDhgAGuffcRtvuUSObPukHnnXEQiKTw26SrOHd7JpTmple2KJUf5MAXLvi0CSY9zVIPe8Qn1KNFZrYm0T7ju0KJpabl9D5Bwn2XM7fiKJuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6VpX6XpPz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 20:32:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59B18FEC;
	Tue,  4 Mar 2025 01:32:32 -0800 (PST)
Received: from [192.168.178.71] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E86613F66E;
	Tue,  4 Mar 2025 01:32:14 -0800 (PST)
Message-ID: <5435fd87-6209-4896-84cc-27a35ef3cea4@arm.com>
Date: Tue, 4 Mar 2025 10:32:13 +0100
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
Subject: Re: [PATCH v11 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>, sudeep.holla@arm.com,
 pierre.gondois@arm.com
Cc: dave.hansen@linux.intel.com, bp@alien8.de, mingo@redhat.com,
 linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
 peterz@infradead.org, tglx@linutronix.de, will@kernel.org,
 catalin.marinas@arm.com, yangyicong@hisilicon.com,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 morten.rasmussen@arm.com, msuchanek@suse.de, gregkh@linuxfoundation.org,
 rafael@kernel.org, jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com,
 sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-3-yangyicong@huawei.com>
 <8a9aedef-08d7-445f-9b67-85e74ec6bd50@arm.com>
 <21e74021-fb68-0003-f0f4-7f54dd674b9d@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <21e74021-fb68-0003-f0f4-7f54dd674b9d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03/03/2025 15:03, Yicong Yang wrote:
> On 2025/2/28 19:11, Dietmar Eggemann wrote:
>> On 18/02/2025 15:10, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

>>> If a system have more than one SMT thread number the 2) may
>>
>> s/have/has
>>
>>> not handle it well, since there're multiple thread numbers in the
>>
>> multiple thread numbers other than 1, right?
> 
> according to the pr_warn_once() we implemented below it also includes the case
> where the system have one type of SMT cores and non-SMT cores (the thread number is 1):
> - 1 thread
> - X (!= 1) threads
> 
> Discussion made in [1] and I thought we have agreement (hope I understood correctly)
> that all the asymmetric cases need to notify. Do you and Sudeep think we should not
> warn in such case?

Systems with non-SMT and SMT-2 cores are IMHO a special case since for
them the '/sys/devices/system/cpu/smt' interface still works correctly.
And on X86 those systems do exist today.

IMHO, it would be awkward to see the message 'Heterogeneous SMT topology
is partly supported by SMT control' on arm64 but not on x86 on such a
system.

I do understand that this message is more tailored to theoretically
possible 'multiple SMT-X (X>1) core' systems (e.g. 1,2,4).

And here we cannot issue a '2 > ./control' since
cpu_smt_num_threads_valid() only returns true for 1 or 4.

IMHO, I would remove the warning and state clearly in the patch that for
systems with multiple SMT-X (X>1) cores, this interface only support SMT
completely on or off.

Example Arm64 DT:

cpu-map {
        cluster0 {
                core0 {
                        thread0 {
                                cpu = <&A53_0>;
                        };
                };
                core1 {
                        thread0 {
                                cpu = <&A53_1>;
                        };
                };
                core2 {
                        thread0 {
                                cpu = <&A53_2>;
                        };
                        thread1 {
                                cpu = <&A53_3>;
                        };
                };
                core3 {
                        thread0 {
                                cpu = <&A53_4>;
                        };
                        thread1 {
                                cpu = <&A53_5>;
                        };
                        thread2 {
                                cpu = <&A53_6>;
                        };
                        thread3 {
                                cpu = <&A53_7>;
                        };
                };
        };
};

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 3
processor	: 4
processor	: 5
processor	: 6
processor	: 7

/sys/devices/system/cpu/smt# echo 1 >control

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 4

/sys/devices/system/cpu/smt# echo 2 >control
-bash: echo: write error: Invalid argument

[...]

