Return-Path: <linuxppc-dev+bounces-2086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA499992B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 03:23:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPpmV0WlCz3bx0;
	Fri, 11 Oct 2024 12:23:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=136.144.140.114
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728585829;
	cv=none; b=HgHOkkdqRGyPJf/W6zY3kxiEZ9e0toGvQPVT+sPv6VRRd4atJzKlbpp52qqsOC6cfkEtv5kvLpqTWg+mdUd/BAAA8+x8AMc6GyvkmP5Pk/zijGlkXOBS7qCF2WRfsAbUHi9zyXU9iGhl4vJPO4gRA5z1KmANEb2WA8kp1dtb8/+GbWeTq28aET0M4hMBLonEda7isP5TA5ZE90gFjern0t1fTqDIHL4eMNSxvvQherWlQEv5MuF9s2s9T4PO2adofJvLW264v1yu96O51t2L2fL5ii+ot75y+NIu8cmp1+NcERaydw/Ifrhp3/8tF7m5QsxglIplUmriB5daujTyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728585829; c=relaxed/relaxed;
	bh=I0EZ6HkQ9I7eF0DetXqDrQTnXavDC1PLwU47uVpLkD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ExaCz2MhayiImJ+oSDR0KsBk9Pa8KaXX+5v+nx3mwXfiZ2LR57rycYkFF+iBSy8di+BzuQGx2OcEYg5LqkR0yCmIhDr5WlBTtqewR8hxQC/Ej4E8JLqrW1iDFKG4O/TnlVsWrmdgWrV1SeYSv+EuZKnGK6NNiEQB/TogGUKI7m16FrsHRZQbckzs0IG8GutqG8S/8Q0rn/A3Qc9oEIxlbmCB/nQj4VvmHIcz8xiK1sRmfs2acHF3/7G3+c29UVhWak3UlZzxkYBSIl7ZJl+mP2QkmdAeVEHVs2ZXoHNlOzUEb4Syr6pULYFxD47MTmy/VQCyNCEbheffznwshnSfXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; dkim=pass (4096-bit key; secure) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.a=rsa-sha256 header.s=key header.b=TnwSfC3B; dkim-atps=neutral; spf=pass (client-ip=136.144.140.114; helo=bout3.ijzerbout.nl; envelope-from=kees@ijzerbout.nl; receiver=lists.ozlabs.org) smtp.mailfrom=ijzerbout.nl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; secure) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.a=rsa-sha256 header.s=key header.b=TnwSfC3B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ijzerbout.nl (client-ip=136.144.140.114; helo=bout3.ijzerbout.nl; envelope-from=kees@ijzerbout.nl; receiver=lists.ozlabs.org)
X-Greylist: delayed 471 seconds by postgrey-1.37 at boromir; Fri, 11 Oct 2024 05:43:46 AEDT
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdv66mmMz3btR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:43:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1728585350; bh=eO8i66PrBt/aJfIHr67M2yWYkbNNStHt47cJJCQ8lLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TnwSfC3B0BzzbrbBXfYCTvLzIQE1VFcC2vDoODjZOiRbhCpvxs+nfBrgLRAmHbBcp
	 5nDkTl4JQCQ0Wy/pLIF9/vFfww5UJ7PllGdlDfCRY4FgF60cuMAONiSY28SXpZ/fah
	 ofsTg0sJAj3lUJpCxa6onaZfbwwGyEE3F+sIl/MzmrdHNasu+qZYD2CQrQKKnIrTre
	 jEGUntoI51WphR4XjRXlRX68PsX4ZEqW4Lig8ApC7stf8X5g23ZhKSrvK2T2Yg2D5A
	 bDv/1YoYnX+4WK7gSe7xgNsbMfMhOH2hPirF455+QlQzq1JgcpZmps0ommzymfrvIp
	 q2yGRxotng1Sc5OlnXZIYfIyoPLe78QPg5yomWhS/7EpKy8gm5XCv2fZL2X1/G4BTR
	 HL2kBhQM874WRNw9Pe4sCOauh/y6zMseb5uFaaTGvb5Bwf1+uMfTKAYUXYiqB6xWHZ
	 FMRiB8gbs1uwwHzedLTctQNTtkBO6P4IZltp+SoRTwdUBuk2Am+I+Y/c5xNGGQwcTo
	 dfQXGkuiHFMt18pGbziRX9AoIhYRkcXuQB6IdBahXiHe06KoZakmU5fKhn5ggdgeZF
	 sIwBjRHZR9oCPZjKzUyfzG6lTzteD6iFNQ1wWMF1seN66YAyRB45H5n//oQ2UNHpBx
	 anTYx1ofeL2gjEtOuPaxF2ZM=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id DF155167DD7;
	Thu, 10 Oct 2024 20:35:47 +0200 (CEST)
Message-ID: <936057f4-e461-4977-85e7-6100127c9574@ijzerbout.nl>
Date: Thu, 10 Oct 2024 20:35:44 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>,
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
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241009180816.83591-8-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Op 09-10-2024 om 20:08 schreef Mike Rapoport:
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
> Portions of that large page are handed out to execmem_alloc() callers
> without any changes to the permissions.
>
> When the memory is freed with execmem_free() it is invalidated again so
> that it won't contain stale instructions.
>
> The cache is enabled when an architecture sets EXECMEM_ROX_CACHE flag in
> definition of an execmem_range.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   include/linux/execmem.h |   2 +
>   mm/execmem.c            | 317 +++++++++++++++++++++++++++++++++++++++-
>   mm/internal.h           |   1 +
>   mm/vmalloc.c            |   5 +
>   4 files changed, 320 insertions(+), 5 deletions(-)
> [...]
> +static void execmem_cache_clean(struct work_struct *work)
> +{
> +	struct maple_tree *free_areas = &execmem_cache.free_areas;
> +	struct mutex *mutex = &execmem_cache.mutex;
> +	MA_STATE(mas, free_areas, 0, ULONG_MAX);
> +	void *area;
> +
> +	mutex_lock(mutex);
> +	mas_for_each(&mas, area, ULONG_MAX) {
> +		size_t size;
> +
No need to check for !area, because it is already guaranteed by the 
while loop condition (mas_for_each)
> +		if (!area)
> +			continue;
> +
> +		size = mas_range_len(&mas);
> +
> +		if (IS_ALIGNED(size, PMD_SIZE) &&
> +		    IS_ALIGNED(mas.index, PMD_SIZE)) {
> +			struct vm_struct *vm = find_vm_area(area);
> +
> +			execmem_set_direct_map_valid(vm, true);
> +			mas_store_gfp(&mas, NULL, GFP_KERNEL);
> +			vfree(area);
> +		}
> +	}
> +	mutex_unlock(mutex);
> +}
>

