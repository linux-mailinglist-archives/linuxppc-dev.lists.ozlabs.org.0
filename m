Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63898353092
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 22:59:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBsqL25Yhz3c7r
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 07:59:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBspz076Zz3bNd
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 07:58:45 +1100 (AEDT)
IronPort-SDR: veUMsUV0m1nK3XTicpuvZHyrjWMKqDa9q1uFdSrKX1N3zENyAgPuhYlErlJ6NKxGwEFT6HhqXD
 C2h+pNtjxofg==
X-IronPort-AV: E=McAfee;i="6000,8403,9942"; a="212811483"
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
 d="gz'50?scan'50,208,50";a="212811483"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 13:58:40 -0700
IronPort-SDR: 1DxzsxjEk5ZxfKIWkREdND0cUj95qR1auXB2s8sgXvl+nETc+/bbAw3KVeCVu2Dmhieu3O/wz/
 rCo05+ukCUEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
 d="gz'50?scan'50,208,50";a="517885487"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2021 13:58:38 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lSQsH-0007LU-D2; Fri, 02 Apr 2021 20:58:37 +0000
Date: Sat, 3 Apr 2021 04:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v5 31/48] KVM: PPC: Book3S HV P9: inline
 kvmhv_load_hv_regs_and_go into __kvmhv_vcpu_entry_p9
Message-ID: <202104030412.h8fIESGy-lkp@intel.com>
References: <20210401150325.442125-32-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20210401150325.442125-32-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.12-rc5 next-20210401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/KVM-PPC-Book3S-C-ify-the-P9-entry-exit-code/20210401-232743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-r033-20210402 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f2a35edda3ab6cba30fbfc362e163d5bc1e086d0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nicholas-Piggin/KVM-PPC-Book3S-C-ify-the-P9-entry-exit-code/20210401-232743
        git checkout f2a35edda3ab6cba30fbfc362e163d5bc1e086d0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/book3s_hv_interrupt.c: In function 'switch_mmu_to_guest_radix':
   arch/powerpc/kvm/book3s_hv_interrupt.c:61:46: error: 'struct kvm_vcpu_arch' has no member named 'nested'
      61 |  struct kvm_nested_guest *nested = vcpu->arch.nested;
         |                                              ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:80:2: error: implicit declaration of function 'kvmppc_check_need_tlb_flush' [-Werror=implicit-function-declaration]
      80 |  kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/processor.h:11,
                    from arch/powerpc/include/asm/thread_info.h:40,
                    from include/linux/thread_info.h:58,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/powerpc/kvm/book3s_hv_interrupt.c:3:
   arch/powerpc/kvm/book3s_hv_interrupt.c: In function 'switch_mmu_to_host_radix':
   arch/powerpc/kvm/book3s_hv_interrupt.c:88:28: error: 'struct kvm_arch' has no member named 'host_lpid'
      88 |  mtspr(SPRN_LPID, kvm->arch.host_lpid);
         |                            ^
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:90:28: error: 'struct kvm_arch' has no member named 'host_lpcr'
      90 |  mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
         |                            ^
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c: At top level:
   arch/powerpc/kvm/book3s_hv_interrupt.c:128:5: error: no previous prototype for 'kvmhv_vcpu_entry_p9' [-Werror=missing-prototypes]
     128 | int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr)
         |     ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/book3s_hv_interrupt.c: In function 'kvmhv_vcpu_entry_p9':
>> arch/powerpc/kvm/book3s_hv_interrupt.c:170:25: error: 'struct kvmppc_host_state' has no member named 'host_purr'; did you mean 'host_r1'?
     170 |  local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
         |                         ^~~~~~~~~
         |                         host_r1
>> arch/powerpc/kvm/book3s_hv_interrupt.c:171:25: error: 'struct kvmppc_host_state' has no member named 'host_spurr'; did you mean 'host_r1'?
     171 |  local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
         |                         ^~~~~~~~~~
         |                         host_r1
   In file included from arch/powerpc/include/asm/processor.h:11,
                    from arch/powerpc/include/asm/thread_info.h:40,
                    from include/linux/thread_info.h:58,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/powerpc/kvm/book3s_hv_interrupt.c:3:
