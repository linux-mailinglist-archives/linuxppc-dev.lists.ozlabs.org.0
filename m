Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC61B1AE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 02:49:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495lM94gQnzDqyn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 10:49:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495lKW334fzDqvH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 10:47:50 +1000 (AEST)
IronPort-SDR: cqEAOfcRqMqlmnUHE+clQU0DSJ4QEXyyNMeEMMA4WoadxGjwLmuXh+K7FFAQsScUmAD3fi43oH
 gjgfr0eZZCgA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 17:47:46 -0700
IronPort-SDR: QRV/t2cGtAB3RGVRGhbIGi3RCufA7RuRqpL4oDisuvJ0i0TNmTAoO0E2p66NV/V8eu/3wddM8R
 VTzjqblewdSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,408,1580803200"; 
 d="gz'50?scan'50,208,50";a="365177640"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2020 17:47:43 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jQh4g-0002y6-Ct; Tue, 21 Apr 2020 08:47:42 +0800
Date: Tue, 21 Apr 2020 08:47:34 +0800
From: kbuild test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, michal.simek@xilinx.com,
 arnd@arndb.de
Subject: Re: [PATCH v3 02/13] powerpc/40x: Rework 40x PTE access and TLB miss
Message-ID: <202004210825.cYLr6dk8%lkp@intel.com>
References: <9988528a455bb8c9962e2ea9e8df06ebca8cded1.1586852082.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <9988528a455bb8c9962e2ea9e8df06ebca8cded1.1586852082.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on robh/for-next char-misc/char-misc-testing tip/locking/core linus/master v5.7-rc2 next-20200420]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Modernise-powerpc-40x/20200414-185156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-ppc40x_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/mm/nohash/40x.c: In function 'mmu_mapin_ram':
>> arch/powerpc/mm/nohash/40x.c:107:3: error: expected ',' or ';' before 'pmdp'
     107 |   pmdp = pmd_ptr_k(v);
         |   ^~~~

vim +107 arch/powerpc/mm/nohash/40x.c

14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26   90  
14e609d693ef67 arch/powerpc/mm/40x_mmu.c    Christophe Leroy       2019-02-21   91  unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26   92  {
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29   93  	unsigned long v, s, mapped;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26   94  	phys_addr_t p;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26   95  
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26   96  	v = KERNELBASE;
99c62dd773797b arch/powerpc/mm/40x_mmu.c    Kumar Gala             2008-04-16   97  	p = 0;
bd942ba3db60d3 arch/powerpc/mm/40x_mmu.c    Grant Likely           2007-10-31   98  	s = total_lowmem;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26   99  
bd942ba3db60d3 arch/powerpc/mm/40x_mmu.c    Grant Likely           2007-10-31  100  	if (__map_without_ltlbs)
bd942ba3db60d3 arch/powerpc/mm/40x_mmu.c    Grant Likely           2007-10-31  101  		return 0;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  102  
bd942ba3db60d3 arch/powerpc/mm/40x_mmu.c    Grant Likely           2007-10-31  103  	while (s >= LARGE_PAGE_SIZE_16M) {
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  104  		pmd_t *pmdp;
682f715365c25b arch/powerpc/mm/nohash/40x.c Christophe Leroy       2020-04-14  105  		unsigned long val = p | _PMD_SIZE_16M | _PAGE_EXEC | _PAGE_RW
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  106  
0b1c524caaae24 arch/powerpc/mm/nohash/40x.c Christophe Leroy       2020-01-09 @107  		pmdp = pmd_ptr_k(v);
f281b5d50c87ec arch/powerpc/mm/40x_mmu.c    Aneesh Kumar K.V       2015-12-01  108  		*pmdp++ = __pmd(val);
f281b5d50c87ec arch/powerpc/mm/40x_mmu.c    Aneesh Kumar K.V       2015-12-01  109  		*pmdp++ = __pmd(val);
f281b5d50c87ec arch/powerpc/mm/40x_mmu.c    Aneesh Kumar K.V       2015-12-01  110  		*pmdp++ = __pmd(val);
f281b5d50c87ec arch/powerpc/mm/40x_mmu.c    Aneesh Kumar K.V       2015-12-01  111  		*pmdp++ = __pmd(val);
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  112  
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  113  		v += LARGE_PAGE_SIZE_16M;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  114  		p += LARGE_PAGE_SIZE_16M;
bd942ba3db60d3 arch/powerpc/mm/40x_mmu.c    Grant Likely           2007-10-31  115  		s -= LARGE_PAGE_SIZE_16M;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  116  	}
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  117  
bd942ba3db60d3 arch/powerpc/mm/40x_mmu.c    Grant Likely           2007-10-31  118  	while (s >= LARGE_PAGE_SIZE_4M) {
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  119  		pmd_t *pmdp;
682f715365c25b arch/powerpc/mm/nohash/40x.c Christophe Leroy       2020-04-14  120  		unsigned long val = p | _PMD_SIZE_4M | _PAGE_EXEC | _PAGE_RW;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  121  
0b1c524caaae24 arch/powerpc/mm/nohash/40x.c Christophe Leroy       2020-01-09  122  		pmdp = pmd_ptr_k(v);
f281b5d50c87ec arch/powerpc/mm/40x_mmu.c    Aneesh Kumar K.V       2015-12-01  123  		*pmdp = __pmd(val);
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  124  
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  125  		v += LARGE_PAGE_SIZE_4M;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  126  		p += LARGE_PAGE_SIZE_4M;
bd942ba3db60d3 arch/powerpc/mm/40x_mmu.c    Grant Likely           2007-10-31  127  		s -= LARGE_PAGE_SIZE_4M;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  128  	}
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  129  
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  130  	mapped = total_lowmem - s;
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  131  
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  132  	/* If the size of RAM is not an exact power of two, we may not
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  133  	 * have covered RAM in its entirety with 16 and 4 MiB
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  134  	 * pages. Consequently, restrict the top end of RAM currently
95f72d1ed41a66 arch/powerpc/mm/40x_mmu.c    Yinghai Lu             2010-07-12  135  	 * allocable so that calls to the MEMBLOCK to allocate PTEs for "tail"
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  136  	 * coverage with normal-sized pages (or other reasons) do not
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  137  	 * attempt to allocate outside the allowed range.
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  138  	 */
cd3db0c4ca3d23 arch/powerpc/mm/40x_mmu.c    Benjamin Herrenschmidt 2010-07-06  139  	memblock_set_current_limit(mapped);
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  140  
5907630ffc2b2d arch/powerpc/mm/40x_mmu.c    Grant Erickson         2008-10-29  141  	return mapped;
14cf11af6cf608 arch/powerpc/mm/4xx_mmu.c    Paul Mackerras         2005-09-26  142  }
cd3db0c4ca3d23 arch/powerpc/mm/40x_mmu.c    Benjamin Herrenschmidt 2010-07-06  143  

:::::: The code at line 107 was first introduced by commit
:::::: 0b1c524caaae2428b20e714297243e5551251eb5 powerpc/32: refactor pmd_offset(pud_offset(pgd_offset...

:::::: TO: Christophe Leroy <christophe.leroy@c-s.fr>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--FL5UXtIhxfXey3p5
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
eqn5H/qbKY7Z8wAA

--FL5UXtIhxfXey3p5--
