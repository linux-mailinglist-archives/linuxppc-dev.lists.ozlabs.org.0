Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A514687223
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 01:01:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6f865wQHz3f4Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 11:01:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i5QvcP9a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i5QvcP9a;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6f792PGgz3bW2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 11:00:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 01246CE25B2;
	Thu,  2 Feb 2023 00:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0926BC433EF;
	Thu,  2 Feb 2023 00:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675296015;
	bh=3YuEcB+5xKtJhJZ8owOZt4GNMnLjied7CxzsJPMYgR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5QvcP9attiPPN+yN7wcueLtejYZwxJR9HrNrKRxO7TOZQJrLoLibK3G9yyzopKjX
	 7qTwhpKJ0f1RNS0yyyIzrFqpRRPnf0OZY1bf8z0osZe2ZKkBR12UriPUpwwDp/xd9x
	 eizsbRskb5sRPZ4C2Clpd1CW/djQA+uZh/iFfgnU37U7hxRuUJjDQSWB3uNJf25aQc
	 58aBa7Xg0E4omhJE2uGocvzEpzkjkmUtpRzLhpZq3YAPhybEUMlntPE3uetrUj1c0S
	 B6fcKqPVLP63fZiRA1hr8WqJGXcMkS8GNZBhsVOTEQGIuQDgH6oWrb3nPY/k099xwk
	 X2z7Dlx8GrVeg==
Received: by pali.im (Postfix)
	id 4C90F7FB; Thu,  2 Feb 2023 01:00:12 +0100 (CET)
Date: Thu, 2 Feb 2023 01:00:12 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [powerpc:next-test 14/40] pci.c:undefined reference to
 `pci_create_OF_bus_map'
Message-ID: <20230202000012.idppe6t73itvtlbz@pali>
References: <202302020739.cLZQSxQV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302020739.cLZQSxQV-lkp@intel.com>
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

On Thursday 02 February 2023 07:51:23 kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   9ffcf6a19dbb2a24de2c2d7b2af1e130986cd565
> commit: 869363998da87c80c16ff1221e95b41b2d3cceb2 [14/40] powerpc/pci: Allow to disable filling deprecated pci-OF-bus-map
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230202/202302020739.cLZQSxQV-lkp@intel.com/config)
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
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    powerpc-linux-ld: arch/powerpc/platforms/chrp/pci.o: in function `chrp_find_bridges':
> >> pci.c:(.init.text+0xaec): undefined reference to `pci_create_OF_bus_map'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

Try this fix:

diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index 6f6598e771ff..908d301d3272 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -320,7 +320,9 @@ chrp_find_bridges(void)
 	 */
 	hydra_init();		/* Mac I/O */
 
+#ifdef CONFIG_PPC_PCI_OF_BUS_MAP_FILL
 	pci_create_OF_bus_map();
+#endif
 }
 
 /* SL82C105 IDE Control/Status Register */
