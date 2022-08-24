Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F85A03B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 00:06:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCgDP0XBxz3c1p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 08:06:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FVgeeXeZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FVgeeXeZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCgCf1V3Dz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 08:06:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 505276192F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B61A0C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661378762;
	bh=QVrv24tC5JytSHBAaVEa8JTkMgNPoHMiJmGuhQ9Ds54=;
	h=From:To:Subject:Date:From;
	b=FVgeeXeZ5HLKXW71gVqa8FlXovjYoGcRpKeBbz9AEi4UIUyZoQ0y6Ibk5HcoZxeOH
	 91ZP74z+6KnAvIl8dLLxvzak3qpuzvZd3tVfd1Ofz52k4v+l6xgI+DS2yXcSIkmnhI
	 SyOacVfUx0PBd5CtU7VnUkcqQNKD1rmlxgTPBtHL4S852NN+gyXRCbbS4tHPy40PEZ
	 ufDH2c8x3KYYEZk89IrVbq9qpXTr6aCya+EdhDDupqKcyTX9+Wk56Cl8Pr0hce7rWJ
	 Ntse9BW7GAYTcmtBTLMux/7h4lEHUFYRqdvzetQd6g4zcUdoybUsWSmg+El6yL2jgu
	 pXi6eywpjTjlQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CE50C433E6; Wed, 24 Aug 2022 22:06:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216410] New: WARNING: inconsistent lock state, "inconsistent
 {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage" at boot
Date: Wed, 24 Aug 2022 22:06:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216410-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216410

            Bug ID: 216410
           Summary: WARNING: inconsistent lock state, "inconsistent
                    {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage" at boot
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.0-rc2
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 301649
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301649&action=3Dedit
dmesg (6.0-rc2, PowerMac G5 11,2)

With some lock debugging options turned on I get this at every boot:

[...]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
WARNING: inconsistent lock state
6.0.0-rc2-PMacG5 #2 Tainted: G                T=20
--------------------------------
inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
swapper/0/1 [HC0[0]:SC0[0]:HE1:SE1] takes:
c0000000024227f0 (native_tlbie_lock){+.?.}-{2:2}, at: .tlbie+0x138/0x4c0
{IN-SOFTIRQ-W} state was registered at:
  .lock_acquire+0x12c/0x4a0
  ._raw_spin_lock+0x44/0x90
  .tlbie+0x138/0x4c0
  .native_hpte_invalidate+0xd4/0x320
  .hash__kernel_map_pages+0x424/0x5a0
  .free_pcp_prepare+0x744/0x890
  .free_unref_page+0x30/0x2f0
  .thread_stack_free_rcu+0x2c/0x50
  .rcu_core+0x8b0/0x1c20
  .__do_softirq+0x188/0x674
  .do_softirq_own_stack+0x30/0x70
  .__irq_exit_rcu+0x150/0x1d0
  .irq_exit+0x10/0x50
  .timer_interrupt+0x260/0x700
  decrementer_common_virt+0x208/0x210
  .power4_idle+0x5c/0x150
  .arch_cpu_idle+0x60/0x200
  .default_idle_call+0xd8/0x3bc
  .do_idle+0x148/0x210
  .cpu_startup_entry+0x30/0x40
  .start_secondary+0x650/0xc40
  start_secondary_prolog+0x10/0x14
irq event stamp: 594659
hardirqs last  enabled at (594659): [<c000000000ddb034>]
._raw_spin_unlock_irqrestore+0xa4/0x110
hardirqs last disabled at (594658): [<c000000000ddbfe8>]
._raw_spin_lock_irqsave+0xb8/0xd0
softirqs last  enabled at (594548): [<c000000000ddc67c>]
.__do_softirq+0x47c/0x674
softirqs last disabled at (594527): [<c0000000000143d0>]
.do_softirq_own_stack+0x30/0x70

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(native_tlbie_lock);
  <Interrupt>
    lock(native_tlbie_lock);

 *** DEADLOCK ***

no locks held by swapper/0/1.

stack backtrace:
CPU: 1 PID: 1 Comm: swapper/0 Tainted: G                T  6.0.0-rc2-PMacG5=
 #2
Call Trace:
[c0000000039d75b0] [c00000000090c714] .dump_stack_lvl+0xb0/0x124 (unreliabl=
e)
[c0000000039d7640] [c000000000154fb0] .print_usage_bug.part.0+0x250/0x2a0
[c0000000039d76f0] [c00000000014e06c] .mark_lock+0xd9c/0xe40
[c0000000039d7830] [c00000000014eaa0] .__lock_acquire+0x5c0/0x2880
[c0000000039d7960] [c0000000001519cc] .lock_acquire+0x12c/0x4a0
[c0000000039d7a60] [c000000000ddaa14] ._raw_spin_lock+0x44/0x90
[c0000000039d7ae0] [c00000000005c678] .tlbie+0x138/0x4c0
[c0000000039d7b90] [c000000000053568] .hash__change_memory_range+0x108/0x160
[c0000000039d7c40] [c0000000000543fc] .hash__mark_initmem_nx+0x4c/0x90
[c0000000039d7cc0] [c00000000004f014] .mark_initmem_nx+0x24/0x60
[c0000000039d7d30] [c00000000004da54] .free_initmem+0x24/0x90
[c0000000039d7da0] [c0000000000111d8] .kernel_init+0x38/0x1a0
[c0000000039d7e10] [c00000000000bbf0] .ret_from_kernel_thread+0x58/0x60
Freeing unused kernel image (initmem) memory: 4216K
Warning: Unable to mark rodata read only on this CPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
