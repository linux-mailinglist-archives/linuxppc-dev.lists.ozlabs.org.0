Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F3B197A55
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 13:04:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rV2v2vb2zDqjT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 22:04:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=OZGUqwQe; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rV104TlLzDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 22:02:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=OcosEihYBe+spE3GuKJaV12KeTRSak0CdVFTw4AqKfk=; b=OZGUqwQeHml5PPhx4r8PXY6gI0
 LirKSPJC9jI8tfla+5PAqPW141BlQiz4lDzHRtoF8rpGUF0f9W41P8ov5iWO9oNdsrLSKQa5Muk0b
 8i6mpo9afrmglqwsJqq4V4wHM4p7KPs8KrdsKnBrFUH/A4a7O3aV6z9beaC6NISngGm4eKQ5pYyFY
 bHm3Rt9RfWYPXemZJnkJGoWa9g1yLhmI7ZXrjbMvSlj8cuZxcC0dZbgj8ynULFSWfBBvfGV3ZGbTf
 XQHScF0orkNktNFPDwQrwJYUew+SN7vVlaORxLNjgbTkMy5hf8pdCLqXKg5yfLktUqvP/1O/Curu6
 3I7aEBWQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIsBe-0000m8-9P; Mon, 30 Mar 2020 11:02:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C2572303C41;
 Mon, 30 Mar 2020 13:02:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8EEDA203C0A2F; Mon, 30 Mar 2020 13:02:31 +0200 (CEST)
Date: Mon, 30 Mar 2020 13:02:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 1/1] ppc/crash: Skip spinlocks during crash
Message-ID: <20200330110231.GG20696@hirez.programming.kicks-ass.net>
References: <20200326222836.501404-1-leonardo@linux.ibm.com>
 <af505ef0-e0df-e0aa-bb83-3ed99841f151@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af505ef0-e0df-e0aa-bb83-3ed99841f151@c-s.fr>
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
Cc: Enrico Weigelt <info@metux.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leonardo@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 07:50:20AM +0100, Christophe Leroy wrote:
> 
> 
> Le 26/03/2020 à 23:28, Leonardo Bras a écrit :
> > During a crash, there is chance that the cpus that handle the NMI IPI
> > are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
> > will cause a deadlock. (rtas_lock and printk logbuf_log as of today)
> > 
> > This is a problem if the system has kdump set up, given if it crashes
> > for any reason kdump may not be saved for crash analysis.
> > 
> > Skip spinlocks after NMI IPI is sent to all other cpus.
> > 
> > Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/spinlock.h | 6 ++++++
> >   arch/powerpc/kexec/crash.c          | 3 +++
> >   2 files changed, 9 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> > index 860228e917dc..a6381d110795 100644
> > --- a/arch/powerpc/include/asm/spinlock.h
> > +++ b/arch/powerpc/include/asm/spinlock.h
> > @@ -111,6 +111,8 @@ static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
> >   static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
> >   #endif
> > +extern bool crash_skip_spinlock __read_mostly;
> > +
> >   static inline bool is_shared_processor(void)
> >   {
> >   #ifdef CONFIG_PPC_SPLPAR
> > @@ -142,6 +144,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
> >   		if (likely(__arch_spin_trylock(lock) == 0))
> >   			break;
> >   		do {
> > +			if (unlikely(crash_skip_spinlock))
> > +				return;
> 
> You are adding a test that reads a global var in the middle of a so hot path
> ? That must kill performance. Can we do different ?

This; adding code to a super hot patch like this for an exceptional case
like the crash handling seems like a very very bad trade to me.

One possible solution is to simply write 0 to the affected spinlocks
after sending the NMI IPI thing, no?
