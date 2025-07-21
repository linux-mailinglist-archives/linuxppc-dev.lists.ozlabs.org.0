Return-Path: <linuxppc-dev+bounces-10338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7CB0C567
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jul 2025 15:41:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bm1lj6888z2xlL;
	Mon, 21 Jul 2025 23:41:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753105313;
	cv=none; b=PkSHyHTf3TjLrEyO4IZJsF9LEL8fEYvsJkpDyS/fo8XXA0k0t5BXRU+xjGxT/cVrEbKmwJiFFfV1T2rlpZ7DOu33HKM9D9xnoG75EIccYERZJV2oRwatgjMdQzNzVMVk12Fwx3S1Z7kQ7AkGWZ1/NgBUbbCD4hT0HGX+T+8lS+DSUiS11SaSJfuELXw/KmVew6ROfNWDT6C4h2zRPlaIeh/xWFgO2dgYv/72lmkrHFvtwNLl2s5tbkS56AnIu48CC+D0tjab06vc5pdQRKIKvSUGchwODdWkDwM+o31yIYRkWqMBhUzeh9m6jmVwkopKI4bNxrS9ozlaDEB3PDwn4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753105313; c=relaxed/relaxed;
	bh=IiyLrM1z9vuwbdocPHzW5qWy+xLTnUAT/XEfeekjj0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYnI1P6MEUyYBoNnyrioR4UkNEpaji4cVJFOVN8FuKDDrtPm31U/6HgW0dEdUSij5vpMS7uf+GVJi4V+c+AgzM1iG1Iw6p3ZO2kZkjlToYZUQTM8u2jBMIelqNgfUhKrpZn8/9dNbARERQb+SYOc/0UGRMW1fJn1MBkWqVXt4l+4o7GaTXWScP6TZ4+0nCMNfvzrxlvEHUGWikiXEARcndDiNL2RZ0qjLnclQS1+HYLsC/bHm1/ur8/KDJhyXT8cfO5OYujvYsBiNPn1dLuV+POzs3aCoyL9pJblJHA6ZeAqBJFFB4vwt1/jBzPHfKYzTU+FYFC5Yy3HiIvfm5Qvcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QS1IwPSD; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QS1IwPSD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bm1lg394hz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 23:41:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753105311; x=1784641311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yNHo/yBmAD+zaXsjJA5Y11qSY/zQKwh/4qvEIaoDKMs=;
  b=QS1IwPSDpDut9PJVG/3ks0EwEN2HCrOlUbU7s0w6eitBjySlj0dda8Kv
   fmNPI7X9R4XQBidBPGBwb7dzHMLDhlgzOWOo6lsgCkEFBG+I7OPFyqs0l
   TWLALbK6vdrW4rVIQ2uiNXkp7MeKJjLcnxjknkHgTem8/ntidMbHp5IpZ
   OruDFlk2xIYPbYHIwZcy4LeHDHFuhGm0FnW3zCgq8Ofll8Ry8a5h/n31u
   EbmOh4UbKePVuL0HsfhLupam9+nb2pUiM4QEj38MWFgMfLPAkrXfn7DtP
   FUQu2rmG974LyB+meXDQDW64Mv2HoPPCkJ7qJ8tB2/roMLxwnbRe8N7Ta
   Q==;
X-CSE-ConnectionGUID: BEkRYAt/T0S7iQudsrUwLw==
X-CSE-MsgGUID: 7FfNzOlyS/GXB1/vHaHMDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59134459"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="59134459"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 06:41:38 -0700
X-CSE-ConnectionGUID: VQO7lgNvQBiokLZmq996hQ==
X-CSE-MsgGUID: D5/JKbwNRY2y6JlMYOjNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="158946600"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jul 2025 06:41:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udqll-000GqT-0B;
	Mon, 21 Jul 2025 13:41:29 +0000
