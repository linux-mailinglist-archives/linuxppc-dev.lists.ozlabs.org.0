Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0358C7FB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 03:59:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZNSOgy4s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgVXD0lJjz3fvW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 11:59:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZNSOgy4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgVWS58TYz3cXT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 11:59:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715911157; x=1747447157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/asIFP3VhVOl5Bww+xsuwvWltg7PkBCAkGCa0RHdLdA=;
  b=ZNSOgy4sIV7t72nqSkb3A3uWD1QT8FC/tecdSCN1bixmoFEAXBgzwoEY
   HQbPz+jld86Fa+Q8ORKHBnGgd4OErbT6S2aWWtOcPR24xtTTlKAienxgl
   dM08IEODFyYDDBUBYrT0ejOIow9zLci8JYOBCaZietSBdCb4HoxzfazJn
   S09+UkF6TlirHONoahd4g5Vutc6p2i3vObwhcz+ZEQfvy1aWITSoQHbwh
   UtxrQxriS1L9G89K/6MIdxptigQYbmWmMK7SAU7OUbDry/Qt/141EWEU2
   upHJt/sERWy0tlXeNNzackygqWChBYfYmL7MOMw1oiEz0sob1y3RqUXV/
   Q==;
X-CSE-ConnectionGUID: H3lqtjPuRWOOKDN33bqgEA==
X-CSE-MsgGUID: WN2V8h3vRxiOTSTeN9Ym+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15851733"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="15851733"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 18:59:11 -0700
X-CSE-ConnectionGUID: CNT/fEo6SwSom5nZfVz3+Q==
X-CSE-MsgGUID: pPKBAhxkS6eFBytinS7TpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="36191348"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 May 2024 18:59:09 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7mri-00002e-30;
	Fri, 17 May 2024 01:58:54 +0000
Date: Fri, 17 May 2024 09:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Gautam Menghani <gautam@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH v8] arch/powerpc/kvm: Add support for reading VPA
 counters for pseries guests
Message-ID: <202405170932.TL7G99IJ-lkp@intel.com>
References: <20240510104941.78410-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510104941.78410-1-gautam@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gautam,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/topic/ppc-kvm]
[also build test ERROR on powerpc/next powerpc/fixes kvm/queue mst-vhost/linux-next linus/master v6.9 next-20240516]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gautam-Menghani/arch-powerpc-kvm-Add-support-for-reading-VPA-counters-for-pseries-guests/20240510-185213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
patch link:    https://lore.kernel.org/r/20240510104941.78410-1-gautam%40linux.ibm.com
patch subject: [PATCH v8] arch/powerpc/kvm: Add support for reading VPA counters for pseries guests
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240517/202405170932.TL7G99IJ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405170932.TL7G99IJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170932.TL7G99IJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `__traceiter_kvmppc_vcpu_stats'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: arch/powerpc/kvm/book3s_hv_nestedv2.o: in function `do_trace_nested_cs_time':
>> book3s_hv_nestedv2.c:(.text.do_trace_nested_cs_time+0x264): undefined reference to `__traceiter_kvmppc_vcpu_stats'
>> powerpc64-linux-ld: arch/powerpc/kvm/book3s_hv_nestedv2.o:(__jump_table+0x8): undefined reference to `__tracepoint_kvmppc_vcpu_stats'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
