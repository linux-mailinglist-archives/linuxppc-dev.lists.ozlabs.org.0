Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCA20C3DF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 21:49:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vPTN0KrTzDrCt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 05:49:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vPRN2JT7zDqDW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 05:47:21 +1000 (AEST)
IronPort-SDR: QaBTNB5/yFg4y+9N8pDujma18LlLjP+nPTfRVeLByQzn0ZpgAzgulhePOjDPmoCCho0z/JvSKS
 YS5R+KTF5LhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9665"; a="133142349"
X-IronPort-AV: E=Sophos;i="5.75,288,1589266800"; 
 d="gz'50?scan'50,208,50";a="133142349"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2020 12:47:17 -0700
IronPort-SDR: 2z3qhCgHG+IZSt+d/bMpfdDI/Fy4DK56Xzgf/clzrgsh/FTwXXg2ig0UESIkMpNqg4vzmpG8np
 BiVNo36XKjDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,288,1589266800"; 
 d="gz'50?scan'50,208,50";a="280465608"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 27 Jun 2020 12:47:14 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jpGnB-0002wy-Tn; Sat, 27 Jun 2020 19:47:13 +0000
Date: Sun, 28 Jun 2020 03:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] powerpc: inline doorbell sending functions
Message-ID: <202006280326.fcRFUNzs%lkp@intel.com>
References: <20200627150428.2525192-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20200627150428.2525192-2-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, kbuild-all@lists.01.org,
 Nicholas Piggin <npiggin@gmail.com>, Anton Blanchard <anton@linux.ibm.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on scottwood/next v5.8-rc2 next-20200626]
[cannot apply to kvm-ppc/kvm-ppc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-pseries-IPI-doorbell-improvements/20200627-230544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-c003-20200628 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:38:
   arch/powerpc/include/asm/dbell.h: In function 'doorbell_global_ipi':
>> arch/powerpc/include/asm/dbell.h:114:12: error: implicit declaration of function 'get_hard_smp_processor_id'; did you mean 'raw_smp_processor_id'? [-Werror=implicit-function-declaration]
     114 |  u32 tag = get_hard_smp_processor_id(cpu);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
         |            raw_smp_processor_id
   arch/powerpc/include/asm/dbell.h: In function 'doorbell_try_core_ipi':
>> arch/powerpc/include/asm/dbell.h:146:28: error: implicit declaration of function 'cpu_sibling_mask'; did you mean 'cpu_online_mask'? [-Werror=implicit-function-declaration]
     146 |  if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
         |                            ^~~~~~~~~~~~~~~~
         |                            cpu_online_mask
>> arch/powerpc/include/asm/dbell.h:146:28: warning: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
     146 |  if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                            |
         |                            int
   In file included from include/linux/workqueue.h:15,
                    from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   include/linux/cpumask.h:365:67: note: expected 'const struct cpumask *' but argument is of type 'int'
     365 | static inline int cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1175: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

vim +114 arch/powerpc/include/asm/dbell.h

   100	
   101	/*
   102	 * Doorbells must only be used if CPU_FTR_DBELL is available.
   103	 * msgsnd is used in HV, and msgsndp is used in !HV.
   104	 *
   105	 * These should be used by platform code that is aware of restrictions.
   106	 * Other arch code should use ->cause_ipi.
   107	 *
   108	 * doorbell_global_ipi() sends a dbell to any target CPU.
   109	 * Must be used only by architectures that address msgsnd target
   110	 * by PIR/get_hard_smp_processor_id.
   111	 */
   112	static inline void doorbell_global_ipi(int cpu)
   113	{
 > 114		u32 tag = get_hard_smp_processor_id(cpu);
   115	
   116		kvmppc_set_host_ipi(cpu);
   117		/* Order previous accesses vs. msgsnd, which is treated as a store */
   118		ppc_msgsnd_sync();
   119		ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
   120	}
   121	
   122	/*
   123	 * doorbell_core_ipi() sends a dbell to a target CPU in the same core.
   124	 * Must be used only by architectures that address msgsnd target
   125	 * by TIR/cpu_thread_in_core.
   126	 */
   127	static inline void doorbell_core_ipi(int cpu)
   128	{
   129		u32 tag = cpu_thread_in_core(cpu);
   130	
   131		kvmppc_set_host_ipi(cpu);
   132		/* Order previous accesses vs. msgsnd, which is treated as a store */
   133		ppc_msgsnd_sync();
   134		ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
   135	}
   136	
   137	/*
   138	 * Attempt to cause a core doorbell if destination is on the same core.
   139	 * Returns 1 on success, 0 on failure.
   140	 */
   141	static inline int doorbell_try_core_ipi(int cpu)
   142	{
   143		int this_cpu = get_cpu();
   144		int ret = 0;
   145	
 > 146		if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
   147			doorbell_core_ipi(cpu);
   148			ret = 1;
   149		}
   150	
   151		put_cpu();
   152	
   153		return ret;
   154	}
   155	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--mYCpIKhGyMATD0i+
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
jwEA

--mYCpIKhGyMATD0i+--
