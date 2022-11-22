Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF13663405E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 16:36:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGpJy4CS1z3f2n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 02:36:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=hSz8uo53;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=87yFyDfo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=suse.cz (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=hSz8uo53;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=87yFyDfo;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGpHy00xPz3cGT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 02:35:57 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8357A22007;
	Tue, 22 Nov 2022 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1669131353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzeEtRVGkBValjf4cAqJIIBnm0WLgHIJrOj2Qpyeryk=;
	b=hSz8uo53GqZkaSBqbG3aIh16lgMQB2Sw8gZ6Z+fnEjIR6uPvpuBuVkR8TpcuCDJwN2rjjn
	iqJmydTFhzXH0tY5jw9oJ6zK0Sx7/l0zZrHLYI1mzVvp/woqabMd2RthMdqBUz+tckoXxt
	gvUiGWpp9yM7xLCq0tNctpGuD1es/pI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1669131353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzeEtRVGkBValjf4cAqJIIBnm0WLgHIJrOj2Qpyeryk=;
	b=87yFyDfodelF6paPP+3fZVkcbfCamfu6aYJAmnQjTNh2RXFp/RQ8a0uSheJsgsaRl+tSbc
	rgSpbkEWiLk/2KDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E380913B01;
	Tue, 22 Nov 2022 15:35:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /ANwNljsfGPGGwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 22 Nov 2022 15:35:52 +0000
Message-ID: <34835490-57d7-4e26-7474-008b2c4c6b39@suse.cz>
Date: Tue, 22 Nov 2022 16:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH mm-unstable v1 08/20] mm: extend FAULT_FLAG_UNSHARE
 support to anything in a COW mapping
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-9-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20221116102659.70287-9-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-se
 curity-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/16/22 11:26, David Hildenbrand wrote:
> Extend FAULT_FLAG_UNSHARE to break COW on anything mapped into a
> COW (i.e., private writable) mapping and adjust the documentation
> accordingly.
> 
> FAULT_FLAG_UNSHARE will now also break COW when encountering the shared
> zeropage, a pagecache page, a PFNMAP, ... inside a COW mapping, by
> properly replacing the mapped page/pfn by a private copy (an exclusive
> anonymous page).
> 
> Note that only do_wp_page() needs care: hugetlb_wp() already handles
> FAULT_FLAG_UNSHARE correctly. wp_huge_pmd()/wp_huge_pud() also handles it
> correctly, for example, splitting the huge zeropage on FAULT_FLAG_UNSHARE
> such that we can handle FAULT_FLAG_UNSHARE on the PTE level.
> 
> This change is a requirement for reliable long-term R/O pinning in
> COW mappings.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  include/linux/mm_types.h | 8 ++++----
>  mm/memory.c              | 4 ----
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5e7f4fac1e78..5e9aaad8c7b2 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1037,9 +1037,9 @@ typedef struct {
>   * @FAULT_FLAG_REMOTE: The fault is not for current task/mm.
>   * @FAULT_FLAG_INSTRUCTION: The fault was during an instruction fetch.
>   * @FAULT_FLAG_INTERRUPTIBLE: The fault can be interrupted by non-fatal signals.
> - * @FAULT_FLAG_UNSHARE: The fault is an unsharing request to unshare (and mark
> - *                      exclusive) a possibly shared anonymous page that is
> - *                      mapped R/O.
> + * @FAULT_FLAG_UNSHARE: The fault is an unsharing request to break COW in a
> + *                      COW mapping, making sure that an exclusive anon page is
> + *                      mapped after the fault.
>   * @FAULT_FLAG_ORIG_PTE_VALID: whether the fault has vmf->orig_pte cached.
>   *                        We should only access orig_pte if this flag set.
>   *
> @@ -1064,7 +1064,7 @@ typedef struct {
>   *
>   * The combination FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE is illegal.
>   * FAULT_FLAG_UNSHARE is ignored and treated like an ordinary read fault when
> - * no existing R/O-mapped anonymous page is encountered.
> + * applied to mappings that are not COW mappings.
>   */
>  enum fault_flag {
>  	FAULT_FLAG_WRITE =		1 << 0,
> diff --git a/mm/memory.c b/mm/memory.c
> index d47ad33c6487..56b21ab1e4d2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3432,10 +3432,6 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
>  		}
>  		wp_page_reuse(vmf);
>  		return 0;
> -	} else if (unshare) {
> -		/* No anonymous page -> nothing to do. */
> -		pte_unmap_unlock(vmf->pte, vmf->ptl);
> -		return 0;
>  	}
>  copy:
>  	/*

