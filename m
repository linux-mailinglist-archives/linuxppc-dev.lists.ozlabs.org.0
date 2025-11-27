Return-Path: <linuxppc-dev+bounces-14527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD1BC8F822
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 17:26:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHMJP5b6gz2yrQ;
	Fri, 28 Nov 2025 03:26:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764260805;
	cv=none; b=KDggolJpQLgjzbM5PjrCcVzaUPKZGxtAti5c7hTLHtm8smKOZXCJGVfQRo7ZOlBv16EjsFW75tapfE5grAiwTa+C0K/UMW9ry/ozgTr8Qn85y5ZH7vY1UbzRwKTavByc2MTBcUPXwPmyKaFi+6Kufpb4ly7cXMosbRZ0E3jq5WDe1+Np0NeUD8Tdh96il4s9Xk3A9bh4Df6lgGJjmTvRauxgt+fbLlTPZYQJRWh5BFoDlvJIHP9OCUtKkXLicuQ3ec1oIJwyNVSsj/rjGsJG5tHagqo/UdrH+ZHTeCcwqzT5VFakZo6VElCAK756gdTvVW2nLnADkBZHQpFQUywzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764260805; c=relaxed/relaxed;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqjjxuyYP21R0ie5tnF5/v5/X3foyK3Y14xiTjo5F68ZBBVdzseBHl0MDFzAA8J1c+zRZWo1LBUMT2Iec8fbE3Ptyh7sCNznCOacizEkhIqWdbYiZz4kyTciQrug8Gqe6aEHePGRJsZMad3JkuIWizevGN+LpnAOMZmm6MXfmJnU5JQBOeC5uVo6wQLsYFAiCXRfDgnQyr3VKdfoJL4NF7dcY/btwJ3pa5i0AN+uUjf3rgcc4peciospWotoMJIcVsaa/mTyu8+a9cLw2+bKkXJJTQJyK9dB2B5IaIZAEPYG0685ltJY9l00kUCL5kY3U3rzu85+Pnu1rLy3GQZoPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZHiiaKMU; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yfppcghB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zEaMcsMO; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=i378ebTy; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=pfalcato@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZHiiaKMU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yfppcghB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zEaMcsMO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=i378ebTy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=pfalcato@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 20025 seconds by postgrey-1.37 at boromir; Fri, 28 Nov 2025 03:26:44 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHMJN2Wbdz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 03:26:44 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DBDA35BCD0;
	Thu, 27 Nov 2025 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764260796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	b=ZHiiaKMUmjNdWcVAx8mYcgTlMl1TOlhTMWZHQjR+94hOuoktlCF9vmt31KXPM4+AcFl+pM
	EQgq43Z+eyMXp1+L5gFoiJEpmRbbniA6s9GdZ1rmPu04VKmEjGTUMyqxUcB4zAZ5XtFJgp
	RojEOrR6fk/DRDLpX/+/5ENN40+0B+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764260796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	b=yfppcghBR1WbD5x+jBg3untex+AQq3wnFzjWFxXVpWHFw2mYcqeYp/H38fj1sxNVgS1Tt/
	LQjfOIwvDgidrnBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764260795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	b=zEaMcsMO1K/qzdMAPBBEFSsamoUnY7luJn2W4Su9EbhFLsy+LsjJb4eG4bRMTQ+zsek9le
	+0DPoFYxdw+c3R1+NwqBJZQXT1fWUIabhWrbGMgK5bu7ot2yykBkgkoPQpaDgCf7dNM0g2
	SM/dRSvFRjf6UO1K0wHfczBMDnnbqmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764260795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	b=i378ebTyzO87EOksHlUeGilkDnovXrO3fX9hNSy4tcFTkNCwjal395WIRU7eDS7gb4PIcX
	CKMGNmDhxrj2L1Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DDE43EA63;
	Thu, 27 Nov 2025 16:26:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pdD/A7h7KGnRfwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 27 Nov 2025 16:26:32 +0000
Date: Thu, 27 Nov 2025 16:26:30 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Oven Liyang <liyangouwen1@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Matthew Wilcox <willy@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ada Couprie Diaz <ada.coupriediaz@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <v-songbaohua@oppo.com>
Subject: Re: [RFC PATCH 1/2] mm/filemap: Retry fault by VMA lock if the lock
 was released for I/O
