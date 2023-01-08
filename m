Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E2F661602
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 16:02:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqgKR4gV8z3c9Z
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 02:02:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ADXAygM8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ADXAygM8;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqgJS6CZtz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 02:01:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7B29BB808D2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 15:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C881C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673190084;
	bh=sHcC6d95eha5RL0PNHV0Pqq2JIXx1sDRHn7BFrhN2+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ADXAygM8P4J5T94m1ITBlopC+BiTha8FIZ8LNaxsTKnVWpxyhyE9Ob73R+GsvLRZL
	 BiWSkBSFuQ2grfWuu8XuW+oToHJm9vnl9W/rzFDKaJaDiHbJyckG+pJnWMP/+BG3cV
	 qi3+rqLYFTeVjVShY013pxtOVoS0whEXfE6r8u3xS8LQ5x4FIMZFRFYInu6d4FmYCu
	 mtwyCcslUEgg0uI1z3f+6tJgZaPam0N2F1+Tw6lzq3pEvhxp4tnWzZnjWsIg+6hGEG
	 Ae/0oj56B2gThkwHYuexZLD5CAGbduvUJMJR2kT2VMuuPGT2E91OvP9LtAIRG3N+6V
	 TOd5NTaZw9p5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F254DC43141; Sun,  8 Jan 2023 15:01:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Sun, 08 Jan 2023 15:01:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216095-206035-wc8ZjdHGn3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216095-206035@https.bugzilla.kernel.org/>
References: <bug-216095-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216095

--- Comment #11 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303554
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303554&action=3Dedit
device tree - PowerMac G5 11,2

Here's also the device tree of my G5, having the same issue.

It was not necessary to force the output via '-f' here but I got lots of
warnings:

 # dtc -I fs -O dts /proc/device-tree > PowerMac-G5_11,2_device-tree.dts
