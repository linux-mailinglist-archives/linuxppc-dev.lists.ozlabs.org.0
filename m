Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEED47454F7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZTl6TRhz3dLR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:38:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZP55PNwz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP54J47z4wxr;
	Mon,  3 Jul 2023 15:34:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <20230613171641.15641-1-gbatra@linux.vnet.ibm.com>
References: <20230613171641.15641-1-gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: TCEs are incorrectly manipulated with DLPAR add/remove of memory
Message-Id: <168836201906.50010.7258437923476859444.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:59 +1000
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Jun 2023 12:16:41 -0500, Gaurav Batra wrote:
> When memory is dynamically added/removed, iommu_mem_notifier() is invoked. This
> routine traverses through all the DMA windows (DDW only, not default windows)
> to add/remove "direct" TCE mappings. The routines for this purpose are
> tce_clearrange_multi_pSeriesLP() and tce_clearrange_multi_pSeriesLP().
> 
> Both these routines are designed for Direct mapped DMA windows only.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/iommu: TCEs are incorrectly manipulated with DLPAR add/remove of memory
      https://git.kernel.org/powerpc/c/d61cd13e732c0eaa7d66b45edb2d0de8eab65a1e

cheers
