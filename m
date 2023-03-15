Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A76BC166
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 00:35:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcRZb6mZjz3chn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 10:35:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W4d56DHR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W4d56DHR;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcRYf1KHGz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 10:34:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678923254; x=1710459254;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NQJpa5UCmsYlmz1mfEg6+eiMHkbYcmvZUf1XJhtPzhU=;
  b=W4d56DHRZCWSJ5s2w+QrKX1cVu+ItQn8cn9JDNDp9rJMMypkSSefOtTB
   66o0wxkOFNiKT5vxH/1yOI8y/50p2BNL9viks7cv8w71uHhjorHfnNmPT
   rKXQaGriLOHnKHF5BffAite8tMAStqNodkzCevJe1nzsak6pW0vTAzJOG
   MYTZZQDg87FyrOEtDQcC67iZs3THcwDNfrKPQwnH8g4WOyQD8YZ0E0UQV
   S277h0PTtP275tbgb56t/gl/zbWrkhBkIUTVXteoFFxPiS4uiy2N6m3Uq
   53YChpoVWQ1ZRJSjaymMKZSZyyALc40iENRRiT5F6FvftVFX6Upd3NKfB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="400418394"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="400418394"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790026004"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="790026004"
Received: from zlamorea-mobl.amr.corp.intel.com (HELO [10.209.109.244]) ([10.209.109.244])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:33:59 -0700
Message-ID: <3523ddf9-03f5-3179-9f39-cec09f79aa97@intel.com>
Date: Wed, 15 Mar 2023 16:33:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/3] COVER: Remove memcpy_page_flushcache()
Content-Language: en-US
To: Ira Weiny <ira.weiny@intel.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
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
Cc: Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, Al Viro <viro@zeniv.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/15/23 16:20, Ira Weiny wrote:
> Commit 21b56c847753 ("iov_iter: get rid of separate bvec and xarray 
> callbacks") removed the calls to memcpy_page_flushcache().
> 
> kmap_atomic() is deprecated and used in the x86 version of
> memcpy_page_flushcache().
> 
> Remove the unnecessary memcpy_page_flushcache() call from all arch's.

Hi Ira,

Since the common code user is already gone these three patches seem
quite independent.  It seems like the right thing to do is have
individual arch maintainers cherry pick their arch patch and carry it
independently.

Is there a compelling reason to have someone pick up and carry these all
together that I'm missing?
