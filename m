Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 363D4844172
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 15:10:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WLhYD4V/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WLhYD4V/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ3pj0Ypcz3cTT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 01:10:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WLhYD4V/;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WLhYD4V/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ3nx52y2z2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 01:09:57 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E1AE41FB8A;
	Wed, 31 Jan 2024 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706709827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m2cxDnakp497+YroEa+q5vx8Sh99BmyBojVBJFGfpzs=;
	b=WLhYD4V/x/UZrHhY+6rCUJyqgymCrrsKeuLtGDQJmSHaoC3k23j7X0NG3vOMfDtXnIsMtY
	jZ5h10f3ZWcsECbVFDV7u/QcfFFmgBDZc+aS1k+0Rtk506F6YwOW9pHPE/hJ/vKoBvOmPc
	ryDw7jWI4W009OBH2S6hA4+jm0itigA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706709827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m2cxDnakp497+YroEa+q5vx8Sh99BmyBojVBJFGfpzs=;
	b=WLhYD4V/x/UZrHhY+6rCUJyqgymCrrsKeuLtGDQJmSHaoC3k23j7X0NG3vOMfDtXnIsMtY
	jZ5h10f3ZWcsECbVFDV7u/QcfFFmgBDZc+aS1k+0Rtk506F6YwOW9pHPE/hJ/vKoBvOmPc
	ryDw7jWI4W009OBH2S6hA4+jm0itigA=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDC6F1347F;
	Wed, 31 Jan 2024 14:03:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mJp5LENTumVaDwAAD6G6ig
	(envelope-from <mhocko@suse.com>); Wed, 31 Jan 2024 14:03:47 +0000
Date: Wed, 31 Jan 2024 15:03:47 +0100
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/9] mm/memory: optimize unmap/zap with PTE-mapped THP
Message-ID: <ZbpTQ80ebCUnAXW0@tiehlicka>
References: <20240129143221.263763-1-david@redhat.com>
 <4ef64fd1-f605-4ddf-82e6-74b5e2c43892@intel.com>
 <ee94b8ca-9723-44c0-aa17-75c9678015c6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee94b8ca-9723-44c0-aa17-75c9678015c6@redhat.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_RATELIMIT(0.00)[to_ip_from(RLmz57jmx331iqhbrcj9q94ym8)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_TWELVE(0.00)[26];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,linux-foundation.org,kvack.org,infradead.org,arm.com,kernel.org,linux.ibm.com,gmail.com,ellerman.id.au,csgroup.eu,arndb.de,lists.ozlabs.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[28.90%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.40
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
Cc: Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>, "Huang, Ying" <ying.huang@intel.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Yin Fengwei <fengwei.yin@intel.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 31-01-24 11:16:01, David Hildenbrand wrote:
[...]
> This 10000 pages limit was introduced in 53a59fc67f97 ("mm: limit mmu_gather
> batching to fix soft lockups on !CONFIG_PREEMPT") where we wanted to handle
> soft-lockups.

AFAIR at the time of this patch this was mostly just to put some cap on
the number of batches to collect and free at once. If there is a lot of
free memory and a large process exiting this could grow really high. Now
that those pages^Wfolios can represent larger memory chunks it could
mean more physical memory being freed but from which might make the
operation take longer but still far from soft lockup triggering.

Now latency might suck on !PREEMPT kernels with too many pages to
free in a single batch but I guess this is somehow expected for this
preemption model. The soft lockup has to be avoided because this can
panic the machine in some configurations.

-- 
Michal Hocko
SUSE Labs
