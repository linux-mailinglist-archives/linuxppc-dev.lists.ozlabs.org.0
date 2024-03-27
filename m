Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D44988E992
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:43:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kwj619xn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WCy04fnz3vbV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:43:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kwj619xn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4WB40CQSz3vyP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:41:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 143C5615AD;
	Wed, 27 Mar 2024 15:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8D6C433C7;
	Wed, 27 Mar 2024 15:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711554105;
	bh=LSkdq/t94YMFNlamRqeWvTTfCAU7fVztXM9mzQlr1gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwj619xnpdyJcHARuFdyABjHRFcqAdSXTht6r7soAxbPD/i8JwH+Wbuob+V12R3n2
	 rjT194985hg2t/tELpPWn6hp5xbV83OJPRUcfIIyw1XiOKlN+pZKuEoNANmwzA8bXf
	 xibCFVjADjaBzJLD5hoFzVnQTvcKdyo0G82FBxUUQdfhnn4CUkqUgeMYvOCYAi5VRT
	 ICQPFF6NQuQf4/VDzP7+eI7NawGxe8N8bucpZBSmyyIJQw1RHRtdi2tOpl6QuBm/+L
	 aNjfOvRL6V2syLJt/UUb2Ue3dsT7fVlFSSHfAu+IrlAx8FS1BvBEkD0naTCJXB4YJQ
	 /1gP29XdpE5vw==
Date: Wed, 27 Mar 2024 17:41:03 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 6/6] mm/mm_init.c: remove arch_reserved_kernel_pages()
Message-ID: <ZgQ-D5Gpvr_LJM-Z@kernel.org>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-7-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325145646.1044760-7-bhe@redhat.com>
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 10:56:46PM +0800, Baoquan He wrote:
> Since the current calculation of calc_nr_kernel_pages() has taken into
> consideration of kernel reserved memory, no need to have
> arch_reserved_kernel_pages() any more.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/powerpc/include/asm/mmu.h |  4 ----
>  arch/powerpc/kernel/fadump.c   |  5 -----
>  include/linux/mm.h             |  3 ---
>  mm/mm_init.c                   | 12 ------------
>  4 files changed, 24 deletions(-)
> 
