Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4939878E553
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:10:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbnkv1lBQz3dXg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:10:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncM6DrSz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncM5hCpz4x3q;
	Thu, 31 Aug 2023 14:04:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Russell Currey <ruscur@russell.cc>
In-Reply-To: <20230322035322.328709-1-ruscur@russell.cc>
References: <20230322035322.328709-1-ruscur@russell.cc>
Subject: Re: [PATCH] powerpc/iommu: Fix notifiers being shared by PCI and VIO buses
Message-Id: <169345455029.11824.1206105586738991003.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
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
Cc: ajd@linux.ibm.com, Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Mar 2023 14:53:22 +1100, Russell Currey wrote:
> fail_iommu_setup() registers the fail_iommu_bus_notifier struct to both
> PCI and VIO buses.  struct notifier_block is a linked list node, so this
> causes any notifiers later registered to either bus type to also be
> registered to the other since they share the same node.
> 
> This causes issues in (at least) the vgaarb code, which registers a
> notifier for PCI buses.  pci_notify() ends up being called on a vio
> device, converted with to_pci_dev() even though it's not a PCI device,
> and finally makes a bad access in vga_arbiter_add_pci_device() as
> discovered with KASAN:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/iommu: Fix notifiers being shared by PCI and VIO buses
      https://git.kernel.org/powerpc/c/c37b6908f7b2bd24dcaaf14a180e28c9132b9c58

cheers
