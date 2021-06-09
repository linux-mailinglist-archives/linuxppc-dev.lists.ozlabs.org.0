Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E393A0CBF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 08:52:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0HqM72M4z30JY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 16:52:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R3Ua7SSr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R3Ua7SSr; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0Hpx241Wz2yx9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 16:52:25 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F40D661249;
 Wed,  9 Jun 2021 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623221541;
 bh=1NOcR9X1qrsVWC8pZ+WOBsJYlerWmKCJZFjAHZSyi1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R3Ua7SSrAmPcigjQENQSeeEMj920XMPbd0mRAH+B4DHPNXP+taIOYwYUWcVIXb5j6
 VJBySmzsOYZnbE6P4kMoE9ZvUpFBLiddGWhEYtU+E0KEUzEdWHkJqeLVtgBH6jO4C9
 Pe9x2UVR5RoSXUB4d6262LpkrrGlAOAE5RSKB4ZbL931VU3fcHDPQIgBFXazdDNmx0
 KYGm7I3vStPQPXah/NfmgtdSVOkJw8ewGPxvh3kYk2hvG8vZe26iLuJ3PqURc/rI07
 p6tkwWjdfIcQ6IB7Wn8wiS2wG0e2oDGZCpnQAvL+zgWVSStPrtFhj2bz5Vv7w2pP3G
 OCNYfrxKsGSKw==
Date: Wed, 9 Jun 2021 09:52:08 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 8/9] mm: replace CONFIG_NEED_MULTIPLE_NODES with
 CONFIG_NUMA
Message-ID: <YMBlGBxaWDPV1ouT@kernel.org>
References: <20210608091316.3622-1-rppt@kernel.org>
 <20210608091316.3622-9-rppt@kernel.org>
 <20210608172544.d9bf17549565d866fbb18451@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608172544.d9bf17549565d866fbb18451@linux-foundation.org>
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
Cc: linux-m68k@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 05:25:44PM -0700, Andrew Morton wrote:
> On Tue,  8 Jun 2021 12:13:15 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > After removal of DISCINTIGMEM the NEED_MULTIPLE_NODES and NUMA
> > configuration options are equivalent.
> > 
> > Drop CONFIG_NEED_MULTIPLE_NODES and use CONFIG_NUMA instead.
> > 
> > Done with
> > 
> > 	$ sed -i 's/CONFIG_NEED_MULTIPLE_NODES/CONFIG_NUMA/' \
> > 		$(git grep -wl CONFIG_NEED_MULTIPLE_NODES)
> > 	$ sed -i 's/NEED_MULTIPLE_NODES/NUMA/' \
> > 		$(git grep -wl NEED_MULTIPLE_NODES)
> > 
> > with manual tweaks afterwards.
> > 
> > ...
> >
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -987,7 +987,7 @@ extern int movable_zone;
> >  #ifdef CONFIG_HIGHMEM
> >  static inline int zone_movable_is_highmem(void)
> >  {
> > -#ifdef CONFIG_NEED_MULTIPLE_NODES
> > +#ifdef CONFIG_NUMA
> >  	return movable_zone == ZONE_HIGHMEM;
> >  #else
> >  	return (ZONE_MOVABLE - 1) == ZONE_HIGHMEM;
> 
> I dropped this hunk - your "mm/mmzone.h: simplify is_highmem_idx()"
> removed zone_movable_is_highmem().  

Ah, right.
Thanks!

-- 
Sincerely yours,
Mike.
