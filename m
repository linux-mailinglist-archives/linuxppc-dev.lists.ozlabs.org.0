Return-Path: <linuxppc-dev+bounces-15077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57270CE5D9B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 04:21:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfhN11jnqz2xrL;
	Mon, 29 Dec 2025 14:21:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766978513;
	cv=none; b=UOomJ1XwlXp01ujQ5MBQ5QLXkCx9UtrPaethGacMfvawQ//oDFA8TOyr5Cts98lamB4Q7OThmLlCRPzz7Tum6oOMnXk1qGJ/IY3D8gG1gyKewVYhecmu3STnTPuAosnH3PFEN1ULyuYldlopkWVMf/B7QFdk219f+RuWBE76KtEUQEG/FpIq2qlvRlwfK1T+bHtwffPN7GH9mwhAFgoK06+4F+ji6V40XO6+mxp0QC3p0eb+rePxau+A+OzKdBg5XL1ALWHtEf/+ZMr3KJzy/seAwU6Kxz75Wnl4gCxUuT9b+/qxvDxJZRoRN0hdq39PZn5tuFIJ87M+NRd7c5b3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766978513; c=relaxed/relaxed;
	bh=23WFVh4QD8EwOyb+DiEjMorTSabGcCdF0HCkzTj5UcI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Fk0jU+GAiljIxyrmnO8UsFmR9J8WEMZG7h2EPBBb25c8QNSpGxoy6cJKYf4Ed8jtaKPODZgGcKFREnOfmD970yi8ckhBc/Igls5m3MJNBDCpmgT2j8EY1ZbOjXCqklYug01XKhmCPVfhtd3kM2O/xuCMPDVnNlUYAs5yHLyrpZCw9s3vNdw000v5CgT7aRHunVHzd81wKBKhmW2AlzQoB+0TgqG7QYhHUyD5F8O5/T7MX0LrpPNGdbBebcJw7pGqysB1WYfH6BF+I0L6VsWMyi5Pptb8P6leYX8aBhBuuKUjEBXyWEFKgi+Jr6Wwme+SkGyEUJ692qYT+J6NpgsYYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CsTctdZ8; dkim-atps=neutral; spf=pass (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CsTctdZ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 442 seconds by postgrey-1.37 at boromir; Mon, 29 Dec 2025 14:21:49 AEDT
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfhMx3pz6z2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 14:21:49 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766978065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23WFVh4QD8EwOyb+DiEjMorTSabGcCdF0HCkzTj5UcI=;
	b=CsTctdZ8U9pUZlVucTzftHHmp2gnI1r0CzZFlnpRDH9PaP1qXa4UPAYSva2HLine9CfV90
	9W72CV4/QFwNiVWLYQ5mHLAgZrQcKb5qzwdX5woVQVU6YQn8JsHteRlat/Z+Spad7CIWaS
	h++GDN5U6j2LdFzXpT0UvZYdzjPHOv4=
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH 28/28] Revert "mm/hugetlb: deal with multiple calls to
 hugetlb_bootmem_alloc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251228124001.3624742-29-rppt@kernel.org>
Date: Mon, 29 Dec 2025 11:13:26 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alex Shi <alexs@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>,
 Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>,
 Michal Simek <monstr@monstr.eu>,
 Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>,
 x86@kernel.org,
 linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C8C5C80F-BA99-445D-9711-2665B1262C66@linux.dev>
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-29-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On Dec 28, 2025, at 20:39, Mike Rapoport <rppt@kernel.org> wrote:
> 
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> hugetlb_bootmem_alloc() is called only once, no need to check if it was
> called aready at its entry.
> 
> Other checks performed during HVO initialization are also no longer
> necessary because sparse_init() that calls hugetlb_vmemmap_init_early()
> and hugetlb_vmemmap_init_late() is alaways called after
> hugetlb_bootmem_alloc().
> 
> This reverts commit d58b2498200724e4f8c12d71a5953da03c8c8bdf.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Nice cleanup.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.


