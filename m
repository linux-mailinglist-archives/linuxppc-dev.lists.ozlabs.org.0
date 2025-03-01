Return-Path: <linuxppc-dev+bounces-6592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F37AA4AD6D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Mar 2025 19:50:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4vJn4j8yz2yyJ;
	Sun,  2 Mar 2025 05:50:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740855001;
	cv=none; b=kql8PM6t7aHluDYD4l2AW1sCTR4+ZzDKIDUqSigo6EBECbx6enXR38S1IEXmyke9bMZEe3JMIfpkSC1upkcamyr5AodPFqiS+wi2MXjc+oFGTtjJoE1fELpX/bObJ7GObFn2MKbEHVmLGx1z4U0Bl6pAVmZ+JMZCil/CK1RxM9aRXRXPLROhR98L+T88Sr5B5piPF9bPD/CVYrq4l6YhhNzoWUvkgn8MncO+wWJFicJeED2cQER9Rtc8FNGSUrocrsZBt2oDiqEoLK/zQS7n+de2JSblD3oNvsu0eQ4MqQHKZNTVokKR+c+DXE4YhcbD9C0S+K6FkJpi4us7AyLb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740855001; c=relaxed/relaxed;
	bh=hm1qBip7ZdfjnEU5ZwBqqHatooTae60ucPvblgaQl78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=To5cC2uFIwpR0ac3C/Xh3S6ErMlJ9OXwqglGl8hJNCpGbWn918WYlfrdd8LDW91eKoaiSOJqSY0SrYs5oco9jGp2Tojq8h/oCLl7PtrcAR8yQWGqEsj9uUpp/CByItqCj/+efMdIBYMWh2kGRWlcbnD5/6EBOUcl26Z+sADXpe5Kh27Q14lLHe1jAHYqpd2HXX+jiWpCUPMAeznS4B5GaMy/NDMLkZNdKAvvdrA4gtrnrd/LzytgWY+jfkQBhNumez0M1lERkko8EA0TdmCkBw73ig+aMB417Tl3PG07fN3nKBK+EGZxio+kQ22lSsHVxW52zN/l1lI3YRzO1HUUjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GD4vkJNU; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GD4vkJNU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4vJl1DnNz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 05:49:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740855000; x=1772391000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IrOfUSH1K4Wm6o+tYeM48yWS/v2GxQKug3+bX3bY5FY=;
  b=GD4vkJNUdJ+OSRdGyD9hSUiqC5yxJE2YgpDEIg4guUTEfSgQ9B6UNOjn
   FdpnguCKyzJju+bnsHJusUAabw7kRZclK20ZtRrTXp3BbLg0E3oLjLoYU
   T6nCx1z7h1qCePnoE6jI1iLy1HOOv/Yx2p8xLE2p9ugrd/zy62asCLf9y
   mGAds1MBzkKi+oAgKcrxe+gnSsJMrolLVa31WAHamsoL1uu00Ir6P0YU5
   c6NoIewATiz2oWq4UbRfi1hbDlwCt5iIkN8v2oesjDHFVhDnr++7G8D4i
   4raxXkZRVhahzrPK7uqUt7C+D2hyvLN9ckUJW4mFBku+xnIMRWwIOUXFj
   A==;
X-CSE-ConnectionGUID: ykjQPrZUTYqhnpTSZFh/tw==
X-CSE-MsgGUID: HkP1ZBw2SbeQszq12ThZFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="45416194"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="45416194"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 10:49:54 -0800
X-CSE-ConnectionGUID: wWza1SZPTz+XF7JHCbsrcg==
X-CSE-MsgGUID: iL/GJJIYQ8m57G17eAFtBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="122762859"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2025 10:49:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toRuG-000GaG-1A;
	Sat, 01 Mar 2025 18:49:48 +0000
Date: Sun, 2 Mar 2025 02:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Garg <gargaditya08@live.com>,
	"castet.matthieu@free.fr" <castet.matthieu@free.fr>,
	"stf_xl@wp.pl" <stf_xl@wp.pl>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"b-liu@ti.com" <b-liu@ti.com>,
	"johan@kernel.org" <johan@kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"i@zenithal.me" <i@zenithal.me>
Cc: oe-kbuild-all@lists.linux.dev,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] usb: replace strcpy() with strscpy()
Message-ID: <202503020226.3yStuXZ8-lkp@intel.com>
References: <DEF7EF73-12C4-4F30-BC14-DD829F0C6884@live.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEF7EF73-12C4-4F30-BC14-DD829F0C6884@live.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Aditya,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus johan-usb-serial/usb-next johan-usb-serial/usb-linus linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditya-Garg/usb-replace-strcpy-with-strscpy/20250228-230839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/DEF7EF73-12C4-4F30-BC14-DD829F0C6884%40live.com
patch subject: [PATCH] usb: replace strcpy() with strscpy()
config: csky-randconfig-002-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020226.3yStuXZ8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020226.3yStuXZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020226.3yStuXZ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/usb/atm/ueagle-atm.c:15:
   drivers/usb/atm/ueagle-atm.c: In function 'cmvs_file_name':
>> include/linux/compiler.h:197:62: error: static assertion failed: "must be array"
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                              ^~~~~~~~~~~~~~
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:80:47: note: in expansion of macro '__must_be_array'
      80 |         sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
         |                                               ^~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/string.h:114:9: note: in expansion of macro 'CONCATENATE'
     114 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   drivers/usb/atm/ueagle-atm.c:1574:9: note: in expansion of macro 'strscpy'
    1574 |         strscpy(cmv_name, FW_DIR);
         |         ^~~~~~~


vim +197 include/linux/compiler.h

230fa253df6352 Christian Borntraeger 2014-11-25  193  
cb7380de9e4cbc Kees Cook             2025-02-05  194  #ifdef __CHECKER__
cb7380de9e4cbc Kees Cook             2025-02-05  195  #define __BUILD_BUG_ON_ZERO_MSG(e, msg) (0)
cb7380de9e4cbc Kees Cook             2025-02-05  196  #else /* __CHECKER__ */
cb7380de9e4cbc Kees Cook             2025-02-05 @197  #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
cb7380de9e4cbc Kees Cook             2025-02-05  198  #endif /* __CHECKER__ */
cb7380de9e4cbc Kees Cook             2025-02-05  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

