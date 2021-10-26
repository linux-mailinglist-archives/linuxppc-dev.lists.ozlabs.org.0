Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECC43AE5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 10:52:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdlty3Tqxz3bY9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 19:52:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66;
 helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 192 seconds by postgrey-1.36 at boromir;
 Tue, 26 Oct 2021 19:51:43 AEDT
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdltR6bWdz2y0C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 19:51:43 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mfI87-003mEw-Nv; Tue, 26 Oct 2021 10:48:23 +0200
Received: from p57bd9736.dip0.t-ipconnect.de ([87.189.151.54]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1mfI87-0045AS-GO; Tue, 26 Oct 2021 10:48:23 +0200
Message-ID: <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
Date: Tue, 26 Oct 2021 10:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: mpe@ellerman.id.au
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
Content-Language: en-US
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.54
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
Cc: oss-security@lists.openwall.com,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael!

> The Linux kernel for powerpc since v5.2 has a bug which allows a
> malicious KVM guest to crash the host, when the host is running on
> Power8.
> 
> Only machines using Linux as the hypervisor, aka. KVM, powernv or bare
> metal, are affected by the bug. Machines running PowerVM are not
> affected.
> 
> The bug was introduced in:
> 
>     10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
> 
> Which was first released in v5.2.
> 
> The upstream fix is:
> 
>   cdeb5d7d890e ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest")
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
> 
> Which will be included in the v5.16 release.

I have tested these patches against 5.14 but it seems the problem [1] still remains for me
for big-endian guests. I built a patched kernel yesterday, rebooted the KVM server and let
the build daemons do their work over night.

When I got up this morning, I noticed the machine was down, so I checked the serial console
via IPMI and saw the same messages again as reported in [1]:

[41483.963562] watchdog: BUG: soft lockup - CPU#104 stuck for 25521s! [migration/104:175]
[41507.963307] watchdog: BUG: soft lockup - CPU#104 stuck for 25544s! [migration/104:175]
[41518.311200] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[41518.311216] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2729959 
[41547.962882] watchdog: BUG: soft lockup - CPU#104 stuck for 25581s! [migration/104:175]
[41571.962627] watchdog: BUG: soft lockup - CPU#104 stuck for 25603s! [migration/104:175]
[41581.330530] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[41581.330546] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2736378 
[41611.962202] watchdog: BUG: soft lockup - CPU#104 stuck for 25641s! [migration/104:175]
[41635.961947] watchdog: BUG: soft lockup - CPU#104 stuck for 25663s! [migration/104:175]
[41644.349859] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[41644.349876] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2742753 
[41671.961564] watchdog: BUG: soft lockup - CPU#104 stuck for 25697s! [migration/104:175]
[41695.961309] watchdog: BUG: soft lockup - CPU#104 stuck for 25719s! [migration/104:175]
[41707.369190] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[41707.369206] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2749151 
[41735.960884] watchdog: BUG: soft lockup - CPU#104 stuck for 25756s! [migration/104:175]
[41759.960629] watchdog: BUG: soft lockup - CPU#104 stuck for 25778s! [migration/104:175]
[41770.388520] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[41770.388548] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2755540 
[41776.076307] rcu: rcu_sched kthread timer wakeup didn't happen for 1423 jiffies! g49897 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[41776.076327] rcu:     Possible timer handling issue on cpu=32 timer-softirq=1056014
[41776.076336] rcu: rcu_sched kthread starved for 1424 jiffies! g49897 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=32
[41776.076350] rcu:     Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
[41776.076360] rcu: RCU grace-period kthread stack dump:
[41776.076434] rcu: Stack dump where RCU GP kthread last ran:
[41783.960374] watchdog: BUG: soft lockup - CPU#104 stuck for 25801s! [migration/104:175]
[41807.960119] watchdog: BUG: soft lockup - CPU#104 stuck for 25823s! [migration/104:175]
[41831.959864] watchdog: BUG: soft lockup - CPU#104 stuck for 25846s! [migration/104:175]
[41833.407851] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[41833.407868] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2760381 
[41863.959524] watchdog: BUG: soft lockup - CPU#104 stuck for 25875s! [migration/104:175]

It seems that in this case, it was the testsuite of the git package [2] that triggered the bug. As you
can see from the overview, the git package has been in the building state for 8 hours meaning the
build server crashed and is no longer giving feedback to the database.

Adrian

> [1] https://bugzilla.kernel.org/show_bug.cgi?id=206669
> [2] https://buildd.debian.org/status/package.php?p=git&suite=experimental

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
