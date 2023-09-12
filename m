Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BE79D92A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 20:52:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fCX2jURP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlXkr0ZJhz3dRg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 04:52:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fCX2jURP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlXjt2j3lz3d85
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 04:51:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694544690; x=1726080690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m4ArRUJq81IoQwOUurgDTOz0S2e8/xwn1JxXLNRgGXc=;
  b=fCX2jURPXh+D4Pu2Wx+2qzizVwp+CdF0wDaJuS1lOhDvHcfSLmFkx4hM
   3s8xmsIi9sFlSBCtY/gU9cZJAjl6wgDRgU8ug5SjGGyqOsIRJDjxVh4L0
   syE826JuXNDI56MnlWGiziA7tatS/nGYJpbrO0rqjDE4JculSTN7404dX
   oAWyusSA3RBU0EZ0frWSsBaN3QH3h3KQV/MYRXjMRZJ3089Ykw7k2zRTV
   y5epdjU8eb/L8NgcgnQ06Rh4qBH7R2x3ZbvgFfxEb0ML4ZqE5N5SMOZCo
   SkA9DS2fat1tbmTbyvfKRiKaGEDKfHBnTtWGHQ1uSjKFicj+1QH9yutK4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="382272927"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="382272927"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="887041629"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="887041629"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2023 11:50:45 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg8Tf-00008v-17;
	Tue, 12 Sep 2023 18:51:11 +0000
Date: Wed, 13 Sep 2023 02:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv6 1/3] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
Message-ID: <202309130232.N2REwHBv-lkp@intel.com>
References: <20230911131855.40738-2-piliu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911131855.40738-2-piliu@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, llvm@lists.linux.dev, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/fixes]
[also build test ERROR on linus/master v6.6-rc1 next-20230912]
[cannot apply to powerpc/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/powerpc-setup-Loosen-the-mapping-between-cpu-logical-id-and-its-seq-in-dt/20230911-213042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
patch link:    https://lore.kernel.org/r/20230911131855.40738-2-piliu%40redhat.com
patch subject: [PATCHv6 1/3] powerpc/setup: Loosen the mapping between cpu logical id and its seq in dt
config: powerpc-randconfig-r032-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130232.N2REwHBv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130232.N2REwHBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130232.N2REwHBv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: boot_cpu_hwid
   >>> referenced by setup-common.c:0 (arch/powerpc/kernel/setup-common.c:0)
   >>>               arch/powerpc/kernel/setup-common.o:(smp_setup_cpu_maps) in archive vmlinux.a
   >>> referenced by setup-common.c:0 (arch/powerpc/kernel/setup-common.c:0)
   >>>               arch/powerpc/kernel/setup-common.o:(smp_setup_cpu_maps) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
