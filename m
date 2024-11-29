Return-Path: <linuxppc-dev+bounces-3604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F89DBEBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 03:47:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzyJK5cJ1z2yN8;
	Fri, 29 Nov 2024 13:47:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732848433;
	cv=none; b=jI/UqKz6JAoGm9u4kuuLIQmwgEE2sZW5BqaA9WO8ZCR3gACMCbdZ43iYUuCGA0Xf01N7dq3SF9BofAQsPZAd4WFdEh/MHbQMFWu2sbjigp/TcRXb4sP59xHuCt2wUM8qqqY1hz5zlGozO8TRIltdK02oOhzvMGuLtdE/vXqfgQKpJd/THxEV/k39zN4IzhViHamkGEX2vOS8d0MYUimPaeGQxYQIvDwotkhSP+E7qh1KSZp6Bjm/s+aqajeH/0H3UQoyr1tXVQG9eZuC1VxVlOXtHXLuKaltCZCsn9Q2ZFX6cEmJwmM4lq0Cw7bkHrA7G04gPcKk76ayXaUWRZJn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732848433; c=relaxed/relaxed;
	bh=Hk9zMoDcE5wyq5i77c/JybahqCDfXnjy6iN9kcroPaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9hHW81MXP5N+/9oC4gg6Oy8BmB/1uBedT48lm8pYQQvDZcAddWX0vKVZS0WtXyfcYK+g+Xs7HM+Na4nEn7gml0kjOWd2P1E8z+lAS3z9UymuNaeVO4/OmcYhgywbA6bqx22bPtL49YNQe/3c96BkksNmURtw0aBk2FkNtc2eeN8qW/PNxdXJRNL14XX/+gTWohYap18kcagrzSLu1O3fhMkrqa6tH6u/sopxgvp7yQ/AXJe2E0vYgXDM6FFF7v7CkFxrvrjnjT1AXJ1DCdxPVdrqFI7tgCJ8YYdjroEYsAZiEfQknCq/3j6iY0E0xQFkbSgE8UKl9e8bNwQWRijQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OQ1aUYWj; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OQ1aUYWj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzyJH03x5z2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2024 13:47:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732848431; x=1764384431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iyi+W+JKz0EAQaKtqkrUOsmAFLfBMZSMkSfcKblxaS8=;
  b=OQ1aUYWj+472fL6NueLYTi29J9vxHh3whTCrFDOgtBPJRFuxtBz2aLw8
   kv2eF5VFqXjTlrG6KPtv2G+fHxwQ/VUwplQmxobMMP4ghPlO6mth2hq2B
   RZp0vsQc2cS5wvtnB/rA1Gz6G3+XCbZtFOH7LHcjG5oBRD34YSRPRrFS5
   O/Z4w6fWTZjtmBU8WXv7kqoYfNM+ZNZICtH15714RKJSDDZuPG5VY0ArV
   j2MIV4kUKM4nsfVsTnfevFHba9wZjOjYjYmrr5AYqKHGEmwiAs65aw78B
   qoGW1fUbWLnW2XPV8lkuODLLDHXotLTg7PaO/2DsnREZ3E0ER1b/szgJC
   g==;
X-CSE-ConnectionGUID: 4U3n9P2yTKuuY9ry/znN+w==
X-CSE-MsgGUID: fdgbtK7qTMiSfdR8EzcaaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33137824"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33137824"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 18:47:04 -0800
X-CSE-ConnectionGUID: OcwmjXnURpODgunOkehPOg==
X-CSE-MsgGUID: eL24zCVPSSGLJuhXw/TONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92554387"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Nov 2024 18:46:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGr1y-000AGR-2s;
	Fri, 29 Nov 2024 02:46:54 +0000
Date: Fri, 29 Nov 2024 10:46:18 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, jonnyc@amazon.com
Subject: Re: [PATCH v3 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Message-ID: <202411291047.R9P698b2-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241129/202411291047.R9P698b2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291047.R9P698b2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291047.R9P698b2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/kexec_core.c: In function 'machine_kexec_mask_interrupts':
>> kernel/kexec_core.c:1085:24: error: implicit declaration of function 'irq_desc_get_chip' [-Werror=implicit-function-declaration]
    1085 |                 chip = irq_desc_get_chip(desc);
         |                        ^~~~~~~~~~~~~~~~~
>> kernel/kexec_core.c:1085:22: warning: assignment to 'struct irq_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1085 |                 chip = irq_desc_get_chip(desc);
         |                      ^
>> kernel/kexec_core.c:1097:38: error: invalid use of undefined type 'struct irq_chip'
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                      ^~
>> kernel/kexec_core.c:1097:51: error: implicit declaration of function 'irqd_irq_inprogress' [-Werror=implicit-function-declaration]
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                                   ^~~~~~~~~~~~~~~~~~~
>> kernel/kexec_core.c:1097:76: error: invalid use of undefined type 'struct irq_desc'
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                                                            ^~
   kernel/kexec_core.c:1098:29: error: invalid use of undefined type 'struct irq_chip'
    1098 |                         chip->irq_eoi(&desc->irq_data);
         |                             ^~
   kernel/kexec_core.c:1098:44: error: invalid use of undefined type 'struct irq_desc'
    1098 |                         chip->irq_eoi(&desc->irq_data);
         |                                            ^~
   kernel/kexec_core.c:1100:25: error: invalid use of undefined type 'struct irq_chip'
    1100 |                 if (chip->irq_mask)
         |                         ^~
   kernel/kexec_core.c:1101:29: error: invalid use of undefined type 'struct irq_chip'
    1101 |                         chip->irq_mask(&desc->irq_data);
         |                             ^~
   kernel/kexec_core.c:1101:45: error: invalid use of undefined type 'struct irq_desc'
    1101 |                         chip->irq_mask(&desc->irq_data);
         |                                             ^~
   kernel/kexec_core.c:1103:25: error: invalid use of undefined type 'struct irq_chip'
    1103 |                 if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
         |                         ^~
   kernel/kexec_core.c:1103:43: error: implicit declaration of function 'irqd_irq_disabled'; did you mean 'arch_irqs_disabled'? [-Werror=implicit-function-declaration]
    1103 |                 if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           arch_irqs_disabled
   kernel/kexec_core.c:1103:66: error: invalid use of undefined type 'struct irq_desc'
    1103 |                 if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
         |                                                                  ^~
   kernel/kexec_core.c:1104:29: error: invalid use of undefined type 'struct irq_chip'
    1104 |                         chip->irq_disable(&desc->irq_data);
         |                             ^~
   kernel/kexec_core.c:1104:48: error: invalid use of undefined type 'struct irq_desc'
    1104 |                         chip->irq_disable(&desc->irq_data);
         |                                                ^~
   cc1: some warnings being treated as errors


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

