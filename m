Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358AA7E7894
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 05:24:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kj3LDWiY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRQhY0mq2z3cQ7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 15:24:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kj3LDWiY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRQgf0JhSz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 15:23:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699590238; x=1731126238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P+HrsfTgmIAQuHJtSIDJylsGuedtQJzyUXRzKrUPFZE=;
  b=kj3LDWiYs5WVAXVZCsM/BNDi1mOF0rCle3wJK1+MoMrPr3RfEV2s8yXM
   Mlrt/5s4mWavQ2WsMBUp05aDzig3rASKvggMkVcWCY+L4i7fvrSKSIDjQ
   OEmOt06rNHjujv9vOyKuxYsFfBzH7cvWP44ZQSgDghwrK9/scrTlIMJzv
   QdZKh3heR1rfvas/Z2APRo94qyFraE0DyXw28QR24f1iwD9LLGFfoCYPo
   Uvdue3aFszqTSQBUkwRmYXwJMjquJn531GMaU5PakZMcNtiAcmtHtRkbr
   5U94m0fYWBDkXgKaPYqnJZ31gEC8a4QFOSQ3wj8z9fxrxB0Q0CfMEQ53x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="370336237"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="370336237"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 20:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4745660"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2023 20:23:44 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1J3V-0009Q4-27;
	Fri, 10 Nov 2023 04:23:41 +0000
Date: Fri, 10 Nov 2023 12:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	Sean Anderson <sean.anderson@seco.com>, x86@kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/8] drivers: firmware: efi: libstub: enable generic
 commandline
Message-ID: <202311101224.evyh4zgY-lkp@intel.com>
References: <20231110013817.2378507-6-danielwa@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110013817.2378507-6-danielwa@cisco.com>
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
Cc: linux-efi@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, xe-linux-external@cisco.com, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.6]
[cannot apply to arm64/for-next/core efi/next tip/x86/core robh/for-next linus/master next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Walker/CMDLINE-add-generic-builtin-command-line/20231110-094423
base:   v6.6
patch link:    https://lore.kernel.org/r/20231110013817.2378507-6-danielwa%40cisco.com
patch subject: [PATCH 5/8] drivers: firmware: efi: libstub: enable generic commandline
config: loongarch-randconfig-002-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101224.evyh4zgY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101224.evyh4zgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101224.evyh4zgY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/efi-stub-helper.c:43: warning: expecting prototype for efi_handle_cmdline(). Prototype was for efi_handle_builtin_cmdline() instead
   drivers/firmware/efi/libstub/efi-stub-helper.c:592: warning: Function parameter or member 'out' not described in 'efi_load_initrd'


vim +43 drivers/firmware/efi/libstub/efi-stub-helper.c

    32	
    33	/**
    34	 * efi_handle_cmdline() - handle adding in built-in parts of the command line
    35	 * @cmdline:	kernel command line
    36	 *
    37	 * Add in the generic parts of the commandline and start the parsing of the
    38	 * command line.
    39	 *
    40	 * Return:	status code
    41	 */
    42	efi_status_t efi_handle_builtin_cmdline(char const *cmdline)
  > 43	{
    44		efi_status_t status = EFI_SUCCESS;
    45	
    46		if (sizeof(CMDLINE_STATIC_PREPEND) > 1)
    47			status |= efi_parse_options(CMDLINE_STATIC_PREPEND);
    48	
    49		if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE))
    50			status |= efi_parse_options(cmdline);
    51	
    52		if (sizeof(CMDLINE_STATIC_APPEND) > 1)
    53			status |= efi_parse_options(CMDLINE_STATIC_APPEND);
    54	
    55		if (status != EFI_SUCCESS)
    56			efi_err("Failed to parse options\n");
    57	
    58		return status;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
