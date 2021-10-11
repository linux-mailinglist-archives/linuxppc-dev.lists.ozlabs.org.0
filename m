Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 617C2428D1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 14:35:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSdY31lthz2ynX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 23:35:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nOX9tCVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSdXQ48QPz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 23:34:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nOX9tCVv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSdXP6lyHz4xbV;
 Mon, 11 Oct 2021 23:34:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633955670;
 bh=Pld4FcBdbZ8l2lR1F6AV89j7hjbvSY580vLcCkY0cI8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nOX9tCVvIiFBvD43OScgAqd1FuwY1/NjKUp5CIJUlhprD/P8lw1NyNpeLNCpAPQ7T
 zYvYhtxoWuVDMLJRlq2gr05BbBSbKvT+5V1G60mpdLTwEZo1WM5ghO1DVYh22sLMNX
 V1duah6VqbvN3Ouf2OrfTZzya+thj69XHESG8uYp+irchxWBK7ih3mHezYIHcMy/3j
 g3iO+UP9tweq4bscpFlHnUcOhcWLclWnF6jy1boB5WcS9Y7gJB89f1I+ITLSnMdSe7
 qGZRYhMBuRe1tqRbGY+S43xx/cFnVZZHGkoVHBy5DmalDUHVzYkUHPvKahAY2qGEmO
 yulNJ2dv4QeGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 4/4] powerpc/pseries/cpuhp: remove obsolete comment
 from pseries_cpu_die
In-Reply-To: <87k0izfux7.fsf@linux.ibm.com>
References: <20210927201933.76786-1-nathanl@linux.ibm.com>
 <20210927201933.76786-5-nathanl@linux.ibm.com>
 <4479e869-1c98-4473-262c-3aeb37b8fca2@gmail.com>
 <87h7e40wac.fsf@mpe.ellerman.id.au> <87k0izfux7.fsf@linux.ibm.com>
Date: Mon, 11 Oct 2021 23:34:28 +1100
Message-ID: <87mtnfn3jf.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>> This is enough to say that we can't easily see the history behind this comment.
>>> I also believe that we're better of without it since it doesn't make sense
>>> with the current codebase.
>>
>> It was added by the original CPU hotplug commit for ppc64::
>>
>> https://github.com/mpe/linux-fullhistory/commit/0e9fd9441cd2113b67b14e739267c9e69761489b
>>
>>
>> The code was fairly similar:
>>
>> void __cpu_die(unsigned int cpu)
>> {
>> 	int tries;
>> 	int cpu_status;
>> 	unsigned int pcpu = get_hard_smp_processor_id(cpu);
>>
>> 	for (tries = 0; tries < 5; tries++) {
>> 		cpu_status = query_cpu_stopped(pcpu);
>>
>> 		if (cpu_status == 0)
>> 			break;
>> 		set_current_state(TASK_UNINTERRUPTIBLE);
>> 		schedule_timeout(HZ);
>> 	}
>> 	if (cpu_status != 0) {
>> 		printk("Querying DEAD? cpu %i (%i) shows %i\n",
>> 		       cpu, pcpu, cpu_status);
>> 	}
>>
>> 	/* Isolation and deallocation are definatly done by
>> 	 * drslot_chrp_cpu.  If they were not they would be
>> 	 * done here.  Change isolate state to Isolate and
>> 	 * change allocation-state to Unusable.
>> 	 */
>> 	paca[cpu].xProcStart = 0;
>>
>> 	/* So we can recognize if it fails to come up next time. */
>> 	cpu_callin_map[cpu] = 0;
>> }
>>
>>
>> drslot_chrp_cpu() still exists in drmgr:
>>
>>   https://github.com/ibm-power-utilities/powerpc-utils/blob/e798c4a09fbf0fa0f421e624cfa366a6c405c9fe/src/drmgr/drslot_chrp_cpu.c#L406
>>
>>
>> I agree the comment is no longer meaningful and can be removed.
>
> Thanks for providing this background.
>
>> It might be good to then add a comment explaining why we need to set
>> cpu_start = 0.
>
> Sure, I can take that as a follow-up. Or perhaps it should be moved to
> the online path.

Yeah possibly.

>> It's not immediately clear why we need to. When we bring a CPU back
>> online in smp_pSeries_kick_cpu() we ask RTAS to start it and then
>> immediately set cpu_start = 1, ie. there isn't a separate step that sets
>> cpu_start = 1 for hotplugged CPUs.
>
> Hmm I'm not following the distinction you seem to be drawing between
> bringing a CPU back online and a hotplugged CPU. kick_cpu is used in all
> cases AFAIK.

Yeah that wasn't very clear, reading it back I have half confused myself.

At boot we need the paca->cpu_start flag because some CPUs can be
spinning in generic_secondary_common_init, in head_64.S.

ie. they're not in RTAS, they're spinning in kernel code, and the only
thing that stops them coming "online" in the Linux sense is
paca->cpu_start.

You can see that in pseries/smp.c:

static inline int smp_startup_cpu(unsigned int lcpu)
{
	...
	if (cpumask_test_cpu(lcpu, of_spin_mask))
		/* Already started by OF and sitting in spin loop */
		return 1;


We also hit that case when kexec'ing, where all the secondaries come in
that way.


On the other hand when we offline a CPU, we set paca->cpu_start = 0, in
pseries_cpu_die(), and then we return the CPU to RTAS.

The only way it *should* come back online is via smp_pSeries_kick_cpu(),
which calls smp_startup_cpu() to bring the CPU out of RTAS, and then
smp_pSeries_kick_cpu() immediately sets cpu_start = 1.

So the sequence is:

	CPU goes offline from Linux POV
	paca->cpu_start = 0;
        CPU offline in RTAS
        ...
        CPU brought out of RTAS
	paca->cpu_start = 1;
	CPU comes back online from Linux POV


But I guess I kind of answered my own question above, where I said
*should*. Clearing paca->cpu_start when we offline the CPU gives us a
little bit of backup if the CPU comes out of RTAS unexpectedly. ie. it
would then spin on paca->cpu_start, rather than spontaneously coming
back into Linux when we weren't expecting it.

cheers
