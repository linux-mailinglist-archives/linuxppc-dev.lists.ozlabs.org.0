Return-Path: <linuxppc-dev+bounces-14947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B79F0CD7DEF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 03:31:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZzX45J2Mz2yF1;
	Tue, 23 Dec 2025 13:31:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766457060;
	cv=none; b=S9Y58k1RnkYvCjMTYGr7bcnOAyW2TZQXO/3lk0vt+VFLmjg9sspuTiJzvsNHma/Cnqsky0S3CLGtc70xcv+l3aGPo1NJojSlzc0QR5AaLwJngpsFWVpv7BQrEdVNHUT29TdUxwC9rkPH/2p1r1Hz59EMS030xtEuNSOgAWsqWrp2l0eIGNdGfOh496qknxI6zHVlv8o5mdoF8wMIRT/TD68CQSPvzT9UUGFHsyDpfpWZ4uuxULtDzppnqZl4w3x28F2Eznee2b+Qm/TWS9+e+HhuTM0c2mTpe3QNrRWvWdOj4RGaq6m9aqkUOUKMP1RH3a/tLTyQcvuJgXdg5zCqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766457060; c=relaxed/relaxed;
	bh=1Mu9nbMnGhSASaY3bN8+eYi3nCdJ0EK5/7Jtn21L86E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mrTntEw6RHWLVqEkW/WVFRPM28zaxedKN1O1LDAbW9hZ5DhkGVoezaQED/Fpzp0a+8swVynKIf2RP/N5hn2VKucBUiKCOfuRHHZJEzYyWnh9TPXBa5t6tdpJXFhOmwBVbgfvGSIIgzh6dAmSnuxvKe/l7xiRBYQTDPYB1T348Sm5CoPKH4jxgShgQZs8DgLbUm+RbUa2e2eYxxNNeZ/W4Td1LA0txR0DFl7OApo6p9xztrFhFx3PS8a/AoBh71yw/IjVGm3Z7SerjXs674WTpIPSx6OeX6swbBP6ORopqgu0IHppqO8nkJTWyJ1kV4B+GDRKVP5M+IUbvghZNlXi4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=1QL8f41R; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=1QL8f41R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZzX33dTLz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 13:30:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72C3940711;
	Tue, 23 Dec 2025 02:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23ABC4CEF1;
	Tue, 23 Dec 2025 02:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766457056;
	bh=EGu5F46cvREoMWotC8TtqKlUedKHHiCD44Ca991/ZQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1QL8f41Rcexjp5HR46WOg9kxNLNocZNvvEbYU/Auokx8zqa8xA3O5RiDLBnxGF9E4
	 y/C4Lqpm2r02rxa6co5a+BWXUIOB+8WAgimhq2VUTMXekY8F7nwfHvPj/swOESZT8s
	 NHNWrvdZfY2vDa1FW8ZegBx08PWoBohUIHQY3dNI=
Date: Mon, 22 Dec 2025 18:30:55 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: SeongJae Park <sj@kernel.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Borislav
 Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador
 <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik
 <gor@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-Id: <20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
In-Reply-To: <20251223013045.4579-1-sj@kernel.org>
References: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
	<20251223013045.4579-1-sj@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 22 Dec 2025 17:30:44 -0800 SeongJae Park <sj@kernel.org> wrote:

> On Sun, 21 Dec 2025 10:49:07 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Sun, 21 Dec 2025 10:22:44 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
> > 
> > > > 
> > > > My main concern was -
> > > > A fixes tag means it might get auto backported to stable kernels too,
> > > 
> > > Not in the MM world -- IIRC. I think there is the agreement, that we 
> > > decide what should go into stable and what not.
> > > 
> > > Andrew can correct me if my memory is wrong.
> > 
> > Yes, -stable maintainers have been asked to only backport patches where
> > the MM developers asked for that, with cc:stable.  There may be
> > slipups, but as far as I know this is working.
> > 
> > I don't actually know how they determine which patches need this
> > special treatment.  Pathname?  Signed-off-by:akpm?
> 
> I guess it is pathname, based on ignore_list file [1] of stable-queue repo.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16
> 

Oh, that's a bit sad.

- other trees sometimes mess with mm/ and they probably aren't aware
  that they need an explicit cc:stable.

- misses drivers/block/zram and probably various other things that
  the MM team maintains.

Oh well, I guess simple mm/* coverage is good enough.  But I do worry a
little that useful fixes coming into mm/ via other trees without
cc:stable will get missed.


