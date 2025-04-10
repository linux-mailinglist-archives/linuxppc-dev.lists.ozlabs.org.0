Return-Path: <linuxppc-dev+bounces-7574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABFAA84FC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 00:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYZhk6kNtz2yqg;
	Fri, 11 Apr 2025 08:47:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744325270;
	cv=none; b=DXUGten37E0twDNghxjz7WWbZaBnGFIjpfUhpBg5VaBGdVQqZu7cxTEIW0bzOuembKTCVKDbKgtCJ7kDkfYdC43xN4Gp8sl03ikcgVKbvfV2/xdBWK8cINxZKVxVYq/no2TA5zLrjTN9GaRR0kTVK3J8cKLlkq3njH6MRDEDb+atvXJ5snHExlHrye9fH/zfIBjH6wCrUzCNu0fh1Xfr3IkhY6DFgQEUJ4wjZDDaq0uI7kluLCgfo90RyrLW4twce5AoIzWzcfCZk0YhVIpOjVZuHxQ3FC8T8hmqcrqnb+7Dof9sca0gF16kozE+1DN1cDKI7v2DRVa5jy18rMf/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744325270; c=relaxed/relaxed;
	bh=mKGFsXFSEGLlZrxlkNnTEo+qoxhnMzubzSSSxgn0fyc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FD3WvFjcM/h180+9rFJGeUgY18jrPEDo622FfO3oKbIrkgdBDgBnxLEfbJ6jKABYE4sgNfE6EzQtnnX2F1MqC97ux29inXzoPajlUVTOKlPlTqlyLj5ih7B0yQYSqIrSJNAZPUwUaQz1Brq8WMgcRIjqhda7aBJbvJjJQ7BrG4BZfYpVVxV2ntRv7bn1qmbX8ZGXj3srD/kM/zZKsBLYCHPeZ9/ASFeAc9QeEVCyrTvWQUmUnZqf7zCdiPUkD2WbvN1nkyz4ed2eTOdmQZFtRzV1+7S0u1JCbRhFw/e74WN57smXxJRBeAoIzX3d4O0itzbhhiY0n4jJ/nw/BZhnWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=e6xef16q; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=e6xef16q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYZhj57jGz2yqd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 08:47:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B03A260008;
	Thu, 10 Apr 2025 22:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DF3C4CEDD;
	Thu, 10 Apr 2025 22:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744325266;
	bh=1tnfPuvkdBHhkMd126G0IxK9k3gsj3KHkqYbgp6rqwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e6xef16qlSCuaWmvesXMrxudpX3PdJoqdNQrXzsVNJrRRrc/hIgkchadNM34Ppb4j
	 YRP22ogIXwogTnAqDkh7D1n1YtKcQftorM0XAqg0S2/V4Yun6qCg+vGECTW9UKKua2
	 l9Tu9D3P64Os0dK/iz7clScFQuOJTR8wIZOF5Qj8=
Date: Thu, 10 Apr 2025 15:47:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hugh Dickins
 <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>, Jeremy Fitzhardinge
 <jeremy@goop.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm: Protect kernel pgtables in
 apply_to_pte_range()
Message-Id: <20250410154744.44991b2abe5f842e34320917@linux-foundation.org>
In-Reply-To: <Z/fauW5hDSt+ciwr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744128123.git.agordeev@linux.ibm.com>
	<ef8f6538b83b7fc3372602f90375348f9b4f3596.1744128123.git.agordeev@linux.ibm.com>
	<Z/fauW5hDSt+ciwr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 10 Apr 2025 16:50:33 +0200 Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> On Tue, Apr 08, 2025 at 06:07:32PM +0200, Alexander Gordeev wrote:
> 
> Hi Andrew,
> 
> > The lazy MMU mode can only be entered and left under the protection
> > of the page table locks for all page tables which may be modified.
> 
> Heiko Carstens noticed that the above claim is not valid, since
> v6.15-rc1 commit 691ee97e1a9d ("mm: fix lazy mmu docs and usage"),
> which restates it to:
> 
> "In the general case, no lock is guaranteed to be held between entry and exit
> of the lazy mode. So the implementation must assume preemption may be enabled"
> 
> That effectively invalidates this patch, so it needs to be dropped.
> 
> Patch 2 still could be fine, except -stable and Fixes tags and it does
> not need to aim 6.15-rcX. Do you want me to repost it?

I dropped the whole series - let's start again.

