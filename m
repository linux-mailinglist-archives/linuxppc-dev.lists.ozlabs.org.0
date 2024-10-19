Return-Path: <linuxppc-dev+bounces-2427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9679A517E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2024 00:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWGrp4qvpz2yMv;
	Sun, 20 Oct 2024 09:46:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729377978;
	cv=none; b=RxdoLJiXEWvp8nR00axwQq1oAaSMUc/TIo2Xj3cPfQl2O89apUAuLdbS6V0oJrsaMk1LHIQ/Qt6TU+HF++frCeU9PX5HU5DUWBXzIAwxefG14ZggzUFJbg8NuShspUZE4FOWo8Z5+GYqBtyVPXCGM32ZcBJmx1DDc4B5tZThpynr0l9Su9uA9Q/XDplkA8V6VarDz+OyDeZ8Un7dBq56PMznVAx6GAhqoaWlScGhIk0KSfUZb9YsHXl6d1TNbrlvzCbZQDqjTNsh7Zy1IW/vPWEzJg1JNNPqYweUUGbBIqSK4zwFAV2poRUo7DXkDu+hcDB48S38mZopSD9Q/yI9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729377978; c=relaxed/relaxed;
	bh=iHZrlvphzEK5suDumbASFk80vJ39P3mMNbLKT/LkPU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nikJYyPfjw1OBXZLOowUtW2rYdI3FwctX2fXMfgymkGjfnfqxxRGozuf/DOJc+QHBcZk3NpFUbBCj4a73/Bi43FOckyiBKvzmbswSFu/yHr0cH7248JY0yqVJBsQbpBmMR/uYGtWMx1iy+hPHH/Lgzg+tXlVJVtFoZZhcGSXJYXnntH93DZRKlCPfBTMqN+ISO3BtlI6nHRHV4sRj5cn8raio1yFJ7oE62H3EaDW6G0dVZvzr0Cbu40NCi9cegFmYv75SfrR/TrIe0GUk1rn8wmVraz3NV2jpoDhNztvIl6E2njlrKR2p+kfVbAKQ4RQ0uTDCM0mciH22eCuAkJ0Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=raBET/eq; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=raBET/eq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWGrn3pyyz2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 09:46:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF9575C5444;
	Sat, 19 Oct 2024 22:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A187C4CEC5;
	Sat, 19 Oct 2024 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729377972;
	bh=cD5eaMzUFo7t+XYDnFM25WIUwCFcdwXaz1SfpP4a6SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raBET/eqnMHymvQ7ghoiJNJzhJfHKuWETI4KcodqrLn6OQ/Y9CKtRyA2t4EAlqgdL
	 hZ8GXfGOFi/KBP9oOEyOznfd0G9uHgQFOCCAyoXDyjtw5nXygFTG2CrK0T0RFUBMS3
	 dw6lBjU8rrQg3O+nhowKfheReV2QdNr7rWdr90u1jL/xItyfqX/Q3Me8KZXxc+SLgs
	 Bgsl1ciX2BowyzgKq/taZpeBj4IacVWutv5wVHimbHiaNsgZE0UEMAbBKocO0BFYoV
	 nD2awtEWshprtgJwrLo1F7dN4Asn2HkQ91l7gW0Dv7NafPgx9Qm2IawXuSLgLc1IAt
	 hvIMZRfR3Mm9A==
Date: Sat, 19 Oct 2024 15:46:09 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 7/8] execmem: add support for cache of large ROX pages
Message-ID: <ZxQ2saulzeSkUsEh@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-8-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-8-rppt@kernel.org>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:23PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Using large pages to map text areas reduces iTLB pressure and improves
> performance.
> 
> Extend execmem_alloc() with an ability to use huge pages with ROX
> permissions as a cache for smaller allocations.
> 
> To populate the cache, a writable large page is allocated from vmalloc with
> VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> ROX.
> 
> The direct map alias of that large page is exculded from the direct map.
> 
> Portions of that large page are handed out to execmem_alloc() callers
> without any changes to the permissions.
> 
> When the memory is freed with execmem_free() it is invalidated again so
> that it won't contain stale instructions.
> 
> An architecture has to implement execmem_fill_trapping_insns() callback
> and select ARCH_HAS_EXECMEM_ROX configuration option to be able to use
> the ROX cache.
> 
> The cache is enabled on per-range basis when an architecture sets
> EXECMEM_ROX_CACHE flag in definition of an execmem_range.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

