Return-Path: <linuxppc-dev+bounces-13976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB5C43EED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 09 Nov 2025 14:39:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4DR73xSKz300F;
	Mon, 10 Nov 2025 00:38:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762695539;
	cv=none; b=N0nP2HBhCcoqjubpIWEWwIWmFL37pbEaw5oFS/ZpJKPR/e9HTfjTXFrBy4WgzGunOqPNduUi5p7Nr+1/wUQlQv2eYHQVLTInRGMaMiavzkUbd/UjOHwt3SuMxtYRlP3F9xphi6crW5+xFeX8ulw6CRb/PhASmAmkE/OrHWis9Zbt044HUDHO5UdST/sTLUpxjQjMknnbMoxyKjMxxMfAgqqEFkK2rrxotR2Z03jtLtJLOBZvhBo3smkd53rCPYBxHmAVIpU3QGZyhftJCAAq8cesi+X0zJErTkQeNsMc0ar+tQn+jh+OqV4zCAspyC4FgqA1Qm/UiFocgjOCicxZog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762695539; c=relaxed/relaxed;
	bh=cr2114I01ec/abmyNG7RpEXZ1LzjDm/1lTsSiym6iAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFDxYl6SyT2LImn0POU82S2kMZDpVd0DmlXcSk+SC/meEpmslkvYhZPxVX4bpQlffvSW5CUTGdtTvFzFrYI/uGAdFiuORsjlYXa5z9Nns8XcrgtESbiA6PeR/O62eRA1izbyq2za8eolmwXwOsWqci7xUyyEV9r1HQezCfeqkm7GVlEa1/uuayMDIMgIwFj5wewKheSPkMjka3zcBGfSI8nZJEshKu9NQoF0xg3vyJHdI3NxdvhbeUemjhIJit4kdGjbo7Yup2NKs+4gchs0U3wQgXo+fXzZ+i2rll/D26Qrt6pR087WesglA5IA8w0F4qVSs9HnIuCzCQpNigFOzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLpY5t4v; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLpY5t4v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4DR473Wjz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 00:38:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762695538; x=1794231538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1x+Mo9nWh2WXI6lONcFe9DSrRcVoSKddorvdA0ovrps=;
  b=OLpY5t4vgxtqoYfmuKSDp2R6m6tEswL0nhIkTYIRmO8wwWi118Z8qZlr
   yxIA6nVloRlZt0gMM+FAHZwIJxGOynlCWvqeQyUsPJ8iY0Mn3TIZi+v9l
   0V3KFoCHgMoRV6TGcWCB8w4VFt8mpxbH7k2FCQ7zDe3iUb9Om9aUfFBKv
   qGHOtE3q0qMfyBisxJVtwASfZxTkzikgfUSfrEa80F8psgtjBBcgEkHc0
   bzjPPA6Um9iD8f06Q2F0uA3Lo9DHxxtSYODxYBiZzqR+e0Ye25YeHQk+2
   JAcJqkbrrawzPjVmoiVwUM4u3VwHvBBMlqk/k6IaAZzPPecwMwHFrAU3Q
   w==;
X-CSE-ConnectionGUID: EwCD2HgdT9KHZs6XQWWifw==
X-CSE-MsgGUID: F5JfRAPFSWOguTklQF8Efg==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="82168190"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="82168190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 05:38:53 -0800
X-CSE-ConnectionGUID: ifjZIU4pSdODEVFMem63lw==
X-CSE-MsgGUID: JRKtoAiyTRuSZxiMKKrPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="192570350"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2025 05:38:49 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI5d0-00022F-1d;
	Sun, 09 Nov 2025 13:38:46 +0000
Date: Sun, 9 Nov 2025 21:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Sourabh Jain <sourabhjain@linux.ibm.com>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
	Hari Bathini <hbathini@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Pingfan Liu <piliu@redhat.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>,
	Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v2 2/5] kexec: move sysfs entries to /sys/kernel/kexec
Message-ID: <202511092102.Qi35GqrR-lkp@intel.com>
References: <20251106045107.17813-3-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20251106045107.17813-3-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.18-rc4 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/Documentation-ABI-add-kexec-and-kdump-sysfs-interface/20251106-125243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251106045107.17813-3-sourabhjain%40linux.ibm.com
patch subject: [PATCH v2 2/5] kexec: move sysfs entries to /sys/kernel/kexec
config: s390-randconfig-r131-20251109 (https://download.01.org/0day-ci/archive/20251109/202511092102.Qi35GqrR-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511092102.Qi35GqrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511092102.Qi35GqrR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/kexec_core.c:1315:16: sparse: sparse: symbol 'kexec_kobj' was not declared. Should it be static?

vim +/kexec_kobj +1315 kernel/kexec_core.c

  1314	
> 1315	struct kobject *kexec_kobj;
  1316	ATTRIBUTE_GROUPS(kexec);
  1317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

