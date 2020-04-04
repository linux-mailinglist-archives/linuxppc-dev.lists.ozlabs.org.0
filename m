Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20F19E7CA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 23:42:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vqzG6rThzDrbt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 07:42:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vqxk01GszDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 07:41:20 +1000 (AEST)
IronPort-SDR: 4tSt+o43uEiB6V9QgMEeL+iT1lg6lF+XhldAfsKT4v30b7FLND4RZ7WHCSL2h0K1K2EfjMPFRD
 FRmpR3dxGOVg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2020 14:41:16 -0700
IronPort-SDR: SlMkoB6qus+lksYqoztENrZVYbNTYws1uaiHMT4tr/z293o2ye5Cm7XliyDfotl4pbqNz2/Y4N
 gRQgsyH4axhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,345,1580803200"; 
 d="gz'50?scan'50,208,50";a="397092357"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 04 Apr 2020 14:41:15 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jKqXS-000Fj1-J9; Sun, 05 Apr 2020 05:41:14 +0800
Date: Sun, 5 Apr 2020 05:40:41 +0800
From: kbuild test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 13/14] powerpc/64s: system reset do not trace
Message-ID: <202004050550.dvqrCA9o%lkp@intel.com>
References: <20200403132622.130394-14-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20200403132622.130394-14-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on next-20200404]
[cannot apply to v5.6]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64-machine-check-and-system-reset-fixes/20200405-030723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/traps.c: In function 'system_reset_exception':
>> arch/powerpc/kernel/traps.c:446:22: error: 'local_paca' undeclared (first use in this function); did you mean 'local_dec'?
     446 |  u8 ftrace_enabled = local_paca->ftrace_enabled;
         |                      ^~~~~~~~~~
         |                      local_dec
   arch/powerpc/kernel/traps.c:446:22: note: each undeclared identifier is reported only once for each function it appears in

vim +446 arch/powerpc/kernel/traps.c

   440	
   441	void system_reset_exception(struct pt_regs *regs)
   442	{
   443		unsigned long hsrr0, hsrr1;
   444		bool nested = in_nmi();
   445		bool saved_hsrrs = false;
 > 446		u8 ftrace_enabled = local_paca->ftrace_enabled;
   447	
   448		local_paca->ftrace_enabled = 0;
   449	
   450		/*
   451		 * Avoid crashes in case of nested NMI exceptions. Recoverability
   452		 * is determined by RI and in_nmi
   453		 */
   454		if (!nested)
   455			nmi_enter();
   456	
   457		/*
   458		 * System reset can interrupt code where HSRRs are live and MSR[RI]=1.
   459		 * The system reset interrupt itself may clobber HSRRs (e.g., to call
   460		 * OPAL), so save them here and restore them before returning.
   461		 *
   462		 * Machine checks don't need to save HSRRs, as the real mode handler
   463		 * is careful to avoid them, and the regular handler is not delivered
   464		 * as an NMI.
   465		 */
   466		if (cpu_has_feature(CPU_FTR_HVMODE)) {
   467			hsrr0 = mfspr(SPRN_HSRR0);
   468			hsrr1 = mfspr(SPRN_HSRR1);
   469			saved_hsrrs = true;
   470		}
   471	
   472		hv_nmi_check_nonrecoverable(regs);
   473	
   474		__this_cpu_inc(irq_stat.sreset_irqs);
   475	
   476		/* See if any machine dependent calls */
   477		if (ppc_md.system_reset_exception) {
   478			if (ppc_md.system_reset_exception(regs))
   479				goto out;
   480		}
   481	
   482		if (debugger(regs))
   483			goto out;
   484	
   485		kmsg_dump(KMSG_DUMP_OOPS);
   486		/*
   487		 * A system reset is a request to dump, so we always send
   488		 * it through the crashdump code (if fadump or kdump are
   489		 * registered).
   490		 */
   491		crash_fadump(regs, "System Reset");
   492	
   493		crash_kexec(regs);
   494	
   495		/*
   496		 * We aren't the primary crash CPU. We need to send it
   497		 * to a holding pattern to avoid it ending up in the panic
   498		 * code.
   499		 */
   500		crash_kexec_secondary(regs);
   501	
   502		/*
   503		 * No debugger or crash dump registered, print logs then
   504		 * panic.
   505		 */
   506		die("System Reset", regs, SIGABRT);
   507	
   508		mdelay(2*MSEC_PER_SEC); /* Wait a little while for others to print */
   509		add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
   510		nmi_panic(regs, "System Reset");
   511	
   512	out:
   513	#ifdef CONFIG_PPC_BOOK3S_64
   514		BUG_ON(get_paca()->in_nmi == 0);
   515		if (get_paca()->in_nmi > 1)
   516			nmi_panic(regs, "Unrecoverable nested System Reset");
   517	#endif
   518		/* Must die if the interrupt is not recoverable */
   519		if (!(regs->msr & MSR_RI))
   520			nmi_panic(regs, "Unrecoverable System Reset");
   521	
   522		if (saved_hsrrs) {
   523			mtspr(SPRN_HSRR0, hsrr0);
   524			mtspr(SPRN_HSRR1, hsrr1);
   525		}
   526	
   527		if (!nested)
   528			nmi_exit();
   529	
   530		local_paca->ftrace_enabled = ftrace_enabled;
   531	
   532		/* What should we do here? We could issue a shutdown or hard reset. */
   533	}
   534	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--gBBFr7Ir9EOA20Yy
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--gBBFr7Ir9EOA20Yy--
