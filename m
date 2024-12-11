Return-Path: <linuxppc-dev+bounces-4005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB649EDB1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:24:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sBb36Glz30NF;
	Thu, 12 Dec 2024 10:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959479;
	cv=none; b=Y3f240YT53bPe8WXZR47VoQOgQV7GZqDQoPTrHtuaLbQ4n+SzQnlYJFNbTx4uAI97mAiH8aEt95T47ZTvZrvuy98u1W+kO2wU0lShkBvV6m2/7mccHBjhryR5zvCcaFoUHbW8/O54bv0UYP3gXPx5NnQqgR+fOipnuNBVDFl8XRZCZfZlxE/ZEW2f/5nhdQtKBhJ8+pcFPYxcxYawzhfZDYocCrrk1u3OHsMDcYf4M2vcaMXtOH4SgHiGn5qyqlRt1zXGUdiMCgVmt9puwDu7IykdnlNoZgXqvn1MxucecAcHt6u7qDg9cPn7TqJN/e71jQ932V/C7oSqPMBVjlOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959479; c=relaxed/relaxed;
	bh=OJfcPXq7lwITfdAtpq81+Ne33Kll4kNNeCC8znbG0sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I163JE/QROj7h0E6ddyf70ZQu5cxD/J1gav/jqg509/C8QFhXcxjVJ+L866DpwfrnO5+dfJ8HBt2/pW3QDPSccckt2rm/Nk/vlQeRZCgBZu/6QZFzomwqwD9EMEfp9iNmJJCLXFlsrdFHzcGXMCuysM8E01rvR44sfLky4KUWntcotDgVbwRB/HLtccRXaqP06I567NycM6+ICIo69k59yB7uFtlMYb6Un5GI68iEOsFcCNf2zs3Nd2LQ7FLS0L41+flWB5dH5ZMsCovZuxAyFw6c+oHvYtiyxBR6i0Vp665EASQF9YDQZ0plL7AoCkqAUC9a2Pf6O90CJRWU01SAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBgTFSPr; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBgTFSPr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sBX33qvz304H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:24:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733959476; x=1765495476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62eGNKv2jlcOfyJIkzn6DDpCE5ZY2ynMYIthNzGLF2E=;
  b=cBgTFSPr5lC3aIEyFK/ix0qsGsose3aUzBVDiLr2hRZouoTpicItZq+R
   O17d24PTLuaPxP5gifVFZ47d6e90AV6gl6tlGgy5ynbSt6TH06Nzbw3jO
   gEUEjlHLkebqcWICRloJyFl8H+j8hMMLmJeTz/pa+tjWtqHEZQXYLRXOw
   u5USe5t8s8uAbTo4TXMAZQ+tVENytNjI7p3s5G1NcPkgJcabWcC6P0z/v
   Bd9kfpRz0N93C18bcAV8nB1wmIB9d3+S91YlHtGseU29Ba0ahf503JCJ+
   afdK/d+xVYc8LG5QDoHMq4piW2c2Eb1V3icehBVpAtal5HHWqaBbMggMZ
   w==;
X-CSE-ConnectionGUID: aX40fTslRuaLmYDi6vS+bg==
X-CSE-MsgGUID: R//DPDSbREakA8eLmp1SHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="44973644"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="44973644"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 15:24:31 -0800
X-CSE-ConnectionGUID: 1UA/6KddRz+DuWLMcGse0g==
X-CSE-MsgGUID: X3/2OIgvQPuaqA1El1xOAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126969147"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2024 15:24:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLW4A-0007Cf-0u;
	Wed, 11 Dec 2024 23:24:26 +0000
Date: Thu, 12 Dec 2024 07:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	linux-scsi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	fbarrat@linux.ibm.com, ukrishn@linux.ibm.com, manoj@linux.ibm.com,
	clombard@linux.ibm.com, vaibhav@linux.ibm.com
Subject: Re: [PATCH 1/2] cxl: Deprecate driver
Message-ID: <202412120701.08jViR9I-lkp@intel.com>
References: <20241210054055.144813-2-ajd@linux.ibm.com>
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
In-Reply-To: <20241210054055.144813-2-ajd@linux.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus jejb-scsi/for-next mkp-scsi/for-next linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Donnellan/cxl-Deprecate-driver/20241210-134451
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241210054055.144813-2-ajd%40linux.ibm.com
patch subject: [PATCH 1/2] cxl: Deprecate driver
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412120701.08jViR9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120701.08jViR9I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

