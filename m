Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEFF315928
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 23:10:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZxsq58p6zDwfj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 09:10:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZxrJ64P5zDvVk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 09:09:17 +1100 (AEDT)
IronPort-SDR: 0LaCd/qTw42+LaLGv9cVYUug7WTs24PRNwHEl2fd+2N4FTH0Um74ykYAjV0bFTsz06e1KivsgU
 /C2OFAX2sTsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182034925"
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; 
 d="gz'50?scan'50,208,50";a="182034925"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 14:09:12 -0800
IronPort-SDR: 4xGJUJmq5KhBKf+tmWcCo0U3olUS6tF+2emtYwKri/WRINFaLJaxoYdDq6AqSYxaGm06Iqdb+5
 F7iC/Z/4SKjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; 
 d="gz'50?scan'50,208,50";a="436421770"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 09 Feb 2021 14:09:09 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l9bC1-0002KW-4B; Tue, 09 Feb 2021 22:09:09 +0000
Date: Wed, 10 Feb 2021 06:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: [powerpc:next-test 67/159]
 arch/powerpc/platforms/83xx/km83xx.c:183:19: error: 'mpc83xx_setup_pci'
 undeclared here (not in a function); did you mean
Message-ID: <202102100601.eLtCMofO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   5811244192fc4e18c001c69300044c2acf30bd91
commit: 83f84041ff1cf6c23fc38861218af2d4ca2d9b38 [67/159] powerpc/83xx: Move PHB discovery
config: powerpc-kmeter1_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=83f84041ff1cf6c23fc38861218af2d4ca2d9b38
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 83f84041ff1cf6c23fc38861218af2d4ca2d9b38
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/83xx/km83xx.c:183:19: error: 'mpc83xx_setup_pci' undeclared here (not in a function); did you mean 'mpc83xx_setup_arch'?
     183 |  .discover_phbs = mpc83xx_setup_pci,
         |                   ^~~~~~~~~~~~~~~~~
         |                   mpc83xx_setup_arch


vim +183 arch/powerpc/platforms/83xx/km83xx.c

   178	
   179	define_machine(mpc83xx_km) {
   180		.name		= "mpc83xx-km-platform",
   181		.probe		= mpc83xx_km_probe,
   182		.setup_arch	= mpc83xx_km_setup_arch,
 > 183		.discover_phbs	= mpc83xx_setup_pci,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--CE+1k2dSO48ffgeK
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
/tvSfyCKZe9TzAAA

--CE+1k2dSO48ffgeK--
