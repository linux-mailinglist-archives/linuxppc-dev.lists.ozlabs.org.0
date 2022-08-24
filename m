Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CACE5A00D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 19:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCYhJ5QKsz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 03:57:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I5iWTIsi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I5iWTIsi;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCYgX46pqz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 03:56:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 617AA61703
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 17:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF085C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 17:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661363778;
	bh=Bhsy6Lvbn2BRiXXWg8HXe7dZ6sY3HO3PGQl33UQDuaA=;
	h=From:To:Subject:Date:From;
	b=I5iWTIsi2v2OWZjna2SLEUsrQb7mxh/SYk99KRA42IkQ41VKGgqrPaAiaWATnxUSh
	 elLzofT8VfkGkaEZnz1/2nlUaJk2ZIg7qsl6TfDgIywXlZrAzTsyq2K4KlxgQfBBZM
	 zCfsHRVaOnrSH/M3Lj6WmXGR+DV5I4DjWbG7NL5lnqX4+oeuysi/0xLNluzxsbA6Rj
	 TpZZt5aHMizzGepkvK6/LLTCiUCHD2OgOT3p5uM5M/bhzfR2etHpq8veApn5A1ZRjE
	 Q59f077nTVdXX1V1YWoaj31yxU+jK8sIrIy1T6JNOC+0fxjpvxlxzAVPNfLzlrt5sj
	 t1nAPjajPrhbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA594C433E4; Wed, 24 Aug 2022 17:56:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216407] New: OF: unittest fails some tests on ppc and ppc64
 (### dt-test ### end of unittest - 266 passed, 6 failed)
Date: Wed, 24 Aug 2022 17:56:18 +0000
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
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-216407-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216407

            Bug ID: 216407
           Summary: OF: unittest fails some tests on ppc and ppc64 (###
                    dt-test ### end of unittest - 266 passed, 6 failed)
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
                CC: frank.rowand@am.sony.com
        Regression: No

Created attachment 301645
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301645&action=3Dedit
dmesg (kernel 6.0-rc2, Talos II

[...]
### dt-test ### end of unittest - 266 passed, 6 failed

Failing tests on my Talos II are:
### dt-test ### FAIL of_unittest_dma_ranges_one():927 of_dma_get_range: wro=
ng
phys addr 0x0000000000000000 (expecting 20000000) on node
/testcase-data/address-tests/device@70000000
### dt-test ### FAIL of_unittest_dma_ranges_one():930 of_dma_get_range: wro=
ng
DMA addr 0x0000000020000000 (expecting 0) on node
/testcase-data/address-tests/device@70000000
### dt-test ### FAIL of_unittest_dma_ranges_one():927 of_dma_get_range: wro=
ng
phys addr 0x0000000100000000 (expecting 20000000) on node
/testcase-data/address-tests/bus@80000000/device@1000
### dt-test ### FAIL of_unittest_dma_ranges_one():930 of_dma_get_range: wro=
ng
DMA addr 0x0000000020000000 (expecting 100000000) on node
/testcase-data/address-tests/bus@80000000/device@1000
### dt-test ### FAIL of_unittest_dma_ranges_one():927 of_dma_get_range: wro=
ng
phys addr 0x0000000080000000 (expecting 20000000) on node
/testcase-data/address-tests/pci@90000000
### dt-test ### FAIL of_unittest_dma_ranges_one():930 of_dma_get_range: wro=
ng
DMA addr 0x0000000020000000 (expecting 80000000) on node
/testcase-data/address-tests/pci@90000000

Failing tests on my PowerMac G4 MDD are:
### dt-test ### FAIL of_unittest_dma_ranges_one():927 of_dma_get_range: wro=
ng
phys addr 0x00000000 (expecting 20000000) on node
/testcase-data/address-tests/device@70000000
### dt-test ### FAIL of_unittest_dma_ranges_one():930 of_dma_get_range: wro=
ng
DMA addr 0x20000000 (expecting 0) on node
/testcase-data/address-tests/device@70000000
### dt-test ### FAIL of_unittest_dma_ranges_one():927 of_dma_get_range: wro=
ng
phys addr 0x80000000 (expecting 20000000) on node
/testcase-data/address-tests/pci@90000000
### dt-test ### FAIL of_unittest_dma_ranges_one():930 of_dma_get_range: wro=
ng
DMA addr 0x20000000 (expecting 80000000) on node
/testcase-data/address-tests/pci@90000000

Devices on my Talos II:
 # lspci=20
0000:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0000:01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
Turks XT [Radeon HD 6670/7670]
0000:01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Turks HDMI
Audio [Radeon HD 6500/6600 / 6700M Series]
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

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
