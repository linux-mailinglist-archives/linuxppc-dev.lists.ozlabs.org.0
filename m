Return-Path: <linuxppc-dev+bounces-9605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF25AE267E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jun 2025 01:33:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPDLR0qgRz30Pg;
	Sat, 21 Jun 2025 09:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750445635;
	cv=none; b=TOhsYlvC5H6RVRmf4+VUkS08vAy1v85st+fq1g8A1PqACI34G+GP5Qq12ABswgWH3mMr3R5d61SvrwV30bD8KmqOrvENisyK2wrURTu6PcPrXks27cgshncErbwTUkQuzNhzLOr7gC2kL17pVdkyI39hCZJZrwVXCjZTBlHaG/C5NqhPZkILLn27lCVsq2HczmdB+wz0OVi8Zx+pEIrCPpSzRSc6JX1rxjf4ESrJzWhrKzIQrNI32+uW4vbW1J390mus7aauZGDj2mwc+8QNZrMsXvbvHFtY+OoXzU/GN3jgKHi6pLxZcYGB2jx2KZoC1yDZ0YyCKPEcgcLVVmsZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750445635; c=relaxed/relaxed;
	bh=0TkWPg2eqT1+Wq/XA39xuKkI/6ymg24dNRTDXNGfR9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oju1sKQFC4aB2RGnv9vu228u3BzHFC90u9tbW70/dcVaGDKa4wFkSuyUkeCvJvRx5lbQ/pA3/M5cvzMmLHn6BQjvCeyqgSMT0bzDLklMif9dhTGH6spnF2IP3lmyGF9NBOljy3bbm3S3yNbZBHbgNMYfQXgaJx69loufdTwkFK1JsAXoPVExplblrWSUQ4N7ud/QsZtFMIY9DBIfOKTVjgo7FINEK2KK/GRlB49Ok518oYzcK7jvw8DGgYh0z1ito36O3VRoLu28pNcDlFG9ECqFtLTRJItIGPF32EqSqKVF8p44oeenoWQQLNP3gnJFcadejKzAGfsn6m/x2LFfmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wV33ZKmi; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iltBBPrt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wV33ZKmi; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iltBBPrt; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=pfalcato@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wV33ZKmi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iltBBPrt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wV33ZKmi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iltBBPrt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=pfalcato@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 408 seconds by postgrey-1.37 at boromir; Sat, 21 Jun 2025 04:53:53 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bP6813p2qz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jun 2025 04:53:53 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1721621165;
	Fri, 20 Jun 2025 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750445222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TkWPg2eqT1+Wq/XA39xuKkI/6ymg24dNRTDXNGfR9M=;
	b=wV33ZKmidBf6Y8tLbYUzp3ExOoEPuqaXGNO1YKfUzB3/w6kUbu02/maHt8FMnN4Da9PGMS
	f/xj59Z9f2sNOOQGQZwZXjlX5vxf16MTmKx0ZrujArItuct/44+QL2YYZZXq6No3336eam
	mNLTOl4uB7qph5v5nYSGBhagrx1l+yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750445222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TkWPg2eqT1+Wq/XA39xuKkI/6ymg24dNRTDXNGfR9M=;
	b=iltBBPrtxjj12CpwRx3h+WSbqrjS7pCaqKpa20FayEi0UZ3cdueWboT+A2rw9MX97i0kQZ
	Kwks5DiRHuYcBuAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wV33ZKmi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iltBBPrt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750445222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TkWPg2eqT1+Wq/XA39xuKkI/6ymg24dNRTDXNGfR9M=;
	b=wV33ZKmidBf6Y8tLbYUzp3ExOoEPuqaXGNO1YKfUzB3/w6kUbu02/maHt8FMnN4Da9PGMS
	f/xj59Z9f2sNOOQGQZwZXjlX5vxf16MTmKx0ZrujArItuct/44+QL2YYZZXq6No3336eam
	mNLTOl4uB7qph5v5nYSGBhagrx1l+yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750445222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TkWPg2eqT1+Wq/XA39xuKkI/6ymg24dNRTDXNGfR9M=;
	b=iltBBPrtxjj12CpwRx3h+WSbqrjS7pCaqKpa20FayEi0UZ3cdueWboT+A2rw9MX97i0kQZ
	Kwks5DiRHuYcBuAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8461B136BA;
	Fri, 20 Jun 2025 18:46:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y/tWHaKsVWgWFwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 20 Jun 2025 18:46:58 +0000
