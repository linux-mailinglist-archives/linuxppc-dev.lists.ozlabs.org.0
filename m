Return-Path: <linuxppc-dev+bounces-3606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B919DBF17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 05:43:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y00tN2jlgz2yRM;
	Fri, 29 Nov 2024 15:43:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732855404;
	cv=none; b=o14MMb7Y/chlh9lmzGN2ItSPHJYkIyKHHi1IPt3PSH9cpNS1YlmCmDZgZUks2XCT7yYBp+Nre7OfYaLR1FbKEJ7DasZNGwWjockvXTyAC4vC1brNQp2Gp8+VV9vrVBYubBNnO71vZW7r0Rz6r3LZ/e1Jap1XRAB/MgIvRyjX/L2G560lyB/XKAGvg0QqVF/2CRdh6rtDvzdOkd4Wk6P40FnAM5O+t+q3VcllRmhij/HjM1pNcs6ixtVscsKIwqChRqAlsiwNk0p+nom0x/KifpHqXjnAQP87or2l3OdiczbRqIp37d24hRmPprj0y3BLUOaJ1Ll11s6K848sJIKyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732855404; c=relaxed/relaxed;
	bh=WwLFk5CqyIuUQmMOH/w1oY/zTQnSk8WmSXQVFZhD9LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBuaKv+5L3mFyAKZEYwnh8TtUKIvGkTa1FipLRT1o5U/nSkxvgb5A9CITYeXoDDflMML8yhC+Lw13Kvo8FaAP9JUP3rvwCGGzM5yWgd5vdc2K1WgspfIca7MKGx8h3VdEjrsm1c8HxSIUNN82A5JoF9g3wE1btApXozYek6qXz8Sn9M3Uey9uZZyNT/dqYCtqiru+KjSB/XM05XbcRegzAiNDsqBniY58qJekq6vTO0ISWfNaFCsV6RzrYtncukEuO0BxB32FulrBu3LfPGe/s0rbFsoirBU23cYmyr5gUQ3qo2mzxkYqKuuYLltF2K6GSdmJFlXzBHRl3lH7KpSBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mmtoyszV; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mmtoyszV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y00tL69ghz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2024 15:43:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732855404; x=1764391404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9j9UtBCv2PeFtRp7xh7w5s2/nPgIOCo2sIEPHBxiREU=;
  b=mmtoyszVcV0JoD3yaR1H7rfmjscuY3rrwpVrbYcTcznGtP+U7+VqvHVG
   dqiO2Al6kXUidDw5z0vDRjn7ebmjDkeKg/SZdS0BqTK6PE8rPhyVbdGJN
   8zoaNeGjI21uD9h40tAJDpySLeGxWMUnHQfWrTpflRx6NdOrEr6MytIna
   K78uy8sp3sVLMCdyJGAF+Sf8LUYj9AYnjl+nODtj4i8Rkp5/OOgcQ2ncA
   14xTGbamRXvkJ1OBZlIsh/9gpFGS+XiW1L9zacCO7lCEMpLKPPb2OWVL0
   4LkEP2i93Ob3AXhmla2PQKxMF5IpXN6EJWYwh9Re6Zx0vjsSFF+Y9RJZ+
   w==;
X-CSE-ConnectionGUID: kQGYT5L3TaSsvave5uZLMw==
X-CSE-MsgGUID: gBxr5XlhTMiJZk+8ymtJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44460412"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="44460412"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:43:18 -0800
X-CSE-ConnectionGUID: Jp79vHlZQie9htAmyJEFWA==
X-CSE-MsgGUID: L0PTf+eMTSqbkmvDig1DjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92710199"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2024 20:43:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGsqT-000ALf-0C;
	Fri, 29 Nov 2024 04:43:09 +0000
Date: Fri, 29 Nov 2024 12:42:13 +0800
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
Subject: Re: [PATCH v3 2/2] kexec: Prevent redundant IRQ masking by checking
 state before shutdown
Message-ID: <202411291251.RwA1dKZL-lkp@intel.com>
References: <20241128201027.10396-3-farbere@amazon.com>
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
In-Reply-To: <20241128201027.10396-3-farbere@amazon.com>
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
patch link:    https://lore.kernel.org/r/20241128201027.10396-3-farbere%40amazon.com
patch subject: [PATCH v3 2/2] kexec: Prevent redundant IRQ masking by checking state before shutdown
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241129/202411291251.RwA1dKZL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291251.RwA1dKZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291251.RwA1dKZL-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kexec_core.c: In function 'machine_kexec_mask_interrupts':
   kernel/kexec_core.c:1085:24: error: implicit declaration of function 'irq_desc_get_chip' [-Werror=implicit-function-declaration]
    1085 |                 chip = irq_desc_get_chip(desc);
         |                        ^~~~~~~~~~~~~~~~~
   kernel/kexec_core.c:1085:22: warning: assignment to 'struct irq_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1085 |                 chip = irq_desc_get_chip(desc);
         |                      ^
>> kernel/kexec_core.c:1086:31: error: implicit declaration of function 'irqd_is_started' [-Werror=implicit-function-declaration]
    1086 |                 if (!chip || !irqd_is_started(&desc->irq_data))
         |                               ^~~~~~~~~~~~~~~
   kernel/kexec_core.c:1086:52: error: invalid use of undefined type 'struct irq_desc'
    1086 |                 if (!chip || !irqd_is_started(&desc->irq_data))
         |                                                    ^~
   kernel/kexec_core.c:1097:38: error: invalid use of undefined type 'struct irq_chip'
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                      ^~
   kernel/kexec_core.c:1097:51: error: implicit declaration of function 'irqd_irq_inprogress' [-Werror=implicit-function-declaration]
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                                   ^~~~~~~~~~~~~~~~~~~
   kernel/kexec_core.c:1097:76: error: invalid use of undefined type 'struct irq_desc'
    1097 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                                                            ^~
   kernel/kexec_core.c:1098:29: error: invalid use of undefined type 'struct irq_chip'
    1098 |                         chip->irq_eoi(&desc->irq_data);
         |                             ^~
   kernel/kexec_core.c:1098:44: error: invalid use of undefined type 'struct irq_desc'
    1098 |                         chip->irq_eoi(&desc->irq_data);
         |                                            ^~
>> kernel/kexec_core.c:1100:17: error: implicit declaration of function 'irq_shutdown'; did you mean 'timer_shutdown'? [-Werror=implicit-function-declaration]
    1100 |                 irq_shutdown(desc);
         |                 ^~~~~~~~~~~~
         |                 timer_shutdown
   cc1: some warnings being treated as errors


vim +/irqd_is_started +1086 kernel/kexec_core.c

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
  1085			chip = irq_desc_get_chip(desc);
> 1086			if (!chip || !irqd_is_started(&desc->irq_data))
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
  1097			if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
  1098				chip->irq_eoi(&desc->irq_data);
  1099	
> 1100			irq_shutdown(desc);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

