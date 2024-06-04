Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E12258FB11B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 13:27:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cgZVxJ/I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtpGV0GBZz3cWG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 21:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cgZVxJ/I;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtpFn1tgTz3cRy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 21:26:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717500397;
	bh=t+rduEbfoUs0dyalxeI4cE9kdl/8hw6YLtlweC8/mmU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cgZVxJ/IkfjcygyfjaxKzIN6nXEks1+/rN8K8kQC6kV9KOUB/5jRXuLrYvjL+I+vk
	 Omx8HBYUidKGjWDSRBt/aSwhY07m/X0W6F3R2iFWlG4PMhRWYNBnu7cO1TLIZlb2fE
	 KnGvYSou/YepCcoQGUo7i7+zJcKDjOTrIFzQi7DtsguCqDGX0bCmf2enFrNQUFD72y
	 H0DEcVA3Hp9YCIyo8hQPI2pR8LJFrBkCK+I1Wm5had/4lKaL5otgv9gX94ZfDipBji
	 UL3oBzjRp2SB4/q/G4O2/0nmG1HnaXIQb/DqLHgFRnwoVhho6Vqr6M0R5iEG7JHrmA
	 vsINwfgMCYe0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VtpFm2NqBz4x12;
	Tue,  4 Jun 2024 21:26:36 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/6] KVM: PPC: Book3S HV: Add one-reg interface for
 DEXCR register
In-Reply-To: <171741327891.6631.10339033341166150910.stgit@linux.ibm.com>
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
 <171741327891.6631.10339033341166150910.stgit@linux.ibm.com>
Date: Tue, 04 Jun 2024 21:26:34 +1000
Message-ID: <87cyox2bkl.fsf@mail.lhotse>
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
Cc: atrajeev@linux.vnet.ibm.com, sbhat@linux.ibm.com, corbet@lwn.net, jniethe5@gmail.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:
> The patch adds a one-reg register identifier which can be used to
> read and set the DEXCR for the guest during enter/exit with
> KVM_REG_PPC_DEXCR. The specific SPR KVM API documentation
> too updated.
>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  Documentation/virt/kvm/api.rst            |    1 +
>  arch/powerpc/include/uapi/asm/kvm.h       |    1 +
>  arch/powerpc/kvm/book3s_hv.c              |    6 ++++++
>  tools/arch/powerpc/include/uapi/asm/kvm.h |    1 +
 
Headers under tools/ are not supposed to be updated directly, they're
synced later by the perf developers.

See: https://lore.kernel.org/all/ZlYxAdHjyAkvGtMW@x1/

cheers
