Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBF94CB2B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 00:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K88pr3wt0z3bwk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 10:05:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WTj1Vi4O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WTj1Vi4O; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K88p63mxXz30Kt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 10:04:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8AD75CE215B
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBD45C004E1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646262283;
 bh=LcqHCDo/v7x7iyQYtiyb/DRAWd1Wcdp+v8IrbgqkO2I=;
 h=From:To:Subject:Date:From;
 b=WTj1Vi4ORTwq/mPLwh+chwwDh2JwcRTdmmp1pF8XqSN8aAuARIHlRrVGkhjFtyh2p
 wQ4mriyW/UZdwDkH/giq4vmHFwf0IFM+d3XzYooizvkh/9yoQxZzCVEvEkWDQkKw/m
 HqhbfjNi5o7CasodabmprypS03e4R/aovARcNQZZgT4LvWm8oUEl+DMNoIIzXAWnyF
 zTx27DcdnQZzZ7EDKbrIe9luHgSEnF5Gl/VlkTCM3ZlUi1EuuEOTS9Vx3lpVZ+fU5b
 xxIPO4/W9OEiCvsV2PAKkfy5y45TnfqUrE3r/ow1/xmNX6wqu2Mz6TMekNOxXik3IP
 La/5BvMJUy2+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CC64AC05F98; Wed,  2 Mar 2022 23:04:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215652] New: kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Wed, 02 Mar 2022 23:04:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-215652-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

            Bug ID: 215652
           Summary: kernel 5.17-rc fail to load radeon DRM "modprobe:
                    ERROR: could not insert 'radeon': Unknown symbol in
                    module, or unknown parameter (see dmesg)"
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17-rc5
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: platform_ppc-64@kernel-bugs.osdl.org
        Regression: No

Created attachment 300520
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300520&action=3Dedit
kernel dmesg (kernel 5.17-rc5, CONFIG_DRM_RADEON=3Dm, Talos II)

Kernel 5.17-rc5 has problems loading the radeon KMS module on my Talos II:

 # modprobe -v radeon
insmod /lib/modules/5.17.0-rc5-P9+/kernel/drivers/gpu/drm/drm_kms_helper.ko=
=20
modprobe: ERROR: could not insert 'radeon': Unknown symbol in module, or
unknown parameter (see dmesg)

dmesg show no further output then.

When I build a kernel with CONFIG_DRM_RADEON=3Dy I get this in dmesg:
[...]
ATOM BIOS: X1550
[drm] Generation 2 PCI interface, using max accessible memory
radeon 0000:01:00.0: VRAM: 512M 0x0000000000000000 - 0x000000001FFFFFFF (51=
2M
used)
radeon 0000:01:00.0: GTT: 512M 0x0000000020000000 - 0x000000003FFFFFFF
[drm] Detected VRAM RAM=3D512M, BAR=3D256M
[drm] RAM width 128bits DDR
radeon 0000:01:00.0: dma_iommu_get_required_mask: returning bypass mask
0xfffffffffffffff
[drm] radeon: 512M of VRAM memory ready
[drm] radeon: 512M of GTT memory ready.
[drm] GART: num cpu pages 131072, num gpu pages 131072
[drm] radeon: 1 quad pipes, 1 z pipes initialized.
[drm] PCIE GART of 512M enabled (table at 0x0000000000040000).
radeon 0000:01:00.0: WB enabled
radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 0x0000000020000000
radeon 0000:01:00.0: radeon: MSI limited to 32-bit
[drm] radeon: irq initialized.
[drm] Loading R500 Microcode
radeon 0000:01:00.0: Direct firmware load for radeon/R520_cp.bin failed with
error -2
radeon_cp: Failed to load firmware "radeon/R520_cp.bin"
[drm:.r100_cp_init] *ERROR* Failed to load firmware!
radeon 0000:01:00.0: failed initializing CP (-2).
radeon 0000:01:00.0: Disabling GPU acceleration

So it complains about not finding the relevant firmware. But the firmware b=
eing
located in everything should be ok. This used to work on kernels 5.16.x and
before.

 # ls -al /lib/firmware/radeon/R520_cp.bin
-rw-r--r-- 1 root root 2048  2. M=C3=A4r 20:43 /lib/firmware/radeon/R520_cp=
.bin


Some data about the machine:
 # lspci=20
0000:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0000:01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
RV516 [Radeon X1300/X1550 Series]
0000:01:00.1 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] RV5=
16
[Radeon X1300/X1550 Series] (Secondary)
0001:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0001:01:00.0 Non-Volatile memory controller: Phison Electronics Corporation
Device 5008 (rev 01)
0002:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0003:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0003:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 =
xHCI
Host Controller (rev 02)
0004:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0004:01:00.0 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme
BCM5719 Gigabit Ethernet PCIe (rev 01)
0004:01:00.1 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme
BCM5719 Gigabit Ethernet PCIe (rev 01)
0005:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0005:01:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge =
(rev
04)
0005:02:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Grap=
hics
Family (rev 41)
0030:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0031:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0032:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0033:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)

 # lspci -s 0000:01:00.0 -vv
0000:01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
RV516 [Radeon X1300/X1550 Series] (prog-if 00 [VGA controller])
        Subsystem: PC Partner Limited / Sapphire Technology RV516 [Radeon
X1300/X1550 Series]
        Device tree node:
/sys/firmware/devicetree/base/pciex@600c3c0000000/pci@0/vga@0
        Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr+
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 42
        NUMA node: 0
        IOMMU group: 0
        Region 0: Memory at 6000000000000 (64-bit, prefetchable) [size=3D25=
6M]
        Region 2: Memory at 600c000020000 (64-bit, non-prefetchable) [size=
=3D64K]
        Region 4: I/O ports at <unassigned> [disabled]
        Expansion ROM at 600c000000000 [disabled] [size=3D128K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [58] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <4us=
, L1
unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE- FLReset-
SlotPowerLimit 0.000W
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
        Capabilities: [80] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: radeon

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
