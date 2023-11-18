Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 741517EFFF5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 14:43:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uz49Kpxx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXZk22qx6z3dHP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 00:43:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uz49Kpxx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXZj00bp9z2yF9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 00:42:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700314981; x=1731850981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gSMTqvq+4yiOQm6kYsedLkv+Vn7EFGQOlrwRuuC1Mmk=;
  b=Uz49Kpxx8bK1Yv2VhquOWhDNCSIzxg5vjtNVJvHXbEMSDSnrRE+J14Ls
   gTe873BsxuuD8OI9Wd7uqGwy/VNR0mVQPxyePQM86PwlIAGttqfnf+MPZ
   xN9+LztiCxCpONQc3KRfcZsseEt2GbZvQhadSeeky9cztIq/SiFtRbURm
   x3BSEAjl8nD0AvJ4ZhkyYeDzmrMKulw/Wrd0xPW5a7aVoseDkFUbMmP54
   1tqr4UIOiHOjnxAQ5EKvdYoZdOa80DLGM0j1JojiGgaYdEd6lXTJMpsj+
   FeWVyL6IIlnyb7LVqDxdiNXUikJj2ShUslBxoJefH0havyxSRxP2Bkibj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="388579893"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="388579893"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 05:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="909670491"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="909670491"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2023 05:42:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Lal-0003wp-39;
	Sat, 18 Nov 2023 13:42:35 +0000
Date: Sat, 18 Nov 2023 21:42:28 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Maurer <mmaurer@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 3/5] modpost: Extended modversion support
Message-ID: <202311182118.zJqkg301-lkp@intel.com>
References: <20231118025748.2778044-4-mmaurer@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118025748.2778044-4-mmaurer@google.com>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, oe-kbuild-all@lists.linux.dev, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on powerpc/next powerpc/fixes masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Maurer/export_report-Rehabilitate-script/20231118-110040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20231118025748.2778044-4-mmaurer%40google.com
patch subject: [PATCH v2 3/5] modpost: Extended modversion support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231118/202311182118.zJqkg301-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311182118.zJqkg301-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311182118.zJqkg301-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/module_64.c:25:10: fatal error: string.h: No such file or directory
      25 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.


vim +25 arch/powerpc/kernel/module_64.c

     8	
     9	#include <linux/module.h>
    10	#include <linux/elf.h>
    11	#include <linux/moduleloader.h>
    12	#include <linux/err.h>
    13	#include <linux/vmalloc.h>
    14	#include <linux/ftrace.h>
    15	#include <linux/bug.h>
    16	#include <linux/uaccess.h>
    17	#include <linux/kernel.h>
    18	#include <asm/module.h>
    19	#include <asm/firmware.h>
    20	#include <asm/code-patching.h>
    21	#include <linux/sort.h>
    22	#include <asm/setup.h>
    23	#include <asm/sections.h>
    24	#include <asm/inst.h>
  > 25	#include <string.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
