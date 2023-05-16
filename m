Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C3704325
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 03:55:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKzpg0pFNz3f7c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 11:55:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mB2Ic5tD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mB2Ic5tD;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKznn0skSz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 11:54:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684202093; x=1715738093;
  h=date:from:to:cc:subject:message-id;
  bh=oH544q2uH+GeuOUFRwax7mmFBwmAo63r/kBnq29nLRo=;
  b=mB2Ic5tDPaPlYjc/xyTuZYsF5aMSMnGstiRJNOT9MmlvEnV8XHY5Vegv
   CiDvAMksZYIaaolh5KNYRHTcv9FQj6RENnQp1D6OMde8k60l3dyO9NNTC
   7/UOUmQu8lUjODCKXqtt81Pp3uiR+b+VKiwhbnmDWd5TQpevctvwoXIUo
   FHey6JUfC2bW+wkc4de+/34/vmYZf2Lhbn63P4s4Bn5HQ9bdRrOOlgoOf
   1dxPpDYCOX4mBtYjUBm9uyVM5eJ5wBOExKPanzR2x5FKSH2bPtNi/Fdph
   QGbEkNB4L+adY9kT5scy0y6iKLjFbnBfakapLzChxgFXwPVMAC3iU9gom
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="417011378"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="417011378"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 18:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="766178456"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="766178456"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 May 2023 18:54:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyjto-0006rH-1u;
	Tue, 16 May 2023 01:54:48 +0000
Date: Tue, 16 May 2023 09:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 7d3ee229ea51a17afc1e53272e2a8f377cc82ba2
Message-ID: <20230516015418.atVmX%lkp@intel.com>
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
branch HEAD: 7d3ee229ea51a17afc1e53272e2a8f377cc82ba2  powerpc: Drop MPC5200 LocalPlus bus FIFO driver

elapsed time: 731m

configs tested: 2
configs skipped: 191

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
