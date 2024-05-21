Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id ECFFE8CAB0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 11:46:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z+DNslWk;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y6hYJcvc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z+DNslWk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y6hYJcvc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vk8YR1w0bz3gD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 19:40:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z+DNslWk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y6hYJcvc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Z+DNslWk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y6hYJcvc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vk8Xk3gYWz3fw4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 19:39:34 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B004022A55;
	Tue, 21 May 2024 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716284368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhOZPVy/TQ6hWgNCMz6JejfnUTc+nQH1jip1vkmWyaI=;
	b=Z+DNslWkYvQspiJaoCwmIGEpwqLAYcnNhbfkmt3CVGMfzXNNgfuxW6kLIiijzevVtKCXvm
	ljWWKxIfQOOloiEALA22RAQDB6+rMz0aiPE2UE6e2Io7Q7ZqQi9AiC6RKuAgjL17+anZvF
	aRyzwfwXBdYJeEEFtKuG03WXLTJTNfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716284368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhOZPVy/TQ6hWgNCMz6JejfnUTc+nQH1jip1vkmWyaI=;
	b=Y6hYJcvcKnei1n43mylKq+OrxlTvadkEQrvK/jg02KC9makksyhOtGkzSEhso7PoVm1B6N
	HfvKcX0mp9jHuXBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z+DNslWk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Y6hYJcvc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716284368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhOZPVy/TQ6hWgNCMz6JejfnUTc+nQH1jip1vkmWyaI=;
	b=Z+DNslWkYvQspiJaoCwmIGEpwqLAYcnNhbfkmt3CVGMfzXNNgfuxW6kLIiijzevVtKCXvm
	ljWWKxIfQOOloiEALA22RAQDB6+rMz0aiPE2UE6e2Io7Q7ZqQi9AiC6RKuAgjL17+anZvF
	aRyzwfwXBdYJeEEFtKuG03WXLTJTNfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716284368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhOZPVy/TQ6hWgNCMz6JejfnUTc+nQH1jip1vkmWyaI=;
	b=Y6hYJcvcKnei1n43mylKq+OrxlTvadkEQrvK/jg02KC9makksyhOtGkzSEhso7PoVm1B6N
	HfvKcX0mp9jHuXBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2999B13A1E;
	Tue, 21 May 2024 09:39:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K0CEB9BrTGZiOAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 21 May 2024 09:39:28 +0000
Date: Tue, 21 May 2024 11:39:26 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 03/20] mm: Provide pmd to pte_leaf_size()
Message-ID: <ZkxrzrD5aJbqTq2Z@localhost.localdomain>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <ab93995d27055f055249e1e8770b22f89c980322.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab93995d27055f055249e1e8770b22f89c980322.1715971869.git.christophe.leroy@csgroup.eu>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,redhat.com,ellerman.id.au,gmail.com,vger.kernel.org,kvack.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B004022A55
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.51
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

On Fri, May 17, 2024 at 08:59:57PM +0200, Christophe Leroy wrote:
> On powerpc 8xx, when a page is 8M size, the information is in the PMD
> entry. So provide it to pte_leaf_size().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Overall looks good to me.

Would be nicer if we could left the arch code untouched.
I wanted to see how this would be if we go down that road and focus only 
on 8xx at the risk of being more esoteric.
pmd_pte_leaf_size() is a name of hell, but could be replaced
with __pte_leaf_size for example.

Worth it? Maybe not, anyway, just wanted to give it a go:


 diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
 index 137dc3c84e45..9e3fe6e1083f 100644
 --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
 +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
 @@ -151,7 +151,7 @@ static inline unsigned long pgd_leaf_size(pgd_t pgd)
 
  #define pgd_leaf_size pgd_leaf_size
 
 -static inline unsigned long pte_leaf_size(pte_t pte)
 +static inline unsigned long pmd_pte_leaf_size(pte_t pte)
  {
         pte_basic_t val = pte_val(pte);
 
 @@ -162,7 +162,7 @@ static inline unsigned long pte_leaf_size(pte_t pte)
         return SZ_4K;
  }
 
 -#define pte_leaf_size pte_leaf_size
 +#define pmd_pte_leaf_size pmd_pte_leaf_size
 
  /*
   * On the 8xx, the page tables are a bit special. For 16k pages, we have
 diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
 index 18019f037bae..2bc2fe3b2b53 100644
 --- a/include/linux/pgtable.h
 +++ b/include/linux/pgtable.h
 @@ -1891,6 +1891,9 @@ typedef unsigned int pgtbl_mod_mask;
  #ifndef pte_leaf_size
  #define pte_leaf_size(x) PAGE_SIZE
  #endif
 +#ifndef pmd_pte_leaf_size
 +#define pmd_pte_leaf_size(x, y) pte_leaf_size(y)
 +#endif
 
  /*
   * We always define pmd_pfn for all archs as it's used in lots of generic
 diff --git a/kernel/events/core.c b/kernel/events/core.c
 index f0128c5ff278..e90a547d2fb2 100644
 --- a/kernel/events/core.c
 +++ b/kernel/events/core.c
 @@ -7596,7 +7596,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 
         pte = ptep_get_lockless(ptep);
         if (pte_present(pte))
 -               size = pte_leaf_size(pte);
 +               size = pmd_pte_leaf_size(pmd, pte);
         pte_unmap(ptep);
  #endif /* CONFIG_HAVE_GUP_FAST */

 

-- 
Oscar Salvador
SUSE Labs
