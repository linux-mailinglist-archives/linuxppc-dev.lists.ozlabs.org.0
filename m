Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591A727379
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc43W6YXRz3dxZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 09:55:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EBEakHqu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EBEakHqu;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc42b6w9Hz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 09:54:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686182088; x=1717718088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o0coyrEYJkX6FBDvnT+ZO3PeoSubsXx9+zPnYTYGm44=;
  b=EBEakHqu1xI8R28lKygfFIP8hwop4qtdHIkhtchQKJtZICNyd74W5dUX
   yzllyx5KiqgFQi4nkqi+F03mevKb9TQ2cJxClUVZhXveuK0Zkhz99agLT
   N0EYA7L2WiBFlqT0ZdaKYS+mYjE+wbjVgY0kStHC6wn5sez22oBjS9vnf
   i9qgboIUS5y/zlh/QPX3fjdyOYS5NDTtjtfyxOdBptN28RTKRfjlCBgdh
   3iv3GZd/w7PKWpuNjZw2pnWF5bh9Mvor3fmq/IJ9gos9Tt9BTI6/zBa3j
   xNSKY7x7fYE7wug0dvMNe7d5Cz9vVquHy/0UUhnOzXWVefR0sXweBKOCF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337503239"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="337503239"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 16:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="774826443"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="774826443"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2023 16:54:34 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q72z3-000711-1U;
	Wed, 07 Jun 2023 23:54:33 +0000
Date: Thu, 8 Jun 2023 07:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH 15/16] powerpc/book3s64/radix: Add support for vmemmap
 optimization for radix
Message-ID: <202306080711.eEcyyPFk-lkp@intel.com>
References: <20230606045608.55127-16-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606045608.55127-16-aneesh.kumar@linux.ibm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes akpm-mm/mm-everything linus/master v6.4-rc5]
[cannot apply to nvdimm/libnvdimm-for-next tip/x86/core nvdimm/dax-misc next-20230607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/powerpc-mm-book3s64-Use-pmdp_ptep-helper-instead-of-typecasting/20230606-125913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230606045608.55127-16-aneesh.kumar%40linux.ibm.com
patch subject: [PATCH 15/16] powerpc/book3s64/radix: Add support for vmemmap optimization for radix
reproduce:
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch powerpc next
        git checkout powerpc/next
        b4 shazam https://lore.kernel.org/r/20230606045608.55127-16-aneesh.kumar@linux.ibm.com
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080711.eEcyyPFk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/powerpc/vmemmap_dedup.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
