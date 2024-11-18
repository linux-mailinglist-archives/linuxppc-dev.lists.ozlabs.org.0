Return-Path: <linuxppc-dev+bounces-3412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2930B9D1094
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 13:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsRqS0sRZz2yVb;
	Mon, 18 Nov 2024 23:33:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731933188;
	cv=none; b=bU+tn65JjjpGUcAXNJNEh01uELW5vzXjX57nX0fcZNSvcrZeMiJwAGg+iCZGJ4/++F4uvcW4kqiD15K0ki7bjtnSeff1DRousZZIFZZvTnrYRkPmiAmWE+I9l60W/DLBEIDlhP1vJtqMyG7GOYExMDzg8U5fyeWmGZGoh7kmCsbBRVNZTp/kMKB2gzRQZw8GGbmICc/hblnyTANNU0eMFWsVjocxCEX+vIISvblr1Cthq3nTUbg5qnj6gW6ocLnvRsgz8wmRRCvmi81KvXhx17SiMAAWLFbIAUBYH/oKuYPaLhGLadAUc4GfkjpTZl5Az6qW/nV0BbyLPcoTJMKsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731933188; c=relaxed/relaxed;
	bh=CLCYNHObCvI6Wv7dwZaxhVe+/YVDEoPQDjO93+FZICI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUcgofw3d+bUfdqIZZ2JQdh5QOEhxl2zwdccgJZfuzqFverAhOpRlZEPDezRkfyshs8usgnHBHmw6QZ3jFxsXHrPMQXUJmRF3RxHznHuNam6GsRe52R4itbUnanVEnpcV/lzManfgXE4sbT+/YRMo7uSrDPOukr/MU77IfJeFxp4GsiOiiglPkSsjW+VPBZBeFO7cM63VHMqo1evwc73ZSJ1Hq/30nkUwLqB49Wdu+O0qm1JgKffSVx9PoG0Zel9iTV+zZMs9st8V9oeb7o7zr0THgEcBV7Aqlhn38mmEH5Nury7TIAVgxtvJlX1yaalrZada5TNZz+Z5ux5M5x5dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q7Lehyyx; dkim-atps=neutral; spf=none (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q7Lehyyx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsRqK54Pcz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 23:32:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731933182; x=1763469182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jIaEOjK0mS7sbPkYVSxnP3VGbdEHlavlnKhav5Y1SV8=;
  b=Q7LehyyxGxnYQJt3LvADXFrh6OGpIEXlCppLuk7TaDtSwQrmKT+7fDkS
   b9rPqUn+Oy4LNEBT/gqRyf4tUpNTnJqfLj4FNkWqLIXU8Ib0ycL/A/eTi
   Hcq3SRgBAQeejVLIVpUXKzTTxHI2totvh+Nrv7x+OLqWEFnC5eQ8YTlrA
   QwbcrL+f3dim407aoKqTpAwvYsHwvDDgII3VweNG6YV6t/HjEn8SNhj3J
   YIB1YjuecROW7xUziX/AYWktGcsW+yoZqSwn9luu/KS7JTj2OoDpv5oK+
   qJX8fKroXha+LlqeQqTA+ua1Npi8PaRGkxInOJWq2dLxa+fnC69Bhl8xG
   w==;
X-CSE-ConnectionGUID: 1eFMyaEcQ8SFvKpMuGIReg==
X-CSE-MsgGUID: Yw4U+dUfTButMVXaB39Ebw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32037881"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32037881"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:32:56 -0800
X-CSE-ConnectionGUID: 1qjbz5mMQamSG6XBdojX1w==
X-CSE-MsgGUID: YKPyKPjFSOKMkok5yEjWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94266911"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:32:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tD0vz-0000000G0Bj-1X7S;
	Mon, 18 Nov 2024 14:32:51 +0200
Date: Mon, 18 Nov 2024 14:32:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
Message-ID: <Zzsz81-quzIZ_13L@smile.fi.intel.com>
References: <20241115133802.3919003-1-andriy.shevchenko@linux.intel.com>
 <5b44abcc-f629-4250-9edf-7f173b78172c@csgroup.eu>
 <ZzsG9EjzV82Crl2W@smile.fi.intel.com>
 <124ab5ab-3bfd-4ad7-a75d-981da9c03423@csgroup.eu>
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
In-Reply-To: <124ab5ab-3bfd-4ad7-a75d-981da9c03423@csgroup.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 18, 2024 at 12:02:44PM +0100, Christophe Leroy wrote:
> Le 18/11/2024 à 10:20, Andy Shevchenko a écrit :
> > On Sat, Nov 16, 2024 at 11:44:35AM +0100, Christophe Leroy wrote:
> > > Le 15/11/2024 à 14:38, Andy Shevchenko a écrit :
> > > > Remove legacy-of-mm-gpiochip.h header file, replace of_* functions
> > > > and structs with appropriate alternatives.
> > > 
> > > Looks like you don't really have an alternative to
> > > of_mm_gpiochip_add_data(), you are replacing one single line by 11 new ones,
> > > and that is done twice (once for cpm1_gpiochip_add16(), once for
> > > cpm1_gpiochip_add32()).

Note, the overall statistics is +1 LoC only!

> > True, but that's the issue that we have of_specific API. If someone propose
> > the common API for the agnostic approach,  it would be nice, but I am not
> > the one. And TBH I do not see the advantage of it right now as almost every
> > GPIO driver is using its own labeling schema (*). Note, that this patch also
> > fixes a memory leak as a side effect.
> 
> Can you explain that in the commit message instead of saying you use
> appropriate alternatives that do not exist ?
> 
> Don't hesitate to mention the memory leak it in the commit message as well.
> 
> > *) the legacy API is mostly used by PPC code, do you want that of_mm_* thingy
> > to be moved to PPC specific code instead of killing it? Would be done this
> > way as well.
> 
> No no, your change is ok for me, just need an accurate commit message.

Fine, just sent a v2, which is now compile-tested as suggested below.

...

> > > Does not build:
> > 
> > Crap, I most likely built something else and not these files...
> > I have carefully build-test this for v2.
> 
> Just use mpc885_ads_defconfig

Thanks, that is helpful!

-- 
With Best Regards,
Andy Shevchenko



