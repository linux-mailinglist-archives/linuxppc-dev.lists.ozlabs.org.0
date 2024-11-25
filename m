Return-Path: <linuxppc-dev+bounces-3550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E65DF9D8664
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 14:28:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xxmjv3WBVz2yNH;
	Tue, 26 Nov 2024 00:28:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732541299;
	cv=none; b=PbPU0oBTvKOmk/xhHYoQ5LQ2ovAtbyKq+Hm+jZInKJ0nz5BuSsgas8f9YiX8670HjWy4OcaVLU+kM/BvZfJYtsbT7uFcIkoP5bw8tEXdkJrrFlpjkApjzgWe/x1N2BtV9+c0SoziacVvmqtxEPOcGdmJ+XBeQKXvF9reWXoabC0QMI9jjwZSunZ1DalcJ48bIZDiOR2v2EcQyyNt2vuymrc0C2XCL/WyDysqwkrDMLxLF+2bcd1FRIdyK/B7fGshH3Cz1ViBpGR8TDQADVanBagFZbCDpoKU4j7m3clAZsUWkorrGGOM58lD+ApQfKFQYeqG2irKozm4WwU2qu9myw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732541299; c=relaxed/relaxed;
	bh=IwPLPKNHPm3n+RkRysXQ+FuqGvtEDdbnI0FEGTb6oCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovgYwTtzjkB9r/XCeW/Sl1lfDYDE3q16b3uMMtCjOSqGJxJT5voYimEA5/FwmG9C53BEuoOwp0HA7CUSdgJrYMRNiJFR0FhU2TEMw6tRXT805FPhxdCELsRRBaVJVPvvVmJoAoM5j/pNlAxjvjqcwFUXJZMB23UfjDG3eTBvQnc59jxWS3BcyTRC3rRi+1GY4GUDlnocreirnPpnPB+SPf8ZFf1I+YDq5wWGSirqU42r9dJ3lvepKWX4PkdkEWiIT+U3R7T9YbOt7770sE00FPbdbu+bxSexarJVi1GVo79h+4u+4HbtmV+WG4/6LbJ2lu+/vbs1IxyXU5Hnm78aEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQacxOjm; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQacxOjm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xxmjr4Hkjz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 00:28:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732541296; x=1764077296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sESHCfmHmHaI8KY+ZzE7Zdm/gqTJOAtsxdweAV4cr24=;
  b=cQacxOjmcm1dTowoGbRnht+4+Rln5Zvp1TAy8obBtVCEhcHlzvz3e3qX
   UH5qOmfbGY1zHvWY8lhGyahL+1dGFBQEFKYMFxukpkJfBoml1b8f0Oaq7
   HMR+qX9PmF8JwdWIM4iueWM5VfYHRUuXrKDBA/KY49HOblTEOFncNGITT
   W/Y5LZdpqfna402pkisMtDlfBK2WQ8a6LHZ0AQoBLXr7iiHWp90OKWylc
   SoFZzVKDiRQHuilzdBLpVUq2DBC482/E/ESVAX31ri/k3pmcJ4ZjQSG0a
   2eh81PknOvwmjBkcvVB3HDqHbm/gxrDW269dxDvMBZQy5wUnySgVv3RuU
   w==;
X-CSE-ConnectionGUID: O42LUv3gTHuJ510rjSxeYw==
X-CSE-MsgGUID: pL5rXproTuOw7CnqC6VYsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55151948"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="55151948"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 05:28:10 -0800
X-CSE-ConnectionGUID: EKBxTmvNRvKCf6ayHaqmfQ==
X-CSE-MsgGUID: s4BsTlWTRJ2gm3aQ0d27lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91732760"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2024 05:28:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFZ8C-0006Qj-2o;
	Mon, 25 Nov 2024 13:28:00 +0000
Date: Mon, 25 Nov 2024 21:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alistair Popple <apopple@nvidia.com>, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 05/25] fs/dax: Create a common implementation to break
 DAX layouts
Message-ID: <202411252137.GpJ4mLOe-lkp@intel.com>
References: <31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple@nvidia.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on 81983758430957d9a5cb3333fe324fd70cf63e7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/fuse-Fix-dax-truncate-punch_hole-fault-path/20241125-094004
base:   81983758430957d9a5cb3333fe324fd70cf63e7e
patch link:    https://lore.kernel.org/r/31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple%40nvidia.com
patch subject: [PATCH v3 05/25] fs/dax: Create a common implementation to break DAX layouts
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241125/202411252137.GpJ4mLOe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252137.GpJ4mLOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252137.GpJ4mLOe-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dax_break_mapping" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

