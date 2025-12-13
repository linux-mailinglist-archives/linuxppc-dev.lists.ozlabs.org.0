Return-Path: <linuxppc-dev+bounces-14740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91398CBB230
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Dec 2025 19:22:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTF6R44B9z2xg9;
	Sun, 14 Dec 2025 05:22:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765650143;
	cv=none; b=i9T4zghXg0ZOD9uWcub6miT7pJ6e2axBqoDuuh73gln3TVcsfJyEf1vRsExqY4PEhtEpd8wFzAVIS6m6Y1BHqPeUnD6SLvEljJs4Wm1CbL0bPbiejK5FYoZJa1cHvuIxtRCkXUmo3B39BaEZ0WuQyeoNT5Buz2IoVhSzyuuVBDPljsnYY6/1FrugKPr2570MLqXng7DITerHCF5rwiK13LawtUYMJGMY+nsCYjVdqnFhnqqCzwkvuGIL/lyxk3fGw4K40Tc7mOQEA9+8R6IaW4fe7ngHmdMPinjM/tk1cciuSyL36U3FxILmfUSXq0UozF8qWaC/Ghz1V0/RctpqWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765650143; c=relaxed/relaxed;
	bh=NfHOPinuyaDk2vNExJlfAE6VynkvMxSpvVwwVbEFkPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/PR3v8VTM7PR1nHhHoE682urxTZsbL/fHzdqDKgA6qck/hV75mqAGQ0rilNtu0vAV8FVSBfAPB38B1DjzJDadWNkO25cjOOdZuRYi6gMUmzrnwBnqrboj5Y0Ib+2e2eIO4guOOof8pGhcqPr9W3/KAZq9EMS+1hdeqcXIm0ZMxMD0K55HN7nNtm28r5Z5I0m8N+tbgG4DLo9Hrf+Qqgo2KhjdN2yGJ0Qsl1DwMSTdnV3a70s672y04/P+bQqj77HvRyVXHlipZQ0RRWmKDhyUiDBDr07j568k9HBM0UagC9D7+pNKNGJXTGlswM95RXM7MolmJedeNyxaNO7XTW3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bx8mD/K6; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bx8mD/K6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTF6N2sgvz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Dec 2025 05:22:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765650141; x=1797186141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VuBIHLj7oBoIFj+NYV7CqgXjiAwFMwo/5flHJXzbGpU=;
  b=bx8mD/K6znMgp832B4hSrg+G5p8cLPSHatLCntjvhxLe2XBhrRA4gYZN
   zaFwUUzPdXqHYH/soCv/fWM4x36kcPb/KzPzsmGyVQFk2EgQZk9yOUvWT
   Ti3lUhzUxSX5yiHC7uVRxSRS/3tyvXGOipaPTw/k0pUzK1mXPzCo8rYNT
   /LQbQ2IwuKyCIoXoGR+yv3zVz/PP86eREe9NKrfpY4wnqwIemAiR8QPfd
   ZKXujgmXNzQU9R/vYvPdrIuNyDgFahGnCQxMBsH4fLdtWRqG8jiXzjKqg
   wdW/1xwZI9S5SO//gd2Ti6bH4ZTBzTAAZnPZY/3lbpNP0GNU9uKQipw9C
   Q==;
X-CSE-ConnectionGUID: IHVD8OFHSoiQ0rp8fASv5Q==
X-CSE-MsgGUID: +Br72eL3S0eH3C5uykQD0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67775491"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67775491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:22:14 -0800
X-CSE-ConnectionGUID: kpb4Me8lSF+sDoGI1o3j3g==
X-CSE-MsgGUID: uTVLjPT4R3a324lOlH8OJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197620802"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 10:22:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUFs-00000000837-40oj;
	Sat, 13 Dec 2025 18:22:08 +0000
Date: Sun, 14 Dec 2025 02:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>,
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	James.Bottomley@hansenpartnership.com, jarkko@kernel.org,
	zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	ssrish@linux.ibm.com
Subject: Re: [PATCH 2/6] powerpc/pseries: move the PLPKS config inside its
 own sysfs directory
Message-ID: <202512140150.PUqCvp88-lkp@intel.com>
References: <20251213052618.190691-3-ssrish@linux.ibm.com>
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
In-Reply-To: <20251213052618.190691-3-ssrish@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Srish,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes zohar-integrity/next-integrity linus/master v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srish-Srinivasan/pseries-plpks-fix-kernel-doc-comment-inconsistencies/20251213-132948
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251213052618.190691-3-ssrish%40linux.ibm.com
patch subject: [PATCH 2/6] powerpc/pseries: move the PLPKS config inside its own sysfs directory
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251214/202512140150.PUqCvp88-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140150.PUqCvp88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140150.PUqCvp88-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/prom.c:59:
>> arch/powerpc/include/asm/plpks.h:118:12: warning: 'plpks_config_create_softlink' defined but not used [-Wunused-function]
     118 | static int plpks_config_create_softlink(struct kobject *from) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/plpks_config_create_softlink +118 arch/powerpc/include/asm/plpks.h

   111	
   112	int plpks_config_create_softlink(struct kobject *from);
   113	#else // CONFIG_PSERIES_PLPKS
   114	static inline bool plpks_is_available(void) { return false; }
   115	static inline u16 plpks_get_passwordlen(void) { BUILD_BUG(); }
   116	static inline void plpks_early_init_devtree(void) { }
   117	static inline int plpks_populate_fdt(void *fdt) { BUILD_BUG(); }
 > 118	static int plpks_config_create_softlink(struct kobject *from) { return 0; }
   119	#endif // CONFIG_PSERIES_PLPKS
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

