Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C48A322E6E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:47:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFX3B63GMzF09h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:47:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWb14N9fzDqq0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWb02Q01z9sTX; Mon, 27 Jul 2020 17:26:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
In-Reply-To: <20200722065715.1432738-1-oohall@gmail.com>
References: <20200722065715.1432738-1-oohall@gmail.com>
Subject: Re: [PATCH v2 01/16] powernv/pci: Add pci_bus_to_pnvhb() helper
Message-Id: <159583478012.602200.3216230399674309576.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:52 +1000 (AEST)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Jul 2020 16:57:00 +1000, Oliver O'Halloran wrote:
> Add a helper to go from a pci_bus structure to the pnv_phb that hosts that
> bus. There's a lot of instances of the following pattern:
> 
> 	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> 	struct pnv_phb *phb = hose->private_data;
> 
> Without any other uses of the pci_controller inside the function. This is
> hard to read since it requires you to memorise the contents of the
> private data fields and kind of error prone since it involves blindly
> assigning a void pointer. Add a helper to make it more concise and
> explicit.

Applied to powerpc/next.

[01/16] powerpc/powernv/pci: Add pci_bus_to_pnvhb() helper
        https://git.kernel.org/powerpc/c/5609ffddd19dd52019d78b197e86b0331aeef8ae
[02/16] powerpc/powernv/pci: Always tear down DMA windows on PE release
        https://git.kernel.org/powerpc/c/7a52ffabe867c0d93e47af113e5107340974047a
[03/16] powerpc/powernv/pci: Add explicit tracking of the DMA setup state
        https://git.kernel.org/powerpc/c/01e12629af4e0e4864ed4d83e07783d7cb5b06be
[04/16] powerpc/powernv/pci: Initialise M64 for IODA1 as a 1-1 window
        https://git.kernel.org/powerpc/c/369633654fcb9639cd4cd0e1a448ffde3533d776
[05/16] powerpc/powernv/sriov: Move SR-IOV into a separate file
        https://git.kernel.org/powerpc/c/37b59ef08c546c6f54cdc52eed749f494619a102
[06/16] powerpc/powernv/sriov: Explain how SR-IOV works on PowerNV
        https://git.kernel.org/powerpc/c/ff79e11af0979b25ecb38e4c843779d4a759a4e2
[07/16] powerpc/powernv/sriov: Rename truncate_iov
        https://git.kernel.org/powerpc/c/fac248f8119170e3f8f54900985498ff6ee560bf
[08/16] powerpc/powernv/sriov: Simplify used window tracking
        https://git.kernel.org/powerpc/c/ad9add529d99d195195c27abf99e42d4965d35e2
[09/16] powerpc/powernv/sriov: Factor out M64 BAR setup
        https://git.kernel.org/powerpc/c/a610d35cc8780e781321ea8d002d5fef8484bf59
[10/16] powerpc/powernv/pci: Refactor pnv_ioda_alloc_pe()
        https://git.kernel.org/powerpc/c/a4bc676ed5c3f53781cc342b73097eb7e8d43fa5
[11/16] powerpc/powernv/sriov: Drop iov->pe_num_map[]
        https://git.kernel.org/powerpc/c/d29a2488d2c020032fdb1fe052347a6021e3591d
[12/16] powerpc/powernv/sriov: De-indent setup and teardown
        https://git.kernel.org/powerpc/c/052da31d45fc71238ea8bed7e9a84648a1ee0bf3
[13/16] powerpc/powernv/sriov: Move M64 BAR allocation into a helper
        https://git.kernel.org/powerpc/c/39efc03e3ee8f41909b7542be70b4061b38ca277
[14/16] powerpc/powernv/sriov: Refactor M64 BAR setup
        https://git.kernel.org/powerpc/c/a0be516f8160fdb4836237cba037229e88a1de7d
[15/16] powerpc/powernv/sriov: Make single PE mode a per-BAR setting
        https://git.kernel.org/powerpc/c/4c51f3e1e8702cbd0e53159fc3d1f54c20c70574
[16/16] powerpc/powernv/sriov: Remove vfs_expanded
        https://git.kernel.org/powerpc/c/84d8505ed1dafb2e62d49fca5e7aa7d96cfcec49

cheers
