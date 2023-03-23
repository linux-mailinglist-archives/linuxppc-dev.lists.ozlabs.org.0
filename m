Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB326C64AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 11:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj1Wj74yYz3f43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 21:18:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ua9RyLv1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=kirill.shutemov@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ua9RyLv1;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj1Vp3pw7z3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 21:17:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679566658; x=1711102658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FnXm+KxPAQOleEvIez2agf6n8OX0ULT3pj5+c93lH5Q=;
  b=Ua9RyLv1Q3E4FRb5l7JDpHCvLJON9DMonvEJhoEsZOF1j8azudBe0MCJ
   K+UDPHKGfSt1bCe4mrSnosbQjjYsBmN3oDyaoh+LlRNz9B4VaHIRZiSnF
   omGqU5hRzo3BxxwGGU9XXSkUk8OEMDuXwNoncjOZ8JeSFaqYOFwBJQ60d
   JpA820IiNp04lQkUDAQ6OVGIXUvenALJIc43sYxE+FAAcTpnYMjNJm/Up
   Bexrt5ZAI0iPSe9Q4bI1o+/bdE4oioC5pge+4fuRtG+P+8iw/kpq8sCaW
   Alh44OO6OKe5J5JtOZidUVTfMI1JivG9USKdYG9Iu/Yzy65Ojzh1496kF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339479974"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="339479974"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825766162"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="825766162"
Received: from stinti-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.46.226])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:17:27 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 154D8109FCC; Thu, 23 Mar 2023 13:17:25 +0300 (+03)
Date: Thu, 23 Mar 2023 13:17:25 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 00/14] arch,mm: cleanup Kconfig entries for
 ARCH_FORCE_MAX_ORDER
Message-ID: <20230323101725.2jmvpaqpzflr4mv2@box>
References: <20230323092156.2545741-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323092156.2545741-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 23, 2023 at 11:21:42AM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Hi,
> 
> Several architectures have ARCH_FORCE_MAX_ORDER in their Kconfig and
> they all have wrong and misleading prompt and help text for this option.
> 
> Besides, some define insane limits for possible values of
> ARCH_FORCE_MAX_ORDER, some carefully define ranges only for a subset of
> possible configurations, some make this option configurable by users for no
> good reason.
> 
> This set updates the prompt and help text everywhere and does its best to
> update actual definitions of ranges where applicable.
> 
> Mike Rapoport (IBM) (14):
>   arm: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
>   arm64: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   csky: drop ARCH_FORCE_MAX_ORDER
>   ia64: don't allow users to override ARCH_FORCE_MAX_ORDER
>   m68k: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   nios2: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   nios2: drop ranges for definition of ARCH_FORCE_MAX_ORDER
>   powerpc: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   powerpc: drop ranges for definition of ARCH_FORCE_MAX_ORDER
>   sh: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   sh: drop ranges for definition of ARCH_FORCE_MAX_ORDER
>   sparc: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   xtensa: reword ARCH_FORCE_MAX_ORDER prompt and help text
> 
>  arch/arm/Kconfig      | 16 +++++++++-------
>  arch/arm64/Kconfig    | 27 ++++++++++++---------------
>  arch/csky/Kconfig     |  4 ----
>  arch/ia64/Kconfig     |  3 +--
>  arch/m68k/Kconfig.cpu | 16 +++++++++-------
>  arch/nios2/Kconfig    | 17 +++++++++--------
>  arch/powerpc/Kconfig  | 22 +++++++++-------------
>  arch/sh/mm/Kconfig    | 19 +++++++++----------
>  arch/sparc/Kconfig    | 16 +++++++++-------
>  arch/xtensa/Kconfig   | 16 +++++++++-------
>  10 files changed, 76 insertions(+), 80 deletions(-)

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
