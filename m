Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA9497F8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 13:29:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj8S95ng2z3cCj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 23:29:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UE45srOK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UE45srOK; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj8RS2lf8z30MQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 23:28:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643027332; x=1674563332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ynT/qixLnUd/rCOCLxvQhigT+gasAy3POU2QKgKgKvQ=;
 b=UE45srOKzaTsveNY96HP9nQv4lnslqnkE0XvMIpqM7SpdVeZRjtKb6+e
 x4BEQoDIap66OL47vjFDAnviiGNP80Kw2RgxqDkPqR5y+pIHdyilpPSzV
 X7yUSnc8ODVsjoAucJVyZELhcureA3wvqqnaYT8kZIyGoqcJIgN/Q1PWc
 3FGMa2tSC1Cla3qEeBnqAGjLI4OzRqbkts37/FVgcxsd1uBDVwWaCWZwm
 8NroCs632khg9/sftj1XVGPKsv/IEgUIp73YqT/dlLGMMN/JgpntUe8pm
 6VC0mkCzjIBIe9NuhbxLP2lww+PXw8aekZ6iUzyo3elQ6ZFdEASjFFBQR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226013572"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="226013572"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 04:27:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="695405990"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 24 Jan 2022 04:27:40 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nByRf-000IJC-DB; Mon, 24 Jan 2022 12:27:39 +0000
Date: Mon, 24 Jan 2022 20:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH 7/7] powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC
 on book3s/32 and 8xx
Message-ID: <202201242036.OjeEPlOb-lkp@intel.com>
References: <ff7a8bdc9a90a77de2ebc059beb4f644b34186c1.1643015752.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff7a8bdc9a90a77de2ebc059beb4f644b34186c1.1643015752.git.christophe.leroy@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 kbuild-all@lists.01.org,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on powerpc/next linus/master jeyu/modules-next v5.17-rc1 next-20220124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Allocate-module-text-and-data-separately/20220124-172517
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220124/202201242036.OjeEPlOb-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2a5f7a254dd5c1efcfb852f5747632c85582016d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/Allocate-module-text-and-data-separately/20220124-172517
        git checkout 2a5f7a254dd5c1efcfb852f5747632c85582016d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/debug/kdb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/debug/kdb/kdb_main.c: In function 'kdb_lsmod':
>> kernel/debug/kdb/kdb_main.c:2027:38: warning: format '%p' expects a matching 'void *' argument [-Wformat=]
    2027 |                 kdb_printf("/%8u  0x%px ", mod->data_layout.size);
         |                                     ~^
         |                                      |
         |                                      void *


vim +2027 kernel/debug/kdb/kdb_main.c

5d5314d6795f3c1 Jason Wessel     2010-05-20  2006  
5d5314d6795f3c1 Jason Wessel     2010-05-20  2007  #if defined(CONFIG_MODULES)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2008  /*
5d5314d6795f3c1 Jason Wessel     2010-05-20  2009   * kdb_lsmod - This function implements the 'lsmod' command.  Lists
5d5314d6795f3c1 Jason Wessel     2010-05-20  2010   *	currently loaded kernel modules.
5d5314d6795f3c1 Jason Wessel     2010-05-20  2011   *	Mostly taken from userland lsmod.
5d5314d6795f3c1 Jason Wessel     2010-05-20  2012   */
5d5314d6795f3c1 Jason Wessel     2010-05-20  2013  static int kdb_lsmod(int argc, const char **argv)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2014  {
5d5314d6795f3c1 Jason Wessel     2010-05-20  2015  	struct module *mod;
5d5314d6795f3c1 Jason Wessel     2010-05-20  2016  
5d5314d6795f3c1 Jason Wessel     2010-05-20  2017  	if (argc != 0)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2018  		return KDB_ARGCOUNT;
5d5314d6795f3c1 Jason Wessel     2010-05-20  2019  
5d5314d6795f3c1 Jason Wessel     2010-05-20  2020  	kdb_printf("Module                  Size  modstruct     Used by\n");
5d5314d6795f3c1 Jason Wessel     2010-05-20  2021  	list_for_each_entry(mod, kdb_modules, list) {
0d21b0e3477395e Rusty Russell    2013-01-12  2022  		if (mod->state == MODULE_STATE_UNFORMED)
0d21b0e3477395e Rusty Russell    2013-01-12  2023  			continue;
5d5314d6795f3c1 Jason Wessel     2010-05-20  2024  
299a20e0bead4b7 Christophe Leroy 2022-01-24  2025  		kdb_printf("%-20s%8u", mod->name, mod->core_layout.size);
299a20e0bead4b7 Christophe Leroy 2022-01-24  2026  #ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
299a20e0bead4b7 Christophe Leroy 2022-01-24 @2027  		kdb_printf("/%8u  0x%px ", mod->data_layout.size);
299a20e0bead4b7 Christophe Leroy 2022-01-24  2028  #endif
299a20e0bead4b7 Christophe Leroy 2022-01-24  2029  		kdb_printf("  0x%px ", (void *)mod);
5d5314d6795f3c1 Jason Wessel     2010-05-20  2030  #ifdef CONFIG_MODULE_UNLOAD
d5db139ab376464 Rusty Russell    2015-01-22  2031  		kdb_printf("%4d ", module_refcount(mod));
5d5314d6795f3c1 Jason Wessel     2010-05-20  2032  #endif
5d5314d6795f3c1 Jason Wessel     2010-05-20  2033  		if (mod->state == MODULE_STATE_GOING)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2034  			kdb_printf(" (Unloading)");
5d5314d6795f3c1 Jason Wessel     2010-05-20  2035  		else if (mod->state == MODULE_STATE_COMING)
5d5314d6795f3c1 Jason Wessel     2010-05-20  2036  			kdb_printf(" (Loading)");
5d5314d6795f3c1 Jason Wessel     2010-05-20  2037  		else
5d5314d6795f3c1 Jason Wessel     2010-05-20  2038  			kdb_printf(" (Live)");
568fb6f42ac6851 Christophe Leroy 2018-09-27  2039  		kdb_printf(" 0x%px", mod->core_layout.base);
299a20e0bead4b7 Christophe Leroy 2022-01-24  2040  #ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
299a20e0bead4b7 Christophe Leroy 2022-01-24  2041  		kdb_printf("/0x%px", mod->data_layout.base);
299a20e0bead4b7 Christophe Leroy 2022-01-24  2042  #endif
5d5314d6795f3c1 Jason Wessel     2010-05-20  2043  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
