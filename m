Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A068CB5F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 01:44:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9ksc6l0hz3bdS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 11:44:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P56pi+EA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P56pi+EA;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9krd3Xlnz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 11:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675730609; x=1707266609;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5v/GEDGdZTfFKilb4QwOAmrxHa5QY4tOetjFfWcxGEc=;
  b=P56pi+EAowO0DSqJW7BqSomKSEPxEBl2j4UafGmFqNvSZY5JbdHC2XBE
   WdBIWIhoaq8R4RAMT/rUpORa2bzHf46/VuJqphM8donPjLC4MTI9ZoSTj
   te3D9KWN8ZIpfClWNIVDB9wwiMzGWVXcCm99Thqc59Ajfmsr02/SlRiZL
   GDdULdMrhKCY9xvdFiW4J8EsLutOrnEYfkMp+Z6omM2lNF1ySN5eNo7x4
   UD+NaaAgf1lEx0pSzF4fJ+MS42EPKZuubm3T+aulJ4sCmorN9u9QdjHcZ
   +43k9uPwkx2t2BSZjAkPB/6dlK48OARSKKT8dnzjnPqrpGWYuYmZ01/rr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309005962"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309005962"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 16:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="735354144"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="735354144"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2023 16:43:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPC4z-0002uY-0k;
	Tue, 07 Feb 2023 00:43:25 +0000
Date: Tue, 07 Feb 2023 08:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 e870dcd0076521fc3f082b248314c376574ac709
Message-ID: <63e19e7b.IJ0UYhG30j+9TGXy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
branch HEAD: e870dcd0076521fc3f082b248314c376574ac709  powerpc/pci: Add option for using pci_to_OF_bus_map

elapsed time: 728m

configs tested: 2
configs skipped: 111

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
