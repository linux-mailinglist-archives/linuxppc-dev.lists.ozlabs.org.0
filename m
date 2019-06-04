Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D534850
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 15:20:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JCGF0NffzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 23:20:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="g318kWAe"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JC9g5sVczDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 23:16:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45JC9Y2bXMzB09ZH;
 Tue,  4 Jun 2019 15:16:17 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=g318kWAe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tkfUg4heobmt; Tue,  4 Jun 2019 15:16:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45JC9Y1LDlzB09ZG;
 Tue,  4 Jun 2019 15:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559654177; bh=SiZOSxV6YbRCD9djo6CWIUlX4YsLdd8Aowd1s+w+IgI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=g318kWAeZ14KM+smIsIhPEoySLoonF40ifYa0j61xTNWAdpGsHghO5JCz3/Gs8uz3
 Funpew3V0at2CN6L9j+R7C8iIUDkfmc2JXq6wWqXH0tFVarcx7VLq71hEDJgpjvkcC
 ly41WOlKmVYMJd99P1Mma67Fxt3TC7Q21urYTNVk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10F698B988;
 Tue,  4 Jun 2019 15:16:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id io2cBWa9AAmx; Tue,  4 Jun 2019 15:16:17 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BFE08B967;
 Tue,  4 Jun 2019 15:16:16 +0200 (CEST)
Subject: Re: [PATCH v4 3/3] kselftest: Extend vDSO selftest to clock_getres
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20190523112116.19233-1-vincenzo.frascino@arm.com>
 <20190523112116.19233-4-vincenzo.frascino@arm.com>
 <87lfyrp0d2.fsf@concordia.ellerman.id.au>
 <afb7395f-43e9-c304-2db2-349e6727b687@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5c99721a-ce6b-10a0-99f2-6c37c1da4542@c-s.fr>
Date: Tue, 4 Jun 2019 15:16:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <afb7395f-43e9-c304-2db2-349e6727b687@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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

Hi Vincenzo

Le 28/05/2019 à 13:57, Vincenzo Frascino a écrit :
> Hi Michael,
> 
> thank you for your reply.
> 
> On 28/05/2019 07:19, Michael Ellerman wrote:
>> Vincenzo Frascino <vincenzo.frascino@arm.com> writes:
>>
>>> The current version of the multiarch vDSO selftest verifies only
>>> gettimeofday.
>>>
>>> Extend the vDSO selftest to clock_getres, to verify that the
>>> syscall and the vDSO library function return the same information.
>>>
>>> The extension has been used to verify the hrtimer_resoltion fix.
>>
>> This is passing for me even without patch 1 applied, shouldn't it fail
>> without the fix? What am I missing?
>>
> 
> This is correct, because during the refactoring process I missed an "n" :)
> 
> if·((x.tv_sec·!=·y.tv_sec)·||·(x.tv_sec·!=·y.tv_sec))
> 
> Should be:
> 
> if·((x.tv_sec·!=·y.tv_sec)·||·(x.tv_nsec·!=·y.tv_nsec))
> 
> My mistake, I am going to fix the test and re-post v5 of this set.
> 
> Without my patch if you pass "highres=off" to the kernel (as a command line
> parameter) it leads to a broken implementation of clock_getres since the value
> of CLOCK_REALTIME_RES does not change at runtime.
> 
> Expected result (with highres=off):
> 
> # uname -r
> 5.2.0-rc2
> # ./vdso_clock_getres
> clock_id: CLOCK_REALTIME [FAIL]
> clock_id: CLOCK_BOOTTIME [PASS]
> clock_id: CLOCK_TAI [PASS]
> clock_id: CLOCK_REALTIME_COARSE [PASS]
> clock_id: CLOCK_MONOTONIC [FAIL]
> clock_id: CLOCK_MONOTONIC_RAW [PASS]
> clock_id: CLOCK_MONOTONIC_COARSE [PASS]
> 
> The reason of this behavior is that the only clocks supported by getres on
> powerpc are CLOCK_REALTIME and CLOCK_MONOTONIC, the rest on the clocks use
> always syscalls.

vdso64 is supposed to implement CLOCK_{REALTIME/MONOTONIC}_COARSE, so I 
guess it should fail for them too ?

Or is your test done on vdso32 ?

Christophe

> 
>> # uname -r
>> 5.2.0-rc2-gcc-8.2.0
>>
>> # ./vdso_clock_getres
>> clock_id: CLOCK_REALTIME [PASS]
>> clock_id: CLOCK_BOOTTIME [PASS]
>> clock_id: CLOCK_TAI [PASS]
>> clock_id: CLOCK_REALTIME_COARSE [PASS]
>> clock_id: CLOCK_MONOTONIC [PASS]
>> clock_id: CLOCK_MONOTONIC_RAW [PASS]
>> clock_id: CLOCK_MONOTONIC_COARSE [PASS]
>>
>> cheers
>>
>>> Cc: Shuah Khan <shuah@kernel.org>
>>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>>> ---
>>>
>>> Note: This patch is independent from the others in this series, hence it
>>> can be merged singularly by the kselftest maintainers.
>>>
>>>   tools/testing/selftests/vDSO/Makefile         |   2 +
>>>   .../selftests/vDSO/vdso_clock_getres.c        | 124 ++++++++++++++++++
>>>   2 files changed, 126 insertions(+)
>>>   create mode 100644 tools/testing/selftests/vDSO/vdso_clock_getres.c
> 
