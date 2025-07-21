Return-Path: <linuxppc-dev+bounces-10341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A942B0C8A1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jul 2025 18:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bm5N050hGz2xjP;
	Tue, 22 Jul 2025 02:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753115104;
	cv=none; b=VjvzMR7XNxOK6NO/s/aof1bsuxgB1Br6vtwutlObALScweUwcApppAaT6Kryvr6fSK+wQHvAyJX8YWb++4MUQBsO15tLkA4jBWM7kHQ2NQLXsTYrz6S2ujAkNKUeB75xpkFOWI4VyWkafCVVP3SO9/5OqhSpRb8Txqpa8AizIf8xzHinnqCN4R+TwWvuRXGA55SDJ7kankPe/Lx1vegUVuIQV+diSIkhhhe2VyIZb8G6aK8kQkXy/AlQZH8t9Nky1kfAyjLLQpIZ78vRfIWGr1f9PRyPY55k0Q0eEhyipvRAM8Npa/mV8Rs1Jm3xBw/gnFQn9UB5zi5msglVb9xZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753115104; c=relaxed/relaxed;
	bh=B+SJSRGhTtUjjGn0dVgPf5rbq33uYZdF3S0wAhc6Iso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i21LV4QANRQx4tr1d+uEUQ5HjJ8o1kbaXskglS7K4AXrxxMn+JDaVnlc6vdtNYPc7DF2ww2RrFMlt94PPMYStbPF+EajaXASo8lt1K91VlUhTdqLmfLS9ZfjvZ/RtmitZWbIMC38/BF8U7ZkwShtAxkqIU7s1Le3o36PVsULdRXgvMI/rV9zWeYsxaEHowF+TbHCXzB2Z9KMyi817N7C93dOa6N2MpeW9fMhnQrcPh028TDqEcYDp/p7IzwcR8egKbvDNvJKWLDAsNHMwyugiLcQO+flukaDoL+aga3sdI5QDAK+8Cj4b9MPGaYzuZsIOm1DR4pRsvvQEVdSjUb/tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GorkCq/t; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GorkCq/t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bm5Mx3Srrz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 02:24:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753115102; x=1784651102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y0c8fyTNCDbBI1ib06Eg9UDIUghtCzMuq8qbf2t/k5w=;
  b=GorkCq/td9AA22ifkHKrmoQclWlQn9T5J6u2n0TMq/51rGaJFHCyyiti
   KI7WxDP3frWtqkvSWh0b9YU4dxI5cHuEl6yfAYLVWQSTZr7sSHPQ3nMG9
   fUHVyzx4QgrlTHv7hf94l967C3TxX2ZHYP0P5ejWy12LDjRrqw5Y0itzw
   FdmbgP8Sq+gsVv8ZRxWwKRu0h8/s5JDnXSA3lV9ZN+EVh4+oYb/nLkkCe
   SafTM/QLIENmAiAx8onD2Vss98IlDXQZUTh3NNXlpcqougmBVQoIONEhC
   OSjWlP3UEO4Vt8sc3i+To7gLcNPQtYnmJCw8e2LN/fgcNxA+O0tq2fjBx
   A==;
X-CSE-ConnectionGUID: pfObUgVMSUOvMLcFhw0ERw==
X-CSE-MsgGUID: WBq7RroRTSqwR8QY0G51Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72791496"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="72791496"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 09:24:56 -0700
X-CSE-ConnectionGUID: /80dSFaRRlanM/T6SY8zFw==
X-CSE-MsgGUID: l0qUhxBCQz+Cpzl2V+Cj2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="158184620"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jul 2025 09:24:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udtJn-000GyP-0h;
	Mon, 21 Jul 2025 16:24:47 +0000
Date: Tue, 22 Jul 2025 00:24:42 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev,
	osandov@osandov.com, xueshuai@linux.alibaba.com,
	konrad.wilk@oracle.com, linux-edac@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v2] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <202507220057.iVSR8aqd-lkp@intel.com>
References: <20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org>
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
In-Reply-To: <20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Breno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 97987520025658f30bb787a99ffbd9bbff9ffc9d]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/vmcoreinfo-Track-and-log-recoverable-hardware-errors/20250721-181439
base:   97987520025658f30bb787a99ffbd9bbff9ffc9d
patch link:    https://lore.kernel.org/r/20250721-vmcore_hw_error-v2-1-ab65a6b43c5a%40debian.org
patch subject: [PATCH v2] vmcoreinfo: Track and log recoverable hardware errors
config: i386-buildonly-randconfig-001-20250721 (https://download.01.org/0day-ci/archive/20250722/202507220057.iVSR8aqd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220057.iVSR8aqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220057.iVSR8aqd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/initramfs.c:603:
   In file included from include/linux/kexec.h:18:
>> include/linux/vmcore_info.h:91:6: warning: no previous prototype for function 'hwerror_tracking_log' [-Wmissing-prototypes]
      91 | void hwerror_tracking_log(enum hwerror_tracking_source src) {};
         |      ^
   include/linux/vmcore_info.h:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | void hwerror_tracking_log(enum hwerror_tracking_source src) {};
         | ^
         | static 
   1 warning generated.


vim +/hwerror_tracking_log +91 include/linux/vmcore_info.h

    87	
    88	#ifdef CONFIG_VMCORE_INFO
    89	void hwerror_tracking_log(enum hwerror_tracking_source src);
    90	#else
  > 91	void hwerror_tracking_log(enum hwerror_tracking_source src) {};
    92	#endif
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

