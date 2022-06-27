Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A37955B492
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 02:17:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWSvy2l3yz3cf1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 10:17:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DgZxf4yA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DgZxf4yA;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWSvF0Mn2z3bkC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 10:16:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656288985; x=1687824985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ETjJrKM7EKk6qTo3Ymv4caPFnW5n+rV1F7mfJnOmGRw=;
  b=DgZxf4yATaeZFdCtxc7SNTepg/wQJQ9dtYeAGYgQ2lldjBFrqoTDxI/9
   1yFgFPkGnPuj7YAu2Sl3+Lvq9ETzxKtLw6V7VzTkZ7RgogtkMEFQ8/+/e
   8JEMcPk0HhMoh576kr/KS7u7FRFWjph9R96W8Di4/ecNFuLPlzp8uxvUd
   zU3pyq7tjraLmORboSXAnw/ssJRlJqY4n0UseurnpNWmpuB/4NPEpD8fs
   IHbZ9m2eXL1W3AFqa4J/gcJtQAD0Z1dL5ZBFvBr1yNnEfH+trkVMiXapD
   N6GBUE1z9A/Ik+CxdVMqO4bgIs3NoYtLd4gmSzo7j08/UflKF2dBI9QFg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282058717"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="282058717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 17:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="732083282"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2022 17:16:11 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5cQF-0007zZ-6B;
	Mon, 27 Jun 2022 00:16:11 +0000
Date: Mon, 27 Jun 2022 08:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ash Logan <ash@heyquark.com>, paulus@samba.org, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu, robh+dt@kernel.org,
	benh@kernel.crashing.org
Subject: Re: [PATCH v2 06/12] powerpc: wiiu: udbg support for latteipc
Message-ID: <202206270817.dnXU7wge-lkp@intel.com>
References: <20220622131037.57604-7-ash@heyquark.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622131037.57604-7-ash@heyquark.com>
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
[also build test WARNING on robh/for-next linus/master v5.19-rc4 next-20220624]
[cannot apply to mpe/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ash-Logan/dt-bindings-wiiu-Document-the-Nintendo-Wii-U-devicetree/20220622-221056
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-c003-20220626
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0d6dd3905db145853c7c744ac92d49b00b1fa20)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/acc3ab8f224a93f1a41267aeb09dee3d2ec810fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ash-Logan/dt-bindings-wiiu-Document-the-Nintendo-Wii-U-devicetree/20220622-221056
        git checkout acc3ab8f224a93f1a41267aeb09dee3d2ec810fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/platforms/wiiu/ drivers/usb/misc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/wiiu/udbg_latteipc.c:65:13: warning: no previous prototype for function 'latteipc_udbg_init' [-Wmissing-prototypes]
   void __init latteipc_udbg_init(void)
               ^
   arch/powerpc/platforms/wiiu/udbg_latteipc.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init latteipc_udbg_init(void)
   ^
   static 
   1 warning generated.


vim +/latteipc_udbg_init +65 arch/powerpc/platforms/wiiu/udbg_latteipc.c

    61	
    62	/*
    63	 * Latte IPC udbg support initialization.
    64	 */
  > 65	void __init latteipc_udbg_init(void)
    66	{
    67		struct device_node *np;
    68		void __iomem *ipc_io_base;
    69	
    70		if (latteipc_io_base)
    71			udbg_printf("%s: early -> final\n", __func__);
    72	
    73		np = of_find_compatible_node(NULL, NULL, "nintendo,latte-ipc");
    74		if (!np) {
    75			udbg_printf("%s: IPC node not found\n", __func__);
    76			goto out;
    77		}
    78	
    79		ipc_io_base = latteipc_udbg_setup_ipc_io_base(np);
    80		if (!ipc_io_base) {
    81			udbg_printf("%s: failed to setup IPC io base\n", __func__);
    82			goto done;
    83		}
    84	
    85		udbg_putc = latteipc_udbg_putc;
    86		udbg_printf("latteipc_udbg: ready\n");
    87	
    88	done:
    89		of_node_put(np);
    90	out:
    91		return;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
