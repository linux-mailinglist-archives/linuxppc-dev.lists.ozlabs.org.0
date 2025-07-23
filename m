Return-Path: <linuxppc-dev+bounces-10382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD64B0F547
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 16:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnGjp1rW6z3bby;
	Thu, 24 Jul 2025 00:29:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753280974;
	cv=none; b=MPZ0ltdTXiAse+D3l7YI1eoNU5KE/FAI/jvw7lFYHFxfVVkFq7f3hkPR8bJu2kikI7IG/tykFcYgdLf521ySUL53EwXi2zNQ081jkBc+Z2VWYVwxv+5zgW138a9QUlkMrFcEd+dWrzDnZ1CyO9REx1T+cRlF1AHUz8MyygjYXolFo+vtOZcnW6dGHuN2MdpmPh2e/QHV+T0Egp/NHifkVMEi7kOCTn86VMqrYx1H48DbEhidg1h5CbGMDi4yK+BTjYRi5FI2rw9P8cUGv/uX0i7XTD/etabc65jOjxfAebc7Q7ZmDiO9yQQhSiicW3CmpufkZiLGVXF9ur7LQ4oIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753280974; c=relaxed/relaxed;
	bh=xtrznKXu8yZl3PdgVhaNqAWtuIsBGxNY86F/t2ra3uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8MnDg0oV/6fxW48MMFyYdax49BcomeedOH3iDM/Edsor9D53x24wFAi/Ez0sNVqz5KTdpHZn1MrBrFOuIBCv/MCF9Y5IioYNbR+HsyIs8C4/2IoaNmvgoRzLNpvV/DoYLf2+ofZW4TW8szl+p2FrRHLv3hB7WAxcus/5LXxbJ/CucPYoy1zoQBxmvJtOdqgqJA11zJgs8AR5bAiAn7bjH96gzEQ5kxhIyq9GaT91TZT5f5khf9Dgb+3sZe/OAOiOit6Pl59WClaCNOJ7FIIwrUo1D1HsqWH8uMPRaOg75Q4MG+iyaBDisrYAXDQeuhLEGiJc32Rcf3CBAfQDPppMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DJ7Bn0sn; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DJ7Bn0sn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnGjl5Qrsz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 00:29:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753280972; x=1784816972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JnPfz05COLFbrti4eA0oit4iSLVZ3XvOremqEbmexSk=;
  b=DJ7Bn0snYtF5XMb2wsceFJv6ZAMqHaOz2J/vTdPZ12AxCWGwXJFgp2/j
   q13qISuqcARoSvKS+Z9KlqhHWtPozoyMiy1kvSxVo7QJuxRZpOABb9Wwl
   OFfKtZDSFj/Rf8vkUD2flO6mzDTWJibT7ht4GjlPkQIxwPpspNea5g8y/
   v1Qh49j+AAjizcAoQde4xS1ZkeyiloKEgIpiDWW5myLOClrHVpapzmuO4
   TROC0hPLoJdGR/g58k+M/fORaCIVxppFzWJVAGXt0im7OKlFcEZe3SKqd
   23xKf0cVXmfHhaw/R+X4iMvG7Y2zNim2r2T6YqbEcAwJtMYkCUrCc4qy6
   A==;
X-CSE-ConnectionGUID: gcwupchaTCCR1VL6g65FnA==
X-CSE-MsgGUID: ts5jnkFERMOexNX5OpeBOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="58180477"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="58180477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:29:26 -0700
X-CSE-ConnectionGUID: bLMBwyrWRkeAJvKC8iopDQ==
X-CSE-MsgGUID: UZkMCzLeRXqiwiq1mUGeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159562699"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2025 07:29:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueaT8-000JRD-1n;
	Wed, 23 Jul 2025 14:29:18 +0000
Date: Wed, 23 Jul 2025 22:28:29 +0800
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
	linux-pci@vger.kernel.org, kernel-team@meta.com,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <202507232209.GrgpSr47-lkp@intel.com>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
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
In-Reply-To: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Breno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 97987520025658f30bb787a99ffbd9bbff9ffc9d]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/vmcoreinfo-Track-and-log-recoverable-hardware-errors/20250723-005950
base:   97987520025658f30bb787a99ffbd9bbff9ffc9d
patch link:    https://lore.kernel.org/r/20250722-vmcore_hw_error-v3-1-ff0683fc1f17%40debian.org
patch subject: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
config: x86_64-buildonly-randconfig-001-20250723 (https://download.01.org/0day-ci/archive/20250723/202507232209.GrgpSr47-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507232209.GrgpSr47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507232209.GrgpSr47-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_machine_check+0x5cc: call to hwerr_log_error_type() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

