Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3787F8F79
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 22:28:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B4NWrxd9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sd4hb2h09z3cbC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 08:28:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B4NWrxd9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sd4gg4vW3z3c7C
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Nov 2023 08:27:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700947648; x=1732483648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2msMvypUB/fdSacdfq9Xd4cZCJy1Df5Vy8rcx7wAbvU=;
  b=B4NWrxd9B9IB+bXZUpqcfpvtcIKWjO9aA+SaOUd4Q++OVhZq8D8u6FDn
   UzDu3mPW2UjOrCoUSsn11rGdrKsiBjJ2V6bfwkgUa1bn4dM5OgSHKJd7O
   1BFw5rY+7AEn/3CgeA3rvQoOIu2o6FjIRd/aqvZEzV+j0hv2VGp69DHsJ
   CZm+2i6SasS3dXCMh3+QzvuwwvLErS8F3O3PgxaiEHZFyMyrwGKsCgwUB
   XblOMb4RYpzPRDZrrMkvengtVKK9zbInhb3rekqUGmEghwDTdpzoUZ75b
   kRMmTgk4PRdQTtmwayy1tp7bfJnNhNvPFHqXBzx7rhkevYZ/zvSdp3t7+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="5698988"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="5698988"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 13:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="761258825"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="761258825"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2023 13:27:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r70B3-0004RK-3B;
	Sat, 25 Nov 2023 21:27:01 +0000
Date: Sun, 26 Nov 2023 05:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] kexec_file, arm64: print out debugging message if
 required
Message-ID: <202311260548.1HaxcDnE-lkp@intel.com>
References: <20231124033642.520686-5-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124033642.520686-5-bhe@redhat.com>
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
Cc: x86@kernel.org, yujie.liu@intel.com, Baoquan He <bhe@redhat.com>, linux-parisc@vger.kernel.org, llvm@lists.linux.dev, kexec@lists.infradead.org, nathan@kernel.org, oe-kbuild-all@lists.linux.dev, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on tip/x86/core powerpc/next powerpc/fixes linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231124-113942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231124033642.520686-5-bhe%40redhat.com
patch subject: [PATCH v2 4/7] kexec_file, arm64: print out debugging message if required
config: arm64-randconfig-001-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260548.1HaxcDnE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260548.1HaxcDnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260548.1HaxcDnE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/machine_kexec.c:35:2: error: implicit declaration of function 'kexec_dprintk' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kexec_dprintk("%s:%d:\n", func, line);
           ^
   1 error generated.


vim +/kexec_dprintk +35 arch/arm64/kernel/machine_kexec.c

    27	
    28	/**
    29	 * kexec_image_info - For debugging output.
    30	 */
    31	#define kexec_image_info(_i) _kexec_image_info(__func__, __LINE__, _i)
    32	static void _kexec_image_info(const char *func, int line,
    33		const struct kimage *kimage)
    34	{
  > 35		kexec_dprintk("%s:%d:\n", func, line);
    36		kexec_dprintk("  kexec kimage info:\n");
    37		kexec_dprintk("    type:        %d\n", kimage->type);
    38		kexec_dprintk("    head:        %lx\n", kimage->head);
    39		kexec_dprintk("    kern_reloc: %pa\n", &kimage->arch.kern_reloc);
    40		kexec_dprintk("    el2_vectors: %pa\n", &kimage->arch.el2_vectors);
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
