Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B61187789
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:42:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hGB53DJTzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 12:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hG8K5lkFzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 12:40:26 +1100 (AEDT)
IronPort-SDR: ykk7F6N/sElIzHJc8cHw4UACO4ZYlXC2WMpqpFdyIVKYPkJicx88BJkr849yO4e5GFxUsybfsV
 GyN34T2aUPZQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2020 18:40:22 -0700
IronPort-SDR: BFdP4VUnjzD0byJLA5QarsOraFjFQiBfFARxJaiFmgd0nDKeZn3527djWuxTQSoQjYAn0RMO8H
 jwa8onhW+lfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,562,1574150400"; 
 d="gz'50?scan'50,208,50";a="323685271"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 16 Mar 2020 18:40:19 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jE1DM-0002Ii-4e; Tue, 17 Mar 2020 09:40:16 +0800
Date: Tue, 17 Mar 2020 09:39:39 +0800
From: kbuild test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1 39/46] powerpc/8xx: Add a function to early map kernel
 via huge pages
Message-ID: <202003170938.Z0IuUore%lkp@intel.com>
References: <abaf66aaebfd988d835dc9520bccedd546ee95c4.1584360344.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <abaf66aaebfd988d835dc9520bccedd546ee95c4.1584360344.git.christophe.leroy@c-s.fr>
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
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20200316]
[cannot apply to powerpc/next v5.6-rc6 v5.6-rc5 v5.6-rc4 v5.6-rc6]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Use-hugepages-to-map-kernel-mem-on-8xx/20200317-065610
base:    8548fd2f20ed19b0e8c0585b71fdfde1ae00ae3c
config: powerpc-tqm8xx_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.2.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/fault.c:33:
   include/linux/hugetlb.h: In function 'hstate_inode':
>> include/linux/hugetlb.h:522:9: error: implicit declaration of function 'HUGETLBFS_SB'; did you mean 'HUGETLBFS_MAGIC'? [-Werror=implicit-function-declaration]
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |         ^~~~~~~~~~~~
         |         HUGETLBFS_MAGIC
>> include/linux/hugetlb.h:522:30: error: invalid type argument of '->' (have 'int')
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |                              ^~
   cc1: all warnings being treated as errors
--
   In file included from arch/powerpc/mm/mem.c:30:
   include/linux/hugetlb.h: In function 'hstate_inode':
>> include/linux/hugetlb.h:522:9: error: implicit declaration of function 'HUGETLBFS_SB' [-Werror=implicit-function-declaration]
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |         ^~~~~~~~~~~~
>> include/linux/hugetlb.h:522:30: error: invalid type argument of '->' (have 'int')
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |                              ^~
   cc1: all warnings being treated as errors
--
   In file included from arch/powerpc/mm/nohash/8xx.c:12:
   include/linux/hugetlb.h: In function 'hstate_inode':
>> include/linux/hugetlb.h:522:9: error: implicit declaration of function 'HUGETLBFS_SB' [-Werror=implicit-function-declaration]
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |         ^~~~~~~~~~~~
>> include/linux/hugetlb.h:522:30: error: invalid type argument of '->' (have 'int')
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |                              ^~
   At top level:
   arch/powerpc/mm/nohash/8xx.c:73:18: error: '__early_map_kernel_hugepage' defined but not used [-Werror=unused-function]
      73 | static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from arch/powerpc//mm/nohash/8xx.c:12:
   include/linux/hugetlb.h: In function 'hstate_inode':
>> include/linux/hugetlb.h:522:9: error: implicit declaration of function 'HUGETLBFS_SB' [-Werror=implicit-function-declaration]
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |         ^~~~~~~~~~~~
>> include/linux/hugetlb.h:522:30: error: invalid type argument of '->' (have 'int')
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |                              ^~
   At top level:
   arch/powerpc//mm/nohash/8xx.c:73:18: error: '__early_map_kernel_hugepage' defined but not used [-Werror=unused-function]
      73 | static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/migrate.h:8,
                    from kernel///sched/sched.h:53,
                    from kernel///sched/loadavg.c:9:
   include/linux/hugetlb.h: In function 'hstate_inode':
>> include/linux/hugetlb.h:522:9: error: implicit declaration of function 'HUGETLBFS_SB'; did you mean 'HUGETLBFS_MAGIC'? [-Werror=implicit-function-declaration]
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |         ^~~~~~~~~~~~
         |         HUGETLBFS_MAGIC
>> include/linux/hugetlb.h:522:30: error: invalid type argument of '->' (have 'int')
     522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
         |                              ^~
   cc1: some warnings being treated as errors

vim +522 include/linux/hugetlb.h

a5516438959d90 Andi Kleen 2008-07-23  519  
a137e1cc6d6e7d Andi Kleen 2008-07-23  520  static inline struct hstate *hstate_inode(struct inode *i)
a5516438959d90 Andi Kleen 2008-07-23  521  {
7fab358d90e6ba Chen Gang  2016-05-20 @522  	return HUGETLBFS_SB(i->i_sb)->hstate;
a5516438959d90 Andi Kleen 2008-07-23  523  }
a5516438959d90 Andi Kleen 2008-07-23  524  

:::::: The code at line 522 was first introduced by commit
:::::: 7fab358d90e6ba9d9cb702bee0c8a5f5c13bb6df include/linux/hugetlb*.h: clean up code

:::::: TO: Chen Gang <gang.chen.5i5j@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--X1bOJ3K7DJ5YkBrT
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--X1bOJ3K7DJ5YkBrT--
