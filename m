Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5380C4FADA2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 13:17:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbqFQ1R8mz3bYP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 21:16:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jLvjL8zY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbqDp5lmcz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 21:16:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jLvjL8zY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KbqDp1Wtqz4x7Y;
 Sun, 10 Apr 2022 21:16:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649589386;
 bh=9yYI8lTl0E5dSfyyE6FsmUtYDygke+Twf1iIsHO3cek=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jLvjL8zYnCTQoptcA+dxRwE0hQQV+ota96O+2SbswWx+qeQJspmy/6lK4tPjuPLPF
 wh4pQUHlHlwpDgBQaoy1fa5fegGhBzaYSs9MQOjWhVwh+XeZumQydnc3ON1PTICbqK
 PaZNQ7wLuRp1Ab+BSlL9hEtqegnNXgvMdCKXJNPsOjOIaJomfl1OLsJn7QiWhV+Eeu
 2fEEfFjGnPK6NXhgWDo5BC2O28H87VgE+esYBkC2SPzBo0lC3zqTqiUktYTgCbiIsD
 h3EQ6enk9xY8Gv1dTMVYcOy/ZVIZMPIp0T54U18vRBiqZxlerX3GI1owSr8UXbdzrl
 jViAqa3vvcaFA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/powernv: Get L1D flush requirements from
 device-tree
In-Reply-To: <CACPK8XfM-odZm=AvjsmfB7fdK+3xc7gcwZX97H_1f8=ZOCAx4g@mail.gmail.com>
References: <20220404101536.104794-1-ruscur@russell.cc>
 <CACPK8XdifXFmjCJL3KDu8PJi4KLKWnOBeq86wZvN0kiHGQ=JHw@mail.gmail.com>
 <874k3883ct.fsf@mpe.ellerman.id.au>
 <CACPK8XfM-odZm=AvjsmfB7fdK+3xc7gcwZX97H_1f8=ZOCAx4g@mail.gmail.com>
