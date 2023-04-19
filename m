Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EB16E75CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 10:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1ZRv4B6Vz3fFr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:57:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BR7WTzhV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BR7WTzhV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1ZR11WkZz3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 18:56:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7164860D24;
	Wed, 19 Apr 2023 08:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC62C433EF;
	Wed, 19 Apr 2023 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681894601;
	bh=oL3JfeXWUvBPUZYm3G7h4erIKqKht1v9PUQNBf1+rOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BR7WTzhV+iyHBxQ8Oa1rcV4sSIOUSmp0fX0gCgozNiJSx7eQY1V/PMcvXsLGM4MLi
	 y4DnDqR7GqUjCxVTLISQvLmr2xZLJnC5y9M53YFeOk0EC55PkeSod5brJmGrM0EGhR
	 LG0KfajjZxgU7WsGUQJoVUMk/Ks7yPViz5AWk33QbGZSpDZZ5+Qg4wlnTRsGq7tgaE
	 1cVsFasQNA+emk3GBpqmUV+J3vB+6qhs/PLg4X0Yjqqz5dz31oXpgtwJPdVN8f05kZ
	 Oj/30StHYGewt51jyd4ViqMaxcXCkBDpbFqe91wYXXx7hb0cja/0MnPVN2RsvZIgYt
	 VRrAqyXH2ZrNQ==
Date: Wed, 19 Apr 2023 11:56:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 05/14] ia64: don't allow users to override
 ARCH_FORCE_MAX_ORDER
Message-ID: <ZD+stlzr83s6qkJr@kernel.org>
References: <20230325060828.2662773-1-rppt@kernel.org>
 <20230325060828.2662773-6-rppt@kernel.org>
 <02dd2437-32fa-31aa-4ff3-b33a058f2363@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02dd2437-32fa-31aa-4ff3-b33a058f2363@huawei.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 25, 2023 at 02:38:15PM +0800, Kefeng Wang wrote:
> 
> 
> On 2023/3/25 14:08, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > It is enough to keep default values for base and huge pages without
> > letting users to override ARCH_FORCE_MAX_ORDER.
> > 
> > Drop the prompt to make the option unvisible in *config.
> > 
> > Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >   arch/ia64/Kconfig | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
> > index 0d2f41fa56ee..b61437cae162 100644
> > --- a/arch/ia64/Kconfig
> > +++ b/arch/ia64/Kconfig
> > @@ -202,8 +202,7 @@ config IA64_CYCLONE
> >   	  If you're unsure, answer N.
> >   config ARCH_FORCE_MAX_ORDER
> > -	int "MAX_ORDER (10 - 16)"  if !HUGETLB_PAGE
> > -	range 10 16  if !HUGETLB_PAGE
> > +	int
> >   	default "16" if HUGETLB_PAGE
> >   	default "10"
> 
> It seems that we could drop the following part?

ia64 can have 64k pages, so with MAX_ORDER==16 we'd need at least 32 bits
for section size
 
> diff --git a/arch/ia64/include/asm/sparsemem.h
> b/arch/ia64/include/asm/sparsemem.h
> index a58f8b466d96..18187551b183 100644
> --- a/arch/ia64/include/asm/sparsemem.h
> +++ b/arch/ia64/include/asm/sparsemem.h
> @@ -11,11 +11,6 @@
> 
>  #define SECTION_SIZE_BITS      (30)
>  #define MAX_PHYSMEM_BITS       (50)
> -#ifdef CONFIG_ARCH_FORCE_MAX_ORDER
> -#if (CONFIG_ARCH_FORCE_MAX_ORDER + PAGE_SHIFT > SECTION_SIZE_BITS)
> -#undef SECTION_SIZE_BITS
> -#define SECTION_SIZE_BITS (CONFIG_ARCH_FORCE_MAX_ORDER + PAGE_SHIFT)
> -#endif
>  #endif
> 

-- 
Sincerely yours,
Mike.
