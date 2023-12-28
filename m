Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97881F4C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 06:49:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Wb4uvo6R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0yJ804Zmz3cHP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 16:49:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Wb4uvo6R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0yHF52r7z305T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 16:48:41 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 548BE8285435
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 23:48:39 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Xqr40-5KU7RB for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 27 Dec 2023 23:48:38 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 025BD828552E
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 23:48:38 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 025BD828552E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1703742518; bh=Ml3ErhkOrJIIWR0oB6roUVv2INME9+SMM0rt2emw3m8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Wb4uvo6R0oIZ01QEmk55/NM4GFY9vMSY9X74pQKDegBIxx7voAe6jYZ1KSrdhCoAA
	 0im46b7RmtCsdauM6MUzSFAjOoOcltKBAbt7l5Z8yLO9CN9Jgb7Ro7zOmUir7nnuJ7
	 OEbxo4rW0H0Fk4HsbE9Ey1F476NipALpZ7T404O8=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id h8abAO5IKnTr for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 27 Dec 2023 23:48:37 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C642F8285435
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 23:48:37 -0600 (CST)
Date: Wed, 27 Dec 2023 23:48:35 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <1981605666.2142272.1703742465927.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <674182417.2124034.1703736924982.JavaMail.zimbra@raptorengineeringinc.com>
References: <674182417.2124034.1703736924982.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: PowerNV PCIe hotplug support?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC112 (Linux)/8.5.0_GA_3042)
Thread-Topic: PowerNV PCIe hotplug support?
Thread-Index: hMP2kkUFF0gjw2HUkQhVOS3bUJ+WaUMs0ZDl
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

Hrmm, potentially related, I'm getting a kernel oops when I try to hot unplug the entire PCIe switch from the PHB4:

