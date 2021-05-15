Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE138188D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 13:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fj3ng3W02z30Ff
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 21:58:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hsTjT4xJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hsTjT4xJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fj3n85f9gz2yWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 21:58:04 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 22AFD613BB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621079882;
 bh=j5jGJelTsCOlKHW06H20LcMAJFdONbtRZC7+Q4/oC9g=;
 h=From:To:Subject:Date:From;
 b=hsTjT4xJpiFU7NgGGFXcFpa5UOTYbRmnRPvp+4PxhRMxujajHajqCcl1y4bSo3aPP
 XW71l0VEkb+rVwoJ5vcUsRXL5yF48Tf63QKiehQOi7RmAVQZdRk6ZozL2lK3PeRk2j
 GTOZLo7fJ5+6QkptnHgAooBVl4XfxWucWSvtuFRZ0JDJ4TqrC75px5+4AvdGA2VcVL
 U4YEM3W7X26H/3BBGkbUq/14+QoXi2yK1S7DwP9GK8arwa54TojpGEgzLHKrf4gfRW
 54PMDCgvZCcxzw+l5chYkW9u7undDgCCzdXiGG76PQ4DBr+xupIeA97DJoLB6GGssZ
 /ImERg2nfngDg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0E12361026; Sat, 15 May 2021 11:58:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] New: IRQ problems and crashes on a PowerMac G5 with
 5.13-rc1
Date: Sat, 15 May 2021 11:58:01 +0000
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
Message-ID: <bug-213079-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213079

            Bug ID: 213079
           Summary: IRQ problems and crashes on a PowerMac G5 with
                    5.13-rc1
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.13-rc1
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

Created attachment 296759
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296759&action=3Dedit
dmesg (5.13-rc1, PowerMac G5 11,2)

With v5.13-rc1 I get IRQ problems and crashes on my G5 sooner or later. IRQ=
 63
is my NVMe SSD.

