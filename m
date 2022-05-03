Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01F5184EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 15:04:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt0Y22nLTz3bbn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 23:04:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GpNCR4fP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GpNCR4fP; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt0XH2285z2xKW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 23:03:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651583039; x=1683119039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UCyDlB85rkoavp7KoFgYBF745HbRXl8o/+z3W4OKNAg=;
 b=GpNCR4fPp139aYOf9ramFi13Ehe5mHkv0FeEnpqXoLpDuKTw2nIY7C9S
 UdCYW37a3QGdCFMPQczdVtXIlmjqeXBp0EUQTP9twnOJKQuVfQ470IIPG
 oXcggjmxzNs66s5Rb5388udRlVGCNI/ZtLvWpjDkjuJosXIiq5tJ3Cb+q
 SA8CykE3cAw0sAq67lN8X9nXzTdgSc/hotceIfY2e41+Po2HkxBjLf1jS
 wycmHQwKP/r2vYZFdHjru3wrPKEmeGcpA8nJWcMietZ6BmqvD5+Bu5qk5
 YxkilSXHAUCQ1hBsmcDQA5uSwyc9pRo8TEbm6598OyVnRbDWT7BXPol+4 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267624660"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="267624660"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 06:02:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="663966482"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 03 May 2022 06:02:43 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nlsAs-000ATj-C9;
 Tue, 03 May 2022 13:02:42 +0000
Date: Tue, 3 May 2022 21:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH] crypto: vmx - Align the short log with Makefile cleanups
Message-ID: <202205032046.GVMtYY1b-lkp@intel.com>
References: <20220501130749.1123387-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501130749.1123387-1-masahiroy@kernel.org>
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
Cc: kbuild-all@lists.01.org, Masahiro Yamada <masahiroy@kernel.org>,
 Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Masahiro,

I love your patch! Yet something to improve:

[auto build test ERROR on herbert-crypto-2.6/master]
[also build test ERROR on herbert-cryptodev-2.6/master powerpc/next v5.18-rc5 next-20220503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/crypto-vmx-Align-the-short-log-with-Makefile-cleanups/20220501-211151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6.git master
config: powerpc64-randconfig-c024-20220501 (https://download.01.org/0day-ci/archive/20220503/202205032046.GVMtYY1b-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ee5bc3b577c98befd8dfe65bbcd877e2f246470d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahiro-Yamada/crypto-vmx-Align-the-short-log-with-Makefile-cleanups/20220501-211151
        git checkout ee5bc3b577c98befd8dfe65bbcd877e2f246470d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /tmp/ccMTXCTj.s: Assembler messages:
>> /tmp/ccMTXCTj.s: Error: .size expression for aes_p8_set_encrypt_key does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for .aes_p8_set_encrypt_key does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for aes_p8_set_decrypt_key does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for .aes_p8_set_decrypt_key does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for aes_p8_encrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for .aes_p8_encrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for aes_p8_decrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for .aes_p8_decrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for aes_p8_cbc_encrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for .aes_p8_cbc_encrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for aes_p8_ctr32_encrypt_blocks does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for .aes_p8_ctr32_encrypt_blocks does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for aes_p8_xts_encrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for .aes_p8_xts_encrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for aes_p8_xts_decrypt does not evaluate to a constant
>> /tmp/ccMTXCTj.s: Error: .size expression for .aes_p8_xts_decrypt does not evaluate to a constant
--
   /tmp/cci7g2fQ.s: Assembler messages:
>> /tmp/cci7g2fQ.s: Error: .size expression for gcm_init_p8 does not evaluate to a constant
>> /tmp/cci7g2fQ.s: Error: .size expression for .gcm_init_p8 does not evaluate to a constant
>> /tmp/cci7g2fQ.s: Error: .size expression for gcm_gmult_p8 does not evaluate to a constant
>> /tmp/cci7g2fQ.s: Error: .size expression for .gcm_gmult_p8 does not evaluate to a constant
>> /tmp/cci7g2fQ.s: Error: .size expression for gcm_ghash_p8 does not evaluate to a constant
>> /tmp/cci7g2fQ.s: Error: .size expression for .gcm_ghash_p8 does not evaluate to a constant

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
