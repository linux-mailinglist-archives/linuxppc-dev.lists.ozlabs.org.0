Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 1048B8D097E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 19:46:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JKtSKwrj;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iGs8/JIe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OYa+4d/N;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jdFKt4D6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vp2vZ0Mtjz79Z8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 03:39:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JKtSKwrj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iGs8/JIe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OYa+4d/N;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jdFKt4D6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vp2tp3VvWz3vhL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 03:38:42 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 568611FE7D;
	Mon, 27 May 2024 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716831518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MT7sqn3x8UqZ+1AY3VOfJjHycbhLSUy95jECA+AD8oM=;
	b=JKtSKwrjmHagzP6RUYMXRiXwFEIABFC7f/bWAa/BCdiK9UiD5e4uS6p9ENrP0l207QfdaK
	fSfjHrpimQW0vPZ7iC7affgwAX3UYTXuJ/Z8mvIXAya/Hjav0y5/o4JGx8+ijZS8IdXWHL
	QhnYuASSPy6/Rgcmhp2WdCJgVRSN/rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716831518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MT7sqn3x8UqZ+1AY3VOfJjHycbhLSUy95jECA+AD8oM=;
	b=iGs8/JIe7rCcMdLVA7PNXtYwgdC6UB0aExVuW7ZzoRPpVqqriuspth/GNWs47jP7G+piUR
	j0mC7FPOI414uGCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716831517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MT7sqn3x8UqZ+1AY3VOfJjHycbhLSUy95jECA+AD8oM=;
	b=OYa+4d/Nch5DSsggH81xf/Q1oo2yugPgafbWBqHIB6IP/JwfbsDA1LQRxtnEY+KlNlgN/L
	bwCVogufWxV4EMEj6H7mgdCQAgwFx+EwabyK5eFhvAlmnq6STeZSBSgaJdbY0evecPFiKi
	v5+nrfiDiPzIXrpm8ziQY8m7kkLoWlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716831517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MT7sqn3x8UqZ+1AY3VOfJjHycbhLSUy95jECA+AD8oM=;
	b=jdFKt4D6rQKp4EhxZ2EEhSFtydmFKSauIvzPcpTkovCA+dmq07/+pTm7ZjtG/zHUeGE4MZ
	zmSzqtAKjcNKABDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3C4E13A6B;
	Mon, 27 May 2024 17:38:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pYxmLBzFVGaDewAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 27 May 2024 17:38:36 +0000
Date: Mon, 27 May 2024 19:38:31 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v3 03/16] mm: Provide mm_struct and address to
 huge_ptep_get()
Message-ID: <ZlTFF7L3bcfUaJbg@localhost.localdomain>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
 <fbba60d762faad40ebb959bf9517c5c22301f69e.1716714720.git.christophe.leroy@csgroup.eu>
 <ZlRsMCvVo9tSEFQV@localhost.localdomain>
 <22c4ba7c-28d2-43bd-81b6-bd63f77d1d9e@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22c4ba7c-28d2-43bd-81b6-bd63f77d1d9e@csgroup.eu>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,redhat.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2024 at 03:51:41PM +0000, Christophe Leroy wrote:
> We could be is that worth the churn ?

Probably not.

> With patch 1 there was only one callsite.

Yes, you are right here.

> Here we have many callsites, and we also have huge_ptep_get_and_clear() 
> which already takes three arguments. So for me it make more sense to 
> adapt huge_ptep_get() here.
> 
> Today several of the huge-related functions already have parameters that 
> are used only by a few architectures and everytime one architecture 
> needs a new parameter it is added for all of them, and there are 
> exemples in the past of new functions added to get new parameters for 
> only a few architectures that ended up with a mess and a need to 
> re-factor at the end.
> 
> See for instance the story around arch_make_huge_pte() and pte_mkhuge(), 
> both do the same but arch_make_huge_pte() was added to take additional 
> parameters by commit d9ed9faac283 ("mm: add new arch_make_huge_pte() 
> method for tile support") then they were merged by commit 16785bd77431 
> ("mm: merge pte_mkhuge() call into arch_make_huge_pte()")
> 
> So I'm open to any suggestion but we need to try not make it a bigger 
> mess at the end.
> 
> By the way, I think most if not all huge related helpers should all take 
> the same parameters even if not all of them are used, then it would make 
> things easier. And maybe the cleanest would be to give the page size to 
> all those functions instead of having them guess it.
> 
> So let's have your ideas here on the most straight forward way to handle 
> that.

It is probably not worth pursuing this then.
As you said, there are many callers and we would have to create some kind of hook
for only those interested places, which I guess would end up looking just too ugly
in order to save little code in arch code.

So please disregard my comment here, and stick with what we have.

> By the way, after commit 01d89b93e176 ("mm/gup: fix hugepd handling in 
> hugetlb rework") we now have the vma in gup_hugepte() so we now pass 
> vma->vm_mm

I did not notice, thanks.


-- 
Oscar Salvador
SUSE Labs
