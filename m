Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0E348E5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 15:34:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JCZP3ppCzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 23:34:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=vincenzo.frascino@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45JCWv0cWQzDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 23:32:07 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CF42A78;
 Tue,  4 Jun 2019 06:32:05 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CE2F3F690;
 Tue,  4 Jun 2019 06:32:03 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] kselftest: Extend vDSO selftest to clock_getres
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20190523112116.19233-1-vincenzo.frascino@arm.com>
 <20190523112116.19233-4-vincenzo.frascino@arm.com>
 <87lfyrp0d2.fsf@concordia.ellerman.id.au>
 <afb7395f-43e9-c304-2db2-349e6727b687@arm.com>
 <5c99721a-ce6b-10a0-99f2-6c37c1da4542@c-s.fr>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <b710d906-edac-f8a7-792b-e6822399187c@arm.com>
Date: Tue, 4 Jun 2019 14:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5c99721a-ce6b-10a0-99f2-6c37c1da4542@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 04/06/2019 14:16, Christophe Leroy wrote:
> Hi Vincenzo
> 
> Le 28/05/2019 à 13:57, Vincenzo Frascino a écrit :
>> Hi Michael,
>>
>> thank you for your reply.
>>
>> On 28/05/2019 07:19, Michael Ellerman wrote:
>>> Vincenzo Frascino <vincenzo.frascino@arm.com> writes:
>>>
>>>> The current version of the multiarch vDSO selftest verifies only
>>>> gettimeofday.
>>>>
>>>> Extend the vDSO selftest to clock_getres, to verify that the
>>>> syscall and the vDSO library function return the same information.
>>>>
>>>> The extension has been used to verify the hrtimer_resoltion fix.
>>>
>>> This is passing for me even without patch 1 applied, shouldn't it fail
>>> without the fix? What am I missing?
>>>
>>
>> This is correct, because during the refactoring process I missed an "n" :)
>>
>> if·((x.tv_sec·!=·y.tv_sec)·||·(x.tv_sec·!=·y.tv_sec))
>>
>> Should be:
>>
>> if·((x.tv_sec·!=·y.tv_sec)·||·(x.tv_nsec·!=·y.tv_nsec))
>>
>> My mistake, I am going to fix the test and re-post v5 of this set.
>>
>> Without my patch if you pass "highres=off" to the kernel (as a command line
>> parameter) it leads to a broken implementation of clock_getres since the value
>> of CLOCK_REALTIME_RES does not change at runtime.
>>
>> Expected result (with highres=off):
>>
>> # uname -r
>> 5.2.0-rc2
>> # ./vdso_clock_getres
>> clock_id: CLOCK_REALTIME [FAIL]
>> clock_id: CLOCK_BOOTTIME [PASS]
>> clock_id: CLOCK_TAI [PASS]
>> clock_id: CLOCK_REALTIME_COARSE [PASS]
>> clock_id: CLOCK_MONOTONIC [FAIL]
>> clock_id: CLOCK_MONOTONIC_RAW [PASS]
>> clock_id: CLOCK_MONOTONIC_COARSE [PASS]
>>
>> The reason of this behavior is that the only clocks supported by getres on
>> powerpc are CLOCK_REALTIME and CLOCK_MONOTONIC, the rest on the clocks use
>> always syscalls.
> 
> vdso64 is supposed to implement CLOCK_{REALTIME/MONOTONIC}_COARSE, so I 
> guess it should fail for them too ?
> 
> Or is your test done on vdso32 ?
> 

Based on what I can see in kernel/vdso64 in 5.2-rc3:

/*
 * Exact prototype of clock_getres()
 *
 * int __kernel_clock_getres(clockid_t clock_id, struct timespec *res);
 *
 */
V_FUNCTION_BEGIN(__kernel_clock_getres)
  .cfi_startproc
	/* Check for supported clock IDs */
	cmpwi	cr0,r3,CLOCK_REALTIME
	cmpwi	cr1,r3,CLOCK_MONOTONIC
	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
	bne	cr0,99f

	li	r3,0
	cmpldi	cr0,r4,0
	crclr	cr0*4+so
	beqlr
	lis	r5,CLOCK_REALTIME_RES@h
	ori	r5,r5,CLOCK_REALTIME_RES@l
	std	r3,TSPC64_TV_SEC(r4)
	std	r5,TSPC64_TV_NSEC(r4)
	blr

	/*
	 * syscall fallback
	 */
99:
	li	r0,__NR_clock_getres
	sc
	blr
  .cfi_endproc
V_FUNCTION_END(__kernel_clock_getres)

it does not seem so for what concerns vdso64. I did run again the test both on
ppc and ppc64 qemu instances and the result is the same to what I reported in
this thread.

Am I missing something?

> Christophe
> 
>>
>>> # uname -r
>>> 5.2.0-rc2-gcc-8.2.0
>>>
>>> # ./vdso_clock_getres
>>> clock_id: CLOCK_REALTIME [PASS]
>>> clock_id: CLOCK_BOOTTIME [PASS]
>>> clock_id: CLOCK_TAI [PASS]
>>> clock_id: CLOCK_REALTIME_COARSE [PASS]
>>> clock_id: CLOCK_MONOTONIC [PASS]
>>> clock_id: CLOCK_MONOTONIC_RAW [PASS]
>>> clock_id: CLOCK_MONOTONIC_COARSE [PASS]
>>>
>>> cheers
>>>
>>>> Cc: Shuah Khan <shuah@kernel.org>
>>>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>>>> ---
>>>>
>>>> Note: This patch is independent from the others in this series, hence it
>>>> can be merged singularly by the kselftest maintainers.
>>>>
>>>>   tools/testing/selftests/vDSO/Makefile         |   2 +
>>>>   .../selftests/vDSO/vdso_clock_getres.c        | 124 ++++++++++++++++++
>>>>   2 files changed, 126 insertions(+)
>>>>   create mode 100644 tools/testing/selftests/vDSO/vdso_clock_getres.c
>>

-- 
Regards,
Vincenzo
