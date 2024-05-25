Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id E21168CEDE4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 06:36:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l1u02PQ7;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/P4sqCWy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l1u02PQ7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/P4sqCWy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmTVH6mW2z79Qk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 14:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l1u02PQ7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/P4sqCWy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l1u02PQ7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/P4sqCWy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmTTZ0mgZz797j
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 14:29:53 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B90FE210B7;
	Sat, 25 May 2024 04:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716611390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jMHt0Q/JR84IkdUwzp1Rd4JSoh8dVTU4aWoOj2QTcg=;
	b=l1u02PQ7mUeizPUtziKZMSjLfSDrBiAuCREz31HsHEIKq6Y05wZ/ksZDnm96yJCEyTPp89
	s+woPlXhybRjXGtzwwPgGx4OyhUH2WiS/97dN6hchsbJ593I1ri2VE0E9y1EHydxnEf6Jq
	zRIaWjIMf0LqWRyNkCQmi3MLLt8gtr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716611390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jMHt0Q/JR84IkdUwzp1Rd4JSoh8dVTU4aWoOj2QTcg=;
	b=/P4sqCWykN268llQRDZDNDK/3U5kd/JdBzk4bO/RCBrUwi8Yi3n/+zg7ms3JYCFIumrcNw
	wnHCd3Mdif0hhBDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716611390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jMHt0Q/JR84IkdUwzp1Rd4JSoh8dVTU4aWoOj2QTcg=;
	b=l1u02PQ7mUeizPUtziKZMSjLfSDrBiAuCREz31HsHEIKq6Y05wZ/ksZDnm96yJCEyTPp89
	s+woPlXhybRjXGtzwwPgGx4OyhUH2WiS/97dN6hchsbJ593I1ri2VE0E9y1EHydxnEf6Jq
	zRIaWjIMf0LqWRyNkCQmi3MLLt8gtr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716611390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jMHt0Q/JR84IkdUwzp1Rd4JSoh8dVTU4aWoOj2QTcg=;
	b=/P4sqCWykN268llQRDZDNDK/3U5kd/JdBzk4bO/RCBrUwi8Yi3n/+zg7ms3JYCFIumrcNw
	wnHCd3Mdif0hhBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F5F513A6B;
	Sat, 25 May 2024 04:29:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vwuLDD5pUWaVPAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Sat, 25 May 2024 04:29:50 +0000
Date: Sat, 25 May 2024 06:29:48 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 11/20] powerpc/mm: Complement huge_pte_alloc() for
 all non HUGEPD setups
Message-ID: <ZlFpPBlLoBZNjd73@localhost.localdomain>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <59a1390923c40b0b83ae062e3041873292186577.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59a1390923c40b0b83ae062e3041873292186577.1715971869.git.christophe.leroy@csgroup.eu>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,redhat.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 17, 2024 at 09:00:05PM +0200, Christophe Leroy wrote:
> huge_pte_alloc() for non-HUGEPD targets is reserved for 8xx at the
> moment. In order to convert other targets for non-HUGEPD, complement
> huge_pte_alloc() to support any standard cont-PxD setup.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/hugetlbpage.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 42b12e1ec851..f8aefa1e7363 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -195,11 +195,34 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  		      unsigned long addr, unsigned long sz)
>  {
> -	pmd_t *pmd = pmd_off(mm, addr);
> +	pgd_t *pgd;
> +	p4d_t *p4d;
> +	pud_t *pud;
> +	pmd_t *pmd;
> +
> +	addr &= ~(sz - 1);
> +	pgd = pgd_offset(mm, addr);
> +
> +	p4d = p4d_offset(pgd, addr);
> +	if (sz >= PGDIR_SIZE)
> +		return (pte_t *)p4d;
> +
> +	pud = pud_alloc(mm, p4d, addr);
> +	if (!pud)
> +		return NULL;
> +	if (sz >= PUD_SIZE)
> +		return (pte_t *)pud;
> +
> +	pmd = pmd_alloc(mm, pud, addr);
> +	if (!pmd)
> +		return NULL;
>  
>  	if (sz < PMD_SIZE)
>  		return pte_alloc_huge(mm, pmd, addr, sz);
>  
> +	if (!IS_ENABLED(CONFIG_PPC_8xx))
> +		return (pte_t *)pmd;

So only 8xx has cont-PMD for hugepages?

> +
>  	if (sz != SZ_8M)
>  		return NULL;

Since this function is the core for allocation huge pages, I think it would
benefit from a comment at the top explaining the possible layouts.
e.g: Who can have cont-{P4d,PUD,PMD} etc.
A brief explanation of the possible scheme for all powerpc platforms.

That would help people looking into this in a future.

 

-- 
Oscar Salvador
SUSE Labs
