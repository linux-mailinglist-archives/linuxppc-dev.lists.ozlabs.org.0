Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEDB8506E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 23:57:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UUJJp6nt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TXR281LV9z3c5R
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Feb 2024 09:57:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UUJJp6nt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TXR1G4Tfkz2ykx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Feb 2024 09:56:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707605811; x=1739141811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kznykOs2boAsIDcRBVKJBzW2mUxpRYIaGPtEKyKzJRQ=;
  b=UUJJp6ntWHmzNM2v4t4QeqtD70dOgOgsWuivG389gQWUeRq71m0KREx0
   +qf7UWjehqELBsByhfxH8AoVrbW/q6x/lvGUEmERJwoi8FIIlluW/COWv
   6dkXU7Vt4Sm4ddGquVdjKU2sh0vb5V5hRyGShMkM/Xg69AMlkx4mV/000
   oPfCV3jcAJQ54ldkI614/lcjq2LaTO5BuMhQlYj5vIFk1NAqP85kpDPm9
   dL30AEgmRdasfVy8X6KarVjdpIPtRn1AfynNL3R+1XRJgNcF8Z2KEsTaN
   kiUZwEuynTx5c29e8jr8sBj7zpHvGdS2iIC+F3D9+Gr0E13d058cvwaXG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12322148"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12322148"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 14:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2548626"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2024 14:56:40 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYwH0-00069a-13;
	Sat, 10 Feb 2024 22:56:38 +0000
Date: Sun, 11 Feb 2024 06:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 4/4] powerpc: ibmebus: make ibmebus_bus_type const
Message-ID: <202402110615.H1X3DSiC-lkp@intel.com>
References: <20240209-bus_cleanup-powerpc2-v1-4-79a56dcaebb1@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209-bus_cleanup-powerpc2-v1-4-79a56dcaebb1@marliere.net>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ricardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 41bccc98fb7931d63d03f326a746ac4d429c1dd3]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-B-Marliere/powerpc-vio-move-device-attributes-into-a-new-ifdef/20240210-080925
base:   41bccc98fb7931d63d03f326a746ac4d429c1dd3
patch link:    https://lore.kernel.org/r/20240209-bus_cleanup-powerpc2-v1-4-79a56dcaebb1%40marliere.net
patch subject: [PATCH 4/4] powerpc: ibmebus: make ibmebus_bus_type const
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240211/202402110615.H1X3DSiC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110615.H1X3DSiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110615.H1X3DSiC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/ibmebus.c:58:17: error: redefinition of 'ibmebus_bus_type' with a different type: 'struct bus_type' vs 'const struct bus_type'
      58 | struct bus_type ibmebus_bus_type;
         |                 ^
   arch/powerpc/include/asm/ibmebus.h:51:30: note: previous declaration is here
      51 | extern const struct bus_type ibmebus_bus_type;
         |                              ^
   arch/powerpc/platforms/pseries/ibmebus.c:134:17: warning: shift count >= width of type [-Wshift-count-overflow]
     134 |         return mask == DMA_BIT_MASK(64);
         |                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   arch/powerpc/platforms/pseries/ibmebus.c:139:9: warning: shift count >= width of type [-Wshift-count-overflow]
     139 |         return DMA_BIT_MASK(64);
         |                ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   2 warnings and 1 error generated.


vim +58 arch/powerpc/platforms/pseries/ibmebus.c

d7a301033f1990 arch/powerpc/kernel/ibmebus.c Heiko J Schick 2005-11-16  57  
6bccf755ff5324 arch/powerpc/kernel/ibmebus.c Joachim Fenkes 2007-03-09 @58  struct bus_type ibmebus_bus_type;
6bccf755ff5324 arch/powerpc/kernel/ibmebus.c Joachim Fenkes 2007-03-09  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
