Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A8F441F1D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 18:21:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hjfvh3NJ3z2yQC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 04:21:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66;
 helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de;
 receiver=<UNKNOWN>)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjfvB5F2gz2xXt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 04:20:54 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1mhazK-001Rtp-Nm; Mon, 01 Nov 2021 18:20:50 +0100
Received: from ipservice-092-213-028-039.092.213.pools.vodafone-ip.de
 ([92.213.28.39] helo=[192.168.178.67])
 by inpost2.zedat.fu-berlin.de (Exim 4.94) with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1mhazK-002G9M-H1; Mon, 01 Nov 2021 18:20:50 +0100
Message-ID: <fd7dbee5-464e-1063-d51c-85f2f2429019@physik.fu-berlin.de>
Date: Mon, 1 Nov 2021 18:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
Content-Language: en-US
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <73c55cc9-369e-8989-4f6c-6801ce6a4d64@physik.fu-berlin.de>
 <87k0hs8iyq.fsf@mpe.ellerman.id.au>
 <8759057e-170c-3972-997f-a63d88b0e94c@physik.fu-berlin.de>
In-Reply-To: <8759057e-170c-3972-997f-a63d88b0e94c@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 92.213.28.39
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
Cc: "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael!

On 11/1/21 08:37, John Paul Adrian Glaubitz wrote:
> I made another experiment and upgraded the host to 5.15-rc7 which contains your
> fixes and made the guests build gcc-10. Interestingly, this time, the gcc-10
> build crashed the guest but didn't manage to crash the host. I will update the
> guest to 5.15-rc7 now as well and see how that goes.

OK, so I'm definitely able to crash the 5.15 kernel as well:

[57031.404944] watchdog: BUG: soft lockup - CPU#24 stuck for 14957s! [migration/24:14]
[57035.420898] watchdog: BUG: soft lockup - CPU#48 stuck for 14961s! [CPU 17/KVM:1815]
[57047.456761] watchdog: BUG: soft lockup - CPU#152 stuck for 14841s! [CPU 13/KVM:1811]
[57055.404670] watchdog: BUG: soft lockup - CPU#24 stuck for 14979s! [migration/24:14]
[57059.420624] watchdog: BUG: soft lockup - CPU#48 stuck for 14983s! [CPU 17/KVM:1815]
[57064.064573] rcu: INFO: rcu_sched self-detected stall on CPU
[57064.064584] rcu:     48-....: (3338577 ticks this GP) idle=9f3/1/0x4000000000000002 softirq=77540/77540 fqs=15421 
[57064.064598] rcu: rcu_sched kthread timer wakeup didn't happen for 3988041 jiffies! g125265 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200
[57064.064606] rcu:     Possible timer handling issue on cpu=136 timer-softirq=313650
[57064.064611] rcu: rcu_sched kthread starved for 3988042 jiffies! g125265 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=136
[57064.064618] rcu:     Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
[57064.064624] rcu: RCU grace-period kthread stack dump:
[57064.064665] rcu: Stack dump where RCU GP kthread last ran:
[57071.456487] watchdog: BUG: soft lockup - CPU#152 stuck for 14863s! [CPU 13/KVM:1811]
[57079.404396] watchdog: BUG: soft lockup - CPU#24 stuck for 15002s! [migration/24:14]

And the gcc-10 testsuite is able to trigger the crash very reliably.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

