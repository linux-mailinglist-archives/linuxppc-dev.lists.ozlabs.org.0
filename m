Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB152D748
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 17:19:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3tn92GVBz2yyh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 01:19:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nb3friqR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Nb3friqR; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3tmS2PSvz2yL6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 01:18:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652973528; x=1684509528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9Zsg46ZEcQlkoKtsE67ncfy4PgbeqNyaojjUkYedI74=;
 b=Nb3friqRvbBpXZQRVPik6VGx/Q7aBZZa/83/VvbZs3yvtog/6nM7WZEM
 woqp446j2+4CzGvoUvAjB3fkgb4aGdT130i+3IbWLRCoEjicx4jUG3YDT
 KC8+YAVogr4RTrTAV7MrKqOoqC8bhI2+ZEIIYemC6WaJambHi7CumCNMK
 3gh/jQLf/HIDOdaswrWJ7RitA6TYPf1RILCHLQFjFl9qHO/Q8STZTBaQ1
 pU5XX/Gtb3989O2quQhJL6nD4NZrGi637MGyvAOb5mcprfmCSTCZeAx77
 +u38BvyQup5a5s5qgUd4KG/o8bKwr/TmqDXJLCpfc4A7z0N/L48yL9MX7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="335291179"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="335291179"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 08:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="674059304"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 19 May 2022 08:18:41 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrhvE-0003gJ-P0;
 Thu, 19 May 2022 15:18:40 +0000
Date: Thu, 19 May 2022 23:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Eric Biederman <ebiederm@xmission.com>
Subject: Re: [PATCH v2] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-ID: <202205192320.CoXevcfR-lkp@intel.com>
References: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi "Naveen,

I love your patch! Yet something to improve:

[auto build test ERROR on f993aed406eaf968ba3867a76bb46c95336a33d0]

url:    https://github.com/intel-lab-lkp/linux/commits/Naveen-N-Rao/kexec_file-Drop-weak-attribute-from-arch_kexec_apply_relocations-_add/20220519-171432
base:   f993aed406eaf968ba3867a76bb46c95336a33d0
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20220519/202205192320.CoXevcfR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/67171688c71cb5b05f26e0dfc45eec8d8d1428ff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Naveen-N-Rao/kexec_file-Drop-weak-attribute-from-arch_kexec_apply_relocations-_add/20220519-171432
        git checkout 67171688c71cb5b05f26e0dfc45eec8d8d1428ff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/machine_kexec_reloc.c:3:
>> arch/s390/include/asm/kexec.h:89:38: error: unknown type name 'Elf_Shdr'; did you mean 'elf_shdr'?
      89 |                                      Elf_Shdr *section,
         |                                      ^~~~~~~~
         |                                      elf_shdr
   arch/s390/include/asm/kexec.h:90:44: error: unknown type name 'Elf_Shdr'
      90 |                                      const Elf_Shdr *relsec,
         |                                            ^~~~~~~~
   arch/s390/include/asm/kexec.h:91:44: error: unknown type name 'Elf_Shdr'
      91 |                                      const Elf_Shdr *symtab);
         |                                            ^~~~~~~~


vim +89 arch/s390/include/asm/kexec.h

    85	
    86	#ifdef CONFIG_KEXEC_FILE
    87	struct purgatory_info;
    88	int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
  > 89					     Elf_Shdr *section,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
