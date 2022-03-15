Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A1B4DA0A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 17:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ04N5xBfz30J6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 03:59:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lhe3tQ1j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Lhe3tQ1j; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ03j3C9Nz2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 03:58:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647363521; x=1678899521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m7ZKrh8loAyVEg0SDdOAuMAn1KCDmPCSOZk5E8Ai0S4=;
 b=Lhe3tQ1jkdnNq8onMi6Ed+xpxPBrUxWMo7ATuRtKla5vtjldHuIH/HI3
 X/QTIi5xCsuTYhEUO+hcnLXwXqMklW9WQQ5v41j182LS7pp3icGWieHV1
 bSaHpNH/1k4y32ncY7BuzjEYtgHTUkIfJ/R8d4YgAxuGpQD5B1no7Y/Yz
 OYRwJ2JibCLz1qh3dICsUdDcERoaij/SFb7/rIU6KioHqp9mG6smJ5FjA
 BYH6rDcqLr65lreNzh5M7Zruug7oQJarO5woyXQZIXoQKUAH27Y8gfdAq
 evE8qyiV9Tb3F1E+ZYxRGwtDZdhe6YXOLFVt8wgbrNR4Wi+xU+xG2u1WY g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238526529"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="238526529"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 09:57:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="498091678"
Received: from jpgabald-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.75.31])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 09:57:30 -0700
Date: Tue, 15 Mar 2022 09:57:30 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 5/5] x86/pkeys: Standardize on u8 for pkey type
Message-ID: <YjDFesTdo8Zl8iYm@iweiny-desk3>
References: <20220311005742.1060992-1-ira.weiny@intel.com>
 <20220311005742.1060992-6-ira.weiny@intel.com>
 <42e0aa73-04c8-a4c2-2d64-80812634b627@intel.com>
 <YjC2jcn7kJKdHrf3@iweiny-desk3>
 <5b5ae505-84c7-1a46-832a-68bdfd8fd61c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b5ae505-84c7-1a46-832a-68bdfd8fd61c@intel.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 15, 2022 at 09:03:26AM -0700, Dave Hansen wrote:
> On 3/15/22 08:53, Ira Weiny wrote:
> > On Mon, Mar 14, 2022 at 04:49:12PM -0700, Dave Hansen wrote:
> >> On 3/10/22 16:57, ira.weiny@intel.com wrote:
> >>> From: Ira Weiny <ira.weiny@intel.com>
> >>>
> >>> The number of pkeys supported on x86 and powerpc are much smaller than a
> >>> u16 value can hold.  It is desirable to standardize on the type for
> >>> pkeys.  powerpc currently supports the most pkeys at 32.  u8 is plenty
> >>> large for that.
> >>>
> >>> Standardize on the pkey types by changing u16 to u8.
> >>
> >> How widely was this intended to "standardize" things?  Looks like it may
> >> have missed a few spots.
> > 
> > Sorry I think the commit message is misleading you.  The justification of u8 as
> > the proper type is that no arch has a need for more than 255 pkeys.
> > 
> > This specific patch was intended to only change x86.  Per that goal I don't see
> > any other places in x86 which uses u16 after this patch.
> > 
> > $ git grep u16 arch/x86 | grep key
> > arch/x86/events/intel/uncore_discovery.c:	const u16 *type_id = key;
> > arch/x86/include/asm/intel_pconfig.h:	u16 keyid;
> > arch/x86/include/asm/mmu.h:	u16 pkey_allocation_map;
> > arch/x86/include/asm/pkeys.h:	u16 all_pkeys_mask = ((1U << arch_max_pkey()) - 1);
> 
> I was also looking at the generic mm code.

Ah yea that needs to be sorted out too I think.

> 
> >> Also if we're worried about the type needing to changY or with the wrong
> >> type being used, I guess we could just to a pkey_t typedef.
> > 
> > I'm not 'worried' about it.  But I do think it makes the code cleaner and more
> > self documenting.
> 
> Yeah, consistency is good.  Do you mind taking a look at how a pkey_t
> would look, and also seeing how much core mm code should use it?

I don't mind at all.

Ira
