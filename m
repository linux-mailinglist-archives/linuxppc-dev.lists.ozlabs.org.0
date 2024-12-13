Return-Path: <linuxppc-dev+bounces-4116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4B9F1334
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 18:07:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8wkr3j4Pz2xKd;
	Sat, 14 Dec 2024 04:07:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734109668;
	cv=none; b=a41ZcoD1RAx6RX1BsXIafXnOxiD6BwXFuSWJTm8O+8P0yjOXr5n3LZ2xg8/f5Py+O8G8Xl1FCaXxM044hsePkQu9k3GliK23aCv8T2GgS4SlFJ6FgH8ws6g+VQrSrztmBQ+w4BHgUiOmF76/ujQmh2hZxlChZU/JxSEePpXi3FrL7VChOZUV0XttECmDPO+Ec9yWclPAy7ovXSKZHRwovQJwKPDODATlA2/Faz3XtZjgz1TynJXxAk1NQR7IKs1YEsEFFhae1eO0z3WtLRKF8LoWrlAI2NfmEed2E3+DQlK/2vYhskg6y2FvNq/JtTm28FHVf3D8YnmZ2hkV+eqrbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734109668; c=relaxed/relaxed;
	bh=JbxQZElUEjEOuIG5SNuCuk0FCUjKz3aJF2K3vtJzMII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjMfGeuQp8rm83F3HP+n0B02OEjMnxKDioucgICxImmZ714bXD7sqAjmZe0gKElWS/gcvWbb1hzPXaox24xGGl/bMTE9z74O8UsFEjX+rYpKmdDaeFH5DffAMSZ2cS6ldHHMyrT6G2EpVNvq2g+PdQgzCo55Hy7MIIKudnBryP4CXTjDfGm/iufI4WHvLp1gHG4jo5hAF/w0AEmQiNY4YLwOL2KjGWlVgvU3TcWFxBtpeDPFisppiQhki2NPoGAosMtMysiG+jF30pFqId3+Q/OZHV/OupSKVmlOty+D3JHADQn5tqy74GgtMi4zKn9Tagbt7/UTb/GGv5vebDjoQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ytb8kXeS; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ytb8kXeS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8wkm6xHrz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 04:07:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734109665; x=1765645665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9h2P6ELdMzx/Gu7OEnPIQA6Pmdclf6xQrgpKHh0542A=;
  b=Ytb8kXeSZvKkW0kyvXJHkcCX4nc4x9kC9/qnMh+bv83EdolBy6E28vjr
   wJtvAiHt0mDT6Bb838bS39bV44NG7/YUxDIZL4wU3vSVZQyX5CCsIJyqV
   8kYnMSF+jSVqZbBgqhPU7F2tUMVBr5sbCdAX6+zY7E6+DtMXJAKtWq+AX
   3FdW+9UVgUp27PF+SzUSV8vtwCom/sb1u0o6lQE01RG8I9IfbyrfBzAv5
   52R5SxZ+jGnTkx0yL88THHi67U20blMeOY9LGl3JU44xSiMc9wnp3WWA3
   QGgHPgKBdqFN81c14cWZqhRwv43kmZPeyr/Plx1XJPnoZf767s6lTwtKy
   Q==;
X-CSE-ConnectionGUID: q2oKfghMR8+ugpFPCYb8+w==
X-CSE-MsgGUID: L8/UspTFQ9q6QYdmLUEcdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="22156297"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="22156297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 09:07:40 -0800
X-CSE-ConnectionGUID: vt3drGVZS566O67j18l/5A==
X-CSE-MsgGUID: R2CKISlLTKWU8fVnWwDOag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97373648"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 09:07:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tM98Z-00000007Py8-27f7;
	Fri, 13 Dec 2024 19:07:35 +0200
Date: Fri, 13 Dec 2024 19:07:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
Message-ID: <Z1xp1xwLXAvkKgwD@smile.fi.intel.com>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
 <514964ea-0795-41d6-91d3-f3d4f193fc6d@csgroup.eu>
 <Z1sOTf6UZbruptnl@smile.fi.intel.com>
 <991aee8b-fb10-4152-89fb-6ac542ee87c1@csgroup.eu>
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
In-Reply-To: <991aee8b-fb10-4152-89fb-6ac542ee87c1@csgroup.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 13, 2024 at 07:28:45AM +0100, Christophe Leroy wrote:
> Le 12/12/2024 à 17:24, Andy Shevchenko a écrit :
> > On Mon, Nov 18, 2024 at 03:10:09PM +0100, Christophe Leroy wrote:
> > > Le 18/11/2024 à 13:31, Andy Shevchenko a écrit :
> > > > Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> > > > file provides an OF API that's deprecated. There is no agnostic
> > > > alternatives to it and we have to open code the logic which was
> > > > hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> > > > drivers are using their own labeling schemas and resource retrieval
> > > > that only a few may gain of the code deduplication, so whenever
> > > > alternative is appear we can move drivers again to use that one.
> > > > 
> > > > As a side effect this change fixes a potential memory leak on
> > > > an error path, if of_mm_gpiochip_add_data() fails.
> > > > 
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > 
> > Thanks, what's next?
> 
> Next step is that Michael or Madhavan apply it I guess ?

Folks, do you have any comments? Can you apply this and we move forward towards
removing the legacy API from the kernel?

-- 
With Best Regards,
Andy Shevchenko



