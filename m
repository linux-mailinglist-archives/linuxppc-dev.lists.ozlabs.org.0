Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16168A2C4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 20:17:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7llv3k8Bz3fBN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 06:17:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UMXO1Wkg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UMXO1Wkg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7ll066npz3cLh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 06:16:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BF4761F51;
	Fri,  3 Feb 2023 19:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E8EC433EF;
	Fri,  3 Feb 2023 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675451802;
	bh=0AFp6+/WYLkly4i1S3e6QCedjBXXIlDjZCRb4SgkOcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UMXO1Wkg2f3xBGalnhAsIFnYiTUjtXSLRMCNbhXIsnEjW0Ca5Nyy5Vw2Ih5YP6HVp
	 75t2rm2TteqT5HOuQGvLa/qTbSxaYF6mGusQVvJ1TsvIoQ3noSmnYYpoVruGvqJdHf
	 t72mE/r2L/SAGSs/X7dYREIYh3Dm9827QsyfuxBKAm/CLS4MY5jIaL+XMZHTpJuYeq
	 3GjKRhbrDqih1HwMDXjTLcAlu32wtKqr4g4/Qmw6LvFrZJFv6niGIydWhZzC7PsSFS
	 dYqpQG7zMDd2s/7Hgl9Mv2e7HPM8bz2xyu+n4jekxOMue8F1NpmWvXmURt0uL/0mHn
	 xpSNMPL/QpkGA==
Received: by pali.im (Postfix)
	id 1E628723; Fri,  3 Feb 2023 20:16:39 +0100 (CET)
Date: Fri, 3 Feb 2023 20:16:39 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [powerpc:next-test 14/40] arch/powerpc/kernel/pci_32.c:233:5:
 error: no previous prototype for 'pci_device_from_OF_node'
Message-ID: <20230203191639.ga5xkwqf4hxgoaov@pali>
References: <202302030001.HQPCI490-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302030001.HQPCI490-lkp@intel.com>
User-Agent: NeoMutt/20180716
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

On Friday 03 February 2023 00:13:02 kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   9ffcf6a19dbb2a24de2c2d7b2af1e130986cd565
> commit: 869363998da87c80c16ff1221e95b41b2d3cceb2 [14/40] powerpc/pci: Allow to disable filling deprecated pci-OF-bus-map
> config: powerpc-buildonly-randconfig-r006-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030001.HQPCI490-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=869363998da87c80c16ff1221e95b41b2d3cceb2
>         git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
>         git fetch --no-tags powerpc next-test
>         git checkout 869363998da87c80c16ff1221e95b41b2d3cceb2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/powerpc/kernel/pci_32.c:233:5: error: no previous prototype for 'pci_device_from_OF_node' [-Werror=missing-prototypes]
>      233 | int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors

Try this change:

diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index 82a8981d4c47..b59b6dfb8d4c 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -227,6 +227,7 @@ pci_create_OF_bus_map(void)
 
 #else /* CONFIG_PPC_PCI_OF_BUS_MAP_FILL */
 
+#ifdef CONFIG_PPC_PMAC
 /*
  * Returns the PCI device matching a given OF node without pci_to_OF_bus_map
  */
@@ -248,6 +249,7 @@ int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
 
 	return 0;
 }
+#endif
 
 #endif /* CONFIG_PPC_PCI_OF_BUS_MAP_FILL */
 

> 
> vim +/pci_device_from_OF_node +233 arch/powerpc/kernel/pci_32.c
> 
>    229	
>    230	/*
>    231	 * Returns the PCI device matching a given OF node without pci_to_OF_bus_map
>    232	 */
>  > 233	int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
>    234	{
>    235		const __be32 *reg;
>    236		int size;
>    237	
>    238		/* Check if it might have a chance to be a PCI device */
>    239		if (!pci_find_hose_for_OF_device(node))
>    240			return -ENODEV;
>    241	
>    242		reg = of_get_property(node, "reg", &size);
>    243		if (!reg || size < 5 * sizeof(u32))
>    244			return -ENODEV;
>    245	
>    246		*bus = (be32_to_cpup(&reg[0]) >> 16) & 0xff;
>    247		*devfn = (be32_to_cpup(&reg[0]) >> 8) & 0xff;
>    248	
>    249		return 0;
>    250	}
>    251	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
