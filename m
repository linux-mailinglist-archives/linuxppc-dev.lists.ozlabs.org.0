Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 229646063D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 17:08:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtWFQ06GPz3cfv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 02:08:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sdxCERJb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sdxCERJb;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtWDW0JdNz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 02:07:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A660B82799;
	Thu, 20 Oct 2022 15:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD5CC433D6;
	Thu, 20 Oct 2022 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666278452;
	bh=rk4FkyTj63SqjU/doWeGOOjxnw9Z66lex5OFbxvboaI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sdxCERJblo0QG0GrtZ7yNTFcOmznqbm5pyuIU6DeQbXsLVWAHBxCtmkVx4dhU8ITY
	 DRiZC+TTV5nRKxaIcv7JxpZsJMFkNKkYNgiAd6Ewf2ucq73OeCc379PlMsVa0yLOET
	 m0t0PH6oy//zs7NK2hg6BUkYu0lc/vF17DUo7tgT+UE7eA2wi4z+35BPalepsK/KvQ
	 1gQ+1WZ4haNBpW1SqDj/RYdcjRoHIqbhU/0rsgvdlemG0AH78b2atshNKoaoL4A4lg
	 TXnutMAL0I8rZT7kX+Nm4PlwBY+ATOEVQUUvPRHq/E2EAqVfJ+0UqhVPEsfLOZV2sf
	 EmpP3TjySOGbg==
Date: Thu, 20 Oct 2022 10:07:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <20221020150731.GA121202@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210202204.u22wJti3-lkp@intel.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, llvm@lists.linux.dev, Minghuan Lian <minghuan.Lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, linux-riscv@lists.infradead.org, Toan Le <toan@os.amperecomputing.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, bcm-kernel-feedback-list@broadcom.com, Mingkai Hu <mingkai.hu@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org, Scott 
 Branden <sbranden@broadcom.com>, Daire McNa mara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 20, 2022 at 10:13:10PM +0800, kernel test robot wrote:
> Hi Bjorn,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on helgaas-pci/next]
> [also build test ERROR on xilinx-xlnx/master rockchip/for-next linus/master v6.1-rc1 next-20221020]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> patch link:    https://lore.kernel.org/r/20221019195452.37606-1-helgaas%40kernel.org
> patch subject: [PATCH] PCI: Remove unnecessary of_irq.h includes
> config: s390-randconfig-r044-20221019
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
>         git checkout 273a24b16a40ffd6a64c6c55aecbfae00a1cd996
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/

Maybe more user error?

  $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/
  Compiler will be installed in /home/bjorn/0day
  make --keep-going HOSTCC=/home/bjorn/0day/clang/bin/clang CC=/home/bjorn/0day/clang/bin/clang OBJCOPY=/usr/s390x-linux-gnu/bin/objcopy AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf HOSTCXX=clang++ HOSTAR=llvm-ar CROSS_COMPILE=s390x-linux-gnu- --jobs=16 W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pci/controller/
  make[1]: Entering directory '/home/bjorn/linux/build_dir'
    SYNC    include/config/auto.conf.cmd
    GEN     Makefile
  scripts/Kconfig.include:40: linker 's390x-linux-gnu-ld' not found
  make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
  make[2]: *** [../Makefile:697: syncconfig] Error 2
  make[1]: *** [/home/bjorn/linux/Makefile:798: include/config/auto.conf.cmd] Error 2
  make[1]: Failed to remake makefile 'include/config/auto.conf.cmd'.
  make[1]: Failed to remake makefile 'include/config/auto.conf'.
    GEN     Makefile
  Error: kernelrelease not valid - run 'make prepare' to update it
  ../scripts/mkcompile_h: 19: s390x-linux-gnu-ld: not found
  make[1]: Target 'drivers/pci/controller/' not remade because of errors.
  make[1]: Leaving directory '/home/bjorn/linux/build_dir'
  make: *** [Makefile:231: __sub-make] Error 2
  make: Target 'drivers/pci/controller/' not remade because of errors.

