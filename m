Return-Path: <linuxppc-dev+bounces-8664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B80D4ABBC39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 13:20:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1FbK6DFdz2ykc;
	Mon, 19 May 2025 21:20:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747653613;
	cv=none; b=HjhPGni3mij7g5qO7BKbHJu8m+uDHPndyXxLPLkZq/3SeZQbRf76SafZ+mHFTWdzyTeK2cUUbmhx14WZlCXmKcgMil4VBYf8XDGTTH6F1dmlRJkwBchKKSdloCbQN+2R5wywZqpJr6DUgvKwGp0grVkeRnGeVQykYH6u2FPz6TL6ZKVYBOpPTVu6PzuujYXctEt6EWk2/CS8fghSbQmvB90dhXuJjgfq7UiW93lAT8FIL/WWBnUgHlMEdB7hJtBdIH4QmhlSh2bRoRgrcn7l1RMc+C8HBYpFL5HIqo4tmCG7UsrwrhoOBnq/hwmg344uupIENhGBtmuYutUI0Xmz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747653613; c=relaxed/relaxed;
	bh=qdJ+H3Kn7S1A+ZpkfayxFuR+TO4EY5bXd/vG1NplMsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jE0m0pw22zibKKh4BHs5NgHJnbiBl7cEji0aKBx6AAuHSmwLitBWVY/7zhSzm4gPzKqqHRcIkq5/qJ9vhAO4yMIgYjfwBdPNj1MqsKrHHUqW6VvTzczXNpVvcq9UajoI/zFrZFsOqdMtF+YD5WTFJa+O1QDYecKL5Z+QtWdy9EWmqmX2Znz89Z34ANZ0yDbV7X4pH+P8nwl2/rAhPw/xKiKDTZFh+JuBxSLBixHsLrMheADpfbLa7hrHCoOhvgYTlkWp+2PT0k9OUXN8U6E2J8e8OyW1ImcHEpFjdPIIvWyQyapcypL1wcEIRw7skRSoltWL3BJw+AJNhdRyGcIIgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NbLnTX1d; dkim-atps=neutral; spf=none (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NbLnTX1d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Mon, 19 May 2025 21:20:12 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1FbJ5bYJz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 21:20:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747653613; x=1779189613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kOWXMSfFvP8AU8Pmm5Qesbcxs1DttqSoV+HoRYnp66o=;
  b=NbLnTX1dS0uxTObSal9Gzd7bIuvJ1Js3Tuyhb7o2/R6MFs9mJGiv5xgd
   z/UJFb3l5aWFRkYoms70eCpxmDsZ+Ko0Dd7mpGG1bBC54UTn6oGHdVGCl
   6xQ1hlSjM2EDzwukhWlplLexyyh+7TYRzGQGnQOY6q+QiUA5XC4iG8/9X
   dZbDmWABg1BKt3CmWPd7XwUfXFwXb1FFhXV9wVc/yOr+BAb5O5I8JuvEP
   1opWrepbqoXRtRdzBX5L4D9y+PS+7xuXiilZ9uJbEHfXjq9XoThsrK2aF
   aRGDhjYJNMLeRPoFdc31PIJu45C+8tYOLGaUaHI76wLzLzCL25oBHKCx3
   A==;
X-CSE-ConnectionGUID: IPcv7f73QEuuafaXmxXMZw==
X-CSE-MsgGUID: kkkf2YitQG2yCCq9jy40fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53346140"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="53346140"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:19:06 -0700
X-CSE-ConnectionGUID: NNfcGKStTNy9rROuAKZG7Q==
X-CSE-MsgGUID: seqsBHIJTnSKDoCSteDTLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139381866"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:19:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGyWL-0000000311M-3PbE;
	Mon, 19 May 2025 14:19:01 +0300
Date: Mon, 19 May 2025 14:19:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/3] i2c: remove 'of_node' from i2c_board_info
Message-ID: <aCsTpUfjNwFl2GyI@smile.fi.intel.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
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
In-Reply-To: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 01:13:11PM +0200, Wolfram Sang wrote:
> I promised Andy to support him in his cleanup efforts, and here is the
> outcome for tidying up i2c_board_info. It seems it was easier than
> anticipated. But my scanning scripts (awk, coccinelle) didn't find any
> more occurences and the build bots are happy, too. It really seems this
> is all that is left to do. No complaint, though.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



