Return-Path: <linuxppc-dev+bounces-11328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99045B36363
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 15:29:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB7mN10n1z3dTk;
	Tue, 26 Aug 2025 23:29:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756214948;
	cv=none; b=gu/BB+uzme1EvzHWZ/elMW9c9x3YY2VLrsJDofHHB0S7bUzZL64ClhOG9q83KZU9bSB6FSXt2eJNy8l/8UQUC4GS1oHPIkmBWsIVDYjvF1lUZgrL6c5ElBXeIuhVtNtkFeLBwMjfKTK4CSGiyKqR8VDItDH47vZJWFrcCEkZ92f/JXG7r2wq0gE39lQVC6LJW40doZa8ccVPO9526rP+10vbhDFOqk65pgnPon7ggM7zLBgkT1SZse4mmdsFsWcoyKUZPn1hXfymw87zelc4AC+k4INqXgzodNunB1rVV8FFfwv8IeM4zAEvWCbnj2ocO5tuGW60SZnIdZgsxPaklw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756214948; c=relaxed/relaxed;
	bh=fOXXYg1NukWIx/zlQCPDzIFeJGiay2wbUo04Q9XqD9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PupGC0RcGoXWeR6axLbB3D3tVPFytU43C8BBDm4uMM+25Pq/sORYJZ926h2R+WNDcOWmQGHc3GuOfEHQdfvkzJdKkyCHmbs/lxpP9rJX3OF2XIeglGUFq0tmpVagnMkmXlt/YYVou5pyVFcAXQu0SJM6Gdz6hXE3DeoS1LWKD1ANgMYv3KYborgf7x0YNdeQdizSgzfLQDJ31TBju1QjSZa6wX4CDMuawihMfAOl+Meuv/dGZm41E0xn1AC6yhAUFVpkArp3ot5JW/meTTTucvtWsEsLPXQtz8ARCDR6Eh9aTi0fBLGcpp5OiY4w4yazSicR1lcXlURnQoAAdP/8/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PTMUnBFu; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PTMUnBFu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB7mK6NCYz3dTg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 23:29:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756214946; x=1787750946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WONqwahE1t7tG5WMekP4ROtP2MyOMiDAgeptG1B8c8o=;
  b=PTMUnBFu2qjk28Z/I0Z5l8hArhgdqhWjWECp9725ZUxDCb7JEKMkn48c
   GoW8u6uBFKo7in97T7l2m9J5UcCYjwWbZg/seCJawwYwDdmkl3eROf40H
   sqYxqiHe/ECQ7xmGZrPO74hdU/bsfSRJY39Q84SpBTKi5KmwDBpoulu/N
   68D/jjSv5FX1eBAodZWoC4CY0poyCzRJl2YvCtIb7eTF4VuZdEsfxH0FW
   hEwvUTZdVFaZO3yTwWesSK9Z19mudY9Z1b+lIfHBqEl9gWwmgyyIV/6aj
   hnH2s13iEO4FXhOjmY+Bq+XaYKJ7mSjiJM65kQWgqU+WXY7bFpcZww+/F
   A==;
X-CSE-ConnectionGUID: YhwdB6r5Q9atEMpETLWPlg==
X-CSE-MsgGUID: 5HOK9tXoSBKmsF2ocxGy8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57649673"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57649673"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:29:01 -0700
X-CSE-ConnectionGUID: yZ/HNeJPSH+ByFL3yfAtLw==
X-CSE-MsgGUID: 3/+Gz3kfTi6VujhV0pZ9kw==
X-ExtLoop1: 1
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:28:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uqtjF-00000008mqQ-2YXp;
	Tue, 26 Aug 2025 16:28:49 +0300
Date: Tue, 26 Aug 2025 16:28:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
Message-ID: <aK22kUhlxlyvVLax@smile.fi.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
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
In-Reply-To: <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
> > There are a few places in architecture code for the floppy driver
> > that may be cleaned up. Do it so.
> > 
> > Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
> > 
> > Changelog v2:
> > - combined separate patches sent earlier into a series
> > - added tags (Helge, Geert)
> > - fixed typo in the commit message (Geert)

[...]

> Applied, thanks!

Ah, thanks! It's good to know you can take (and actually did that) them.

> [1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
>       commit: d74968780bf287958e2815be5f088dd6c7b7aa19
> [2/3] floppy: Replace custom SZ_64K constant
>       commit: 8e7ee0f6fa33934373c1c37e8cfb71cff2acea09
> [3/3] floppy: Sort headers alphabetically
>       commit: d4399e6eb27a803b73d17fe984448a823b4d3a30

-- 
With Best Regards,
Andy Shevchenko



