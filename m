Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB293A990
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 00:59:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OQw3puFH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTCJr0r0Jz3cVl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 08:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OQw3puFH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTCJ74c2bz30VM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 08:59:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721775544; x=1753311544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qLz5MZwWJR9sFS+bnHNameeV1+9Wjxm+TbXv2evNJyI=;
  b=OQw3puFHoupaST/YetF24/NLObgQCUJvkLPipHdbnlq27//t+HWMWXbU
   xH2xr2C9oV9CHHkvryxoGklCK1ZjslCSRSuhMIn0Bq12KLK+GnwM9FnP4
   R7pLTf1CJSvHWz85lSOw/F11g2l5KDFx3nk2fYYl8WSlmXqHsWWOcTPhi
   W+lgqdUM14C+7JdxDbL4Wlm6gkXugkKhpO/Q0B9TaOybsMTHcnkqpIULf
   E6aFg4tT8J1I4BvPP04+Ue3/8dlGjdMPnWI+EQVOlgWQlz88OsODKLLL0
   d++B/i6iRqmwlzx99+XXX+YXF49Cs7HI6UJ3/KxKUkqqwp5iWAGUG1rjY
   g==;
X-CSE-ConnectionGUID: cJGVO+pnSnWpyFtsJWOjVg==
X-CSE-MsgGUID: zbDAHQWIQT2bOEw8kPGFsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19234179"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="19234179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 15:59:01 -0700
X-CSE-ConnectionGUID: ZbtqDCKlQLqSvP5SZzyLiQ==
X-CSE-MsgGUID: apZ8yC1uQDqr5FHhv+hN7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="52413972"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2024 15:58:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWOT6-000mQz-1U;
	Tue, 23 Jul 2024 22:58:52 +0000
Date: Wed, 24 Jul 2024 06:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Balasubramanian <vigbalas@amd.com>,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v4 1/1] x86/elf: Add a new .note section containing
 xfeatures buffer layout info to x86 core files
Message-ID: <202407240632.KnGdRoYR-lkp@intel.com>
References: <20240723090454.8241-2-vigbalas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723090454.8241-2-vigbalas@amd.com>
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@freebsd.org, bpetkov@amd.com, binutils@sourceware.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, oe-kbuild-all@lists.linux.dev, naveen.n.rao@linux.ibm.com, Borislav Petkov <bp@alien8.de>, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vignesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/execve]
[also build test ERROR on tip/x86/core kees/for-next/pstore kees/for-next/kspp linus/master v6.10 next-20240723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vignesh-Balasubramanian/x86-elf-Add-a-new-note-section-containing-xfeatures-buffer-layout-info-to-x86-core-files/20240723-170946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20240723090454.8241-2-vigbalas%40amd.com
patch subject: [PATCH v4 1/1] x86/elf: Add a new .note section containing xfeatures buffer layout info to x86 core files
config: x86_64-buildonly-randconfig-003-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240632.KnGdRoYR-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240632.KnGdRoYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240632.KnGdRoYR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/asm/elf.h:6:9: error: unknown type name 'u32'
       6 |         u32 type;
         |         ^~~
   ./usr/include/asm/elf.h:7:9: error: unknown type name 'u32'
       7 |         u32 size;
         |         ^~~
   ./usr/include/asm/elf.h:8:9: error: unknown type name 'u32'
       8 |         u32 offset;
         |         ^~~
   ./usr/include/asm/elf.h:9:9: error: unknown type name 'u32'
       9 |         u32 flags;
         |         ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
