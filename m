Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316314D9F9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 17:07:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHywr0KFbz3bVy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 03:07:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hr2iHflQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hr2iHflQ; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHyw82fnrz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 03:07:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647360424; x=1678896424;
 h=message-id:date:mime-version:to:cc:references:from:
 subject:in-reply-to:content-transfer-encoding;
 bh=BFrRqs9qFVnUa13ULOspS26Ceq0rJNvWyPQRN3j1Kl8=;
 b=hr2iHflQoLj08TZCBx1+Dn9o5Vesw56j/mkHMcFCJiDZahjnlMbWoYQG
 /ZPvmUEPl18x5DPuPxEhH0oDi0F/YC8AubxfnKwfUMcAh51txi6a43m4f
 0BlJsIora/gBbkWzSdtntaz/6jfles0XoWUwQ2WXpqGaL1O0hJp3X4qqo
 Q+0q+NbstK/UMi25gFEAIpQUmutHr6wvqnQeiD5phzyWRyenG8+tG5QaD
 hwQkOXHfWnLuAyik2DNbp24RJM6mkbWpQAWUfIS8CV3pHAwcwZeZ8hKg9
 0/JbjxzslBqdOOnh7Nq4qv1a7Q58Qq7xsbZyt0zdRtuOHChtydFWAKzC4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="317066719"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="317066719"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 09:03:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="549645392"
Received: from rgatlin-mobl.amr.corp.intel.com (HELO [10.251.10.152])
 ([10.251.10.152])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 09:03:33 -0700
Message-ID: <5b5ae505-84c7-1a46-832a-68bdfd8fd61c@intel.com>
Date: Tue, 15 Mar 2022 09:03:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ira Weiny <ira.weiny@intel.com>
References: <20220311005742.1060992-1-ira.weiny@intel.com>
 <20220311005742.1060992-6-ira.weiny@intel.com>
 <42e0aa73-04c8-a4c2-2d64-80812634b627@intel.com>
 <YjC2jcn7kJKdHrf3@iweiny-desk3>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 5/5] x86/pkeys: Standardize on u8 for pkey type
In-Reply-To: <YjC2jcn7kJKdHrf3@iweiny-desk3>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/15/22 08:53, Ira Weiny wrote:
> On Mon, Mar 14, 2022 at 04:49:12PM -0700, Dave Hansen wrote:
>> On 3/10/22 16:57, ira.weiny@intel.com wrote:
>>> From: Ira Weiny <ira.weiny@intel.com>
>>>
>>> The number of pkeys supported on x86 and powerpc are much smaller than a
>>> u16 value can hold.  It is desirable to standardize on the type for
>>> pkeys.  powerpc currently supports the most pkeys at 32.  u8 is plenty
>>> large for that.
>>>
>>> Standardize on the pkey types by changing u16 to u8.
>>
>> How widely was this intended to "standardize" things?  Looks like it may
>> have missed a few spots.
> 
> Sorry I think the commit message is misleading you.  The justification of u8 as
> the proper type is that no arch has a need for more than 255 pkeys.
> 
> This specific patch was intended to only change x86.  Per that goal I don't see
> any other places in x86 which uses u16 after this patch.
> 
> $ git grep u16 arch/x86 | grep key
> arch/x86/events/intel/uncore_discovery.c:	const u16 *type_id = key;
> arch/x86/include/asm/intel_pconfig.h:	u16 keyid;
> arch/x86/include/asm/mmu.h:	u16 pkey_allocation_map;
> arch/x86/include/asm/pkeys.h:	u16 all_pkeys_mask = ((1U << arch_max_pkey()) - 1);

I was also looking at the generic mm code.

>> Also if we're worried about the type needing to changY or with the wrong
>> type being used, I guess we could just to a pkey_t typedef.
> 
> I'm not 'worried' about it.  But I do think it makes the code cleaner and more
> self documenting.

Yeah, consistency is good.  Do you mind taking a look at how a pkey_t
would look, and also seeing how much core mm code should use it?
