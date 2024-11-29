Return-Path: <linuxppc-dev+bounces-3605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A29DBF0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 05:31:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y00cY6Yv7z2y8d;
	Fri, 29 Nov 2024 15:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732854685;
	cv=none; b=ZPReptfnOU3ifJumsCUnriKcss2K+cAim3VDTIJqJs267ZADg35Y/BWgeMrkEPOIe0AJQxl3ghhQiZr61Tm1VX9StCaw7Ldh5S8rtk0iWSHXM5v3mkK3VG9Cxr4Ap81I/+m4gxbeUvJ4Va5pHmKV4YEDGSqixD30xXZvi+ua9iXcoTvsi3m6o5UaZEv7+afXnE7D6OakiQrdemzWsWTX7+O05It0HeO2rvIHBJIYnuLxIXtVLN6nkmVtjB/nQdbZIJLkuV5Dv+5/PuGqDY4HTPTL86M7LY0TAmA2ZlbaS0LdPEs6KkIIgP/WmCkxi52x2VT9G5NLCXL7kIUlTFfMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732854685; c=relaxed/relaxed;
	bh=UiTCs9a6bPWqF5tTiyYU4MQJTIvdFyz65sv8/TMAMhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXcfi8vIdy+KVTgcCAxaaL1lMlq6tbVgQO7274DDLu/Hx49LMM/HGLbgomTNTttAqBwx/ufhihNmYBE/4ltopCNIZsgzmUCptC0gqbzwmAKvtm5rSx81VOAZzggvbknFfNetjUcoYmNX8XhvDy8bD3ESOn9LrNaC7tTGyBe22eswbaP6O2Oy/g73nUK1CHUDo8GmV4omN/yKgi3X3UDBFt/ShET/VJoY3b85tqn3XQE14Y9Oj98ktdmJnc8Pjpt/Zlmgcajjx3ztJ16eD+g3uP2NjyyAk+EMJFrAYjLThna66CFZWPBiOkL0htl97DFYKAf1um/OVKe8k3Z9jW2X+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D3IQFNLP; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D3IQFNLP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y00cW2tpkz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2024 15:31:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732854683; x=1764390683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhVJ2KsFTU6vdZyrFjJy+CpqJVuOIfZcG0UnLygKl20=;
  b=D3IQFNLPzvRv7zc1SU7/niLDRH0YOViHe2HQDdufiuAiQPPx91+NjEIB
   kdHMPwaxHKTIF44NQJwEm4okxqgBMgRChgHBQwgYframYtkblLJ3Ivc8Q
   HwV4kEdIsHN9zVIx0hGPXQpv4d2XR8X1JbQNctp628vHl9qgWHZO7V7vs
   uIGriocg5noXwJU57iECCJY5xp5ZJD3CyrVWm3Ht8RKhBTmdSxE5KrGwR
   nT6izlWh4GwHCpGjf4YcH4xJ+xVmXZM4uvBB962iVKbzbHSD4WcpfWMBa
   7S8Hvb0IIA390kyZ/3lXAB1LifDfIdG3se2t6dfojFxsbjOF6tkbvKbO6
   Q==;
X-CSE-ConnectionGUID: mbvGJo0HR1aKf+ulnS7tug==
X-CSE-MsgGUID: 0wxvhCovSHOscfy1Blp5GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="58495758"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="58495758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:31:15 -0800
X-CSE-ConnectionGUID: 7+ctehuyTaqXPs1MF1yt2g==
X-CSE-MsgGUID: 8udd5Dm+TGClDUig78Zgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92193838"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2024 20:31:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGsep-000AL9-0P;
	Fri, 29 Nov 2024 04:31:07 +0000
Date: Fri, 29 Nov 2024 12:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, tglx@linutronix.de, ebiederm@xmission.com,
	akpm@linux-foundation.org, bhe@redhat.com, hbathini@linux.ibm.com,
	sourabhjain@linux.ibm.com, adityag@linux.ibm.com,
	songshuaishuai@tinylab.org, takakura@valinux.co.jp,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jonnyc@amazon.com
