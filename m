Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BC48504A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 15:17:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JKdkJ+38;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TXCTf4zPPz3cV6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Feb 2024 01:17:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JKdkJ+38;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TXCSv3rK4z2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Feb 2024 01:16:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707574591; x=1739110591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xp9zH1WaW6uoig/Qd9fQ2SgwWOA/7EqqFkCeMF5KI/4=;
  b=JKdkJ+38OPjJob8siF82G0I5B6f9MBbQmvFs4QyGyYe7IUSraEU15Evu
   KxIDBb8OrQzqG4e8sXODcbexyi3NZwrQ67MXvRUJB3wAIrc9SMkwKk5Vn
   ZLQ1vm2a9YWO69DZZeceWFFSSfeeH70FryX6Zc6oJvA9LKe3r9bJA+7WK
   OdPQaW7939CQmUdHg0QNgy/8xRCQEdzVZZAwkigXS4R3BiQLCTBwMk5Ez
   Slm10Ko8/1gqyW0UHIkaqa6EukNWL1djfen5FcIhaGag54lw+xaexsJ60
   wvJpoCjuHDSmDZLTWXJt1aScV65SLZ8b7pNCos/42fnrCwGNzzKBfbIsT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1721047"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1721047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 06:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="33257272"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2024 06:16:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYo9S-0005hy-2Y;
	Sat, 10 Feb 2024 14:16:18 +0000
Date: Sat, 10 Feb 2024 22:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 4/4] powerpc: ibmebus: make ibmebus_bus_type const
Message-ID: <202402102142.uphiKeqw-lkp@intel.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ricardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 41bccc98fb7931d63d03f326a746ac4d429c1dd3]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-B-Marliere/powerpc-vio-move-device-attributes-into-a-new-ifdef/20240210-080925
base:   41bccc98fb7931d63d03f326a746ac4d429c1dd3
patch link:    https://lore.kernel.org/r/20240209-bus_cleanup-powerpc2-v1-4-79a56dcaebb1%40marliere.net
patch subject: [PATCH 4/4] powerpc: ibmebus: make ibmebus_bus_type const
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240210/202402102142.uphiKeqw-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102142.uphiKeqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102142.uphiKeqw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/ibmebus.c:58:17: error: conflicting type qualifiers for 'ibmebus_bus_type'
      58 | struct bus_type ibmebus_bus_type;
         |                 ^~~~~~~~~~~~~~~~
   In file included from arch/powerpc/platforms/pseries/ibmebus.c:51:
   arch/powerpc/include/asm/ibmebus.h:51:30: note: previous declaration of 'ibmebus_bus_type' with type 'const struct bus_type'
      51 | extern const struct bus_type ibmebus_bus_type;
         |                              ^~~~~~~~~~~~~~~~
   In file included from arch/powerpc/platforms/pseries/ibmebus.c:40:
   arch/powerpc/platforms/pseries/ibmebus.c:445:15: error: conflicting type qualifiers for 'ibmebus_bus_type'
     445 | EXPORT_SYMBOL(ibmebus_bus_type);
         |               ^~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/ibmebus.c:445:1: note: in expansion of macro 'EXPORT_SYMBOL'
     445 | EXPORT_SYMBOL(ibmebus_bus_type);
         | ^~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/ibmebus.c:435:23: note: previous definition of 'ibmebus_bus_type' with type 'const struct bus_type'
     435 | const struct bus_type ibmebus_bus_type = {
         |                       ^~~~~~~~~~~~~~~~


vim +/ibmebus_bus_type +58 arch/powerpc/platforms/pseries/ibmebus.c

d7a301033f1990 arch/powerpc/kernel/ibmebus.c Heiko J Schick 2005-11-16  57  
6bccf755ff5324 arch/powerpc/kernel/ibmebus.c Joachim Fenkes 2007-03-09 @58  struct bus_type ibmebus_bus_type;
6bccf755ff5324 arch/powerpc/kernel/ibmebus.c Joachim Fenkes 2007-03-09  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
