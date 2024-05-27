Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 9C48A8CFFC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 14:16:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vh099PAn;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KrIgFpoO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vh099PAn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KrIgFpoO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vnvd10cccz3vY4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 22:11:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vh099PAn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KrIgFpoO;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vh099PAn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KrIgFpoO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnvcF5ntQz3ftN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 22:10:37 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 285A921E8D;
	Mon, 27 May 2024 12:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716811833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvaI30Lc501OfGJxpLRPDdHJVdqbMySFwG1G/Pb/Fhs=;
	b=vh099PAndxLyEPIsy9E4zQcvEjjwomGo17E1z61rShLO1l/oy81WjLcrx6E9YBLFqcxuN1
	4NJKbjtWlt3gj3LXl4MROawdJ3lmA1PecehlPSKQumw0obvCt/GfrrY1ZDa+xZTM0QWg8m
	CoFvcrONeO5ObJq6WjivL7O0auPCm7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716811833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvaI30Lc501OfGJxpLRPDdHJVdqbMySFwG1G/Pb/Fhs=;
	b=KrIgFpoO8KoA/E7A1TKrafaMlo1xGEQnE5ztSYWcl7Qbv4WAXr8pwACx+wRii1Hg3aHJRi
	PiXfifP6mdP/otAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716811833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvaI30Lc501OfGJxpLRPDdHJVdqbMySFwG1G/Pb/Fhs=;
	b=vh099PAndxLyEPIsy9E4zQcvEjjwomGo17E1z61rShLO1l/oy81WjLcrx6E9YBLFqcxuN1
	4NJKbjtWlt3gj3LXl4MROawdJ3lmA1PecehlPSKQumw0obvCt/GfrrY1ZDa+xZTM0QWg8m
	CoFvcrONeO5ObJq6WjivL7O0auPCm7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716811833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvaI30Lc501OfGJxpLRPDdHJVdqbMySFwG1G/Pb/Fhs=;
	b=KrIgFpoO8KoA/E7A1TKrafaMlo1xGEQnE5ztSYWcl7Qbv4WAXr8pwACx+wRii1Hg3aHJRi
	PiXfifP6mdP/otAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E42613A88;
	Mon, 27 May 2024 12:10:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SHkOIDh4VGYEVgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 27 May 2024 12:10:32 +0000
Date: Mon, 27 May 2024 14:10:23 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v3 08/16] powerpc/8xx: Rework support for 8M pages
 using contiguous PTE entries
Message-ID: <ZlR4L9g9uQ6j7J3Y@localhost.localdomain>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
 <09f4ae803da751de7741f3d6bc5d94b8acf18829.1716714720.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09f4ae803da751de7741f3d6bc5d94b8acf18829.1716714720.git.christophe.leroy@csgroup.eu>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,redhat.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
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

On Sun, May 26, 2024 at 11:22:28AM +0200, Christophe Leroy wrote:
> In order to fit better with standard Linux page tables layout, add
> support for 8M pages using contiguous PTE entries in a standard
> page table. Page tables will then be populated with 1024 similar
> entries and two PMD entries will point to that page table.
> 
> The PMD entries also get a flag to tell it is addressing an 8M page,
> this is required for the HW tablewalk assistance.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I did not look close into KSAN bits, and I trust you with the assembly part,
but other than that looks good to me, so FWIW:

Reviewed-by: Oscar Salvador <osalvador@suse.de>

Just a nit below:

> +#define __HAVE_ARCH_HUGE_PTEP_GET
> +static inline pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
> +{
> +	if (ptep_is_8m_pmdp(mm, addr, ptep))
> +		ptep = pte_offset_kernel((pmd_t *)ptep, 0);

Would it not be more clear to use pmd_page_vaddr directly there?


-- 
Oscar Salvador
SUSE Labs
