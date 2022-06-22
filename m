Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E8554158
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 06:14:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSVQ91QTVz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 14:14:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FLpLbNG2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FLpLbNG2;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSVPW2DQJz302d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 14:13:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655871231; x=1687407231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B/bYItcHLvNJYHpcF6HLJkuCKPwbVggAy5q3voJHv0A=;
  b=FLpLbNG2ggRQlY5xpecgLeBLbdVg0+kxlc54Y4qyWC4hXPOMf2vVTZDQ
   hCIrQaE5xIV8JxmPDc6Ho1jFuhWPOmen/p4H0ECpKo83Pj72hoApvI+5c
   MXZvvfJfjr2TSypK2YhpuU3esGqUOMSYaDPRHpH2hO7fGLoLOkXzHjyxx
   +efCGt1YEYgRny6uBgrprVOEXeldvQT8AjImoaO51DQj/RYOtP1kJ083Z
   UfRhJKb/oVrMxndyviJUWFslsp6kl7RhckeWY7AQyEVj2pbjLJcb/F5re
   sZluv1DayXIXcVSnOWo4kpSMNbS5B1a2+TBh8ZMANw53Dqi5A0rdFd021
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281381143"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="281381143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 21:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="715230316"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Jun 2022 21:13:35 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3rkA-0000on-5h;
	Wed, 22 Jun 2022 04:13:30 +0000
Date: Wed, 22 Jun 2022 12:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Wenhu <wenhu.wang@hotmail.com>, gregkh@linuxfoundation.org,
	arnd@arndb.de, hao.wu@intel.com, trix@redhat.com, mdf@kernel.org,
	yilun.xu@intel.com, bhelgaas@google.com, akpm@linux-foundation.org,
	linux-fpga@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCHv2 1/2] mm: eliminate ifdef of HAVE_IOREMAP_PROT in .c
 files
Message-ID: <202206221102.w7hylFXN-lkp@intel.com>
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
config: m68k-buildonly-randconfig-r001-20220622 (https://download.01.org/0day-ci/archive/20220622/202206221102.w7hylFXN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b20efcc877829b6f416cf111bd5ad2b13a0cd08e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wang-Wenhu/mm-eliminate-ifdef-of-HAVE_IOREMAP_PROT-in-c-files/20220615-140135
        git checkout b20efcc877829b6f416cf111bd5ad2b13a0cd08e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> m68k-linux-ld: drivers/char/mem.o:(.rodata+0x37c): undefined reference to `generic_access_phys'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
