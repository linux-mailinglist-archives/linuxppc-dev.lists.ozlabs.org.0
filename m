Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F5188E7C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:04:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n3XRX+do;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VLV6PHrz3vdd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n3XRX+do;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VKp6YrVz3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:03:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85EBDCE26B4;
	Wed, 27 Mar 2024 15:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2115C433F1;
	Wed, 27 Mar 2024 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711551804;
	bh=7eEcZmvTzb8VSbNdQfoe1CbrQJGiq8lc7tQjpI5gzrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3XRX+dorHzwJYR0nkw+/2S37Z3avXPbnL3l4xeBZaO1cOokPn4Sn8Hl3ZgYqaHK4
	 0kubFaY2NZBNaaFz+7fdRscWPnZxRPDlZVhYImbvdRTPeKaN4OyaH/sOSgLmtAlYUt
	 Py3S4E8DHYrdpnkfbALpT6mXIVFFYENSMqZFE0nVREpzuBagIQiXz1haBQlKTeyGMO
	 Mfmoclvn7X/CefsCt75iA8cIawPUlLgToUoGLqqiCWhn5GdaVUMHMMRhSW1z+TYvQM
	 Zpuu3oMbg25Sp08D4ejJN4eErkxISgRYvHfEgaYTvQunVgbodg7kui6XhwXKZ/DNsl
	 sUZGhIwYQm2GQ==
Date: Wed, 27 Mar 2024 17:02:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 2/3] mm/treewide: rename CONFIG_HAVE_FAST_GUP to
 CONFIG_HAVE_GUP_FAST
Message-ID: <ZgQ1Dh2KZ3JvevX_@kernel.org>
References: <20240327130538.680256-1-david@redhat.com>
 <20240327130538.680256-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327130538.680256-3-david@redhat.com>
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 02:05:37PM +0100, David Hildenbrand wrote:
> Nowadays, we call it "GUP-fast", the external interface includes
> functions like "get_user_pages_fast()", and we renamed all internal
> functions to reflect that as well.
> 
> Let's make the config option reflect that.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/arm/Kconfig       | 2 +-
>  arch/arm64/Kconfig     | 2 +-
>  arch/loongarch/Kconfig | 2 +-
>  arch/mips/Kconfig      | 2 +-
>  arch/powerpc/Kconfig   | 2 +-
>  arch/s390/Kconfig      | 2 +-
>  arch/sh/Kconfig        | 2 +-
>  arch/x86/Kconfig       | 2 +-
>  include/linux/rmap.h   | 8 ++++----
>  kernel/events/core.c   | 4 ++--
>  mm/Kconfig             | 2 +-
>  mm/gup.c               | 6 +++---
>  mm/internal.h          | 2 +-
>  13 files changed, 19 insertions(+), 19 deletions(-)
> 
