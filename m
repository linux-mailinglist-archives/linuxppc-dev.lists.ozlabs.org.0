Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369B4D90A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 00:51:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHYFv2Q1lz3bVF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 10:50:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bz6Hd8V8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bz6Hd8V8; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHYFF0WX0z2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 10:50:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647301825; x=1678837825;
 h=message-id:date:mime-version:to:cc:references:from:
 subject:in-reply-to:content-transfer-encoding;
 bh=7M5knxoOmfrCuDGDv6Hrs47RoFG1XAbST+A6t24ICJ8=;
 b=bz6Hd8V8n4AFitZ3QfG+H9ef/S58y8tQOL8twiV+M9AzMt9IhX0TH9bB
 f6PU98YrQgmd8kE5fx2McAz0B0tQ7+qAf713wlz4+NwntlRJ7pksxbics
 Lg5bAUkcxHnG1b0J2X6LtUWO8ZolgdL5foa9t6xcAB1dppsfhb6BJdVze
 OaBQ3/JaFxBNW1VAVnClMULUPWbm+vsHPVQ8QmG1LPjBtX9uDjaLVmTKg
 AbWnmMNAWRNT8YeuU9atIfhSRCBn3OmFIVQALH7KhVpSp1BSU3JV4es0G
 qEcinXi9aGzNm/aBA9D72ClYtWYF1GAoEG4s76OfGvwxmbjmBJiXaN8G1 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="280939439"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="280939439"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:49:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="613071356"
Received: from ssraox-mobl2.amr.corp.intel.com (HELO [10.209.55.169])
 ([10.209.55.169])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:49:19 -0700
Message-ID: <42e0aa73-04c8-a4c2-2d64-80812634b627@intel.com>
Date: Mon, 14 Mar 2022 16:49:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: ira.weiny@intel.com, Dave Hansen <dave.hansen@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20220311005742.1060992-1-ira.weiny@intel.com>
 <20220311005742.1060992-6-ira.weiny@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 5/5] x86/pkeys: Standardize on u8 for pkey type
In-Reply-To: <20220311005742.1060992-6-ira.weiny@intel.com>
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
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/10/22 16:57, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The number of pkeys supported on x86 and powerpc are much smaller than a
> u16 value can hold.  It is desirable to standardize on the type for
> pkeys.  powerpc currently supports the most pkeys at 32.  u8 is plenty
> large for that.
> 
> Standardize on the pkey types by changing u16 to u8.

How widely was this intended to "standardize" things?  Looks like it may
have missed a few spots.

Also if we're worried about the type needing to change or with the wrong
type being used, I guess we could just to a pkey_t typedef.
