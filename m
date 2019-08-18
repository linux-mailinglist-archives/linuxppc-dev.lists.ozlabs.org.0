Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F5591417
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2019 04:06:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46B0lp1jLrzDrdY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2019 12:06:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46B0k670B0zDrST
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2019 12:04:45 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Aug 2019 19:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,399,1559545200"; 
 d="gz'50?scan'50,208,50";a="352905472"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 17 Aug 2019 19:04:16 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hzAYJ-0003nT-EN; Sun, 18 Aug 2019 10:04:15 +0800
Date: Sun, 18 Aug 2019 10:03:36 +0800
From: kbuild test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32: Add VDSO version of getcpu
Message-ID: <201908180928.CvTXdlt1%lkp@intel.com>
References: <740c6923c313ff0c0c2394480d5691465919b52f.1565953624.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ahhzrdclqfxkssoo"
Content-Disposition: inline
In-Reply-To: <740c6923c313ff0c0c2394480d5691465919b52f.1565953624.git.christophe.leroy@c-s.fr>
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


--ahhzrdclqfxkssoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc4 next-20190816]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-32-Add-VDSO-version-of-getcpu/20190818-075346
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/vdso32/getcpu.S:22:28: error: operator '*' has no right operand
    #elif defined (CONFIG_SMP)*/
                               ^

vim +22 arch/powerpc/kernel/vdso32/getcpu.S

    10	
    11		.text
    12	/*
    13	 * Exact prototype of getcpu
    14	 *
    15	 * int __kernel_getcpu(unsigned *cpu, unsigned *node);
    16	 *
    17	 */
    18	V_FUNCTION_BEGIN(__kernel_getcpu)
    19	  .cfi_startproc
    20	#if defined(CONFIG_PPC64)
    21		mfspr	r5,SPRN_SPRG_VDSO_READ
  > 22	#elif defined (CONFIG_SMP)*/

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--ahhzrdclqfxkssoo
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ahhzrdclqfxkssoo--
