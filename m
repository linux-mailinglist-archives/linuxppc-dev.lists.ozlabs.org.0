Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3526FFF5D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 05:39:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHZJ24wkbz3fZ5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 13:39:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U4rplEw0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U4rplEw0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHZHB38mDz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 13:38:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A6A964D9A;
	Fri, 12 May 2023 03:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A0DC433EF;
	Fri, 12 May 2023 03:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683862707;
	bh=Q7pZ6HkRh3PVDzBCV74mB+fwpBcm2L4Wrr7Gj6KO6ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4rplEw0qMOGxowZ1loQ7IR10mVPR+gkIHrN9H2/CYQigVdydLPavay7G++a7nk75
	 jDhpGXpsFo8grDqyj+dAD0bRHJYnhZ3zC9JzvBPFC3B2RpUt1tYfAWrn3pIHyEvUc0
	 m+plA03PmuYT+NcYOD6DwNQyNX3nG8GNV7/Tz7bjzisl+mJN6FAg46r36holy/6HO4
	 6GEsQAkOKAoidlLLVYOcRtmzSHojiofTEI1BfDjbKkAJM3vujpQ7oWR4AovPMspdwk
	 AfdZmFHnb8dcLpWYTKW3v5BTK8ry629pZRiCq4rIBS69MISbPUUJXyByuj5gGgwTNw
	 bDNRPX9IyrHYA==
Date: Thu, 11 May 2023 20:38:24 -0700
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
Message-ID: <20230512033824.GF4135@kernel.org>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <ZFs0k2rrLPH9A/UU@casper.infradead.org>
 <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com>
 <ZFz1j1slZHCQmwMJ@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFz1j1slZHCQmwMJ@casper.infradead.org>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-ke
 rnel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, May 11, 2023 at 03:02:55PM +0100, Matthew Wilcox wrote:
> On Wed, May 10, 2023 at 09:35:44PM -0700, Hugh Dickins wrote:
> > On Wed, 10 May 2023, Matthew Wilcox wrote:
> > 
> > I don't really understand why you're going down a remove-CONFIG_HIGHPTE
> > route: I thought you were motivated by the awkardness of kmap on large
> > folios; but I don't see how removing HIGHPTE helps with that at all
> > (unless you have a "large page tables" effort in mind, but I doubt it).
> 
> Quite right, my primary concern is filesystem metadata; primarily
> directories as I don't think anybody has ever supported symlinks or
> superblocks larger than 4kB.
> 
> I was thinking that removing CONFIG_HIGHPTE might simplify the page
> fault handling path a little, but now I've looked at it some more, and
> I'm not sure there's any simplification to be had.  It should probably
> use kmap_local instead of kmap_atomic(), though.
 
Removing CONFIG_HIGHPTE will drop several lines and will allow to get rid
of custom __pte_alloc_one on x86.

--
Sincerely yours,
Mike.
