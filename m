Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6007339AF52
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 03:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx4KQ4JzHz3c0Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 11:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx4Jt3KLwz308n
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 11:03:40 +1000 (AEST)
IronPort-SDR: 1uq/2O87yFnVKhFButMXc0iB2V0jinCS88SngWAbxoiUWBxVk5H7KYpiRddKxbAufKJNZNptOU
 XOC4RxHpG0yQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="225507292"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
 d="gz'50?scan'50,208,50";a="225507292"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 18:03:35 -0700
IronPort-SDR: l19ax4ZVtkYuXBilfgJpY4wNjeU6XdQIDl/fkq0CuKeWr3TBXnTfXEt0X8C/N9LgrvKbHPsPFJ
 r5I8a0igEADA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
 d="gz'50?scan'50,208,50";a="475279900"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Jun 2021 18:03:33 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1loyFJ-0006Xb-5C; Fri, 04 Jun 2021 01:03:33 +0000
Date: Fri, 4 Jun 2021 09:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/8xx: Allow disabling KUAP at boot time
Message-ID: <202106040819.H1u8TBpj-lkp@intel.com>
References: <4cd1c10f45220c5f78fc13e1731a696037a4d559.1622710910.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <4cd1c10f45220c5f78fc13e1731a696037a4d559.1622710910.git.christophe.leroy@csgroup.eu>
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


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.13-rc4 next-20210603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-8xx-Allow-disabling-KUAP-at-boot-time/20210603-170313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-tqm8xx_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/95e4b5f2179c23e263e6889852978227583762f5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-8xx-Allow-disabling-KUAP-at-boot-time/20210603-170313
        git checkout 95e4b5f2179c23e263e6889852978227583762f5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/kup.h:22,
                    from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   arch/powerpc/include/asm/nohash/32/kup-8xx.h: In function 'kuap_is_disabled':
>> arch/powerpc/include/asm/nohash/32/kup-8xx.h:18:9: error: implicit declaration of function 'static_branch_unlikely' [-Werror=implicit-function-declaration]
      18 |  return static_branch_unlikely(&disable_kuap_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/powerpc/include/asm/kup.h:22,
                    from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   arch/powerpc/include/asm/nohash/32/kup-8xx.h: In function 'kuap_is_disabled':
>> arch/powerpc/include/asm/nohash/32/kup-8xx.h:18:9: error: implicit declaration of function 'static_branch_unlikely' [-Werror=implicit-function-declaration]
      18 |  return static_branch_unlikely(&disable_kuap_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1227: prepare0] Error 2
   make[1]: Target 'modules_prepare' not remade because of errors.
   make: *** [Makefile:215: __sub-make] Error 2
   make: Target 'modules_prepare' not remade because of errors.
--
   In file included from arch/powerpc/include/asm/kup.h:22,
                    from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   arch/powerpc/include/asm/nohash/32/kup-8xx.h: In function 'kuap_is_disabled':
>> arch/powerpc/include/asm/nohash/32/kup-8xx.h:18:9: error: implicit declaration of function 'static_branch_unlikely' [-Werror=implicit-function-declaration]
      18 |  return static_branch_unlikely(&disable_kuap_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1227: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:215: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/static_branch_unlikely +18 arch/powerpc/include/asm/nohash/32/kup-8xx.h

    15	
    16	static __always_inline bool kuap_is_disabled(void)
    17	{
  > 18		return static_branch_unlikely(&disable_kuap_key);
    19	}
    20	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ew6BAiZeqk4r7MaW
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ew6BAiZeqk4r7MaW--
