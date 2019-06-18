Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A14A0CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:30:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SnVF2xmHzDqdl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 22:30:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SnRn4PmWzDqVy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:28:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45SnRn1qLNz9s9y;
 Tue, 18 Jun 2019 22:28:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org
Subject: Re: [PATCH v2] perf ioctl: Add check for the sample_period value
In-Reply-To: <e1d0fcf5-d7f8-44a0-a3b8-339f2b79fb2c@linux.ibm.com>
References: <87h89eq55e.fsf@concordia.ellerman.id.au>
 <20190604042953.914-1-ravi.bangoria@linux.ibm.com>
 <e1d0fcf5-d7f8-44a0-a3b8-339f2b79fb2c@linux.ibm.com>
Date: Tue, 18 Jun 2019 22:28:19 +1000
Message-ID: <87k1djoz6k.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, maddy@linux.vnet.ibm.com,
 jolsa@redhat.com, linux-kernel@vger.kernel.org, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
> Peter / mpe,
>
> Is the v2 looks good? If so, can anyone of you please pick this up.

I usually wouldn't take it, it's generic perf code. Unless
peter/ingo/acme tell me otherwise.

It's sort of a bug fix for 0819b2e30ccb, should it have a fixes and/or
stable tag?

  Fixes: 0819b2e30ccb ("perf: Limit perf_event_attr::sample_period to 63 bits")
  Cc: stable@vger.kernel.org # v3.15+

cheers

> On 6/4/19 9:59 AM, Ravi Bangoria wrote:
>> perf_event_open() limits the sample_period to 63 bits. See
>> commit 0819b2e30ccb ("perf: Limit perf_event_attr::sample_period
>> to 63 bits"). Make ioctl() consistent with it.
>> 
>> Also on powerpc, negative sample_period could cause a recursive
>> PMIs leading to a hang (reported when running perf-fuzzer).
>> 
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>  kernel/events/core.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index abbd4b3b96c2..e44c90378940 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -5005,6 +5005,9 @@ static int perf_event_period(struct perf_event *event, u64 __user *arg)
>>  	if (perf_event_check_period(event, value))
>>  		return -EINVAL;
>>  
>> +	if (!event->attr.freq && (value & (1ULL << 63)))
>> +		return -EINVAL;
>> +
>>  	event_function_call(event, __perf_event_period, &value);
>>  
>>  	return 0;
>> 