>> arch/powerpc/kvm/book3s_hv_interrupt.c:187:31: error: 'struct kvmppc_host_state' has no member named 'fake_suspend'
     187 |        (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
         |                               ^
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:191:31: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     191 |  mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
         |                               ^~~~~~
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:192:31: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     192 |  mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
         |                               ^~~~~~
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:193:31: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     193 |  mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
         |                               ^~~~~~
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:194:31: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     194 |  mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
         |                               ^~~~~~
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:206:30: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     206 |  mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
         |                              ^~~~~~
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:207:30: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     207 |  mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
         |                              ^~~~~~
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   In file included from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/powerpc/kvm/book3s_hv_interrupt.c:3:
   arch/powerpc/kvm/book3s_hv_interrupt.c:213:26: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     213 |  WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
         |                          ^~~~~~
   include/asm-generic/bug.h:102:25: note: in definition of macro 'WARN_ON_ONCE'
     102 |  int __ret_warn_on = !!(condition);   \
         |                         ^~~~~~~~~
   arch/powerpc/kvm/book3s_hv_interrupt.c:214:28: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     214 |  WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
         |                            ^~~~~~
   include/asm-generic/bug.h:102:25: note: in definition of macro 'WARN_ON_ONCE'
     102 |  int __ret_warn_on = !!(condition);   \
         |                         ^~~~~~~~~
   In file included from arch/powerpc/include/asm/processor.h:11,
                    from arch/powerpc/include/asm/thread_info.h:40,
                    from include/linux/thread_info.h:58,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/powerpc/kvm/book3s_hv_interrupt.c:3:
   arch/powerpc/kvm/book3s_hv_interrupt.c:217:32: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     217 |  mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
         |                                ^~~~~~
   arch/powerpc/include/asm/reg.h:1393:33: note: in definition of macro 'mtspr'
    1393 |          : "r" ((unsigned long)(v)) \
         |                                 ^
   arch/powerpc/kvm/book3s_hv_interrupt.c:244:13: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     244 |  vcpu->arch.shregs.srr0 = mfspr(SPRN_SRR0);
         |             ^~~~~~
         |             regs
   arch/powerpc/kvm/book3s_hv_interrupt.c:245:13: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     245 |  vcpu->arch.shregs.srr1 = mfspr(SPRN_SRR1);
         |             ^~~~~~
         |             regs
   arch/powerpc/kvm/book3s_hv_interrupt.c:246:13: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     246 |  vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
         |             ^~~~~~
         |             regs
   arch/powerpc/kvm/book3s_hv_interrupt.c:247:13: error: 'struct kvm_vcpu_arch' has no member named 'shregs'; did you mean 'regs'?
     247 |  vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
         |             ^~~~~~
         |             regs
   arch/powerpc/kvm/book3s_hv_interrupt.c:281:13: error: 'struct kvm_vcpu_arch' has no member named 'emul_inst'
     281 |   vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
         |             ^
   In file included from arch/powerpc/include/asm/processor.h:11,
                    from arch/powerpc/include/asm/thread_info.h:40,
                    from include/linux/thread_info.h:58,


vim +170 arch/powerpc/kvm/book3s_hv_interrupt.c

   127	
   128	int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr)
   129	{
   130		struct kvm *kvm = vcpu->kvm;
   131		struct kvmppc_vcore *vc = vcpu->arch.vcore;
   132		s64 hdec;
   133		u64 tb, purr, spurr;
   134		u64 *exsave;
   135		unsigned long msr = mfmsr();
   136		int trap;
   137		unsigned long host_hfscr = mfspr(SPRN_HFSCR);
   138		unsigned long host_ciabr = mfspr(SPRN_CIABR);
   139		unsigned long host_dawr0 = mfspr(SPRN_DAWR0);
   140		unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
   141		unsigned long host_psscr = mfspr(SPRN_PSSCR);
   142		unsigned long host_pidr = mfspr(SPRN_PID);
   143		unsigned long host_dawr1 = 0;
   144		unsigned long host_dawrx1 = 0;
   145	
   146		if (cpu_has_feature(CPU_FTR_DAWR1)) {
   147			host_dawr1 = mfspr(SPRN_DAWR1);
   148			host_dawrx1 = mfspr(SPRN_DAWRX1);
   149		}
   150	
   151		tb = mftb();
   152		hdec = time_limit - tb;
   153		if (hdec < 0)
   154			return BOOK3S_INTERRUPT_HV_DECREMENTER;
   155	
   156		if (vc->tb_offset) {
   157			u64 new_tb = tb + vc->tb_offset;
   158			mtspr(SPRN_TBU40, new_tb);
   159			tb = mftb();
   160			if ((tb & 0xffffff) < (new_tb & 0xffffff))
   161				mtspr(SPRN_TBU40, new_tb + 0x1000000);
   162			vc->tb_offset_applied = vc->tb_offset;
   163		}
   164	
   165		if (vc->pcr)
   166			mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
   167		mtspr(SPRN_DPDES, vc->dpdes);
   168		mtspr(SPRN_VTB, vc->vtb);
   169	
 > 170		local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
 > 171		local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
   172		mtspr(SPRN_PURR, vcpu->arch.purr);
   173		mtspr(SPRN_SPURR, vcpu->arch.spurr);
   174	
   175		if (dawr_enabled()) {
   176			mtspr(SPRN_DAWR0, vcpu->arch.dawr0);
   177			mtspr(SPRN_DAWRX0, vcpu->arch.dawrx0);
   178			if (cpu_has_feature(CPU_FTR_DAWR1)) {
   179				mtspr(SPRN_DAWR1, vcpu->arch.dawr1);
   180				mtspr(SPRN_DAWRX1, vcpu->arch.dawrx1);
   181			}
   182		}
   183		mtspr(SPRN_CIABR, vcpu->arch.ciabr);
   184		mtspr(SPRN_IC, vcpu->arch.ic);
   185	
   186		mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
 > 187		      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
   188	
   189		mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
   190	
   191		mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
   192		mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
   193		mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
   194		mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
   195	
   196		mtspr(SPRN_AMOR, ~0UL);
   197	
   198		switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
   199	
   200		/*
   201		 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
   202		 * so set guest LPCR (with HDICE) before writing HDEC.
   203		 */
   204		mtspr(SPRN_HDEC, hdec);
   205	
   206		mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
   207		mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
   208	
   209		start_timing(vcpu, &vcpu->arch.rm_entry);
   210	
   211		vcpu->arch.ceded = 0;
   212	
   213		WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
   214		WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
   215	
   216		mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
   217		mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
   218	
   219		/*
   220		 * On POWER9 DD2.1 and below, sometimes on a Hypervisor Data Storage
   221		 * Interrupt (HDSI) the HDSISR is not be updated at all.
   222		 *
   223		 * To work around this we put a canary value into the HDSISR before
   224		 * returning to a guest and then check for this canary when we take a
   225		 * HDSI. If we find the canary on a HDSI, we know the hardware didn't
   226		 * update the HDSISR. In this case we return to the guest to retake the
   227		 * HDSI which should correctly update the HDSISR the second time HDSI
   228		 * entry.
   229		 *
   230		 * Just do this on all p9 processors for now.
   231		 */
   232		mtspr(SPRN_HDSISR, HDSISR_CANARY);
   233	
   234		accumulate_time(vcpu, &vcpu->arch.guest_time);
   235	
   236		local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
   237		kvmppc_p9_enter_guest(vcpu);
   238		// Radix host and guest means host never runs with guest MMU state
   239		local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
   240	
   241		accumulate_time(vcpu, &vcpu->arch.rm_intr);
   242	
   243		/* Get these from r11/12 and paca exsave */
   244		vcpu->arch.shregs.srr0 = mfspr(SPRN_SRR0);
   245		vcpu->arch.shregs.srr1 = mfspr(SPRN_SRR1);
   246		vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
   247		vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
   248	
   249		/* 0x2 bit for HSRR is only used by PR and P7/8 HV paths, clear it */
   250		trap = local_paca->kvm_hstate.scratch0 & ~0x2;
   251		if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
   252			exsave = local_paca->exgen;
   253		} else if (trap == BOOK3S_INTERRUPT_SYSTEM_RESET) {
   254			exsave = local_paca->exnmi;
   255		} else { /* trap == 0x200 */
   256			exsave = local_paca->exmc;
   257		}
   258	
   259		vcpu->arch.regs.gpr[1] = local_paca->kvm_hstate.scratch1;
   260		vcpu->arch.regs.gpr[3] = local_paca->kvm_hstate.scratch2;
   261		vcpu->arch.regs.gpr[9] = exsave[EX_R9/sizeof(u64)];
   262		vcpu->arch.regs.gpr[10] = exsave[EX_R10/sizeof(u64)];
   263		vcpu->arch.regs.gpr[11] = exsave[EX_R11/sizeof(u64)];
   264		vcpu->arch.regs.gpr[12] = exsave[EX_R12/sizeof(u64)];
   265		vcpu->arch.regs.gpr[13] = exsave[EX_R13/sizeof(u64)];
   266		vcpu->arch.ppr = exsave[EX_PPR/sizeof(u64)];
   267		vcpu->arch.cfar = exsave[EX_CFAR/sizeof(u64)];
   268		vcpu->arch.regs.ctr = exsave[EX_CTR/sizeof(u64)];
   269	
   270		vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
   271	
   272		if (unlikely(trap == BOOK3S_INTERRUPT_MACHINE_CHECK)) {
   273			vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
   274			vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
   275			kvmppc_realmode_machine_check(vcpu);
   276	
   277		} else if (unlikely(trap == BOOK3S_INTERRUPT_HMI)) {
   278			kvmppc_realmode_hmi_handler();
   279	
   280		} else if (trap == BOOK3S_INTERRUPT_H_EMUL_ASSIST) {
   281			vcpu->arch.emul_inst = mfspr(SPRN_HEIR);
   282	
   283		} else if (trap == BOOK3S_INTERRUPT_H_DATA_STORAGE) {
   284			vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
   285			vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
   286			vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
   287	
   288		} else if (trap == BOOK3S_INTERRUPT_H_INST_STORAGE) {
   289			vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
   290	
   291		} else if (trap == BOOK3S_INTERRUPT_H_FAC_UNAVAIL) {
   292			vcpu->arch.hfscr = mfspr(SPRN_HFSCR);
   293	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--6TrnltStXW4iwmi0
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--6TrnltStXW4iwmi0--
