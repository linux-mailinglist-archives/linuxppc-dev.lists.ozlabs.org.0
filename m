Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33036D8BFB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 02:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsMzX3hDnz3fq7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 10:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsMxc6Q9Fz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 10:36:20 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PsMxc5vFkz4xFZ; Thu,  6 Apr 2023 10:36:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PsMxc57kcz4xFL;
	Thu,  6 Apr 2023 10:36:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, kvm@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
In-Reply-To: <ZAgsR04beDcARCiw@cleo>
References: <ZAgsR04beDcARCiw@cleo>
Subject: Re: [PATCH 0/3] powerpc/kvm: Enable HV KVM guests to use prefixed instructions to access emulated MMIO
Message-Id: <168074126988.3672916.555286026450877376.b4-ty@ellerman.id.au>
Date: Thu, 06 Apr 2023 10:34:29 +1000
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
Cc: Michael Neuling <mikey@neuling.org>, kvm-ppc@vger.kernel.org, Nick Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 08 Mar 2023 17:33:43 +1100, Paul Mackerras wrote:
> This series changes the powerpc KVM code so that HV KVM can fetch
> prefixed instructions from the guest in those situations where there
> is a need to emulate an instruction, which for HV KVM means emulating
> loads and stores to emulated MMIO devices.  (Prefixed instructions
> were introduced with POWER10 and Power ISA v3.1, and consist of two
> 32-bit words, called the prefix and the suffix.)
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/3] powerpc/kvm: Make kvmppc_get_last_inst() produce a ppc_inst_t
      https://git.kernel.org/powerpc/c/acf17878da680a0c11c0bcb8a54b4f676ff39c80
[2/3] powerpc/kvm: Fetch prefixed instructions from the guest
      https://git.kernel.org/powerpc/c/953e37397fb61be61f095d36972188bac5235021
[3/3] powerpc/kvm: Enable prefixed instructions for HV KVM and disable for PR KVM
      https://git.kernel.org/powerpc/c/a3800ef9c48c4497dafe5ede1b65d91d9ef9cf1e

cheers
