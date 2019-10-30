Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B08FAEA2D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:55:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473GMh4RFrzF4cY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 04:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473GKT4YYszF4Wx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 04:53:47 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E59F68C7B; Wed, 30 Oct 2019 18:53:41 +0100 (CET)
Date: Wed, 30 Oct 2019 18:53:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: Reza Arbab <arbab@linux.ibm.com>
Subject: Re: [PATCH 00/11] powerpv/powernv: Restore
 pnv_npu_try_dma_set_bypass()
Message-ID: <20191030175341.GA19166@lst.de>
References: <1572454800-17976-1-git-send-email-arbab@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572454800-17976-1-git-send-email-arbab@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Paul Mackerras <paulus@samba.org>, Alistair Popple <alistair@popple.id.au>,
 Oliver O'Halloran <oohall@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 30, 2019 at 11:59:49AM -0500, Reza Arbab wrote:
> With recent kernels, TCE tables for NPU devices are no longer being
> configured. That task was performed by pnv_npu_try_dma_set_bypass(), a
> function that got swept away in recent overhauling of dma code.
> 
> Patches 1-4 here bring the lost function back and reintegrate it with
> the updated generic iommu bypass infrastructure.
> 
> Patch 5 fixes a regression in behavior when a requested dma mask can not
> be fulfilled.
> 
> Patches 6-8 are cleanup. I put these later in the set because they
> aren't bisectable until after the restored code is wired back in.
> 
> Patches 9-11 refactor pnv_pci_ioda_iommu_bypass_supported(). It seems
> wrong for a boolean *_supported() function to have side effects. They
> reintroduce a pci controller based dma_set_mask() hook. If that's
> undesirable, these last three patches can be dropped.

How do you even use this code?  Nothing in the kernel even calls
dma_set_mask for NPU devices, as we only suport vfio pass through.
