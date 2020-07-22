Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13F228F92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:12:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNqs6NvFzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:12:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBNcr6Nq1zDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 15:02:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=LuLH3ggs; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4BBNcr48VYz9sSt; Wed, 22 Jul 2020 15:02:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1595394156; bh=YtTRfCV4UahyLx9Af7pCCXJP0N0KNpM91guqaVdDXQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LuLH3ggsM3xwahl7ZiSsX9oFJRX5yuR2rs95boy0b/VEmM5uv7WAPLe0YCwUjsmyg
 Gc4M0C6UTeVY/mWM8YN0SzosJEf1HX6ovVos38OPQmtj+TPgxLCE76N0nsE3xfEmib
 SxwYzRrK4gPu9Xk9NdlJMXNOGooqPxZiqMCYAzlw7NVA5WIMSrggqfquvC56UOny1C
 CA8S/gwWo5ALj8KW2/+X8FcAPkKgEYHQ+7+v+44FHkKI/uopHf1Y2HE98OiybQjcdf
 1ewhngXHg1iVwpeSqc3iDsmc6RW+3clDpp9GMeZ9+6D8WrMSOzBsgF59pDi3M95HVa
 GUOm/hlnoIkfQ==
Date: Wed, 22 Jul 2020 15:02:32 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC PATCH] powerpc/pseries/svm: capture instruction faulting on
 MMIO access, in sprg0 register
Message-ID: <20200722050232.GD3878639@thinks.paulus.ozlabs.org>
References: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
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
Cc: ldufour@linux.ibm.com, aik@ozlabs.ru, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 16, 2020 at 01:32:13AM -0700, Ram Pai wrote:
> An instruction accessing a mmio address, generates a HDSI fault.  This fault is
> appropriately handled by the Hypervisor.  However in the case of secureVMs, the
> fault is delivered to the ultravisor.
> 
> Unfortunately the Ultravisor has no correct-way to fetch the faulting
> instruction. The PEF architecture does not allow Ultravisor to enable MMU
> translation. Walking the two level page table to read the instruction can race
> with other vcpus modifying the SVM's process scoped page table.
> 
> This problem can be correctly solved with some help from the kernel.
> 
> Capture the faulting instruction in SPRG0 register, before executing the
> faulting instruction. This enables the ultravisor to easily procure the
> faulting instruction and emulate it.

Just a comment on the approach of putting the instruction in SPRG0:
these I/O accessors can be used in interrupt routines, which means
that if these accessors are ever used with interrupts enabled, there
is the possibility of an external interrupt occurring between the
instruction that sets SPRG0 and the load/store instruction that
faults.  If the handler for that interrupt itself does an I/O access,
it will overwrite SPRG0, corrupting the value set by the interrupted
code.

The choices to fix that would seem to be (a) disable interrupts around
all I/O accesses, (b) have the accessor save and restore SPRG0, or (c)
solve the problem another way, such as by doing a H_LOGICAL_CI_LOAD
or H_LOGICAL_CI_STORE hypercall.

Paul.
