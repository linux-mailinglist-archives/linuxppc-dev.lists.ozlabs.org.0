Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16A4B8868
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:05:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJ8j2pC2z3cYt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:05:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJ8L338nz30Ld
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:04:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzJ8J0lWNz4xPt;
 Thu, 17 Feb 2022 00:04:48 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: kvm-ppc@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>
In-Reply-To: <20220125215655.1026224-1-farosas@linux.ibm.com>
References: <20220125215655.1026224-1-farosas@linux.ibm.com>
Subject: Re: [PATCH v5 0/5] KVM: PPC: MMIO fixes
Message-Id: <164501666777.530536.8902205989828226400.b4-ty@ellerman.id.au>
Date: Thu, 17 Feb 2022 00:04:27 +1100
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Jan 2022 18:56:50 -0300, Fabiano Rosas wrote:
> Changes from v4:
> 
> -patch 4: switched to kvm_debug_ratelimited.
> 
> -patch 5: kept the Program interrupt for BookE.
> 
> v4:
> https://lore.kernel.org/r/20220121222626.972495-1-farosas@linux.ibm.com
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/5] KVM: PPC: Book3S HV: Stop returning internal values to userspace
      https://git.kernel.org/powerpc/c/36d014d37d59065087e51b8381e37993f1ca99bc
[2/5] KVM: PPC: Fix vmx/vsx mixup in mmio emulation
      https://git.kernel.org/powerpc/c/b99234b918c6e36b9aa0a5b2981e86b6bd11f8e2
[3/5] KVM: PPC: mmio: Reject instructions that access more than mmio.data size
      https://git.kernel.org/powerpc/c/3f831504482ab0d0d53d1966987959d1485345cc
[4/5] KVM: PPC: mmio: Return to guest after emulation failure
      https://git.kernel.org/powerpc/c/349fbfe9b918e6dea00734f07c0fbaf4c2e2df5e
[5/5] KVM: PPC: Book3s: mmio: Deliver DSI after emulation failure
      https://git.kernel.org/powerpc/c/c1c8a66367a35aabbad9bd629b105b9fb49f2c1f

cheers
