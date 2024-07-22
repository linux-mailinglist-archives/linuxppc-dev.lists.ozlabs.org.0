Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D6938AC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 10:09:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p25P0kST;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSCbZ2tQ6z3cY5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 18:08:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p25P0kST;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSCZt4RG7z3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 18:08:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3954FCE0AD0;
	Mon, 22 Jul 2024 08:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8487EC116B1;
	Mon, 22 Jul 2024 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721635700;
	bh=CyGkt9FKsE7t82Fz3Aja4aysBlda3M5p39yI7jGRxvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p25P0kSTbiVOylOIEqDsNzu3H4FIr1FoKh51p+DLef42bOBD/+IeI2/qDrEkJ+aUx
	 JOvOmKwgblc3PxoHZyePkukIsG2JOzUb1CtejWkJjsYEL+wE+xp+6wxEcuMsKupROE
	 CA9CX/rTisj9sF8GN70yjNgXp/rNyLGfErtqlsic85lbYH2IS8/mqV6aMVfUuSaXtH
	 topFnxcko1xfwmMPrFsEb8ponJJrkpshooXAGBp2O9P6TVcS4OTwIgmnR6Fyim1ny8
	 TO3+8cCWwXRhFKfLIEbl29aoxeQlMpLqB4pFhJuhOGKty/suok7RCzqd0dTMUm3oEi
	 9ce0/fUKEVZnQ==
Date: Mon, 22 Jul 2024 11:05:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 15/17] mm: make numa_memblks more self-contained
Message-ID: <Zp4StwFAIMu2LHjM@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-16-rppt@kernel.org>
 <20240719190712.00001307@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719190712.00001307@Huawei.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2024 at 07:07:12PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:44 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Introduce numa_memblks_init() and move some code around to avoid several
> > global variables in numa_memblks.
> 
> Hi Mike,
> 
> Adding the effectively always on memblock_force_top_down
> deserves a comment on why. I assume because you are going to do
> something with it later? 
> 
> There also seems to be more going on in here such as the change to
> get_pfn_range_for_nid()  Perhaps break this up so each
> change can have an explanation. 

I'll split this into several commits. 
 
-- 
Sincerely yours,
Mike.
