Return-Path: <linuxppc-dev+bounces-4801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3CA05326
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 07:26:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSdHM1n8Dz3029;
	Wed,  8 Jan 2025 17:26:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736317615;
	cv=none; b=H/E1xfl9tZCjLvXIfm5rWNcIetMUBeTA4eIgEaNXuoIvS5msDmKqEjLY32hmZAY/285QL+0hmkvjxHyq5ICGs+qPYqbX9KFj/9/DyytRc0FVrKVBOhmQ/HAX1Eqkh/0GVI+i60yLW95pithea+X5NydOg4/ATu3V/L9E88fHVFLNVfnpfWsW1DR4+C2qq/KAJCzX0JH+Y3i+CK9PEToBQPCg0PHbwU793Qw3W+uKJ3JNafIEmSPXTBXsjucy0e5hk5TsvfA9VJnStxT7mx5iYaEPQ8pr0r+pX2y9/4NvxqEsL4OgUBfKxnW8zsdGhbCMqJU3H/zvYPn/99i1vg4tSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736317615; c=relaxed/relaxed;
	bh=/LNvrIzo+npvfznW/iXVwt2s9BNL0jx/BmS8TasxDnA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U4sgVKnTODXpi0fXNKYS7f5Ly26NNkmVTUXkNQQaGKmLUnJH/+htCRsDHiAtNjMRsiEW1bMnEpWLa1duAwEdIW5GB9HiQTPqdcslT6/jwyRU7kQJ61o5nApv/lSnQ+rsmYHnbPnByBCdRZnaUar4NqItDmhqcHkFleAN3hURFP31fmLataYT8MXe+RBKZpoBHdLrn1BcjiAh4XON4nNKtMdp5JPcGngO+eJF7q8Y6L5tXqlXFGGJoPDgYuveWabD8d9pSxKPTYxzlE+oITpF1J/EwHhuxA8eNXKmPoU8usHfkS2issYfrMfaFBTt2wGePJxikoSgmnXVisFJjduiew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=yV3mq70N; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=yV3mq70N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSdHL05CFz300g
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 17:26:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 405F4A40443;
	Wed,  8 Jan 2025 06:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75956C4CED0;
	Wed,  8 Jan 2025 06:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736317605;
	bh=ictVswVJ4mGv9GZMqt9hcwWRjSa3QIhF5THgyv+dfIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yV3mq70NowsKzsNN4Ez+jnFDFJRIlhbNscdaUiVTLxZRecRmCbvgybiz9uRsrgg0n
	 PjP3lsjSFoN3ZHe8QI2pdayWSJuwfonJJuwBr3DLAHViSi3MWsPfptWuWaWljJtEVC
	 tmLb8vkj5Dj4ezW3MMOW7Coe5YQtHTHUai0uWSDo=
Date: Tue, 7 Jan 2025 22:26:43 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
Subject: Re: [PATCH v5 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
Message-Id: <20250107222643.80d5509219d6b66c15b1b8af@linux-foundation.org>
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue,  7 Jan 2025 14:42:16 +1100 Alistair Popple <apopple@nvidia.com> wrote:

> Device and FS DAX pages have always maintained their own page
> reference counts without following the normal rules for page reference
> counting. In particular pages are considered free when the refcount
> hits one rather than zero and refcounts are not added when mapping the
> page.
> 
> Tracking this requires special PTE bits (PTE_DEVMAP) and a secondary
> mechanism for allowing GUP to hold references on the page (see
> get_dev_pagemap). However there doesn't seem to be any reason why FS
> DAX pages need their own reference counting scheme.
> 
> By treating the refcounts on these pages the same way as normal pages
> we can remove a lot of special checks. In particular pXd_trans_huge()
> becomes the same as pXd_leaf(), although I haven't made that change
> here. It also frees up a valuable SW define PTE bit on architectures
> that have devmap PTE bits defined.
> 
> It also almost certainly allows further clean-up of the devmap managed
> functions, but I have left that as a future improvment. It also
> enables support for compound ZONE_DEVICE pages which is one of my
> primary motivators for doing this work.
> 

https://lkml.kernel.org/r/wysuus23bqmjtwkfu3zutqtmkse3ki3erf45x32yezlrl24qto@xlqt7qducyld
made me expect merge/build/runtime issues, however this series merges
and builds OK on mm-unstable.  Did something change?  What's the story
here?

Oh well, it built so I'll ship it!

