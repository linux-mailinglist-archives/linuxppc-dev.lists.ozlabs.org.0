Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1DEA323
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 19:21:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Gx82CTZzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 05:21:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Gmr3PymzF4fM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 05:14:03 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C37E468B05; Wed, 30 Oct 2019 19:13:59 +0100 (CET)
Date: Wed, 30 Oct 2019 19:13:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Reza Arbab <arbab@linux.ibm.com>
Subject: Re: [PATCH 00/11] powerpv/powernv: Restore
 pnv_npu_try_dma_set_bypass()
Message-ID: <20191030181359.GA19597@lst.de>
References: <1572454800-17976-1-git-send-email-arbab@linux.ibm.com>
 <20191030175341.GA19166@lst.de>
 <20191030180851.u466i4scnaqfxt2g@arbab-laptop.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030180851.u466i4scnaqfxt2g@arbab-laptop.localdomain>
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

On Wed, Oct 30, 2019 at 01:08:51PM -0500, Reza Arbab wrote:
> On Wed, Oct 30, 2019 at 06:53:41PM +0100, Christoph Hellwig wrote:
>> How do you even use this code?  Nothing in the kernel even calls
>> dma_set_mask for NPU devices, as we only suport vfio pass through.
>
> You use it by calling dma_set_mask() for the *GPU* device. The purpose of 
> pnv_npu_try_dma_set_bypass() is to then propagate the same bypass 
> configuration to all the NPU devices associated with that GPU.

Which in-kernel driver, which PCI ID?
