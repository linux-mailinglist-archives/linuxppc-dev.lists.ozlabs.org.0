Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8832CFB15
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 12:04:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp6CW4G38zDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 22:04:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp69z0DSGzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 22:03:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=duSjUZdL; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cp69y5y3Wz9sWP;
 Sat,  5 Dec 2020 22:03:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607166182;
 bh=p27m1yXPp3CL37kmhllJ7WUywWhoRfHsrBbXystBizA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=duSjUZdLQxLMoPfkpHXjs3h1hVqsyI2sqg4BIIz6JX/mHVVhoE1Q3TXec0EwpLxcz
 jeuB9CccCsIszx3HklqVrgja+2lMdIhspE4AyHpJSB10Z9Xsb9YkcuEDXymOHes6rE
 R5iM6Hsq0yhKvD3FqmFa/G2T482nwwNhK+G17TIe8MM18mUHvQgXnUp7la+wwEs0dn
 3lVW6Z2KsrF7pm390nIDZ3FHV529WJQTjrIbHRR8ayRnXDEqATJso8SOX9aFJ2n9+8
 i1+eE8oOw2PcVDDfpyoq8j69cTLdx7kxdmBBRgdRUmbP5GKcWNBnj16e9LnKOoZ/zH
 y5daKvBD7Ijdw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/29] powerpc/pseries/mobility: use stop_machine for
 join/suspend
In-Reply-To: <87wnxx1rwv.fsf@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-14-nathanl@linux.ibm.com>
 <875z5hvilq.fsf@mpe.ellerman.id.au> <87wnxx1rwv.fsf@linux.ibm.com>
Date: Sat, 05 Dec 2020 22:03:02 +1100
Message-ID: <87v9dgtt09.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Hi Michael,
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> The partition suspend sequence as specified in the platform
>>> architecture requires that all active processor threads call
>>> H_JOIN, which:
>> ...
>>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>>> index 1b8ae221b98a..44ca7d4e143d 100644
>>> --- a/arch/powerpc/platforms/pseries/mobility.c
>>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>>> @@ -412,6 +414,128 @@ static int wait_for_vasi_session_suspending(u64 handle)
>> ...
>>
>>> +
>>> +static int do_join(void *arg)
>>> +{
>>> +	atomic_t *counter = arg;
>>> +	long hvrc;
>>> +	int ret;
>>> +
>>> +	/* Must ensure MSR.EE off for H_JOIN. */
>>> +	hard_irq_disable();
>>
>> Didn't stop_machine() already do that for us?
>>
>> In the state machine in multi_cpu_stop().
>
> Yes, but I didn't want to rely on something that seems like an
> implementation detail of stop_machine(). I assumed it's benign and in
> keeping with hard_irq_disable()'s intended semantics to make multiple
> calls to it within a critical section.

OK. I think it's part of the contract of stop_machine() these days, but
you're right hard_irq_disable() can be called multiple times, so we may
as well leave it there as insurance/documentation.

>>> +	hvrc = plpar_hcall_norets(H_JOIN);
>>> +
>>> +	switch (hvrc) {
>>> +	case H_CONTINUE:
>>> +		/*
>>> +		 * All other CPUs are offline or in H_JOIN. This CPU
>>> +		 * attempts the suspend.
>>> +		 */
>>> +		ret = do_suspend();
>>> +		break;
>>> +	case H_SUCCESS:
>>> +		/*
>>> +		 * The suspend is complete and this cpu has received a
>>> +		 * prod.
>>> +		 */
>>> +		ret = 0;
>>> +		break;
>>> +	case H_BAD_MODE:
>>> +	case H_HARDWARE:
>>> +	default:
>>> +		ret = -EIO;
>>> +		pr_err_ratelimited("H_JOIN error %ld on CPU %i\n",
>>> +				   hvrc, smp_processor_id());
>>> +		break;
>>> +	}
>>> +
>>> +	if (atomic_inc_return(counter) == 1) {
>>> +		pr_info("CPU %u waking all threads\n", smp_processor_id());
>>> +		prod_others();
>>> +	}
>>
>> Do we even need the counter? IIUC only one CPU receives H_CONTINUE. So
>> couldn't we just have that CPU do the prodding of others?
>
> CPUs may exit H_JOIN due to system reset interrupt at any time, and
> H_JOIN may return H_HARDWARE to a caller after other CPUs have entered
> the join state successfully. In these cases the counter ensures exactly
> one thread performs the prod sequence.

OK.

>>> +	/*
>>> +	 * Execution may have been suspended for several seconds, so
>>> +	 * reset the watchdog.
>>> +	 */
>>> +	touch_nmi_watchdog();
>>> +	return ret;
>>> +}
>>> +
>>> +static int pseries_migrate_partition(u64 handle)
>>> +{
>>> +	atomic_t counter = ATOMIC_INIT(0);
>>> +	int ret;
>>> +
>>> +	ret = wait_for_vasi_session_suspending(handle);
>>> +	if (ret)
>>> +		goto out;
>>
>> Direct return would be clearer IMHO.
>
> OK, I can change this.

Thanks.

cheers
