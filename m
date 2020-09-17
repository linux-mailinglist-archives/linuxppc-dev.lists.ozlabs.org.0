Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CC826DA4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:33:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsZbz5Bm9zDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:33:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSN2WbLzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSM4Dglz9sTW; Thu, 17 Sep 2020 21:27:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 iommu@lists.linux-foundation.org
In-Reply-To: <20200818221126.391073-1-bauerman@linux.ibm.com>
References: <20200818221126.391073-1-bauerman@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere
 in memory
Message-Id: <160034200698.3339803.12661483575080905618.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:15 +1000 (AEST)
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ram Pai <linuxram@us.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 Aug 2020 19:11:26 -0300, Thiago Jung Bauermann wrote:
> POWER secure guests (i.e., guests which use the Protection Execution
> Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
> they don't need the SWIOTLB memory to be in low addresses since the
> hypervisor doesn't have any addressing limitation.
> 
> This solves a SWIOTLB initialization problem we are seeing in secure guests
> with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
> memory, which leaves no space for SWIOTLB in low addresses.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere in memory
      https://git.kernel.org/powerpc/c/eae9eec476d13fad9af6da1f44a054ee02b7b161

cheers
