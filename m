Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 63C718CCB03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 05:16:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YcGnkarf;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8seKvAx3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xo8J9aYV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nN513p3S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlCnY4xvgz78l9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 13:09:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YcGnkarf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8seKvAx3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xo8J9aYV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nN513p3S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlCmn0TVvz3gLG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 13:08:40 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDE2C1FDCE;
	Thu, 23 May 2024 03:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716433716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V0N0S6r8IeovFdxww9RN8WulP8rYDdid/w2zv2NcHlY=;
	b=YcGnkarfP7rAwvhiOINxsKMbHpbeoO5PLcP2+nhBTfDiy176wv+VbDX11CO6faQrg2kZ6B
	xmEWJFNLm4TqJ8NB5pQi4TQ4HlbCqxki0PZnYqRfn/1PGf2sp5uIgzPHi8DO5YYkntL13s
	/PoGuujuJZycBq23rlOpbta8wOEdouU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716433716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V0N0S6r8IeovFdxww9RN8WulP8rYDdid/w2zv2NcHlY=;
	b=8seKvAx34N9zbAbSXvZmX90nlXbI+J0lTECHG1ywHskkNPLTJeU0OCKKXM714nxIgCjOPv
	cAqnqxCS4rF9SjAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xo8J9aYV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nN513p3S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716433715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V0N0S6r8IeovFdxww9RN8WulP8rYDdid/w2zv2NcHlY=;
	b=xo8J9aYV2HvLfM1cXOQxHP9mc8VPZLhgd60GR2simJH6IFQTHl2BisCBQ80uUL+up4OfDt
	IKTrH+tCZw22ujA2Fz5M+WpPbZ4dxsWOe2MMd5DqaEBJJMod50MovReFjtWnyfWYgNWUhU
	Kp8Uhrbt/BtvEopATR1oY6dRnd4z+VU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716433715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V0N0S6r8IeovFdxww9RN8WulP8rYDdid/w2zv2NcHlY=;
	b=nN513p3S5maKAmTkBL5gb+fzrqAqgWdB+u8EK73ofQkChx9IgR8Rg6R7AxhnOx1vhmHiHn
	oIj72gUreXnNf5Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 948A813A6B;
	Thu, 23 May 2024 03:08:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id x4UfITKzTmZrEAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 23 May 2024 03:08:34 +0000
Date: Thu, 23 May 2024 05:08:29 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <Zk6zLRimo6Q6ZrwM@localhost.localdomain>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <Zj51rEwZeSK4Vr1G@x1n>
 <ZkPJCc5N1Eotpa4u@localhost.localdomain>
 <ZkPY4CSnZWZnxjTa@x1n>
 <ZkSMv31Cwx080no7@localhost.localdomain>
 <Zk5noUEYI4lknyJy@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zk5noUEYI4lknyJy@x1n>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,linux-foundation.org,kernel.org,alien8.de,csgroup.eu,linux.intel.com,redhat.com,zytor.com,gmx.de,hansenpartnership.com,nvidia.com,huawei.com,infradead.org,ellerman.id.au,linux.dev,linux.ibm.com,gmail.com,linutronix.de,vger.kernel.org,kvack.org,lists.ozlabs.org];
	R_RATELIMIT(0.00)[to_ip_from(RLeqp5gkuwhygrjzi4zhnnr4iu)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EDE2C1FDCE
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 22, 2024 at 05:46:09PM -0400, Peter Xu wrote:
> > Now, ProcessB still has the page mapped, so upon re-accessing it,
> > it will trigger a new MCE event. memory-failure code will see that this
> 
> The question is why accessing that hwpoison entry from ProcB triggers an
> MCE.  Logically that's a swap entry and it should generate a page fault
> rather than MCE.  Then in the pgfault hanlder we don't need that encoded
> pfn as we have vmf->address.

It would be a swap entry if we reach try_to_umap_one() without trouble.
Then we have the code that converts it:

 ...
 if (PageHWPoison(p))
         pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
	 set_{huge_}pte_at
 ...

But maybe we could only do that for ProcA, while ProcB failed to do that,
which means that for ProcA that is a hwpoisoned-swap-entry, but ProcB still
has this page mapped as usual, so if ProcB re-access it, that will not
trigger a fault (because the page is still mapped in its pagetables).


-- 
Oscar Salvador
SUSE Labs
