Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 191B52D5DCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:31:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsGZT6BXjzDr0y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:31:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBY96dNRzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBY81BFDz9shl; Thu, 10 Dec 2020 22:30:19 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201128070728.825934-1-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/8] powerpc/64s: fix and improve machine check handling
Message-Id: <160756607429.1313423.15187936842862654777.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:19 +1100 (AEDT)
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 28 Nov 2020 17:07:20 +1000, Nicholas Piggin wrote:
> First patch is a nasty memory scribble introduced by me :( That
> should go into fixes.
> 
> The next ones could wait for next merge window. They get things to the
> point where misbehaving or buggy guest isn't so painful for the host,
> and also get the guest SLB dumping code working (because the host no
> longer clears them before delivering the MCE to the guest).
> 
> [...]

Patches 2-8 applied to powerpc/next.

[2/8] powerpc/64s/powernv: Allow KVM to handle guest machine check details
      https://git.kernel.org/powerpc/c/0ce2382657f39ced2adbb927355360c3aaeb05f8
[3/8] KVM: PPC: Book3S HV: Don't attempt to recover machine checks for FWNMI enabled guests
      https://git.kernel.org/powerpc/c/067c9f9c98c8804b07751994c51d8557e440821e
[4/8] KVM: PPC: Book3S HV: Ratelimit machine check messages coming from guests
      https://git.kernel.org/powerpc/c/1d15ffdfc94127d75e04a88344ee1ce8c79f05fd
[5/8] powerpc/64s/powernv: Ratelimit harmless HMI error printing
      https://git.kernel.org/powerpc/c/f4b239e4c6bddf63d00cd460eabb933232dbc326
[6/8] powerpc/64s/pseries: Add ERAT specific machine check handler
      https://git.kernel.org/powerpc/c/82f70a05108c98aea4f140067c44a606262d2af7
[7/8] powerpc/64s: Remove "Host" from MCE logging
      https://git.kernel.org/powerpc/c/4a869531ddbf5939c45eab6ff389e4e58c8ed19c
[8/8] powerpc/64s: Tidy machine check SLB logging
      https://git.kernel.org/powerpc/c/865ae6f27789dcc3f92341d935f4439e8730a9fe

cheers
