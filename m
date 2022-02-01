Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE3F4A5767
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 07:59:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnwld71mzz3cFg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 17:59:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPWESRxu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnwkv2lSJz2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 17:58:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fPWESRxu; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Jnwkt6GxQz4xcn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 17:58:46 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Jnwkt64cXz4xcq; Tue,  1 Feb 2022 17:58:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fPWESRxu; dkim-atps=neutral
X-Greylist: delayed 430 seconds by postgrey-1.36 at gandalf;
 Tue, 01 Feb 2022 17:58:46 AEDT
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Jnwkt2MLhz4xcn
 for <linuxppc-dev@ozlabs.org>; Tue,  1 Feb 2022 17:58:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643698726; x=1675234726;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PCLp8WgmcpGiu8vnjxT1e+O5iBMthccbQhOIzu8jOrA=;
 b=fPWESRxudNVxvIw8kTcm+GQpDwNlohxBCSQ6XcdsyST0wKlE+dXEIKc2
 FSIT5g2rI257501Xb1spCQTI20NUzrbvFQPToaAhqUXvZCh53+pIhr4d1
 1cwQ+hyZYREAKUUbPb9zNNeRlMKMz4L9nPY53uKGP06QWFG2j5yi7KVSY
 2WA61ZRhaqM0dpB19YHyWyCIEqULkgEDNCsalXGRn9ampWS5ajX65bTXp
 i03fJo+aOy9iiVTbHyKtOEyDZ4+yRmm/H9qN2GeoEsmxyxOqlgnZ+JG5U
 Qmk7ly9iRllmS8l/o/tA+69UTnTGT65pZt8KxNdJ1QeOZrpzAq6Bc09bv g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="227603521"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="227603521"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 22:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="599146480"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2022 22:51:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEn0c-000Su8-86; Tue, 01 Feb 2022 06:51:22 +0000
Date: Tue, 1 Feb 2022 14:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
Subject: Re: powerpc: Set crashkernel offset to mid of RMA region
Message-ID: <202202011412.n27Qr2sT-lkp@intel.com>
References: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
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
Cc: mahesh@linux.vnet.ibm.com, kbuild-all@lists.01.org, hbathini@linux.ibm.com,
 Abdul haleem <abdhalee@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sourabh,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.17-rc2 next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sourabh-Jain/powerpc-Set-crashkernel-offset-to-mid-of-RMA-region/20220128-180605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-m031-20220130 (https://download.01.org/0day-ci/archive/20220201/202202011412.n27Qr2sT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/60c8e71e56c0e5e321c312f14aad9a2ceb241c63
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sourabh-Jain/powerpc-Set-crashkernel-offset-to-mid-of-RMA-region/20220128-180605
        git checkout 60c8e71e56c0e5e321c312f14aad9a2ceb241c63
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/net/ethernet/ti/davinci_cpdma.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: orphan section `.ftrace.tramp' from `drivers/net/ethernet/ti/davinci_cpdma.o' being placed in section `.ftrace.tramp'
   powerpc-linux-ld: arch/powerpc/kernel/rtas.o: in function `early_init_dt_scan_rtas':
>> rtas.c:(.init.text+0x2d2): undefined reference to `powerpc_firmware_features'
>> powerpc-linux-ld: rtas.c:(.init.text+0x2d6): undefined reference to `powerpc_firmware_features'
   powerpc-linux-ld: rtas.c:(.init.text+0x2de): undefined reference to `powerpc_firmware_features'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
