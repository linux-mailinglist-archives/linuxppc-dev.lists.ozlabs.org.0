Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCDD728B6F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 00:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qcfh35YKwz3f7x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 08:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h+zDUMgi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h+zDUMgi;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcfgB1hJSz3cf4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 08:54:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686264902; x=1717800902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dd0u2N723fxNFuDaKsE3otcHiK0R6lSa4aGmdjcByVU=;
  b=h+zDUMgi/yuZANIszXxC2/oMjYLda9GEtlRBpJ/E/crZV4T+i7zqsbHN
   ib30EV0rGmzKMehndb87fpXPPY46j7SiPvZS+KoTWCUcGhznBLZ3Yo3pw
   kJtLcvUu1gnh4UbYGu9Z983WUmS7MQisMMzdxzMtKBHZTlDpRCuRAT8Yq
   2rxwGDVAXiKHAvnrxf5ElSEktrWQ6fvhOYRaz93VGK9h4I6W3Qjnfqy4o
   GIsMCapRhz634hAxL/aplSvx0YeaNLQL8V2/QmrpGG4AZ09Khy7CS0hEx
   4pSmUplgLreAZNio/2Qh2ugkprdgXnqwf8CKqiSKiKIVbi5bYb0/8rIlH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="347100905"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="347100905"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 15:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="956914069"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="956914069"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 15:54:46 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7OWk-0008KC-0g;
	Thu, 08 Jun 2023 22:54:46 +0000
Date: Fri, 9 Jun 2023 06:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Terry Bowman <terry.bowman@amd.com>, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com, bwidawsk@kernel.org,
	dan.j.williams@intel.com, dave.jiang@intel.com,
	Jonathan.Cameron@huawei.com, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v5 25/26] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <202306090637.9E2ezbR4-lkp@intel.com>
References: <20230607221651.2454764-26-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607221651.2454764-26-terry.bowman@amd.com>
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
Cc: rrichter@amd.com, terry.bowman@amd.com, linux-pci@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, oe-kbuild-all@lists.linux.dev, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Terry,

kernel test robot noticed the following build errors:

[auto build test ERROR on a70fc4ed20a6118837b0aecbbf789074935f473b]

url:    https://github.com/intel-lab-lkp/linux/commits/Terry-Bowman/cxl-acpi-Probe-RCRB-later-during-RCH-downstream-port-creation/20230608-062818
base:   a70fc4ed20a6118837b0aecbbf789074935f473b
patch link:    https://lore.kernel.org/r/20230607221651.2454764-26-terry.bowman%40amd.com
patch subject: [PATCH v5 25/26] PCI/AER: Forward RCH downstream port-detected errors to the CXL.mem dev handler
config: x86_64-randconfig-r005-20230607 (https://download.01.org/0day-ci/archive/20230609/202306090637.9E2ezbR4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout a70fc4ed20a6118837b0aecbbf789074935f473b
        b4 shazam https://lore.kernel.org/r/20230607221651.2454764-26-terry.bowman@amd.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090637.9E2ezbR4-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module cxl_core uses symbol pci_print_aer from namespace CXL, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
