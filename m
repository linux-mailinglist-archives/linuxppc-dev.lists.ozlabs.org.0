Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C112A959
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2019 00:48:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jqXD75DJzDqLX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2019 10:47:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jqVN66mwzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2019 10:46:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=intel.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47jqVM3rNzz8t07
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2019 10:46:19 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47jqVM38V0z9sQp; Thu, 26 Dec 2019 10:46:19 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47jqVL2Y5Cz9sP3;
 Thu, 26 Dec 2019 10:46:10 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Dec 2019 15:46:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,356,1571727600"; 
 d="gz'50?scan'50,208,50";a="207931976"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 25 Dec 2019 15:46:04 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ikGLs-000E9f-AD; Thu, 26 Dec 2019 07:46:04 +0800
Date: Thu, 26 Dec 2019 07:45:53 +0800
From: kbuild test robot <lkp@intel.com>
To: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/pseries/svm: Disable BHRB/EBB/PMU access
Message-ID: <201912260741.8D8Mga1n%lkp@intel.com>
References: <20191225051634.3262-2-sukadev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="od3hjarw6mpu4gjk"
Content-Disposition: inline
In-Reply-To: <20191225051634.3262-2-sukadev@linux.ibm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: kbuild-all@lists.01.org, linux-mm@kvack.org, linuxram@us.ibm.com,
 kvm-ppc@vger.kernel.org, bharata@linux.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--od3hjarw6mpu4gjk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sukadev,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.5-rc3 next-20191220]
[cannot apply to kvm-ppc/kvm-ppc-next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sukadev-Bhattiprolu/powerpc-pseries-svm-Use-FW_FEATURE-to-detect-SVM/20191226-045626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-rhel-kconfig (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/process.c: In function 'save_sprs':
>> arch/powerpc/kernel/process.c:1065:8: error: implicit declaration of function 'is_secure_guest'; did you mean 'issecure_mask'? [-Werror=implicit-function-declaration]
      if (!is_secure_guest()) {
           ^~~~~~~~~~~~~~~
           issecure_mask
   cc1: some warnings being treated as errors
--
   arch/powerpc/kvm/book3s_hv.c: In function 'kvmhv_p9_guest_entry':
>> arch/powerpc/kvm/book3s_hv.c:3554:7: error: implicit declaration of function 'is_secure_guest'; did you mean 'is_software_event'? [-Werror=implicit-function-declaration]
     if (!is_secure_guest()) {
          ^~~~~~~~~~~~~~~
          is_software_event
   cc1: some warnings being treated as errors
--
   arch/powerpc/perf/core-book3s.c: In function 'perf_event_print_debug':
>> arch/powerpc/perf/core-book3s.c:814:6: error: implicit declaration of function 'is_secure_guest' [-Werror=implicit-function-declaration]
     if (is_secure_guest()) {
         ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +1065 arch/powerpc/kernel/process.c

  1053	
  1054	static inline void save_sprs(struct thread_struct *t)
  1055	{
  1056	#ifdef CONFIG_ALTIVEC
  1057		if (cpu_has_feature(CPU_FTR_ALTIVEC))
  1058			t->vrsave = mfspr(SPRN_VRSAVE);
  1059	#endif
  1060	#ifdef CONFIG_PPC_BOOK3S_64
  1061		if (cpu_has_feature(CPU_FTR_DSCR))
  1062			t->dscr = mfspr(SPRN_DSCR);
  1063	
  1064		if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
> 1065			if (!is_secure_guest()) {
  1066				t->bescr = mfspr(SPRN_BESCR);
  1067				t->ebbhr = mfspr(SPRN_EBBHR);
  1068				t->ebbrr = mfspr(SPRN_EBBRR);
  1069			}
  1070	
  1071			t->fscr = mfspr(SPRN_FSCR);
  1072	
  1073			/*
  1074			 * Note that the TAR is not available for use in the kernel.
  1075			 * (To provide this, the TAR should be backed up/restored on
  1076			 * exception entry/exit instead, and be in pt_regs.  FIXME,
  1077			 * this should be in pt_regs anyway (for debug).)
  1078			 */
  1079			t->tar = mfspr(SPRN_TAR);
  1080		}
  1081	#endif
  1082	
  1083		thread_pkey_regs_save(t);
  1084	}
  1085	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--od3hjarw6mpu4gjk
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--od3hjarw6mpu4gjk--
