Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87881FB29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 21:17:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=PaZNakil;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1KYg3Lgrz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 07:17:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=PaZNakil;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1KXr1P9Mz2yks
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Dec 2023 07:16:44 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 25E448285674
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 14:16:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id STeklCWTfV6V for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 28 Dec 2023 14:16:37 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 405038285693
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 14:16:37 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 405038285693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1703794597; bh=zKO7hu5wb1t0F6a31UrOab7kBfA4WOa8XICf6w5XxAk=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=PaZNakilsjTwFrKWPDgS8U2pv746GJFvOK76YGhf/nbUxwbfl/YOoNLUTMOEIIqJM
	 kSGyHr3l0yiq5rumiAtpjZrvEIC9A6zh7fAvh7uFZ7xPZSvuupt7iudU2xS9HSjAuD
	 egb0j+xpEAxGhLgVQ2UD6V2JJ6rRRPoshjKzvGUI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id e5krLE55rEvx for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 28 Dec 2023 14:16:37 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id ECC408285674
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 14:16:36 -0600 (CST)
Date: Thu, 28 Dec 2023 14:16:34 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <708065764.2315059.1703794594730.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1981605666.2142272.1703742465927.JavaMail.zimbra@raptorengineeringinc.com>
References: <674182417.2124034.1703736924982.JavaMail.zimbra@raptorengineeringinc.com> <1981605666.2142272.1703742465927.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: PowerNV PCIe hotplug support?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC112 (Linux)/8.5.0_GA_3042)
Thread-Topic: PowerNV PCIe hotplug support?
Thread-Index: hMP2kkUFF0gjw2HUkQhVOS3bUJ+WaUMs0ZDltbGdzmk=
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

Another oops, this time just directly trying to remove the switch card with echo 0 > power instead of first removing the downstream NVMe drive:

