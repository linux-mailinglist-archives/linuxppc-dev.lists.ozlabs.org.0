Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B177A54EB02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 22:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPDF241wTz3brM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 06:25:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgBota0L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgBota0L;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPDDP4Nrbz3bkt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 06:24:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655411077; x=1686947077;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u7s3vzw8pok7nOqE3kB+YqdXs3ysm3lKy+WAyqtMJpg=;
  b=MgBota0L4LZnfS6aAJncmXiT4swXwsD+GRw1PmHuVi4Jhc8xv1AzWzms
   fO7Ha50dAhjITwDYHVkr1L40BaLEBk857bEg1qmOeZcqJipmB1LtSt3/Q
   Ue6Useo9th4+MUYUnh/mYz1b7HGfc/TJs0nBJtmwdU9OA/OLrit82ireV
   NvHdH4fm1INnHY8P614KFEFNipAFSkLBd6UgcFqQLq81ZRDEC+FzLJjPK
   MJSSCZvF/eABbZnQZWU9i6fny9c/mwOcP7ijM5b1nqGc6PxHxy3Gf2KI9
   nJB6x1JgacuzScJFGp/98rRMayrH1pacj8FTpB0P3K0jdwZC4/dvqLotD
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280377596"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280377596"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 13:24:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="641715046"
Received: from rrmiller-mobl.amr.corp.intel.com (HELO [10.212.205.54]) ([10.212.205.54])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 13:24:25 -0700
Message-ID: <9f1d9f74-e6fd-c6cc-4999-61eccadc7bf2@intel.com>
Date: Thu, 16 Jun 2022 13:24:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/6] testing/pkeys: Add additional test for
 pkey_alloc()
Content-Language: en-US
To: Sohil Mehta <sohil.mehta@intel.com>, ira.weiny@intel.com,
 linux-api@vger.kernel.org
References: <20220610233533.3649584-1-ira.weiny@intel.com>
 <20220610233533.3649584-4-ira.weiny@intel.com>
 <b4f8ca28-f24a-d619-3682-d92fb35db56d@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <b4f8ca28-f24a-d619-3682-d92fb35db56d@intel.com>
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
Cc: x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/16/22 12:25, Sohil Mehta wrote:
> Should we have different return error codes when compile support is 
> disabled vs when runtime support is missing?

It doesn't *really* matter.  Programs have to be able to run on old
kernels which will return ENOSYS.  So, _when_ new kernels return ENOSYS
or ENOSPC is pretty immaterial.
