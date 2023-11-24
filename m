Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1887F6A08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 02:08:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aLUR6BoF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbxg544fkz3dSV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 12:08:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aLUR6BoF;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbxfG3GhBz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 12:07:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700788038;
	bh=2xxxAalZ73cRwdZRWpl45yBEiTMvShJqt0Ovd9kac2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aLUR6BoFlBYtiJSS1etIcfjzdaRpP7n06oAX400JbB3OP61oS/wOD/3jq4bPjiHo7
	 3wV4SPvTP17Yymwb3AVOw5cxJL3maWt8kTqxiWD0fQM4wcqqDzYWLfxL3K9rkKAnFf
	 ojmOBd5/ZElekPwIA7twndtJZFq7XZH8nRc4O9ntZ4Cxpv3JrqzErLQo5ugIGxzrhe
	 AnO4HeawO2liLqIkV6zztDc+3tAcLf8juI796b7ZvbBbqqPK25FTyG884GBMkPQKCQ
	 LJw3I9E1ued7g3z1a+HLCZCJix/By7U4i3qv7cRtce+cFZDtLBozzgMFENOcehn3bS
	 8PA1SWmy4fqQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbxfF0fnlz4wd2;
	Fri, 24 Nov 2023 12:07:17 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Xu <peterx@redhat.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
In-Reply-To: <ZV4co7wcI-_wK91F@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org> <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org> <ZV4co7wcI-_wK91F@x1n>
Date: Fri, 24 Nov 2023 12:06:24 +1100
Message-ID: <87y1eoq7sf.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A .
 Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Xu <peterx@redhat.com> writes:
> On Wed, Nov 22, 2023 at 12:00:24AM -0800, Christoph Hellwig wrote:
>> On Tue, Nov 21, 2023 at 10:59:35AM -0500, Peter Xu wrote:
...
>> 
>> If dropping the check is the right thing for now (and I think the ppc
>> maintainers and willy as the large folio guy might have a more useful
>> opinions than I do), leaving a comment in would be very useful.
>
> Willy is in the loop, and I just notice I didn't really copy ppc list, even
> I planned to..  I am adding the list (linuxppc-dev@lists.ozlabs.org) into
> this reply.  I'll remember to do so as long as there's a new version.

Thanks.

> The other reason I feel like hugepd may or may not be further developed for
> new features like large folio is that I saw Power9 started to shift to
> radix pgtables, and afaics hugepd is only supported in hash tables
> (hugepd_ok()).

Because it's powerpc it's not quite that simple :}

Power9 uses the Radix MMU by default, but the hash page table MMU is
still supported.

However although hugepd is used with the hash page table MMU, that's
only when PAGE_SIZE=4K. These days none of the major distros build with
4K pages.

But some of the non-server CPU platforms also use hugepd. 32-bit 8xx
does, which is actively maintained by Christophe.

And I believe Freescale e6500 can use it, but that is basically
orphaned, and although I boot test it I don't run any hugetlb tests.
(I guess I should do that).

cheers
