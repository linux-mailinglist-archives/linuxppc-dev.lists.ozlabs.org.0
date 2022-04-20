Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D041B508E19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 19:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kk6dV4tq6z3bc8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 03:11:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=qEFLX/t/;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Lz02F1m0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=qEFLX/t/; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Lz02F1m0; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kk6cn0B6sz2xBx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 03:10:32 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9598221107;
 Wed, 20 Apr 2022 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1650474628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fv+DUHDuv75iqi/speofL8fyyiV3PO12nkEaPGAjVpg=;
 b=qEFLX/t/h3r7OpqmNOmGOP8dA4rSO2sikq6ol1N77QIelrvEBFghQ7bcvovldgvJObmH6p
 66q5lRqmWi9t95sVzEwUZIP8Cr7uNETQRm4NEKf64zjhBKay2Q/2JBXNnuG2fhAbtkoWOO
 HtmZ7GIqs22vDe7hH9NqFNk4XWWgWUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1650474628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fv+DUHDuv75iqi/speofL8fyyiV3PO12nkEaPGAjVpg=;
 b=Lz02F1m0uYxMKVcER4wii/ZMq3u7/dEO9YPxA0w+R8Q7KJp2LiDa55Odye1bSPkQBU7LeS
 pJ2pECEhijNbb1DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E940913A30;
 Wed, 20 Apr 2022 17:10:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +h0eOIM+YGIqXwAAMHmgww
 (envelope-from <vbabka@suse.cz>); Wed, 20 Apr 2022 17:10:27 +0000
Message-ID: <b49f1b4c-defa-ef32-1984-0273e1fad178@suse.cz>
Date: Wed, 20 Apr 2022 19:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/8] mm/swap: remember PG_anon_exclusive via a swp pte
 bit
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20220329164329.208407-1-david@redhat.com>
 <20220329164329.208407-2-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20220329164329.208407-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/29/22 18:43, David Hildenbrand wrote:
> Currently, we clear PG_anon_exclusive in try_to_unmap() and forget about
> it. We do this, to keep fork() logic on swap entries easy and efficient:
> for example, if we wouldn't clear it when unmapping, we'd have to lookup
> the page in the swapcache for each and every swap entry during fork() and
> clear PG_anon_exclusive if set.
> 
> Instead, we want to store that information directly in the swap pte,
> protected by the page table lock, similarly to how we handle
> SWP_MIGRATION_READ_EXCLUSIVE for migration entries. However, for actual
> swap entries, we don't want to mess with the swap type (e.g., still one
> bit) because it overcomplicates swap code.
> 
> In try_to_unmap(), we already reject to unmap in case the page might be
> pinned, because we must not lose PG_anon_exclusive on pinned pages ever.
> Checking if there are other unexpected references reliably *before*
> completely unmapping a page is unfortunately not really possible: THP
> heavily overcomplicate the situation. Once fully unmapped it's easier --
> we, for example, make sure that there are no unexpected references
> *after* unmapping a page before starting writeback on that page.
> 
> So, we currently might end up unmapping a page and clearing
> PG_anon_exclusive if that page has additional references, for example,
> due to a FOLL_GET.
> 
> do_swap_page() has to re-determine if a page is exclusive, which will
> easily fail if there are other references on a page, most prominently
> GUP references via FOLL_GET. This can currently result in memory
> corruptions when taking a FOLL_GET | FOLL_WRITE reference on a page even
> when fork() is never involved: try_to_unmap() will succeed, and when
> refaulting the page, it cannot be marked exclusive and will get replaced
> by a copy in the page tables on the next write access, resulting in writes
> via the GUP reference to the page being lost.
> 
> In an ideal world, everybody that uses GUP and wants to modify page
> content, such as O_DIRECT, would properly use FOLL_PIN. However, that
> conversion will take a while. It's easier to fix what used to work in the
> past (FOLL_GET | FOLL_WRITE) remembering PG_anon_exclusive. In addition,
> by remembering PG_anon_exclusive we can further reduce unnecessary COW
> in some cases, so it's the natural thing to do.
> 
> So let's transfer the PG_anon_exclusive information to the swap pte and
> store it via an architecture-dependant pte bit; use that information when
> restoring the swap pte in do_swap_page() and unuse_pte(). During fork(), we
> simply have to clear the pte bit and are done.
> 
> Of course, there is one corner case to handle: swap backends that don't
> support concurrent page modifications while the page is under writeback.
> Special case these, and drop the exclusive marker. Add a comment why that
> is just fine (also, reuse_swap_page() would have done the same in the
> past).
> 
> In the future, we'll hopefully have all architectures support
> __HAVE_ARCH_PTE_SWP_EXCLUSIVE, such that we can get rid of the empty
> stubs and the define completely. Then, we can also convert
> SWP_MIGRATION_READ_EXCLUSIVE. For architectures it's fairly easy to
> support: either simply use a yet unused pte bit that can be used for swap
> entries, steal one from the arch type bits if they exceed 5, or steal one
> from the offset bits.
> 
> Note: R/O FOLL_GET references were never really reliable, especially
> when taking one on a shared page and then writing to the page (e.g., GUP
> after fork()). FOLL_GET, including R/W references, were never really
> reliable once fork was involved (e.g., GUP before fork(),
> GUP during fork()). KSM steps back in case it stumbles over unexpected
> references and is, therefore, fine.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

With the fixup as reportedy by Miaohe Lin

Acked-by: Vlastimil Babka <vbabka@suse.cz>

(sent a separate mm-commits mail to inquire about the fix going missing from
mmotm)

https://lore.kernel.org/mm-commits/c3195d8a-2931-0749-973a-1d04e4baec94@suse.cz/T/#m4e98ccae6f747e11f45e4d0726427ba2fef740eb

