Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5E0569948
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 06:27:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldjzz5gmrz3c5x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 14:27:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cbnes8r1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cbnes8r1;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdjzH46qzz3bd3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 14:26:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657167995; x=1688703995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0UKCDk+QO7Jju1w2FSJQYoZZKRQ/VlNP3afiUk2ofuU=;
  b=cbnes8r1pSLx7+O3lo4MddyAGdsHSiS5P4IJUKugnXfcSyXyhBezuthg
   E+LeYvPW13OTDaqs4m3LuIoUoskfCv1s3qGenOxFHC5rWaRVmYWtGYbYG
   wsuIRB6lYMuiKfj3ad2+B97yKzP46koeNWsLWGVtBHyoyvtb8Ijl+h9Ad
   swgkh4yJ0O32n0RlmCnifeEu3qmYx/dcdtPzCSeMLOsoqlFeG7/XeI40O
   303f8npU77pM2vnLiG4r4AsjNFePn8hCQIjTwS6gXa0LeLS1MJJqlLYUR
   6Hvxbizcix7h7+5cn941/L2WE+tOXPXErv42QXNDS8s5dwgNfCnJOSZ3Y
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="282679320"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="282679320"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 21:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="683173227"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2022 21:26:22 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9J5p-000LXY-Rr;
	Thu, 07 Jul 2022 04:26:21 +0000
Date: Thu, 7 Jul 2022 12:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>, kexec@lists.infradead.org,
	devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 6/6] tpm/kexec: Duplicate TPM measurement log in
 of-tree for kexec
Message-ID: <202207071217.lAHS2W7R-lkp@intel.com>
References: <20220706152329.665636-7-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706152329.665636-7-stefanb@linux.ibm.com>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, nayna@linux.ibm.com, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, Eric Biederman <ebiederm@xmission.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stefan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 03c765b0e3b4cb5063276b086c76f7a612856a9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Berger/tpm-Preserve-TPM-measurement-log-across-kexec-ppc64/20220706-232658
base:   03c765b0e3b4cb5063276b086c76f7a612856a9a
config: s390-randconfig-r015-20220706 (https://download.01.org/0day-ci/archive/20220707/202207071217.lAHS2W7R-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f553287b588916de09c66e3e32bf75e5060f967f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/d5d97eac90ae272727cc71409e88360b7024b343
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Berger/tpm-Preserve-TPM-measurement-log-across-kexec-ppc64/20220706-232658
        git checkout d5d97eac90ae272727cc71409e88360b7024b343
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: kernel/kexec_file.o: in function `__se_sys_kexec_file_load':
>> kexec_file.c:(.text+0xee2): undefined reference to `tpm_add_kexec_buffer'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/dma/fsl-edma.o: in function `fsl_edma_probe':
   fsl-edma.c:(.text+0x1e4): undefined reference to `devm_ioremap_resource'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: fsl-edma.c:(.text+0x32a): undefined reference to `devm_ioremap_resource'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/dma/idma64.o: in function `idma64_platform_probe':
   idma64.c:(.text+0xbe): undefined reference to `devm_ioremap_resource'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/crypto/ccree/cc_driver.o: in function `ccree_probe':
   cc_driver.c:(.text+0xd4c): undefined reference to `devm_ioremap_resource'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/crypto/ccree/cc_debugfs.o: in function `cc_debugfs_init':
   cc_debugfs.c:(.text+0x1b0): undefined reference to `debugfs_create_regset32'
   /opt/cross/gcc-11.3.0-nolibc/s390x-linux/bin/s390x-linux-ld: cc_debugfs.c:(.text+0x390): undefined reference to `debugfs_create_regset32'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
