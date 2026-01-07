Return-Path: <linuxppc-dev+bounces-15391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864F5CFFE9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 21:06:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmfDm0f6Tz2xpg;
	Thu, 08 Jan 2026 07:06:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767816375;
	cv=none; b=W1GQKUskdAeG4/3x79KjhQm3ggIMgZZzuqQZavIUqvNsju6jPop3me5yqk4SCINdrHlt3wfxF0q6oQLmE6n13bqHhVNhU0rqAXIlhGgpp/hDAxYssi0tADuHXYX8FgW0hdyzJMPtha4fs9BL85PdOXBnj3XPfFLrdmnbgJnF6bB87PTzEOHRtnpz0j+qI/JIXvoWXFPaWJ+8Rcp8Juh3K9SexJjNiFMjmgZfNViQ1FuXeTzdobHeuJZpcpMbtQ0SvH8aODHNROrlqLBiW1cEVCEgQ8j0nHQ6NV0aAwtrRMCiwYKTHKI3FPY34f3/5+oky2tyUt1uqduaEuHHjHmqng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767816375; c=relaxed/relaxed;
	bh=EwMlOW1qKxxvV5bc1w16z1ObHGTogQbAMXT6/ogSqck=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ida5lBkIkgpwkV+Xb6rwGsDVwfiz5moGG9bCH945PcpXoXgQqq6NfXyauoCNswEjSEPbAWJC2gKR9VTvz2DQoRiv7AeXUjjV6nr8ZeusnNdItulEhJHuo93lWrodGxWPgjG9fFEEdcbszLKrGUSpxWYkyABc/9w9YKqrXU+o9Ihv4KecXdnb5z+TUNfgpMzsn1k5kPnpcdJEYCI5DglKGcA2XRZRDXuXYNl2GUVRhZIVw3VItlzi/ugBW8AuClU03GWYEdt4/elEGsmB+SoCuDetgw97J8IFaaWHBCEgxKEOn7c/7r2VEv65RCwcrKZ02SMqAcbWFWJgx0uU4grbVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NLgidEHi; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NLgidEHi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmfDk4CmQz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 07:06:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1714B6001A;
	Wed,  7 Jan 2026 20:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247ACC4CEF1;
	Wed,  7 Jan 2026 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767816369;
	bh=9PIBpB6BT7c2Nly9VamIDqbclUvTqGBanLECbpOqsZU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NLgidEHia+ljn45TqKKiaI1PqrlkMihQySUaXwHidlJUJPZNGsTIZWluKWXqqW0JD
	 pyxhlCbST+uZv3N70zgjUhz9hGOVY0eKuj6ZXXiv5xVYcKWEmySRYVNQZVYzawb7RK
	 0/qFXzfy9W/GNVAvifH3407hbK+RS4rtYOs+DkSg=
Date: Wed, 7 Jan 2026 12:06:08 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
Message-Id: <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
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

On Wed,  7 Jan 2026 20:18:12 +1100 Jordan Niethe <jniethe@nvidia.com> wrote:

> Today, when creating these device private struct pages, the first step
> is to use request_free_mem_region() to get a range of physical address
> space large enough to represent the devices memory. This allocated
> physical address range is then remapped as device private memory using
> memremap_pages.

Welcome to Linux MM.  That's a heck of an opening salvo ;)

> Needing allocation of physical address space has some problems:
> 
>   1) There may be insufficient physical address space to represent the
>      device memory. KASLR reducing the physical address space and VM
>      configurations with limited physical address space increase the
>      likelihood of hitting this especially as device memory increases. This
>      has been observed to prevent device private from being initialized.  
> 
>   2) Attempting to add the device private pages to the linear map at
>      addresses beyond the actual physical memory causes issues on
>      architectures like aarch64  - meaning the feature does not work there [0].

Can you better help us understand the seriousness of these problems? 
How much are our users really hurting from this?

> Seeking opinions on using the mpfns like this or if a new type would be
> preferred.

Whose opinions?  IOW, can you suggest who you'd like to see review this
work?

> 
> * NOTE: I will need help in testing the driver changes *
> 

Again, please name names ;)  I'm not afraid to prod.


I'm reluctant to add this to mm.git's development/testing branches at
this time.  Your advice on when you think we're ready for that step
would be valuable, thanks.



