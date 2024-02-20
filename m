Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CAD85BC2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 13:30:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfJfM2gkpz3vYc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:30:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfJdX6zj4z3bc2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 23:30:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfJdX4sgkz4wxv;
	Tue, 20 Feb 2024 23:30:08 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.ibm.com>
In-Reply-To: <20240215221833.4817-1-gbatra@linux.ibm.com>
References: <20240215221833.4817-1-gbatra@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries/iommu: DLPAR ADD of pci device doesn't completely initialize pci_controller structure
Message-Id: <170843210066.1280904.12009150879640738170.b4-ty@ellerman.id.au>
Date: Tue, 20 Feb 2024 23:28:20 +1100
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Feb 2024 16:18:33 -0600, Gaurav Batra wrote:
> When a PCI device is Dynamically added, LPAR OOPS with NULL pointer
> exception.
> 
> Complete stack is as below
> 
> [  211.239206] BUG: Kernel NULL pointer dereference on read at 0x00000030
> [  211.239210] Faulting instruction address: 0xc0000000006bbe5c
> [  211.239214] Oops: Kernel access of bad area, sig: 11 [#1]
> [  211.239218] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/iommu: DLPAR ADD of pci device doesn't completely initialize pci_controller structure
      https://git.kernel.org/powerpc/c/a5c57fd2e9bd1c8ea8613a8f94fd0be5eccbf321

cheers
