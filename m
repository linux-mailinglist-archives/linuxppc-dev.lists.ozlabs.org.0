Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ACD7ACE26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 04:33:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTn2Jx6b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv6Nt6Xmvz3cbZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 12:33:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTn2Jx6b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Mon, 25 Sep 2023 12:32:15 AEST
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv6Mz5lmyz3c2K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 12:32:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695609136; x=1727145136;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uSKF2LkBbCOJvzhdcYIdKnGGrppJwIiNPHQWNKzX1pg=;
  b=GTn2Jx6b9alBcOglk9TsqaM5gp3dAdSkyD/IF2IHEt8PmFp5B4Zph8uj
   rCcgRtOD/luL40/uIwc//FX0f5jU46W2O9QZ2mAePmVvb8sQpeafpjmHi
   Q+yVChSi710KRmgr9n2hCTH3roGR42SGc5o97ZPa7iwi9vn3RYDmGOSix
   JEdfDAvxcTBqV7rbHPkL5eDADTyB/zv2HyO6faYkVU1knCr3Lf3QyJRgU
   aCjhWkC4j2YKV8kcJ4mxftg/Kusw7QI6AYdk6jHpLNWOlkrWfsgm24vcz
   r/JKtYHNyZPB5gwp2SXRQ6jQiWPTEW6MeCBToYR37s9YpPGm73YxSVz39
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447636209"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="447636209"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 19:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741746289"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="741746289"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127]) ([10.239.159.127])
  by orsmga007.jf.intel.com with ESMTP; 24 Sep 2023 19:31:01 -0700
Message-ID: <556c732d-bf15-a14a-ff6b-e770aa6bc797@linux.intel.com>
Date: Mon, 25 Sep 2023 10:27:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/8] iommu/vt-d: Update the definition of the blocking
 domain
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Hector Martin <marcan@marcan.st>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Sven Peter <sven@svenpeter.dev>, Will Deacon <will@kernel.org>
References: <2-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <2-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/23 1:07 AM, Jason Gunthorpe wrote:
> The global static should pre-define the type and the NOP free function can
> be now left as NULL.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/intel/iommu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
