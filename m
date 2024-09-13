Return-Path: <linuxppc-dev+bounces-1341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAEB9784F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 17:34:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4yzC4NYnz2ywR;
	Sat, 14 Sep 2024 01:34:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726241671;
	cv=none; b=NbsKB4juYg93h1rCAaaMIiEHVi0u7dLrd2XgVNwacZWDQvQ17AnCvOjOdLUdVapfh7/p9kjyO2BcwycF/Q4RbRmsB56tgC+h+nJSX8gLx7u7iuxP24k9Y/H8VVMkkLYNf6go6qQbyQkhW4HObNhldw27fR39euzf2EO1E09KHJ/d9b0mJ3HVH4MerQ9QhOLF39GzrdhRHkYxuOTwF9/lhHj+x83MOO588YWuqnxzSlM456Vh071mlEWUPUjZ4l75M2LLRTuMKatVpnu87DRG1pBfKsGIa/Btjxm4jBMts+EVPInQfgtu/beJTRiv/Oz10ifocwRlptOcIYp7mnDTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726241671; c=relaxed/relaxed;
	bh=3TVavxKuaYJvx+VkOjM0uvwOk0nZ9PhNzNGaLnhBB5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6cxXu5F1h56ZMGDirVbozj2+aM703qYPb5qacga21QxkayKpMNTfXZDXTlwvuKk5ZADIcDCV+/lFdowIvUQ1kCFCSD6hSZ4u54bF6R0u/lilnV5PjMyfCR+TDc5VyXGgp39BTtmyYEVAXeX/GyBOZG6bMFbnv+LUoGN1L7KJGF8npJ071pzDHNATuWpfja3pxph6ArmX/sfuB/auXLq1GAB+JOJ6XPgxPykUslGXzMEkV6w5+DYTQjAj+OOVfVOfG4DiJih/Hh1ShHnD02QTcLm6+t0OSk6zF10QDub4tdlmBFQmcWatTUib65i99qd/F2QEDjA1ejwoV2eehH7Gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fvnRCFVH; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fvnRCFVH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4yzC2WLCz2ywM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 01:34:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6047CA44D54;
	Fri, 13 Sep 2024 15:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58843C4CEC0;
	Fri, 13 Sep 2024 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726241667;
	bh=aeBS/jexYN5ZGjpVm407B7hRMZZ4ukiBkzvptBAgJaU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fvnRCFVHGls2KVupkmqKoiiT6kDNtgpUr/OtlXRhNExNuQwj/1mVFgnCGu6RaHVN5
	 yImCV0xqRqSYRTa9WEA+G6dyWs7hKhAnshmW04/6UdqvfI1ZyEPv6myYvbZIPgzbLg
	 RaDUjFNXhcs8MG0e708PDLA25bqBQWChlPVii3HZYW72/c6lGzBGAJnxLSX/YMLpI8
	 9k38k21KExHymnbg6c/H0/mlbkb7dvWpnkHsi09iQz2zpXi7IuX+PtRbZiAWZB1TtJ
	 CqA4Q+iV2ZG0HIcpVu76xHsnZ2Jha/4JTDOnOOWMHG8pkc8Z/8DzdVi32zwqL8t5u6
	 woBDZts1VdL6g==
Date: Fri, 13 Sep 2024 08:34:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Mina Almasry <almasrymina@google.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913083426.30aff7f4@kernel.org>
In-Reply-To: <20240913204138.7cdb762c@canb.auug.org.au>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<20240913204138.7cdb762c@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 20:41:38 +1000 Stephen Rothwell wrote:
> I have bisected it (just using the net-next tree) to commit
> 
> 8ab79ed50cf10f338465c296012500de1081646f is the first bad commit
> commit 8ab79ed50cf10f338465c296012500de1081646f
> Author: Mina Almasry <almasrymina@google.com>
> Date:   Tue Sep 10 17:14:49 2024 +0000
> 
>     page_pool: devmem support
>     
> 
> And it may be pointing at arch/powerpc/include/asm/atomic.h line 200
> which is this:
> 
> static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
> {
>         s64 t;
> 
>         /* -mprefixed can generate offsets beyond range, fall back hack */
>         if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>                 __asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter))
> ;
>         else
>                 __asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
> 
>         return t;
> }
> 
> The second "asm" above (CONFIG_PPC_KERNEL_PREFIXED is not set).  I am
> guessing by searching for "39" in net/core/page_pool.s
> 
> This is maybe called from page_pool_unref_netmem()

Thanks! The compiler version helped, I can repro with GCC 14.

It's something special about compound page handling on powerpc64,
AFAICT. I'm guessing that the assembler is mad that we're doing
an unaligned read:

   3300         ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t

which does indeed look unaligned to a naked eye. If I replace
virt_to_head_page() with virt_to_page() on line 867 in net/core/page_pool.c
I get:

   2982         ld 8,40(10)      # MEM[(const struct atomic64_t *)_94].counter, t

and that's what we'd expect. It's reading pp_ref_count which is at
offset 40 in struct net_iov. I'll try to take a closer look at 
the compound page handling, with powerpc assembly book in hand, 
but perhaps this rings a bell for someone?

