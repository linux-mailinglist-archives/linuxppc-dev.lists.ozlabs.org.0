Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFEE26DAF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:01:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsbCR6fMkzDqKs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:01:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4BsZSb0fzvzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSZ5KdXz9sVY; Thu, 17 Sep 2020 21:27:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20200807101854.844619-1-clg@kaod.org>
References: <20200807101854.844619-1-clg@kaod.org>
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
Message-Id: <160034201731.3339803.17760371950338467723.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:26 +1000 (AEST)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 7 Aug 2020 12:18:54 +0200, Cédric Le Goater wrote:
> When a passthrough IO adapter is removed from a pseries machine using
> hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
> guest OS to clear all page table entries related to the adapter. If
> some are still present, the RTAS call which isolates the PCI slot
> returns error 9001 "valid outstanding translations" and the removal of
> the IO adapter fails. This is because when the PHBs are scanned, Linux
> maps automatically the INTx interrupts in the Linux interrupt number
> space but these are never removed.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pci: unmap legacy INTx interrupts when a PHB is removed
      https://git.kernel.org/powerpc/c/3a3181e16fbde752007759f8759d25e0ff1fc425

cheers
