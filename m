Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A85CE4D9F69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 16:55:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHyfq4Rpqz3bN7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 02:55:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPvn3nYv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kPvn3nYv; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHyfC5Qzfz2yn9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 02:54:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647359700; x=1678895700;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LVRCX0EQ30zWj1FtfHS0UtBgJd7k0IXdfU/D+Vm6e6I=;
 b=kPvn3nYv2lncn3Gx5JhaV9w8McvalkJlR4keRQ3+wu2UHJ6KE10mgeAH
 3jbiAqYBPOQphB4KZJcLmffTqhAk+tCw9lUJanGxFZ1EMMs2Kdy04NWlW
 0tXmn5kBSfgUSVq6k6ZTwredR0VaLXBdMEBQq8b0mkUVeGxPxWl3YecS9
 U4Mo6f6T7VFBky68cFtyqAbn4FxkKZARPwJcgRDyeGGVK/VK2PjOZmnzI
 wwDyrgTnYZd9vJhhNNKKqtmUhkVSHC7dFUP4dqBLah4HM3pI+aRlIJnyV
 8S3Uof/eVIHWp2l0pSTmvsT1QQkoWpVf77SUkYA1tCLVuuR9st6D1ilBT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256292988"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="256292988"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:53:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="512657426"
Received: from jpgabald-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.75.31])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:53:50 -0700
Date: Tue, 15 Mar 2022 08:53:49 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 5/5] x86/pkeys: Standardize on u8 for pkey type
Message-ID: <YjC2jcn7kJKdHrf3@iweiny-desk3>
References: <20220311005742.1060992-1-ira.weiny@intel.com>
 <20220311005742.1060992-6-ira.weiny@intel.com>
 <42e0aa73-04c8-a4c2-2d64-80812634b627@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42e0aa73-04c8-a4c2-2d64-80812634b627@intel.com>
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

On Mon, Mar 14, 2022 at 04:49:12PM -0700, Dave Hansen wrote:
> On 3/10/22 16:57, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The number of pkeys supported on x86 and powerpc are much smaller than a
> > u16 value can hold.  It is desirable to standardize on the type for
> > pkeys.  powerpc currently supports the most pkeys at 32.  u8 is plenty
> > large for that.
> > 
> > Standardize on the pkey types by changing u16 to u8.
> 
> How widely was this intended to "standardize" things?  Looks like it may
> have missed a few spots.

Sorry I think the commit message is misleading you.  The justification of u8 as
the proper type is that no arch has a need for more than 255 pkeys.

This specific patch was intended to only change x86.  Per that goal I don't see
any other places in x86 which uses u16 after this patch.

$ git grep u16 arch/x86 | grep key
arch/x86/events/intel/uncore_discovery.c:	const u16 *type_id = key;
arch/x86/include/asm/intel_pconfig.h:	u16 keyid;
arch/x86/include/asm/mmu.h:	u16 pkey_allocation_map;
arch/x86/include/asm/pkeys.h:	u16 all_pkeys_mask = ((1U << arch_max_pkey()) - 1);

> 
> Also if we're worried about the type needing to change or with the wrong
> type being used, I guess we could just to a pkey_t typedef.

I'm not 'worried' about it.  But I do think it makes the code cleaner and more
self documenting.

Ira
