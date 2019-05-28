Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47D2CCDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 19:02:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45D0XJ2ctbzDqNF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 03:02:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45D0Vq6zZNzDqJL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 03:01:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45D0Vj2c9qz9tyRm;
 Tue, 28 May 2019 19:01:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8NtGerGhp2xd; Tue, 28 May 2019 19:01:33 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45D0Vj1lzDz9tyRl;
 Tue, 28 May 2019 19:01:33 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 012B4873; Tue, 28 May 2019 19:01:32 +0200 (CEST)
Received: from 37-170-84-163.coucou-networks.fr
 (37-170-84-163.coucou-networks.fr [37.170.84.163]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Tue, 28 May 2019 19:01:32 +0200
Date: Tue, 28 May 2019 19:01:32 +0200
Message-ID: <20190528190132.Horde.a454OBLbW8Q4Xvx6vYRfSA1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: [PATCH v4 3/3] kselftest: Extend vDSO selftest to clock_getres
References: <20190523112116.19233-1-vincenzo.frascino@arm.com>
 <20190523112116.19233-4-vincenzo.frascino@arm.com>
 <87lfyrp0d2.fsf@concordia.ellerman.id.au>
 <afb7395f-43e9-c304-2db2-349e6727b687@arm.com>
In-Reply-To: <afb7395f-43e9-c304-2db2-349e6727b687@arm.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vincenzo Frascino <vincenzo.frascino@arm.com> a =C3=A9crit=C2=A0:

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
> This is correct, because during the refactoring process I missed an "n" :=
)
>
> if=C2=B7((x.tv_sec=C2=B7!=3D=C2=B7y.tv_sec)=C2=B7||=C2=B7(x.tv_sec=C2=B7!=
=3D=C2=B7y.tv_sec))
>
> Should be:
>
> if=C2=B7((x.tv_sec=C2=B7!=3D=C2=B7y.tv_sec)=C2=B7||=C2=B7(x.tv_nsec=C2=B7=
!=3D=C2=B7y.tv_nsec))

Maybe you'd better use timercmp() from sys/time.h

Christophe

>
> My mistake, I am going to fix the test and re-post v5 of this set.
>
> Without my patch if you pass "highres=3Doff" to the kernel (as a command =
line
> parameter) it leads to a broken implementation of clock_getres since=20=
=20
>=20the value
> of CLOCK_REALTIME_RES does not change at runtime.
>
> Expected result (with highres=3Doff):
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
> The reason of this behavior is that the only clocks supported by getres o=
n
> powerpc are CLOCK_REALTIME and CLOCK_MONOTONIC, the rest on the clocks us=
e
> always syscalls.
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
>>> Note: This patch is independent from the others in this series, hence i=
t
>>> can be merged singularly by the kselftest maintainers.
>>>
>>>  tools/testing/selftests/vDSO/Makefile         |   2 +
>>>  .../selftests/vDSO/vdso_clock_getres.c        | 124 ++++++++++++++++++
>>>  2 files changed, 126 insertions(+)
>>>  create mode 100644 tools/testing/selftests/vDSO/vdso_clock_getres.c
>
> --
> Regards,
> Vincenzo