<stdout>: Warning (reg_format): /smu@0,0:reg: property has invalid length (4
bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
<stdout>: Warning (pci_bridge): /ht@0,f2000000/pci@4: missing ranges for PCI
bridge (or not a bridge)
<stdout>: Warning (pci_bridge): /ht@0,f2000000/pci@1: missing ranges for PCI
bridge (or not a bridge)
<stdout>: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
<stdout>: Warning (pci_device_reg): Failed prerequisite 'reg_format'
<stdout>: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
<stdout>: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
<stdout>: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
<stdout>: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
<stdout>: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
<stdout>: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
<stdout>: Warning (avoid_default_addr_size): /rom@0,ff800000/boot-rom@fff00=
000:
Relying on default #size-cells value
<stdout>: Warning (avoid_default_addr_size):
/ht@0,f2000000/pci@8/mac-io@7/escc@13000/ch-b@13000: Relying on default
#size-cells value
<stdout>: Warning (avoid_default_addr_size):
/ht@0,f2000000/pci@8/mac-io@7/escc@13000/ch-a@13020: Relying on default
#size-cells value
<stdout>: Warning (avoid_default_addr_size):
/ht@0,f2000000/pci@8/mac-io@7/i2s@0/i2s-c@14000: Relying on default #size-c=
ells
value
<stdout>: Warning (avoid_default_addr_size):
/ht@0,f2000000/pci@8/mac-io@7/i2s@0/i2s-a@10000: Relying on default #size-c=
ells
value
<stdout>: Warning (avoid_default_addr_size):
/ht@0,f2000000/pci@8/mac-io@7/escc-legacy@12000/ch-b@12000: Relying on defa=
ult
#size-cells value
<stdout>: Warning (avoid_default_addr_size):
/ht@0,f2000000/pci@8/mac-io@7/escc-legacy@12000/ch-a@12004: Relying on defa=
ult
#size-cells value
<stdout>: Warning (avoid_unnecessary_addr_size): Failed prerequisite
'avoid_default_addr_size'
<stdout>: Warning (unique_unit_address): Failed prerequisite
'avoid_default_addr_size'
<stdout>: Warning (chosen_node_stdout_path): /chosen:linux,stdout-path: Use
'stdout-path' instead
<stdout>: Warning (alias_paths): /aliases:ipc: aliases property is not a va=
lid
node (/ipc)
<stdout>: Warning (alias_paths): /aliases:pci6: aliases property is not a v=
alid
node (/ht/pci@6)
<stdout>: Warning (alias_paths): /aliases:nvram: aliases property is not a
valid node (/nvram)
<stdout>: Warning (alias_paths): /aliases:mac-io: aliases property is not a
valid node (/ht/pci@8/mac-io)
<stdout>: Warning (alias_paths): /aliases:usb3: aliases property is not a v=
alid
node (/ht/pci@8/@b,1)
<stdout>: Warning (alias_paths): /aliases:pci4: aliases property is not a v=
alid
node (/ht/pci@4)
<stdout>: Warning (alias_paths): /aliases:k2-sata: aliases property is not a
valid node (/ht/pci@9/k2-sata-root)
<stdout>: Warning (alias_paths): /aliases:macio-mpic: aliases property is n=
ot a
valid node (/ht/pci@8/mac-io/mpic)
<stdout>: Warning (alias_paths): /aliases:via-pmu: aliases property is not a
valid node (/ht/pci@8/mac-io/via-pmu)
<stdout>: Warning (alias_paths): /aliases:pci2: aliases property is not a v=
alid
node (/ht/pci@2)
<stdout>: Warning (alias_paths): /aliases:ultra2: aliases property is not a
valid node (/ht/pci@9/k2-sata-root/k2-sata@2/disk@0)
<stdout>: Warning (alias_paths): /aliases:k2-mac-io: aliases property is no=
t a
valid node (/ht/pci@8/mac-io)
<stdout>: Warning (alias_paths): /aliases:k2-fw: aliases property is not a
valid node (/ht/pci@9/firewire)
<stdout>: Warning (alias_paths): /aliases:ui2c: aliases property is not a v=
alid
node (/u4/i2c)
<stdout>: Warning (alias_paths): /aliases:sccb: aliases property is not a v=
alid
node (/ht/pci@8/mac-io/escc/ch-b)
<stdout>: Warning (alias_paths): /aliases:sd2: aliases property is not a va=
lid
node (/ht/pci@9/k2-sata-root/k2-sata@2/disk@0)
<stdout>: Warning (alias_paths): /aliases:pci: aliases property is not a va=
lid
node (/ht/pci@8)
<stdout>: Warning (alias_paths): /aliases:cpu3: aliases property is not a v=
alid
node (/cpus/@3)
<stdout>: Warning (alias_paths): /aliases:k2-cd: aliases property is not a
valid node (/ht/pci@9/ata-6/disk@0)
<stdout>: Warning (alias_paths): /aliases:ultra0: aliases property is not a
valid node (/ht/pci@9/k2-sata-root/k2-sata@0/disk@0)
<stdout>: Warning (alias_paths): /aliases:hd: aliases property is not a val=
id
node (/ht/pci@9/k2-sata-root/k2-sata@0/disk@0)
<stdout>: Warning (alias_paths): /aliases:usb-2b: aliases property is not a
valid node (/ht/pci@8/@b,1)
<stdout>: Warning (alias_paths): /aliases:sd0: aliases property is not a va=
lid
node (/ht/pci@9/k2-sata-root/k2-sata@0/disk@0)
<stdout>: Warning (alias_paths): /aliases:pci9: aliases property is not a v=
alid
node (/ht/pci@9)
<stdout>: Warning (alias_paths): /aliases:sata: aliases property is not a v=
alid
node (/ht/pci@9/k2-sata-root)
<stdout>: Warning (alias_paths): /aliases:fw: aliases property is not a val=
id
node (/ht/pci@9/firewire)
<stdout>: Warning (alias_paths): /aliases:cpu1: aliases property is not a v=
alid
node (/cpus/@1)
<stdout>: Warning (alias_paths): /aliases:enet1: aliases property is not a
valid node (/ht/pci@2/@4,1)
<stdout>: Warning (alias_paths): /aliases:enet: aliases property is not a v=
alid
node (/ht/pci@2/@4)
<stdout>: Warning (alias_paths): /aliases:pci7: aliases property is not a v=
alid
node (/ht/pci@7)
<stdout>: Warning (alias_paths): /aliases:last-boot: aliases property is no=
t a
valid node (/ht@0,f2000000/pci@2/bcom5714)
<stdout>: Warning (alias_paths): /aliases:wireless: aliases property is not=
 a
valid node (/ht/pci@8/@1)
<stdout>: Warning (alias_paths): /aliases:pci10: aliases property is not a
valid node (/ht/pci@a)
<stdout>: Warning (alias_paths): /aliases:cd: aliases property is not a val=
id
node (/ht/pci@9/ata-6/disk@0)
<stdout>: Warning (alias_paths): /aliases:k2-uata: aliases property is not a
valid node (/ht/pci@9/ata-6)
<stdout>: Warning (alias_paths): /aliases:u4: aliases property is not a val=
id
node (/u4)
<stdout>: Warning (alias_paths): /aliases:pci5: aliases property is not a v=
alid
node (/ht/pci@5)
<stdout>: Warning (alias_paths): /aliases:usb2: aliases property is not a v=
alid
node (/ht/pci@8/@b)
<stdout>: Warning (alias_paths): /aliases:pci3: aliases property is not a v=
alid
node (/ht/pci@3)
<stdout>: Warning (alias_paths): /aliases:ultra3: aliases property is not a
valid node (/ht/pci@9/k2-sata-root/k2-sata@3/disk@0)
<stdout>: Warning (alias_paths): /aliases:uata: aliases property is not a v=
alid
node (/ht/pci@9/ata-6)
<stdout>: Warning (alias_paths): /aliases:sysclk: aliases property is not a
valid node (/smu/smu-i2c-control/i2c-bus@b/@d4)
<stdout>: Warning (alias_paths): /aliases:sd3: aliases property is not a va=
lid
node (/ht/pci@9/k2-sata-root/k2-sata@3/disk@0)
<stdout>: Warning (alias_paths): /aliases:first-boot: aliases property is n=
ot a
valid node (/ht@0,f2000000/pci@9/k2-sata-root@c/k2-sata)
<stdout>: Warning (alias_paths): /aliases:pci1: aliases property is not a v=
alid
node (/ht/pci@1)
<stdout>: Warning (alias_paths): /aliases:uni-mpic: aliases property is not=
 a
valid node (/u4/mpic)
<stdout>: Warning (alias_paths): /aliases:ultra1: aliases property is not a
valid node (/ht/pci@9/k2-sata-root/k2-sata@1/disk@0)
<stdout>: Warning (alias_paths): /aliases:usb-2c: aliases property is not a
valid node (/ht/pci@8/@b,2)
<stdout>: Warning (alias_paths): /aliases:dart: aliases property is not a v=
alid
node (/u4/dart)
<stdout>: Warning (alias_paths): /aliases:scca: aliases property is not a v=
alid
node (/ht/pci@8/mac-io/escc/ch-a)
<stdout>: Warning (alias_paths): /aliases:sd1: aliases property is not a va=
lid
node (/ht/pci@9/k2-sata-root/k2-sata@1/disk@0)
<stdout>: Warning (alias_paths): /aliases:cpu2: aliases property is not a v=
alid
node (/cpus/@2)
<stdout>: Warning (alias_paths): /aliases:cd1: aliases property is not a va=
lid
node (/ht/pci@9/ata-6/disk@1)
<stdout>: Warning (alias_paths): /aliases:usb-2a: aliases property is not a
valid node (/ht/pci@8/@b)
<stdout>: Warning (alias_paths): /aliases:pci8: aliases property is not a v=
alid
node (/ht/pci@8)
<stdout>: Warning (alias_paths): /aliases:smu: aliases property is not a va=
lid
node (/smu)
<stdout>: Warning (alias_paths): /aliases:ki2c: aliases property is not a v=
alid
node (/ht/pci@8/mac-io/i2c)
<stdout>: Warning (alias_paths): /aliases:pci11: aliases property is not a
valid node (/ht/pci@b)
<stdout>: Warning (alias_paths): /aliases:rtc: aliases property is not a va=
lid
node (/smu)
<stdout>: Warning (alias_paths): /aliases:uni-n: aliases property is not a
valid node (/u4)
<stdout>: Warning (alias_paths): /aliases:cpu0: aliases property is not a v=
alid
node (/cpus/@0)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
