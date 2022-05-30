Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AF05373CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 06:04:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBMHk4tl0z3bsL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 14:04:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UCycBCGZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBMH55hm1z2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 14:04:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UCycBCGZ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LBMH50Q5zz4xD2;
	Mon, 30 May 2022 14:04:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653883457;
	bh=x0svsTO+jOFwH/KVWpk821pyzNznqc/zH685jsc3xAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UCycBCGZN4FwwG9NtPjTOTY9Z6WdyBcbaCY1PV8XmA12shhVCHuzIe5pdqh2qYFyk
	 PvtxE+XWmWXjkR889bgopN8vT1jB3UHEMi7kCJEHHylLZwHJy4YWI6hcRkKXK3da3R
	 kqDNRTvZol2gq/YWneJ5EK/RWA4uYCtAO1l2ZY3ixLtsy3wr87J4ZWsCsNQDfZ8MJk
	 qQTb9AyVIt7AFnTWq0hZOGBdZY0as/KlU0ZmYbT6HjW2OB2YKu0E8IB1/VqHkWB0z6
	 u6COQPyxQl+Wdp58uKjrK4Dj8FYXNKb93F/LQ7zUWabwIGqegG1utiF9qIwyF5SzSU
	 a+TD/72hO8qWA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
In-Reply-To: <20220527193936.30678-1-peterx@redhat.com>
References: <20220527193936.30678-1-peterx@redhat.com>
Date: Mon, 30 May 2022 14:04:12 +1000
Message-ID: <87mtezll8j.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Xu <peterx@redhat.com> writes:
> I observed that for each of the shared file-backed page faults, we're very
> likely to retry one more time for the 1st write fault upon no page.  It's
> because we'll need to release the mmap lock for dirty rate limit purpose
> with balance_dirty_pages_ratelimited() (in fault_dirty_shared_page()).
>
...

>  arch/powerpc/mm/copro_fault.c |  5 +++++
>  arch/powerpc/mm/fault.c       |  5 +++++

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
