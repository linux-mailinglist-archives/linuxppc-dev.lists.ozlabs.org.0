Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573B5AA142
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 22:59:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJYLh2S1Wz30D1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 06:59:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GBx/osHm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:2:aacc::; helo=out2.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GBx/osHm;
	dkim-atps=neutral
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJYL32M1bz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 06:58:33 +1000 (AEST)
Date: Thu, 1 Sep 2022 16:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662065909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4hkUsmhoc/mtitBsMEKBISOd/1pAkSpFc2P/cfXQtjM=;
	b=GBx/osHm3HGi4Ds4wKNlfh+0rOeAjSc5fMxjCY9+prDg46Our7ah2+T4UCkEyoyjGAR3Ey
	DNyFdaH7yElNXaYOG7p+DGMlnJB29QeQAVtRk4yNGTDim3sXPR4Q5JwB92gpqpAdtQY8uE
	Z2Ok6tGIN+Dib9yzL+1nMDwaoBKyC1E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
Message-ID: <20220901205819.emxnnschszqv4ahy@moria.home.lan>
References: <20220901173516.702122-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 01, 2022 at 10:34:48AM -0700, Suren Baghdasaryan wrote:
> Resending to fix the issue with the In-Reply-To tag in the original
> submission at [4].
> 
> This is a proof of concept for per-vma locks idea that was discussed
> during SPF [1] discussion at LSF/MM this year [2], which concluded with
> suggestion that “a reader/writer semaphore could be put into the VMA
> itself; that would have the effect of using the VMA as a sort of range
> lock. There would still be contention at the VMA level, but it would be an
> improvement.” This patchset implements this suggested approach.
> 
> When handling page faults we lookup the VMA that contains the faulting
> page under RCU protection and try to acquire its lock. If that fails we
> fall back to using mmap_lock, similar to how SPF handled this situation.
> 
> One notable way the implementation deviates from the proposal is the way
> VMAs are marked as locked. Because during some of mm updates multiple
> VMAs need to be locked until the end of the update (e.g. vma_merge,
> split_vma, etc). Tracking all the locked VMAs, avoiding recursive locks
> and other complications would make the code more complex. Therefore we
> provide a way to "mark" VMAs as locked and then unmark all locked VMAs
> all at once. This is done using two sequence numbers - one in the
> vm_area_struct and one in the mm_struct. VMA is considered locked when
> these sequence numbers are equal. To mark a VMA as locked we set the
> sequence number in vm_area_struct to be equal to the sequence number
> in mm_struct. To unlock all VMAs we increment mm_struct's seq number.
> This allows for an efficient way to track locked VMAs and to drop the
> locks on all VMAs at the end of the update.

I like it - the sequence numbers are a stroke of genuius. For what it's doing
the patchset seems almost small.

Two complaints so far:
 - I don't like the vma_mark_locked() name. To me it says that the caller
   already took or is taking the lock and this function is just marking that
   we're holding the lock, but it's really taking a different type of lock. But
   this function can block, it really is taking a lock, so it should say that.
   
   This is AFAIK a new concept, not sure I'm going to have anything good either,
   but perhaps vma_lock_multiple()?

 - I don't like the #ifdef and the separate fallback path in the fault handlers.

   Can we make find_and_lock_anon_vma() do the right thing, and not fail unless
   e.g. there isn't a vma at that address? Just have it wait for vm_lock_seq to
   change and then retry if needed.
