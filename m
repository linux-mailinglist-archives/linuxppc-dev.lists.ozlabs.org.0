Return-Path: <linuxppc-dev+bounces-9867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC03AED312
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 05:49:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVsbY46qzz2yb9;
	Mon, 30 Jun 2025 13:49:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751255353;
	cv=none; b=P6JoZw+AIkrcmNylGqoy8OipBiWQGOi2ScasM8JaqNSS7vaK4mKeIERFuH6jdr21UyczmKax09Y1rWoofxHLBTJW04qC61tUbcIPQiI65Obx0KC54frUqFnh5s9Rqr8BiVgYHXAxHDAxg+ZzdFJT7R4HVYPZjJ0ur+EatGndGbqNz4jaT874RoGFC/K/NU9E2259Rw/ChAXkxWsfekgspOrlOaZh7o7FNmJCzBS5rLY/uJTKOF/1qMf7F4X5zhIb1QcN6ZG81ZoCPMf/Q0jmx5+YGD3V5/kPq8XltAw+951uIUqjYhGMVu2cLEuMUpvZas4XP4D1oe0YFT0cTYQx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751255353; c=relaxed/relaxed;
	bh=q34NGcxZr4j2RSE5YwKnT1/rB2WV3y/9km1xi+h83kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xa+qdVz9Tc4j/G45FYBD6tr3mYScipcs6H/9VNZFCoCcWoIiZxNGJ2IEB80m8GsigWewknY2YfTbAgz5w2t3tXvSl6tX9rBZWz297tN1HvAcHYVhZNNTmAC818vgcQgKaMkEI1X2+rjPFKFEnsK3c9CRYb0VjUk2lju7RD8C3Vu9grjO2zpCxiDRN5fNyD6jYV2/Er/P8KlAiNYzSEipDo9xinaFMSiazxy++T+v/xr1E8msogJ/Yq2khRzwBi2FTNbCUiMwO/Xnxex+TbkQOZqmc8aQj1d965SKFhdYe3WCFl3/aWxA2uzy9NTqUxgMisaD17/nzqgQtCB0v0r6uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YOtNprgV; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YOtNprgV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVsbV43c5z2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 13:49:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751255350; x=1782791350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QPyADK9zPp0ngvuNL56VT5gNsd2clYF5WbJ46q3uXaA=;
  b=YOtNprgVajU/+1tqqctLiHcgqMP8HWhHiI2+KDF+KP0xL/gVh892XqrK
   gbsz0ADH04tlHsd73uLs9GGeMet09h2/wpwUxv5/V5saTxmpgSZZ6SFIo
   ip2NYlPQSetZCsjCVmLQ3Cgu3Apr9D4qHMsRm37s/7jO0WjEI+HHJkytX
   G/NMupFlr/xgNKco9QFf12AenLG9S/XSF9WhWYCB62QsBR71prohNXao+
   Fb3123SElmAIJyxF2ThXPwzUpsZARiRoorg6lsZAnJsgVHW1PVV0Esvru
   1bR/f0b/taN5s0Afjsdpht1vbFWTkPpp6S6WRy8hTLxHmUU5SNo5Kf0ya
   w==;
X-CSE-ConnectionGUID: 1MGgeniQQa6psNqojKaeNw==
X-CSE-MsgGUID: bup8Z+xiTj6mp7KhmKqeQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53412543"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="53412543"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 20:49:05 -0700
X-CSE-ConnectionGUID: KQUAA6GzTP+FamccfauLqQ==
X-CSE-MsgGUID: q8TfAvgnTNqN40i//1jc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="154049717"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jun 2025 20:49:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW5Vq-000YRG-1Z;
	Mon, 30 Jun 2025 03:48:58 +0000
Date: Mon, 30 Jun 2025 11:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: GONG Ruiqi <gongruiqi1@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Eric Snowberg <eric.snowberg@oracle.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, "Lee, Chun-Yi" <jlee@suse.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>,
	gongruiqi1@huawei.com
Subject: Re: [PATCH v2] integrity: Extract secure boot enquiry function out
 of IMA
Message-ID: <202506301150.yT6MxuHD-lkp@intel.com>
References: <20250628063251.321370-1-gongruiqi1@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628063251.321370-1-gongruiqi1@huawei.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi GONG,

kernel test robot noticed the following build errors:

[auto build test ERROR on zohar-integrity/next-integrity]
[also build test ERROR on powerpc/next powerpc/fixes s390/features linus/master v6.16-rc4 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GONG-Ruiqi/integrity-Extract-secure-boot-enquiry-function-out-of-IMA/20250628-142236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity
patch link:    https://lore.kernel.org/r/20250628063251.321370-1-gongruiqi1%40huawei.com
patch subject: [PATCH v2] integrity: Extract secure boot enquiry function out of IMA
config: x86_64-randconfig-102-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301150.yT6MxuHD-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301150.yT6MxuHD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301150.yT6MxuHD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_integrity_get_secureboot
   >>> referenced by ima_main.c:922 (security/integrity/ima/ima_main.c:922)
   >>>               vmlinux.o:(ima_load_data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

