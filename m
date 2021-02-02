Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D530D053
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:35:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjPc4QSSzDwlH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:35:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=WQI9v3Fm; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVKMX4XvdzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 20:31:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9KzakhvbdvrVuIhJCaujo2BiN5IuFWAm6tV0NCLB24Q=; b=WQI9v3Fm+YGJL5PLHXu17b3K22
 RuE4J49J6OEbD5VOJtDDNX8J+nxknxSho7XSv0wKzrtz5CbKv4IUELjrmqWTGl24O9yh/iUa1MrJu
 sf5qftPGCUIFqrjbI3r5y1Pp1FxAQMZoJqSO8A0ZwFmIpx1/kgsopT5zDn7A55SSypQOR4CORQjar
 9fa7lWvlOC8S1H0VISKCVuCxvEm9FmduwfoWJqql7E8FFP145R9+IbtnXq75beFHh7yAV6gWlrDkM
 7GLyL0AZ1NJkL/xHJWf50KjJGZ5zw67ZToWpSTlsNsP72bxYZUAKWhci2Dy8smLhif9sweQykcOqR
 bqXrtItg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6s26-0001fV-Rv; Tue, 02 Feb 2021 09:31:39 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3E8E83003D8;
 Tue,  2 Feb 2021 10:31:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0BE1D299C9F56; Tue,  2 Feb 2021 10:31:32 +0100 (CET)
Date: Tue, 2 Feb 2021 10:31:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
Message-ID: <YBkb8yKSUKTPJvxk@hirez.programming.kicks-ass.net>
References: <20210131001132.3368247-1-namit@vmware.com>
 <20210131001132.3368247-12-namit@vmware.com>
 <YBfvh1Imz6RRTUDV@hirez.programming.kicks-ass.net>
 <1612247956.0a1r1yjmm3.astroid@bobo.none>
 <F1C67840-C62F-4583-8593-B621706034F6@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F1C67840-C62F-4583-8593-B621706034F6@vmware.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 02, 2021 at 07:20:55AM +0000, Nadav Amit wrote:
> Arm does not define tlb_end_vma, and consequently it flushes the TLB after
> each VMA. I suspect it is not intentional.

ARM is one of those that look at the VM_EXEC bit to explicitly flush
ITLB IIRC, so it has to.
