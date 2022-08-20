Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DEA59B096
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 23:41:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9Brb4dc9z3c21
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 07:41:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FgUiw3q2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FgUiw3q2;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9Bqy4694z3bYk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 07:40:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661031630; x=1692567630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LOzvEj7iLKGD5rk7k/t82D26qr+7N1ucQ2gJOw8QkWw=;
  b=FgUiw3q2orvo2aT6C4ZOP5mTOxUZeYi4Ixws8Hbf+eSOL+otAyF0jCro
   l5EdkTe7Km4ajIcyx7Wdj4Lh54lSNadG9SQ0tHXYCtvzkKEEocXsXPfsn
   enGFn2u47NtsWAQgn74qc1ZPeQegsUgKkaf947Y7mX94KEbyGQfjsnmzW
   YzDPl4QsEeESq0ZyE41rQz8PcqsXEK6zWxiA/SP1TNEwfPuSl5To48nDh
   sSb+ynxUqSX1Bf0QuCP25NPYxSYxfldkCQgx1b7hPU0tme0MZkmCqotyF
   DgMSN8WqkG4DtyHFDZm8Cl8D8Kb89m9rOEx5xm5P41LV0+0GrqGZmCqhU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10445"; a="280168978"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="280168978"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 14:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="641601976"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Aug 2022 14:40:16 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPWCV-0003Ex-1O;
	Sat, 20 Aug 2022 21:40:15 +0000
Date: Sun, 21 Aug 2022 05:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arminder Singh <arminders208@outlook.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
Message-ID: <202208210548.MCoIwyQl-lkp@intel.com>
References: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, Arminder Singh <arminders208@outlook.com>, Paul Mackerras <paulus@samba.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arminder,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on linus/master v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arminder-Singh/i2c-pasemi-Add-IRQ-support-for-Apple-Silicon/20220821-034703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: riscv-randconfig-r042-20220821 (https://download.01.org/0day-ci/archive/20220821/202208210548.MCoIwyQl-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c9a41fe60ab62f7a40049c100adcc8087a47669b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/98584b2b51d808ab582798c7a50511e8c1889ced
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arminder-Singh/i2c-pasemi-Add-IRQ-support-for-Apple-Silicon/20220821-034703
        git checkout 98584b2b51d808ab582798c7a50511e8c1889ced
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-pasemi-core.c:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-pasemi-core.c:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-pasemi-core.c:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-pasemi-core.c:86:6: warning: variable 'status' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (smbus->use_irq) {
               ^~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-pasemi-core.c:92:12: note: uninitialized use occurs here
                   while (!(status & SMSTA_XEN) && timeout--) {
                            ^~~~~~
   drivers/i2c/busses/i2c-pasemi-core.c:86:2: note: remove the 'if' if its condition is always true
           if (smbus->use_irq) {
           ^~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-pasemi-core.c:83:21: note: initialize the variable 'status' to silence this warning
           unsigned int status;
                              ^
                               = 0
   8 warnings generated.


vim +86 drivers/i2c/busses/i2c-pasemi-core.c

    79	
    80	static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
    81	{
    82		int timeout = 10;
    83		unsigned int status;
    84		unsigned int bitmask = SMSTA_XEN | SMSTA_MTN;
    85	
  > 86		if (smbus->use_irq) {
    87			reinit_completion(&smbus->irq_completion);
    88			reg_write(smbus, REG_IMASK, bitmask);
    89			wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
    90			status = reg_read(smbus, REG_SMSTA);
    91		} else {
    92			while (!(status & SMSTA_XEN) && timeout--) {
    93				msleep(1);
    94				status = reg_read(smbus, REG_SMSTA);
    95			}
    96		}
    97	
    98	
    99		/* Got NACK? */
   100		if (status & SMSTA_MTN)
   101			return -ENXIO;
   102	
   103		if (timeout < 0) {
   104			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
   105			reg_write(smbus, REG_SMSTA, status);
   106			return -ETIME;
   107		}
   108	
   109		/* Clear XEN */
   110		reg_write(smbus, REG_SMSTA, SMSTA_XEN);
   111	
   112		return 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
