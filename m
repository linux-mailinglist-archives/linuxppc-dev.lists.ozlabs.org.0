Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41B950D1A3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 14:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmRvb4c10z3brQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 22:16:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmRvC6QHnz2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 22:16:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KmRv70kBDz4xXk;
 Sun, 24 Apr 2022 22:16:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220420050840.328223-1-aik@ozlabs.ru>
References: <20220420050840.328223-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] KVM: PPC: Fix TCE handling for VFIO
Message-Id: <165080252010.1540533.16052214523820715749.b4-ty@ellerman.id.au>
Date: Sun, 24 Apr 2022 22:15:20 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Apr 2022 15:08:40 +1000, Alexey Kardashevskiy wrote:
> The LoPAPR spec defines a guest visible IOMMU with a variable page size.
> Currently QEMU advertises 4K, 64K, 2M, 16MB pages, a Linux VM picks
> the biggest (16MB). In the case of a passed though PCI device, there is
> a hardware IOMMU which does not support all pages sizes from the above -
> P8 cannot do 2MB and P9 cannot do 16MB. So for each emulated
> 16M IOMMU page we may create several smaller mappings ("TCEs") in
> the hardware IOMMU.
> 
> [...]

Applied to powerpc/fixes.

[1/1] KVM: PPC: Fix TCE handling for VFIO
      https://git.kernel.org/powerpc/c/26a62b750a4e6364b0393562f66759b1494c3a01

cheers
