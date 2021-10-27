Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C743C23E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 07:31:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfHNn2lMGz3051
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 16:31:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cGBQ6iMY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfHN95M29z2xDH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 16:30:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cGBQ6iMY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfHN654rHz4xZ1;
 Wed, 27 Oct 2021 16:30:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635312647;
 bh=leSTX+Rm9y3LXVS0pN6o3I1VRc/lzT41j2YqAxzRpfc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cGBQ6iMYxesFMHqcSYXHdZ4yG49tXC0h9DhFNNZ7fcgamKrLThhb/ItuG72X3XRhK
 465oXB8uXBcZx05HlRiOhKk7kJl1OAC4V7WYLrb3rtMZ0BEdNQ7FsKARiVb4+tPaTM
 bHrfaSejYD4OeP0sqFiKd/ZOrSImmmejTl9/7vK2ZWKD5MdMEaNhWjoPWjqTT/ekdm
 dFATvS+sHt7BdYz2tl7prCBibs/Oz0JVHYWxZtQ9FufDhLaPvvdu5b33c87gGH2pBr
 mqNtsf4eXuXOLLqc06MF8bYQoWkqg1eJEACtNNWvIEk99ImXrymFv61YotU6v3zWgK
 VP0WWmY7+/ghg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
In-Reply-To: <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
Date: Wed, 27 Oct 2021 16:30:44 +1100
Message-ID: <878ryfavaz.fsf@mpe.ellerman.id.au>
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
Cc: oss-security@lists.openwall.com,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
> Hi Michael!

Hi Adrian,

Thanks for testing ...

>> The Linux kernel for powerpc since v5.2 has a bug which allows a
>> malicious KVM guest to crash the host, when the host is running on
>> Power8.
>> 
>> Only machines using Linux as the hypervisor, aka. KVM, powernv or bare
>> metal, are affected by the bug. Machines running PowerVM are not
>> affected.
>> 
>> The bug was introduced in:
>> 
>>     10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
>> 
>> Which was first released in v5.2.
>> 
>> The upstream fix is:
>> 
>>   cdeb5d7d890e ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest")
>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
>> 
>> Which will be included in the v5.16 release.
>
> I have tested these patches against 5.14 but it seems the problem [1] still remains for me
> for big-endian guests. I built a patched kernel yesterday, rebooted the KVM server and let
> the build daemons do their work over night.
>
> When I got up this morning, I noticed the machine was down, so I checked the serial console
> via IPMI and saw the same messages again as reported in [1]:
>
> [41483.963562] watchdog: BUG: soft lockup - CPU#104 stuck for 25521s! [migration/104:175]
> [41507.963307] watchdog: BUG: soft lockup - CPU#104 stuck for 25544s! [migration/104:175]
> [41518.311200] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41518.311216] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2729959 
> [41547.962882] watchdog: BUG: soft lockup - CPU#104 stuck for 25581s! [migration/104:175]
> [41571.962627] watchdog: BUG: soft lockup - CPU#104 stuck for 25603s! [migration/104:175]
> [41581.330530] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41581.330546] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2736378 
> [41611.962202] watchdog: BUG: soft lockup - CPU#104 stuck for 25641s! [migration/104:175]
> [41635.961947] watchdog: BUG: soft lockup - CPU#104 stuck for 25663s! [migration/104:175]
> [41644.349859] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41644.349876] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2742753 
> [41671.961564] watchdog: BUG: soft lockup - CPU#104 stuck for 25697s! [migration/104:175]
> [41695.961309] watchdog: BUG: soft lockup - CPU#104 stuck for 25719s! [migration/104:175]
> [41707.369190] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41707.369206] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2749151 
> [41735.960884] watchdog: BUG: soft lockup - CPU#104 stuck for 25756s! [migration/104:175]
> [41759.960629] watchdog: BUG: soft lockup - CPU#104 stuck for 25778s! [migration/104:175]
> [41770.388520] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41770.388548] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2755540 
> [41776.076307] rcu: rcu_sched kthread timer wakeup didn't happen for 1423 jiffies! g49897 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> [41776.076327] rcu:     Possible timer handling issue on cpu=32 timer-softirq=1056014
> [41776.076336] rcu: rcu_sched kthread starved for 1424 jiffies! g49897 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=32
> [41776.076350] rcu:     Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
> [41776.076360] rcu: RCU grace-period kthread stack dump:
> [41776.076434] rcu: Stack dump where RCU GP kthread last ran:
> [41783.960374] watchdog: BUG: soft lockup - CPU#104 stuck for 25801s! [migration/104:175]
> [41807.960119] watchdog: BUG: soft lockup - CPU#104 stuck for 25823s! [migration/104:175]
> [41831.959864] watchdog: BUG: soft lockup - CPU#104 stuck for 25846s! [migration/104:175]
> [41833.407851] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41833.407868] rcu:     136-...0: (135 ticks this GP) idle=242/1/0x4000000000000000 softirq=32031/32033 fqs=2760381 
> [41863.959524] watchdog: BUG: soft lockup - CPU#104 stuck for 25875s! [migration/104:175]
>
> It seems that in this case, it was the testsuite of the git package [2] that triggered the bug. As you
> can see from the overview, the git package has been in the building state for 8 hours meaning the
> build server crashed and is no longer giving feedback to the database.

OK, that sucks.

I did test the repro case you gave me before (in the bugzilla), which
was building glibc, that passes for me with a patched host.

I guess we have yet another bug.

I tried the following in a debian BE VM and it completed fine:

 $ dget -u http://ftp.debian.org/debian/pool/main/g/git/git_2.33.1-1.dsc
 $ sbuild -d sid --arch=powerpc --no-arch-all git_2.33.1-1.dsc

Same for ppc64.

And I also tried both at once, repeatedly in a loop.

I guess it's something more complicated.

What exact host/guest kernel versions and configs are you running?

cheers
