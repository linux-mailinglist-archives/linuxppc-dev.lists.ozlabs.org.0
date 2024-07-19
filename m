Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4AA93736C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 07:59:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YRFthwaJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQJsH0Sjbz3dRH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 15:59:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YRFthwaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQJrZ4Vkrz3cDd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 15:58:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7092FCE1AD5;
	Fri, 19 Jul 2024 05:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BCBC32782;
	Fri, 19 Jul 2024 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721368712;
	bh=UQznUIdoHoSsnmJ9kRgND1mWM0Wr77U9QEYTciDIo28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRFthwaJnqijAayKx7Nr5Wz+cg7XtkKFYmu9Y+J8JOSZNkKtcyO0oPxjnmHQb5MAT
	 +SzEDWjweXYNk8r/wQxrhgFgyaJzF2zS7ds36V+HfUkLd39/F0Jm+9Xel/QgVHiXrN
	 u8dtVDBEcxTLfuJ09zphSq9TFj0SodZS5yh/iSTnCqMAmk0l0hgKZ81y9JEQyQLhxw
	 sglzaaOKdzC/1FVu4YR8/PhMdvuoqPLRhEF6pZyxCI7bcLrHj8JLnnhhcpRX6xDDkZ
	 xqyY0lHVXYowiKXrRiLwZxIMlHLP+cfRIEOh0c7+hIF8r+/xRAu73hBTRRXaUjI764
	 7OCKjCrNEM7Gw==
Date: Fri, 19 Jul 2024 08:55:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 13/17] mm: move numa_distance and related code from x86
 to numa_memblks
Message-ID: <Zpn_z_NgzTl_db5t@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-14-rppt@kernel.org>
 <8b402e92-d874-4b30-9108-f521bd20d36c@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b402e92-d874-4b30-9108-f521bd20d36c@sifive.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2024 at 04:46:17PM -0500, Samuel Holland wrote:
> On 2024-07-16 6:13 AM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Move code dealing with numa_distance array from arch/x86 to
> > mm/numa_memblks.c
> > 
> > This code will be later reused by arch_numa.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/mm/numa.c                   | 101 ---------------------------
> >  arch/x86/mm/numa_internal.h          |   2 -
> >  include/linux/numa_memblks.h         |   4 ++
> >  {arch/x86/mm => mm}/numa_emulation.c |   0
> >  mm/numa_memblks.c                    | 101 +++++++++++++++++++++++++++
> >  5 files changed, 105 insertions(+), 103 deletions(-)
> >  rename {arch/x86/mm => mm}/numa_emulation.c (100%)
> 
> The numa_emulation.c rename looks like it should be part of the next commit, not
> this one.

Right, thanks!

-- 
Sincerely yours,
Mike.
