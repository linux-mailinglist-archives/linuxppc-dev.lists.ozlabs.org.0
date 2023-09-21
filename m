Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C807A9317
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:29:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrqq02xrDz3cG3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrqpW6PVDz3cTZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:28:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RrqpW44ZDz4x5k;
	Thu, 21 Sep 2023 19:28:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Jordan Niethe <jniethe5@gmail.com>
In-Reply-To: <20230914030600.16993-1-jniethe5@gmail.com>
References: <20230914030600.16993-1-jniethe5@gmail.com>
Subject: Re: [PATCH v5 00/11] KVM: PPC: Nested APIv2 guest support
Message-Id: <169528846875.874757.8861595746180557787.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:27:48 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, npiggin@gmail.com, David.Laight@ACULAB.COM, kvm-ppc@vger.kernel.org, sachinp@linux.ibm.com, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Sep 2023 13:05:49 +1000, Jordan Niethe wrote:
> A nested-HV API for PAPR has been developed based on the KVM-specific
> nested-HV API that is upstream in Linux/KVM and QEMU. The PAPR API had
> to break compatibility to accommodate implementation in other
> hypervisors and partitioning firmware. The existing KVM-specific API
> will be known as the Nested APIv1 and the PAPR API will be known as the
> Nested APIv2.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[01/11] KVM: PPC: Always use the GPR accessors
        https://git.kernel.org/powerpc/c/0e85b7df9cb0c65f840109159ef6754c783e07a0
[02/11] KVM: PPC: Introduce FPR/VR accessor functions
        https://git.kernel.org/powerpc/c/52425a3b3c11cec58cf66e4c897fc1504f3911a9
[03/11] KVM: PPC: Rename accessor generator macros
        https://git.kernel.org/powerpc/c/2a64bc673133346a7a3bd163f2e6048bd1788727
[04/11] KVM: PPC: Use accessors for VCPU registers
        https://git.kernel.org/powerpc/c/7028ac8d174f28220f0e2de0cb3346cd3c31976d
[05/11] KVM: PPC: Use accessors for VCORE registers
        https://git.kernel.org/powerpc/c/c8ae9b3c6e7f22a4b71e42edb0fc3942aa7a7c42
[06/11] KVM: PPC: Book3S HV: Use accessors for VCPU registers
        https://git.kernel.org/powerpc/c/ebc88ea7a6ad0ea349df9c765357d3aa4e662aa9
[07/11] KVM: PPC: Book3S HV: Introduce low level MSR accessor
        https://git.kernel.org/powerpc/c/6de2e837babb411cfb3cdb570581c3a65576ddaf
[08/11] KVM: PPC: Add helper library for Guest State Buffers
        https://git.kernel.org/powerpc/c/6ccbbc33f06adaf79acde18571c6543ad1cb4be6
[09/11] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
        https://git.kernel.org/powerpc/c/dfcaacc8f970c6b4ea4e32d2186f2bea4a1d5255
[10/11] KVM: PPC: Add support for nestedv2 guests
        https://git.kernel.org/powerpc/c/19d31c5f115754c369c0995df47479c384757f82
[11/11] docs: powerpc: Document nested KVM on POWER
        https://git.kernel.org/powerpc/c/476652297f94a2e5e5ef29e734b0da37ade94110

cheers
