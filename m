Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5941FEA72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 06:55:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nV483yB8zDr7b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:55:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nRgM49rMzDr45
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 13:07:10 +1000 (AEST)
IronPort-SDR: f92z5PwEXRceasvOHkR7pe4uLyJR8AoSVwXHzwceOtRkPh3Dwdl2dcxlj6mYE4Oi0a892jGfi6
 OvwInFF/v4lw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 20:07:07 -0700
IronPort-SDR: 3GRBtz7kjJ9TDXuJfGUaJHifh7iDOW1ssscF1I+9bAsMZoUWDQEduv4e5ZnWax459UVRXM3qJ7
 13+l8Ftd8Cxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,524,1583222400"; d="scan'208";a="277481781"
Received: from lkp-server02.sh.intel.com (HELO 5ce11009e457) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 17 Jun 2020 20:07:06 -0700
Received: from kbuild by 5ce11009e457 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jlktN-00001x-I0; Thu, 18 Jun 2020 03:07:05 +0000
Date: Thu, 18 Jun 2020 11:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 9d7d80a443b962d67db4fbd4b832081f4d7df4a8
Message-ID: <5eeada2e.B7piZQoYSg/8Q6dz%lkp@intel.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: 9d7d80a443b962d67db4fbd4b832081f4d7df4a8  powerpc/powernv/ioda: Return correct error if TCE level allocation failed

elapsed time: 723m

configs tested: 5
configs skipped: 105

The following configs have been built successfully.
More configs may be tested in the coming days.

powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
