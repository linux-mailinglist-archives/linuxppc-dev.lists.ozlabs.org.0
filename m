Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F911CBCE0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 05:15:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JslR4vrSzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 13:15:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JsjJ6YLwzDr6Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 13:13:32 +1000 (AEST)
IronPort-SDR: /u/ayIW9my/YBR7aPvjBs/1ffoeDHAXlQ0l+3T7w/jGL7/8RPR47qSQSCJQqvRmaRzOYdoBDQ4
 5Uty8YRkQ5lw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 20:13:29 -0700
IronPort-SDR: 6Az0y0rDLxbU+fYn5+/3RgyK5+Vcb2JAYtiwtEFHIletIWzuLo7CaZWbhVjep1RwG/LC2A5NzY
 2MONLUfCiyUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,370,1583222400"; 
 d="gz'50?scan'50,208,50";a="285672355"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 08 May 2020 20:13:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jXFvb-0007x4-6c; Sat, 09 May 2020 11:13:27 +0800
Date: Sat, 9 May 2020 11:13:13 +0800
From: kbuild test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 11/16] powerpc/64s: machine check interrupt update NMI
 accounting
Message-ID: <202005091105.sXZ24DNr%lkp@intel.com>
References: <20200508043408.886394-12-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <20200508043408.886394-12-npiggin@gmail.com>
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
Cc: kbuild-all@lists.01.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on tip/perf/core v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-machine-check-and-system-reset-fixes/20200509-030554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-r002-20200509 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from arch/powerpc/include/asm/mmu.h:130,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from arch/powerpc/kernel/process.c:14:
   arch/powerpc/kernel/process.c: In function 'show_regs':
>> arch/powerpc/kernel/process.c:1425:74: error: 'struct paca_struct' has no member named 'in_nmi'
    1425 |  pr_cont("IRQMASK: %lx IN_NMI:%d IN_MCE:%d", regs->softe, (int)get_paca()->in_nmi, (int)get_paca()->in_mce);
         |                                                                          ^~
   include/linux/printk.h:312:26: note: in definition of macro 'pr_cont'
     312 |  printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~
>> arch/powerpc/kernel/process.c:1425:99: error: 'struct paca_struct' has no member named 'in_mce'
    1425 |  pr_cont("IRQMASK: %lx IN_NMI:%d IN_MCE:%d", regs->softe, (int)get_paca()->in_nmi, (int)get_paca()->in_mce);
         |                                                                                                   ^~
   include/linux/printk.h:312:26: note: in definition of macro 'pr_cont'
     312 |  printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~

vim +1425 arch/powerpc/kernel/process.c

  1401	
  1402	void show_regs(struct pt_regs * regs)
  1403	{
  1404		int i, trap;
  1405	
  1406		show_regs_print_info(KERN_DEFAULT);
  1407	
  1408		printk("NIP:  "REG" LR: "REG" CTR: "REG"\n",
  1409		       regs->nip, regs->link, regs->ctr);
  1410		printk("REGS: %px TRAP: %04lx   %s  (%s)\n",
  1411		       regs, regs->trap, print_tainted(), init_utsname()->release);
  1412		printk("MSR:  "REG" ", regs->msr);
  1413		print_msr_bits(regs->msr);
  1414		pr_cont("  CR: %08lx  XER: %08lx\n", regs->ccr, regs->xer);
  1415		trap = TRAP(regs);
  1416		if ((TRAP(regs) != 0xc00) && cpu_has_feature(CPU_FTR_CFAR))
  1417			pr_cont("CFAR: "REG" ", regs->orig_gpr3);
  1418		if (trap == 0x200 || trap == 0x300 || trap == 0x600)
  1419	#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
  1420			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
  1421	#else
  1422			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
  1423	#endif
  1424	#ifdef CONFIG_PPC64
> 1425		pr_cont("IRQMASK: %lx IN_NMI:%d IN_MCE:%d", regs->softe, (int)get_paca()->in_nmi, (int)get_paca()->in_mce);
  1426	#endif
  1427	#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
  1428		if (MSR_TM_ACTIVE(regs->msr))
  1429			pr_cont("\nPACATMSCRATCH: %016llx ", get_paca()->tm_scratch);
  1430	#endif
  1431	
  1432		for (i = 0;  i < 32;  i++) {
  1433			if ((i % REGS_PER_LINE) == 0)
  1434				pr_cont("\nGPR%02d: ", i);
  1435			pr_cont(REG " ", regs->gpr[i]);
  1436			if (i == LAST_VOLATILE && !FULL_REGS(regs))
  1437				break;
  1438		}
  1439		pr_cont("\n");
  1440	#ifdef CONFIG_KALLSYMS
  1441		/*
  1442		 * Lookup NIP late so we have the best change of getting the
  1443		 * above info out without failing
  1444		 */
  1445		printk("NIP ["REG"] %pS\n", regs->nip, (void *)regs->nip);
  1446		printk("LR ["REG"] %pS\n", regs->link, (void *)regs->link);
  1447	#endif
  1448		show_stack(current, (unsigned long *) regs->gpr[1]);
  1449		if (!user_mode(regs))
  1450			show_instructions(regs);
  1451	}
  1452	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--0OAP2g/MAC+5xKAE
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
slUuSfwHPsO3kP2YAQA=

--0OAP2g/MAC+5xKAE--