[  157.287593] pci 0000:08     : [PE# 1fb] Releasing PE
[  157.287624] pci 0000:08     : [PE# 1fb] Removing DMA window #0
[  157.287648] pci 0000:08     : [PE# 1fb] Disabling 64-bit DMA bypass
[  157.290166] pci_bus 0000:22: busn_res: [bus 22-26] is released
[  157.290331] ------------[ cut here ]------------
[  157.290355] WARNING: CPU: 13 PID: 1170 at kernel/irq/msi.c:276 msi_device_data_release+0x90/0xf0
[  157.290401] Modules linked in: pnv_php switchtec i2c_dev ses enclosure scsi_transport_sas xts ecb sg ctr nvme cbc nvme_core ofpart drm_shmem_helper t10_pi vmx_crypto ipmi_powernv powernv_flash crc64_rocksoft_generic ipmi_devintf gf128mul drm_kms_helper crct10dif_vpmsum opal_prd ipmi_msghandler mtd at24 i2c_algo_bit regmap_i2c crc64_rocksoft crc64 evdev joydev aacraid binfmt_misc drm loop fuse dm_mod drm_panel_orientation_quirks ip_tables x_tables autofs4 nfsv3 nfs_acl nfs lockd grace sunrpc fscache netfs ib_mthca ib_ipoib ib_umad rdma_ucm rdma_cm iw_cm ib_cm configfs mlx4_ib ib_uverbs ib_core hid_generic usbhid hid xhci_pci xhci_hcd ixgbe mdio_devres of_mdio tg3 fixed_phy fwnode_mdio xfrm_algo mdio crc32c_vpmsum usbcore mlx4_core libphy usb_common [last unloaded: pnv_php]
[  157.290716] CPU: 13 PID: 1170 Comm: bash Not tainted 6.6.8 #1
[  157.290743] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.290780] NIP:  c000000000204f20 LR: c000000000204ec4 CTR: c000000000204e90
[  157.290817] REGS: c00000003a1bb600 TRAP: 0700   Not tainted  (6.6.8)
[  157.290853] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 82488282  XER: 00000000
[  157.290905] CFAR: c000000000204ecc IRQMASK: 0
               GPR00: c000000000204ec4 c00000003a1bb8a0 c0000000010fe800 c0000000233f6ff8
               GPR04: 0000000000000000 c00000003a1bb938 c0000000233f6fc0 c00000000f168a00
               GPR08: 0000000000000000 c000000026507200 c00000000f168a00 fffffffffffffffd
               GPR12: c000000000204e90 c000001ffffd1c80 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000000000000 c0002000109c7170 c0002000109c7384
               GPR28: c0002000109c70c0 c00000003a1bb938 c0002000109c70c0 c0000000233f6fe8
[  157.291145] NIP [c000000000204f20] msi_device_data_release+0x90/0xf0
[  157.291183] LR [c000000000204ec4] msi_device_data_release+0x34/0xf0
[  157.291211] Call Trace:
[  157.291230] [c00000003a1bb8a0] [c000000000204ec4] msi_device_data_release+0x34/0xf0 (unreliable)
[  157.291274] [c00000003a1bb8d0] [c000000000989038] release_nodes+0x68/0x140
[  157.291306] [c00000003a1bb910] [c00000000098ade0] devres_release_all+0xc0/0x130
[  157.291329] [c00000003a1bb980] [c000000000975d1c] device_del+0x2fc/0x4d0
[  157.291359] [c00000003a1bba50] [c00000000089608c] pci_remove_bus_device+0x9c/0x1d0
[  157.291393] [c00000003a1bba90] [c0000000000718a0] pci_hp_remove_devices+0x90/0x130
[  157.291426] [c00000003a1bbb20] [c000000000071854] pci_hp_remove_devices+0x44/0x130
[  157.291458] [c00000003a1bbbb0] [c00800001906204c] pnv_php_disable_slot+0x54/0xe0 [pnv_php]
[  157.291492] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.291532] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.291572] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.291611] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.291652] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.291692] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.291731] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.291772] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.291815] --- interrupt: 3000 at 0x7fffa77ead38
[  157.291839] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.291876] REGS: c00000003a1bbe80 TRAP: 3000   Not tainted  (6.6.8)
[  157.291902] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.291947] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.292190] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.292215] LR [0000000000000000] 0x0
[  157.292246] --- interrupt: 3000
[  157.292267] Code: 40820058 387f0048 48b93f31 60000000 39200000 f93e0220 38210030 e8010010 ebc1fff0 ebe1fff8 7c0803a6 4e800020 <0fe00000> 387f0030 48b93f01 60000000
[  157.292356] ---[ end trace 0000000000000000 ]---
[  157.292440] OF: ERROR: of_node_release() detected bad of_node_put() on /pciex@600c3c0000000/pci@0/pci@0/pci@7
[  157.292531] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.292633] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.292731] Call Trace:
[  157.292768] [c00000003a1bb750] [c000000000d68ddc] dump_stack_lvl+0x70/0xa0 (unreliable)
[  157.292880] [c00000003a1bb780] [c000000000a9b378] of_node_release+0x1d8/0x220
[  157.292986] [c00000003a1bb800] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.293091] [c00000003a1bb880] [c000000000a99c7c] of_node_put+0x2c/0x40
[  157.293178] [c00000003a1bb8a0] [c0000000008c668c] pci_release_of_node+0x2c/0x60
[  157.293267] [c00000003a1bb8d0] [c0000000008904c4] pci_release_dev+0x64/0x100
[  157.293367] [c00000003a1bb940] [c0000000009739ac] device_release+0x5c/0x100
[  157.293471] [c00000003a1bb9b0] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.293561] [c00000003a1bba30] [c000000000973cc8] put_device+0x28/0x40
[  157.293659] [c00000003a1bba50] [c000000000896190] pci_remove_bus_device+0x1a0/0x1d0
[  157.293771] [c00000003a1bba90] [c0000000000718a0] pci_hp_remove_devices+0x90/0x130
[  157.293877] [c00000003a1bbb20] [c000000000071854] pci_hp_remove_devices+0x44/0x130
[  157.293983] [c00000003a1bbbb0] [c00800001906204c] pnv_php_disable_slot+0x54/0xe0 [pnv_php]
[  157.294068] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.294161] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.294265] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.294334] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.294448] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.294546] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.294629] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.294731] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.294849] --- interrupt: 3000 at 0x7fffa77ead38
[  157.294907] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.294999] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.295118] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.295263] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.296113] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.296164] LR [0000000000000000] 0x0
[  157.296212] --- interrupt: 3000
[  157.296233] OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'
[  157.296398] pci_bus 0000:1d: busn_res: [bus 1d-21] is released
[  157.296636] OF: ERROR: of_node_release() detected bad of_node_put() on /pciex@600c3c0000000/pci@0/pci@0/pci@6
[  157.296820] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.296886] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.296980] Call Trace:
[  157.296998] [c00000003a1bb750] [c000000000d68ddc] dump_stack_lvl+0x70/0xa0 (unreliable)
[  157.297127] [c00000003a1bb780] [c000000000a9b378] of_node_release+0x1d8/0x220
[  157.297221] [c00000003a1bb800] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.297300] [c00000003a1bb880] [c000000000a99c7c] of_node_put+0x2c/0x40
[  157.297390] [c00000003a1bb8a0] [c0000000008c668c] pci_release_of_node+0x2c/0x60
[  157.297485] [c00000003a1bb8d0] [c0000000008904c4] pci_release_dev+0x64/0x100
[  157.297551] [c00000003a1bb940] [c0000000009739ac] device_release+0x5c/0x100
[  157.297636] [c00000003a1bb9b0] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.297723] [c00000003a1bba30] [c000000000973cc8] put_device+0x28/0x40
[  157.297809] [c00000003a1bba50] [c000000000896190] pci_remove_bus_device+0x1a0/0x1d0
[  157.297894] [c00000003a1bba90] [c0000000000718a0] pci_hp_remove_devices+0x90/0x130
[  157.297994] [c00000003a1bbb20] [c000000000071854] pci_hp_remove_devices+0x44/0x130
[  157.298080] [c00000003a1bbbb0] [c00800001906204c] pnv_php_disable_slot+0x54/0xe0 [pnv_php]
[  157.298176] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.298261] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.298350] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.298427] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.298532] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.298598] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.298703] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.298805] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.298905] --- interrupt: 3000 at 0x7fffa77ead38
[  157.298955] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.299041] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.299126] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.299245] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.300067] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.300114] LR [0000000000000000] 0x0
[  157.300171] --- interrupt: 3000
[  157.300218] OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'
[  157.300339] pci_bus 0000:18: busn_res: [bus 18-1c] is released
[  157.300520] OF: ERROR: of_node_release() detected bad of_node_put() on /pciex@600c3c0000000/pci@0/pci@0/pci@5
[  157.300676] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.300790] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.300851] Call Trace:
[  157.300889] [c00000003a1bb750] [c000000000d68ddc] dump_stack_lvl+0x70/0xa0 (unreliable)
[  157.300995] [c00000003a1bb780] [c000000000a9b378] of_node_release+0x1d8/0x220
[  157.301107] [c00000003a1bb800] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.301173] [c00000003a1bb880] [c000000000a99c7c] of_node_put+0x2c/0x40
[  157.301258] [c00000003a1bb8a0] [c0000000008c668c] pci_release_of_node+0x2c/0x60
[  157.301341] [c00000003a1bb8d0] [c0000000008904c4] pci_release_dev+0x64/0x100
[  157.301417] [c00000003a1bb940] [c0000000009739ac] device_release+0x5c/0x100
[  157.301490] [c00000003a1bb9b0] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.301567] [c00000003a1bba30] [c000000000973cc8] put_device+0x28/0x40
[  157.301645] [c00000003a1bba50] [c000000000896190] pci_remove_bus_device+0x1a0/0x1d0
[  157.301728] [c00000003a1bba90] [c0000000000718a0] pci_hp_remove_devices+0x90/0x130
[  157.301819] [c00000003a1bbb20] [c000000000071854] pci_hp_remove_devices+0x44/0x130
[  157.301898] [c00000003a1bbbb0] [c00800001906204c] pnv_php_disable_slot+0x54/0xe0 [pnv_php]
[  157.302010] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.302074] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.302274] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.302354] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.302433] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.302513] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.302591] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.302674] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.302801] --- interrupt: 3000 at 0x7fffa77ead38
[  157.302866] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.302955] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.303036] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.303138] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.303952] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.304018] LR [0000000000000000] 0x0
[  157.304052] --- interrupt: 3000
[  157.304080] OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'
[  157.304228] pci_bus 0000:13: busn_res: [bus 13-17] is released
[  157.304403] OF: ERROR: of_node_release() detected bad of_node_put() on /pciex@600c3c0000000/pci@0/pci@0/pci@4
[  157.304559] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.304650] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.304745] Call Trace:
[  157.304778] [c00000003a1bb750] [c000000000d68ddc] dump_stack_lvl+0x70/0xa0 (unreliable)
[  157.304865] [c00000003a1bb780] [c000000000a9b378] of_node_release+0x1d8/0x220
[  157.304940] [c00000003a1bb800] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.305075] [c00000003a1bb880] [c000000000a99c7c] of_node_put+0x2c/0x40
[  157.305146] [c00000003a1bb8a0] [c0000000008c668c] pci_release_of_node+0x2c/0x60
[  157.305282] [c00000003a1bb8d0] [c0000000008904c4] pci_release_dev+0x64/0x100
[  157.305365] [c00000003a1bb940] [c0000000009739ac] device_release+0x5c/0x100
[  157.305443] [c00000003a1bb9b0] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.305505] [c00000003a1bba30] [c000000000973cc8] put_device+0x28/0x40
[  157.305576] [c00000003a1bba50] [c000000000896190] pci_remove_bus_device+0x1a0/0x1d0
[  157.305697] [c00000003a1bba90] [c0000000000718a0] pci_hp_remove_devices+0x90/0x130
[  157.305791] [c00000003a1bbb20] [c000000000071854] pci_hp_remove_devices+0x44/0x130
[  157.305876] [c00000003a1bbbb0] [c00800001906204c] pnv_php_disable_slot+0x54/0xe0 [pnv_php]
[  157.305969] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.306061] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.306140] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.306223] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.306320] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.306390] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.306473] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.306552] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.306662] --- interrupt: 3000 at 0x7fffa77ead38
[  157.306699] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.306802] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.306885] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.306985] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.307733] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.307798] LR [0000000000000000] 0x0
[  157.307835] --- interrupt: 3000
[  157.307870] OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'
[  157.308027] pci_bus 0000:0e: busn_res: [bus 0e-12] is released
[  157.308209] OF: ERROR: of_node_release() detected bad of_node_put() on /pciex@600c3c0000000/pci@0/pci@0/pci@3
[  157.308335] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.308406] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.308516] Call Trace:
[  157.308549] [c00000003a1bb750] [c000000000d68ddc] dump_stack_lvl+0x70/0xa0 (unreliable)
[  157.308647] [c00000003a1bb780] [c000000000a9b378] of_node_release+0x1d8/0x220
[  157.308718] [c00000003a1bb800] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.308782] [c00000003a1bb880] [c000000000a99c7c] of_node_put+0x2c/0x40
[  157.308858] [c00000003a1bb8a0] [c0000000008c668c] pci_release_of_node+0x2c/0x60
[  157.308949] [c00000003a1bb8d0] [c0000000008904c4] pci_release_dev+0x64/0x100
[  157.309016] [c00000003a1bb940] [c0000000009739ac] device_release+0x5c/0x100
[  157.309099] [c00000003a1bb9b0] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.309182] [c00000003a1bba30] [c000000000973cc8] put_device+0x28/0x40
[  157.309265] [c00000003a1bba50] [c000000000896190] pci_remove_bus_device+0x1a0/0x1d0
[  157.309335] [c00000003a1bba90] [c0000000000718a0] pci_hp_remove_devices+0x90/0x130
[  157.309412] [c00000003a1bbb20] [c000000000071854] pci_hp_remove_devices+0x44/0x130
[  157.309496] [c00000003a1bbbb0] [c00800001906204c] pnv_php_disable_slot+0x54/0xe0 [pnv_php]
[  157.309598] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.309690] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.309760] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.309835] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.309928] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.310006] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.310080] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.310160] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.310262] --- interrupt: 3000 at 0x7fffa77ead38
[  157.310291] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.310375] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.310453] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.310561] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.311338] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.311384] LR [0000000000000000] 0x0
[  157.311429] --- interrupt: 3000
[  157.311498] OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'
[  157.311653] pci_bus 0000:09: busn_res: [bus 09-0d] is released
[  157.311822] OF: ERROR: of_node_release() detected bad of_node_put() on /pciex@600c3c0000000/pci@0/pci@0/pci@2
[  157.311946] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.312126] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.312233] Call Trace:
[  157.312249] [c00000003a1bb750] [c000000000d68ddc] dump_stack_lvl+0x70/0xa0 (unreliable)
[  157.312355] [c00000003a1bb780] [c000000000a9b378] of_node_release+0x1d8/0x220
[  157.312446] [c00000003a1bb800] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.312523] [c00000003a1bb880] [c000000000a99c7c] of_node_put+0x2c/0x40
[  157.312615] [c00000003a1bb8a0] [c0000000008c668c] pci_release_of_node+0x2c/0x60
[  157.312672] [c00000003a1bb8d0] [c0000000008904c4] pci_release_dev+0x64/0x100
[  157.312758] [c00000003a1bb940] [c0000000009739ac] device_release+0x5c/0x100
[  157.312832] [c00000003a1bb9b0] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.312911] [c00000003a1bba30] [c000000000973cc8] put_device+0x28/0x40
[  157.312984] [c00000003a1bba50] [c000000000896190] pci_remove_bus_device+0x1a0/0x1d0
[  157.313084] [c00000003a1bba90] [c0000000000718a0] pci_hp_remove_devices+0x90/0x130
[  157.313167] [c00000003a1bbb20] [c000000000071854] pci_hp_remove_devices+0x44/0x130
[  157.313248] [c00000003a1bbbb0] [c00800001906204c] pnv_php_disable_slot+0x54/0xe0 [pnv_php]
[  157.313349] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.313432] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.313522] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.313581] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.313672] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.313741] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.313823] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.313921] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.314015] --- interrupt: 3000 at 0x7fffa77ead38
[  157.314064] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.314146] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.314223] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.314330] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.315117] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.315163] LR [0000000000000000] 0x0
[  157.315199] --- interrupt: 3000
[  157.315252] OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'
[  157.315417] pci_bus 0000:08: busn_res: [bus 08] is released
[  157.315561] pci_bus 0000:03: busn_res: [bus 03-07] is released
[  157.315800] OF: ERROR: of_node_release() detected bad of_node_put() on /pciex@600c3c0000000/pci@0/pci@0/pci@0
[  157.315945] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.316035] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.316111] Call Trace:
[  157.316144] [c00000003a1bb750] [c000000000d68ddc] dump_stack_lvl+0x70/0xa0 (unreliable)
[  157.316239] [c00000003a1bb780] [c000000000a9b378] of_node_release+0x1d8/0x220
[  157.316331] [c00000003a1bb800] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.316438] [c00000003a1bb880] [c000000000a99c7c] of_node_put+0x2c/0x40
[  157.316516] [c00000003a1bb8a0] [c0000000008c668c] pci_release_of_node+0x2c/0x60
[  157.316595] [c00000003a1bb8d0] [c0000000008904c4] pci_release_dev+0x64/0x100
[  157.316676] [c00000003a1bb940] [c0000000009739ac] device_release+0x5c/0x100
[  157.316755] [c00000003a1bb9b0] [c000000000d7258c] kobject_put+0xbc/0x270
[  157.316831] [c00000003a1bba30] [c000000000973cc8] put_device+0x28/0x40
[  157.316912] [c00000003a1bba50] [c000000000896190] pci_remove_bus_device+0x1a0/0x1d0
[  157.317003] [c00000003a1bba90] [c0000000000718a0] pci_hp_remove_devices+0x90/0x130
[  157.317087] [c00000003a1bbb20] [c000000000071854] pci_hp_remove_devices+0x44/0x130
[  157.317202] [c00000003a1bbbb0] [c00800001906204c] pnv_php_disable_slot+0x54/0xe0 [pnv_php]
[  157.317340] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.317421] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.317502] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.317580] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.317652] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.317732] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.317803] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.317886] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.317957] --- interrupt: 3000 at 0x7fffa77ead38
[  157.318006] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.318090] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.318167] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.318276] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.319086] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.319157] LR [0000000000000000] 0x0
[  157.319185] --- interrupt: 3000
[  157.319208] OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'
[  157.319346] pci 0000:02     : [PE# 1fc] Releasing PE
[  157.319467] pci_bus 0000:02: busn_res: [bus 02-26] is released
[  157.319629] pci 0000:01     : [PE# 1fd] Releasing PE
[  157.319724] ------------[ cut here ]------------
[  157.319776] refcount_t: addition on 0; use-after-free.
[  157.319848] WARNING: CPU: 13 PID: 1170 at lib/refcount.c:25 refcount_warn_saturate+0x194/0x230
[  157.319949] Modules linked in: pnv_php switchtec i2c_dev ses enclosure scsi_transport_sas xts ecb sg ctr nvme cbc nvme_core ofpart drm_shmem_helper t10_pi vmx_crypto ipmi_powernv powernv_flash crc64_rocksoft_generic ipmi_devintf gf128mul drm_kms_helper crct10dif_vpmsum opal_prd ipmi_msghandler mtd at24 i2c_algo_bit regmap_i2c crc64_rocksoft crc64 evdev joydev aacraid binfmt_misc drm loop fuse dm_mod drm_panel_orientation_quirks ip_tables x_tables autofs4 nfsv3 nfs_acl nfs lockd grace sunrpc fscache netfs ib_mthca ib_ipoib ib_umad rdma_ucm rdma_cm iw_cm ib_cm configfs mlx4_ib ib_uverbs ib_core hid_generic usbhid hid xhci_pci xhci_hcd ixgbe mdio_devres of_mdio tg3 fixed_phy fwnode_mdio xfrm_algo mdio crc32c_vpmsum usbcore mlx4_core libphy usb_common [last unloaded: pnv_php]
[  157.320783] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.320895] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.320984] NIP:  c0000000007a8c64 LR: c0000000007a8c60 CTR: c0000000008e0930
[  157.321054] REGS: c00000003a1bb750 TRAP: 0700   Tainted: G        W           (6.6.8)
[  157.321142] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 24428282  XER: 00000000
[  157.321226] CFAR: c000000000147040 IRQMASK: 1
               GPR00: c0000000007a8c60 c00000003a1bb9f0 c0000000010fe800 000000000000002a
               GPR04: 00000000ffffbfff c00000003a1bb7c0 c00000003a1bb7b8 0000000000000027
               GPR08: c000001fff0c7f90 ffffffffffffffd8 0000000000000027 0000000000000001
               GPR12: 0000000000008000 c000001ffffd1c80 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 c000201fff792ed0
               GPR24: 0000000000000001 0000000100f706f0 c00000003a1bbd58 c00000001358d8e0
               GPR28: c00000001358d8c0 c0000000028e29b8 c000201fff793630 c000201fff7936b0
