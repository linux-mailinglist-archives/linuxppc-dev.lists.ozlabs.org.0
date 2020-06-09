Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2DF1F345D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:50:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h12w1pGKzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:50:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFx5skNzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFq4bG8z9sVK; Tue,  9 Jun 2020 15:29:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200406030745.24595-2-oohall@gmail.com>
References: <20200406030745.24595-1-oohall@gmail.com>
 <20200406030745.24595-2-oohall@gmail.com>
Subject: Re: [PATCH 1/7] powerpc/powernv/npu: Clean up compound table group
 initialisation
Message-Id: <159168033539.1381411.9877327525599662112.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:35 +1000 (AEST)
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
Cc: aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Apr 2020 13:07:39 +1000, Oliver O'Halloran wrote:
> Re-work the control flow a bit so what's going on is a little clearer.
> This also ensures the table_group is only initialised once in the P9
> case. This shouldn't be a functional change since all the GPU PCI
> devices should have the same table_group configuration, but it does
> look strange.

Applied to powerpc/next.

[1/7] powerpc/powernv/npu: Clean up compound table group initialisation
      https://git.kernel.org/powerpc/c/6984856865b55c9c1ee0814c30296119cd8ba511
[2/7] powerpc/powernv/iov: Don't add VFs to iommu group during PE config
      https://git.kernel.org/powerpc/c/6cff91b2b97b1b40a52971c9b1e99980dd49fd54
[3/7] powerpc/powernv/pci: Register iommu group at PE DMA setup
      https://git.kernel.org/powerpc/c/9b9408c55935ecc3b1c27b3eeb5a507394113cbb
[4/7] powerpc/powernv/pci: Add device to iommu group during dma_dev_setup()
      https://git.kernel.org/powerpc/c/84d8cc076723058cc294f4360db6ff7758c25b74
[5/7] powerpc/powernv/pci: Delete old iommu recursive iommu setup
      https://git.kernel.org/powerpc/c/f39b8b10fcc5d4617d2be5f2910e017a55444b43
[6/7] powerpc/powernv/pci: Move tce size parsing to pci-ioda-tce.c
      https://git.kernel.org/powerpc/c/96e2006a9dbc02cb1c103521405d457438a2e260
[7/7] powerpc/powernv/npu: Move IOMMU group setup into npu-dma.c
      https://git.kernel.org/powerpc/c/03b7bf341c18ff19129cc2825b62bb0e212463f1

cheers
