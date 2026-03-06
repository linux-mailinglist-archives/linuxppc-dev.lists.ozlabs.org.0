Return-Path: <linuxppc-dev+bounces-17803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIKuC/q2qml9VgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 12:14:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8B921F7D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 12:14:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS3gn53z8z3c5f;
	Fri, 06 Mar 2026 22:13:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772795637;
	cv=none; b=ISTNrJKfaIsy3kNCOH9wopbkvycPHch9p62GMTXjPTpgPiQB9nB16Q3Ja2vNmBJyQEw7x+uIU5eLp2nxof+BmUWfR6nDDzyM8ip2T6zPieWw4cg+CTOqqZP4NnyWcVu5HY1EZD42H5VBtKn0q4O6Hda9Z1DkkRP0uIRXtTari51HVftJMgdlJBbjhn+NtA07FP9kSFYM7joio+rt/Vh8KNA0wLlPQQPjmWyFv/OgjHLNEE8/7tX2WtlAcqS4l1y4LhP47YG2RDkWBHRp2EttitlyESPxbxlArR3lBp1lOR+Wethqgh8bFYcpzt6Fun6AhhfUe5KfCMRh5nK8tqCOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772795637; c=relaxed/relaxed;
	bh=MFDy3mPH4NjmVrHKBxbSgKTS73hgxOdxEWk4nSkOndU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF2rZQbhB438pGiqgUTIxLr7Ck8i4+Yzbv91R8l/cymLHjH0sOzGxfR5UP1F0gmtndejma4rM3s6XcN5UXhyUis/lr1Pd+BshHEWxUlJECW85udwvb9aBy9avvb85v33DHOXQ5/B5Csy8LdWzd8ZZDYQu/n+4tAPqdP0bEHG8mEv7gp5+Zkmxhkvsd0lOBtDJKQfDgcvjFSgFWMR3xP93kslipeoorN4lH8k5RPLAfJFgWCvsNfDoNP/c40It94lWQBZR6DiRqIO+GYVFlx7psc5e66624coSf+7ky8KBQLcXMdV69VND+8ibva8qQQ0UX0tTXS4jYKUGQu0CDV26Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vL4DUgk0; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bYCXQtON; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m55eivUy; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vyBaWIVr; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=pfalcato@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vL4DUgk0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bYCXQtON;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m55eivUy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vyBaWIVr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=pfalcato@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS3gm1D2Dz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 22:13:56 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D2AB23E732;
	Fri,  6 Mar 2026 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772795625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MFDy3mPH4NjmVrHKBxbSgKTS73hgxOdxEWk4nSkOndU=;
	b=vL4DUgk0v/L/3CUv9SxUSaftBMk8NhHHABnsXjxDGcCdoH1oiTD/xz+/I/n3MdV7ToXXIx
	V8LiVrJoNauf/tg8ZoStpt1VJSU3xf+KKl3dNgjkNEvMXD04W3qhCGUMVVUaYjQWICuYZz
	Mz71Na2lz2x0yWejULElNR4Q1tKWyXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772795625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MFDy3mPH4NjmVrHKBxbSgKTS73hgxOdxEWk4nSkOndU=;
	b=bYCXQtON6yDnKmZ3aKuWDpdKv4t7vJ7xTNt+IexnRe+Ai1tbt+5s14elVSQ3PM3GomXNkl
	qNKs1ulOf4eyAODg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772795624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MFDy3mPH4NjmVrHKBxbSgKTS73hgxOdxEWk4nSkOndU=;
	b=m55eivUyjBSUSCnbe+niTSegT7FmMA9p+gLBFl5TEKQ0mZg0c8I93cLkT16KprZTKSuC8n
	bWWLvdgME0995C3y5ZPeqf0FDWtJ+BSvXxtTGmAaVS5j+q//F6lCHTzZmUyCg24uGJ6ftJ
	JIU+zwNFr0QmjWJcc4edouVMk6d69b8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772795624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MFDy3mPH4NjmVrHKBxbSgKTS73hgxOdxEWk4nSkOndU=;
	b=vyBaWIVr/wdi4MydAjPdePLE4DZi9z/doIFgj4j6TJS5Pu0eviD2WccjGLJl1xAT1kwMcy
	GxF6WXoRQH9KU4CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8045C3EA75;
	Fri,  6 Mar 2026 11:13:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sNnrG+e2qmkkaAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 06 Mar 2026 11:13:43 +0000
Date: Fri, 6 Mar 2026 11:13:41 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 0/4] mm: move vma_(kernel|mmu)_pagesize() out of
 hugetlb.c
Message-ID: <4rzf46kw6hq3b5ivv7cvgyza4yfrvk2shrncytobabxef644nm@wzu2bw63co37>
References: <20260306101600.57355-1-david@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306101600.57355-1-david@kernel.org>
X-Spam-Score: -7.80
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 5A8B921F7D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.ozlabs.org,linux-foundation.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,linux.dev,suse.de,oracle.com,google.com,suse.com,redhat.com,intel.com];
	TAGGED_FROM(0.00)[bounces-17803-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pbonzini@redhat.com,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pfalcato@suse.de,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:15:56AM +0100, David Hildenbrand (Arm) wrote:
> Looking into vma_(kernel|mmu)_pagesize(), I realized that there is one
> scenario where DAX would not do the right thing when the kernel is
> not compiled with hugetlb support.
> 
> Without hugetlb support, vma_(kernel|mmu)_pagesize() will always return
> PAGE_SIZE instead of using the ->pagesize() result provided by dax-device
> code.
> 
> Fix that by moving vma_kernel_pagesize() to core MM code, where it belongs.
> I don't think this is stable material, but am not 100% sure.
> 
> Also, move vma_mmu_pagesize() while at it. Remove the unnecessary hugetlb.h
> inclusion from KVM code.
> 
> Cross-compiled heavily.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jann Horn <jannh@google.com>
> Cc: Pedro Falcato <pfalcato@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Dan Williams <dan.j.williams@intel.com>

Although we all love less mail, FYI it seems like this didn't work properly
for the patches (no CC's on there).

Did you try git-email --cc-cover?

-- 
Pedro

