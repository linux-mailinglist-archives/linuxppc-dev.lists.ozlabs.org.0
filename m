Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14A81B447
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:48:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnGv1Mjzz75Xd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:48:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwnCN1Fsfz3w7p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:45:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SwnCN0Kd0z4xdZ;
	Thu, 21 Dec 2023 21:45:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaibhav Jain <vaibhav@linux.ibm.com>
In-Reply-To: <20231201132618.555031-1-vaibhav@linux.ibm.com>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH 00/12] KVM: PPC: Nested APIv2 : Performance improvements
Message-Id: <170315547865.2197670.7761512990003222623.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:44:38 +1100
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, kconsul@linux.vnet.ibm.com, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 01 Dec 2023 18:56:05 +0530, Vaibhav Jain wrote:
> This patch series introduces series of performance improvements to recently
> added support for Nested APIv2 PPC64 Guests via [1]. Details for Nested
> APIv2 for PPC64 Guests is available in Documentation/powerpc/kvm-nested.rst.
> 
> This patch series introduces various optimizations for a Nested APIv2
> guests namely:
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[01/12] KVM: PPC: Book3S HV nestedv2: Invalidate RPT before deleting a guest
        https://git.kernel.org/powerpc/c/7d370e1812b9a5f5cc68aaa5991bf7d31d8ff52c
[02/12] KVM: PPC: Book3S HV nestedv2: Avoid reloading the tb offset
        https://git.kernel.org/powerpc/c/e0d4acbcba3f2d63dc15bc5432c8e26fc9e19675
[03/12] KVM: PPC: Book3S HV nestedv2: Do not check msr on hcalls
        https://git.kernel.org/powerpc/c/63ccae78cd88b52fb1d598ae33fa8408ce067b30
[04/12] KVM: PPC: Book3S HV nestedv2: Get the PID only if needed to copy tofrom a guest
        https://git.kernel.org/powerpc/c/e678748a8dca5b57041a84a66577f6168587b3f7
[05/12] KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0
        https://git.kernel.org/powerpc/c/ec0f6639fa8853cf6bfdfc3588aada7eeb7e5e37
[06/12] KVM: PPC: Book3S HV: Handle pending exceptions on guest entry with MSR_EE
        https://git.kernel.org/powerpc/c/ecd10702baae5c16a91d139bde7eff84ce55daee
[07/12] KVM: PPC: Book3S HV nestedv2: Do not inject certain interrupts
        https://git.kernel.org/powerpc/c/df938a5576f3f3b08e1f217c660385c0d58a0b91
[08/12] KVM: PPC: Book3S HV nestedv2: Avoid msr check in kvmppc_handle_exit_hv()
        https://git.kernel.org/powerpc/c/a9a3de530d7531bf6cd3f6ccda769cd94c1105a0
[09/12] KVM: PPC: Book3S HV nestedv2: Do not call H_COPY_TOFROM_GUEST
        https://git.kernel.org/powerpc/c/4bc8ff6f170c78f64446c5d5f9ef6771eefd3416
[10/12] KVM: PPC: Book3S HV nestedv2: Register the VPA with the L0
        https://git.kernel.org/powerpc/c/db1dcfae1dae3c042f348175ac0394e2fc14b1b3
[11/12] KVM: PPC: Reduce reliance on analyse_instr() in mmio emulation
        https://git.kernel.org/powerpc/c/797a5af8fc7297b19e5c6b1713956ebf1e6c1cde
[12/12] KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception
        https://git.kernel.org/powerpc/c/180c6b072bf360b686e53d893d8dcf7dbbaec6bb

cheers
