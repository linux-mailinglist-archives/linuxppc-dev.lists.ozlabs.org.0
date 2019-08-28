Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5DF9F976
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:37:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JCdz3d3HzDqK5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 14:37:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JCM54ktqzDqqJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 14:24:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46JCM52SJqz9sNy; Wed, 28 Aug 2019 14:24:49 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3f068aae7a958555533847af88705b5629f31600
In-Reply-To: <4506b0489eabd0921a3587d90bd44c7683f3472d.1565930772.git.sbobroff@linux.ibm.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v5 01/12] powerpc/64: Adjust order in pcibios_init()
Message-Id: <46JCM52SJqz9sNy@ozlabs.org>
Date: Wed, 28 Aug 2019 14:24:49 +1000 (AEST)
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
Cc: aik@ozlabs.ru, oohall@gmail.com, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-08-16 at 04:48:05 UTC, Sam Bobroff wrote:
> The pcibios_init() function for PowerPC 64 currently calls
> pci_bus_add_devices() before pcibios_resource_survey(). This means
> that at boot time, when the pcibios_bus_add_device() hooks are called
> by pci_bus_add_devices(), device resources have not been allocated and
> they are unable to perform EEH setup, so a separate pass is needed.
> 
> This patch adjusts that order so that it will become possible to
> consolidate the EEH setup work into a single location.
> 
> The only functional change is to execute pcibios_resource_survey()
> (excepting ppc_md.pcibios_fixup(), see below) before
> pci_bus_add_devices() instead of after it.
> 
> Because pcibios_scan_phb() and pci_bus_add_devices() are called
> together in a loop, this must be broken into one loop for each call.
> Then the call to pcibios_resource_survey() is moved up in between
> them. This changes the ordering but because pcibios_resource_survey()
> also calls ppc_md.pcibios_fixup(), that call is extracted out into
> pcibios_init() to where pcibios_resource_survey() was, so that it is
> not moved.
> 
> The only other caller of pcibios_resource_survey() is the PowerPC 32
> version of pcibios_init(), and therefore, that is modified to call
> ppc_md.pcibios_fixup() right after pcibios_resource_survey() so that
> there is no functional change there at all.
> 
> The re-arrangement will cause very few side-effects because at this
> stage in the boot, pci_bus_add_devices() does very little:
> - pci_create_sysfs_dev_files() does nothing (no sysfs yet)
> - pci_proc_attach_device() does nothing (no proc yet)
> - device_attach() does nothing (no drivers yet)
> This leaves only the pci_final_fixup calls, D3 support, and marking
> the device as added. Of those, only the pci_final_fixup calls have the
> potential to be affected by resource allocation.
> 
> The only pci_final_fixup handlers that touch resources seem to be one
> for x86 (pci_amd_enable_64bit_bar()), and a PowerPC 32 platform driver
> (quirk_final_uli1575()), neither of which use this pcibios_init()
> function. Even if they did, it would almost certainly be a bug, under
> the current ordering, to rely on or make changes to resources before
> they were allocated.
> 
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3f068aae7a958555533847af88705b5629f31600

cheers
