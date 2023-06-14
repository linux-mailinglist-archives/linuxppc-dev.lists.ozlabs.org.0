Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408872F276
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 04:09:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AIHjCYUS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgpkk1tc0z2xwD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 12:09:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AIHjCYUS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 12:08:15 AEST
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgpjq25Y1z2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 12:08:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686708495; x=1718244495;
  h=date:from:to:cc:subject:message-id;
  bh=imc5B/W4hVKTej1/5iTjrGuIhLS7WrPx9VnX5IjgyFY=;
  b=AIHjCYUSTtLAisk2BiakBOGFL/JXuui1XEfjxvBGL1ScCg0mHv1D2MZg
   LuvlfUoUgicZTFLMbDVgyNn6OKanoG1skkWuXx2/asGSctsAmuvWFe+KN
   SohG1gdA18tKpTla7DdL81k/8KO2c0ZDKQ909Df0e74lHimOi9T0GLdhT
   n9J+YjFCkh3EVxewnfb0nivvSspIdA5mea3ZrE+PrVCjRwGQccbN7eN7x
   +LG+pTFmBuCsgNdQhSTKVksRKrl9MNtE+umn+6NAe84xtdpGN1RDEPvZy
   FyBWNTh0R4VwSEU4tA/tybItiSfs/jtaQvLXvr1cet1D901/qydu1wEMt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="348159388"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="348159388"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 19:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="711871999"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="711871999"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jun 2023 19:06:42 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9FuD-000256-1j;
	Wed, 14 Jun 2023 02:06:41 +0000
Date: Wed, 14 Jun 2023 10:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS
 dfaed3e1fa7099de8de4e89cbe7eb9c1bca27dfe
Message-ID: <202306141031.UDQ6Zgv8-lkp@intel.com>
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
branch HEAD: dfaed3e1fa7099de8de4e89cbe7eb9c1bca27dfe  powerpc/64s/radix: Fix exit lazy tlb mm switch with irqs enabled

elapsed time: 728m

configs tested: 5
configs skipped: 112

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230612   gcc  
powerpc      buildonly-randconfig-r004-20230612   gcc  
powerpc      buildonly-randconfig-r005-20230612   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
