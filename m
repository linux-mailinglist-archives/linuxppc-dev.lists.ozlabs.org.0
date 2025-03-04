Return-Path: <linuxppc-dev+bounces-6677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C20A4D640
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 09:25:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6TK85m3pz2ykZ;
	Tue,  4 Mar 2025 19:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741076748;
	cv=none; b=Js3QzCWXib9G4PVvKkKuDJ4HjpPiPB/8ZcN9H+PpgYFMkff1c247C88krUeIDmeOA24qP1umwwuqJkFR9SQW3Gb5zxLAe4CCo+OFm+iscoLKyGWHld5T6VOX2v4zh50iqukGi7crpqNSBpXjNd3W2skeiY0xDBbGJca2BocGxR6lP+oe+n9BAj/I/wwP7EgrljJH67Uw/pPl/63o/T8i5Kz6VCcSaYwYSWZ5Ai/OUuyXnsDkYlcTekpeBFdtqHb9kcVWcrk+7uJ2Qp2gQkmknnLyJkm6h3ktXu/WD3BKdKMgbFxlH/1jYRMP5ypLNfYTqVBrbROiLFXy1qMKzTJ35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741076748; c=relaxed/relaxed;
	bh=BPyo6yazjyUnhJj+joZfTPzFqELUcAwTIbrDY0AFd8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6AdjvhYttekPDZV3GWNU9osyjyrEZD2oezDzDKmQotUGFMK0uQ5Hovp4nIymsYF58lng094M4AOPs/dAS+a5fqISHJ75sl1jtc+v7Ce8nUfVaReVFViQTCYkbA5nVpUyYPoGtHo1HObzjMQrxai13I4aCm5s5QulVDPB+2V1WLYJGveU2ytHw7pYtX0lKnJnJeoB/YGsjl21YrGLqe6q1KfWhgmoVUE55D8KEfjKd+uSl+bTuERxibf6c3Jt0RLGANtV8m8DDPmfKn2yzuY0/HAzEjn2+E2AsMKXXTlJ5+pPSBxDQtB3WZxNmk1G+9hxASIE2CF2vBH+h6ffrsLJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6TK75jY9z2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 19:25:45 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 634871063;
	Tue,  4 Mar 2025 00:25:27 -0800 (PST)
Received: from [10.34.129.29] (unknown [10.34.129.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5ACD3F66E;
	Tue,  4 Mar 2025 00:25:08 -0800 (PST)
Message-ID: <2fdea4f6-db98-4dc7-947f-e19ee54d2c3c@arm.com>
Date: Tue, 4 Mar 2025 09:25:02 +0100
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
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Yicong Yang <yangyicong@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc: yangyicong@hisilicon.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 morten.rasmussen@arm.com, msuchanek@suse.de, gregkh@linuxfoundation.org,
 rafael@kernel.org, jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com,
 sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com> <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com> <Z8WPiOweOjFZqTwN@bogus>
 <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/3/25 15:40, Yicong Yang wrote:
> On 2025/3/3 19:16, Sudeep Holla wrote:
>> On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
>>> On 2/28/25 20:06, Sudeep Holla wrote:
>>>>>>
>>>>>> Ditto as previous patch, can get rid if it is default 1.
>>>>>>
>>>>>
>>>>> On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
>>>>> cpu_smt_num_threads uninitialized to UINT_MAX:
>>>>>
>>>>> smt/active:0
>>>>> smt/control:-1
>>>>>
>>>>> If cpu_smt_set_num_threads() is called:
>>>>> active:0
>>>>> control:notsupported
>>>>>
>>>>> So it might be slightly better to still initialize max_smt_thread_num.
>>>>>
>>>>
>>>> Sure, what I meant is to have max_smt_thread_num set to 1 by default is
>>>> that is what needed anyways and the above code does that now.
>>>>
>>>> Why not start with initialised to 1 instead ?
>>>> Of course some current logic needs to change around testing it for zero.
>>>>
>>>
>>> I think there would still be a way to check against the default value.
>>> If we have:
>>> unsigned int max_smt_thread_num = 1;
>>>
>>> then on a platform with 2 threads, the detection condition would trigger:
>>> xa_for_each(&hetero_cpu, hetero_id, entry) {
>>>      if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
>>>          pr_warn_once("Heterogeneous SMT topology is partly
>>>                        supported by SMT control\n");
>>>
>>> so we would need an additional variable:
>>> bool is_initialized = false;
>>
>> Sure, we could do that or skip the check if max_smt_thread_num == 1 ?
>>
>> I mean
>> 	if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)
>>

I think it will be problematic if we parse:
- first a CPU with 1 thread
- then a CPU with 2 threads

in that case we should detect the 'Heterogeneous SMT topology',
but we cannot because we don't know whether max_smt_thread_num=1
because 1 is the default value or we found a CPU with one thread.

