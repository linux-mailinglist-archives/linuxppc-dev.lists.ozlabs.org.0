Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32895276B0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:43:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxn8Y6GHTzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:43:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=r/5u=db=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxn6j5JRTzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 17:41:33 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 195755] rcu_sched detected stalls on CPUs/tasks: (detected by
 0, t=6302 jiffies, g=11405, c=11404, q=1880), ppc64, G5
Date: Thu, 24 Sep 2020 07:41:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nigel@nigelreed.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-195755-206035-oaOZpt2v1i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-195755-206035@https.bugzilla.kernel.org/>
References: <bug-195755-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D195755

Nigel Reed (nigel@nigelreed.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nigel@nigelreed.net

--- Comment #29 from Nigel Reed (nigel@nigelreed.net) ---
I know this is old but I have been having some issues for a while, I was
finally able to get something useful:

[165716.089703] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[165716.095949] rcu:    1-...!: (0 ticks this GP) idle=3D354/0/0x0
softirq=3D2154363/2154363 fqs=3D0
[165716.104512] rcu:    3-...!: (0 ticks this GP) idle=3D29c/0/0x0
softirq=3D883832/883832 fqs=3D0
[165716.112873] rcu:    4-...!: (8 GPs behind) idle=3Dad8/0/0x0
softirq=3D2165586/2165586 fqs=3D0
[165716.121179] rcu:    9-...!: (9 GPs behind) idle=3Dacc/0/0x0
softirq=3D1340600/1340600 fqs=3D0
[165716.129467] rcu:    11-...!: (2 GPs behind) idle=3Da18/0/0x0
softirq=3D4538536/4538537 fqs=3D0
[165716.137828] rcu:    12-...!: (0 ticks this GP) idle=3D870/0/0x0
softirq=3D2158040/2158040 fqs=3D0
[165775.697763] rcu: rcu_sched kthread starved for 29898 jiffies! g36134941
f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D3
[165775.709013] rcu: RCU grace-period kthread stack dump:
[165837.494623] watchdog: BUG: soft lockup - CPU#6 stuck for 23s!
[(resolved):52315]
[165865.494840] watchdog: BUG: soft lockup - CPU#6 stuck for 23s!
[(resolved):52315]

This happened just after freshclam ran but I don't know if it's related.

This is with a Ryzen 7 1800X CPU.
5.4.0-48-generic #52-Ubuntu

I thought I had sysrq configured but it seems not so I can't really provide=
 any
more information, other than this is driving me crazy.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