Message-ID: <kzwpwntmta4bpt27stif2hs5cwlu54kayfi34o562jpr2mjbew@h3ddkbxibxhf>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <20251127011438.6918-2-21cnbao@gmail.com>
 <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
 <CAGsJ_4xQKARuEuhrVuV+WmBC7+NCNd==Zi9nGmze5mfSjF1kdw@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4xQKARuEuhrVuV+WmBC7+NCNd==Zi9nGmze5mfSjF1kdw@mail.gmail.com>
X-Spam-Score: -7.80
X-Spam-Level: 
X-Spamd-Result: default: False [-7.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kvack.org,oppo.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,linutronix.de,redhat.com,alien8.de,zytor.com,oracle.com,suse.cz,google.com,suse.com,suse.de,renesas.com,uniontech.com,linux.dev,goodmis.org,bytedance.com,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,tencent.com,huaweicloud.com];
	R_RATELIMIT(0.00)[to_ip_from(RL3mhzhn45zpqpmgqn4z7synfm)];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oppo.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 07:39:11PM +0800, Barry Song wrote:
> On Thu, Nov 27, 2025 at 6:52 PM Pedro Falcato <pfalcato@suse.de> wrote:
> >
> > On Thu, Nov 27, 2025 at 09:14:37AM +0800, Barry Song wrote:
> > > From: Oven Liyang <liyangouwen1@oppo.com>
> > >
> > > If the current page fault is using the per-VMA lock, and we only released
> > > the lock to wait for I/O completion (e.g., using folio_lock()), then when
> > > the fault is retried after the I/O completes, it should still qualify for
> > > the per-VMA-lock path.
> > >
> > <snip>
> > > Signed-off-by: Oven Liyang <liyangouwen1@oppo.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > ---
> > >  arch/arm/mm/fault.c       | 5 +++++
> > >  arch/arm64/mm/fault.c     | 5 +++++
> > >  arch/loongarch/mm/fault.c | 4 ++++
> > >  arch/powerpc/mm/fault.c   | 5 ++++-
> > >  arch/riscv/mm/fault.c     | 4 ++++
> > >  arch/s390/mm/fault.c      | 4 ++++
> > >  arch/x86/mm/fault.c       | 4 ++++
> >
> > If only we could unify all these paths :(
> 
> Right, it’s a pain, but we do have bots for that?
> And it’s basically just copy-and-paste across different architectures.
> 
> >
> > >  include/linux/mm_types.h  | 9 +++++----
> > >  mm/filemap.c              | 5 ++++-
> > >  9 files changed, 39 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > index b71625378ce3..12b2d65ef1b9 100644
> > > --- a/include/linux/mm_types.h
> > > +++ b/include/linux/mm_types.h
> > > @@ -1670,10 +1670,11 @@ enum vm_fault_reason {
> > >       VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
> > >       VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
> > >       VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
> > > -     VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
> > > -     VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
> > > -     VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
> > > -     VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
> > > +     VM_FAULT_RETRY_VMA      = (__force vm_fault_t)0x000800,
> >
> > So, what I am wondering here is why we need one more fault flag versus
> > just blindly doing this on a plain-old RETRY. Is there any particular
> > reason why? I can't think of one.
> 
> Because in some cases we retry simply due to needing to take mmap_lock.
> For example:
> 
> /**
>  * __vmf_anon_prepare - Prepare to handle an anonymous fault.
>  * @vmf: The vm_fault descriptor passed from the fault handler.
>  *
>  * When preparing to insert an anonymous page into a VMA from a
>  * fault handler, call this function rather than anon_vma_prepare().
>  * If this vma does not already have an associated anon_vma and we are
>  * only protected by the per-VMA lock, the caller must retry with the
>  * mmap_lock held.  __anon_vma_prepare() will look at adjacent VMAs to
>  * determine if this VMA can share its anon_vma, and that's not safe to
>  * do with only the per-VMA lock held for this VMA.
>  *
>  * Return: 0 if fault handling can proceed.  Any other value should be
>  * returned to the caller.
>  */
> vm_fault_t __vmf_anon_prepare(struct vm_fault *vmf)
> {
> ...
> }
> 
> Thus, we have to check each branch one by one, but I/O wait is the most
> frequent path, so we handle it first.
>

Hmm, right, good point. I think this is the safest option then.

FWIW:
Acked-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro

