Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A57E61F33BA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:57:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzsh6SQ8zDqHw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 49gzDz4VGpzDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDy3cHyz9sT6; Tue,  9 Jun 2020 15:28:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200429075122.1216388-1-clg@kaod.org>
References: <20200429075122.1216388-1-clg@kaod.org>
Subject: Re: [PATCH 0/3] powerpc/xive: PCI hotplug fixes under PowerVM
Message-Id: <159168032728.1381411.6585943075006157031.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:49 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Apr 2020 09:51:19 +0200, Cédric Le Goater wrote:
> Here are a couple of fixes for PCI hotplug issues for machines running
> under the POWER hypervisor using hash MMU and the XIVE interrupt mode.
> 
> Commit 1ca3dec2b2df ("powerpc/xive: Prevent page fault issues in the
> machine crash handler") forced the mapping of the XIVE ESB page and
> this is now blocking the removal of a passthrough IO adapter because
> the PCI isolation fails with "valid outstanding translations". Under
> KVM, the ESB pages for the adapter interrupts are un-mapped from the
> guest by the hypervisor in the KVM XIVE native device. This is is now
> redundant but it's harmless.
> 
> [...]

Patches 1 & 3 pplied to powerpc/next.

[1/3] powerpc/xive: Clear the page tables for the ESB IO mapping
      https://git.kernel.org/powerpc/c/a101950fcb78b0ba20cd487be6627dea58d55c2b
[3/3] powerpc/xive: Do not expose a debugfs file when XIVE is disabled
      https://git.kernel.org/powerpc/c/0755e85570a4615ca674ad6489d44d63916f1f3e

cheers
