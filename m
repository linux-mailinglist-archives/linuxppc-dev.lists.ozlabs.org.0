Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E184AE322
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 22:50:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtcC44pTZz3c9d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 08:50:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LBHQsbRq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LBHQsbRq; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtcBN1RX1z2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 08:50:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644357020; x=1675893020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2yTF4CDelmoVvKA+lxgQXMC3zxjRDLz1IzX04021fBU=;
 b=LBHQsbRqbaP3/hTOG2VobwYqDyebaQJxMhmd0xS19aUpg9KjmyTvc8jK
 w6CKRGjh8x7R6uIAM2zeQMHKHzTmklcPIqaXbWEJrllm2x42V8JDD8T98
 E+T34Xd/z3tiJ8AW3sYJ5e4iFyXisXIPSqO4HIoMwYp7cJ6onvLoeyY/G
 kqnfouREQYTrzNOCkcd3uNpnSsIBYjduKHo6DN4kYh4n8F6sqSSKQvRAF
 8tZ9f6lpSbBfF7JOpy+ykV8ZP24UQHVH62khQy0cYY4kKpr+9+so62kb7
 QCS/A0pYvqhcSYs3nV9oMFNJLDuO9goFTMUMt+RX87PK9YycH7Pn4zCJr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="309805417"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="309805417"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:49:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="536710481"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2022 13:49:11 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHYMI-0000me-A5; Tue, 08 Feb 2022 21:49:10 +0000
Date: Wed, 9 Feb 2022 05:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Bilbao <carlos.bilbao@amd.com>, john.stultz@linaro.org,
 tglx@linutronix.de, sboyd@kernel.org, alexandre.belloni@bootlin.com,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] include: linux: Reorganize timekeeping and ktime
 headers
Message-ID: <202202090554.VWOt2B2w-lkp@intel.com>
References: <20220208161049.865402-1-carlos.bilbao@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208161049.865402-1-carlos.bilbao@amd.com>
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
Cc: linux-rtc@vger.kernel.org, jgross@suse.com, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, Carlos Bilbao <carlos.bilbao@amd.com>,
 linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, bilbao@vt.edu,
 boon.leong.ong@intel.com, linux-ia64@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mhiramat@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Carlos,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on geert-m68k/for-next]
[also build test ERROR on tip/timers/core tip/x86/core linus/master v5.17-rc3]
[cannot apply to next-20220208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Carlos-Bilbao/include-linux-Reorganize-timekeeping-and-ktime-headers/20220209-001309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
config: m68k-randconfig-r024-20220208 (https://download.01.org/0day-ci/archive/20220209/202202090554.VWOt2B2w-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5ed7d76f2d6aabedc437bc0b99020dc655ab5719
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Carlos-Bilbao/include-linux-Reorganize-timekeeping-and-ktime-headers/20220209-001309
        git checkout 5ed7d76f2d6aabedc437bc0b99020dc655ab5719
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/m68k/68000/timers.c: In function 'hw_tick':
>> arch/m68k/68000/timers.c:64:9: error: implicit declaration of function 'legacy_timer_tick' [-Werror=implicit-function-declaration]
      64 |         legacy_timer_tick(1);
         |         ^~~~~~~~~~~~~~~~~
   arch/m68k/68000/timers.c: At top level:
   arch/m68k/68000/timers.c:120:5: warning: no previous prototype for 'm68328_hwclk' [-Wmissing-prototypes]
     120 | int m68328_hwclk(int set, struct rtc_time *t)
         |     ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/legacy_timer_tick +64 arch/m68k/68000/timers.c

36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  57  
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  58  static irqreturn_t hw_tick(int irq, void *dummy)
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  59  {
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  60  	/* Reset Timer1 */
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  61  	TSTAT &= 0;
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  62  
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  63  	m68328_tick_cnt += TICKS_PER_JIFFY;
09323308f63708 arch/m68k/68000/timers.c               Arnd Bergmann 2020-09-24 @64  	legacy_timer_tick(1);
09323308f63708 arch/m68k/68000/timers.c               Arnd Bergmann 2020-09-24  65  	return IRQ_HANDLED;
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  66  }
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  67  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
