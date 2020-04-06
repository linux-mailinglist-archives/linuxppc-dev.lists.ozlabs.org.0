Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE819F3A1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:36:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wn5T15vbzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:36:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wn3G2bBbzDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 20:34:33 +1000 (AEST)
IronPort-SDR: vt2udFYA01QS/qJE5Lx+PbmB3qRBQh1aqiHb4DkJojF7sgZYfrIzLyz4Va5Lop6vookKIMq+y1
 TiAoxKZ+Rtuw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 03:34:30 -0700
IronPort-SDR: 9k7G3XgBRz2oNx5tU7Rjm20+u2oLTXeRNk+c3Vl9aErrjnE9gJNwiRriOZEYyMBmJHAhg+ynah
 zCzAHt4964rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; 
 d="gz'50?scan'50,208,50";a="254076639"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 06 Apr 2020 03:34:29 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jLP5I-0003s7-9U; Mon, 06 Apr 2020 18:34:28 +0800
Date: Mon, 6 Apr 2020 18:34:14 +0800
From: kbuild test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v5 09/21] powerpc: Use a datatype for instructions
Message-ID: <202004061807.qPcyXBu0%lkp@intel.com>
References: <20200406080936.7180-10-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <20200406080936.7180-10-jniethe5@gmail.com>
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
Cc: kbuild-all@lists.01.org, Jordan Niethe <jniethe5@gmail.com>,
 npiggin@gmail.com, bala24@linux.ibm.com, alistair@popple.id.au,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jordan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.6]
[cannot apply to powerpc/next kvm-ppc/kvm-ppc-next scottwood/next next-20200406]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Jordan-Niethe/Initial-Prefixed-Instruction-support/20200406-165215
base:    7111951b8d4973bda27ff663f2cf18b663d15b48
config: powerpc-rhel-kconfig (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/lib/feature-fixups.c: In function 'do_final_fixups':
>> arch/powerpc/lib/feature-fixups.c:404:25: error: passing argument 1 of 'raw_patch_instruction' from incompatible pointer type [-Werror=incompatible-pointer-types]
     404 |   raw_patch_instruction(dest, ppc_inst(*src));
         |                         ^~~~
         |                         |
         |                         int *
   In file included from arch/powerpc/lib/feature-fixups.c:18:
   arch/powerpc/include/asm/code-patching.h:32:44: note: expected 'struct ppc_inst *' but argument is of type 'int *'
      32 | int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
         |                           ~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors

vim +/raw_patch_instruction +404 arch/powerpc/lib/feature-fixups.c

2d1b2027626d51 Kumar Gala             2008-07-02  389  
9402c684613163 Benjamin Herrenschmidt 2016-07-05  390  static void do_final_fixups(void)
d715e433b7ad19 Anton Blanchard        2011-11-14  391  {
d715e433b7ad19 Anton Blanchard        2011-11-14  392  #if defined(CONFIG_PPC64) && defined(CONFIG_RELOCATABLE)
d715e433b7ad19 Anton Blanchard        2011-11-14  393  	int *src, *dest;
d715e433b7ad19 Anton Blanchard        2011-11-14  394  	unsigned long length;
d715e433b7ad19 Anton Blanchard        2011-11-14  395  
d715e433b7ad19 Anton Blanchard        2011-11-14  396  	if (PHYSICAL_START == 0)
d715e433b7ad19 Anton Blanchard        2011-11-14  397  		return;
d715e433b7ad19 Anton Blanchard        2011-11-14  398  
d715e433b7ad19 Anton Blanchard        2011-11-14  399  	src = (int *)(KERNELBASE + PHYSICAL_START);
d715e433b7ad19 Anton Blanchard        2011-11-14  400  	dest = (int *)KERNELBASE;
d715e433b7ad19 Anton Blanchard        2011-11-14  401  	length = (__end_interrupts - _stext) / sizeof(int);
d715e433b7ad19 Anton Blanchard        2011-11-14  402  
d715e433b7ad19 Anton Blanchard        2011-11-14  403  	while (length--) {
16f7ae823ee707 Jordan Niethe          2020-04-06 @404  		raw_patch_instruction(dest, ppc_inst(*src));
d715e433b7ad19 Anton Blanchard        2011-11-14  405  		src++;
d715e433b7ad19 Anton Blanchard        2011-11-14  406  		dest++;
d715e433b7ad19 Anton Blanchard        2011-11-14  407  	}
d715e433b7ad19 Anton Blanchard        2011-11-14  408  #endif
d715e433b7ad19 Anton Blanchard        2011-11-14  409  }
d715e433b7ad19 Anton Blanchard        2011-11-14  410  

:::::: The code at line 404 was first introduced by commit
:::::: 16f7ae823ee70796c5ba2cc321b2c02f3dcfb816 powerpc: Use a macro for creating instructions from u32s

:::::: TO: Jordan Niethe <jniethe5@gmail.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--FL5UXtIhxfXey3p5
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--FL5UXtIhxfXey3p5--
