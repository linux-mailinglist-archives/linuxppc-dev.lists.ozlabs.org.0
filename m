Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA3672EC47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 21:49:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgfKJ6LhCz30gr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 05:49:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgfJm4mGkz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 05:49:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1A9862F35;
	Tue, 13 Jun 2023 19:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29E4C433D9;
	Tue, 13 Jun 2023 19:49:20 +0000 (UTC)
Date: Tue, 13 Jun 2023 20:49:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 0/3] Move the ARCH_DMA_MINALIGN definition to asm/cache.h
Message-ID: <ZIjIPquLFAeC2p0k@arm.com>
References: <20230613155245.1228274-1-catalin.marinas@arm.com>
 <5cc13519-e606-4dca-b22c-2dcb7bf06d32@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cc13519-e606-4dca-b22c-2dcb7bf06d32@csgroup.eu>
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
Cc: Michal Simek <monstr@monstr.eu>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13, 2023 at 04:42:40PM +0000, Christophe Leroy wrote:
> 
> 
> Le 13/06/2023 à 17:52, Catalin Marinas a écrit :
> > Hi,
> > 
> > The ARCH_KMALLOC_MINALIGN reduction series defines a generic
> > ARCH_DMA_MINALIGN in linux/cache.h:
> > 
> > https://lore.kernel.org/r/20230612153201.554742-2-catalin.marinas@arm.com/
> > 
> > Unfortunately, this causes a duplicate definition warning for
> > microblaze, powerpc (32-bit only) and sh as these architectures define
> > ARCH_DMA_MINALIGN in a different file than asm/cache.h. Move the macro
> > to asm/cache.h to avoid this issue and also bring them in line with the
> > other architectures.
> 
> What about mips ?
> 
> arch/mips/include/asm/mach-generic/kmalloc.h:#define ARCH_DMA_MINALIGN	128
> arch/mips/include/asm/mach-ip32/kmalloc.h:#define ARCH_DMA_MINALIGN	32
> arch/mips/include/asm/mach-ip32/kmalloc.h:#define ARCH_DMA_MINALIGN	128
> arch/mips/include/asm/mach-n64/kmalloc.h:#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
> arch/mips/include/asm/mach-tx49xx/kmalloc.h:#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES

Sorry, I should have mentioned it in the cover letter (discussed here -
https://lore.kernel.org/r/ZIhPaixb%2F0ve7zZo@arm.com/). These kmalloc.h
files are included in asm/cache.h, based on which machine is enabled, so
there's no problem for mips. It makes more sense to keep them in those
mach-*/kmalloc.h files instead of having lots of #ifdefs in cache.h.

-- 
Catalin
