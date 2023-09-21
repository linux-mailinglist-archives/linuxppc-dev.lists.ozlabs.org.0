Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F07AA5BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 01:42:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vjmw/9Yr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsBkx0llxz3cP3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:42:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vjmw/9Yr;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsBk35LsGz304l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 09:41:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695339675;
	bh=bX9898W4DHPQgbdu2jfMPofkblqEnbzz8c5KFbbLPQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vjmw/9YrBmUs0JBH+tAWqE9VhYUn3cMu5lM0EfxOQue+11jQZrl0pH4fF+Ltn7OB0
	 3nZ0f/C4LA/joz4t/E2YSTguB8y1fObmI1qPuBYWtdQ+GH93vhfjpPjaDbUe9ERx6s
	 7R1T061RtAE1Jca/jkf8XQuBV1hBRmpMPp+2cSILJ9cRJIrR1GXs/z3CmzXz04JQ70
	 3tir4+ZCgGBAeQyv7MWI6tLr6GlSMUtt4plxAsAdJk8x4faRB5U1/esdDkfUg63ovL
	 D168caCBRrYAgLOWZsDUbeKeHT2D/kx3pW3E+FCHp6J/UCCiWjk/uiePxRM1aNedT/
	 z02ajjQYfmbJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RsBk31wB3z4wy2;
	Fri, 22 Sep 2023 09:41:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
Subject: Re: [RFC v3 1/2] powerpc/cpuidle: cpuidle wakeup latency based on
 IPI and timer events
In-Reply-To: <50798cd4558299eb62e2c3a11e367a6dbe11f915.camel@linux.vnet.ibm.com>
References: <20230911053620.87973-1-aboorvad@linux.vnet.ibm.com>
 <20230911053620.87973-2-aboorvad@linux.vnet.ibm.com>
 <87a5trvw88.fsf@mail.lhotse>
 <50798cd4558299eb62e2c3a11e367a6dbe11f915.camel@linux.vnet.ibm.com>
Date: Fri, 22 Sep 2023 09:41:14 +1000
Message-ID: <87r0mrm6w5.fsf@mail.lhotse>
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
Cc: srikar@linux.vnet.ibm.com, arnd@arndb.de, pratik.r.sampat@gmail.com, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, rmclure@linux.ibm.com, joel@jms.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aboorva Devarajan <aboorvad@linux.vnet.ibm.com> writes:
> On Wed, 2023-09-13 at 08:54 +1000, Michael Ellerman wrote:
>> Aboorva Devarajan <aboorvad@linux.vnet.ibm.com> writes:
>> > From: Pratik R. Sampat <psampat@linux.ibm.com>
>> > 
>> > Introduce a mechanism to fire directed IPIs from a source CPU to a
>> > specified target CPU and measure the time incurred on waking up the
>> > target CPU in response.
>> > 
>> > Also, introduce a mechanism to queue a hrtimer on a specified CPU
>> > and
>> > subsequently measure the time taken to wakeup the CPU.
>> > 
>> > Define a simple debugfs interface that allows for adjusting the
>> > settings to trigger IPI and timer events on a designated CPU, and
>> > to
>> > observe the resulting cpuidle wakeup latencies.
>> > 
>> > Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> > Signed-off-by: Pratik R. Sampat <psampat@linux.ibm.com>
>> > Signed-off-by: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
>> > ---
>> >  arch/powerpc/Kconfig.debug                 |  10 ++
>> >  arch/powerpc/kernel/Makefile               |   1 +
>> >  arch/powerpc/kernel/test_cpuidle_latency.c | 154
>> > +++++++++++++++++++++
>>   
>> I don't see anything here that's powerpc specific?
>> 
>> Which makes me wonder 1) could this be done with some existing
>> generic
>> mechanism?, and 2) if not can this test code be made generic.
>> 
>> At the very least this should be Cc'ed to the cpuidle lists &
>> maintainers given it's a test for cpuidle latency :)
>> 
>> cheers
>
> Hi Michael,
>
> Thanks a lot for taking a look at this.
>
> Yes, this test-case can be used as a generic benchmark for evaluating
> CPU idle latencies across different architectures, as it has thus far
> been exclusively tested and used on PowerPC, so we thought it would be
> more beneficial to incorporate it into a PowerPC specific self-test
> suite. But I will work on making it a generic self-test and send across
> a v4.

I'd suggest just posting v3 again but Cc'ing the cpuidle lists &
maintainers, to see if there is any interest in making it generic.

cheers
