Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF76E0578
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 05:48:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxltS492mz3fCn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 13:48:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d8vqzsAu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d8vqzsAu;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pxlsc1c4tz3cK6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 13:48:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681357684; x=1712893684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPdSr4BN4qgnYBujHfxo+7EEfLMISEH3ed+UIrZgyk0=;
  b=d8vqzsAuSPpRiH2YhfQmuD9g7+Xiw+tflNznuHWnYnvlw3NrcRD5qnnt
   nw+Eadgu5Jh38XEnwapSzw1ABTfQMxrYbky4nmyjFKQAxXWKB/Ido4CVO
   Msm5PCjEckpE9Dqh3OxwcJEkON60Gb0frvY1HFeDumDiDzRHQuAqZrAC0
   Zk5/YW+IXFPD2B6hsusnzbGORS7qzwQwb/JZwO1eSEntk8PCKbNpwKZj0
   BjoW1PT3HErtAqbBOkAoA0HID/BBG6q/raIEfkMzYuSWYUYaWwVn9OdVa
   YnAE751vA732vTzHU7bib2UmajkCXtrucC5xCFZDkQIeOaAWnsftfuI67
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323699892"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323699892"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 20:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813223452"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="813223452"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orsmga004.jf.intel.com with ESMTP; 12 Apr 2023 20:47:41 -0700
Date: Wed, 12 Apr 2023 20:58:44 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>, Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: Re: [PATCH v7 00/24] x86: Implement an HPET-based hardlockup detector
Message-ID: <20230413035844.GA31620@ranerica-svr.sc.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 01, 2023 at 03:47:29PM -0800, Ricardo Neri wrote:
> Hi x86 trusted reviewers,
> 
> This is the seventh version of this patchset. I acknowledge that it took me
> a long time to post a new version. Sorry! I will commit time to continue
> working on this series with high priority and I will post a new series soon
> after receiving your new feedback.
> 
> Although this series touches several subsystems, I plan to send it to the
> x86 maintainers because a) the series does not make much sense if split
> into subsystems, b) Thomas Gleixner has reviewed previous versions, and c)
> he has contributed to all the subsystems I modify.
> 
> Tony Luck has kindly reviewed previous versions of the series and I carried
> his Reviewed-by tags. This version, however, has new patches that also need
> review.
> 
> I seek to collect the Reviewed-by tags from the x86 trusted reviewers for
> the following patches:
>    + arch/x86: 4, 5
>    + Intel IOMMU: 6,
>    + AMD IOMMU: 9, 10, 11,
>    + NMI watchdog: 23 and 24.

Hello, checking if there is any feedback on these patches that I plan to
send to the x86 maintainer.

I am still seeking to collect the Reviewed-by: tags from the x86 trusted
reviewers.

Thanks in advance!

BR,
Ricardo
