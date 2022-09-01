Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C95AA0EA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 22:30:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJXjr5w3Pz3bhf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 06:30:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EwoBt2tu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.121.223.63; helo=out1.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EwoBt2tu;
	dkim-atps=neutral
X-Greylist: delayed 341 seconds by postgrey-1.36 at boromir; Fri, 02 Sep 2022 06:30:08 AEST
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJXjD52l5z2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 06:30:08 +1000 (AEST)
Date: Thu, 1 Sep 2022 16:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662063855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xfsb9kRgUK3KweWYt2HkB9+K5WeFFKU/t1uaMQF6e7I=;
	b=EwoBt2tuIDzQpe0zDHZ4K8qS5db1PANOADoqffcU8P+/iVkNHTp86cWX3pwvwa2DFgQh5u
	Im6eJ+7gJM+y5opnx9fMMXpn/S+nGT9mGCUCLrWd0i2piG4AffrFRXWQQJY9/vf9181j3j
	tibjRQQp8XEaq3ZiXDdiK1JVzP09b80=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH RESEND 04/28] mm: move mmap_lock assert function
 definitions
Message-ID: <20220901202409.e2fqegqghlijkzey@moria.home.lan>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-5-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901173516.702122-5-surenb@google.com>
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

On Thu, Sep 01, 2022 at 10:34:52AM -0700, Suren Baghdasaryan wrote:
> Move mmap_lock assert function definitions up so that they can be used
> by other mmap_lock routines.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mmap_lock.h | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 96e113e23d04..e49ba91bb1f0 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -60,6 +60,18 @@ static inline void __mmap_lock_trace_released(struct mm_struct *mm, bool write)
>  
>  #endif /* CONFIG_TRACING */
>  
> +static inline void mmap_assert_locked(struct mm_struct *mm)
> +{
> +	lockdep_assert_held(&mm->mmap_lock);
> +	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);

These look redundant to me - maybe there's a reason the VM developers want both,
but I would drop the VM_BUG_ON() and just keep the lockdep_assert_held(), since
that's the standard way to write that assertion.
