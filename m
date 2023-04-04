Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E234F6D5965
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 09:23:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrK3x5CTFz3chl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 17:23:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CqHblzUj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CqHblzUj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrK3361cKz3bXQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 17:22:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 187FE61248;
	Tue,  4 Apr 2023 07:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18439C433D2;
	Tue,  4 Apr 2023 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680592939;
	bh=zNbuc2c7Q9IWg5uy9hdmHULoUQBr2Hs/BAYhilZF5F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqHblzUj1z5GNNRhlVv5PjhJZbkNnPlRJpd8BNP9SFM3LozxkSRnpQ6pJHq1734IE
	 nD0HzFbv58nu6J/EDvb0/r/dPnGTG4/RX9IFH1dtOkbIUrpX4gBAxv+iMBA5DHcRED
	 emlRqtXMUO+8S4B3gXHGAfaZat5oK//B6B2YKi3S5Gq0z1OVXNwTRQKMwaAeo6YUWs
	 fVidc4rMbc4aUoxxzgWhlqdgki6r0Y6O3oX30JhcakMQVSnJAF09H5rT22qPoqcLsD
	 1rUCPCKRgr6yla1vp2aXejTBBX5r0wagFlZzYRUY3h9pSLxjoBb/Ad/MMOzP9CoNyA
	 E21K1u28YAOpQ==
Date: Tue, 4 Apr 2023 10:22:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Justin Forbes <jforbes@fedoraproject.org>
Subject: Re: [PATCH v3 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Message-ID: <ZCvQGJzdED+An8an@kernel.org>
References: <20230325060828.2662773-1-rppt@kernel.org>
 <20230325060828.2662773-3-rppt@kernel.org>
 <CAFxkdAr5C7ggZ+WdvDbsfmwuXujT_z_x3qcUnhnCn-WrAurvgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFxkdAr5C7ggZ+WdvDbsfmwuXujT_z_x3qcUnhnCn-WrAurvgA@mail.gmail.com>
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

On Wed, Mar 29, 2023 at 10:55:37AM -0500, Justin Forbes wrote:
> On Sat, Mar 25, 2023 at 1:09 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > It is not a good idea to change fundamental parameters of core memory
> > management. Having predefined ranges suggests that the values within
> > those ranges are sensible, but one has to *really* understand
> > implications of changing MAX_ORDER before actually amending it and
> > ranges don't help here.
> >
> > Drop ranges in definition of ARCH_FORCE_MAX_ORDER and make its prompt
> > visible only if EXPERT=y
> 
> I do not like suddenly hiding this behind EXPERT for a couple of
> reasons.  Most importantly, it will silently change the config for
> users building with an old kernel config.  If a user has for instance
> "13" set and building with 4K pages, as is the current configuration
> for Fedora and RHEL aarch64 builds, an oldconfig build will now set it
> to 10 with no indication that it is doing so.  And while I think that
> 10 is a fine default for many aarch64 users, there are valid reasons
> for choosing other values. Putting this behind expert makes it much
> less obvious that this is an option.

That's the idea of EXPERT, no?

This option was intended to allow allocation of huge pages for
architectures that had PMD_ORDER > MAX_ORDER and not to allow user to
select size of maximal physically contiguous allocation.

Changes to MAX_ORDER fundamentally change the behaviour of core mm and
unless users *really* know what they are doing there is no reason to choose
non-default values so hiding this option behind EXPERT seems totally
appropriate to me.
 
> Justin
> 
> > Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  arch/arm64/Kconfig | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index e60baf7859d1..7324032af859 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1487,11 +1487,9 @@ config XEN
> >  # 16K |       27          |      14      |       13        |         11         |
> >  # 64K |       29          |      16      |       13        |         13         |
> >  config ARCH_FORCE_MAX_ORDER
> > -       int "Maximum zone order" if ARM64_4K_PAGES || ARM64_16K_PAGES
> > +       int "Maximum zone order" if EXPERT && (ARM64_4K_PAGES || ARM64_16K_PAGES)
> >         default "13" if ARM64_64K_PAGES
> > -       range 11 13 if ARM64_16K_PAGES
> >         default "11" if ARM64_16K_PAGES
> > -       range 10 15 if ARM64_4K_PAGES
> >         default "10"
> >         help
> >           The kernel memory allocator divides physically contiguous memory
> > --
> > 2.35.1
> >
> >

-- 
Sincerely yours,
Mike.
