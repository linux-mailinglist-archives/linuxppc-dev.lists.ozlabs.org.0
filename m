Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F7355B237
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 15:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWBXM0hDTz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 23:29:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OW+4TLiI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OW+4TLiI;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWBWk27prz3bhK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 23:28:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656250114; x=1687786114;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q+dB0El+mlwL7KrxLfb/XfGT161TwfB9TVRWhvL/KU0=;
  b=OW+4TLiI2UDBsTDJyn5rcy3A8IVakFM9e2SKV63UH5OsPtWeNh94oHRx
   C1cucw1t2Aq0MS8Hh24kq9mUF6UNxnvC0B+B5QwtWYsIVSQyCt8p3M7h2
   3vybislj21LNEyI92mdyK/j0t2QaBXRLUuhaIXZvyCk0w/t7sPT36ljMF
   mGMjFfdwBg7GMxEkSb23zIjOxnBa/liXOfAnlc1h40TU89iOhudQyr65d
   z84wM46S1d2CcGRaf19GJ19DOxolLc92PB9yQL6xVnMYtxVnml6fSxxLY
   EiEjC8Dlr8wzlz8TECBR94OBHn0al5Q+83Fs1240ynl0JEFP6OCVMPc7M
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="282369267"
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; 
   d="scan'208";a="282369267"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 06:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; 
   d="scan'208";a="835812765"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2022 06:28:14 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5SJC-0007Kd-2i;
	Sun, 26 Jun 2022 13:28:14 +0000
Date: Sun, 26 Jun 2022 21:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 6886da5f49e6d86aad76807a93f3eef5e4f01b10
Message-ID: <62b85ec6.LB3QenQVtOYIq2ND%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 6886da5f49e6d86aad76807a93f3eef5e4f01b10  powerpc/prom_init: Fix kernel config grep

elapsed time: 721m

configs tested: 2
configs skipped: 96

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
