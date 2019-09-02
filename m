Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C06A4E3D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 06:14:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MGtS0jFPzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:14:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGDj4Rd9zDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:44:51 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Sep 2019 20:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
 d="gz'50?scan'50,208,50";a="176214489"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 01 Sep 2019 20:44:46 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1i4dGo-000HPN-6Z; Mon, 02 Sep 2019 11:44:46 +0800
Date: Mon, 2 Sep 2019 11:44:33 +0800
From: kbuild test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2] powerpc/32: Add VDSO version of getcpu
Message-ID: <201909021159.zOHYSB8l%lkp@intel.com>
References: <b2fd7fdecdcf1d0fb836b8742f0422d3d02a1180.1565954131.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uwzdq62g72tiwheg"
Content-Disposition: inline
In-Reply-To: <b2fd7fdecdcf1d0fb836b8742f0422d3d02a1180.1565954131.git.christophe.leroy@c-s.fr>
X-Patchwork-Hint: ignore
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 kbuild-all@01.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--uwzdq62g72tiwheg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc6 next-20190830]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-32-Add-VDSO-version-of-getcpu/20190819-034351
config: powerpc-sequoia_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/head_booke.h:7:0,
                    from arch/powerpc/kernel/asm-offsets.c:61:
>> arch/powerpc/include/asm/asm-offsets.h:1:10: fatal error: generated/asm-offsets.h: No such file or directory
    #include <generated/asm-offsets.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[2]: *** [arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [sub-make] Error 2
   20 real  7 user  6 sys  67.53% cpu 	make prepare

vim +1 arch/powerpc/include/asm/asm-offsets.h

559df2e0210352 Sam Ravnborg 2009-04-19 @1  #include <generated/asm-offsets.h>

:::::: The code at line 1 was first introduced by commit
:::::: 559df2e0210352f83926d178c40c51142292a18c kbuild: move asm-offsets.h to include/generated

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: Michal Marek <mmarek@suse.cz>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--uwzdq62g72tiwheg
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--uwzdq62g72tiwheg--
