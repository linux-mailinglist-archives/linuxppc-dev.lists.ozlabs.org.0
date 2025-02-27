Return-Path: <linuxppc-dev+bounces-6542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C9A4885E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 19:58:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3gb24kzlz3brC;
	Fri, 28 Feb 2025 05:58:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740682686;
	cv=none; b=Gc9TSUGz6RyYodGUhO4At1vKKZ+QBLDVMSoiH7aQF4Slvy7FDGLTM9+6pL+618dOad7M2WOPqEt8w6Y7mvGFBDDGx7QkM+rVoNeu9CzMUtHNgoPaxCSCWKuCmtfNWiaEk/V7x5s3YyhV82urmiqBndEpUXNL5HBv0WGTS6ECaU1Gkk0b+StmN5i7HShEV04r1c/vQCo7NQEsk+6WwMJZ0AvYzJdcCVnrnFBJOoh7RDX0Q6YphPuFlvSryCc+T/KsQZ2KSN0jVx3QKShQpyBYI27KIicKoUbyVg+6Iv3I8CLCs400P9b9D6Oo6jqpk0sX/iUnEnvhH1x16ZKaZ13ofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740682686; c=relaxed/relaxed;
	bh=2A1aUnY+uPPYhYhaCo/xteiPx4qKbFXOoQTpLhSaaHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9uenHz+WiHnkvv3/r0vniBJzzzbQbyDBybU6MNpqS9fyWoIU8y5hMeAMBhdtUbq5tZoRFbKa6gectSjeft2PrZ+trsT1ElZNsJbG/7Zi9lSnVtoZHwISurOmyvsw7n4a6C94CaR3+UqJ4H3hB39hhs0XBXfCHSprRTVXsxe9JTbaRFIQq+n2PANgO8UEHnfVtroI5ZL+K4L1oZ5Mm6jUNkj11FCXFfl52AWtr26FyLdUMO6gsPiScxgWtaM2568mMG+IrcmtcNIPajb+kNTEGAYKIWjsUhap2mCmFR5h0pz+hPF3BhyMpIu2LFqSG7pXSWexqjMuggHIxZw28B6Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHZuAM/z; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHZuAM/z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3gb05Kgcz3bqs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 05:58:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740682685; x=1772218685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDxplo6/yUUqQJnXZQYQKrL+F9KSK94+hXUMdYhYX2Y=;
  b=MHZuAM/zokzm+34enoFimfoiOYkhs+IGqKP2cU2tJoySLYpiGWcnBQ6n
   ++Wnfqs+ADKOVlG9xSoHApZD4T1sX+79cRKFNMyZJlzfzpd6G4E2sg+Tl
   2oG+MYTUe1n4qHOqXLtJj70RyMa8036Uplr62YLo6MardIMOo3kngF0Oi
   I+08UCavuDDbfwnz+u9xlHCgKBXnzvlvC16w2ZGdoWFjc79RAN6X+eOVG
   rMr2wnTRF+YotC3i8iMXwKk04QVkjiZrWy8YFVPxh3bX2LyldyVI4/X2a
   f7BW/Ar2pg7sv+q+nDXFHaX3x7FgZZkUG7Vt2A7WbtfOrBdUtSPhdkV1K
   A==;
X-CSE-ConnectionGUID: SuXRSxedQ6aA62yMAUB+6w==
X-CSE-MsgGUID: DXJP98/NRzmFCAyKeww9Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53002990"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53002990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 10:58:00 -0800
X-CSE-ConnectionGUID: pduxVrnNRw6rr4V5IP2CaA==
X-CSE-MsgGUID: wIOTKHxhR626VhQaKeWzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="122128314"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Feb 2025 10:57:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnj50-000Du0-0o;
	Thu, 27 Feb 2025 18:57:54 +0000
Date: Fri, 28 Feb 2025 02:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Vaibhav Jain <vaibhav@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
	sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
	amachhiw@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv
 specific PMU
Message-ID: <202502280218.Jdd4jjlZ-lkp@intel.com>
References: <20250224131522.77104-5-vaibhav@linux.ibm.com>
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
In-Reply-To: <20250224131522.77104-5-vaibhav@linux.ibm.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Vaibhav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/fixes]
[also build test WARNING on kvm/queue kvm/next powerpc/topic/ppc-kvm linus/master v6.14-rc4 next-20250227]
[cannot apply to powerpc/next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vaibhav-Jain/powerpc-Document-APIv2-KVM-hcall-spec-for-Hostwide-counters/20250224-211903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
patch link:    https://lore.kernel.org/r/20250224131522.77104-5-vaibhav%40linux.ibm.com
patch subject: [PATCH v4 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
config: powerpc-kismet-CONFIG_KVM_BOOK3S_HV_PMU-CONFIG_KVM_BOOK3S_64_HV-0-0 (https://download.01.org/0day-ci/archive/20250228/202502280218.Jdd4jjlZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502280218.Jdd4jjlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280218.Jdd4jjlZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for KVM_BOOK3S_HV_PMU when selected by KVM_BOOK3S_64_HV
   WARNING: unmet direct dependencies detected for KVM_BOOK3S_HV_PMU
     Depends on [n]: VIRTUALIZATION [=y] && KVM_BOOK3S_64_HV [=y] && HV_PERF_CTRS [=n]
     Selected by [y]:
     - KVM_BOOK3S_64_HV [=y] && VIRTUALIZATION [=y] && KVM_BOOK3S_64 [=y] && PPC_POWERNV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

