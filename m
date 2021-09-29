Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAABD41BED1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 07:46:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK53753gTz307f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 15:46:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PXfL7Qyr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK52V6541z2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 15:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PXfL7Qyr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HK52R0dC4z4wgv;
 Wed, 29 Sep 2021 15:45:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632894351;
 bh=pAbTTsEc6gj8WOZpeGLrqxgGkSDot/Lxc59JAsfWc/Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PXfL7QyrR5A6DzyG8bpGnJtEe/thq4q1fNaerDqVUUvdhHfSrJ9fZ4TK+B+DXUw71
 vbXxv999ruWYKOdFnteYQm/jpGApiYLuZ7yuOmVg78SnIIFN5x0m9fUQ81PQToERSj
 WjZZP1cvdnOi9hkpCDi5Aq+0GSn/KfXujrqghD7WS4rFBXtTjv9jUBLNmGbEDXQRST
 pIP36gmIPGETvtqLN87rDf6SnA7r85Ff3iUs3aXu9LAcAF3wx9I2orYVubCRGU3ewM
 ZtzaxbmqFsjxiG1J2mNVdeF6gb9zkmTadk7zFiQTxRwwzs9B56/2sK0r75Bd61hTQ5
 ph11GhH81R0Ng==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Nathan Lynch
 <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 4/4] powerpc/pseries/cpuhp: remove obsolete comment
 from pseries_cpu_die
In-Reply-To: <4479e869-1c98-4473-262c-3aeb37b8fca2@gmail.com>
References: <20210927201933.76786-1-nathanl@linux.ibm.com>
 <20210927201933.76786-5-nathanl@linux.ibm.com>
 <4479e869-1c98-4473-262c-3aeb37b8fca2@gmail.com>
Date: Wed, 29 Sep 2021 15:45:47 +1000
Message-ID: <87h7e40wac.fsf@mpe.ellerman.id.au>
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

Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> On 9/27/21 17:19, Nathan Lynch wrote:
>> This comment likely refers to the obsolete DLPAR workflow where some
>> resource state transitions were driven more directly from user space
>> utilities, but it also seems to contradict itself: "Change isolate state to
>> Isolate [...]" is at odds with the preceding sentences, and it does not
>> relate at all to the code that follows.
>
> This comment was added by commit 413f7c405a34, a 2006 commit where Mike
> Ellerman moved code from platform/pseries/smp.c into hotplug-cpu.c.
>
> I checked the original code back in smp.c and this comment was added there
> by commit 1da177e4c3f41, which is Linus's initial git commit, where he mentions
> that he didn't bothered with full history (although it is available somewhere,
> allegedly).
>
> This is enough to say that we can't easily see the history behind this comment.
> I also believe that we're better of without it since it doesn't make sense
> with the current codebase.

It was added by the original CPU hotplug commit for ppc64::

https://github.com/mpe/linux-fullhistory/commit/0e9fd9441cd2113b67b14e739267c9e69761489b


The code was fairly similar:

void __cpu_die(unsigned int cpu)
{
	int tries;
	int cpu_status;
	unsigned int pcpu = get_hard_smp_processor_id(cpu);

	for (tries = 0; tries < 5; tries++) {
		cpu_status = query_cpu_stopped(pcpu);

		if (cpu_status == 0)
			break;
		set_current_state(TASK_UNINTERRUPTIBLE);
		schedule_timeout(HZ);
	}
	if (cpu_status != 0) {
		printk("Querying DEAD? cpu %i (%i) shows %i\n",
		       cpu, pcpu, cpu_status);
	}

	/* Isolation and deallocation are definatly done by
	 * drslot_chrp_cpu.  If they were not they would be
	 * done here.  Change isolate state to Isolate and
	 * change allocation-state to Unusable.
	 */
	paca[cpu].xProcStart = 0;

	/* So we can recognize if it fails to come up next time. */
	cpu_callin_map[cpu] = 0;
}


drslot_chrp_cpu() still exists in drmgr:

  https://github.com/ibm-power-utilities/powerpc-utils/blob/e798c4a09fbf0fa0f421e624cfa366a6c405c9fe/src/drmgr/drslot_chrp_cpu.c#L406


I agree the comment is no longer meaningful and can be removed.

It might be good to then add a comment explaining why we need to set
cpu_start = 0.

It's not immediately clear why we need to. When we bring a CPU back
online in smp_pSeries_kick_cpu() we ask RTAS to start it and then
immediately set cpu_start = 1, ie. there isn't a separate step that sets
cpu_start = 1 for hotplugged CPUs.

cheers
