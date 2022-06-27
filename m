Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15E55B559
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 04:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWXMp1yprz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 12:52:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U5K5ggU0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U5K5ggU0;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWXM930Zrz3bkC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 12:52:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656298341; x=1687834341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QrT5ao9preo/N4kReVsNvY5n6xqX0XIHa2T/Gy7NBMM=;
  b=U5K5ggU0sEdAzUXDiIN4YPt9poLJ/j9kVMVckFV3yIjtirb6l0jh1N13
   M8VkhfMq4NFP+/neN5aywQKZObVyhW5+wzwCRVp+CInf8nibnmOGHKhnp
   9VGHVXM8l3oVIbWrBN8EvBWbAY3AvCosG3BI3ccP201yU7GwSGmQaB6dA
   ajA7xLuXBSTQ4A5g9wocTVKozwU6BBQDEHYDc5Lw41LtFzurAaohyo3oS
   2965FGy96X6J8nPBpJWJFSiihT+WYRnGkmp5pwgsvjDkY6tMDIcHEaM5F
   n08dYJhAa5nuTH5cmvRoq9VYhBHgdtbvdWB7x13GQhbUQ5K45yqVuG5rV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282073633"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="282073633"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 19:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="835997743"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2022 19:51:54 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5eqw-00088L-2J;
	Mon, 27 Jun 2022 02:51:54 +0000
Date: Mon, 27 Jun 2022 10:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ash Logan <ash@heyquark.com>, paulus@samba.org, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu, robh+dt@kernel.org,
	benh@kernel.crashing.org
Subject: Re: [PATCH v2 08/12] powerpc: wiiu: latte interrupt controller
 support
Message-ID: <202206271019.YEn99lfz-lkp@intel.com>
References: <20220622131037.57604-9-ash@heyquark.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622131037.57604-9-ash@heyquark.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, linkmauve@linkmauve.fr, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ash,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on robh/for-next]
[cannot apply to mpe/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ash-Logan/dt-bindings-wiiu-Document-the-Nintendo-Wii-U-devicetree/20220622-221056
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-c003-20220626 (https://download.01.org/0day-ci/archive/20220627/202206271019.YEn99lfz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0d6dd3905db145853c7c744ac92d49b00b1fa20)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/533a7cf49cc00c4eaafd2afee5ecd9e23bac99f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ash-Logan/dt-bindings-wiiu-Document-the-Nintendo-Wii-U-devicetree/20220622-221056
        git checkout 533a7cf49cc00c4eaafd2afee5ecd9e23bac99f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/platforms/wiiu/ drivers/usb/misc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/wiiu/latte-pic.c:155:14: warning: no previous prototype for function 'latte_pic_get_irq' [-Wmissing-prototypes]
   unsigned int latte_pic_get_irq(struct irq_domain *h)
                ^
   arch/powerpc/platforms/wiiu/latte-pic.c:155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int latte_pic_get_irq(struct irq_domain *h)
   ^
   static 
   1 warning generated.


vim +/latte_pic_get_irq +155 arch/powerpc/platforms/wiiu/latte-pic.c

   150	
   151	/*
   152	 * Determinate if there are interrupts pending
   153	 * Checks AHBALL (0-32) and AHBLT (32-64)
   154	 */
 > 155	unsigned int latte_pic_get_irq(struct irq_domain *h)
   156	{
   157		struct lt_pic *pic = *this_cpu_ptr(&lt_pic_cpu);
   158		u32 irq_status, irq;
   159	
   160		/* Check AHBALL first */
   161		irq_status = in_be32(&pic->ahball_icr) & in_be32(&pic->ahball_imr);
   162	
   163		if (irq_status == 0) {
   164			/* Try AHBLT */
   165			irq_status =
   166				in_be32(&pic->ahblt_icr) & in_be32(&pic->ahblt_imr);
   167			if (irq_status == 0)
   168				return 0; /* No IRQs pending */
   169	
   170			/* AHBLT is mapped above 32 (LATTE_AHBALL_NR_IRQS) */
   171			irq = __ffs(irq_status) + LATTE_AHBALL_NR_IRQS;
   172			return irq_linear_revmap(h, irq);
   173		}
   174	
   175		irq = __ffs(irq_status);
   176		return irq_linear_revmap(h, irq);
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
