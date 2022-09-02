Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9185B5AA909
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:44:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJqfv3XGVz301Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 17:44:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PnZijlpR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PnZijlpR;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJqfF2DMRz2y6M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 17:43:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OTkZ6uS66u1w+Hbm6TtejxpZoX4M4S5NPkBcQcAWCKc=; b=PnZijlpR1pOR1iufsipFUsPYmX
	wbuCNPHruLPvnd9YD9OGZaAbljCpwQ375yyM4LxLPNodHP7yyl8nCBECEYTFiQVqc4YVxSJ/V2dlh
	O/8jbSYyMnq7pIMy+I3eQIfZaErVmTLPipUltIDJnf+p51iDa+Z64wSxdGbbuLpDZVmryFk/FF5GN
	cP5Tu6T2zNfa688WKGMlX+v33GIJwYaMwjVzwszIeAy17yanlRL0xUsMQD41ZBgPm/IX3evr0bd8h
	t52Sf3vBachUsH2aTamhLXAmPGIVVmxbsmm6eJm2OoDfb4u1z/Ab3fdh7EznyK7iKAahKesRs1Ztw
	16OOfd2w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1KH-008c53-Ly; Fri, 02 Sep 2022 07:42:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9BFA230010B;
	Fri,  2 Sep 2022 09:42:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 793AE2B89F172; Fri,  2 Sep 2022 09:42:51 +0200 (CEST)
Date: Fri, 2 Sep 2022 09:42:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
Message-ID: <YxGz+3TT/J7u6H81@hirez.programming.kicks-ass.net>
References: <20220901173516.702122-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 01, 2022 at 10:34:48AM -0700, Suren Baghdasaryan wrote:
> This is a proof of concept for per-vma locks idea that was discussed
> during SPF [1] discussion at LSF/MM this year [2], which concluded with
> suggestion that “a reader/writer semaphore could be put into the VMA
> itself; that would have the effect of using the VMA as a sort of range
> lock. There would still be contention at the VMA level, but it would be an
> improvement.” This patchset implements this suggested approach.

The whole reason I started the SPF thing waay back when was because one
of the primary reporters at the time had very large VMAs and a per-vma
lock wouldn't actually help anything at all.

IIRC it was either scientific code initializing a huge matrix or a
database with a giant table; I'm sure the archives have better memory
than me.