Subject: Re: [PATCH v3 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Message-ID: <202411291225.18ZMjZcQ-lkp@intel.com>
References: <20241128201027.10396-2-farbere@amazon.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128201027.10396-2-farbere@amazon.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Eliav,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes tip/irq/core arm64/for-next/core linus/master v6.12 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eliav-Farber/kexec-Consolidate-machine_kexec_mask_interrupts-implementation/20241129-041259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241128201027.10396-2-farbere%40amazon.com
patch subject: [PATCH v3 1/2] kexec: Consolidate machine_kexec_mask_interrupts() implementation
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241129/202411291225.18ZMjZcQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291225.18ZMjZcQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291225.18ZMjZcQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kexec_core.c:9:
   In file included from include/linux/btf.h:8:
   In file included from include/linux/bpfptr.h:6:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kexec_core.c:1085:10: error: call to undeclared function 'irq_desc_get_chip'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1085 |                 chip = irq_desc_get_chip(desc);
         |                        ^
>> kernel/kexec_core.c:1085:8: error: incompatible integer to pointer conversion assigning to 'struct irq_chip *' from 'int' [-Wint-conversion]
    1085 |                 chip = irq_desc_get_chip(desc);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kexec_core.c:1097:24: error: incomplete definition of type 'struct irq_chip'
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                  ~~~~^
   kernel/kexec_core.c:1082:10: note: forward declaration of 'struct irq_chip'
    1082 |                 struct irq_chip *chip;
         |                        ^
>> kernel/kexec_core.c:1097:37: error: call to undeclared function 'irqd_irq_inprogress'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                                   ^
>> kernel/kexec_core.c:1097:62: error: incomplete definition of type 'struct irq_desc'
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                                                        ~~~~^
   include/linux/irqnr.h:10:15: note: forward declaration of 'struct irq_desc'
      10 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |               ^
   kernel/kexec_core.c:1098:8: error: incomplete definition of type 'struct irq_chip'
    1098 |                         chip->irq_eoi(&desc->irq_data);
         |                         ~~~~^
   kernel/kexec_core.c:1082:10: note: forward declaration of 'struct irq_chip'
    1082 |                 struct irq_chip *chip;
         |                        ^
   kernel/kexec_core.c:1098:23: error: incomplete definition of type 'struct irq_desc'
    1098 |                         chip->irq_eoi(&desc->irq_data);
         |                                        ~~~~^
   include/linux/irqnr.h:10:15: note: forward declaration of 'struct irq_desc'
      10 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |               ^
   kernel/kexec_core.c:1100:11: error: incomplete definition of type 'struct irq_chip'
    1100 |                 if (chip->irq_mask)
         |                     ~~~~^
   kernel/kexec_core.c:1082:10: note: forward declaration of 'struct irq_chip'
    1082 |                 struct irq_chip *chip;
         |                        ^
   kernel/kexec_core.c:1101:8: error: incomplete definition of type 'struct irq_chip'
    1101 |                         chip->irq_mask(&desc->irq_data);
         |                         ~~~~^
   kernel/kexec_core.c:1082:10: note: forward declaration of 'struct irq_chip'
    1082 |                 struct irq_chip *chip;
         |                        ^
   kernel/kexec_core.c:1101:24: error: incomplete definition of type 'struct irq_desc'
    1101 |                         chip->irq_mask(&desc->irq_data);
         |                                         ~~~~^
   include/linux/irqnr.h:10:15: note: forward declaration of 'struct irq_desc'
      10 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |               ^
   kernel/kexec_core.c:1103:11: error: incomplete definition of type 'struct irq_chip'
    1103 |                 if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
         |                     ~~~~^
   kernel/kexec_core.c:1082:10: note: forward declaration of 'struct irq_chip'
    1082 |                 struct irq_chip *chip;
         |                        ^
   kernel/kexec_core.c:1103:29: error: call to undeclared function 'irqd_irq_disabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1103 |                 if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
         |                                           ^
   kernel/kexec_core.c:1103:29: note: did you mean 'arch_irqs_disabled'?
   arch/x86/include/asm/irqflags.h:145:28: note: 'arch_irqs_disabled' declared here
     145 | static __always_inline int arch_irqs_disabled(void)
         |                            ^
   kernel/kexec_core.c:1103:52: error: incomplete definition of type 'struct irq_desc'
    1103 |                 if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
         |                                                              ~~~~^
   include/linux/irqnr.h:10:15: note: forward declaration of 'struct irq_desc'
      10 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |               ^
   kernel/kexec_core.c:1104:8: error: incomplete definition of type 'struct irq_chip'
    1104 |                         chip->irq_disable(&desc->irq_data);
         |                         ~~~~^
   kernel/kexec_core.c:1082:10: note: forward declaration of 'struct irq_chip'
    1082 |                 struct irq_chip *chip;
         |                        ^
   kernel/kexec_core.c:1104:27: error: incomplete definition of type 'struct irq_desc'
    1104 |                         chip->irq_disable(&desc->irq_data);
         |                                            ~~~~^
   include/linux/irqnr.h:10:15: note: forward declaration of 'struct irq_desc'
      10 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |               ^
   4 warnings and 15 errors generated.


vim +/irq_desc_get_chip +1085 kernel/kexec_core.c

  1075	
  1076	void machine_kexec_mask_interrupts(void)
  1077	{
  1078		unsigned int i;
  1079		struct irq_desc *desc;
  1080	
  1081		for_each_irq_desc(i, desc) {
  1082			struct irq_chip *chip;
  1083			int check_eoi = 1;
  1084	
> 1085			chip = irq_desc_get_chip(desc);
  1086			if (!chip)
  1087				continue;
  1088	
  1089			if (IS_ENABLED(CONFIG_ARM64)) {
  1090				/*
  1091				 * First try to remove the active state. If this fails, try to EOI the
  1092				 * interrupt.
  1093				 */
  1094				check_eoi = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
  1095			}
  1096	
> 1097			if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

