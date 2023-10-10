Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64D7C42DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 23:46:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bbw8PQKF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4qGS5D3Bz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 08:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bbw8PQKF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4qFX6s9Nz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 08:45:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696974321; x=1728510321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MazC0d4ldpknpCv9iDW8ZDGTvGYianP2GSccnWDJ8D0=;
  b=bbw8PQKFkWFz1Hc6lJ7Sh3RkgYauX19nOSZzwahtO1bCqqPA/Bd4qz1q
   88h1xZlmhmOG5osW8xyNwrprcv+7az83I9ihyATbQwCuiyTc4PjCaqH3e
   4JyJeWTLCGfseXTmESkYEht2+CE5Rhx8QDnetIqpKeYD2H/huJhBF2Hdk
   oZy/4nqnY55YfZK730OJNiS35zOYzqUSfAlh9Fi3+m74gGbyZH9UwT5SW
   Hu/7OK3Jp7ohJQbRhrZQhyOjx1QgO27Wi2rz4MJqBeJYok3evM/D+BvcV
   cYFF32zkOzk+pxToVe5Xe878nOre0k+1Xr59veu/Oei37AZAKEUv/ey7K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363865888"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="363865888"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 14:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703459432"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="703459432"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Oct 2023 14:45:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqKXO-0001Ev-05;
	Tue, 10 Oct 2023 21:45:10 +0000
Date: Wed, 11 Oct 2023 05:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH 5/7] powerpc/pseries/papr-sysparm: expose chardev API to
 user space
Message-ID: <202310110529.nINDz0Nx-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on eddc90ea2af5933249ea1a78119f2c8ef8d07156]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Lynch-via-B4-Relay/powerpc-uapi-export-papr-miscdev-h-header/20231007-050832
base:   eddc90ea2af5933249ea1a78119f2c8ef8d07156
patch link:    https://lore.kernel.org/r/20231006-papr-sys_rtas-vs-lockdown-v1-5-3a36bfb66e2e%40linux.ibm.com
patch subject: [PATCH 5/7] powerpc/pseries/papr-sysparm: expose chardev API to user space
config: powerpc64-randconfig-002-20231010 (https://download.01.org/0day-ci/archive/20231011/202310110529.nINDz0Nx-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110529.nINDz0Nx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110529.nINDz0Nx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/papr-sysparm.c: In function 'papr_sysparm_buf_from_user':
>> arch/powerpc/platforms/pseries/papr-sysparm.c:208:24: error: variable 'param' set but not used [-Werror=unused-but-set-variable]
     208 |         papr_sysparm_t param;
         |                        ^~~~~
   cc1: all warnings being treated as errors


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
