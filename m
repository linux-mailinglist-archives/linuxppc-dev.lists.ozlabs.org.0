Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4595141EFA8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 16:37:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLXl10zZVz3bW5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 00:37:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLXkb6V6Mz2xrr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 00:37:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HLXkY0sk8z4xb7;
 Sat,  2 Oct 2021 00:37:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210930034454.95794-1-aik@ozlabs.ru>
References: <20210930034454.95794-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Report the correct most efficient
 DMA mask for PCI devices
Message-Id: <163309900983.1612134.6469972296732099183.b4-ty@ellerman.id.au>
Date: Sat, 02 Oct 2021 00:36:49 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Carol L Soto <clsoto@us.ibm.com>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Sep 2021 13:44:54 +1000, Alexey Kardashevskiy wrote:
> According to dma-api.rst, the dma_get_required_mask() helper should return
> "the mask that the platform requires to operate efficiently". Which in
> the case of PPC64 means the bypass mask and not a mask from an IOMMU table
> which is shorter and slower to use due to map/unmap operations (especially
> expensive on "pseries").
> 
> However the existing implementation ignores the possibility of bypassing
> and returns the IOMMU table mask on the pseries platform which makes some
> drivers (mpt3sas is one example) choose 32bit DMA even though bypass is
> supported. The powernv platform sort of handles it by having a bigger
> default window with a mask >=40 but it only works as drivers choose
> 63/64bit if the required mask is >32 which is rather pointless.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/iommu: Report the correct most efficient DMA mask for PCI devices
      https://git.kernel.org/powerpc/c/23c216b335d1fbd716076e8263b54a714ea3cf0e

cheers
