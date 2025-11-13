Return-Path: <linuxppc-dev+bounces-14153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990AC58C5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 17:37:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6mCd1RNFz2yvX;
	Fri, 14 Nov 2025 03:37:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763051869;
	cv=none; b=Uv1UwSdr1bjrEYhS4xbqs4IUeos6SC57Qy1HC5HGojyIWH+ayjKBXHlKE5XB6T4ead8SlUoEKlTCtjO7pirAu7kq5al7/aEax9dixf0QYC0Gk7gu+qlv8h06cUhWDz2UY6TxZPbymVdLAJycgBmCoinXMt5WdFay4Pjlgu69CPyZyHu6us1IaPRFYJLKzTedhyfuqf4txQgtrFjJE0AZX8QFBsdTlCBG8+wUSKH/3JFSLYAvJoL5KwmdIJmqn7+dEKgEriQsB0M+qPmVceeAbSp24cTinJCFOPwtcZBR1nssZC8e/v2RetqYq/gaDZnMmFEiCUB56VFDttCHqxDqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763051869; c=relaxed/relaxed;
	bh=CQXzyxAcHfmUtY+UCZ8wl/pBAchDnr9oOVWSovD6IZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFx9GDyAWXDa6pmU7VtbEBXizgBFSHuelWrYA6h+sxsHKlfJLXAw/6jkNrukO43mbzSRLLjZpAJOFNPx8eqwxPDdKzcsAy+Z1PFMkxCyb3QwtyejTWVEdXRPj2wreMFYgxGElJQHFuUBaJUbiH8cSaf6RKWUmYyBP2AdPZ2jG7yrWMIi8AEPbGdQnJbaNUt37AyLVfepi9ensi4CukeiwcsJPkVol1Lemda0Dn50LKUGdfs+PoBKAhwCoFqWj2wfb/u5Fa4NZb46vvDBuYfBCkhbi8eJB+Tw+6+QmVqNcc2pki2gnOa7bOGQt8KKEftwopaosgMCQPbNe6fcBym69w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eE5L6XRr; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eE5L6XRr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6mCZ5p5Bz2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 03:37:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763051867; x=1794587867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mmqn1Kyfev0y06jqAaqtR8wdEE/IcmPcYenfXFTbKkE=;
  b=eE5L6XRrNZqH8CHRWmu+lM1qc4TeF/OEfdFBgmMCOFRN/U00BmD/b3iw
   Ot5GLprxDDwS50FrLhUrGnRRiaL76UWgTWuPQZCSbp9NMMn3SW+QNVvZt
   Zi5Tlf/ympsjCvkOT0d6FJLxtZy1KJmOVleTxi9E69nDZbtoPzsHLVbrg
   YiEdF4sngTwRC0U6xmtqTgtOTHOrH34gFQawftUUQR8Hqqrt9eDqhAgq0
   6pXNzcuM5HUr7TV+jbTsVrOYYWpxkDtX+mshw+baBnReNpQ1AYjYxWVPR
   avwHbvnj4p7EtC7f5n/bs3zMNxGn/4a6dQ0l8YDvTSopBpvtb6cjvGHo8
   w==;
X-CSE-ConnectionGUID: g3idZ7GLQUS6O65ng17jBQ==
X-CSE-MsgGUID: L/y4Z1w9R1OfB0pyYH0uXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65045395"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="65045395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 08:37:41 -0800
X-CSE-ConnectionGUID: 7RiY0OdzT9aFiYWmhk1nDQ==
X-CSE-MsgGUID: fJiTG3P2Q+KgY/WZ3m7agw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="220358821"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2025 08:37:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJaKE-0005Zf-1n;
	Thu, 13 Nov 2025 16:37:34 +0000
Date: Fri, 14 Nov 2025 00:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Srikar Dronamraju <srikar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>
Subject: Re: [PATCH 2/2] pseries/dtl: Remove locks held warning.
Message-ID: <202511140025.2eZn4KhO-lkp@intel.com>
References: <20251112111051.826922-2-srikar@linux.ibm.com>
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
In-Reply-To: <20251112111051.826922-2-srikar@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Srikar,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srikar-Dronamraju/pseries-dtl-Remove-locks-held-warning/20251112-191217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251112111051.826922-2-srikar%40linux.ibm.com
patch subject: [PATCH 2/2] pseries/dtl: Remove locks held warning.
config: powerpc64-randconfig-001-20251113 (https://download.01.org/0day-ci/archive/20251114/202511140025.2eZn4KhO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140025.2eZn4KhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140025.2eZn4KhO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dtl_count
   >>> referenced by lpar.c
   >>>               arch/powerpc/platforms/pseries/lpar.o:(.toc+0x88) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

