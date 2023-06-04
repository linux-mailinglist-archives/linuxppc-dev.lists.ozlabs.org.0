Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01417213DF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 02:23:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYcsr32lXz3f00
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 10:23:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qd2YyRXs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYcrx0lH9z3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 10:22:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qd2YyRXs;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QYcrs11C6z4x3x;
	Sun,  4 Jun 2023 10:22:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685838176;
	bh=AUJ7jHGZlU1IgO9OqyJ4jwSVRZvI7dVMmKTNxQxKoeI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qd2YyRXsuhpUARRns0XW/38b+R1sW7dr4usqM/UPRmx59J5EK5CrM7vQ4ROSYmYcg
	 4UILf3rybeo9IVOT6KNFMUY2uox4B+heOXB4A0kqAIOgjeuEv5hoc6sSy6L0B0imXg
	 yVii0FpGZVB4mwB5tgEDHEANGRPnikIhFd3Waos+0a73UAszqP6EODPT49dqN4k1Lm
	 h1xrxTiQJ8Hrnbb/iQp2q2vIXA3niI7q7Ls2loypcmzfXq67Vt/zY27jAKKzBNEToh
	 jHuBh0k8NWaQImrEUUhu3MEr3yfCqzS6aEWGlahbygEZPNHqVtTBPNKFg/1I3KWdKE
	 EuBtbBTyBoqGQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
In-Reply-To: <2d188c87-ef34-3812-7330-a985f756d959@infradead.org>
References: <20230602140143.0af52cee@canb.auug.org.au>
 <2d188c87-ef34-3812-7330-a985f756d959@infradead.org>
Date: Sun, 04 Jun 2023 10:22:51 +1000
Message-ID: <87h6rogjok.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Timothy Pearson <tpearson@raptorengineering.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> On 6/1/23 21:01, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20230601:
>> 
>
> On powerpc64, a randconfig failed with:
>
> In file included from ../include/linux/list.h:5,
>                  from ../include/linux/preempt.h:11,
>                  from ../include/linux/spinlock.h:56,
>                  from ../include/linux/mmzone.h:8,
>                  from ../include/linux/gfp.h:7,
>                  from ../include/linux/slab.h:15,
>                  from ../arch/powerpc/kernel/iommu.c:15:
> ../arch/powerpc/kernel/iommu.c: In function 'spapr_tce_setup_phb_iommus_initcall':
> ../arch/powerpc/kernel/iommu.c:1391:36: error: 'hose_list' undeclared (first use in this function); did you mean 'zonelist'?
>  1391 |         list_for_each_entry(hose, &hose_list, list_node) {
>       |                                    ^~~~~~~~~
...

hose_list is in pci-common.c which is built when PCI=y.

PSERIES and POWERNV force PCI=y.

But this config has neither:

# CONFIG_PPC_POWERNV is not set
# CONFIG_PPC_PSERIES is not set
CONFIG_HAVE_PCI=y
# CONFIG_PCI is not set
# CONFIG_COMMON_CLK_RS9_PCIE is not set


Probably the spapr_tce code should be wrapped in an #ifdef that is only
enabled when POWERNV || PSERIES is enabled.

cheers
