Return-Path: <linuxppc-dev+bounces-15423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2FBD05CD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 20:19:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnF8s1wynz2yFk;
	Fri, 09 Jan 2026 06:19:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767899997;
	cv=none; b=kvdrxzY0LlCNLv+mywgEtNPY22C5FOdTd+K2u/G+BtkZV+aqW4VwuF+WLJqsTGEysY7AAWvX9mii6l6HMOf1MRQ7Bey3c8gbtia506kwqCIgQbjZb1hLAcU0gHwV5nNGryc5QST2CBUKfQkePsIqfFCV8ImnUrc8/Sf5tbAAq656/ZH/wV1Zlwhz3CZQXy/UBbcBxHvGu8xvZs5iDTmK8ydrT52RiRnDeMdTVe0MGDSyn4Gtkh+GTV42VICXfcIpy4BdMYLL9kWPc93wmxqRaMcmTNzT6vFHquJt46bB9YZ0kCXsxYCUdVbJqtTuy+G06MatzOentcVctuf9iWbAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767899997; c=relaxed/relaxed;
	bh=Tzrq+4BiaeS9zeQ5BXLg5bAaN9WKhQUuxGsqtXMKVv4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OKYYEzUU28xLgdSKiFePNXj/H4dXW+DovIGSaaTRkmX0fxzhO7JFBodo/DOgMov38r/Pw7lnbhiPQqRPIW9iTcB4MEPTYDlOlne+aUdrNIXKx7pYlTPN4HoIAyt7n8zQcAEdCKpavDNs+n90QT9JNbGt0UdthGm9pyXaNpzjYfGoPfPXYKfQEYtWYhaiew3LKtLMSDeGPBlswJ//XVPpzC2et7iw7Wq9frX0kRdZPK31m3+r8z+8wqE1mo6ko0Zy5kEFrxiS5I9I9lfPpuwaJvbtWpVUllia9uQpYej9jgLfsssG62YJkcrVOieH7iQz/4dUGGfYWtai+/VhUe5b1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CVumgl5u; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CVumgl5u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnF8p517Yz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 06:19:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD4D240732;
	Thu,  8 Jan 2026 19:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE9CC116C6;
	Thu,  8 Jan 2026 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767899961;
	bh=fSg1rFUc7Lj8obCBDIiOBzwmsy2PDWnpS6aiVKuno6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CVumgl5uYfQfaLqYgweLov8FT7OgO1ch7qHlwuZbONKicqb+bmGFoLIsYAxoWfRsr
	 6BxVTZH+QFJx2xSpWVk0NUrA2Ddxjwu2/Wcc1JG/gPIWft2fVjXp2CIt9nEHIpeVml
	 fnOoO4sO6q/7KPmJQudmyHeHcLC9E7nvlzSuO+ys=
Date: Thu, 8 Jan 2026 11:19:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Klara Modin <klarasmodin@gmail.com>, Alex Shi <alexs@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson
 <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain
 <bcain@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller"
 <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, David
 Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Heiko
 Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Johannes Berg
 <johannes@sipsolutions.net>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, Matt
 Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek
 <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador
 <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav
 <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Russell King
 <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Suren
 Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3.5] arm: make initialization of zero page independent
 of the memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate
 initialization of nodes, zones and memory map)
Message-Id: <20260108111919.ac5f811132672e760f47fbab@linux-foundation.org>
In-Reply-To: <aVpWpLV4Dut5Muo2@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
	<20260102070005.65328-23-rppt@kernel.org>
	<aVhN2NgQEKe0yzva@soda.int.kasm.eu>
	<aVll339wim7dCIaQ@kernel.org>
	<aVlwOyicOLPB9SOa@parmesan.int.kasm.eu>
	<aVpWpLV4Dut5Muo2@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 4 Jan 2026 14:01:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> Can you please stick this between patch 3 (arm: introduce
> arch_zone_limits_init()) and patch 4 (arm64: introduce
> arch_zone_limits_init())?

Did, thanks.  I made this a standalone patch rather than  a
squashable -fix.

> >From 35d016bbf5da7c08cc5c5547c85558fc50cb63aa Mon Sep 17 00:00:00 2001
> From: Klara Modin <klarasmodin@gmail.com>
> Date: Sat, 3 Jan 2026 20:40:09 +0200
> Subject: [PATCH] arm: make initialization of zero page independent of the
>  memory map
> 
> Unlike most architectures, arm keeps a struct page pointer to the
> empty_zero_page and to initialize it requires conversion of a virtual
> address to page which makes it necessary to have memory map initialized
> before creating the empty_zero_page.
> 
> Make empty_zero_page a stataic array in BSS to decouple it's
> initialization from the initialization of the memory map.
> 
> This also aligns arm with vast majorty of architectures.

Russell, can you please update us on your concerns with this change?

