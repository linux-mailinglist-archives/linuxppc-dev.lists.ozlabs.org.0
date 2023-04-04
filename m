Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EE6D679A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 17:39:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrX4V0KsLz3chk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 01:39:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ccjt9OkL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ccjt9OkL;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrX3d4DqWz3cCF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 01:38:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680622717; x=1712158717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JyEyesUAfsnh39QScCqENVpHW7W4d6bfrVDonXQ7JJk=;
  b=ccjt9OkLFakqec4yBiIn8rIUbvvrdizEG7HPKTELBAUAcitRvgX45FKK
   5wMfb28Z5KOiiLRQMWPQ3sjDVhI/cc/Iv94tU45V0TLWaWa++2yHb/zmV
   IhhcE5eKL8nivUUM0L6iCIxJxF7b3WBvzYr32eIuMxcPdA6d9L0Htq03y
   kGt5BdHvuIXLUIBp/aaESXAHm6wod6aefHRp3t3tM14wX59e4XTMPMh7n
   U5Dsd8qcRmcLO2uvuzyTvkXZ0kF46XXzIinmUjytDt7mELrvW/HlKJsWC
   nsZkf+bthP+A1PfL1hB1rvv61GgKHp7I23pABTFqqp0CE0f0TdLCCLD5x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370039401"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="370039401"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 08:38:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="1016148187"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="1016148187"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2023 08:38:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjijv-000Pq6-1Y;
	Tue, 04 Apr 2023 15:38:31 +0000
Date: Tue, 4 Apr 2023 23:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge 5/7] .github/problem-matchers/sparse.json: warning:
 ignored by one of the .gitignore files
Message-ID: <202304042327.blhF5nCp-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
head:   639e8992872c632f27b130b403e263eae966231e
commit: ff94f02dbdf0d6077497f1ffb63080c6937c3ed9 [5/7] powerpc/ci: Add sparse problem matcher
config: arc-buildonly-randconfig-r003-20230403 (https://download.01.org/0day-ci/archive/20230404/202304042327.blhF5nCp-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=ff94f02dbdf0d6077497f1ffb63080c6937c3ed9
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc merge
        git checkout ff94f02dbdf0d6077497f1ffb63080c6937c3ed9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304042327.blhF5nCp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/problem-matchers/compiler-non-source.json: warning: ignored by one of the .gitignore files
   .github/problem-matchers/compiler-source.json: warning: ignored by one of the .gitignore files
>> .github/problem-matchers/sparse.json: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-allconfig.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-clang.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-extrawarn.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-kernel+qemu.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-perf.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-ppctests.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-selftests.yml: warning: ignored by one of the .gitignore files
   .github/workflows/powerpc-sparse.yml: warning: ignored by one of the .gitignore files
   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
