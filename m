Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE86063C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 17:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtW9z0YDKz3dwX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 02:05:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fvmtWob5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fvmtWob5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtW934YcJz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 02:04:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD8DD61BB6;
	Thu, 20 Oct 2022 15:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE56FC433C1;
	Thu, 20 Oct 2022 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666278276;
	bh=MRWW87pAsq3Ov7I38XJfjHIT6/6rcGMTIKudamH/Qlc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fvmtWob5RXz/kHLTL1TNBOAyteTHgsKDs4ZTjevlmoHIwxTjMd0nHa/IJPz0Bqkkm
	 ACdZeNHLrRH+6y5zswwgfHPmTvxDu75CA8nbwp7RKnHlIuMqln7eIskaTwbhmpZewT
	 KVgKEOET44WVom2LR3A3I+QIYGZyJc62sUPg4agsLtmbZzDt3ZqTt09OXKTpApPPGw
	 gk6b9kg8u38YOwSVK2VXY83opXqL6uuA5lx7BKQI8usJHilEMYH8sGqNo88EMFvPgt
	 mN0/wxxiGAPaMYBiC0DwgBywEJONrUS11+7Miwv0T25KrHYUaFo/K6Gy1GR3Et/cEe
	 KMdiC587G7e6w==
Date: Thu, 20 Oct 2022 10:04:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <20221020150434.GA121028@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020134101.GA90102@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org, Scott Branden <sbranden@broa
 dcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 20, 2022 at 08:41:01AM -0500, Bjorn Helgaas wrote:
> On Thu, Oct 20, 2022 at 04:09:37PM +0800, kernel test robot wrote:
> > Hi Bjorn,
> > 
> > I love your patch! Yet something to improve:
> > 
> > [auto build test ERROR on helgaas-pci/next]
> > [also build test ERROR on xilinx-xlnx/master rockchip/for-next linus/master v6.1-rc1 next-20221020]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> > patch link:    https://lore.kernel.org/r/20221019195452.37606-1-helgaas%40kernel.org
> > patch subject: [PATCH] PCI: Remove unnecessary of_irq.h includes
> > config: ia64-randconfig-r026-20221020
> > compiler: ia64-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/intel-lab-lkp/linux/commit/273a24b16a40ffd6a64c6c55aecbfae00a1cd996
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Bjorn-Helgaas/PCI-Remove-unnecessary-of_irq-h-includes/20221020-100633
> >         git checkout 273a24b16a40ffd6a64c6c55aecbfae00a1cd996
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/controller/
> 
> FYI, the instructions above didn't work for me.  Missing "config".

Sorry, my fault, "config" was a MIME attachment.  Possibly update the
instructions:

  - # save the config file
  + # save the config file from the MIME attachment
