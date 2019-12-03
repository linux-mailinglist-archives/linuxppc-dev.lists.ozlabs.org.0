Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B9110649
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 22:05:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SDys5xWFzDqS5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 08:05:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SDwX3zbYzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 08:03:23 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 13:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,274,1571727600"; 
 d="gz'50?scan'50,208,50";a="208574915"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 03 Dec 2019 13:03:19 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1icFKI-000IMV-LN; Wed, 04 Dec 2019 05:03:18 +0800
Date: Wed, 4 Dec 2019 05:02:36 +0800
From: kbuild test robot <lkp@intel.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/sysfs: Show idle_purr and idle_spurr for
 every CPU
Message-ID: <201912040202.E64TMShI%lkp@intel.com>
References: <1574856072-30972-3-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mrssvotvaqh32sno"
Content-Disposition: inline
In-Reply-To: <1574856072-30972-3-git-send-email-ego@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 kbuild-all@lists.01.org, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mrssvotvaqh32sno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Gautham,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.4 next-20191203]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Gautham-R-Shenoy/powerpc-pseries-Account-for-SPURR-ticks-on-idle-CPUs/20191127-234537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

Note: the linux-review/Gautham-R-Shenoy/powerpc-pseries-Account-for-SPURR-ticks-on-idle-CPUs/20191127-234537 HEAD 54932d09dae77a0b15c47c7e51f0fb6e7d34900f builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/sysfs.c: In function 'idle_purr_show':
>> arch/powerpc/kernel/sysfs.c:1052:34: error: 'paca_ptrs' undeclared (first use in this function); did you mean 'hash_ptr'?
     struct lppaca *cpu_lppaca_ptr = paca_ptrs[cpuid]->lppaca_ptr;
                                     ^~~~~~~~~
                                     hash_ptr
   arch/powerpc/kernel/sysfs.c:1052:34: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/byteorder/big_endian.h:5:0,
                    from arch/powerpc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/powerpc/include/asm/bitops.h:243,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/kobject.h:19,
                    from include/linux/device.h:16,
                    from arch/powerpc/kernel/sysfs.c:2:
>> arch/powerpc/kernel/sysfs.c:1053:51: error: dereferencing pointer to incomplete type 'struct lppaca'
     u64 idle_purr_cycles = be64_to_cpu(cpu_lppaca_ptr->wait_state_cycles);
                                                      ^
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__be64_to_cpu'
    #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
                                                      ^
   arch/powerpc/kernel/sysfs.c:1053:25: note: in expansion of macro 'be64_to_cpu'
     u64 idle_purr_cycles = be64_to_cpu(cpu_lppaca_ptr->wait_state_cycles);
                            ^~~~~~~~~~~

vim +1052 arch/powerpc/kernel/sysfs.c

  1046	
  1047	static ssize_t idle_purr_show(struct device *dev,
  1048				      struct device_attribute *attr, char *buf)
  1049	{
  1050		struct cpu *cpu = container_of(dev, struct cpu, dev);
  1051		unsigned int cpuid = cpu->dev.id;
> 1052		struct lppaca *cpu_lppaca_ptr = paca_ptrs[cpuid]->lppaca_ptr;
> 1053		u64 idle_purr_cycles = be64_to_cpu(cpu_lppaca_ptr->wait_state_cycles);
  1054	
  1055		return sprintf(buf, "%llx\n", idle_purr_cycles);
  1056	}
  1057	static DEVICE_ATTR_RO(idle_purr);
  1058	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--mrssvotvaqh32sno
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
if8A+c4nfLlZAAA=

--mrssvotvaqh32sno--
