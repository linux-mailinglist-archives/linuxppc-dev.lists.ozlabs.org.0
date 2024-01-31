Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E184B844161
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 15:09:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iSEHprF0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iSEHprF0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ3n05tvnz3cGS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 01:09:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iSEHprF0;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=iSEHprF0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 273 seconds by postgrey-1.37 at boromir; Thu, 01 Feb 2024 01:08:25 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ3m94mBBz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 01:08:25 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 993861FD26;
	Wed, 31 Jan 2024 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706710102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2QBlcBFQ70dBmJ1QalBIL8KQeMx+/Q9hcR6vftscUEI=;
	b=iSEHprF0INt/D7UKM9hRWvLJnUJagimTIPH9XzuELgAB5oBVBaanBUFxkrpQT+w3xSf7SP
	DdU0hYcxD6j2Zw59sBJlaE+3fR2GmmdLXjul6ib56FGi/8nY+CgfUucJ3Efw+KHMNaWLSF
	3IW7BlmrnYdSbybZBBS8j2jqjj8myAg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706710102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2QBlcBFQ70dBmJ1QalBIL8KQeMx+/Q9hcR6vftscUEI=;
	b=iSEHprF0INt/D7UKM9hRWvLJnUJagimTIPH9XzuELgAB5oBVBaanBUFxkrpQT+w3xSf7SP
	DdU0hYcxD6j2Zw59sBJlaE+3fR2GmmdLXjul6ib56FGi/8nY+CgfUucJ3Efw+KHMNaWLSF
	3IW7BlmrnYdSbybZBBS8j2jqjj8myAg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F67A139B1;
	Wed, 31 Jan 2024 14:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K5iYGlZUumVrEAAAD6G6ig
	(envelope-from <mhocko@suse.com>); Wed, 31 Jan 2024 14:08:22 +0000
Date: Wed, 31 Jan 2024 15:08:21 +0100
From: Michal Hocko <mhocko@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 0/9] mm/memory: optimize unmap/zap with PTE-mapped THP
Message-ID: <ZbpUVXa-Aujp6gWO@tiehlicka>
References: <20240129143221.263763-1-david@redhat.com>
 <4ef64fd1-f605-4ddf-82e6-74b5e2c43892@intel.com>
 <ee94b8ca-9723-44c0-aa17-75c9678015c6@redhat.com>
 <1fd26a83-8e6f-4b96-9d27-dd46de9488cc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fd26a83-8e6f-4b96-9d27-dd46de9488cc@arm.com>
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iSEHprF0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.04 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RL7kzhjumjg4a5c3mj7potudi1)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[26];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[redhat.com,intel.com,vger.kernel.org,linux-foundation.org,kvack.org,infradead.org,arm.com,kernel.org,linux.ibm.com,gmail.com,ellerman.id.au,csgroup.eu,arndb.de,lists.ozlabs.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.03)[54.97%]
X-Spam-Score: -1.04
X-Rspamd-Queue-Id: 993861FD26
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>, "Huang, Ying" <ying.huang@intel.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 31-01-24 10:26:13, Ryan Roberts wrote:
> IIRC there is an option to zero memory when it is freed back to the buddy? So
> that could be a place where time is proportional to size rather than
> proportional to folio count? But I think that option is intended for debug only?
> So perhaps not a problem in practice?

init_on_free is considered a security/hardening feature more than a
debugging one. It will surely add an overhead and I guess this is
something people who use it know about. The batch size limit is a latency
reduction feature for !PREEMPT kernels but by no means it should be
considered low latency guarantee feature. A lot of has changed since
the limit was introduced and the current latency numbers will surely be
different than back then. As long as soft lockups do not trigger again
this should be acceptable IMHO.

-- 
Michal Hocko
SUSE Labs
