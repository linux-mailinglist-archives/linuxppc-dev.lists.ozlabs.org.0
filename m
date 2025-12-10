Return-Path: <linuxppc-dev+bounces-14707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1503CB1DB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 05:03:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dR2CK1WHjz2xs1;
	Wed, 10 Dec 2025 15:03:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765339437;
	cv=none; b=YuJgHYt1n4dcfIUVEsmfo7dVQIchfM2Tyu4WVQIy8TUeWdlBDzyPyFPAGIBi0Edv1RFYvWXjKh+Xl+AMpfG95svZXup8jFiwm4UEzatfSws4S81B7hpi34GbPZwKIt/rnhP7tel0+LxCt15n+fi3YzZ+bK59HYKGp8iVeVJ6dZBnTNZuHiqkvwaI9YmiIZeODeVLgEzALA01x+vSIHgrpcWXyJZkl4x0t6nQ2K0VeVYdjsu1pzXpaI7LmDJXw0wot1nxVhCdZtG+PR6HY84edjwXoDeaK/ZzBAVSZ5jBhEev2jRE0CxV4Qlii5oL8ftT1E4hmcYdr9DvouN0a2CTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765339437; c=relaxed/relaxed;
	bh=Sjt6AKiAGfY2DYLTvRkzwaayG5lLo8YMVakAMaNVKug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6cnpCdC/Sdv25nfQmCJ2QM/cHm2t6mR5qo7xuDESI76m+XcAQyT6EJTllC3BizG83aMOhS5B+RZwar8lwaZzGPaQWVyyEu0rynZDeH445vAxOqp9mQoIWyZU27r89RwZVbAWWHIyA4xu7TemaKjnpy9sSIf192fkJNy9AYgixqMzOFyxXdWBmM1ZbOnOFbOvfOta6/nRG5sF0Kl5ocFdf3Rid2v9dIuiWxch3JLO60kgDoF2tJcO9PjOdGo6Asfk68jTPrcjiNg+0TBMjGnaQyp/OoHzD1v1Uoc0DiAkTlizi2DWH44rlFdN4Z6B7+GbTzejRZ3bZ26/VMd90Cckg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIuiO1LR; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIuiO1LR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dR2CG1SkXz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 15:03:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765339435; x=1796875435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ht4/NY58pzh2xKGJAfz3rETdh6qS6iJwubp0rRrTsrY=;
  b=mIuiO1LRYczS4Ai+4IAVkqeXRsd5EsQ3gQM/JEw134YI7lBtiF2lMZ+v
   BeGIjdIlvpAWeqO6XbTtXk+V9gZXCHylsq1kVZFn6ZwzScfLt5ejbrL3y
   BzcpKwUHWHHoTBfi6eIlLDay4n0qlc47J2In5vNcQCYsT/BV7v9uib4kA
   JAf1Stl0yfi/A+KX+z8YfVO5i7TcoCWCXx7tLzImeVyLh4oO+OXiTFJ8m
   zv7a5LNfGdVV9XK9vNu8xF721ua8FnzSB/xQ6saIKv0Z4S9fV88+rbt6K
   btFfm8PFCp3bZKHFbchAaOdcTHGHoPu3wfdL18ROPCk5OkqKxirnpcAtA
   A==;
X-CSE-ConnectionGUID: sbL+dr14TWyMWQodSwRPtg==
X-CSE-MsgGUID: cS89Fi9fSUyIS26QAoJ0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="92781413"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="92781413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 20:03:49 -0800
X-CSE-ConnectionGUID: Yq1TYNIbQHmrhnR7Pa0JsQ==
X-CSE-MsgGUID: UD1iT3laRviqRDPWHdq24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196874502"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Dec 2025 20:03:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTBQS-000000002e0-3NJY;
	Wed, 10 Dec 2025 04:03:40 +0000
