Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7F486AE3D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 12:54:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLD9Q0mj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCSR21cYz3vcW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:54:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLD9Q0mj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=kirill.shutemov@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 28 Feb 2024 22:52:58 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCQy4mcPz3ccC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 22:52:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709121179; x=1740657179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UOHYABj412OrOe9R32rHntZ5qCSK4fekgltl0v2LzuA=;
  b=nLD9Q0mjAjiTCXVeTf38B8E6EmDv09rzjyb261B6jQ1Hk9GR7/4aQfuw
   9v7Cs50L3M7xSoVLJnguN1e9dgUjeQOtKsl5aN7FUtJIyOVS/6O0EGW3M
   qwOc/9ta/T8QRbBm/8TkPOkHQyatnKFPWkSR571Um7CVJjbyzjJOIjnz+
   mmeps38Nez6icwMR491c+5XnDW+Opqnn1Li85atBKzPWltUJppEA5pF0Y
   HeEl41Qd6zNxLbbyaeua5hKvDQpWrjYG7D8p/HVSRmGWWEz7m1jSivmXq
   oALPNNf8SEiOWR5L71tlYccU6xkTSilP4h6RzqL3TCo/dqlgmRCs6W5B8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7337747"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7337747"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 03:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="937034059"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="937034059"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2024 03:51:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id B730928A; Wed, 28 Feb 2024 13:51:42 +0200 (EET)
Date: Wed, 28 Feb 2024 13:51:42 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <j7bfvig3gew3qruouxrh7z7ehjjafrgkbcmg6tcghhfh3rhmzi@wzlcoecgy5rs>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
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
Cc: luto@kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, linux-csky@vger.kernel.org, mingo@redhat.com, linux-snps-arc@lists.infradead.org, keescook@chromium.org, Liam.Howlett@oracle.com, broonie@kernel.org, bp@alien8.de, loongarch@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, debug@rivosinc.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 11:09:47AM -0800, Rick Edgecombe wrote:
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 5db88b627439..dd6801bb9240 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1218,7 +1218,7 @@ static unsigned long
>  arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
>  		         unsigned long limit)
>  {
> -	struct vm_unmapped_area_info info;
> +	struct vm_unmapped_area_info info = {};
>  
>  	info.flags = 0;
>  	info.length = len;

Can we make a step forward and actually move initialization inside the
initializator? Something like below.

I understand that it is substantially more work, but I think it is useful.

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 5db88b627439..c40ddede3b13 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1218,14 +1218,12 @@ static unsigned long
 arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 		         unsigned long limit)
 {
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {
+		.length = len;
+		.low_limit = addr,
+		.high_limit = limit,
+	};

-	info.flags = 0;
-	info.length = len;
-	info.low_limit = addr;
-	info.high_limit = limit;
-	info.align_mask = 0;
-	info.align_offset = 0;
 	return vm_unmapped_area(&info);
 }

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
