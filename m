Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCABD2DABA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:08:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwFqH5tk3zDqKD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:08:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4CwFP839cszDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:49:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFP81pD4z9sVJ; Tue, 15 Dec 2020 21:49:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201210171450.1933725-1-clg@kaod.org>
References: <20201210171450.1933725-1-clg@kaod.org>
Subject: Re: [PATCH v2 00/13] powerpc/xive: misc cleanups
Message-Id: <160802921759.504444.1105629942775895818.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:48:59 +1100 (AEDT)
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Dec 2020 18:14:37 +0100, Cédric Le Goater wrote:
> The most important change is the removal of support of OPAL flags
> required for P9 DD1. It provides a good cleanup of some complex
> routines.
> 
> Thanks,
> 
> C.
> 
> [...]

Patches 1-3 and 5-13 applied to powerpc/next.

[01/13] KVM: PPC: Book3S HV: XIVE: Show detailed configuration in debug output
        https://git.kernel.org/powerpc/c/98983675008ab3ae9b37fc7a4bfa083998079215
[02/13] powerpc/xive: Rename XIVE_IRQ_NO_EOI to show its a flag
        https://git.kernel.org/powerpc/c/4f1c3f7b08187e6b97701c7fb2dc6f3749566c62
[03/13] powerpc/xive: Introduce XIVE_IPI_HW_IRQ
        https://git.kernel.org/powerpc/c/e2cf43d59525477cfd030378c3c808187952c531
[05/13] powerpc/xive: Add a name to the IRQ domain
        https://git.kernel.org/powerpc/c/9dfe4b14df93532da3dbf11952a17389ae3cdc67
[06/13] powerpc/xive: Add a debug_show handler to the XIVE irq_domain
        https://git.kernel.org/powerpc/c/a5021abc48a0f44083a15a37b3e61378519cb00d
[07/13] powerpc: Increase NR_IRQS range to support more KVM guests
        https://git.kernel.org/powerpc/c/7b3b3de3b04ecb7393cdfaa30a3468dd47b750cf
[08/13] powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_SHIFT_BUG
        https://git.kernel.org/powerpc/c/4cc0e36df2c0a41fd38645ddde08d2bfba699b7a
[09/13] powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_MASK_FW
        https://git.kernel.org/powerpc/c/b5277d18c65e31ce51f6733ebdca3985a962fab5
[10/13] powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_EOI_FW
        https://git.kernel.org/powerpc/c/cf58b746665d0177b86d42d18e60985fa1fdb909
[11/13] powerpc/xive: Simplify xive_do_source_eoi()
        https://git.kernel.org/powerpc/c/614546d56296380b59e94484813eeef62a7d2b6b
[12/13] powerpc/xive: Improve error reporting of OPAL calls
        https://git.kernel.org/powerpc/c/07efbca11c1a985efa4d15bd76a637c6bffc253b
[13/13] KVM: PPC: Book3S HV: XIVE: Add a comment regarding VP numbering
        https://git.kernel.org/powerpc/c/dddc4ef92d1ce92987da1d6926cdfa99e8acb622

cheers
