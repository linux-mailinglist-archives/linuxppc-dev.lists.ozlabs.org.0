Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAEB910493
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 14:51:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4gNh3jKFz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 22:51:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4gMT5MJxz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 22:50:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W4gMV49CLz4wcp;
	Thu, 20 Jun 2024 22:50:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Gaurav Batra <gbatra@linux.ibm.com>
In-Reply-To: <20240514014608.35537-1-gbatra@linux.ibm.com>
References: <20240514014608.35537-1-gbatra@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/iommu: Split Dynamic DMA Window to be used in Hybrid mode
Message-Id: <171888775097.806750.4635477566453409757.b4-ty@ellerman.id.au>
Date: Thu, 20 Jun 2024 22:49:10 +1000
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
Cc: Brian King <brking@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 May 2024 20:46:08 -0500, Gaurav Batra wrote:
> Dynamic DMA Window (DDW) supports TCEs that are backed by 2MB page size.
> In most configurations, DDW is big enough to pre-map all of LPAR memory
> for IO. Pre-mapping of memory for DMA results in improvements in IO
> performance.
> 
> Persistent memory, vPMEM, can be assigned to an LPAR as well. vPMEM is not
> contiguous with LPAR memory and usually is assigned at high memory
> addresses.  This makes is not possible to pre-map both vPMEM and LPAR
> memory in the same DDW.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: Split Dynamic DMA Window to be used in Hybrid mode
      https://git.kernel.org/powerpc/c/ff5163bb7000a0254ffdd7b50cb6df43add94f33

cheers
