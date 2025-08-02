Return-Path: <linuxppc-dev+bounces-10531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1DB1905A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 00:52:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bvdNw5vR3z2xWc;
	Sun,  3 Aug 2025 08:52:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754175120;
	cv=none; b=UV5jk+jsh/ml6SP8PGg+zDqOMYJFxrTTsJlMLtN1j5ISKkyDDIaUO1NMWp0S7cZFwQri/wMl6WEsCIu+LerrRXfABXWg4IkJmFNGLQS4Gb45BVpeNkdLgaG5Ll1L1PgBgiiTqZOPglFPhrRkHVFSN0Kser12LwGwWD132L+Ns26kr9hp+dxhRPQqjJhv9KNlq5thytmYitgdNkYrwex8ysI0tGBauuivUD6JOgwcL6AemniSthk6YdXGDWP7sboozTl0d6xIjhXzZGRD8p0CKrbORNZYo9dQl08ByEn1gvzGS+XiBAGrQ4dlPkRFb6NmL/OuCGwjRgCZc17NJOx/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754175120; c=relaxed/relaxed;
	bh=Emnxap93KZFrG5Ywc5J7/Rjzfk44lmBvUuSKIldW0tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/n+/OTlpk6bQlhgVXej6Ko9qNX568KxGHWgkFQtc3uT012x0FLw/64A1Qll2BY0u/RbtwukWKAKnk3r9M+mUhcM+mwjHMScKm4gI8wIDQQddqNw82yQ4ppBcHjYf9BjeH/bxQFQuaH/rkHKWQx0wsBURZ7ypBhSM5oMUKuhGOG2UZ/GjtmEfDe7ZtjgVb5aB/JswWl2iy2aRX9Gnk3aCH059jnYjNMEf8lbOH+BQIgpDibn6U43zyAfEtNnNKZj3Apq72YovsrqufbFBPDDzaRruA3R92TWV3VxSTdc8BF44Ikb1agARe8o+3z+eqGmWrtd2fpVSZwzl8nnA+xpkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fNIH6iiu; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fNIH6iiu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bvdNt5GScz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Aug 2025 08:51:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754175120; x=1785711120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y/n12O9fa44RVpWSR/uGMzs+dyOyktMqkxPoVmLAku4=;
  b=fNIH6iiuFsfvypxueEIt475Xmq4cLKepx4OJeGrwZoYqRGwlFXkX0xZm
   PjNfvFHvXuyFRi7/6V4R0nEWr39zKI0UuVNcvzbhkpuFxGtXSV3yPrUP1
   QqetjPedcaKRFMOsLkPfvxpkB1XO5uHiqs5yjGwKIrihimTvlbkWhJa9/
   m2MqO5++4lCi0mp7FM5PPKLpz4bW7zJDVULRoSt2FLNTPGeJbM3MPltDA
   pV0VnKQ0T9NrS6dQmcXBI87/KafkM46T2Jjj9yU4M7VtMAG+n2qe4A3by
   HjuNvW0o6ZhDsSZW9z/QUtb/VxlaOasBQKBf/vhAj718FuP52SDp4auNi
   w==;
X-CSE-ConnectionGUID: Nyk+k34pRH6nJq9mjySHhQ==
X-CSE-MsgGUID: B2G6noUkTLugETF3eo7heQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56353676"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56353676"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 15:51:54 -0700
X-CSE-ConnectionGUID: L+yFVs7uRFmFVZcvmyaMfw==
X-CSE-MsgGUID: tbag8bmURFWXVRhQISzQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164639906"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Aug 2025 15:51:51 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiL4u-0005dc-2A;
	Sat, 02 Aug 2025 22:51:48 +0000
Date: Sun, 3 Aug 2025 06:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
	mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH 8/9] powerpc/pseries: Enable hvpipe with
 ibm,set-system-parameter RTAS
Message-ID: <202508030602.TrsVGpjD-lkp@intel.com>
References: <20250802024121.955274-9-haren@linux.ibm.com>
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
In-Reply-To: <20250802024121.955274-9-haren@linux.ibm.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes v6.16]
[cannot apply to linus/master next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-papr-hvpipe-ioctl/20250802-104715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250802024121.955274-9-haren%40linux.ibm.com
patch subject: [PATCH 8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
config: powerpc64-randconfig-001-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030602.TrsVGpjD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030602.TrsVGpjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030602.TrsVGpjD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/papr-hvpipe.c:725:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     725 |         if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:737:9: note: uninitialized use occurs here
     737 |         return ret;
         |                ^~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:725:2: note: remove the 'if' if its condition is always true
     725 |         if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:725:6: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     725 |         if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:737:9: note: uninitialized use occurs here
     737 |         return ret;
         |                ^~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:725:6: note: remove the '&&' if its condition is always true
     725 |         if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:703:9: note: initialize the variable 'ret' to silence this warning
     703 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +725 arch/powerpc/platforms/pseries/papr-hvpipe.c

   700	
   701	static int __init papr_hvpipe_init(void)
   702	{
   703		int ret;
   704	
   705		if (!of_find_property(rtas.dev, "ibm,hypervisor-pipe-capable",
   706			NULL))
   707			return -ENODEV;
   708	
   709		if (!rtas_function_implemented(RTAS_FN_IBM_SEND_HVPIPE_MSG) ||
   710			!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG))
   711			return -ENODEV;
   712	
   713		papr_hvpipe_work = kzalloc(sizeof(struct work_struct), GFP_ATOMIC);
   714		if (!papr_hvpipe_work)
   715			return -ENOMEM;
   716	
   717		INIT_WORK(papr_hvpipe_work, papr_hvpipe_work_fn);
   718	
   719		papr_hvpipe_wq = alloc_ordered_workqueue("papr hvpipe workqueue", 0);
   720		if (!papr_hvpipe_wq) {
   721			ret = -ENOMEM;
   722			goto out;
   723		}
   724	
 > 725		if (!enable_hvpipe_IRQ() && !set_hvpipe_sys_param(1)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

