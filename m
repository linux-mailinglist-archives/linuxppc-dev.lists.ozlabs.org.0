Return-Path: <linuxppc-dev+bounces-8661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FCBABBC2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 13:19:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1FZv2Nqcz2xlL;
	Mon, 19 May 2025 21:19:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747653591;
	cv=none; b=QwvGlq/rlZC8lbko1BTfFniSQN3+Au3K/wsAi623F9LYSbKYW6EddBmxH3A0f5cH65kNfMjaPrtA+P3hvo3nwqnkBt96wtzs+HyyRwRnttt7ZSq7SA9ICcXwdwwI9oD2n57xHWRm5A6euLSCR2HsmV6+shye/ooQaZZz1ZaPjMZKB5nbcVVMWaSGj/DCt6+0Eo/3vxUyhoEampQFJDOqdzY6T5qe400Qsy2dFUomploDg3CUhQlbFtdk6lPs0L7tLDIfTBPzRhDrU1TfZTaQgRWmChAStESMAXc0I5HF6RAvBjvvQ+cZSfX8CUrfYWHaeXY2shQyReae97uXlYZAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747653591; c=relaxed/relaxed;
	bh=/mYSad2iTQmP33qXrQpljSnzHj/Iax7BB7FartLKszw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzMvn6NoRsjuFq5RUA0F4nx5dSSljKPG6HFfVxHw8hVNy7kroo5jMtdF0mFXEoTUfjFMOLt2Ty9FrWbZkx0QOkksOWpyoQpG0oztjRtBlfl02F3OwYrDdWTMbvQYiDMSEKSyZFTWBLenr2CpshnR75a3eaUbY5u3oBovZw/+8hlf1GRMuxWVpYYTQSCzm8I3e7ttjs975EDd5qpMHlGoxswp2eeu6DpkcUzvi6CmbcUi9EytUJCNzdmka6Jgj0sDzX/6cFOQ8YYTCTEDmvx99h5s+ViUCUh9xjyVsCF9gBTvZx48sJvOvGQnDOcw9aTpMNrq9ZFL5PTIC7UfKTZVrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g18F5EW8; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g18F5EW8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Mon, 19 May 2025 21:19:48 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1FZr4mzVz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 21:19:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747653589; x=1779189589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=d8pTiPEkIXmvLphXftkV8OpNnpdeME9fd709mUB0N8o=;
  b=g18F5EW8lkEtO+cAS46gk3uzpzeKZPEC1wFp+ZSEkt6Qrz21q/9Pq5xq
   MWZhrlbZHP8P9eUknFIZG+vd3EcEZpc1q8cshkgCVhINobONIMAEg8jgO
   Ia2UgdWNKBeRFBe8rokJgdqueaCKvDvs/2JmmccfQ7YxTIrRZI36A9QH6
   EUXEHX5GvIdU3ASCYLVmoPsuAelSMM9xWjWsH2/Fp5u+/MxRmG8doqZAc
   TTHH1LtU3O7v6XxTJGP7sP1ftEyhFimqQgaVy5/9fj+JVc/hgUnhLYm7j
   nASAOpfLCrp5VoQKEn4cXnEVpnGX4chsQ164x9SAdcXX0y26NFb2HDyn1
   Q==;
X-CSE-ConnectionGUID: 0wxD7F1URc6//9VX5tbHHA==
X-CSE-MsgGUID: 3N/ZhRypR2m6NSZdYSUj6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49423993"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49423993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:18:42 -0700
X-CSE-ConnectionGUID: vCl+YuohTSKOiYLvjJb4DQ==
X-CSE-MsgGUID: VUPTVqwoRfeisr+nGACvww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="170251765"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:18:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGyVw-0000000310x-18lw;
	Mon, 19 May 2025 14:18:36 +0300
Date: Mon, 19 May 2025 14:18:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <aCsTjM49Ll2fcv4j@smile.fi.intel.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 01:13:12PM +0200, Wolfram Sang wrote:
> 'of_node' in i2c_boardinfo is deprecated in favor of 'fwnode'. The I2C
> core handles them equally, so simply convert this driver to fwnode.

...

> -		info.of_node = of_node_get(node);
> +		info.fwnode = of_fwnode_handle(of_node_get(node));

What puzzles me here is that of_node_get(). We already do the same in the I²C
core, does it really need the second bump of the reference counting?

In any case, this patch doesn't change the status quo, I'm fine to leave the
research for the later.

-- 
With Best Regards,
Andy Shevchenko



