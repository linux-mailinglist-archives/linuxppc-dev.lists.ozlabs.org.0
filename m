Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515B55407D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 04:23:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSRxr0Twlz3cdT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 12:23:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ffSZQxqH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ffSZQxqH;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSRx95G1Hz2xB1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 12:22:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655864557; x=1687400557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QSywI1O13gdKLcRQ8txL+vbe2gWSenpDSQ+axalbyU4=;
  b=ffSZQxqHAM7vCvLtkm+k+MeaqTna/lXT3Mccjd2JW98SsngWcSquZYlN
   XYY+i2oHvMsLToyEFrUptX1IzQu3ENkTdySOeoSRUULHoqL5/gKtMaXHG
   u/uhfYJespAQtiPNCfR7va7k5Ux3UH5Q2/7Ta6QGwR4RHkMpKVoxlFzfM
   rlKY2FAuh4TUz7mtVUoryA5sQDsky59C6os0sdfNi6f7nOlmZhGP77JGD
   L5bbt3ByucJXXUeuBB9vZayPG4iAfpoNb11BbIfOvSWOK6kJlQj1D6o4Q
   8ij/cmH+J32inZbB+1enjjPqQYTq8IQ1S35Qh9eWh/1sk+MUfNMB79G9d
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="305741506"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="305741506"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 19:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="655422205"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2022 19:22:25 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3q0e-0000iW-HJ;
	Wed, 22 Jun 2022 02:22:24 +0000
Date: Wed, 22 Jun 2022 10:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Wenhu <wenhu.wang@hotmail.com>, gregkh@linuxfoundation.org,
	arnd@arndb.de, hao.wu@intel.com, trix@redhat.com, mdf@kernel.org,
	yilun.xu@intel.com, bhelgaas@google.com, akpm@linux-foundation.org,
	linux-fpga@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCHv2 1/2] mm: eliminate ifdef of HAVE_IOREMAP_PROT in .c
 files
Message-ID: <202206221053.GV7BYwqL-lkp@intel.com>
References: <SG2PR01MB295111ED8F547B9F99DB9FA99FAD9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR01MB295111ED8F547B9F99DB9FA99FAD9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
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
Cc: kbuild-all@lists.01.org, wenhu.wang@hotmail.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Wang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wang-Wenhu/mm-eliminate-ifdef-of-HAVE_IOREMAP_PROT-in-c-files/20220615-140135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: arm-randconfig-s032-20220622 (https://download.01.org/0day-ci/archive/20220622/202206221053.GV7BYwqL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-31-g4880bd19-dirty
        # https://github.com/intel-lab-lkp/linux/commit/b20efcc877829b6f416cf111bd5ad2b13a0cd08e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wang-Wenhu/mm-eliminate-ifdef-of-HAVE_IOREMAP_PROT-in-c-files/20220615-140135
        git checkout b20efcc877829b6f416cf111bd5ad2b13a0cd08e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: drivers/char/mem.o:(.rodata+0x144): undefined reference to `generic_access_phys'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
