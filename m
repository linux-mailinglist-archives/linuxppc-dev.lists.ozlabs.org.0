Return-Path: <linuxppc-dev+bounces-5893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E722A2A379
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 09:47:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpW2Q4x9Tz2yMD;
	Thu,  6 Feb 2025 19:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=37.157.195.192
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738831662;
	cv=none; b=LAXFyimC/p34empYd922sDzOZBzt6adczmqncjzahUkUoUB/V8Nphq4OPelGKc3A3PS3C1h+5tCpp3SvAhHV+cDMIsaCvxu8nIW7Z0sE6L/AcnjfoRfkw444otOPecW7uIs/Zxblk+7gg2f3r9fvCn/sZjSW3iJWPKW24Va6ofKA34QrAlAnTQYIm0amLYwmDiv0c0+H9lJatgJlQ1yTl8vMnfbtrxkBHSnX8+bN0ckAd4/tmdp5j6r4pye5QtAcxs1I3xW2OlX3Lz39zQnO/fnb7XCJ2RFka5AKy1dGy5kWtAjNnw44DPeMmLt18jXevzUUlBiLtTVwfXetcA6JNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738831662; c=relaxed/relaxed;
	bh=hR49c1/zEDqkj+EPGvXmXfavTt3Oe9eh0wYjGlF3y60=;
	h=Date:From:To:Subject:Message-Id:Mime-Version:Content-Type; b=DhhOefhgPlPMRyAwK1ocUYsj7E6oceJqXMNRCtUqiocBVKiMZe6zHRv6jmH4vWUMuubIZgX+gA9oum+ZeHNLS5FNkp36PqseJz1wM16eIRmdN8ZHX6KClp0BN5fDaODgflAFVx8jm3Sc6PFBFpnEC77nqBSpZVg8iE2noGjjt6QO99s+y+IF+QXBvmnxpJIaJfgBkoxUAyN9ESMgA881JTkGTUnSxHrxEu0AUkVg2857+mXzVx0HOXf5bHvCAHODuQetuSvG0rs6NYWOQRJpFZfz/Qc3bS2NJnz/5K/0XKakfzEVB6/J33SeRzK4GYfKMCw1pUYaTr5P/tuwH434bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz; spf=pass (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org) smtp.mailfrom=danny.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 347 seconds by postgrey-1.37 at boromir; Thu, 06 Feb 2025 19:47:41 AEDT
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpW2P1Cy4z2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 19:47:41 +1100 (AEDT)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 985A79E5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 09:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 redcrew.org 985A79E5
Received: from talos.danny.cz (talos [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id F109215E001
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 09:41:48 +0100 (CET)
Date: Thu, 6 Feb 2025 09:41:48 +0100
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: linuxppc-dev@lists.ozlabs.org
Subject: panic in cpufreq_online() in 6.14-rc1 on PowerNV
Message-Id: <20250206094148.787dbdaa0580d7ed6c510709@danny.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

I am getting a kernel panic on my Raptor Talos Power9 system after
updating to the 6.14-rc1 kernel from 6.13. Seems reproducable every
time, but I haven't start bisecting yet. Does it sound familiar to
anyone?

...
[    4.226443] powernv-cpufreq: cpufreq pstate min 0x63 nominal 0x30 max 0x0
[    4.226464] powernv-cpufreq: Workload Optimized Frequency is enabled in the platform
[    4.226662] BUG: Unable to handle kernel instruction fetch (NULL pointer?)
[    4.226687] Faulting instruction address: 0x00000000
[    4.226700] Oops: Kernel access of bad area, sig: 7 [#1]
[    4.226734] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
[    4.226770] Modules linked in:
[    4.226795] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-0.rc1.15.fc42.ppc64le #1
[    4.226854] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
[    4.226912] NIP:  0000000000000000 LR: c0000000012a57f4 CTR: 0000000000000000
[    4.226970] REGS: c00000000cdcf610 TRAP: 0400   Not tainted  (6.14.0-0.rc1.15.fc42.ppc64le)
[    4.227007] MSR:  9000000002089033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84008848  XER: 00000000
[    4.227063] CFAR: c0000000012a57f0 IRQMASK: 0
[    4.227063] GPR00: c0000000012a57a0 c00000000cdcf8b0 c000000002474900 c000000023447000
[    4.227063] GPR04: 0000000000000001 0000000000000000 0000000000000080 0000000000000000
[    4.227063] GPR08: 0000000000000000 c000000003cf56c8 0000000000000001 0000000000008000
[    4.227063] GPR12: 0000000000000000 c000000003f70000 c000000003cb39a8 c000000001d80988
[    4.227063] GPR16: 0000000000000001 c000000001c6a4d8 c000000001c4f828 c0000000012adf70
[    4.227063] GPR20: c000000003c30ed8 0000000000000001 0000000000000000 c0000000234474b8
[    4.227063] GPR24: c000000023447448 c000000003c30000 c000000003f492a0 0000000000000000
[    4.227063] GPR28: 0000000000000000 c000000003d56d60 c0000000039d4bc0 c000000023447000
[    4.227407] NIP [0000000000000000] 0x0
[    4.227440] LR [c0000000012a57f4] cpufreq_online+0x474/0x1250
[    4.227478] Call Trace:
[    4.227506] [c00000000cdcf8b0] [c0000000012a57a0] cpufreq_online+0x420/0x1250 (unreliable)
[    4.227559] [c00000000cdcf980] [c0000000012a6710] cpufreq_add_dev+0x110/0x170
[    4.227597] [c00000000cdcfa00] [c00000000101f858] subsys_interface_register+0x188/0x1d0
[    4.227647] [c00000000cdcfa70] [c0000000012a0cfc] cpufreq_register_driver+0x23c/0x470
[    4.227690] [c00000000cdcfb00] [c00000000308e894] powernv_cpufreq_init+0x910/0xa10
[    4.227728] [c00000000cdcfc40] [c000000000010c3c] do_one_initcall+0x7c/0x3ac
[    4.227766] [c00000000cdcfd20] [c00000000300e574] kernel_init_freeable+0x3d0/0x480
[    4.227798] [c00000000cdcfdf0] [c000000000011320] kernel_init+0x2c/0x1bc
[    4.227815] [c00000000cdcfe50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
[    4.227834] --- interrupt: 0 at 0x0
[    4.227845] Code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
[    4.227919] ---[ end trace 0000000000000000 ]---
[    4.430870] ata5: SATA link down (SStatus 0 SControl 300)
[    4.430912] ata3: SATA link down (SStatus 0 SControl 300)
[    4.430944] ata7: SATA link down (SStatus 0 SControl 300)
[    4.440855] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    4.440900] ata6: SATA link down (SStatus 0 SControl 300)
[    4.440943] ata8: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    4.440985] ata4: SATA link down (SStatus 0 SControl 300)
[    4.552442] ata8.00: ATAPI: MARVELL VIRTUALL, 1.09, max UDMA/66
[    4.552596] ata8.00: configured for UDMA/66
[    4.553499] ata2.00: ATAPI: DRW-24D5MT, 1.00, max UDMA/133
[    4.554908] ata2.00: configured for UDMA/133
[    4.569631] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    4.569884] ata1.00: Model 'Samsung SSD 860 EVO 500GB', rev 'RVT02B6Q', applying quirks: noncqtrim zeroaftertrim noncqonati
[    4.569986] ata1.00: supports DRM functions and may not be fully accessible
[    4.570020] ata1.00: ATA-11: Samsung SSD 860 EVO 500GB, RVT02B6Q, max UDMA/133
[    4.570798] ata1.00: 976773168 sectors, multi 1: LBA48 NCQ (depth 32), AA
[    4.576809] ata1.00: Features: Trust Dev-Sleep NCQ-sndrcv
[    4.577253] ata1.00: supports DRM functions and may not be fully accessible
[    4.584748] ata1.00: configured for UDMA/133
[    4.585278] scsi 0:0:0:0: Direct-Access     ATA      Samsung SSD 860  2B6Q PQ: 0 ANSI: 5
[    4.586021] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    4.586556] ata1.00: Enabling discard_zeroes_data
[    4.586602] sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    4.586650] sd 0:0:0:0: [sda] Write Protect is off
[    4.586698] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    4.586742] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    4.586854] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    4.587066] scsi 1:0:0:0: CD-ROM            ASUS     DRW-24D5MT       1.00 PQ: 0 ANSI: 5
[    4.588265] ata1.00: Enabling discard_zeroes_data
[    6.037014] pstore: backend (nvram) writing error (-1)
[    6.037032]
[    7.037040] note: swapper/0[1] exited with irqs disabled
[    7.037097] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007


	Thanks,

		Dan

