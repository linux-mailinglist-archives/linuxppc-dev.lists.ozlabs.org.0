Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1732BA2CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 08:02:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcnY72RKPzDqwb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 18:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcnW95dT2zDqvn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 18:00:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CcnW9513Qz9sTL; Fri, 20 Nov 2020 18:00:37 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201117135617.3521127-1-npiggin@gmail.com>
References: <20201117135617.3521127-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/exception: KVM Fix for host DSI being taken
 in HPT guest MMU context
Message-Id: <160585562627.1117366.9794270499881106934.b4-ty@ellerman.id.au>
Date: Fri, 20 Nov 2020 18:00:37 +1100 (AEDT)
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Nov 2020 23:56:17 +1000, Nicholas Piggin wrote:
> Commit 2284ffea8f0c ("powerpc/64s/exception: Only test KVM in SRR
> interrupts when PR KVM is supported") removed KVM guest tests from
> interrupts that do not set HV=1, when PR-KVM is not configured.
> 
> This is wrong for HV-KVM HPT guest MMIO emulation case which attempts
> to load the faulting instruction word with MSR[DR]=1 and MSR[HV]=1 with
> the guest MMU context loaded. This can cause host DSI, DSLB interrupts
> which must test for KVM guest. Restore this and add a comment.

Applied to powerpc/fixes.

[1/1] powerpc/64s/exception: KVM Fix for host DSI being taken in HPT guest MMU context
      https://git.kernel.org/powerpc/c/cd81acc600a9684ea4b4d25a47900d38a3890eab

cheers
