Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE5C525466
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 20:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kzfkf1RWsz3cBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 04:02:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSU8mvM1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kSU8mvM1; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kzfjz00CRz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 04:01:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652378519; x=1683914519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PD1Io4Wa6C0Ag10n1oVD9y2Eh6h8qkoqTzY1mJg6nzE=;
 b=kSU8mvM1IalswAaLQC41nrZ6O5RVrpQR3+BSaLUFUdIPq3I6Vdzrw0oA
 KG8el9MMponkoTpvGu8GWJk7YHX8pGiJF8Uiiee1qxZmzc0S2GAyK5Bpe
 z7iCSYOPOF/+oBof9pxPgebydHHdz0Pn+k21PJ0SJ4mt+B71vhgl/4lTx
 hmQ3r6YSzyLZEMtJ8kBDYBb8ZDirQTK5LrhDVeRlXxojUcOVclNQxeHBc
 BrLCmL+TBeN3HnJyZt2/d73Skpl5laNo3sG/bQQ5e54Du1kKL/Y+OuJE3
 cpjnCmv9NAqOA47m17VoebJyOS9Gnoys2HkV8PrMBA8iBiNstGiJ0gea3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="269765404"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="269765404"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 11:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="566820996"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 12 May 2022 11:00:43 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npD7D-000Kmd-3P;
 Thu, 12 May 2022 18:00:43 +0000
Date: Fri, 13 May 2022 01:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] KVM: PPC: Book3s: Remove real mode interrupt
 controller hcalls handlers
Message-ID: <202205130131.pJEWLeCR-lkp@intel.com>
References: <20220509071150.181250-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509071150.181250-1-aik@ozlabs.ru>
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
Cc: kbuild-all@lists.01.org, Fabiano Rosas <farosas@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexey,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/topic/ppc-kvm]
[also build test ERROR on v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Kardashevskiy/KVM-PPC-Book3s-Remove-real-mode-interrupt-controller-hcalls-handlers/20220509-151356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
config: powerpc64-defconfig (https://download.01.org/0day-ci/archive/20220513/202205130131.pJEWLeCR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5689429d96c7921451769fa24e3d037147c7da11
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexey-Kardashevskiy/KVM-PPC-Book3s-Remove-real-mode-interrupt-controller-hcalls-handlers/20220509-151356
        git checkout 5689429d96c7921451769fa24e3d037147c7da11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/kvm/book3s_hv_rm_xics.c:482:15: error: no previous prototype for 'xics_rm_h_xirr_x' [-Werror=missing-prototypes]
     482 | unsigned long xics_rm_h_xirr_x(struct kvm_vcpu *vcpu)
         |               ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/xics_rm_h_xirr_x +482 arch/powerpc/kvm/book3s_hv_rm_xics.c

   481	
 > 482	unsigned long xics_rm_h_xirr_x(struct kvm_vcpu *vcpu)
   483	{
   484		vcpu->arch.regs.gpr[5] = get_tb();
   485		return xics_rm_h_xirr(vcpu);
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
