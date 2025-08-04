Return-Path: <linuxppc-dev+bounces-10548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF509B196E7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 02:05:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwGzf46LFz30RK;
	Mon,  4 Aug 2025 10:05:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754265950;
	cv=none; b=EdMwboRWIq9mcBJzFJ6ljqkz9X+X/4qmvJQRkDBuAWVsBuQNkH0z3QfP3di6SJ9PEmMsM98K0fI/h0lXBwLPMUZuNIKGNbOJoS4CsRhWSoZvqzCcLbJr8hAQfWNIxo5vyxshZxhb9c4LgVGQb6ZBtD5D5DLGl74JaRPho6BVIFcKOdCWLFXdgvQ/SqikB73Zd71dPrHXiK1H+LJUvvwEv00ZdyFLeQofHOGPI8G2AbOhGPanpWFmWm1RYueFJiNhVrjQSNcvamBmk9ar/3JnLVBaqSCiXBuLnB8xG6G9YsdVvv/136kvDtQfwwwtvm+hX+CswUCYNM8xUWszV9ukiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754265950; c=relaxed/relaxed;
	bh=ferOxQSH/2BlBjo3gDIGL2G8cJSbbU4N4KlVq3bI8sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSOiWduHg6vInGgC77vQ2Y0UqvqcfmcTL3GqxFEH1k/rpPbHO55QiKxq+EPyfli1fQAxu8NyYgIDeSonrUtZsA6bcCKctjxlbRKDQsll8RcSYs91hzEqUVhLRyuTG4tKt4aNWrDE/ryMaHgNAmdLIqEQgpaJngVuF/RSHDpqhLb2PtwbhlPLgYMW2E2N4NUv0kuWjbWIdzl4pmsnMJFkFTfeP5fOfmLQccoEJM2Evhmbf24W7+/JqV6M/BMht+ScUHJ8HaoY7yGawTZZwlABAwyKCowrKgYH4qzHJP68O5GeAylGT++fJK7rW7KRqEmG6/zvbegLsDeOkX/B4eZpdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=atoe10D8; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=atoe10D8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwGzc2B16z2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 10:05:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754265948; x=1785801948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9KNKvPGAn/W7k7hCCGpLEmkYx8HoMwBR2BuHqnqD4Jc=;
  b=atoe10D8x71qS8xQG18jwcDBSTYkZw95LhVti9xi8To42mpzByDznWHU
   3jLbnVqa3OISYp86eWmlsG6U7/Yuaby2NzoTczTHijB1/wcnsbDk91Yxe
   rV5DOX7xsNhxBC0MTXt2ccqm5WIe4CsiGMdYZC0vBKtR530L10ccSWPct
   R0ECWZsBXtzj30MOmYFjg7g//hobcDqhB2NIKZPedUvcDFp+arLUD8xWe
   LEc/287ayGeVGS1NJOKNmc3v2hwhWm/Pijw/PAEbenGp8h885te/NZef8
   SY4uXhKNAdIThwSoWC+e/rAJGp/HxE5iQyHfQ9ksLxoVXi6hyGFxmzHJK
   A==;
X-CSE-ConnectionGUID: i0GjaiHFSImRTTBQa0ckFQ==
X-CSE-MsgGUID: YZ1oxf+OSweYIiWBsuZ3zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="55573921"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="55573921"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 17:05:42 -0700
X-CSE-ConnectionGUID: SqTPPasQRUm79hJM7o9n4g==
X-CSE-MsgGUID: BfNupMSDSl6xzF4jpyegdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164410220"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Aug 2025 17:05:37 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiihq-0006gm-1T;
	Mon, 04 Aug 2025 00:05:34 +0000
Date: Mon, 4 Aug 2025 08:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	acpica-devel@lists.linux.dev, osandov@osandov.com,
	xueshuai@linux.alibaba.com, konrad.wilk@oracle.com,
	linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, kernel-team@meta.com, osandov@fb.com,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v4] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <202508040737.rlDPN1um-lkp@intel.com>
References: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
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
In-Reply-To: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Breno,

kernel test robot noticed the following build errors:

[auto build test ERROR on 89748acdf226fd1a8775ff6fa2703f8412b286c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/vmcoreinfo-Track-and-log-recoverable-hardware-errors/20250801-211624
base:   89748acdf226fd1a8775ff6fa2703f8412b286c8
patch link:    https://lore.kernel.org/r/20250801-vmcore_hw_error-v4-1-fa1fe65edb83%40debian.org
patch subject: [PATCH v4] vmcoreinfo: Track and log recoverable hardware errors
config: x86_64-randconfig-076-20250803 (https://download.01.org/0day-ci/archive/20250804/202508040737.rlDPN1um-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040737.rlDPN1um-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040737.rlDPN1um-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: hwerr_log_error_type+0x3b: call to ktime_get_real_seconds() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

