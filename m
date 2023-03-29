Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA56CCF8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 03:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmTfQ67CVz3fS0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 12:36:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9Pinqyt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9Pinqyt;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmTcd3gPqz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 12:34:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680053681; x=1711589681;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sANmTWIhQwVKfEIE2f5aZlPB0gnLczHEjpwZX17JUAs=;
  b=F9PinqytNh5jgIkb1X/yDADmYloOZXlzQELpjjv3EtWDnPyn6LQSXdKe
   Y5448DLNRPa2TrVN+ZW/N8TNQTF95O6D56ftz68YY1vk22q6pRajGnxOb
   HMpyaZnQulGchPNfSQpA4tI/rFasl200trC588Vz/KjmlcTZcY9Ei1Aq/
   f82Em7kH7gwVONWvYjnIRS/Bl7VFBK3avwN1P77UhqCbQ+nZ6Tudmjsp+
   p96+uyzYWMmXX1ZN6ei3fKHqqi8zdiEdvtnJ7WdsJ8TYssWnI7jCRwhkC
   K6RS0mjKTzeglRvbpCKyeZ+t6DOjd2HNIkDNUCkn8h6gLffQRD4aOmiCr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338246927"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="338246927"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 18:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="858290291"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="858290291"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Mar 2023 18:34:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phKho-000J30-29;
	Wed, 29 Mar 2023 01:34:28 +0000
Date: Wed, 29 Mar 2023 09:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 5f4f53d28cde2cc7be96f657229c8603da578500
Message-ID: <64239599.z//0pqpj/pXTo5aI%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 5f4f53d28cde2cc7be96f657229c8603da578500  KVM: PPC: Book3S HV: kvmppc_hv_entry: remove .global scope

elapsed time: 741m

configs tested: 2
configs skipped: 163

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
