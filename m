Return-Path: <linuxppc-dev+bounces-6912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C62A5D226
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 23:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC73v3VPQz3bmJ;
	Wed, 12 Mar 2025 09:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741730427;
	cv=none; b=DwiXz6Jhs6ffAGztarF06YZ4vKdGUpOgIp2CEMMP2SjZ6kOq+dg5dAykbvudGrJBGwddS7xB4twU+ZqAD4ntp+7EVE/VuFrrWYBmT5E/56UWr1eKXWOmAgT+sKbmqMJhorNwngpvH5pq2FHJB+QQWZuQMJzJYT4pvrnN7Tbs8lIcmxVSwnIuQyt8JU6NGsATPs93+IKzJ/Pot5J9tyWetd2fC0OJFRawmyUfRzLvQUX4pfCSkCGZlL0f5iO6ANjQkMmNVkYIdM9YT6m+4udzkQIl3MJWkyJM0ilC1fZiN3cnJmHCAy+G3Zpo7njQfs1fKkWu0Zb8GCycZksIC6Y9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741730427; c=relaxed/relaxed;
	bh=LWqJoM88kHGjOcIG7y4jtQUycMU0Xkkz6/jQHA0YJWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9eOKyVYp+4v1KlzcTbbeeDpeYE1PhOkfzea+eI7UPCEDv6IXIgAJexIc4G6/GxJ1IagOjnxyRMROoXSbeWtb5Sg0g3aNFBsDDh8L9K74xftIeZIx0eqcT2eYpBa8jW9DYm0K3M2YcBjP9YyvM9g+HBF0fqHWxYY0RdshmrTvpuy9DWINuKQpdOLwsxPZzK+CkBkYOwoebDjozbrOR33DDPKvT97xcJJA+roF0Br6QBq1QYdr/6uN2MD5umjXspEWeD7A6jCM1KzsRHpBOvmlpAD5AxXlE6+DoXrhXWl4XtWArm3e2lu+otjVSPKLlo+0gME8WnCmyD0fnzMNa7Ahg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=F1O49Jcd; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=F1O49Jcd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZC73t06Ykz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 09:00:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LWqJoM88kHGjOcIG7y4jtQUycMU0Xkkz6/jQHA0YJWI=; b=F1O49JcdrryD+c7bjEti6SJD0k
	5m7yB4f0mnO5oz3PWpTGFZeEDOz6jtfbEDUSGHdJuMJUdyyJrvc8w+axXtk6TDmTIIbFbkuO1ydxZ
	ZkUVQwkCQYx3t/GvJXd0N89ERqlBZ1oyV/qsqt5n8bhxYILHdPBMEdtZh+E3rV1O6LTEgz6NY19dX
	uMkm10gBWDJvLQbGsJ+OV21R+sYmoK2kOuMEJxHVPH/5fNpWBs+wMK5IxvFr7yXp1/8ISm8hB2ZeX
	FrHvjmC4OQ8J8YC0afIQJre6b+7hqinDLiAbLbux5CbnHbe0gdh4CpCr9WT+96+4aXVFDLO7rTs/o
	DeeyVT7w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55314)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ts7dT-0004fB-2A;
	Tue, 11 Mar 2025 21:59:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ts7dN-0003qv-0O;
	Tue, 11 Mar 2025 21:59:33 +0000
Date: Tue, 11 Mar 2025 21:59:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 10/13] arch, mm: set high_memory in free_area_init()
Message-ID: <Z9CyRHewqfZlmgIo@shell.armlinux.org.uk>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 05:51:06PM +0000, Mark Brown wrote:
> On Thu, Mar 06, 2025 at 08:51:20PM +0200, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > high_memory defines upper bound on the directly mapped memory.
> > This bound is defined by the beginning of ZONE_HIGHMEM when a system has
> > high memory and by the end of memory otherwise.
> > 
> > All this is known to generic memory management initialization code that
> > can set high_memory while initializing core mm structures.
> > 
> > Remove per-architecture calculation of high_memory and add a generic
> > version to free_area_init().
> 
> This patch appears to be causing breakage on a number of 32 bit arm
> platforms, including qemu's virt-2.11,gic-version=3.  Affected platforms
> die on boot with no output, a bisect with qemu points at this commit and
> those for physical platforms appear to be converging on the same place.

I'm not convinced that the old and the new code is doing the same
thing.

The new code:

+       phys_addr_t highmem = memblock_end_of_DRAM();
+
+#ifdef CONFIG_HIGHMEM
+       unsigned long pfn = arch_zone_lowest_possible_pfn[ZONE_HIGHMEM];
+
+       if (arch_has_descending_max_zone_pfns() || highmem > PFN_PHYS(pfn))
+               highmem = PFN_PHYS(pfn);
+#endif
+
+       high_memory = phys_to_virt(highmem - 1) + 1;

First, when CONFIG_HIGHMEM is disabled, this code assumes that the last
byte of DRAM declared to memblock is the highmem limit. This _could_
overflow phys_to_virt() and lead to an invalid value for high_memory.

Second, arch_zone_lowest_possible_pfn[ZONE_HIGHMEM] is the _start_ of
highmem. This is not what arch code sets high_memory to - because
the start of highmem may not contiguously follow on from lowmem.

In arch/arm/mm/mmu.c, lowmem_limit is computed to be the highest + 1
physical address that lowmem can possibly be, taking into account the
amount of vmalloc memory that is required. This is used to set
high_memory.

We also limit the amount of usable RAM via memblock_set_current_limit()
which memblock_end_of_DRAM() doesn't respect.

I don't think the proposed generic version is suitable for 32-bit arm.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

