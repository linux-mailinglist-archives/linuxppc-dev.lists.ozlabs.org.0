Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537A62FB17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 18:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDNRG2vJjz3f3T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 04:03:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=LS+hNeQ4;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=khb2AjlS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=suse.cz (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=LS+hNeQ4;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=khb2AjlS;
	dkim-atps=neutral
X-Greylist: delayed 2571 seconds by postgrey-1.36 at boromir; Sat, 19 Nov 2022 04:03:05 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDNQK6LkNz3bjw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 04:03:05 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D4BF31FDA4;
	Fri, 18 Nov 2022 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1668790981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fK2sdLfZqlxwdzyzeVC6Yy7wx8vYkqbsaxCq7BgcB58=;
	b=LS+hNeQ4geGgj4IXWO5+0pS41T+O+kbhrtYk+pP+vVRIoeuKs+oW13F6Ht+tR7USTuEyYF
	w44h38vtDK2kFPU+O2RCals0tqkM1nJKUf86qC24NucyatqLyr4TTvgkMY8PsBAD2uBX+L
	cHUUR5s7utA0uOsl3r11W1mUfWblbh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1668790981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fK2sdLfZqlxwdzyzeVC6Yy7wx8vYkqbsaxCq7BgcB58=;
	b=khb2AjlSZXqyWGI6UYbr+/ZmYWHGQEHMU8He9yK4yvl4DWCKZ0jYtp3ha5rFTfTmR/yC2u
	C7/yrrNfpsGvyLBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41DED1345B;
	Fri, 18 Nov 2022 17:03:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kEZlD8W6d2PfGAAAMHmgww
	(envelope-from <vbabka@suse.cz>); Fri, 18 Nov 2022 17:03:01 +0000
Message-ID: <e4dd50b8-7ae9-a6fd-8765-2b2dd90ea1a8@suse.cz>
Date: Fri, 18 Nov 2022 18:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH mm-unstable v1 05/20] mm: add early FAULT_FLAG_WRITE
 consistency checks
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-6-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20221116102659.70287-6-david@redhat.com>
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
> Let's catch abuse of FAULT_FLAG_WRITE early, such that we don't have to
> care in all other handlers and might get "surprises" if we forget to do
> so.
> 
> Write faults without VM_MAYWRITE don't make any sense, and our
> maybe_mkwrite() logic could have hidden such abuse for now.
> 
> Write faults without VM_WRITE on something that is not a COW mapping is
> similarly broken, and e.g., do_wp_page() could end up placing an
> anonymous page into a shared mapping, which would be bad.
> 
> This is a preparation for reliable R/O long-term pinning of pages in
> private mappings, whereby we want to make sure that we will never break
> COW in a read-only private mapping.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/memory.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index e014435a87db..c4fa378ec2a0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5170,6 +5170,14 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
>  		 */
>  		if (!is_cow_mapping(vma->vm_flags))
>  			*flags &= ~FAULT_FLAG_UNSHARE;
> +	} else if (*flags & FAULT_FLAG_WRITE) {
> +		/* Write faults on read-only mappings are impossible ... */
> +		if (WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE)))
> +			return VM_FAULT_SIGSEGV;
> +		/* ... and FOLL_FORCE only applies to COW mappings. */
> +		if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE) &&
> +				 !is_cow_mapping(vma->vm_flags)))
> +			return VM_FAULT_SIGSEGV;
>  	}
>  	return 0;
>  }

