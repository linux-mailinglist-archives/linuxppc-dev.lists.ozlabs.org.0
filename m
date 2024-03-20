Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7126880ED3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 10:38:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EFuQrpr1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V03SJ1FQCz3dWW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 20:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EFuQrpr1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V03RY5hwnz2y3b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 20:38:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8652A61000;
	Wed, 20 Mar 2024 09:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA07C43390;
	Wed, 20 Mar 2024 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710927476;
	bh=6en8ZZ+fOEyondqQ+Wkc9mV58Xe+D619z940m0qzrm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFuQrpr1jzAOMq8F2IC3MV1yHDLmeckZtzWRKrHwdvnnIsPr3aiWwWV0UCpseJgMY
	 CLVANZ2nMu20Vx/v7G0qEug+XY6D17CKFoScSKv7iSfSJc2Mk18dZpNZn4XDJFWD0v
	 D0+Iz0wZTgbvswkA8UBsLimhMs893ReE4MErG0J74+jQX4sBmANFRvKSvZ41ojznqH
	 QuINWdgXEerhnWjAkQVXdAWfUcu3ZMhme4xnes4TORjpi+glPdrPb1mPMv70cHmNA9
	 fONx+GdtQX9iLu0n0AOPGjt2ahtYbmAaywQkrxrgvSP6aksTyWRav+DygUuV1rn+pp
	 cjy7ab8i7wtKQ==
Date: Wed, 20 Mar 2024 11:36:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 2/6] x86: remove memblock_find_dma_reserve()
Message-ID: <ZfquM06LOZB4vddu@kernel.org>
References: <20240318142138.783350-1-bhe@redhat.com>
 <20240318142138.783350-3-bhe@redhat.com>
 <Zfmz_1sbbvSWMj9C@kernel.org>
 <ZfqV1IEo3+cf9f9I@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfqV1IEo3+cf9f9I@MiWiFi-R3L-srv>
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

On Wed, Mar 20, 2024 at 03:52:52PM +0800, Baoquan He wrote:
> On 03/19/24 at 05:49pm, Mike Rapoport wrote:
> > Hi Baoquan,
> > 
> > On Mon, Mar 18, 2024 at 10:21:34PM +0800, Baoquan He wrote:
> > > This is not needed any more.
> > 
> > I'd swap this and the first patch, so that the first patch would remove
> > memblock_find_dma_reserve() and it's changelog will explain why it's not
> > needed and then the second patch will simply drop unused set_dma_reserve()
> 
> Thanks, Mike.
> 
> My thought on the patch 1/2 splitting is:
> patch 1 is removing all relevant codes in mm, including the usage of
> dma_reserve in free_area_init_core() and exporting set_dma_reserve()
> to any ARCH which want to subtract the dma_reserve from DMA zone.
>
> Patch 2 purely remove the code in x86 ARCH about how to get dma_reserve.
 
I think it's better first to remove the usage of set_dma_reserve() in x86
and then clean up the unused code.

> Your suggestion is also good to me, I can rearrange the order and
> repost.

-- 
Sincerely yours,
Mike.
