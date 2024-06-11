Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C453903FBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 17:09:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=amiGg5pX;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RM8TGgBP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n9yimVyw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=60FqZ/E0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzBsp3RPGz3fnb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 01:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=amiGg5pX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RM8TGgBP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n9yimVyw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=60FqZ/E0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzBs33qP9z2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 01:08:55 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D50420812;
	Tue, 11 Jun 2024 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718118532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4BYFzX/+X9ca054SpVdmOqNg7k/NngZVUqS7vudtYE=;
	b=amiGg5pXx+ZWkXQuJ0pvVDX+REW1GEP+EiPrTGnzbbEbGSubmQSi7EqhGl6loZKuNuTo41
	AAgA6gHVAyg4pw29IKVF6w5+7lxtSoCJ0U9eraO1ZprDFRB7+j+h3VZ95z/iF0t/vb39eq
	f2XkdBjIHOiQ3KqH2uDK5u0SFRTqrrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718118532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4BYFzX/+X9ca054SpVdmOqNg7k/NngZVUqS7vudtYE=;
	b=RM8TGgBPhfBP5SdPI5FXfUgPrJgths3IZankUWWEWWS9eXX03ez+GkFV+wNHIYNpR6zUUd
	4Xvxl+ePj3Ob1LCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718118531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4BYFzX/+X9ca054SpVdmOqNg7k/NngZVUqS7vudtYE=;
	b=n9yimVywfNO7ayn002mzdzBkcdRTSue3Ns/qWgRhIKCqXZXWzSLGf5lz5VXD85d9ChsVNu
	k2aRUvD5CcMrC/VPhHe5yYbpLpo9E7ayP2VzTETp1pnp8AM5HFaj0VLXpNKkRnMEn/vk1F
	Z5Vo52WN1+sglJOAQV7SV2vzdRQEUtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718118531;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4BYFzX/+X9ca054SpVdmOqNg7k/NngZVUqS7vudtYE=;
	b=60FqZ/E0iS7JJlNd2pLs1pnwC306tkeiXBIehBMTrto/DvKrdaf4YFoh/otgH6iy0n6EIJ
	PY25FEjsBAlR0IBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8AF7137DF;
	Tue, 11 Jun 2024 15:08:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LH+fKoJoaGaTXAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 11 Jun 2024 15:08:50 +0000
Date: Tue, 11 Jun 2024 17:08:45 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Message-ID: <ZmhofWIiMC3I0aMF@localhost.localdomain>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain>
 <ZmhcepJrkDpJ7mSC@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmhcepJrkDpJ7mSC@x1n>
X-Spam-Score: -8.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[csgroup.eu,linux-foundation.org,nvidia.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 10:17:30AM -0400, Peter Xu wrote:
> Oscar,
> 
> On Tue, Jun 11, 2024 at 11:34:23AM +0200, Oscar Salvador wrote:
> > Which means that they would be caught in the following code:
> > 
> >         ptl = pmd_huge_lock(pmd, vma);
> >         if (ptl) {
> > 	        - 8MB hugepages will be handled here
> >                 smaps_pmd_entry(pmd, addr, walk);
> >                 spin_unlock(ptl);
> >         }
> > 	/* pte stuff */
> > 	...
> 
> Just one quick comment: I think there's one challenge though as this is
> also not a generic "pmd leaf", but a pgtable page underneath.  I think it
> means smaps_pmd_entry() won't trivially work here, e.g., it will start to
> do this:
> 
> 	if (pmd_present(*pmd)) {
> 		page = vm_normal_page_pmd(vma, addr, *pmd);
> 
> Here vm_normal_page_pmd() will only work if pmd_leaf() satisfies its
> definition as:
> 
>  * - It should contain a huge PFN, which points to a huge page larger than
>  *   PAGE_SIZE of the platform.  The PFN format isn't important here.
> 
> But now it's a pgtable page, containing cont-ptes.  Similarly, I think most
> pmd_*() helpers will stop working there if we report it as a leaf.

Heh, I think I managed to confuse myself.
I do not why but I thought that

 static inline pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
        if (ptep_is_8m_pmdp(mm, addr, ptep))
             ptep = pte_offset_kernel((pmd_t *)ptep, 0);
        return ptep_get(ptep);
 }

would return the address of the pmd for 8MB hugepages, but it will
return the address of the first pte?

Then yeah, this will not work as I thought.

The problem is that we do not have spare bits for 8xx to mark these ptes
as cont-ptes or mark them pte as 8MB, so I do not see a clear path on how
we could remove huge_ptep_get for 8xx.

I am really curious though how we handle that for THP? Or THP on 8xx
does not support that size?
 

-- 
Oscar Salvador
SUSE Labs
