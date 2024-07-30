Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EF94057E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 04:48:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eL1WFdzm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WY05t5s7mz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 12:48:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eL1WFdzm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY05857G7z3cT8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 12:47:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722307661; x=1753843661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ua8ABAlBdaz+fPYZynUWSDCTK92pYZqE92LoOz5qxyU=;
  b=eL1WFdzmQCJwl0trjVs4xaM1Q5/CmghYFZIs0mDBLLkazmvtNs4R8vtG
   DaAAayD3dzxqpnydO1CCvT+OtXuXfN/UraWXxmpDc1ztgJaOFRLOfjJJP
   jw7b0TeLqWMU9bcnl0tRH0MlUl8fcNFOL8E4G79EsKNpG1QTc6BD0a2h9
   vKBBHUviP5wTTcvBSvr7SdhglWKWNgqAmDWkk2vRGO+bQMTK3CLWNqVml
   rGycPJej4/jXUXgQKmT9JvkQwRVJQY/E7DBpTJBR2y1CmJdf2KctifyMS
   oKi4r7/b58xaSBbAQr85cq6yHmAvqQnVFrtofYb3yHKkv5K7MRh4f1+XH
   A==;
X-CSE-ConnectionGUID: pW4FZQz9TZ65RwYqjTvqwA==
X-CSE-MsgGUID: fB8gBXygR8myePEKUO4LIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30729834"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="30729834"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 19:47:21 -0700
X-CSE-ConnectionGUID: s1Sv3a57TVqMtsYZZJFHKg==
X-CSE-MsgGUID: vp3oUUF+QwCkYjYBk7DHtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54099244"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jul 2024 19:47:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYctP-000sOU-23;
	Tue, 30 Jul 2024 02:47:15 +0000
Date: Tue, 30 Jul 2024 10:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 32/36] soc: fsl: qe: Add resource-managed muram
 allocators
Message-ID: <202407301027.RZ0iwoYW-lkp@intel.com>
References: <20240729142107.104574-33-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729142107.104574-33-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc1 next-20240729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/soc-fsl-cpm1-qmc-Update-TRNSYNC-only-in-transparent-mode/20240730-001631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240729142107.104574-33-herve.codina%40bootlin.com
patch subject: [PATCH v1 32/36] soc: fsl: qe: Add resource-managed muram allocators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240730/202407301027.RZ0iwoYW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301027.RZ0iwoYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301027.RZ0iwoYW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/fsl/qe/qe_common.c: In function 'devm_cpm_muram_alloc':
   drivers/soc/fsl/qe/qe_common.c:217:14: error: implicit declaration of function 'devres_alloc'; did you mean 'kvrealloc'? [-Werror=implicit-function-declaration]
     217 |         dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
         |              ^~~~~~~~~~~~
         |              kvrealloc
>> drivers/soc/fsl/qe/qe_common.c:217:12: warning: assignment to 's32 *' {aka 'int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     217 |         dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
         |            ^
   drivers/soc/fsl/qe/qe_common.c:224:17: error: implicit declaration of function 'devres_add' [-Werror=implicit-function-declaration]
     224 |                 devres_add(dev, dr);
         |                 ^~~~~~~~~~
   drivers/soc/fsl/qe/qe_common.c:226:17: error: implicit declaration of function 'devres_free' [-Werror=implicit-function-declaration]
     226 |                 devres_free(dr);
         |                 ^~~~~~~~~~~
   drivers/soc/fsl/qe/qe_common.c: In function 'devm_cpm_muram_alloc_fixed':
   drivers/soc/fsl/qe/qe_common.c:277:12: warning: assignment to 's32 *' {aka 'int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     277 |         dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
         |            ^
   cc1: some warnings being treated as errors


vim +217 drivers/soc/fsl/qe/qe_common.c

   196	
   197	/**
   198	 * devm_cpm_muram_alloc - Resource-managed cpm_muram_alloc
   199	 * @dev: Device to allocate memory for
   200	 * @size: number of bytes to allocate
   201	 * @align: requested alignment, in bytes
   202	 *
   203	 * This function returns a non-negative offset into the muram area, or
   204	 * a negative errno on failure as cpm_muram_alloc() does.
   205	 * Use cpm_muram_addr() to get the virtual address of the area.
   206	 *
   207	 * Compare against cpm_muram_alloc(), the memory allocated by this
   208	 * resource-managed version is automatically freed on driver detach and so,
   209	 * cpm_muram_free() must not be called to release the allocated memory.
   210	 */
   211	s32 devm_cpm_muram_alloc(struct device *dev, unsigned long size,
   212				 unsigned long align)
   213	{
   214		s32 info;
   215		s32 *dr;
   216	
 > 217		dr = devres_alloc(devm_cpm_muram_release, sizeof(*dr), GFP_KERNEL);
   218		if (!dr)
   219			return -ENOMEM;
   220	
   221		info = cpm_muram_alloc(size, align);
   222		if (info >= 0) {
   223			*dr = info;
   224			devres_add(dev, dr);
   225		} else {
   226			devres_free(dr);
   227		}
   228	
   229		return info;
   230	}
   231	EXPORT_SYMBOL(devm_cpm_muram_alloc);
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
