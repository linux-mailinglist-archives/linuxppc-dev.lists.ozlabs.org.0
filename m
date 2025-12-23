Return-Path: <linuxppc-dev+bounces-14975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE8ECDADE0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:59:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbX6L6Z4xz2yFk;
	Wed, 24 Dec 2025 10:59:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766534346;
	cv=none; b=GcDb3+u/XiGT5xb4te7DrM37S+oFAhbkNPBipOurjZXFKi1sfpJA/neOC5lcvF9f0nQ7c3KJju+Gzcpth0xUDkUo08zB3damH51NDvJDfMfF+pp3wsDsD8XEqHiNatYs1DCbI+4MU/YShK7MCTj2QLi+sfe5JhF5WpOCB8fOuuaffNXavnafs5TDFW5y1TxinSBiqGiblhcdeZLPQW1pE/9gx7vIAMsHZqyGXEW/a7Agtpr+RYuucifBy+4Fq1T9msV9n8Q2p+mcjI+fncXm5lhhUGTsBwleir5/d0PQVMU+BgSaMv2Hd/v3ZbfCwKaXFZX68KSEpHtg9WDyLv5aFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766534346; c=relaxed/relaxed;
	bh=mTMg56ZDGn5WmVJgmytedDB/C3xb8tmH4L62F5YNQ90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObLMpn9BLRocpThE9G5S6ZYuyhhItqA7axs5HUXFaWzrenKt4UWlcKBmE0fzNlmq6NdxrJqm3Fsa2XdP+XuZ5zFvpZ9g+0KK0VdzMEaobpwALwr4jD+u63YlCbtcmIBlb0g97/h0q8a2sdAN04x4w10EenUEd0GhkNZYFejN7ODasWVfUd15livUx2wcsQ2pcft7Xa63nbnSH5XUjayT0BFJesBaACSRAE1p00mpnJ6AtXkITjv6JM4OIdKn0+uv2WU0GqgHlF3o5JTq9BBX5nhh/fLFWYTj8m6fmsXrgQHN9jnNn3HUbZ0MCZinN4WgsLlxcIQW2KtW62jWOeeXRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VGz5sBhE; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VGz5sBhE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbX6H6FwTz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 10:59:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766534344; x=1798070344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wbLqI2F7wg0GAZJFEKzvgXl0WujlC0eAlfgVTwT4Pnc=;
  b=VGz5sBhEUcV9evkTPj7LoumpL6yvX4A8o5qfXNUKLoD1IDW2/MG2ToGB
   KtSZ2gML2TykOsfq1GMJZ52gRTYemK9fIlBzT5jP8t52d5+5o/k0niPC5
   CtHD1lKCcvfJTf+5Z3wOrVXozkqC3mJs96FqzhQQ65TP935akZP3EJ/3n
   CDpUJ3/+okIrGwVqaX2vH0j6hPkwY/vzJ2xnWxjazRZJDmofmEkXJ7HOk
   lTRagH6xfSdHeBhHvPksdft82imZWJhkqYm0Qe8VxOvK82WPkwI0rDHth
   58JPHHUluxSSro+RmZCZQmHel4KYtT+Irqc3e3jKqG8uJabC/QbrhUIp4
   Q==;
X-CSE-ConnectionGUID: Wpx8IFx/RA6Vu68JZy26Qw==
X-CSE-MsgGUID: gYq/VgcKS+qsUP4puRo1xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79016469"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79016469"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:58:58 -0800
X-CSE-ConnectionGUID: TcJUReP5Qwy+NGFGsQ85Gg==
X-CSE-MsgGUID: K0cnw6bARF6boThsyEe6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199870155"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Dec 2025 15:58:52 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYCHC-000000002Uf-0n58;
	Tue, 23 Dec 2025 23:58:50 +0000
Date: Wed, 24 Dec 2025 07:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Rafael J Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Shuai Xue <xueshuai@linux.alibaba.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: Re: [PATCH 3/5 v8] acpi/ghes: Add helper for CPER CXL protocol
 errors checks
Message-ID: <202512240711.Iv57ik8I-lkp@intel.com>
References: <20251219124042.3759749-4-fabio.m.de.francesco@linux.intel.com>
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
In-Reply-To: <20251219124042.3759749-4-fabio.m.de.francesco@linux.intel.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Fabio,

kernel test robot noticed the following build errors:

[auto build test ERROR on ea1013c1539270e372fc99854bc6e4d94eaeff66]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/ACPI-extlog-Trace-CPER-Non-standard-Section-Body/20251219-204338
base:   ea1013c1539270e372fc99854bc6e4d94eaeff66
patch link:    https://lore.kernel.org/r/20251219124042.3759749-4-fabio.m.de.francesco%40linux.intel.com
patch subject: [PATCH 3/5 v8] acpi/ghes: Add helper for CPER CXL protocol errors checks
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251224/202512240711.Iv57ik8I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240711.Iv57ik8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240711.Iv57ik8I-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/apei/ghes_helpers.c: In function 'cxl_cper_sec_prot_err_valid':
>> drivers/acpi/apei/ghes_helpers.c:9:17: error: implicit declaration of function 'pr_err_ratelimited' [-Wimplicit-function-declaration]
       9 |                 pr_err_ratelimited("CXL CPER invalid agent type\n");
         |                 ^~~~~~~~~~~~~~~~~~
>> drivers/acpi/apei/ghes_helpers.c:27:17: error: implicit declaration of function 'pr_warn_ratelimited' [-Wimplicit-function-declaration]
      27 |                 pr_warn_ratelimited(FW_WARN
         |                 ^~~~~~~~~~~~~~~~~~~
>> drivers/acpi/apei/ghes_helpers.c:27:37: error: 'FW_WARN' undeclared (first use in this function)
      27 |                 pr_warn_ratelimited(FW_WARN
         |                                     ^~~~~~~
   drivers/acpi/apei/ghes_helpers.c:27:37: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/acpi/apei/ghes_helpers.c:27:44: error: expected ')' before string constant
      27 |                 pr_warn_ratelimited(FW_WARN
         |                                    ~       ^
         |                                            )
      28 |                                     "CXL CPER no device serial number\n");
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pr_err_ratelimited +9 drivers/acpi/apei/ghes_helpers.c

     5	
     6	int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
     7	{
     8		if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
   > 9			pr_err_ratelimited("CXL CPER invalid agent type\n");
    10			return -EINVAL;
    11		}
    12	
    13		if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
    14			pr_err_ratelimited("CXL CPER invalid protocol error log\n");
    15			return -EINVAL;
    16		}
    17	
    18		if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
    19			pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
    20					   prot_err->err_len);
    21			return -EINVAL;
    22		}
    23	
    24		if ((prot_err->agent_type == RCD || prot_err->agent_type == DEVICE ||
    25		     prot_err->agent_type == LD || prot_err->agent_type == FMLD) &&
    26		    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
  > 27			pr_warn_ratelimited(FW_WARN

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

