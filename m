Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 692B731F0F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 21:28:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhR9M3lgPz3cJL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=feng.tang@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Fri, 19 Feb 2021 00:05:48 AEDT
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhFM0580Bz30LL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 00:05:48 +1100 (AEDT)
IronPort-SDR: ST55weyg8DW+Em9Dyj4SIJo1Eno+b+/1QD+xplHRa4+XKhY5m/694o3U3b/EdKhVCHl8yrg2YD
 3VezsLszVS0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="183616243"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="183616243"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 05:04:37 -0800
IronPort-SDR: ZkCv/6vhwx0D2aA6Xqr/eA6dieQwCqGAkZLB9bqJ+JSdYWatqcfLIP+FS86V9fwY8jjMvEUHeS
 fEVNR0JKLu8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="385943177"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.146.165])
 by fmsmga008.fm.intel.com with ESMTP; 18 Feb 2021 05:04:35 -0800
Date: Thu, 18 Feb 2021 21:04:34 +0800
From: Feng Tang <feng.tang@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/4xx: Fix build errors from mfdcr()
Message-ID: <20210218130434.GA47750@shbuild999.sh.intel.com>
References: <20210218123058.748882-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218123058.748882-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 19 Feb 2021 07:27:49 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 18, 2021 at 11:30:58PM +1100, Michael Ellerman wrote:
> lkp reported a build error in fsp2.o:
> 
>   CC      arch/powerpc/platforms/44x/fsp2.o
>   {standard input}:577: Error: unsupported relocation against base
> 
> Which comes from:
> 
>   pr_err("GESR0: 0x%08x\n", mfdcr(base + PLB4OPB_GESR0));
> 
> Where our mfdcr() macro is stringifying "base + PLB4OPB_GESR0", and
> passing that to the assembler, which obviously doesn't work.
> 
> The mfdcr() macro already checks that the argument is constant using
> __builtin_constant_p(), and if not calls the out-of-line version of
> mfdcr(). But in this case GCC is smart enough to notice that "base +
> PLB4OPB_GESR0" will be constant, even though it's not something we can
> immediately stringify into a register number.
> 
> Segher pointed out that passing the register number to the inline asm
> as a constant would be better, and in fact it fixes the build error,
> presumably because it gives GCC a chance to resolve the value.
> 
> While we're at it, change mtdcr() similarly.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Feng Tang <feng.tang@intel.com>

Thanks!

> ---
>  arch/powerpc/include/asm/dcr-native.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/dcr-native.h b/arch/powerpc/include/asm/dcr-native.h
> index 7141ccea8c94..a92059964579 100644
> --- a/arch/powerpc/include/asm/dcr-native.h
> +++ b/arch/powerpc/include/asm/dcr-native.h
> @@ -53,8 +53,8 @@ static inline void mtdcrx(unsigned int reg, unsigned int val)
>  #define mfdcr(rn)						\
>  	({unsigned int rval;					\
>  	if (__builtin_constant_p(rn) && rn < 1024)		\
> -		asm volatile("mfdcr %0," __stringify(rn)	\
> -		              : "=r" (rval));			\
> +		asm volatile("mfdcr %0, %1" : "=r" (rval)	\
> +			      : "n" (rn));			\
>  	else if (likely(cpu_has_feature(CPU_FTR_INDEXED_DCR)))	\
>  		rval = mfdcrx(rn);				\
>  	else							\
> @@ -64,8 +64,8 @@ static inline void mtdcrx(unsigned int reg, unsigned int val)
>  #define mtdcr(rn, v)						\
>  do {								\
>  	if (__builtin_constant_p(rn) && rn < 1024)		\
> -		asm volatile("mtdcr " __stringify(rn) ",%0"	\
> -			      : : "r" (v)); 			\
> +		asm volatile("mtdcr %0, %1"			\
> +			      : : "n" (rn), "r" (v));		\
>  	else if (likely(cpu_has_feature(CPU_FTR_INDEXED_DCR)))	\
>  		mtdcrx(rn, v);					\
>  	else							\
> -- 
> 2.25.1