[...]
irq 63: nobody cared (try booting with the "irqpoll" option)
CPU: 1 PID: 11783 Comm: emerge Tainted: G        W=20=20=20=20=20=20=20=20
5.13.0-rc1-PowerMacG5 #3
Call Trace:
[c00000000ffefae0] [c000000000549790] .dump_stack+0xe0/0x13c (unreliable)
[c00000000ffefb80] [c0000000000def44] .__report_bad_irq+0x34/0xf0
[c00000000ffefc20] [c0000000000dee2c] .note_interrupt+0x258/0x300
[c00000000ffefce0] [c0000000000db0a8] .handle_irq_event_percpu+0x64/0x90
[c00000000ffefd70] [c0000000000db118] .handle_irq_event+0x44/0x70
[c00000000ffefe00] [c0000000000e0530] .handle_fasteoi_irq+0xac/0x158
[c00000000ffefea0] [c0000000000da164] .generic_handle_irq+0x38/0x58
[c00000000ffeff10] [c000000000011674] .__do_irq+0x15c/0x238
[c00000000ffeff90] [c000000000012068] .do_IRQ+0x180/0x188
[c00000014d357d70] [c000000000011f88] .do_IRQ+0xa0/0x188
[c00000014d357e10] [c000000000007f94]
hardware_interrupt_common_virt+0x1a4/0x1b0
--- interrupt: 500 at 0x3fffb07a1a9c
NIP:  00003fffb07a1a9c LR: 00003fffb07a3d08 CTR: 00003fffb074cb30
REGS: c00000014d357e80 TRAP: 0500   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.13.0-rc1-PowerMacG5)
MSR:  900000000000f032 <SF,HV,EE,PR,FP,ME,IR,DR,RI>  CR: 22482820  XER:
20000000
IRQMASK: 0=20
GPR00: 00003fffb07a3d08 00003fffe84d07a0 00003fffb0ad1200 00003fffa8131100=
=20
GPR04: 00003fffa9ea4bd0 a5a8b016e7fdc57d 00003fffe84d0810 00003fffb0aa7ac0=
=20
GPR08: 00003fffb0ab3708 00003fffab4eb870 0000000000000000 0000000000000000=
=20
GPR12: 00003fffb07b92a0 00003fffb0b8e850 00003fffe84d0a58 000000014df42388=
=20
GPR16: 00003fffe84d0a70 ffffffffffffffff 00003fffafbf54c0 ffffffffffffffff=
=20
GPR20: 0000000000000000 000000014df42338 000000014c677878 0000000000000000=
=20
GPR24: 00003fffafc0b5b0 000000014c677830 00003fffafcc8a50 a5a8b016e7fdc57d=
=20
GPR28: 00003fffa863bcc0 00003fffa8131100 00003fffa9ea4bd0 00003fffa8131100=
=20
NIP [00003fffb07a1a9c] 0x3fffb07a1a9c
LR [00003fffb07a3d08] 0x3fffb07a3d08
--- interrupt: 500
handlers:
[<00000000370eb0ba>] .nvme_irq
[<00000000370eb0ba>] .nvme_irq
Disabling IRQ #63
Call Trace:
Kernel panic - not syncing: corrupted stack end detected inside scheduler
CPU: 0 PID: 814 Comm: kworker/u4:2 Tainted: G        W=20=20=20=20=20=20=20=
=20
5.13.0-rc1-PowerMacG5 #3
Workqueue: writeback .wb_workfn (flush-254:1)
[c00000007db5ab40] [c000000000549790] .dump_stack+0xe0/0x13c (unreliable)
[c00000007db5abe0] [c0000000000680dc] .panic+0x168/0x430
[c00000007db5ac90] [c000000000811e40] .__schedule+0x80/0x840
[c00000007db5ad70] [c00000000081274c] .preempt_schedule_common+0x28/0x48
[c00000007db5adf0] [c00000000081279c] .__cond_resched+0x30/0x4c
[c00000007db5ae70] [c0000000001c6a98] .mempool_alloc+0x38/0x1a4
[c00000007db5af50] [c0000000004a1a70] .bio_alloc_bioset+0x94/0x174
[c00000007db5b000] [c000000000354840] .ext4_bio_write_page+0x314/0x480
[c00000007db5b0c0] [c0000000003334d4] .mpage_submit_page+0x70/0xa0
[c00000007db5b140] [c000000000333630] .mpage_process_page_bufs+0x12c/0x18c
[c00000007db5b1d0] [c0000000003338b8] .mpage_prepare_extent_to_map+0x1f8/0x=
228
[c00000007db5b320] [c000000000339088] .ext4_writepages+0x360/0xe5c
[c00000007db5b5d0] [c0000000001cee84] .do_writepages+0x54/0xa0
[c00000007db5b650] [c0000000002a49bc] .__writeback_single_inode+0x100/0x560
[c00000007db5b700] [c0000000002a53d8] .writeback_sb_inodes+0x2dc/0x4c8
[c00000007db5b880] [c0000000002a5654] .__writeback_inodes_wb+0x90/0xcc
[c00000007db5b930] [c0000000002a58c0] .wb_writeback+0x230/0x3dc
[c00000007db5ba50] [c0000000002a6790] .wb_workfn+0x380/0x460
[c00000007db5bbb0] [c0000000000890a0] .process_one_work+0x318/0x4dc
[c00000007db5bca0] [c000000000089730] .worker_thread+0x224/0x290
[c00000007db5bd60] [c000000000091200] .kthread+0x134/0x13c
[c00000007db5be10] [c00000000000bbf4] .ret_from_kernel_thread+0x58/0x64
Rebooting in 120 seconds..


 # lspci -vv -s 0001:08:00.0
0001:08:00.0 Non-Volatile memory controller: Intel Corporation SSD Pro
7600p/760p/E 6100p Series (rev 03) (prog-if 02 [NVM Express])
        Subsystem: Intel Corporation SSD Pro 7600p/760p/E 6100p Series [NVM
Express]
        Device tree node:
/sys/firmware/devicetree/base/ht@0,f2000000/pci@5/pci8086,390b@0
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx+
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 63
        NUMA node: 0
        Region 0: Memory at a0000000 (64-bit, non-prefetchable) [size=3D16K]
        Capabilities: [40] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [50] MSI: Enable- Count=3D1/8 Maskable+ 64bit+
                Address: 0000000000000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [70] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
SlotPowerLimit 0.000W
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop- FLRese=
t-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Laten=
cy
L1 <8us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (downgraded), Width x4 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrP=
rP-
LTR+
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, Ext=
Fmt-
EETLPPrefix-
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS- TPHComp- ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR-
OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retim=
er-
2Retimers- DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDi=
s-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [b0] MSI-X: Enable- Count=3D16 Masked-
                Vector table: BAR=3D0 offset=3D00002000
                PBA: BAR=3D0 offset=3D00002100
        Kernel driver in use: nvme

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