[  157.322017] NIP [c0000000007a8c64] refcount_warn_saturate+0x194/0x230
[  157.322187] LR [c0000000007a8c60] refcount_warn_saturate+0x190/0x230
[  157.322258] Call Trace:
[  157.322288] [c00000003a1bb9f0] [c0000000007a8c60] refcount_warn_saturate+0x190/0x230 (unreliable)
[  157.322405] [c00000003a1bba50] [c000000000d71d40] kobject_get+0xe0/0xf0
[  157.322474] [c00000003a1bbac0] [c000000000a99c30] of_node_get+0x30/0x50
[  157.322552] [c00000003a1bbaf0] [c000000000a88ed8] of_get_next_child+0x68/0xd0
[  157.322632] [c00000003a1bbb40] [c008000019061d98] pnv_php_unregister+0x30/0x290 [pnv_php]
[  157.322722] [c00000003a1bbbb0] [c00800001906207c] pnv_php_disable_slot+0x84/0xe0 [pnv_php]
[  157.322821] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.322908] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.322991] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.323066] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.323151] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.323202] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.323285] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.323381] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.323474] --- interrupt: 3000 at 0x7fffa77ead38
[  157.323538] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.323597] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.323694] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.323804] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.324566] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.324629] LR [0000000000000000] 0x0
[  157.324657] --- interrupt: 3000
[  157.324698] Code: 8929be79 2c090000 4082fef4 7c0802a6 3c62ffef 39200001 3d42015d 38639f18 992abe79 f8010070 4b99e2fd 60000000 <0fe00000> e8010070 7c0803a6 4bfffec0
[  157.324863] ---[ end trace 0000000000000000 ]---
[  157.325038] Kernel attempted to read user page (10) - exploit attempt? (uid: 0)
[  157.325170] BUG: Kernel NULL pointer dereference on read at 0x00000010
[  157.325262] Faulting instruction address: 0xc000000000da0f44
[  157.325353] Oops: Kernel access of bad area, sig: 11 [#1]
[  157.325399] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
[  157.325469] Modules linked in: pnv_php switchtec i2c_dev ses enclosure scsi_transport_sas xts ecb sg ctr nvme cbc nvme_core ofpart drm_shmem_helper t10_pi vmx_crypto ipmi_powernv powernv_flash crc64_rocksoft_generic ipmi_devintf gf128mul drm_kms_helper crct10dif_vpmsum opal_prd ipmi_msghandler mtd at24 i2c_algo_bit regmap_i2c crc64_rocksoft crc64 evdev joydev aacraid binfmt_misc drm loop fuse dm_mod drm_panel_orientation_quirks ip_tables x_tables autofs4 nfsv3 nfs_acl nfs lockd grace sunrpc fscache netfs ib_mthca ib_ipoib ib_umad rdma_ucm rdma_cm iw_cm ib_cm configfs mlx4_ib ib_uverbs ib_core hid_generic usbhid hid xhci_pci xhci_hcd ixgbe mdio_devres of_mdio tg3 fixed_phy fwnode_mdio xfrm_algo mdio crc32c_vpmsum usbcore mlx4_core libphy usb_common [last unloaded: pnv_php]
[  157.326314] CPU: 13 PID: 1170 Comm: bash Tainted: G        W          6.6.8 #1
[  157.326414] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[  157.326485] NIP:  c000000000da0f44 LR: c000000000da0f38 CTR: c0000000008b58e0
[  157.326573] REGS: c00000003a1bb7a0 TRAP: 0300   Tainted: G        W           (6.6.8)
[  157.326652] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24424222  XER: 00000000
[  157.326777] CFAR: c000000000d9d96c DAR: 0000000000000010 DSISR: 40000000 IRQMASK: 0
               GPR00: c000000000da0f38 c00000003a1bba40 c0000000010fe800 0000000000000000
               GPR04: 0000000000000040 0000000000000040 000000000000001b 0000000000000000
               GPR08: c000201ffcba1b00 0000000000000000 c00000000f168a00 c008000019063700
               GPR12: c0000000008b58e0 c000001ffffd1c80 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 c000201fff792ed0
               GPR24: 0000000000000001 0000000000000000 c000201fff793630 c00000001358d8e0
               GPR28: c00000001358d8c0 c0002000109cc000 c0002000109cc0c0 0000000000000010
[  157.327630] NIP [c000000000da0f44] mutex_lock+0x34/0x90
[  157.327698] LR [c000000000da0f38] mutex_lock+0x28/0x90
[  157.327766] Call Trace:
[  157.327799] [c00000003a1bba40] [c000000000da0f38] mutex_lock+0x28/0x90 (unreliable)
[  157.327880] [c00000003a1bba70] [c000000000202658] msi_lock_descs+0x28/0x40
[  157.327963] [c00000003a1bba90] [c0000000008b5948] pci_disable_msi+0x68/0xb0
[  157.328072] [c00000003a1bbac0] [c008000019060708] pnv_php_disable_irq+0x140/0x160 [pnv_php]
[  157.328150] [c00000003a1bbb10] [c008000019060a28] pnv_php_free_slot+0x50/0x90 [pnv_php]
[  157.328248] [c00000003a1bbb40] [c008000019061fb0] pnv_php_unregister+0x248/0x290 [pnv_php]
[  157.328342] [c00000003a1bbbb0] [c00800001906207c] pnv_php_disable_slot+0x84/0xe0 [pnv_php]
[  157.328443] [c00000003a1bbbf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[  157.328546] [c00000003a1bbc70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[  157.328643] [c00000003a1bbc90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[  157.328700] [c00000003a1bbcb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[  157.328789] [c00000003a1bbd00] [c000000000521070] vfs_write+0x350/0x4b0
[  157.328881] [c00000003a1bbdc0] [c0000000005214d4] ksys_write+0x84/0x140
[  157.328960] [c00000003a1bbe10] [c000000000030d38] system_call_exception+0x168/0x3a0
[  157.329052] [c00000003a1bbe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[  157.329139] --- interrupt: 3000 at 0x7fffa77ead38
[  157.329191] NIP:  00007fffa77ead38 LR: 0000000000000000 CTR: 0000000000000000
[  157.329259] REGS: c00000003a1bbe80 TRAP: 3000   Tainted: G        W           (6.6.8)
[  157.329327] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 48422408  XER: 00000000
[  157.329444] IRQMASK: 0
               GPR00: 0000000000000004 00007fffe59d6560 00007fffa7906f00 0000000000000001
               GPR04: 0000000102ce4c40 0000000000000002 0000000000000010 0000000102ce6c40
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00007fffa7a1b0c0 0000000000000000 0000000100f6a548
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000100e93e40
               GPR20: 0000000102cc5560 0000000100f21a58 00007fffe59d6784 00007fffe59d6780
               GPR24: 0000000000000001 0000000100f706f0 0000000102ce4c40 0000000000000002
               GPR28: 0000000000000002 00007fffa7901980 0000000102ce4c40 0000000000000002
[  157.330151] NIP [00007fffa77ead38] 0x7fffa77ead38
[  157.330208] LR [0000000000000000] 0x0
[  157.330245] --- interrupt: 3000
[  157.330275] Code: 3842d8f0 7c0802a6 60000000 7c0802a6 fbe1fff8 7c7f1b78 f8010010 f821ffd1 4bffc9f5 60000000 39200000 e94d0908 <7d00f8a8> 7c284800 40c20010 7d40f9ad
[  157.330467] ---[ end trace 0000000000000000 ]---

[  157.902980] note: bash[1170] exited with irqs disabled

----- Original Message -----
> From: "Timothy Pearson" <tpearson@raptorengineeringinc.com>
> To: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Wednesday, December 27, 2023 11:48:35 PM
> Subject: Re: PowerNV PCIe hotplug support?

> Hrmm, potentially related, I'm getting a kernel oops when I try to hot unplug
> the entire PCIe switch from the PHB4:
> 
> [ 3771.106478] Kernel attempted to read user page (10) - exploit attempt? (uid:
> 0)
> [ 3771.106514] BUG: Kernel NULL pointer dereference on read at 0x00000010
> [ 3771.106531] Faulting instruction address: 0xc000000000da0f44
> [ 3771.106558] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 3771.106573] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
> [ 3771.106610] Modules linked in: pnv_php i2c_dev binfmt_misc xts ecb ctr nvme
> nvme_core t10_pi cbc crc64_rocksoft_generic ofpart drm_shmem_helper
> drm_kms_helper crc64_rocksoft vmx_crypto joydev evdev crc64 i2c_algo_bit
> gf128mul at24 ipmi_powernv powernv_flash crct10dif_vpmsum ipmi_devintf opal_prd
> regmap_i2c mtd ipmi_msghandler drm loop fuse drm_panel_orientation_quirks
> dm_mod ip_tables x_tables autofs4 nfsv3 nfs_acl nfs lockd grace sunrpc fscache
> netfs ib_mthca ib_ipoib ib_umad rdma_ucm rdma_cm iw_cm ib_cm configfs mlx4_ib
> ib_uverbs ib_core hid_generic usbhid hid xhci_pci xhci_hcd ixgbe mdio_devres
> of_mdio crc32c_vpmsum tg3 fixed_phy fwnode_mdio xfrm_algo mdio mlx4_core
> usbcore libphy usb_common
> [ 3771.106879] CPU: 4 PID: 1173 Comm: bash Tainted: G        W          6.6.8 #1
> [ 3771.106908] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1203
> opal:skiboot-9858186 PowerNV
> [ 3771.106955] NIP:  c000000000da0f44 LR: c000000000da0f38 CTR: c0000000008b58e0
> [ 3771.106983] REGS: c0000000125a37a0 TRAP: 0300   Tainted: G        W
> (6.6.8)
> [ 3771.107011] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24424222
> XER: 00000006
> [ 3771.107054] CFAR: c000000000d9d96c DAR: 0000000000000010 DSISR: 40000000
> IRQMASK: 0
> [ 3771.107054] GPR00: c000000000da0f38 c0000000125a3a40 c0000000010fe800
> 0000000000000000
> [ 3771.107054] GPR04: 0000000000000040 0000000000000040 0000000000000009
> 0000000000000000
> [ 3771.107054] GPR08: c000201ffcba1b00 0000000000000000 c00000000ebbcf00
> c008000015ca3700
> [ 3771.107054] GPR12: c0000000008b58e0 c000001ffffdba00 0000000000000000
> 0000000114bfa548
> [ 3771.107054] GPR16: 0000000000000000 0000000000000000 0000000000000000
> 0000000114b23e40
> [ 3771.107054] GPR20: 000000012468c760 0000000114bb1a58 00007fffca6d7214
> c000201fff7933c0
> [ 3771.107054] GPR24: 0000000000000001 0000000000000000 c000201fff793b20
> c000000011004460
> [ 3771.107054] GPR28: c000000011004440 c000000013b3b000 c000000013b3b0c0
> 0000000000000010
> [ 3771.107349] NIP [c000000000da0f44] mutex_lock+0x34/0x90
> [ 3771.107379] LR [c000000000da0f38] mutex_lock+0x28/0x90
> [ 3771.107407] Call Trace:
> [ 3771.107425] [c0000000125a3a40] [c000000000da0f38] mutex_lock+0x28/0x90
> (unreliable)
> [ 3771.107459] [c0000000125a3a70] [c000000000202658] msi_lock_descs+0x28/0x40
> [ 3771.107490] [c0000000125a3a90] [c0000000008b5948] pci_disable_msi+0x68/0xb0
> [ 3771.107520] [c0000000125a3ac0] [c008000015ca0708]
> pnv_php_disable_irq+0x140/0x160 [pnv_php]
> [ 3771.107556] [c0000000125a3b10] [c008000015ca0a28] pnv_php_free_slot+0x50/0x90
> [pnv_php]
> [ 3771.107588] [c0000000125a3b40] [c008000015ca1fb0]
> pnv_php_unregister+0x248/0x290 [pnv_php]
> [ 3771.107629] [c0000000125a3bb0] [c008000015ca207c]
> pnv_php_disable_slot+0x84/0xe0 [pnv_php]
> [ 3771.107671] [c0000000125a3bf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
> [ 3771.107701] [c0000000125a3c70] [c0000000008c4b60]
> pci_slot_attr_store+0x40/0x60
> [ 3771.107733] [c0000000125a3c90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
> [ 3771.107763] [c0000000125a3cb0] [c000000000613a18]
> kernfs_fop_write_iter+0x1b8/0x2a0
> [ 3771.107794] [c0000000125a3d00] [c000000000521070] vfs_write+0x350/0x4b0
> [ 3771.107831] [c0000000125a3dc0] [c0000000005214d4] ksys_write+0x84/0x140
> [ 3771.107861] [c0000000125a3e10] [c000000000030d38]
> system_call_exception+0x168/0x3a0
> [ 3771.107902] [c0000000125a3e50] [c00000000000c270]
> system_call_vectored_common+0xf0/0x280
> [ 3771.107959] --- interrupt: 3000 at 0x7fffb834ad38
> [ 3771.107993] NIP:  00007fffb834ad38 LR: 0000000000000000 CTR: 0000000000000000
> [ 3771.108030] REGS: c0000000125a3e80 TRAP: 3000   Tainted: G        W
> (6.6.8)
> [ 3771.108048] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>
> CR: 48422488  XER: 00000000
> [ 3771.108107] IRQMASK: 0
> [ 3771.108107] GPR00: 0000000000000004 00007fffca6d6ff0 00007fffb8466f00
> 0000000000000001
> [ 3771.108107] GPR04: 0000000124681100 0000000000000002 0000000000000010
> 0000000000000030
> [ 3771.108107] GPR08: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> [ 3771.108107] GPR12: 0000000000000000 00007fffb857b0c0 0000000000000000
> 0000000114bfa548
> [ 3771.108107] GPR16: 0000000000000000 0000000000000000 0000000000000000
> 0000000114b23e40
> [ 3771.108107] GPR20: 000000012468c760 0000000114bb1a58 00007fffca6d7214
> 00007fffca6d7210
> [ 3771.108107] GPR24: 0000000000000001 0000000114c006f0 0000000124681100
> 0000000000000002
> [ 3771.108107] GPR28: 0000000000000002 00007fffb8461980 0000000124681100
> 0000000000000002
> [ 3771.108380] NIP [00007fffb834ad38] 0x7fffb834ad38
> [ 3771.108404] LR [0000000000000000] 0x0
> [ 3771.108425] --- interrupt: 3000
> [ 3771.108437] Code: 3842d8f0 7c0802a6 60000000 7c0802a6 fbe1fff8 7c7f1b78
> f8010010 f821ffd1 4bffc9f5 60000000 39200000 e94d0908 <7d00f8a8> 7c284800
> 40c20010 7d40f9ad
> [ 3771.108510] ---[ end trace 0000000000000000 ]---
> 
> ----- Original Message -----
>> From: "Timothy Pearson" <tpearson@raptorengineeringinc.com>
>> To: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
>> Sent: Wednesday, December 27, 2023 10:15:24 PM
>> Subject: PowerNV PCIe hotplug support?
> 
>> I've been evaluating some new options for our POWER9-based hardware in the NVMe
>> space, and would like some clarification on the current status of PCIe hotplug
>> for the PowerNV platforms.
>> 
>> From what I understand, the pnv_php driver provides the basic hotplug
>> functionality on PowerNV.  What I'm not clear on is to what extent this is
>> intended to flow downstream to attached PCIe switches.
>> 
>> I have a test setup here that consists of a PMC 8533 switch and several
>> downstream NVMe drives, with the switch attached directly to the PHB4 root
>> port.  After loading the pnv_php module, I can disconnect the downstream NVMe
>> devices by either using echo 0 on /sys/bus/pcu/slots/Snnnnnnn/power, or by
>> doing a physical surprise unplug, however nothing I try can induce a newly
>> plugged device to train and be detected on the bus.  Even trying a echo 0 and
>> subsequent echo 1 to /sys/bus/pcu/slots/Snnnnnnn/power only results in the
>> device going offline, there seems to be no way to bring the device back online
>> short of a reboot.
>> 
>> Hotplug of other devices connected directly to the PHB4 appears to work properly
>> (I can online and offline via the power node); the issue seems to be restricted
>> to downstream devices connected to the (theoretically hotplug capable) PMC 8533
>> switch.
>> 
>> Is this the intended behavior for downstream (non-IBM) PCIe ports?  Raptor can
>> provide resources to assist in a fix if needed, but I would like to understand
>> if this is a bug or an unimplemented feature first, and if the latter what the
>> main issues are likely to be in implementation.
>> 
> > Thank you!