Date: Sun, 10 Apr 2022 21:16:22 +1000
Message-ID: <878rsd6veh.fsf@mpe.ellerman.id.au>
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
Cc: Murilo Opsfelder =?utf-8?Q?Ara=C3=BAjo?= <mopsfelder@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> On Tue, 5 Apr 2022 at 06:13, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Joel Stanley <joel@jms.id.au> writes:
>> > On Mon, 4 Apr 2022 at 10:15, Russell Currey <ruscur@russell.cc> wrote:
>> >>
>> >> The device-tree properties no-need-l1d-flush-msr-pr-1-to-0 and
>> >> no-need-l1d-flush-kernel-on-user-access are the equivalents of
>> >> H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY and H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS
>> >> from the H_GET_CPU_CHARACTERISTICS hcall on pseries respectively.
>> >>
>> >> In commit d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version
>> >> check for entry and uaccess flushes") the condition for disabling the
>> >> L1D flush on kernel entry and user access was changed from any non-P9
>> >> CPU to only checking P7 and P8.  Without the appropriate device-tree
>> >> checks for newer processors on powernv, these flushes are unnecessarily
>> >> enabled on those systems.  This patch corrects this.
>> >>
>> >> Fixes: d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version check for entry and uaccess flushes")
>> >> Reported-by: Joel Stanley <joel@jms.id.au>
>> >> Signed-off-by: Russell Currey <ruscur@russell.cc>
>> >
>> > I booted both patches in this series on a power10 powernv machine,
>> > applied on top of v5.18-rc1:
>> >
>> > $ dmesg |grep -i flush
>> > [    0.000000] rfi-flush: fallback displacement flush available
>> > [    0.000000] rfi-flush: patched 12 locations (no flush)
>> > [    0.000000] count-cache-flush: flush disabled.
>> > [    0.000000] link-stack-flush: flush disabled.
>> >
>> > $ grep . /sys/devices/system/cpu/vulnerabilities/*
>> > /sys/devices/system/cpu/vulnerabilities/itlb_multihit:Not affected
>> > /sys/devices/system/cpu/vulnerabilities/l1tf:Not affected
>> > /sys/devices/system/cpu/vulnerabilities/mds:Not affected
>> > /sys/devices/system/cpu/vulnerabilities/meltdown:Not affected
>> > /sys/devices/system/cpu/vulnerabilities/spec_store_bypass:Not affected
>> > /sys/devices/system/cpu/vulnerabilities/spectre_v1:Mitigation: __user
>> > pointer sanitization, ori31 speculation barrier enabled
>> > /sys/devices/system/cpu/vulnerabilities/spectre_v2:Mitigation:
>> > Software count cache flush (hardware accelerated), Software link stack
>> > flush
>> > /sys/devices/system/cpu/vulnerabilities/srbds:Not affected
>> > /sys/devices/system/cpu/vulnerabilities/tsx_async_abort:Not affected
>> >
>> > Does that match what we expect?
>>
>> AFAIK yes. Happy for ruscur to correct me though.
>>
>> Can you also try running the kernel selftests under
>> tools/testing/selftests/powerpc/security/ ?
>
> Here's the results when booted with no_spectrev2 (which I keep on
> doing by accident, as this machine has it in it's nvram):
>
> make[1]: Entering directory
> '/home/joel/dev/kernels/linus/tools/testing/selftests/powerpc/security'
> TAP version 13
> 1..5
> # selftests: powerpc/security: rfi_flush
> # test: rfi_flush_test
> # tags: git_version:v5.18-rc1-0-g312310928417
> # PASS (L1D misses with rfi_flush=0: 63101900 < 95000000) [10/10 pass]
> # PASS (L1D misses with rfi_flush=1: 196001003 > 190000000) [10/10 pass]
> # success: rfi_flush_test
> ok 1 selftests: powerpc/security: rfi_flush
> # selftests: powerpc/security: entry_flush
> # test: entry_flush_test
> # tags: git_version:v5.18-rc1-0-g312310928417
> # PASS (L1D misses with entry_flush=0: 52766044 < 95000000) [10/10 pass]
> # PASS (L1D misses with entry_flush=1: 196082833 > 190000000) [10/10 pass]
> # success: entry_flush_test
> ok 2 selftests: powerpc/security: entry_flush
> # selftests: powerpc/security: uaccess_flush
> # test: uaccess_flush_test
> # tags: git_version:v5.18-rc1-0-g312310928417
> # PASS (L1D misses with uaccess_flush=0: 68646267 < 95000000) [10/10 pass]
> # PASS (L1D misses with uaccess_flush=1: 194177355 > 190000000) [10/10 pass]
> # success: uaccess_flush_test
> ok 3 selftests: powerpc/security: uaccess_flush
> # selftests: powerpc/security: spectre_v2
> # test: spectre_v2
> # tags: git_version:v5.18-rc1-0-g312310928417
> # sysfs reports: 'Vulnerable'
> #  PM_BR_PRED_CCACHE: result          0 running/enabled 2090650862
> # PM_BR_MPRED_CCACHE: result          1 running/enabled 2090648016
> # Miss percent 0 %
> # OK - Measured branch prediction rates match reported spectre v2 mitigation.
> # success: spectre_v2
> ok 4 selftests: powerpc/security: spectre_v2
> # selftests: powerpc/security: mitigation-patching.sh
> # Spawned threads enabling/disabling mitigations ...
> # Waiting for timeout ...
> # OK
> ok 5 selftests: powerpc/security: mitigation-patching.sh
>
>
> Here's the same thing without the command line option set:

Thanks.

> # test: spectre_v2
> # tags: git_version:v5.18-rc1-0-g312310928417
> # sysfs reports: 'Mitigation: Software count cache flush (hardware
> accelerated), Software link stack flush'
> #  PM_BR_PRED_CCACHE: result          0 running/enabled 2016985490
> # PM_BR_MPRED_CCACHE: result          1 running/enabled 2016981520
> # Miss percent 0 %
> # OK - Measured branch prediction rates match reported spectre v2 mitigation.
> # success: spectre_v2

This passed, but looks wrong, it says there were zero branches correctly
predicted.

I think the PMU events were are using are wrong for P10, the test will
need updating to use the right events for P10.

cheers
