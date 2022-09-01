Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC65AA0EB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 22:31:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJXkV1ybkz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 06:31:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xsaNXg6C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:2:aacc::; helo=out2.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xsaNXg6C;
	dkim-atps=neutral
X-Greylist: delayed 441 seconds by postgrey-1.36 at boromir; Fri, 02 Sep 2022 06:30:19 AEST
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJXjR1KVPz2yxG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 06:30:19 +1000 (AEST)
Date: Thu, 1 Sep 2022 16:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662063765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u0xu3/NRVBHMhSOs7YUmMQgOzAyvEoInn8uAGnxdBnc=;
	b=xsaNXg6ClTkia3N9XCApr+T7hOmEHqYeNBrhO//DyKKITB0Sngf4P/jvqL8CgjwQv0M9Rq
	ndURvyCQWXs3/iC9U9ZC29K0mosMU2lpgpleibzMM4+pr7N8WSZotbR5e8/06HczYiTuCm
	6zXrCs3c9F0nNmxW0qkBQKzpHYL8R48=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH RESEND 03/28] mm: introduce __find_vma to be used
 without mmap_lock protection
Message-ID: <20220901202239.tnnzlbermiyvkmih@moria.home.lan>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-4-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901173516.702122-4-surenb@google.com>
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

On Thu, Sep 01, 2022 at 10:34:51AM -0700, Suren Baghdasaryan wrote:
> Add __find_vma function to be used for VMA lookup under rcu protection.

So it was news to me that the rb tree code can be used for lockless lookups -
not having looked at lib/rbtree.c in over 10 years :) - I still think it should
be mentioned in the commit message that that's what you're doing and why it's
safe, because it's not exactly common knowledge and lockless stuff deserves
extra scrutiny.

Probably worth a comment, too.

Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>
