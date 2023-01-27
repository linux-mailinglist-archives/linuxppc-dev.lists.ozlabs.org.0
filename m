Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A4B67F23F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:28:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3YfP4gLKz3fKK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 10:28:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZpNA9pM7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3YdM0753z3fGx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 10:27:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vihkrb/8ANYH1iNq91cTcIbYX7mO3m/5JUyTib5RU5Y=; b=ZpNA9pM7rggKdAVK5gNlhc+sqr
	01/yb2KQYHe6I0NkLIx6BEvNI8ay8afAm7heB8PJvmd95lyUpT/T0QijDh0j6UxOkdP6aXbKlXUL4
	PzR+wk6qMZKvfPA0cZVX2jLjNnOz+pJlrxw3cfiFLJS5MjzL/AhhdAujmZu+BWxTaLFQ4VsFS5Wfc
	CQKJ4gesuFMUJC03n5N6MeeoXRdYZbEsx+/bHN5Tx16+41owCj6ekkrhHuZJ5S2xXlBUtA5XYqtZh
	EeFR5zlhwHlFQnn2Wx0v/cuyb8DUliBuurHPCmE5mhYJpg4ym3huRP1QyGuSBpgiwrlwo/j/+s+Xl
	2Vqh0F0g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLY6t-0088UT-Lz; Fri, 27 Jan 2023 23:26:19 +0000
Date: Fri, 27 Jan 2023 23:26:19 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 00/33] Per-VMA locks
Message-ID: <Y9Rdmy5h2F1z5yR3@casper.infradead.org>
References: <20230127194110.533103-1-surenb@google.com>
 <20230127145138.8cc44bf00ebf289dffec0975@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230127145138.8cc44bf00ebf289dffec0975@linux-foundation.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 27, 2023 at 02:51:38PM -0800, Andrew Morton wrote:
> On Fri, 27 Jan 2023 11:40:37 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> 
> > Per-vma locks idea that was discussed during SPF [1] discussion at LSF/MM
> > last year [2], which concluded with suggestion that “a reader/writer
> > semaphore could be put into the VMA itself; that would have the effect of
> > using the VMA as a sort of range lock. There would still be contention at
> > the VMA level, but it would be an improvement.” This patchset implements
> > this suggested approach.
> 
> I think I'll await reviewer/tester input for a while.
> 
> > The patchset implements per-VMA locking only for anonymous pages which
> > are not in swap and avoids userfaultfs as their implementation is more
> > complex. Additional support for file-back page faults, swapped and user
> > pages can be added incrementally.
> 
> This is a significant risk.  How can we be confident that these as yet
> unimplemented parts are implementable and that the result will be good?

They don't need to be implementable for this patchset to be evaluated
on its own terms.  This patchset improves scalability for anon pages
without making file/swap/uffd pages worse (or if it does, I haven't
seen the benchmarks to prove it).

That said, I'm confident that I have a good handle on how to make
file-backed page faults work under RCU.
