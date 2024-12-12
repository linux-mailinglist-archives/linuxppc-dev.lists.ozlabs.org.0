Return-Path: <linuxppc-dev+bounces-4051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A79EF024
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 17:24:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Hqq2fn7z30WB;
	Fri, 13 Dec 2024 03:24:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734020695;
	cv=none; b=HJuKUcUKu5AFhwwejePPDnBJb5n+lYjIYRho7iDBH+7Lff45iUNN/wyvEmiA4Jk/SWhQWsYR5aXDpstinm3BQrWJ7EEdZYUjdtyWewgnefrMuTFXs3Uxb8JMmELDP8neLxY10su/DOhqllSf5Aip5DHamlXXZQi5zPMCqc8YUGPDCw1NmVHToyY46vaa83IL7tgYfPuLlqGQajAjUmJZgfwsUSZnRXA4BtJ3QP7Rr6sUDAKFgYtqDGNrdLVJdjzwNuspFajvP9UNzBEDGPoYc1KUVSMSGH1UJIY5/8yflpsBBpISFyKAMj843psMHZFr5WXNwxdqPuX89uruv81EkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734020695; c=relaxed/relaxed;
	bh=AV/vRhjOxzpkMxJZWaBBCf6HFbojqSezciv2tpi0slc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIr5u1mM/3+c+2iGQssLmqUOGJ2maeU/amZF5FGwyxwjWJV+hkQRY3SxMkcikFSDyz6jLwW/0L8Yermd9tgkqQo//tUOmF1cbQ+oG1XTAS3rhp00yEwXHwMkGhf1wN3u3I5a6dN7iozK/+DJNfuGLnwmlDFGxuA9L3HAcMETMtLivd63R4TqkkvyPEdLTaOIJHa4BMoYgTEVZrmykyd7TwYkmbR6/7s1Q8rJ9s6dvpPhUB9OXrgzM34IFqQ26ik/MrHXv5/VTwuivOZNtRnmFmWYMLAUr7xkCaYx/o0X/aoaNkg/Sm0JYuY/sfDf0d11MsYCiCydK5eIRMaF/ao82A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KZsfE8Kd; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KZsfE8Kd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Hqn45vgz30W1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 03:24:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734020693; x=1765556693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ybvh2LCs1jiATsTUws2yLPCzIB7crBX5rhe0jzCJ0uw=;
  b=KZsfE8Kd+2lQyFMtuHDZwCk0mu3eE8sB9k9yYf1HPZs5NYRZk+dxWtdL
   K/7QpCET8rDB9vU95jUkmC7RsuRe1CjuxgTcKnLy6cwmYLUWf3P2sPhYT
   dfkJJRYQskxDunr6ZmlqGIMDP3BwYLJwqR8VdiplE+pg133PeNt9QCJ6i
   /FYPwDQvUsk8sGY+oF2tddR9v9p1ZRqAOsAZ+dNWMkV8hc7lPNmLfUahB
   vDSbnpjPuwId9HnyyNIIviAM9cHTnu1Ymhdzrlff43i0W09yoFMDQlVFd
   WZxgOJaeJoWxqvgLmxYvtGLXaloYzAVjHUk2JFvsn1JRWxSvStYYbNRFh
   w==;
X-CSE-ConnectionGUID: V/oP6vQzRqWHUYzsUoROjA==
X-CSE-MsgGUID: YAz0c+zVTdyF9frWnl2tbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34688799"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="34688799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 08:24:50 -0800
X-CSE-ConnectionGUID: 4l0s1ysIT0KAEIdiF1KARg==
X-CSE-MsgGUID: N33rhWbZTyKgBKZYqknKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96355689"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 08:24:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tLlzZ-00000006xwk-39dJ;
	Thu, 12 Dec 2024 18:24:45 +0200
Date: Thu, 12 Dec 2024 18:24:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
Message-ID: <Z1sOTf6UZbruptnl@smile.fi.intel.com>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
 <514964ea-0795-41d6-91d3-f3d4f193fc6d@csgroup.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <514964ea-0795-41d6-91d3-f3d4f193fc6d@csgroup.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 18, 2024 at 03:10:09PM +0100, Christophe Leroy wrote:
> Le 18/11/2024 à 13:31, Andy Shevchenko a écrit :
> > Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> > file provides an OF API that's deprecated. There is no agnostic
> > alternatives to it and we have to open code the logic which was
> > hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> > drivers are using their own labeling schemas and resource retrieval
> > that only a few may gain of the code deduplication, so whenever
> > alternative is appear we can move drivers again to use that one.
> > 
> > As a side effect this change fixes a potential memory leak on
> > an error path, if of_mm_gpiochip_add_data() fails.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks, what's next?

-- 
With Best Regards,
Andy Shevchenko



