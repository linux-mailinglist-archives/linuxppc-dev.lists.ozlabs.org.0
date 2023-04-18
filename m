Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 080106E6F9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 00:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1Jvk6sWmz3fSt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 08:47:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=btgUKzwx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1Jtt2Txcz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 08:46:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=btgUKzwx;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q1Jts6SvJz4x7s;
	Wed, 19 Apr 2023 08:46:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681857990;
	bh=FQEdj5wDZjezyMQ/mUdVKFduut31HdEh/D1LFkOSsAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=btgUKzwxXMUJWrPnm65X1Kjwj7MzZAZAx/NrteDEwP95LB4mEZYjcu6+OL9dByuZa
	 SDWZ7xOj13sPoF776e5sOYkk2FOkFnJbLWx64FrAwgABls/zqF8N4XY6HBRmwl8B+x
	 3XCxEcgJ7jFcixxWp/NdQELoLrSvLvMAfhK3uhX5Ij1Ji4Xq0QhiQ0jObrloFsFvvF
	 O2khY+bxg7paHmFtbLaiXxITvXudzEPdejQ9wsNGxJ8FXbJInqH8wRy4JoGR0L2fY4
	 OXI6p5IQbHGbdzFgBpeVs30WUBAKoHE0+I0akdFI/QIZzk6AifiY5EGoukK/0Cv31n
	 RK7B2N9vHyV2w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
In-Reply-To: <20230418204401.13168-1-gbatra@linux.vnet.ibm.com>
References: <20230418204401.13168-1-gbatra@linux.vnet.ibm.com>
Date: Wed, 19 Apr 2023 08:46:28 +1000
Message-ID: <87ildsizaz.fsf@mpe.ellerman.id.au>
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Greg Joyce <gjoyce@linux.vnet.ibm.com>, Gaurav Batra <gbatra@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
> When DMA window is backed by 2MB TCEs, the DMA address for the mapped
> page should be the offset of the page relative to the 2MB TCE. The code
> was incorrectly setting the DMA address to the beginning of the TCE
> range.
>
> Mellanox driver is reporting timeout trying to ENABLE_HCA for an SR-IOV
> ethernet port, when DMA window is backed by 2MB TCEs.
>
> Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
>
> Reviewed-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/iommu.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

This should have a Fixes: tag.

I guess it's:

  387273118714 ("powerps/pseries/dma: Add support for 2M IOMMU page size")

Can you confirm?

cheers
