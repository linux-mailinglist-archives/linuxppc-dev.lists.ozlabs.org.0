Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B793814B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 14:29:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KXNTwVKG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WR5Sc2K6yz3cZn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 22:29:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KXNTwVKG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WR5Rw41Wvz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 22:28:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EDFC9CE01C5;
	Sat, 20 Jul 2024 12:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F9FC2BD10;
	Sat, 20 Jul 2024 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721478503;
	bh=/mmf7KEQ2fPqMset/cgfJzrTW1VPxx9MyxonZ+AyPQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXNTwVKG4a4xYLw48OLtatEkRdqIGu8Mf+G1aUXiTTPTpT78IYUQ1/wzw0qcFGQoR
	 EepLZpsfpjbXKbh/xfZLM3pDZgCx3YVNfQ8PYWZH73ncdrVoIJ9MY6uDPyRIVyQIRs
	 +mD0V5quwhKhuRIUn7YWWcUOTpwaW7OpiJS6ob2EzbfT+pcMNhHQp3Wq1wCk5+tueN
	 cPKdYI9XDCq7cwRj9VCCE2OjNxFU7Ln9GS8efdMPhwguntvnlAzgrDRV9PZkgruXop
	 kgltilDaq6nb/4rY0NbgAzNLz0ekUP2swIpCx5HMEf1sL/wDuc2020z2LPpHNdvHa/
	 VhAS6LNc+rmag==
Date: Sat, 20 Jul 2024 15:25:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 13/17] mm: move numa_distance and related code from x86
 to numa_memblks
Message-ID: <Zpusq94oFVrygufA@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-14-rppt@kernel.org>
 <20240719184842.000030bc@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719184842.000030bc@Huawei.com>
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

On Fri, Jul 19, 2024 at 06:48:42PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:42 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Move code dealing with numa_distance array from arch/x86 to
> > mm/numa_memblks.c
> 
> It's not really numa memblock related. Is this the best place
> to put it?

There is a dependency of numa_alloc_distance() on
numa_nodemask_from_meminfo() that relies on numa_memblk but I agree that
they are not really related.

However, I'd prefer to keep this code in mm/numa_memblks.c because
node_distance() definitions and related code are different between
architecures and having this code outside numa_memblks in e.g
mm/numa.c would be way more involved.
 
> > This code will be later reused by arch_numa.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 

-- 
Sincerely yours,
Mike.
