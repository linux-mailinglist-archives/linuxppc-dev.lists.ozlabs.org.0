Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBE67D8BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 23:46:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2wmd1YrCz3fJ3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 09:46:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lXPZDhnK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2wlj46WVz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 09:45:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lXPZDhnK;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P2wlT4JJLz4xP9;
	Fri, 27 Jan 2023 09:45:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674773130;
	bh=XOKb+ncwVNSj6JKEiaBHvEDttpakjMycwDg9zTg++Is=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lXPZDhnKp+sd6gqb53jikb6eOO6odHtdILrgzMgKDSyLuMoDiBgRP+ELHuco2Pk5j
	 bExTu6/51nR17KrDBvMMVYYRMM2grTktq8Y19ZTAzOGve6zQ0RyaYuxJJU/ccYwlLq
	 VARaTKbguSWg8orJhovLaoxUEZ/5QmZ4v3DA+YJ3tYKHLpmDuiMv8TMcbVpE+OaslI
	 cN4ip7nvjhM/ywEx0AI/tTtnUKDaMxc8nsEcWchZvTI/jVdU5mh3Uk7y/gMUlLr/rh
	 I1ETMQKGU6oSz8J0oiWM1S5u/Qz57DHabOJzXwIqRnptofS40o/hs7F8nK2MOsp1A7
	 36j8Yufdy8jkw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Subject: Re: [PATCH v4 5/7] mm: replace vma->vm_flags indirect modification
 in ksm_madvise
In-Reply-To: <20230126193752.297968-6-surenb@google.com>
References: <20230126193752.297968-1-surenb@google.com>
 <20230126193752.297968-6-surenb@google.com>
Date: Fri, 27 Jan 2023 09:45:23 +1100
Message-ID: <87o7qkzzi4.fsf@mpe.ellerman.id.au>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Suren Baghdasaryan <surenb@google.com> writes:
> Replace indirect modifications to vma->vm_flags with calls to modifier
> functions to be able to track flag changes and to keep vma locking
> correctness.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c | 6 +++++-

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
