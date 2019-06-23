Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C144FB20
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 12:38:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Wpml2bpvzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 20:38:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Wph10DWhzDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 20:34:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45Wph05wlrz9sBp; Sun, 23 Jun 2019 20:34:24 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 50087112592016a3fc10b394a55f1f1a1bde6908
X-Patchwork-Hint: ignore
In-Reply-To: <20190620014651.7645-1-sjitindarsingh@gmail.com>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/3] KVM: PPC: Book3S HV: Invalidate ERAT when flushing
 guest TLB entries
Message-Id: <45Wph05wlrz9sBp@ozlabs.org>
Date: Sun, 23 Jun 2019 20:34:24 +1000 (AEST)
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
Cc: clg@kaod.org, kvm-ppc@vger.kernel.org, sjitindarsingh@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-20 at 01:46:49 UTC, Suraj Jitindar Singh wrote:
> When a guest vcpu moves from one physical thread to another it is
> necessary for the host to perform a tlb flush on the previous core if
> another vcpu from the same guest is going to run there. This is because the
> guest may use the local form of the tlb invalidation instruction meaning
> stale tlb entries would persist where it previously ran. This is handled
> on guest entry in kvmppc_check_need_tlb_flush() which calls
> flush_guest_tlb() to perform the tlb flush.
> 
> Previously the generic radix__local_flush_tlb_lpid_guest() function was
> used, however the functionality was reimplemented in flush_guest_tlb()
> to avoid the trace_tlbie() call as the flushing may be done in real
> mode. The reimplementation in flush_guest_tlb() was missing an erat
> invalidation after flushing the tlb.
> 
> This lead to observable memory corruption in the guest due to the
> caching of stale translations. Fix this by adding the erat invalidation.
> 
> Fixes: 70ea13f6e609 "KVM: PPC: Book3S HV: Flush TLB on secondary radix threads"
> 
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/50087112592016a3fc10b394a55f1f1a1bde6908

cheers
