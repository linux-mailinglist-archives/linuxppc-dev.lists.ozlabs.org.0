Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06375BC8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 04:53:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MxYuBMPN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6YzB2dpYz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 12:53:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MxYuBMPN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6YxW1SlRz3c30
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 12:52:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689907935; x=1721443935;
  h=date:from:to:cc:subject:message-id;
  bh=eFLi+0NAqfaX5xTDBVBotzoou8NVsd5ppit5Ze2nW8E=;
  b=MxYuBMPNI7uAHwJgcuhb4amruhtvJspIWH4CsMnPjUywE+BoA3TyBv+X
   QftQOBzw267X9tCCxVVTMUJbJokU0//v6q6A04Ab2VwllBjagibU7Vwge
   EZuOhP8Y2c7sOxRL+T5hClGSmBu0O7ZAXwp0fPnctq7KJJPsKaXitB70o
   hovsLzHbPeX78k4z7vDnV46RwK4iz1QzLrU4UIkGWaJf2FejAdt44ozSy
   fK07+IHfVNDsJIZxF+6fN/hITTp1TC2M0OmkO5zpuznFGkQaPF69QPC6T
   /UrTlyEffcHBj+1LbIF5LkQYDeN+TMnsM3TxzTlaeq3BpLS9FZ+QyiZJG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430719330"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="430719330"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 19:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="724687446"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="724687446"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 20 Jul 2023 19:52:10 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMgFP-0006mt-1N;
	Fri, 21 Jul 2023 02:52:05 +0000
Date: Fri, 21 Jul 2023 10:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 9be3d0283c583c521b6fb67500bdea532b4f0d45
Message-ID: <202307211033.ae4kPrQH-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 9be3d0283c583c521b6fb67500bdea532b4f0d45  powerpc/64: Enable accelerated crypto algorithms in defconfig

elapsed time: 798m

configs tested: 2
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
