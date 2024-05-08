Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD28BFF05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGXZ126jz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:42:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGX95bg8z2xTN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:41:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGX92rblz4x0v;
	Wed,  8 May 2024 23:41:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20240212045020.70364-1-bgray@linux.ibm.com>
References: <20240212045020.70364-1-bgray@linux.ibm.com>
Subject: Re: [PATCH] powerpc64/kasan: Pass virtual addresses to kasan_init_phys_region()
Message-Id: <171517558558.165093.10144955279931618073.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Feb 2024 15:50:20 +1100, Benjamin Gray wrote:
> The kasan_init_phys_region() function maps shadow pages necessary for
> the ranges of the linear map backed by physical pages. Currently
> kasan_init_phys_region() is being passed physical addresses, but
> kasan_mem_to_shadow() expects virtual addresses.
> 
> It works right now because the lower bits (12:64) of the
> kasan_mem_to_shadow() calculation are the same for the real and virtual
> addresses, so the actual PTE value is the same in the end. But virtual
> addresses are the intended input, so fix it.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc64/kasan: Pass virtual addresses to kasan_init_phys_region()
      https://git.kernel.org/powerpc/c/295454eda97b9c5f7a64ac5c2bb827fd15efb623

cheers
