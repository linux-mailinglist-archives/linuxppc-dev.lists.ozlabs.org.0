Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A5B71FA37
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:39:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXYHx6xG6z3fD2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 16:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MJt+tBWx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MJt+tBWx;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Fri, 02 Jun 2023 16:38:24 AEST
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXYH41QxKz3dvy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 16:38:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685687904; x=1717223904;
  h=date:from:to:cc:subject:message-id;
  bh=aXxi1lxGyIDg+LeZ6UuE0hIaebQTiUTdRKhs51L4yyg=;
  b=MJt+tBWxls82x8peGuVzunMlq0z1bZTmBZhPMEHIxFK1NAKtz21V294w
   /vKPt/Bp1OwIBKQeMFRchBiS4eChnobwO8H+KfJB/QX+rgH1vn9CFNn3T
   fPQNkwgQ/+E6+3WuNyt8RcrjZCdPVKheOocwjKHsJLfaJv36ddqlbdtJr
   fsoD5XYA4i8yBzpPyK+G1gb60h+sDMVBHz7PcaKmgXvrss9XSJ9G/87Wc
   E6diXV4+Hro+UpJMeDj03BykyIZbTnoBhadgKp2sstxvRe4Pt4VFvPAwZ
   1fJ+i7Uw+QChbVPkkcQtSe4jHkcTLpPG3baVNlJ+Rm613YFdjo83YKbvu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442165380"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="442165380"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 23:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="685179690"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="685179690"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Jun 2023 23:37:15 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4yPS-0000Ae-22;
	Fri, 02 Jun 2023 06:37:14 +0000
Date: Fri, 02 Jun 2023 14:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS
 719dfd5925e186e09a2a6f23016936ac436f3d78
Message-ID: <20230602063658.fP_Kt%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
branch HEAD: 719dfd5925e186e09a2a6f23016936ac436f3d78  powerpc/xmon: Use KSYM_NAME_LEN in array size

elapsed time: 722m

configs tested: 2
configs skipped: 142

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
