Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 186861B0019
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 05:05:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495BQP0Qx8zDqCZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 13:05:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=philip.li@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495BMf1bqNzDqCK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 13:02:44 +1000 (AEST)
IronPort-SDR: u3izm1IjYzzXNoLz3phC22kH7g3xZ+1WYOHsOpjjgrmhq8CLrbS6cVT73VI+IkWMDaXlXO4Iqi
 EBQXM9oTlQ5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 20:02:40 -0700
IronPort-SDR: GzbBQuww+/MpapV0yqsCRy2s2OjNnmg4/AZlX1H3s2b78NhIjXVYoV4PYK0uo3Uy8LM9L4hdWi
 ZB3Zkh3UmWVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; d="scan'208";a="333779161"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2020 20:02:37 -0700
Date: Mon, 20 Apr 2020 11:02:36 +0800
From: Philip Li <philip.li@intel.com>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [PATCH] papr/scm: Add bad memory ranges to nvdimm bad ranges
Message-ID: <20200420030236.GG28344@intel.com>
References: <20200401074741.1562361-1-santosh@fossix.org>
 <202004131149.8rYYWgAe%lkp@intel.com>
 <87a73fiqd5.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a73fiqd5.fsf@santosiv.in.ibm.com>
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
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 13, 2020 at 04:50:38PM +0530, Santosh Sivaraj wrote:
> kbuild test robot <lkp@intel.com> writes:
> 
> > Hi Santosh,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on powerpc/next]
> > [also build test ERROR on v5.7-rc1 next-20200412]
> > [if your patch is applied to the wrong git tree, please drop us a note to help
> > improve the system. BTW, we also suggest to use '--base' option to specify the
> > base tree in git format-patch, please see
> > https://stackoverflow.com/a/37406982]
> 
> This patch depends on "powerpc/mce: Add MCE notification chain" [1].
got it, thanks for input, though currently the bot is not able to figure
out this yet for two separated patch sets, here the --base may help.

> 
> [1]: https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/
> 
> Thanks,
> Santosh
> 
> >
> > url:    https://github.com/0day-ci/linux/commits/Santosh-Sivaraj/papr-scm-Add-bad-memory-ranges-to-nvdimm-bad-ranges/20200401-171233
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> > config: powerpc-allyesconfig (attached as .config)
> > compiler: powerpc64-linux-gcc (GCC) 9.3.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=9.3.0 make.cross ARCH=powerpc 
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    arch/powerpc/platforms/pseries/papr_scm.c: In function 'papr_scm_init':
> >>> arch/powerpc/platforms/pseries/papr_scm.c:584:3: error: implicit declaration of function 'mce_register_notifier'; did you mean 'bus_register_notifier'? [-Werror=implicit-function-declaration]
> >      584 |   mce_register_notifier(&mce_ue_nb);
> >          |   ^~~~~~~~~~~~~~~~~~~~~
> >          |   bus_register_notifier
> >    arch/powerpc/platforms/pseries/papr_scm.c: In function 'papr_scm_exit':
> >>> arch/powerpc/platforms/pseries/papr_scm.c:592:2: error: implicit declaration of function 'mce_unregister_notifier'; did you mean 'bus_unregister_notifier'? [-Werror=implicit-function-declaration]
> >      592 |  mce_unregister_notifier(&mce_ue_nb);
> >          |  ^~~~~~~~~~~~~~~~~~~~~~~
> >          |  bus_unregister_notifier
> >    cc1: some warnings being treated as errors
> >
> > vim +584 arch/powerpc/platforms/pseries/papr_scm.c
> >
> >    577	
> >    578	static int __init papr_scm_init(void)
> >    579	{
> >    580		int ret;
> >    581	
> >    582		ret = platform_driver_register(&papr_scm_driver);
> >    583		if (!ret)
> >  > 584			mce_register_notifier(&mce_ue_nb);
> >    585	
> >    586		return ret;
> >    587	}
> >    588	module_init(papr_scm_init);
> >    589	
> >    590	static void __exit papr_scm_exit(void)
> >    591	{
> >  > 592		mce_unregister_notifier(&mce_ue_nb);
> >    593		platform_driver_unregister(&papr_scm_driver);
> >    594	}
> >    595	module_exit(papr_scm_exit);
> >    596	
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
