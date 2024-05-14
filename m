Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B08A8C5C59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 22:33:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B26BTArW;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1IRBTVc1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B26BTArW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1IRBTVc1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vf7Nn66rqz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 06:33:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B26BTArW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1IRBTVc1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B26BTArW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1IRBTVc1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 363 seconds by postgrey-1.37 at boromir; Wed, 15 May 2024 06:33:06 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vf7N263Yqz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 06:33:06 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 731611F8BF;
	Tue, 14 May 2024 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715718416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9yjxIwA1Fan6uISC9vU5afpsy0S0SjDWMQ82F600DAs=;
	b=B26BTArW7pLJtAbCnS8oHTPC4ZDZhEY+OSzSERTB3KdheXmHuHHbJerwugQ/S4xJqV7buD
	5mSzjHiXphrrAcFgozcOGhK+RBxF6kqZWb4uYjACars0BkL4RuLEL9E20b3DvyaNL2AxJJ
	kRt1K249Nnxyi7njIRMt1tqGOy8m4fE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715718416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9yjxIwA1Fan6uISC9vU5afpsy0S0SjDWMQ82F600DAs=;
	b=1IRBTVc1wBNIu6pO4byzhdDLYzRc7KSHpbB5c3jy4WMztCRTijmkU8eYjPHutAAcT0vUZ/
	V4wKrHrvTZFnLpAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=B26BTArW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1IRBTVc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715718416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9yjxIwA1Fan6uISC9vU5afpsy0S0SjDWMQ82F600DAs=;
	b=B26BTArW7pLJtAbCnS8oHTPC4ZDZhEY+OSzSERTB3KdheXmHuHHbJerwugQ/S4xJqV7buD
	5mSzjHiXphrrAcFgozcOGhK+RBxF6kqZWb4uYjACars0BkL4RuLEL9E20b3DvyaNL2AxJJ
	kRt1K249Nnxyi7njIRMt1tqGOy8m4fE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715718416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9yjxIwA1Fan6uISC9vU5afpsy0S0SjDWMQ82F600DAs=;
	b=1IRBTVc1wBNIu6pO4byzhdDLYzRc7KSHpbB5c3jy4WMztCRTijmkU8eYjPHutAAcT0vUZ/
	V4wKrHrvTZFnLpAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0DB3B1372E;
	Tue, 14 May 2024 20:26:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IIFZOw7JQ2YLHwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 14 May 2024 20:26:54 +0000
Date: Tue, 14 May 2024 22:26:49 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <ZkPJCc5N1Eotpa4u@localhost.localdomain>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <Zj51rEwZeSK4Vr1G@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zj51rEwZeSK4Vr1G@x1n>
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
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FREEMAIL_CC(0.00)[google.com,linux-foundation.org,kernel.org,alien8.de,csgroup.eu,linux.intel.com,redhat.com,zytor.com,gmx.de,hansenpartnership.com,nvidia.com,huawei.com,infradead.org,ellerman.id.au,linux.dev,linux.ibm.com,gmail.com,linutronix.de,vger.kernel.org,kvack.org,lists.ozlabs.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLeqp5gkuwhygrjzi4zhnnr4iu)];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 731611F8BF
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2024 at 03:29:48PM -0400, Peter Xu wrote:
> IMHO we shouldn't mention that detail, but only state the effect which is
> to not report the event to syslog.
> 
> There's no hard rule that a pte marker can't reflect a real page poison in
> the future even MCE.  Actually I still remember most places don't care
> about the pfn in the hwpoison swap entry so maybe we can even do it? But
> that's another story regardless..

But we should not use pte markers for real hwpoisons events (aka MCE), right?
I mean, we do have the means to mark a page as hwpoisoned when a real
MCE gets triggered, why would we want a pte marker to also reflect that?
Or is that something for userfaultd realm?

> And also not report swapin error is, IMHO, only because arch errors said
> "MCE" in the error logs which may not apply here.  Logically speaking
> swapin error should also be reported so admin knows better on why a proc is
> killed.  Now it can still confuse the admin if it really happens, iiuc.

I am bit confused by this.
It seems we create poisoned pte markers on swap errors (e.g:
unuse_pte()), which get passed down the chain with VM_FAULT_HWPOISON,
which end up in sigbus (I guess?).

This all seems very subtle to me.

First of all, why not passing VM_FAULT_SIGBUS if that is what will end
up happening?
I mean, at the moment that is not possible because we convolute swaping
errors and uffd poison in the same type of marker, so we do not have any
means to differentiate between the two of them.

Would it make sense to create yet another pte marker type to split that
up? Because when I look at VM_FAULT_HWPOISON, I get reminded of MCE
stuff, and that does not hold here.

 

-- 
Oscar Salvador
SUSE Labs
