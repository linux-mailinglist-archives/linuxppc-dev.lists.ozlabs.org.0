Return-Path: <linuxppc-dev+bounces-6593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDF0A4AD85
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Mar 2025 20:34:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4wHT0KRJz2yGM;
	Sun,  2 Mar 2025 06:33:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740857636;
	cv=none; b=avQmpznW8Dg+Zp2Uk5Oz2OzouYLbDDTua/5Mtnb6f+odQv4bnU8WtCOzBfJ8IMlr9lDkxXjzdH+1eAtN59IKqV2otWmQXdsad4FtpOYQraJ8Yod98rnxkEOXDz6s3QlcRs60EaZhEeij7oeieN6iiOFlQEeOkc1p02p26s4dtU5ear6C5yF33YpaEVK/lF+9jpfOuJM3Ruvpnq/MAi2k3NzfzhDoSPLLKL2RnfCZo8PayrzJd97SfHLiDNrrT4MsVBI0aFzznkw6O3nTnobIZUkYIxtSy9hWlhFUNyeURGRU1UKGX9Gxj29n6+8xOq9hMPd79ZYmUNDxIHjJ6t2S0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740857636; c=relaxed/relaxed;
	bh=OWv17gsxtxjrqbPYZn+im3QnpeRgohNnDH8L/hw+Zkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVHr7wE2VWKlzB9U5vZUppK5PqyNgrK+TPJqdcvIWf+JKZRX/9RsZXCe90vZ+IoRbXOk5sKVI8E5yPeLOmivZ6ItnHD71P2ZZDURYs0XwSptK/IzD2GAEfUrhHS8AZzk6PqGd/aGpS+DTcAgO/LZLmo6VxKliS9huJ9NA37OKINAYzPY0rVL3TMQ8kUYc45bMN5MOD6rmC1MZmk7yLXkQFrBEcyW3+8fSwg9v5GbRQpah6S1rjA0DvEkHypfPJDgaypi95+6+521nfZ+qfEDRUaVpGAr3Wzvh7MwlxkrnLxFsMn82eO/i8Ju2++/1whbcA5GB+qDWYiaeA6J9UqQYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J+z1JHTa; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J+z1JHTa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4wHP4rnkz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 06:33:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740857635; x=1772393635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7+mfL4nxARIzg/D/ViQ6SzXLcJloibEqmI0+Ez6F/mQ=;
  b=J+z1JHTaReLhxgVHWz1weZAYIXbKAys5X0VZ2cnfWQOOqE6NwCr3hRZV
   rzfsEXYm0vq2aIzQfd7ZguYIQWQkDy5LojqmwI0cOqkhhDBBc5YuFG0kr
   FmuqWFY7KBhaYU8K70zgb0w+KA8R6+udTEHw6F9URa+LXeZIkM4iBFIwF
   QRWCVOwKPnrlEsntT6B5Dr71DngIc9dZwXO/pDyhwfVvpwxiWB9hZ3a3q
   FIqNQ9uoTpXAit8RrqKJIiVzSYLQTdJlxMnBm31XgzBwKczZL1ubYE5go
   9V92jmlDRrMh2ophlf82CHtwJw7IOKc1ljvB+Ca+VwC1llvOQjbNhcUpW
   w==;
X-CSE-ConnectionGUID: yrnb20wZSiW8IPckenMkOA==
X-CSE-MsgGUID: BUKQs9NLTpS/sqKPel/pQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41795454"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41795454"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:33:49 -0800
X-CSE-ConnectionGUID: qXHbsIC+TFKyonvg+JVwgQ==
X-CSE-MsgGUID: FktDV3sVTmOk2XPuR4o6BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117414106"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Mar 2025 11:33:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toSac-000Gbm-2W;
	Sat, 01 Mar 2025 19:33:36 +0000
Date: Sun, 2 Mar 2025 03:33:09 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] usb: replace strcpy() with strscpy()
Message-ID: <202503020319.Lj7EYfWc-lkp@intel.com>
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
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20250302/202503020319.Lj7EYfWc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020319.Lj7EYfWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020319.Lj7EYfWc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:132:2: error: static assertion failed due to requirement '!(!(!__builtin_types_compatible_p(char *, char *)))': must be array
     132 |         strscpy(str, s);
         |         ^~~~~~~~~~~~~~~
   include/linux/string.h:114:2: note: expanded from macro 'strscpy'
     114 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/string.h:80:40: note: expanded from macro '__strscpy0'
      80 |         sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
         |                                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:202:28: note: expanded from macro '__must_be_array'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     203 |                                                         "must be array")
         |                                                         ~~~~~~~~~~~~~~~~
   include/linux/compiler.h:197:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^~~~
   1 error generated.


vim +132 drivers/usb/gadget/configfs.c

   112	
   113	static int usb_string_copy(const char *s, char **s_copy)
   114	{
   115		int ret;
   116		char *str;
   117		char *copy = *s_copy;
   118	
   119		ret = strlen(s);
   120		if (ret > USB_MAX_STRING_LEN)
   121			return -EOVERFLOW;
   122		if (ret < 1)
   123			return -EINVAL;
   124	
   125		if (copy) {
   126			str = copy;
   127		} else {
   128			str = kmalloc(USB_MAX_STRING_WITH_NULL_LEN, GFP_KERNEL);
   129			if (!str)
   130				return -ENOMEM;
   131		}
 > 132		strscpy(str, s);
   133		if (str[ret - 1] == '\n')
   134			str[ret - 1] = '\0';
   135		*s_copy = str;
   136		return 0;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

