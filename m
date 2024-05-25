Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8498CEDCF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 06:21:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A5CjUT33;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+oVJuGwR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VnjQaARY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1sJLPbvA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmT6s6Qsmz79PR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 14:13:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A5CjUT33;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+oVJuGwR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VnjQaARY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1sJLPbvA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmT685zr1z792m
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 14:13:04 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDD123408E;
	Sat, 25 May 2024 04:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716610381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdi7hlA9h9Co0a/ynH1F9A1yZigACenw5JizREvilf0=;
	b=A5CjUT33XB5GQRJTtT+Z3EX+niUwuq2kjx/fWhi5RLf3FxMYgrZRmFWdDQ3JX6mpKTtfWi
	ZSIw5bxOk18Eg/NnvYFgXO+etgxf8rpPkOXzjf3quPBP9s3d9badkvFv5XdowyXzhRByHF
	SUsmfrlRQ1UoaocDyoX5FWs59Y2owGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716610381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdi7hlA9h9Co0a/ynH1F9A1yZigACenw5JizREvilf0=;
	b=+oVJuGwRSjw4vmjCEjdO+J9kmtVZoNZbsUKPGIGeTGGpKEHFDhq+c+GRTjxCtc436P4Nl/
	96up70AHOW2XHwBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716610380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdi7hlA9h9Co0a/ynH1F9A1yZigACenw5JizREvilf0=;
	b=VnjQaARYlkBAJNqfEFPaJryFW44XnmAe1VkotDNmZowF3WP6baaFzjCYyi7vbIoML10hH2
	3YUwnKBSHvjwK5tXJ2FyAs2nBgoClyxhxGDrLKqsyC0Y1tEmNLHISI29TjKMQYfe52luA5
	HUT6ClfHOQPd1rdCcaFSMdAWyRQWOeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716610380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdi7hlA9h9Co0a/ynH1F9A1yZigACenw5JizREvilf0=;
	b=1sJLPbvAtnBRNsclzks5oIwJlKVIulF0vwObA4tlla2lUfaMiP/hpnM19gHTTREWiNbtV4
	2HwvEB8foC1AZLBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F1DB13A1E;
	Sat, 25 May 2024 04:13:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o9+tEExlUWZ8BQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Sat, 25 May 2024 04:13:00 +0000
Date: Sat, 25 May 2024 06:12:54 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 10/20] powerpc/mm: Fix __find_linux_pte() on 32
 bits with PMD leaf entries
Message-ID: <ZlFlRr26AvS6n7p8@localhost.localdomain>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <41bf05806501c0091a7d52e118b187416d24a76f.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41bf05806501c0091a7d52e118b187416d24a76f.1715971869.git.christophe.leroy@csgroup.eu>
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
X-Spam-Score: -4.30
X-Spam-Flag: NO
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

On Fri, May 17, 2024 at 09:00:04PM +0200, Christophe Leroy wrote:
> Building on 32 bits with pmd_leaf() not returning always false leads
> to the following error:

I am curious though.
pmd_leaf is only defined in include/linux/pgtable.h for 32bits, and is hardcoded
to false.
I do not see where we change it in previous patches, so is this artificial?

> 
>   CC      arch/powerpc/mm/pgtable.o
> arch/powerpc/mm/pgtable.c: In function '__find_linux_pte':
> arch/powerpc/mm/pgtable.c:506:1: error: function may return address of local variable [-Werror=return-local-addr]
>   506 | }
>       | ^
> arch/powerpc/mm/pgtable.c:394:15: note: declared here
>   394 |         pud_t pud, *pudp;
>       |               ^~~
> arch/powerpc/mm/pgtable.c:394:15: note: declared here
> 
> This is due to pmd_offset() being a no-op in that case.

This is because 32bits powerpc include pgtable-nopmd.h?

> So rework it for powerpc/32 so that pXd_offset() are used on real
> pointers and not on on-stack copies.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/pgtable.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 59f0d7706d2f..51ee508eeb5b 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -390,8 +390,12 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
>  			bool *is_thp, unsigned *hpage_shift)
>  {
>  	pgd_t *pgdp;
> -	p4d_t p4d, *p4dp;
> -	pud_t pud, *pudp;
> +	p4d_t *p4dp;
> +	pud_t *pudp;
> +#ifdef CONFIG_PPC64
> +	p4d_t p4d;
> +	pud_t pud;
> +#endif
>  	pmd_t pmd, *pmdp;
>  	pte_t *ret_pte;
>  	hugepd_t *hpdp = NULL;
> @@ -412,6 +416,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
>  	 */
>  	pgdp = pgdir + pgd_index(ea);
>  	p4dp = p4d_offset(pgdp, ea);
> +#ifdef CONFIG_PPC64
>  	p4d  = READ_ONCE(*p4dp);
>  	pdshift = P4D_SHIFT;
>  
> @@ -452,6 +457,11 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
>  
>  	pdshift = PMD_SHIFT;
>  	pmdp = pmd_offset(&pud, ea);
> +#else
> +	p4dp = p4d_offset(pgdp, ea);
> +	pudp = pud_offset(p4dp, ea);
> +	pmdp = pmd_offset(pudp, ea);

I would drop a comment on top explaining that these are no-op for 32bits,
otherwise it might not be obvious to people as why this distiction between 64 and
32bits.

Other than that looks good to me

 

-- 
Oscar Salvador
SUSE Labs
