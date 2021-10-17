Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EA4308A9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:29:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXK7b0Ct8z3cNW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:29:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXK6g4rfnz2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:28:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXK6c3Tp6z4xqS;
 Sun, 17 Oct 2021 23:28:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20211015133929.832061-1-mpe@ellerman.id.au>
References: <20211015133929.832061-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] KVM: PPC: Book3S HV: Fix stack handling in
 idle_kvm_start_guest()
Message-Id: <163447368720.1156783.501192294196883402.b4-ty@ellerman.id.au>
Date: Sun, 17 Oct 2021 23:28:07 +1100
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
Cc: npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 16 Oct 2021 00:39:28 +1100, Michael Ellerman wrote:
> In commit 10d91611f426 ("powerpc/64s: Reimplement book3s idle code in
> C") kvm_start_guest() became idle_kvm_start_guest(). The old code
> allocated a stack frame on the emergency stack, but didn't use the
> frame to store anything, and also didn't store anything in its caller's
> frame.
> 
> idle_kvm_start_guest() on the other hand is written more like a normal C
> function, it creates a frame on entry, and also stores CR/LR into its
> callers frame (per the ABI). The problem is that there is no caller
> frame on the emergency stack.
> 
> [...]

Applied to powerpc/fixes.

[1/2] KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()
      https://git.kernel.org/powerpc/c/9b4416c5095c20e110c82ae602c254099b83b72f
[2/2] KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest
      https://git.kernel.org/powerpc/c/cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337

cheers