Date: Fri, 20 Jun 2025 19:46:56 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H . Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, nvdimm@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mm: change vm_get_page_prot() to accept vm_flags_t
 argument
Message-ID: <64r5sm2aqgphrs5t4vzzgz7qitn3efmxpxjzv4wsaeyuncrn56@tdu4z7uzxluq>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <a12769720a2743f235643b158c4f4f0a9911daf0.1750274467.git.lorenzo.stoakes@oracle.com>
 <20250619-unwiederholbar-addition-6875c99fe08d@brauner>
 <a21c59dd-5d2d-4cd2-a04d-63eec059f3c9@lucifer.local>
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
In-Reply-To: <a21c59dd-5d2d-4cd2-a04d-63eec059f3c9@lucifer.local>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1721621165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,davemloft.net,gaisler.com,linux.intel.com,linutronix.de,redhat.com,alien8.de,zytor.com,infradead.org,zeniv.linux.org.uk,suse.cz,nvidia.com,linux.alibaba.com,oracle.com,zte.com.cn,linux.dev,google.com,suse.com,surriel.com,intel.com,goodmis.org,efficios.com,ziepe.ca,suse.de,cmpxchg.org,bytedance.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,kvack.org,lists.linux.dev];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	R_RATELIMIT(0.00)[to_ip_from(RLziudqfrzo6b7hzgpxksh1d9i)];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 19, 2025 at 09:49:03AM +0100, Lorenzo Stoakes wrote:
> On Thu, Jun 19, 2025 at 10:42:14AM +0200, Christian Brauner wrote:
> > If you change vm_flags_t to u64 you probably want to compile with some
> > of these integer truncation options when you're doing the conversion.
> > Because otherwise you risk silently truncating the upper 32bits when
> > assigning to a 32bit variable. We've had had a patch series that almost
> > introduced a very subtle bug when it tried to add the first flag outside
> > the 32bit range in the lookup code a while ago. That series never made
> > it but it just popped back into my head when I read your series.
> 
> Yeah am very wary of this, it's a real concern. I'm not sure how precisely we
> might enable such options but only in this instance? Because presumably we are
> intentionally narrowing in probably quite a few places.
> 
> Pedro mentioned that there might be compiler options to help so I'm guessing
> this is the same thing as to what you're thinking here?

I was thinking about -Wnarrowing but sadly it seems that this is only for C++
code. Also MSVC is quite strict (even in C) when it comes to this stuff, so you
could also add MSVC support to the kernel, small task :P

One could in theory add support for this stuff in GCC, but I would expect it
to flag almost everything in the kernel (e.g long -> int implicit conversions).
> 
> I also considered a sparse flag, Pedro mentioned bitwise, but then I worry that
> we'd have to __force in a million places to make that work and it'd be
> non-obvious.

Here's an example for __bitwise usage taken from block:

typedef unsigned int __bitwise blk_insert_t;
#define BLK_MQ_INSERT_AT_HEAD		((__force blk_insert_t)0x01)


then in block/blk-mq.c:

	if (flags & BLK_MQ_INSERT_AT_HEAD)
		list_add(&rq->queuelist, &hctx->dispatch);


So doing regular old flag checks with the bitwise & operator seems to work fine.
Assignment itself should also just work. So as long as we're vm_flags_t-typesafe
there should be no problem? I think.

> 
> Matthew's original concept for this was to simply wrap an array, but that'd
> require a complete rework of every single place where we use VMA flags (perhaps
> we could mitigate it a _bit_ with a vm_flags_val() helper that grabs a u64?)
> 

I think the real question is whether we expect to ever require > 64 flags for
VMAs? If so, going with an array would be the best option here. Though in that
case I would guess we probably want to hide the current vm_flags member in
vm_area_struct first, providing some vm_flags_is_set() and whatnot.

-- 
Pedro

