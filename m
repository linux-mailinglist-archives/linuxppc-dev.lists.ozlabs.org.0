Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D72767DCA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 11:57:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VidWPMcw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCg0F16lcz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 19:57:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VidWPMcw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCfzM4ctKz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 19:56:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690624592; x=1722160592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NQFacC9L5QtHY1yiY74lQF4h5DC97r0Z95MUzxvVgJY=;
  b=VidWPMcwiD12eH5eZEKGEIqT8el+VBj7qvOAuw0qvpBDhs+XT64f8hOz
   JsHAm0ccDflJjA+G8r383UrEYy6S6tsP40p4+tnyMisIwQNAIWGx4CNuI
   NMbQieR+N3brN+vVWUhfW1s/aHUTi0mPoh1dLUmbUvceL39XHE+9ZzOYq
   VaTHxu0X9eejFcf8P+brhEj6JRflFrwPvx7BOmYg0clHKhBdaZGrc1PNa
   FUdLI2VJFbyGdIxAwpfnCJuBYxggY+busP3rJSSmS6krF5O2gXgxsHbsg
   CW5FO8PmjHNfFuWEX7sXmlqwsmZyqVO5f1BYxmQGCGs9ijP4lAbwKMcbA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="372381404"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="372381404"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 02:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="793168798"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="793168798"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2023 02:56:19 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPggM-0003xt-2Y;
	Sat, 29 Jul 2023 09:56:18 +0000
Date: Sat, 29 Jul 2023 17:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH v3 1/2] powerpc/mm: Cleanup memory block size probing
Message-ID: <202307291753.opRf3JsB-lkp@intel.com>
References: <20230728103556.745681-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728103556.745681-1-aneesh.kumar@linux.ibm.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, foraker1@llnl.gov, llvm@lists.linux.dev, Reza Arbab <arbab@linux.ibm.com>, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.5-rc3 next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/powerpc-mm-Add-memory_block_size-as-a-kernel-parameter/20230728-184256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230728103556.745681-1-aneesh.kumar%40linux.ibm.com
patch subject: [PATCH v3 1/2] powerpc/mm: Cleanup memory block size probing
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20230729/202307291753.opRf3JsB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291753.opRf3JsB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291753.opRf3JsB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/init_64.c:558:7: error: variable 'base' set but not used [-Werror,-Wunused-but-set-variable]
     558 |                 u64 base, size;
         |                     ^
   1 error generated.


vim +/base +558 arch/powerpc/mm/init_64.c

   485	
   486	static int __init probe_memory_block_size(unsigned long node, const char *uname, int
   487						  depth, void *data)
   488	{
   489		const char *type;
   490		const char *compatible;
   491		unsigned long *block_size = (unsigned long *)data;
   492		const __be32 *reg, *endp;
   493		int l;
   494	
   495		if (depth != 1)
   496			return 0;
   497		/*
   498		 * If we have dynamic-reconfiguration-memory node, use the
   499		 * lmb value.
   500		 */
   501		if (strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
   502	
   503			const __be32 *prop;
   504	
   505			prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &l);
   506	
   507			if (!prop || l < dt_root_size_cells * sizeof(__be32))
   508				/*
   509				 * Nothing in the device tree
   510				 */
   511				*block_size = MIN_MEMORY_BLOCK_SIZE;
   512			else
   513				*block_size = of_read_number(prop, dt_root_size_cells);
   514			/*
   515			 * We have found the final value. Don't probe further.
   516			 */
   517			return 1;
   518		}
   519		/*
   520		 * Find all the device tree nodes of memory type and make sure
   521		 * the area can be mapped using the memory block size value
   522		 * we end up using. We start with 1G value and keep reducing
   523		 * it such that we can map the entire area using memory_block_size.
   524		 * This will be used on powernv and older pseries that don't
   525		 * have ibm,lmb-size node.
   526		 * For ex: with P5 we can end up with
   527		 * memory@0 -> 128MB
   528		 * memory@128M -> 64M
   529		 * This will end up using 64MB  memory block size value.
   530		 */
   531		type = of_get_flat_dt_prop(node, "device_type", NULL);
   532		if (type == NULL || strcmp(type, "memory") != 0)
   533			return 0;
   534	
   535		/*
   536		 * "ibm,coherent-device-memory with linux,usable-memory = 0
   537		 * Force 256MiB block size. Work around for GPUs on P9 PowerNV
   538		 * linux,usable-memory == 0 implies driver managed memory and
   539		 * we can't use large memory block size due to hotplug/unplug
   540		 * limitations.
   541		 */
   542		compatible = of_get_flat_dt_prop(node, "compatible", NULL);
   543		if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
   544			int len = 0;
   545			const __be32 *usm;
   546	
   547			usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
   548			if (usm && !len) {
   549				*block_size = SZ_256M;
   550				return 1;
   551			}
   552		}
   553	
   554		reg = of_get_flat_dt_prop(node, "reg", &l);
   555		endp = reg + (l / sizeof(__be32));
   556	
   557		while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
 > 558			u64 base, size;
   559	
   560			base = dt_mem_next_cell(dt_root_addr_cells, &reg);
   561			size = dt_mem_next_cell(dt_root_size_cells, &reg);
   562	
   563			if (size == 0)
   564				continue;
   565	
   566			update_memory_block_size(block_size, size);
   567		}
   568		/* continue looking for other memory device types */
   569		return 0;
   570	}
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
