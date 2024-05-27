Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id AEDE88CFEE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 13:26:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1v9HSqmM;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xlQOYgcr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1v9HSqmM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xlQOYgcr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VntV40FvQz3gL3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 21:20:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1v9HSqmM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xlQOYgcr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1v9HSqmM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xlQOYgcr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VntTJ1VMdz3fy0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 21:19:31 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6711B1FCF9;
	Mon, 27 May 2024 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716808762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Bi7Ql1X3s4Dacbspx0O9yRaUH+sqke7d9JnW3emmk4=;
	b=1v9HSqmM3ByGTDpUJcOlBE7lZwtRH36akLa3r92ozdA0Vig4wwX77SMggBICDlvZtiLWgR
	B8dzgwKBbCvIkiUrm0pdDG75+gyFW9El6tBG2pV3ODs/5dr+uE9sfV3JgNyMpuoEDap//n
	RAFkcpV7txMFEaS2dFHuPjxdeukGqOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716808762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Bi7Ql1X3s4Dacbspx0O9yRaUH+sqke7d9JnW3emmk4=;
	b=xlQOYgcrsgLz/gT/b41UXdxr3G8IJM2z3u2ptnaoTmir+HwvA8vbdcYm2iRO2RtmV6nnwz
	lsjfsRa3+2HSBIDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1v9HSqmM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xlQOYgcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716808762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Bi7Ql1X3s4Dacbspx0O9yRaUH+sqke7d9JnW3emmk4=;
	b=1v9HSqmM3ByGTDpUJcOlBE7lZwtRH36akLa3r92ozdA0Vig4wwX77SMggBICDlvZtiLWgR
	B8dzgwKBbCvIkiUrm0pdDG75+gyFW9El6tBG2pV3ODs/5dr+uE9sfV3JgNyMpuoEDap//n
	RAFkcpV7txMFEaS2dFHuPjxdeukGqOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716808762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Bi7Ql1X3s4Dacbspx0O9yRaUH+sqke7d9JnW3emmk4=;
	b=xlQOYgcrsgLz/gT/b41UXdxr3G8IJM2z3u2ptnaoTmir+HwvA8vbdcYm2iRO2RtmV6nnwz
	lsjfsRa3+2HSBIDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDAD713A6B;
	Mon, 27 May 2024 11:19:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4gE/LzlsVGYmDwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 27 May 2024 11:19:21 +0000
Date: Mon, 27 May 2024 13:19:12 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v3 03/16] mm: Provide mm_struct and address to
 huge_ptep_get()
Message-ID: <ZlRsMCvVo9tSEFQV@localhost.localdomain>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
 <fbba60d762faad40ebb959bf9517c5c22301f69e.1716714720.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbba60d762faad40ebb959bf9517c5c22301f69e.1716714720.git.christophe.leroy@csgroup.eu>
X-Spam-Level: 
X-Spamd-Result: default: False [-6.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,redhat.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6711B1FCF9
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -6.51
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

On Sun, May 26, 2024 at 11:22:23AM +0200, Christophe Leroy wrote:
> On powerpc 8xx huge_ptep_get() will need to know whether the given
> ptep is a PTE entry or a PMD entry. This cannot be known with the
> PMD entry itself because there is no easy way to know it from the
> content of the entry.
> 
> So huge_ptep_get() will need to know either the size of the page
> or get the pmd.
> 
> In order to be consistent with huge_ptep_get_and_clear(), give
> mm and address to huge_ptep_get().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Add missing changes in arch implementations
> v3: Fixed a comment in ARM and missing changes in S390
> ---
>  arch/arm/include/asm/hugetlb-3level.h |  4 +--
>  arch/arm64/include/asm/hugetlb.h      |  2 +-
>  arch/arm64/mm/hugetlbpage.c           |  2 +-
>  arch/riscv/include/asm/hugetlb.h      |  2 +-
>  arch/riscv/mm/hugetlbpage.c           |  2 +-
>  arch/s390/include/asm/hugetlb.h       |  4 +--
>  arch/s390/mm/hugetlbpage.c            |  4 +--

I was wondering whether we could do something similar for what we did in
patch#1, so we do not touch architectures code.

  
> diff --git a/mm/gup.c b/mm/gup.c
> index 1611e73b1121..86b5105b82a1 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2812,7 +2812,7 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
>  	if (pte_end < end)
>  		end = pte_end;
>  
> -	pte = huge_ptep_get(ptep);
> +	pte = huge_ptep_get(NULL, addr, ptep);

I know that after this series all this code is gone, but I was not sure
about the behaviour between this patch and the last one.

It made me nervous, until I realized that this code is only used
on CONFIG_ARCH_HAS_HUGEPD, which should not be the case anymore for 8xx after
patch#8, and since 8xx is the only one that will use the mm parameter from
huge_ptep_get, we are all good.



-- 
Oscar Salvador
SUSE Labs
