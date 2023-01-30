Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634DA681F43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 00:03:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5NyP1Js6z2xkm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 10:03:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kZGJn/6g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kZGJn/6g;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5NxR53Jyz2xkm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 10:02:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675119755; x=1706655755;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j1x06WRtTEfR/vXA1xEkRJ/IUyGpNxmgXR4SFxRMvvU=;
  b=kZGJn/6g1yor6RlAGj33WyPNwCz32wqcHRCmIXlju84mRMX+HDGj2Rdx
   U52omOhR7yTMem9d4J/VDLyptHOplQkKOIeulwoZDQmZoZejF9sHIqN2p
   ZqIjDpQp7wkKkLOMh9dpcEtfXEIMX4Sp0LGjQzxqQLS4Iizf0/3Mlq9Yz
   Y7imu9zJEMTxGSgquatdgapRyKaEHNAdUcqheo/fbIkT5O347kGiaKCoR
   jl2+UF6InrreI3dEKWLxryy+Stc/eb4b6Ettko1hUboxFAl2NVYbH0DZ4
   mDY1j9KyhKzFkjHEQMNypq9S5LXqRhYBFcPHuSoVGmf0zchpsHomTZ2xM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327715471"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="327715471"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 15:02:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694738798"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="694738798"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2023 15:02:27 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMdAM-0003xE-0q;
	Mon, 30 Jan 2023 23:02:22 +0000
Date: Tue, 31 Jan 2023 07:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 bab537805a10bdbf55b31324ba4a9599e0651e5e
Message-ID: <63d84c5f.uZotdBvH3PURFi1l%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: bab537805a10bdbf55b31324ba4a9599e0651e5e  powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ

elapsed time: 728m

configs tested: 2
configs skipped: 116

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