Date: Wed, 10 Dec 2025 12:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>, mahesh@linux.ibm.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu, gregkh@linuxfoundation.org,
	oohall@gmail.com, npiggin@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, tyreld@linux.ibm.com,
	vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com,
	sourabhjain@linux.ibm.com
Subject: Re: [PATCH 3/4] powerpc/pseries: Add RTAS error injection validation
 helpers
Message-ID: <202512101130.EYUo0oZx-lkp@intel.com>
References: <20251205094510.4671-4-nnmlinux@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205094510.4671-4-nnmlinux@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Narayana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.18 next-20251209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Narayana-Murty-N/powerpc-rtas-Handle-special-return-format-for-RTAS_FN_IBM_OPEN_ERRINJCT/20251205-214855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251205094510.4671-4-nnmlinux%40linux.ibm.com
patch subject: [PATCH 3/4] powerpc/pseries: Add RTAS error injection validation helpers
config: powerpc64-randconfig-r122-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101130.EYUo0oZx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101130.EYUo0oZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101130.EYUo0oZx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/powerpc/platforms/pseries/eeh_pseries.c:743:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:743:55: sparse:     expected unsigned short [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:743:55: sparse:     got restricted __be16 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:767:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:767:40: sparse:     expected unsigned short [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:767:40: sparse:     got restricted __be16 [usertype]
>> arch/powerpc/platforms/pseries/eeh_pseries.c:973:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:973:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:973:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:984:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:984:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:984:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:985:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:985:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:985:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:998:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:998:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:998:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:999:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:999:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:999:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1000:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1000:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1000:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1001:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1001:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1001:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1002:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1002:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1002:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1003:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1003:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1003:26: sparse:     got restricted __be32 [usertype]
>> arch/powerpc/platforms/pseries/eeh_pseries.c:1016:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1016:26: sparse:     expected unsigned long long [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1016:26: sparse:     got restricted __be64 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1017:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1017:26: sparse:     expected unsigned long long [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1017:26: sparse:     got restricted __be64 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1018:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1018:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1018:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1019:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1019:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1019:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1020:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1020:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1020:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1021:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1021:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1021:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1029:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1029:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1029:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1030:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1030:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1030:26: sparse:     got restricted __be32 [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1036:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/powerpc/platforms/pseries/eeh_pseries.c:1036:26: sparse:     expected unsigned int [usertype]
   arch/powerpc/platforms/pseries/eeh_pseries.c:1036:26: sparse:     got restricted __be32 [usertype]

vim +973 arch/powerpc/platforms/pseries/eeh_pseries.c

   937	
   938	
   939	/**
   940	 * prepare_errinjct_buffer - Prepare RTAS error injection work buffer
   941	 * @pe:   EEH PE for the target device(s)
   942	 * @type: RTAS error type
   943	 * @func: Error function selector (semantics vary by type)
   944	 * @addr: Address argument (type-dependent)
   945	 * @mask: Mask argument (type-dependent)
   946	 *
   947	 * Clears the global error injection work buffer and populates it based on
   948	 * the error type and parameters provided. Performs inline validation of the
   949	 * arguments for each supported error type.
   950	 *
   951	 * Return: 0 on success, or RTAS_INVALID_PARAMETER / -EINVAL on failure.
   952	 */
   953	
   954	static int prepare_errinjct_buffer(struct eeh_pe *pe, int type, int func,
   955					   unsigned long addr, unsigned long mask)
   956	{
   957		u64 *buf64;
   958		u32 *buf32;
   959	
   960		memset(rtas_errinjct_buf, 0, RTAS_ERRINJCT_BUF_SIZE);
   961		buf64 = (u64 *)rtas_errinjct_buf;
   962		buf32 = (u32 *)rtas_errinjct_buf;
   963	
   964		switch (type) {
   965		case RTAS_ERR_TYPE_RECOVERED_SPECIAL_EVENT:
   966			/* func must be 1 = non-persistent or 2 = persistent */
   967			if (func < 1 || func > 2)
   968				return RTAS_INVALID_PARAMETER;
   969	
   970			if (validate_special_event(addr, mask))
   971				return RTAS_INVALID_PARAMETER;
   972	
 > 973			buf32[0] = cpu_to_be32(func);
   974			break;
   975	
   976		case RTAS_ERR_TYPE_CORRUPTED_PAGE:
   977			/* addr required: physical page address */
   978			if (addr == 0)
   979				return RTAS_INVALID_PARAMETER;
   980	
   981			if (validate_corrupted_page(pe, addr, mask))
   982				return RTAS_INVALID_PARAMETER;
   983	
   984			buf32[0] = cpu_to_be32(upper_32_bits(addr));
   985			buf32[1] = cpu_to_be32(lower_32_bits(addr));
   986			break;
   987	
   988		case RTAS_ERR_TYPE_IOA_BUS_ERROR:
   989			/* 32-bit IOA bus error: addr/mask optional */
   990			if (func < EEH_ERR_FUNC_LD_MEM_ADDR || func > EEH_ERR_FUNC_MAX)
   991				return RTAS_INVALID_PARAMETER;
   992	
   993			if (addr || mask) {
   994				if (validate_ioa_bus_error(pe, addr, mask))
   995					return RTAS_INVALID_PARAMETER;
   996			}
   997	
   998			buf32[0] = cpu_to_be32((u32)addr);
   999			buf32[1] = cpu_to_be32((u32)mask);
  1000			buf32[2] = cpu_to_be32(pe->addr);
  1001			buf32[3] = cpu_to_be32(BUID_HI(pe->phb->buid));
  1002			buf32[4] = cpu_to_be32(BUID_LO(pe->phb->buid));
  1003			buf32[5] = cpu_to_be32(func);
  1004			break;
  1005	
  1006		case RTAS_ERR_TYPE_IOA_BUS_ERROR_64:
  1007			/* 64-bit IOA bus error: addr/mask optional */
  1008			if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
  1009				return RTAS_INVALID_PARAMETER;
  1010	
  1011			if (addr || mask) {
  1012				if (validate_ioa_bus_error(pe, addr, mask))
  1013					return RTAS_INVALID_PARAMETER;
  1014			}
  1015	
> 1016			buf64[0] = cpu_to_be64(addr);
  1017			buf64[1] = cpu_to_be64(mask);
  1018			buf32[4] = cpu_to_be32(pe->addr);
  1019			buf32[5] = cpu_to_be32(BUID_HI(pe->phb->buid));
  1020			buf32[6] = cpu_to_be32(BUID_LO(pe->phb->buid));
  1021			buf32[7] = cpu_to_be32(func);
  1022			break;
  1023	
  1024		case RTAS_ERR_TYPE_CORRUPTED_DCACHE_START:
  1025		case RTAS_ERR_TYPE_CORRUPTED_DCACHE_END:
  1026		case RTAS_ERR_TYPE_CORRUPTED_ICACHE_START:
  1027		case RTAS_ERR_TYPE_CORRUPTED_ICACHE_END:
  1028			/* addr/mask optional, no strict validation */
  1029			buf32[0] = cpu_to_be32(addr);
  1030			buf32[1] = cpu_to_be32(mask);
  1031			break;
  1032	
  1033		case RTAS_ERR_TYPE_CORRUPTED_TLB_START:
  1034		case RTAS_ERR_TYPE_CORRUPTED_TLB_END:
  1035			/* only addr field relevant */
  1036			buf32[0] = cpu_to_be32(addr);
  1037			break;
  1038	
  1039		default:
  1040			pr_err("Unsupported error type 0x%x\n", type);
  1041			return -EINVAL;
  1042		}
  1043	
  1044		pr_debug("RTAS: errinjct buffer prepared: type=%d func=%d addr=0x%lx mask=0x%lx\n",
  1045			 type, func, addr, mask);
  1046	
  1047		return 0;
  1048	}
  1049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

