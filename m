Return-Path: <linuxppc-dev+bounces-14513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCDDC8CCA8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 05:10:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dH2yw3bQZz2yvV;
	Thu, 27 Nov 2025 15:10:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764216632;
	cv=none; b=nUSFV0l4N27GFRBHJ9qMsi5xWvv5rYpA9BC+BjZpQ26S6JsVl/yLsbWnzYPMGeTQXCFEet0lNkekeBES6hUPaouxDe9EEWmulhENywOESZjr236lotN9GQ8TlzUQst9VmB5HHyg6Pp89y+7BWGkMKJFOv783SlALjfD439Ar8Kes3Ol86V6ugPWP4RYXzUmbJX7/yIpVhZd8P6vhhvl/m7nHrIPEpyhZlf3gnY369wZrP9ks7yc0erLmjoytI9t2zFUv/r7ouCQ+Sur5URGAwZgqpVo4udHkWL1XWQwiqqmiyflkX0gstatlEyfUPr6DBo7+UH4jyi77vE36kpSqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764216632; c=relaxed/relaxed;
	bh=9UH5HZWU7w1Qz5ka8h7XjqhmojO13fL0L+YMlTFhSDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5HOfWnQZX4TBDnGGHt2ItSAo9SHGGscJ+j853lZ1ztaM5fFzYzgZ98bkoFXPfhQmEvqCZemqsWXS32l6oh21J6EXMzuTjbHE42zVOb4N1KkGGmqTjIdv1uxhFTLElErf3Q+ojjLdJDG/1pO+l/xMj0puD/rDvGXBdQX9OtwOFggljrQ2RrBWb4OoPhTsxjbf8P0j2HkQ46j/AsfgXIXu2xzaKpNqqp1QmgHr8fCv46vFOHb2KOyOaAsnOBhNJPz+p5XBk9RzsFa81U35NpXj/bHlHkR1Jl46d/aNZ2pVf3vmuhw3TrrM4PXiiL7ggsXRgfXiOj6XXfZdvjJ4PQaqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=AP3I5dIw; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=AP3I5dIw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dH2yq20klz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 15:10:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9UH5HZWU7w1Qz5ka8h7XjqhmojO13fL0L+YMlTFhSDA=; b=AP3I5dIw8MUlt7xSzk3qgcc3sN
	AHu26Cs0wtwdgwSRwY+BmvEPRpHfoPjKAv6EqeaGAtEZ8MvH02yG8ScNHL7P49Rb/gM+u6ij5a6XG
	jy4hg3/q6KDo+jTVMSPbxO9fXKm9iGjW+uF8fMcq7GPSByWP3cICDpktaeP3bee4XCg1AvMMv/Moj
	YSEuEpY6zqKoGrYyt7uU+flpdycrYQcResJLx8oQU2IoaQaPpPfiBo/O1co/fExGrf5J1lFda0oK/
	nNuM2+NAvUP42wEG8HkfVsWnCKASM8uniovBmROKgYy8568Nvncst6z24djS+35maVgZIA3CoAYDO
	v2Mud80A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTJl-0000000BB6Z-3S6J;
	Thu, 27 Nov 2025 04:09:17 +0000
Date: Thu, 27 Nov 2025 04:09:17 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	Barry Song <v-songbaohua@oppo.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Pedro Falcato <pfalcato@suse.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Oven Liyang <liyangouwen1@oppo.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Nam Cao <namcao@linutronix.de>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
Message-ID: <aSfO7fA-04SBtTug@casper.infradead.org>
References: <20251127011438.6918-1-21cnbao@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127011438.6918-1-21cnbao@gmail.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> There is no need to always fall back to mmap_lock if the per-VMA
> lock was released only to wait for pagecache or swapcache to
> become ready.

Something I've been wondering about is removing all the "drop the MM
locks while we wait for I/O" gunk.  It's a nice amount of code removed:

 include/linux/pagemap.h |  8 +---
 mm/filemap.c            | 98 ++++++++++++-------------------------------------
 mm/internal.h           | 21 -----------
 mm/memory.c             | 13 +------
 mm/shmem.c              |  6 ---
 5 files changed, 27 insertions(+), 119 deletions(-)

and I'm not sure we still need to do it with per-VMA locks.  What I
have here doesn't boot and I ran out of time to debug it.

