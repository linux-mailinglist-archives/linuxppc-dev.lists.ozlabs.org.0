Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9BC2CC490
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 19:11:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmRqg3k7MzDrDT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 05:11:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmRn472tMzDr4q
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 05:09:07 +1100 (AEDT)
IronPort-SDR: VnYI/fzWJjs2za1j0po73G//rtqBGRpKKJ7fpolhpUEMcpXBRYtnf9pEnEInL1c9JppXo6jrVR
 9CUXlQ8W4Wdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="152314867"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
 d="gz'50?scan'50,208,50";a="152314867"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 10:09:02 -0800
IronPort-SDR: ASg8ObXOEr92P3NtvPEB3y4/C7aOF7wISufChGm7TZUgr4RoRRMJnxmfVmqK+lRG6+YgAuvwx3
 3ZjzTbXcvHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
 d="gz'50?scan'50,208,50";a="481653398"
Received: from lkp-server01.sh.intel.com (HELO 54133fc185c3) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 02 Dec 2020 10:09:00 -0800
Received: from kbuild by 54133fc185c3 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kkWYl-0000Gi-Q1; Wed, 02 Dec 2020 18:08:59 +0000
Date: Thu, 3 Dec 2020 02:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/kuap: Restore AMR after replaying soft
 interrupts
Message-ID: <202012030221.piDGNOKp-lkp@intel.com>
References: <20201202010952.7157-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20201202010952.7157-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, clang-built-linux@googlegroups.com,
 kbuild-all@lists.01.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexey,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on linus/master v5.10-rc6 next-20201201]
[cannot apply to scottwood/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexey-Kardashevskiy/powerpc-kuap-Restore-AMR-after-replaying-soft-interrupts/20201202-094132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-r024-20201202 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 2671fccf0381769276ca8246ec0499adcb9b0355)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6b38a9b10a8384beeaa820e1c935cc4cabdb951e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexey-Kardashevskiy/powerpc-kuap-Restore-AMR-after-replaying-soft-interrupts/20201202-094132
        git checkout 6b38a9b10a8384beeaa820e1c935cc4cabdb951e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/irq.c:31:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:100:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/irq.c:31:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:102:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/irq.c:31:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:104:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/irq.c:31:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:106:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/irq.c:31:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:108:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/kernel/irq.c:224:29: error: implicit declaration of function 'get_kuap' [-Werror,-Wimplicit-function-declaration]
           unsigned long kuap_state = get_kuap();
                                      ^
>> arch/powerpc/kernel/irq.c:313:2: error: implicit declaration of function 'set_kuap' [-Werror,-Wimplicit-function-declaration]
           set_kuap(kuap_state);
           ^
   arch/powerpc/kernel/irq.c:313:2: note: did you mean 'get_kuap'?
   arch/powerpc/kernel/irq.c:224:29: note: 'get_kuap' declared here
           unsigned long kuap_state = get_kuap();
                                      ^
   12 warnings and 2 errors generated.

vim +/get_kuap +224 arch/powerpc/kernel/irq.c

   214	
   215	void replay_soft_interrupts(void)
   216	{
   217		/*
   218		 * We use local_paca rather than get_paca() to avoid all
   219		 * the debug_smp_processor_id() business in this low level
   220		 * function
   221		 */
   222		unsigned char happened = local_paca->irq_happened;
   223		struct pt_regs regs;
 > 224		unsigned long kuap_state = get_kuap();
   225	
   226		ppc_save_regs(&regs);
   227		regs.softe = IRQS_ENABLED;
   228	
   229	again:
   230		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
   231			WARN_ON_ONCE(mfmsr() & MSR_EE);
   232	
   233		if (happened & PACA_IRQ_HARD_DIS) {
   234			/*
   235			 * We may have missed a decrementer interrupt if hard disabled.
   236			 * Check the decrementer register in case we had a rollover
   237			 * while hard disabled.
   238			 */
   239			if (!(happened & PACA_IRQ_DEC)) {
   240				if (decrementer_check_overflow())
   241					happened |= PACA_IRQ_DEC;
   242			}
   243		}
   244	
   245		/*
   246		 * Force the delivery of pending soft-disabled interrupts on PS3.
   247		 * Any HV call will have this side effect.
   248		 */
   249		if (firmware_has_feature(FW_FEATURE_PS3_LV1)) {
   250			u64 tmp, tmp2;
   251			lv1_get_version_info(&tmp, &tmp2);
   252		}
   253	
   254		/*
   255		 * Check if an hypervisor Maintenance interrupt happened.
   256		 * This is a higher priority interrupt than the others, so
   257		 * replay it first.
   258		 */
   259		if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (happened & PACA_IRQ_HMI)) {
   260			local_paca->irq_happened &= ~PACA_IRQ_HMI;
   261			regs.trap = 0xe60;
   262			handle_hmi_exception(&regs);
   263			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
   264				hard_irq_disable();
   265		}
   266	
   267		if (happened & PACA_IRQ_DEC) {
   268			local_paca->irq_happened &= ~PACA_IRQ_DEC;
   269			regs.trap = 0x900;
   270			timer_interrupt(&regs);
   271			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
   272				hard_irq_disable();
   273		}
   274	
   275		if (happened & PACA_IRQ_EE) {
   276			local_paca->irq_happened &= ~PACA_IRQ_EE;
   277			regs.trap = 0x500;
   278			do_IRQ(&regs);
   279			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
   280				hard_irq_disable();
   281		}
   282	
   283		if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (happened & PACA_IRQ_DBELL)) {
   284			local_paca->irq_happened &= ~PACA_IRQ_DBELL;
   285			if (IS_ENABLED(CONFIG_PPC_BOOK3E))
   286				regs.trap = 0x280;
   287			else
   288				regs.trap = 0xa00;
   289			doorbell_exception(&regs);
   290			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
   291				hard_irq_disable();
   292		}
   293	
   294		/* Book3E does not support soft-masking PMI interrupts */
   295		if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (happened & PACA_IRQ_PMI)) {
   296			local_paca->irq_happened &= ~PACA_IRQ_PMI;
   297			regs.trap = 0xf00;
   298			performance_monitor_exception(&regs);
   299			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
   300				hard_irq_disable();
   301		}
   302	
   303		happened = local_paca->irq_happened;
   304		if (happened & ~PACA_IRQ_HARD_DIS) {
   305			/*
   306			 * We are responding to the next interrupt, so interrupt-off
   307			 * latencies should be reset here.
   308			 */
   309			trace_hardirqs_on();
   310			trace_hardirqs_off();
   311			goto again;
   312		}
 > 313		set_kuap(kuap_state);
   314	}
   315	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--82I3+IH0IqGh5yIs
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
tjzvpWn6/wCIpnJX0GkBAA==

--82I3+IH0IqGh5yIs--
