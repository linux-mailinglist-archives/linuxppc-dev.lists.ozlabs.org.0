Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A918C13F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 21:23:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jyzF28nXzDrPK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 07:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=snv8=5e=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jyxX12wzzDrMs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 07:22:07 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206669] Little-endian kernel crashing on POWER8 on heavy
 big-endian PowerKVM load
Date: Thu, 19 Mar 2020 20:22:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glaubitz@physik.fu-berlin.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206669-206035-3cC7SDyIhU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206669-206035@https.bugzilla.kernel.org/>
References: <bug-206669-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206669

--- Comment #13 from John Paul Adrian Glaubitz (glaubitz@physik.fu-berlin.d=
e) ---
watson login: [30887.552539] KVM: CPU 4 seems to be stuck
[30900.094713] watchdog: CPU 8 detected hard LOCKUP on other CPUs 0
[30900.094730] watchdog: CPU 8 TB:15863742878763, last SMP heartbeat
TB:15855546563837 (16008ms ago)
[30908.222926] watchdog: BUG: soft lockup - CPU#80 stuck for 22s! [CPU
4/KVM:2698]
[30908.374929] watchdog: BUG: soft lockup - CPU#112 stuck for 22s! [CPU
23/KVM:2717]
[30908.426934] watchdog: BUG: soft lockup - CPU#120 stuck for 22s! [CPU
16/KVM:2710]
[30909.570962] rcu: INFO: rcu_sched self-detected stall on CPU
[30909.570970] rcu:     120-....: (5059 ticks this GP)
idle=3D7d2/1/0x4000000000000002 softirq=3D421758/421758 fqs=3D2378=20
[30912.095025] watchdog: BUG: soft lockup - CPU#8 stuck for 23s! [CPU
18/KVM:2712]
[30912.127027] watchdog: BUG: soft lockup - CPU#40 stuck for 23s! [CPU
22/KVM:2716]
[30912.155026] watchdog: BUG: soft lockup - CPU#56 stuck for 23s! [CPU
27/KVM:2721]
[30912.175028] watchdog: BUG: soft lockup - CPU#64 stuck for 23s! [CPU
26/KVM:2720]
[30912.195028] watchdog: BUG: soft lockup - CPU#72 stuck for 23s! [CPU
19/KVM:2713]
[30912.547038] watchdog: BUG: soft lockup - CPU#136 stuck for 22s! [CPU
8/KVM:2702]
[30912.619040] watchdog: BUG: soft lockup - CPU#144 stuck for 22s! [CPU
5/KVM:2699]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