[ 3771.106478] Kernel attempted to read user page (10) - exploit attempt? (uid: 0)
[ 3771.106514] BUG: Kernel NULL pointer dereference on read at 0x00000010
[ 3771.106531] Faulting instruction address: 0xc000000000da0f44
[ 3771.106558] Oops: Kernel access of bad area, sig: 11 [#1]
[ 3771.106573] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
[ 3771.106610] Modules linked in: pnv_php i2c_dev binfmt_misc xts ecb ctr nvme nvme_core t10_pi cbc crc64_rocksoft_generic ofpart drm_shmem_helper drm_kms_helper crc64_rocksoft vmx_crypto joydev evdev crc64 i2c_algo_bit gf128mul at24 ipmi_powernv powernv_flash crct10dif_vpmsum ipmi_devintf opal_prd regmap_i2c mtd ipmi_msghandler drm loop fuse drm_panel_orientation_quirks dm_mod ip_tables x_tables autofs4 nfsv3 nfs_acl nfs lockd grace sunrpc fscache netfs ib_mthca ib_ipoib ib_umad rdma_ucm rdma_cm iw_cm ib_cm configfs mlx4_ib ib_uverbs ib_core hid_generic usbhid hid xhci_pci xhci_hcd ixgbe mdio_devres of_mdio crc32c_vpmsum tg3 fixed_phy fwnode_mdio xfrm_algo mdio mlx4_core usbcore libphy usb_common
[ 3771.106879] CPU: 4 PID: 1173 Comm: bash Tainted: G        W          6.6.8 #1
[ 3771.106908] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1203 opal:skiboot-9858186 PowerNV
[ 3771.106955] NIP:  c000000000da0f44 LR: c000000000da0f38 CTR: c0000000008b58e0
[ 3771.106983] REGS: c0000000125a37a0 TRAP: 0300   Tainted: G        W           (6.6.8)
[ 3771.107011] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24424222  XER: 00000006
[ 3771.107054] CFAR: c000000000d9d96c DAR: 0000000000000010 DSISR: 40000000 IRQMASK: 0
[ 3771.107054] GPR00: c000000000da0f38 c0000000125a3a40 c0000000010fe800 0000000000000000
[ 3771.107054] GPR04: 0000000000000040 0000000000000040 0000000000000009 0000000000000000
[ 3771.107054] GPR08: c000201ffcba1b00 0000000000000000 c00000000ebbcf00 c008000015ca3700
[ 3771.107054] GPR12: c0000000008b58e0 c000001ffffdba00 0000000000000000 0000000114bfa548
[ 3771.107054] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000114b23e40
[ 3771.107054] GPR20: 000000012468c760 0000000114bb1a58 00007fffca6d7214 c000201fff7933c0
[ 3771.107054] GPR24: 0000000000000001 0000000000000000 c000201fff793b20 c000000011004460
[ 3771.107054] GPR28: c000000011004440 c000000013b3b000 c000000013b3b0c0 0000000000000010
[ 3771.107349] NIP [c000000000da0f44] mutex_lock+0x34/0x90
[ 3771.107379] LR [c000000000da0f38] mutex_lock+0x28/0x90
[ 3771.107407] Call Trace:
[ 3771.107425] [c0000000125a3a40] [c000000000da0f38] mutex_lock+0x28/0x90 (unreliable)
[ 3771.107459] [c0000000125a3a70] [c000000000202658] msi_lock_descs+0x28/0x40
[ 3771.107490] [c0000000125a3a90] [c0000000008b5948] pci_disable_msi+0x68/0xb0
[ 3771.107520] [c0000000125a3ac0] [c008000015ca0708] pnv_php_disable_irq+0x140/0x160 [pnv_php]
[ 3771.107556] [c0000000125a3b10] [c008000015ca0a28] pnv_php_free_slot+0x50/0x90 [pnv_php]
[ 3771.107588] [c0000000125a3b40] [c008000015ca1fb0] pnv_php_unregister+0x248/0x290 [pnv_php]
[ 3771.107629] [c0000000125a3bb0] [c008000015ca207c] pnv_php_disable_slot+0x84/0xe0 [pnv_php]
[ 3771.107671] [c0000000125a3bf0] [c0000000008cf8d0] power_write_file+0xa0/0x180
[ 3771.107701] [c0000000125a3c70] [c0000000008c4b60] pci_slot_attr_store+0x40/0x60
[ 3771.107733] [c0000000125a3c90] [c000000000614ef4] sysfs_kf_write+0x64/0x80
[ 3771.107763] [c0000000125a3cb0] [c000000000613a18] kernfs_fop_write_iter+0x1b8/0x2a0
[ 3771.107794] [c0000000125a3d00] [c000000000521070] vfs_write+0x350/0x4b0
[ 3771.107831] [c0000000125a3dc0] [c0000000005214d4] ksys_write+0x84/0x140
[ 3771.107861] [c0000000125a3e10] [c000000000030d38] system_call_exception+0x168/0x3a0
[ 3771.107902] [c0000000125a3e50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[ 3771.107959] --- interrupt: 3000 at 0x7fffb834ad38
[ 3771.107993] NIP:  00007fffb834ad38 LR: 0000000000000000 CTR: 0000000000000000
[ 3771.108030] REGS: c0000000125a3e80 TRAP: 3000   Tainted: G        W           (6.6.8)
[ 3771.108048] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48422488  XER: 00000000
[ 3771.108107] IRQMASK: 0
[ 3771.108107] GPR00: 0000000000000004 00007fffca6d6ff0 00007fffb8466f00 0000000000000001
[ 3771.108107] GPR04: 0000000124681100 0000000000000002 0000000000000010 0000000000000030
[ 3771.108107] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[ 3771.108107] GPR12: 0000000000000000 00007fffb857b0c0 0000000000000000 0000000114bfa548
[ 3771.108107] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000114b23e40
[ 3771.108107] GPR20: 000000012468c760 0000000114bb1a58 00007fffca6d7214 00007fffca6d7210
[ 3771.108107] GPR24: 0000000000000001 0000000114c006f0 0000000124681100 0000000000000002
[ 3771.108107] GPR28: 0000000000000002 00007fffb8461980 0000000124681100 0000000000000002
[ 3771.108380] NIP [00007fffb834ad38] 0x7fffb834ad38
[ 3771.108404] LR [0000000000000000] 0x0
[ 3771.108425] --- interrupt: 3000
[ 3771.108437] Code: 3842d8f0 7c0802a6 60000000 7c0802a6 fbe1fff8 7c7f1b78 f8010010 f821ffd1 4bffc9f5 60000000 39200000 e94d0908 <7d00f8a8> 7c284800 40c20010 7d40f9ad
[ 3771.108510] ---[ end trace 0000000000000000 ]---

----- Original Message -----
> From: "Timothy Pearson" <tpearson@raptorengineeringinc.com>
> To: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Wednesday, December 27, 2023 10:15:24 PM
> Subject: PowerNV PCIe hotplug support?

> I've been evaluating some new options for our POWER9-based hardware in the NVMe
> space, and would like some clarification on the current status of PCIe hotplug
> for the PowerNV platforms.
> 
> From what I understand, the pnv_php driver provides the basic hotplug
> functionality on PowerNV.  What I'm not clear on is to what extent this is
> intended to flow downstream to attached PCIe switches.
> 
> I have a test setup here that consists of a PMC 8533 switch and several
> downstream NVMe drives, with the switch attached directly to the PHB4 root
> port.  After loading the pnv_php module, I can disconnect the downstream NVMe
> devices by either using echo 0 on /sys/bus/pcu/slots/Snnnnnnn/power, or by
> doing a physical surprise unplug, however nothing I try can induce a newly
> plugged device to train and be detected on the bus.  Even trying a echo 0 and
> subsequent echo 1 to /sys/bus/pcu/slots/Snnnnnnn/power only results in the
> device going offline, there seems to be no way to bring the device back online
> short of a reboot.
> 
> Hotplug of other devices connected directly to the PHB4 appears to work properly
> (I can online and offline via the power node); the issue seems to be restricted
> to downstream devices connected to the (theoretically hotplug capable) PMC 8533
> switch.
> 
> Is this the intended behavior for downstream (non-IBM) PCIe ports?  Raptor can
> provide resources to assist in a fix if needed, but I would like to understand
> if this is a bug or an unimplemented feature first, and if the latter what the
> main issues are likely to be in implementation.
> 
> Thank you!
