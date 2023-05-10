Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 531946FD68B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 08:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGPkH1Jqbz3fMF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 16:09:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GqtBVAri;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GqtBVAri;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGPjM2LGpz3cjD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 16:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/B3tOo2DcdV+TWomt1rdQnWS8nj/GpV0fFl476JBaqo=; b=GqtBVAriUhmAJ9gyQunowN/4FI
	IKPnDz7LbDDzd0Fgb9Z22xH9B0GothgTazfupCK9odsy8jdQ7d5rjIU0buEMmJgHPsqbRmD3rjRlS
	pe9WkgZOQJjVVUr2Nn9sQ+jGwW9hZdqgIKJXJ8Sf5r1YY8KiJJck+y51d1I4lWN/uji1Mhux3PR9z
	4FQGYDQlCPyDgWt1HB2pIN4QBP8zK1HHd8c8SPjYOnj4IT/rnTHO2Gch9hA825q32K7voVZkZwShj
	4YKfoYDVbZy6WQjNBqGFIRoL8UF3dgWpYlgtRh3uLSK2Af3sbYZbz1g5vy/PAMZKbCX9yrTkl5Mjy
	NzylU7Eg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwcyp-00FzBu-D0; Wed, 10 May 2023 06:07:15 +0000
Date: Wed, 10 May 2023 07:07:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
Message-ID: <ZFs0k2rrLPH9A/UU@casper.infradead.org>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <ts
 bogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 09, 2023 at 09:39:13PM -0700, Hugh Dickins wrote:
> Two: pte_offset_map() will need to do an rcu_read_lock(), with the
> corresponding rcu_read_unlock() in pte_unmap().  But most architectures
> never supported CONFIG_HIGHPTE, so some don't always call pte_unmap()
> after pte_offset_map(), or have used userspace pte_offset_map() where
> pte_offset_kernel() is more correct.  No problem in the current tree,
> but a problem once an rcu_read_unlock() will be needed to keep balance.

Hi Hugh,

I shall have to spend some time looking at these patches, but at LSFMM
just a few hours ago, I proposed and nobody objected to removing
CONFIG_HIGHPTE.  I don't intend to take action on that consensus
immediately, so I can certainly wait until your patches are applied, but
if this information simplifies what you're doing, feel free to act on it.
