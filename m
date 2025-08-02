Return-Path: <linuxppc-dev+bounces-10519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21623B189F7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Aug 2025 02:52:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bv46F5MWFz30MY;
	Sat,  2 Aug 2025 10:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754095941;
	cv=none; b=Jt6Xe6yIc/OXtg7fOZLRkYbJa2/BLIYkhqfXFhbpKsdUohpSKaOQVOnd7cOKzeZlKscxZBpidqphU/KGoLR4qTZ33uerT6HnFNQXFwZu0UT7ra/HUtCAhBKcXk4td1qasbBueLi/Zis0nXxhUjoMtbhYh+Waj35vvn92q+2F0HFaBgPX0OE2JewJN4flWIxrG7l7rXau/VbX4M/+ATp8/M0X11Vc0eb0CnKHSQx8fd21xCtL2GaJMLSIiweZzjYeJGXaYHtR5DjjkeYvufCzOjYa76TpoqQlBXjwen+2BRtq+V0j2gRgJZjKHSbpD30u29U/rC3bgL/lwQRj9bqHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754095941; c=relaxed/relaxed;
	bh=XSSWycsYuEm8yHsbkftGEKkr32QLhfHisjTZW9aj39Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCg7vrQpAS7KNQHMWlcP7cK8lMz4gRrFjsbSsGMFWf2qEz9/8dBt4P3BPUfiKTG7mMQ3kVXsQbuuVC4Z0A6PszPGszb5Oa4s/rxwzWrzbQbTe6pr3NkXxdF3Cl1OXXnqoDWxAUz/fMtGc9N33BSiuSSXDCbfgfkKoYWknSIPMLEtzB+00+TapLhXxtaU/pHZ4fw/AdySn9lpKVKz8/Zd7aH78r0gs8kjnV/bd6H2bTs0MK910N2KZEuZAq61ePTFLqswS+TQtdtKcgcnZnUJYbFHdzG9JrBt7AU1z1HKW3t8Gj0tatm8yuBvcnnusrBdHlD4hU380icBRQNeZ86X/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GOXhJDMQ; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GOXhJDMQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bv46C2m7qz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 10:52:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754095940; x=1785631940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cLiV1YAVc0XpLVydFzX5qDQFT8RxMUqUxFC45R3+Hu0=;
  b=GOXhJDMQ+4ddnZfgYfdLrHT0WWnP/Bi/p1hv7D/Mh/IqPYd7ObEmniTu
   AtK3XfTq85UYRnmoy1/loK159H8VIfBGBx6EqWZ4UwEDjmH9TKAHpEFOd
   VGwa03832jzJnMgITYNJAA9OSmF1etSZyeXscn/ObGQrmexidaX1aYvD7
   oK4GEFJux8i7+frhF/CDJSFT0ykslYESxWR4s+6d51K7Y9ufF9aRTN8Ap
   AdZgC+ozce6RX2Tfi3kwC+oS74QnZOmCwsEZd2gMe1iM26gWNZVvkEpqF
   zgaOj22nnxWVfj0Hq6hwqN1kTnqS9wlo4Eg+obG7X92DHTD4JvwefPq1T
   Q==;
X-CSE-ConnectionGUID: T5X5SyIpQRybqEjlESn4ZQ==
X-CSE-MsgGUID: S+Wf0mbNTqKej0IZnouJkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67020074"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67020074"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 17:52:13 -0700
X-CSE-ConnectionGUID: rhpO9yacQcSx45fuiX/l8g==
X-CSE-MsgGUID: +seHoRPmSrS3nDsJ+5KE6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164083746"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Aug 2025 17:52:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui0Tk-000536-2p;
	Sat, 02 Aug 2025 00:52:04 +0000
Date: Sat, 2 Aug 2025 08:51:49 +0800
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
Message-ID: <202508020814.lzX1CZpj-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 89748acdf226fd1a8775ff6fa2703f8412b286c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/vmcoreinfo-Track-and-log-recoverable-hardware-errors/20250801-211624
base:   89748acdf226fd1a8775ff6fa2703f8412b286c8
patch link:    https://lore.kernel.org/r/20250801-vmcore_hw_error-v4-1-fa1fe65edb83%40debian.org
patch subject: [PATCH v4] vmcoreinfo: Track and log recoverable hardware errors
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250802/202508020814.lzX1CZpj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020814.lzX1CZpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020814.lzX1CZpj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: hwerr_log_error_type+0x23: call to ktime_get_real_seconds() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

