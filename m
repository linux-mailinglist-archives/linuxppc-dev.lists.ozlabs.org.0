Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB07BC2FE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 01:42:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1DZ8rKY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2Q352Qwrz3vbn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 10:42:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1DZ8rKY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2Q284WL6z3dDT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 10:42:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696635729; x=1728171729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z5lw+ELIGqiFFX/8kKpb/SeKX6PDQoTNHop1LwY13SU=;
  b=V1DZ8rKYwfEOiCvV6YNI+4A1CdmRVsj7yWUYaBHJu3VNqzfzQNid6ukv
   fVWADPeg/Lz38x1B7DC3AXHkO/R0Br6W9i0ODQVqId96uAqKIhQXqinMt
   eEylIMSCU1fv9skF75/d5ejiXSRx2ExwPk6PXzsLtHruzH5LUmaMLr2q3
   R5zXcnET9X54KfUX1q276uh6UmQEbcNEtb1WCbCIWgawqv1v1WEl0Q4Mu
   FZ7A/1oQ7BURajn9hDsHXiU99+BZSeOH68Hr3LjYkTr3WriTl3RXGfq6Y
   3fNA0uYytsquQ+V3HNtWCkmRFawIzSihG7gnHzFsZ+1tg/nqsY4RLe8xH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="374191566"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="374191566"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 16:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="818170703"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="818170703"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Oct 2023 16:41:36 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qouRq-0003kI-0S;
	Fri, 06 Oct 2023 23:41:34 +0000
Date: Sat, 7 Oct 2023 07:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH 5/7] powerpc/pseries/papr-sysparm: expose chardev API to
 user space
Message-ID: <202310070732.jj0Y8Vkb-lkp@intel.com>
References: <20231006-papr-sys_rtas-vs-lockdown-v1-5-3a36bfb66e2e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006-papr-sys_rtas-vs-lockdown-v1-5-3a36bfb66e2e@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eddc90ea2af5933249ea1a78119f2c8ef8d07156]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Lynch-via-B4-Relay/powerpc-uapi-export-papr-miscdev-h-header/20231007-050832
base:   eddc90ea2af5933249ea1a78119f2c8ef8d07156
patch link:    https://lore.kernel.org/r/20231006-papr-sys_rtas-vs-lockdown-v1-5-3a36bfb66e2e%40linux.ibm.com
patch subject: [PATCH 5/7] powerpc/pseries/papr-sysparm: expose chardev API to user space
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231007/202310070732.jj0Y8Vkb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310070732.jj0Y8Vkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310070732.jj0Y8Vkb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/papr-sysparm.c: In function 'papr_sysparm_buf_from_user':
>> arch/powerpc/platforms/pseries/papr-sysparm.c:208:24: warning: variable 'param' set but not used [-Wunused-but-set-variable]
     208 |         papr_sysparm_t param;
         |                        ^~~~~


vim +/param +208 arch/powerpc/platforms/pseries/papr-sysparm.c

   203	
   204	static struct papr_sysparm_buf *
   205	papr_sysparm_buf_from_user(const struct papr_sysparm_io_block __user *user_iob)
   206	{
   207		struct papr_sysparm_buf *kern_spbuf;
 > 208		papr_sysparm_t param;
   209		long err;
   210		u16 len;
   211	
   212		/*
   213		 * The parameter index that userspace wants to query or update.
   214		 */
   215		if (get_user(param.token, &user_iob->parameter))
   216			return ERR_PTR(-EFAULT);
   217		/*
   218		 * The length of valid data that userspace claims to be in
   219		 * user_iob->data[].
   220		 */
   221		if (get_user(len, &user_iob->length))
   222			return ERR_PTR(-EFAULT);
   223	
   224		static_assert(sizeof(user_iob->data) >= PAPR_SYSPARM_MAX_INPUT);
   225		static_assert(sizeof(kern_spbuf->val) >= PAPR_SYSPARM_MAX_INPUT);
   226	
   227		if (len > PAPR_SYSPARM_MAX_INPUT)
   228			return ERR_PTR(-EINVAL);
   229	
   230		kern_spbuf = papr_sysparm_buf_alloc();
   231		if (!kern_spbuf)
   232			return ERR_PTR(-ENOMEM);
   233	
   234		papr_sysparm_buf_set_length(kern_spbuf, len);
   235	
   236		if (len > 0 && copy_from_user(kern_spbuf->val, user_iob->data, len)) {
   237			err = -EFAULT;
   238			goto free_sysparm_buf;
   239		}
   240	
   241		return kern_spbuf;
   242	
   243	free_sysparm_buf:
   244		papr_sysparm_buf_free(kern_spbuf);
   245		return ERR_PTR(err);
   246	}
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
