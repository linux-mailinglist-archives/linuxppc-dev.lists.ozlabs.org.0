Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D37454C9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:23:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZ8b4fS4z3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:23:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ8666RHz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:23:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ864StMz4wqX;
	Mon,  3 Jul 2023 15:23:18 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <20230505184701.91613-1-gbatra@linux.vnet.ibm.com>
References: <20230505184701.91613-1-gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH] iommu/powerpc: Incorrect DDW Table is referenced for SR-IOV device
Message-Id: <168836167609.46386.15513128327806769435.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:21:16 +1000
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 05 May 2023 13:47:01 -0500, Gaurav Batra wrote:
> For an SR-IOV device, while enabling DDW, a new table is created and added
> at index 1 in the group. In the below 2 scenarios, the table is incorrectly
> referenced at index 0 (which is where the table is for default DMA window).
> 
> 1. When adding DDW
> 
>         This issue is exposed with "slub_debug". Error thrown out from
>         dma_iommu_dma_supported()
> 
> [...]

Applied to powerpc/fixes.

[1/1] iommu/powerpc: Incorrect DDW Table is referenced for SR-IOV device
      https://git.kernel.org/powerpc/c/1f7aacc5eb9ed2cc17be7a90da5cd559effb9d59

cheers