Date: Mon, 21 Jul 2025 21:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	acpica-devel@lists.linux.dev, osandov@osandov.com,
	xueshuai@linux.alibaba.com, konrad.wilk@oracle.com,
	linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, kernel-team@meta.com,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v2] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <202507212132.OA9HtsQY-lkp@intel.com>
References: <20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Breno,

kernel test robot noticed the following build errors:

[auto build test ERROR on 97987520025658f30bb787a99ffbd9bbff9ffc9d]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/vmcoreinfo-Track-and-log-recoverable-hardware-errors/20250721-181439
base:   97987520025658f30bb787a99ffbd9bbff9ffc9d
patch link:    https://lore.kernel.org/r/20250721-vmcore_hw_error-v2-1-ab65a6b43c5a%40debian.org
patch subject: [PATCH v2] vmcoreinfo: Track and log recoverable hardware errors
config: x86_64-buildonly-randconfig-004-20250721 (https://download.01.org/0day-ci/archive/20250721/202507212132.OA9HtsQY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507212132.OA9HtsQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507212132.OA9HtsQY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kexec.h:18,
                    from init/initramfs.c:603:
>> include/linux/vmcore_info.h:91:6: warning: no previous prototype for 'hwerror_tracking_log' [-Wmissing-prototypes]
      91 | void hwerror_tracking_log(enum hwerror_tracking_source src) {};
         |      ^~~~~~~~~~~~~~~~~~~~
--
   ld: arch/x86/kernel/traps.o: in function `hwerror_tracking_log':
>> traps.c:(.text+0x68e): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/traps.o: in function `__pfx_hwerror_tracking_log':
>> traps.c:(.text+0x67e): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/dumpstack_64.o: in function `hwerror_tracking_log':
   dumpstack_64.c:(.text+0x10): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/dumpstack_64.o: in function `__pfx_hwerror_tracking_log':
   dumpstack_64.c:(.text+0x0): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/dumpstack.o: in function `__pfx_hwerror_tracking_log':
   dumpstack.c:(.text+0xc9): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/dumpstack.o: in function `hwerror_tracking_log':
   dumpstack.c:(.text+0xd9): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/setup.o: in function `hwerror_tracking_log':
   setup.c:(.text+0x54): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/setup.o: in function `__pfx_hwerror_tracking_log':
   setup.c:(.text+0x44): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/e820.o: in function `__pfx_hwerror_tracking_log':
   e820.c:(.text+0x19f): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/e820.o: in function `hwerror_tracking_log':
   e820.c:(.text+0x1af): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/cpu/mce/core.o: in function `hwerror_tracking_log':
   core.c:(.text+0x14f0): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/cpu/mce/core.o: in function `__pfx_hwerror_tracking_log':
   core.c:(.text+0x14e0): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/acpi/madt_wakeup.o: in function `hwerror_tracking_log':
   madt_wakeup.c:(.text+0x180): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/acpi/madt_wakeup.o: in function `__pfx_hwerror_tracking_log':
   madt_wakeup.c:(.text+0x170): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/reboot.o: in function `hwerror_tracking_log':
   reboot.c:(.text+0x13d): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/reboot.o: in function `__pfx_hwerror_tracking_log':
   reboot.c:(.text+0x12d): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/smp.o: in function `hwerror_tracking_log':
   smp.c:(.text+0x28e): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/smp.o: in function `__pfx_hwerror_tracking_log':
   smp.c:(.text+0x27e): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/smpboot.o: in function `hwerror_tracking_log':
   smpboot.c:(.text+0x8fe): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/smpboot.o: in function `__pfx_hwerror_tracking_log':
   smpboot.c:(.text+0x8ee): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/setup_percpu.o: in function `hwerror_tracking_log':
   setup_percpu.c:(.text+0x10): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/setup_percpu.o: in function `__pfx_hwerror_tracking_log':
   setup_percpu.c:(.text+0x0): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/machine_kexec_64.o: in function `hwerror_tracking_log':
   machine_kexec_64.c:(.text+0x772): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/machine_kexec_64.o: in function `__pfx_hwerror_tracking_log':
   machine_kexec_64.c:(.text+0x762): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/kexec-bzimage64.o: in function `hwerror_tracking_log':
   kexec-bzimage64.c:(.text+0xb9c): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/kexec-bzimage64.o: in function `__pfx_hwerror_tracking_log':
   kexec-bzimage64.c:(.text+0xb8c): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: arch/x86/kernel/early_printk.o: in function `hwerror_tracking_log':
   early_printk.c:(.text+0x31e): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: arch/x86/kernel/early_printk.o: in function `__pfx_hwerror_tracking_log':
   early_printk.c:(.text+0x30e): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: kernel/panic.o: in function `hwerror_tracking_log':
   panic.c:(.text+0x466): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: kernel/panic.o: in function `__pfx_hwerror_tracking_log':
   panic.c:(.text+0x456): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: kernel/ksysfs.o: in function `hwerror_tracking_log':
   ksysfs.c:(.text+0x1f6): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: kernel/ksysfs.o: in function `__pfx_hwerror_tracking_log':
   ksysfs.c:(.text+0x1e6): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: kernel/reboot.o: in function `hwerror_tracking_log':
   reboot.c:(.text+0xd31): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: kernel/reboot.o: in function `__pfx_hwerror_tracking_log':
   reboot.c:(.text+0xd21): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: kernel/printk/printk.o: in function `hwerror_tracking_log':
   printk.c:(.text+0x2119): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: kernel/printk/printk.o: in function `__pfx_hwerror_tracking_log':
   printk.c:(.text+0x2109): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: kernel/kexec_core.o: in function `hwerror_tracking_log':
   kexec_core.c:(.text+0x346): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: kernel/kexec_core.o: in function `__pfx_hwerror_tracking_log':
   kexec_core.c:(.text+0x336): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: kernel/kexec_file.o: in function `hwerror_tracking_log':
   kexec_file.c:(.text+0x42a): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: kernel/kexec_file.o: in function `__pfx_hwerror_tracking_log':
   kexec_file.c:(.text+0x41a): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: kernel/kexec_handover.o: in function `hwerror_tracking_log':
   kexec_handover.c:(.text+0xf63): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: kernel/kexec_handover.o: in function `__pfx_hwerror_tracking_log':
   kexec_handover.c:(.text+0xf53): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: mm/mm_init.o: in function `hwerror_tracking_log':
   mm_init.c:(.text+0x26d): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: mm/mm_init.o: in function `__pfx_hwerror_tracking_log':
   mm_init.c:(.text+0x25d): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: block/blk-mq.o: in function `hwerror_tracking_log':
   blk-mq.c:(.text+0x48d3): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: block/blk-mq.o: in function `__pfx_hwerror_tracking_log':
   blk-mq.c:(.text+0x48c3): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: drivers/iommu/dma-iommu.o: in function `hwerror_tracking_log':
   dma-iommu.c:(.text+0x196e): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: drivers/iommu/dma-iommu.o: in function `__pfx_hwerror_tracking_log':
   dma-iommu.c:(.text+0x195e): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: drivers/md/dm-ioctl.o: in function `hwerror_tracking_log':
   dm-ioctl.c:(.text+0x2f65): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: drivers/md/dm-ioctl.o: in function `__pfx_hwerror_tracking_log':
   dm-ioctl.c:(.text+0x2f55): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here
   ld: drivers/firmware/efi/efi.o: in function `hwerror_tracking_log':
   efi.c:(.text+0x5f2): multiple definition of `hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x80): first defined here
   ld: drivers/firmware/efi/efi.o: in function `__pfx_hwerror_tracking_log':
   efi.c:(.text+0x5e2): multiple definition of `__pfx_hwerror_tracking_log'; init/initramfs.o:initramfs.c:(.text+0x70): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

