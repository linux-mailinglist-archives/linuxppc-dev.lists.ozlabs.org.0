Return-Path: <linuxppc-dev+bounces-50-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DA9501D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 11:59:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ufal.mff.cuni.cz header.i=@ufal.mff.cuni.cz header.a=rsa-sha256 header.s=9D3691E2-3533-11E9-988E-D2516E4D0B60 header.b=d+K6a6YN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjn0P4pGbz2xtQ;
	Tue, 13 Aug 2024 19:59:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ufal.mff.cuni.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ufal.mff.cuni.cz header.i=@ufal.mff.cuni.cz header.a=rsa-sha256 header.s=9D3691E2-3533-11E9-988E-D2516E4D0B60 header.b=d+K6a6YN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:195.113.16.19) smtp.mailfrom=ufal.mff.cuni.cz (client-ip=195.113.20.158; helo=ufal-mail.mff.cuni.cz; envelope-from=vidra@ufal.mff.cuni.cz; receiver=lists.ozlabs.org)
Received: from ufal-mail.mff.cuni.cz (ufal-mail.mff.cuni.cz [195.113.20.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjn0P06j0z2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 19:59:00 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by ufal-mail.mff.cuni.cz (Postfix) with ESMTP id 18BAD563C0E;
	Tue, 13 Aug 2024 11:58:58 +0200 (CEST)
Received: from ufal-mail.mff.cuni.cz ([127.0.0.1])
 by localhost (ufal-mail.mff.cuni.cz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 03FZfOlUR3Ko; Tue, 13 Aug 2024 11:58:58 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by ufal-mail.mff.cuni.cz (Postfix) with ESMTP id E32B0563EB4;
	Tue, 13 Aug 2024 11:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 ufal-mail.mff.cuni.cz E32B0563EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ufal.mff.cuni.cz;
	s=9D3691E2-3533-11E9-988E-D2516E4D0B60; t=1723543137;
	bh=vT0oUDQHdhovG+WtVwDCgVJHUUzxZ+QAH/Sf/89wekM=;
	h=From:To:Date:MIME-Version:Message-ID;
	b=d+K6a6YNClVH3GerSzYBtGfRnNoAmjtX19HiW8y7W0fpDYiviVWIxR/xe4X2WRBee
	 9GWVyPkJxf6Q5Skso40iwDEKaHbVPJHxa3LomjTOmZS/2BCG9jc4YjWexsxXR8nK15
	 JPlfQY/7yNXMp2Khpm9VwKjeRBr1p442H5Viyd5pSqBCrcy3d+RuS0qB043fcVjf0P
	 7+mFyWoa7k1GpQiCyLHxaYmFFsx1TWpwnpsOTzOyiSDfTCudhKwgeohxckKJexA0f6
	 UMfkT7HpiqtWbCnOtZNCSsUxn+JjBAkHHvtJ3TAClcjuWLI59BEjhMSMV8MvR0UTFp
	 83xV+H++H/7IA==
X-Virus-Scanned: amavis at ufal.mff.cuni.cz
Received: from ufal-mail.mff.cuni.cz ([127.0.0.1])
 by localhost (ufal-mail.mff.cuni.cz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id rutZHbVO3QvN; Tue, 13 Aug 2024 11:58:57 +0200 (CEST)
Received: from localhost (snat-16.cgn.sat-an.net [176.222.226.16])
	by ufal-mail.mff.cuni.cz (Postfix) with ESMTPSA id BD356563E14;
	Tue, 13 Aug 2024 11:58:57 +0200 (CEST)
From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra@ufal.mff.cuni.cz>
To: Niklas Cassel <cassel@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 =?iso-8859-1?Q?Kolbj=F8rn_Barmen?= <linux-ppc@kolla.no>,
 <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>,
 <linux-ide@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 <linux@roeck-us.net>
Subject: Re: Since 6.10 - kernel oops/panics on G4 macmini due to change in =?iso-8859-1?Q?drivers/ata/pata=5Fmacio.c?=
Date: Tue, 13 Aug 2024 11:58:52 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Message-ID: <e6007e53-e1e7-4669-8a8a-ce0efd7733f6@ufal.mff.cuni.cz>
In-Reply-To: <Zrstcei9WN9sRfdX@x1-carbon.wireless.wdc>
References: <62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no>
 <3b6441b8-06e6-45da-9e55-f92f2c86933e@ufal.mff.cuni.cz>
 <Zrstcei9WN9sRfdX@x1-carbon.wireless.wdc>
User-Agent: Trojita/v0.7-596-g21dfb8c3; Qt/5.15.14; xcb; Linux; Gentoo Linux
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On =C3=BAter=C3=BD 13. srpna 2024 11:54:57 CEST, Niklas Cassel wrote:
> Hello Jon=C3=A1=C5=A1, Kolbj=C3=B8rn,
>
> thank you for the report.
>
> On Tue, Aug 13, 2024 at 07:49:34AM +0200, Jon=C3=A1=C5=A1 Vidra wrote:
>
>> On Tue 13. Aug 2024 0:32:37 CEST, Kolbj=C3=B8rn Barmen wrote: ...
>
> Michael, as the author of the this commit, could you please look into
> this issue?
>
> We could revert your patch, which appears to work for some users,
> but that would again break setups with PAGE_SIZE =3D=3D 64K.
> (I assume that Jon=C3=A1=C5=A1 and Kolbj=C3=B8rn are not building with PAGE=
_SIZE =3D=3D 64K.)

This is from a PPC32 machine, so it doesn't even have that option.
It only supports 4K pages.


>> ------------[ cut here ]------------
>> kernel BUG at drivers/ata/pata_macio.c:544!
>
>
> https://github.com/torvalds/linux/blob/v6.11-rc3/drivers/ata/pata_macio.c#L=
544
>
> It seems that the
> while (sg_len) loop does not play nice with the new .max_segment_size.
>
>
>
>> Oops: Exception in kernel mode, sig: 5 [#1]
>> BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 DEBUG_PAGEALLOC PowerMac
>> Modules linked in: ipv6 binfmt_misc b43 mac80211 radeon libarc4 cfg80211
>> snd_aoa_codec_tas snd_aoa_fabric_layout snd_aoa rfkill=20
>> snd_aoa_i2sbus hwmon
>> drm_suballoc_helper snd_aoa_soundbus i2c_algo_bit snd_pcm backlight
>> drm_ttm_helper ttm xhci_pci pmac_zilog therm_windtunnel xhci_hcd
>> drm_display_helper firewire_ohci snd_timer snd firewire_core=20
>> serial_base ssb
>> soundcore crc_itu_t
>> CPU: 1 PID: 1870 Comm: kworker/u10:4 Tainted: G                T
>> 6.10.3-gentoo #1
>> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>> Workqueue: btrfs-worker btrfs_work_helper
>> NIP:  c0719670 LR: c0719678 CTR: 00000001
>> REGS: f2db9bf0 TRAP: 0700   Tainted: G                T   (6.10.3-gentoo)
>> MSR:  00021032 <ME,IR,DR,RI>  CR: 44008408  XER: 20000000
>>=20
>> GPR00: c06fc28c f2db9cb0 c10d8020 c12d28cc 00000000 00000000 00000000
>> c109cff4 GPR08: 69fd0000 00000100 00010000 00000000 00000000 00000000
>> c007801c c40c1980 GPR16: 00000000 00000000 00000000 00000000 00000000
>> 00000100 00000122 c11377c8 GPR24: 000000ff 00000008 0000ff00 00000000
>> c14200a8 00000101 00000000 c109d000 NIP [c0719670]
>> pata_macio_qc_prep+0xf4/0x190
>> LR [c0719678] pata_macio_qc_prep+0xfc/0x190
>> Call Trace:
>> [f2db9cb0] [c1421660] 0xc1421660 (unreliable)
>> [f2db9ce0] [c06fc28c] ata_qc_issue+0x14c/0x2d4
>> [f2db9d00] [c0707c5c] __ata_scsi_queuecmd+0x200/0x53c
>> [f2db9d20] [c0707fe8] ata_scsi_queuecmd+0x50/0xe0
>> [f2db9d40] [c06e2644] scsi_queue_rq+0x788/0xb1c
>> [f2db9d80] [c0492464] __blk_mq_issue_directly+0x58/0xf4
>> [f2db9db0] [c0497828] blk_mq_plug_issue_direct+0x8c/0x1b4
>> [f2db9de0] [c0498074] blk_mq_flush_plug_list.part.0+0x584/0x5e0
>> [f2db9e30] [c0485a40] __blk_flush_plug+0xf8/0x194
>> [f2db9e70] [c0485f88] __submit_bio+0x1b8/0x2e0
>> [f2db9ec0] [c04862e0] submit_bio_noacct_nocheck+0x230/0x304
>> [f2db9f00] [c03aaf30] btrfs_work_helper+0x200/0x338
>> [f2db9f40] [c006cae0] process_one_work+0x1a8/0x338
>> [f2db9f70] [c006d79c] worker_thread+0x364/0x4c0
>> [f2db9fc0] [c007811c] kthread+0x100/0x104
>> [f2db9ff0] [c001b304] start_kernel_thread+0x10/0x14
>> Code: 38ff0004 b37f0002 7d20ff2c 3bff0010 7d003d2c 7d084a14 93dffff8
>> b3dffffe b3dffffc 41820010 3bbd0001 4200ffc0 <0fe00000> 4bdcbb01 813c0044
>> 3b180001 ---[ end trace 0000000000000000 ]---
>>=20
>> note: kworker/u10:4[1870] exited with irqs disabled
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 1870 at kernel/exit.c:825 do_exit+0x854/0x9ec
>> Modules linked in: ipv6 binfmt_misc b43 mac80211 radeon libarc4 cfg80211
>> snd_aoa_codec_tas snd_aoa_fabric_layout snd_aoa rfkill=20
>> snd_aoa_i2sbus hwmon
>> drm_suballoc_helper snd_aoa_soundbus i2c_algo_bit snd_pcm backlight
>> drm_ttm_helper ttm xhci_pci pmac_zilog therm_windtunnel xhci_hcd
>> drm_display_helper firewire_ohci snd_timer snd firewire_core=20
>> serial_base ssb
>> soundcore crc_itu_t
>> CPU: 1 PID: 1870 Comm: kworker/u10:4 Tainted: G      D         T
>> 6.10.3-gentoo #1
>> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>> Workqueue: btrfs-worker btrfs_work_helper
>> NIP:  c004f09c LR: c004e8a4 CTR: 00000000
>> REGS: f2db9a80 TRAP: 0700   Tainted: G      D         T   (6.10.3-gentoo)
>> MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 88db92e2  XER: 00000000
>>=20
>> GPR00: c004f2c4 f2db9b40 c10d8020 00000000 00002710 00000000 00000000
>> 00000000 GPR08: 00000000 f2db9e88 00000004 00000000 28db92e2 00000000
>> c007801c c40c1980 GPR16: 00000000 00000000 00000000 00000000 00000000
>> 00000100 00000122 c11377c8 GPR24: 000000ff c0db0000 00001032 c0a21000
>> c138d520 00000005 c10d8020 c1447220 NIP [c004f09c] do_exit+0x854/0x9ec
>> LR [c004e8a4] do_exit+0x5c/0x9ec
>> Call Trace:
>> [f2db9b40] [c00b0c38] _printk+0x78/0xc4 (unreliable)
>> [f2db9b90] [c004f2c4] make_task_dead+0x90/0x174
>> [f2db9bb0] [c0010b9c] die+0x324/0x32c
>> [f2db9be0] [c0004828] ProgramCheck_virt+0x108/0x158
>> --- interrupt: 700 at pata_macio_qc_prep+0xf4/0x190
>> NIP:  c0719670 LR: c0719678 CTR: 00000001
>> REGS: f2db9bf0 TRAP: 0700   Tainted: G      D         T   (6.10.3-gentoo)
>> MSR:  00021032 <ME,IR,DR,RI>  CR: 44008408  XER: 20000000
>>=20
>> GPR00: c06fc28c f2db9cb0 c10d8020 c12d28cc 00000000 00000000 00000000
>> c109cff4 GPR08: 69fd0000 00000100 00010000 00000000 00000000 00000000
>> c007801c c40c1980 GPR16: 00000000 00000000 00000000 00000000 00000000
>> 00000100 00000122 c11377c8 GPR24: 000000ff 00000008 0000ff00 00000000
>> c14200a8 00000101 00000000 c109d000 NIP [c0719670]
>> pata_macio_qc_prep+0xf4/0x190
>> LR [c0719678] pata_macio_qc_prep+0xfc/0x190
>> --- interrupt: 700
>> [f2db9cb0] [c1421660] 0xc1421660 (unreliable)
>> [f2db9ce0] [c06fc28c] ata_qc_issue+0x14c/0x2d4
>> [f2db9d00] [c0707c5c] __ata_scsi_queuecmd+0x200/0x53c
>> [f2db9d20] [c0707fe8] ata_scsi_queuecmd+0x50/0xe0
>> [f2db9d40] [c06e2644] scsi_queue_rq+0x788/0xb1c
>> [f2db9d80] [c0492464] __blk_mq_issue_directly+0x58/0xf4
>> [f2db9db0] [c0497828] blk_mq_plug_issue_direct+0x8c/0x1b4
>> [f2db9de0] [c0498074] blk_mq_flush_plug_list.part.0+0x584/0x5e0
>> [f2db9e30] [c0485a40] __blk_flush_plug+0xf8/0x194
>> [f2db9e70] [c0485f88] __submit_bio+0x1b8/0x2e0
>> [f2db9ec0] [c04862e0] submit_bio_noacct_nocheck+0x230/0x304
>> [f2db9f00] [c03aaf30] btrfs_work_helper+0x200/0x338
>> [f2db9f40] [c006cae0] process_one_work+0x1a8/0x338
>> [f2db9f70] [c006d79c] worker_thread+0x364/0x4c0
>> [f2db9fc0] [c007811c] kthread+0x100/0x104
>> [f2db9ff0] [c001b304] start_kernel_thread+0x10/0x14
>> Code: 915e02fc 81410014 912a0004 915e03c0 939e03c4 91210014 813e04cc
>> 4bfffcec 807e0370 38800000 4bffe195 4bfffc9c <0fe00000> 4bfff848 0fe00000
>> 4bfff7ec ---[ end trace 0000000000000000 ]---
>>=20
>
>
>


