Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C352ACB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 22:28:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2nl11H0Lz3cFQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 06:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gRIU/P4K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gRIU/P4K; dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2nkK4F1Cz3bxh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 06:28:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652819289; x=1684355289;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=VW5xQ9qTTYjQwND3euvBbD0acujiIM1e4Z7pmUl06lk=;
 b=gRIU/P4K+oheNlz863ezYDk/6fFHGoUB11O2kcHOg7r3x3799TmGObUf
 KD0gLJQXLf0Q5SH8Srv0BF9FUHpU/57cwYFM5fOTCDvIQ9bJDVcl+29h+
 2PSf2dSsmrSP2sq3+1nCEz3Jnb9jZ1a2IjgHGuHsWKhevV5AiqyySN9go
 yoiEzbnUBPS8PcpQcq8wC/DWtSF+dVfVwiFVxyo0cdMymzI3xJkmCNYX4
 cfi+VGq287SNG5g8WZm0/ihCW29Tu5FbTpdrt4o5L/fdmGXDyZ9H90AxW
 HMZZNuHItiYqjxHuvBPnYl5YINb7RLdlJquZST7OiB2jSllQugy4M+lkI g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="331936614"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="331936614"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 13:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="605530219"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 17 May 2022 13:27:57 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nr3nQ-0001Mx-Ie;
 Tue, 17 May 2022 20:27:56 +0000
Date: Wed, 18 May 2022 04:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [powerpc:next-test 139/145]
 arch/powerpc/sysdev/mpc5xxx_clocks.c:26:2: error: call to undeclared
 function 'fwnode_for_each_parent_node'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202205180443.Cfi2jikJ-lkp@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   2e4a9942261f89ad204a8189634029a4b1f0efb6
commit: f9724684ea2198caaab132514ca104175ed2f15f [139/145] powerpc/mpc5xxx: Switch mpc5xxx_get_bus_frequency() to use fwnode
config: powerpc-mpc512x_defconfig (https://download.01.org/0day-ci/archive/20220518/202205180443.Cfi2jikJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=f9724684ea2198caaab132514ca104175ed2f15f
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout f9724684ea2198caaab132514ca104175ed2f15f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/sysdev/mpc5xxx_clocks.c:26:2: error: call to undeclared function 'fwnode_for_each_parent_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           fwnode_for_each_parent_node(fwnode, parent) {
           ^
>> arch/powerpc/sysdev/mpc5xxx_clocks.c:26:45: error: expected ';' after expression
           fwnode_for_each_parent_node(fwnode, parent) {
                                                      ^
                                                      ;
   2 errors generated.


vim +/fwnode_for_each_parent_node +26 arch/powerpc/sysdev/mpc5xxx_clocks.c

     8	
     9	/**
    10	 * mpc5xxx_fwnode_get_bus_frequency - Find the bus frequency for a firmware node
    11	 * @fwnode:	firmware node
    12	 *
    13	 * Returns bus frequency (IPS on MPC512x, IPB on MPC52xx),
    14	 * or 0 if the bus frequency cannot be found.
    15	 */
    16	unsigned long mpc5xxx_fwnode_get_bus_frequency(struct fwnode_handle *fwnode)
    17	{
    18		struct fwnode_handle *parent;
    19		u32 bus_freq;
    20		int ret;
    21	
    22		ret = fwnode_property_read_u32(fwnode, "bus-frequency", &bus_freq);
    23		if (!ret)
    24			return bus_freq;
    25	
  > 26		fwnode_for_each_parent_node(fwnode, parent) {

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
