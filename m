Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BF4BF015
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 04:34:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2lCr3fkbz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 14:34:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FSKp5VsZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2lCB2S4Rz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 14:34:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FSKp5VsZ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K2lC702tTz4xZq;
 Tue, 22 Feb 2022 14:34:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1645500851;
 bh=NWqHvQ8lhzehq7ym/J+hnfUxcpV+FQlYRf623bBxxgs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FSKp5VsZ+VFzTA/s4eIEWZg/+y63HI5JZAz55i0VXbB/FXo8ICIZmJ9hR+Y+oFAfl
 jGkqo8DhWIRpFj1rykHTo7UTvkkZ+ZNrH1zL7jLolKjbPswOj0ryiGqutUyAifjFYy
 kDFQc2dxZW1zcYnkVxZdlde1PHz3rAi0bpXkGLJTT7MZF1/r42L5qjdUT4MfDlZUHB
 WlZ8R4lvG0WefT38C2jTUFUrGHyKRTXkMHdw9GHwn+GOT4V79DU1uwa+XcS+XBl0Vl
 O3N8ieML5gHIXX4vd05AfSXpQQrDaCV9HSNIk8XPVtWkFJd7kC4JrDy7NJgBWiVjze
 P76zI6xM22NXQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 3/3] KVM: PPC: Add KVM_CAP_PPC_AIL_MODE_3
In-Reply-To: <20220221072353.2219034-4-npiggin@gmail.com>
References: <20220221072353.2219034-1-npiggin@gmail.com>
 <20220221072353.2219034-4-npiggin@gmail.com>
Date: Tue, 22 Feb 2022 14:34:08 +1100
Message-ID: <87a6ejpob3.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Add KVM_CAP_PPC_AIL_MODE_3 to advertise the capability to set the AIL
> resource mode to 3 with the H_SET_MODE hypercall. This capability
> differs between processor types and KVM types (PR, HV, Nested HV), and
> affects guest-visible behaviour.
>
> QEMU will implement a cap-ail-mode-3 to control this behaviour[1], and
> use the KVM CAP if available to determine KVM support[2].
>
> [1] https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00437.html
> [2] https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00439.html
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  Documentation/virt/kvm/api.rst         | 14 ++++++++++++++
>  arch/powerpc/include/asm/setup.h       |  2 ++
>  arch/powerpc/kvm/powerpc.c             | 20 ++++++++++++++++++++
>  arch/powerpc/platforms/pseries/setup.c | 12 +++++++++++-
>  include/uapi/linux/kvm.h               |  1 +
>  tools/include/uapi/linux/kvm.h         |  1 +
>  6 files changed, 49 insertions(+), 1 deletion(-)

This one especially, but may as well be the whole series, needs to be
Cc'ed to kvm@vger.kernel.org, so that the generic KVM folks are aware of
it.

Can you do a resend Cc'ing them please.

cheers
