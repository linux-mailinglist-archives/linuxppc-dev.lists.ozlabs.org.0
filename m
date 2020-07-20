Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606D226C62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 18:50:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9SQy3SpGzDqQr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 02:50:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=HXiT5Rdi; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9SL63SqgzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 02:46:34 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 4A2722C34AA;
 Mon, 20 Jul 2020 12:46:31 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id y8N1uMCN0ppf; Mon, 20 Jul 2020 12:46:30 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id CCD872C3619;
 Mon, 20 Jul 2020 12:46:30 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com CCD872C3619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1595263590;
 bh=qGPk0zNFwo5cVQw8ZAK/QyIsHyu6OZPMekpsDrpVWP0=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=HXiT5Rdi/FF5QIH6XZv4gJJ1Kju6lX5VX4hzPj+hydfPtz1E9pzRTxh8iaYZG2R73
 eg3S6CBN/N3CzdOA1wtGesnftvZPn/jreiYbon5BVt5Xo07uYCDrp3r6+T6NpduFg1
 +WaAaCvuMdvcOz7ILW26ZFzs7SSho+yUvlWOXk4X3/jZCbCPPaJVfE8ksX3ESVXYZy
 UJHjbMPAPdnxAbLqWKXe13jwyDGaE1j2dwhFeLRbe2rF5E+yQnFrtHCIHes82YNUuZ
 hMFVlmdcxzHjcByqw0tk6PQeH+vfVINABK0AxVRl9R/75dRRzYKUr7TbPkcu/OxiEL
 QX9rO3DoP+RtQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lJkhJIb6W00t; Mon, 20 Jul 2020 12:46:30 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id B98062C34A7;
 Mon, 20 Jul 2020 12:46:30 -0400 (EDT)
Date: Mon, 20 Jul 2020 12:46:30 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <2055788870.20749.1595263590675.JavaMail.zimbra@efficios.com>
In-Reply-To: <1595213677.kxru89dqy2.astroid@bobo.none>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <EFAD6E2F-EC08-4EB3-9ECC-2A963C023FC5@amacapital.net>
 <20200716085032.GO10769@hirez.programming.kicks-ass.net>
 <1594892300.mxnq3b9a77.astroid@bobo.none>
 <20200716110038.GA119549@hirez.programming.kicks-ass.net>
 <1594906688.ikv6r4gznx.astroid@bobo.none>
 <1314561373.18530.1594993363050.JavaMail.zimbra@efficios.com>
 <1595213677.kxru89dqy2.astroid@bobo.none>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Thread-Index: 9hzlA0XuD7jqnfPzlJuu2D9uF0Nx4Q==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, linux-mm <linux-mm@kvack.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 19, 2020, at 11:03 PM, Nicholas Piggin npiggin@gmail.com wrote:

> Excerpts from Mathieu Desnoyers's message of July 17, 2020 11:42 pm:
>> ----- On Jul 16, 2020, at 7:26 PM, Nicholas Piggin npiggin@gmail.com wrote:
>> [...]
>>> 
>>> membarrier does replace barrier instructions on remote CPUs, which do
>>> order accesses performed by the kernel on the user address space. So
>>> membarrier should too I guess.
>>> 
>>> Normal process context accesses like read(2) will do so because they
>>> don't get filtered out from IPIs, but kernel threads using the mm may
>>> not.
>> 
>> But it should not be an issue, because membarrier's ordering is only with
>> respect
>> to submit and completion of io_uring requests, which are performed through
>> system calls from the context of user-space threads, which are called from the
>> right mm.
> 
> Is that true? Can io completions be written into an address space via a
> kernel thread? I don't know the io_uring code well but it looks like
> that's asynchonously using the user mm context.

Indeed, the io completion appears to be signaled asynchronously between kernel
and user-space. Therefore, both kernel and userspace code need to have proper
memory barriers in place to signal completion, otherwise user-space could read
garbage after it notices completion of a read.

I did not review the entire io_uring implementation, but the publish side
for completion appears to be:

static void __io_commit_cqring(struct io_ring_ctx *ctx)
{
        struct io_rings *rings = ctx->rings;

        /* order cqe stores with ring update */
        smp_store_release(&rings->cq.tail, ctx->cached_cq_tail);

        if (wq_has_sleeper(&ctx->cq_wait)) {
                wake_up_interruptible(&ctx->cq_wait);
                kill_fasync(&ctx->cq_fasync, SIGIO, POLL_IN);
        }
}

The store-release on tail should be paired with a load_acquire on the
reader-side (it's called "read_barrier()" in the code):

tools/io_uring/queue.c:

static int __io_uring_get_cqe(struct io_uring *ring,
                              struct io_uring_cqe **cqe_ptr, int wait)
{
        struct io_uring_cq *cq = &ring->cq;
        const unsigned mask = *cq->kring_mask;
        unsigned head;
        int ret;

        *cqe_ptr = NULL;
        head = *cq->khead;
        do {
                /*
                 * It's necessary to use a read_barrier() before reading
                 * the CQ tail, since the kernel updates it locklessly. The
                 * kernel has the matching store barrier for the update. The
                 * kernel also ensures that previous stores to CQEs are ordered
                 * with the tail update.
                 */
                read_barrier();
                if (head != *cq->ktail) {
                        *cqe_ptr = &cq->cqes[head & mask];
                        break;
                }
                if (!wait)
                        break;
                ret = io_uring_enter(ring->ring_fd, 0, 1,
                                        IORING_ENTER_GETEVENTS, NULL);
                if (ret < 0)
                        return -errno;
        } while (1);

        return 0;
}

So as far as membarrier memory ordering dependencies are concerned, it relies
on the store-release/load-acquire dependency chain in the completion queue to
order against anything that was done prior to the completed requests.

What is in-flight while the requests are being serviced provides no memory
ordering guarantee whatsoever.

> How about other memory accesses via kthread_use_mm? Presumably there is
> still ordering requirement there for membarrier,

Please provide an example case with memory accesses via kthread_use_mm where
ordering matters to support your concern.

> so I really think
> it's a fragile interface with no real way for the user to know how
> kernel threads may use its mm for any particular reason, so membarrier
> should synchronize all possible kernel users as well.

I strongly doubt so, but perhaps something should be clarified in the documentation
if you have that feeling.

Thanks,

Mathieu

> 
> Thanks,
> Nick

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
