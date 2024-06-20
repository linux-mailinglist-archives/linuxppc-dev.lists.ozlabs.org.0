Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C091084D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 16:30:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4jZz1ZHPz3dVv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 00:30:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4jYm71CGz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 00:29:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W4jYn5TNbz4wyg;
	Fri, 21 Jun 2024 00:29:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
References: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
Subject: Re: [PATCH v2 0/8] KVM: PPC: Book3S HV: Nested guest migration fixes
Message-Id: <171889374990.827284.7391262828595235764.b4-ty@ellerman.id.au>
Date: Fri, 21 Jun 2024 00:29:09 +1000
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
Cc: corbet@lwn.net, atrajeev@linux.ibm.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, npiggin@gmail.com, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 05 Jun 2024 13:06:00 +0000, Shivaprasad G Bhat wrote:
> The series fixes the issues exposed by the kvm-unit-tests[1]
> sprs-migration test.
> 
> The SDAR, MMCR3 were seen to have some typo/refactoring bugs.
> The first two patches fix them.
> 
> The remaining patches take care of save-restoring the guest
> state elements for DEXCR, HASHKEYR and HASHPKEYR SPRs with PHYP
> during entry-exit. The KVM_PPC_REG too for them are missing which
> are added for use by the QEMU.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/8] KVM: PPC: Book3S HV: Fix the set_one_reg for MMCR3
      https://git.kernel.org/powerpc/c/f9ca6a10be20479d526f27316cc32cfd1785ed39
[2/8] KVM: PPC: Book3S HV: Fix the get_one_reg of SDAR
      https://git.kernel.org/powerpc/c/009f6f42c67e9de737d6d3d199f92b21a8cb9622
[3/8] KVM: PPC: Book3S HV: Add one-reg interface for DEXCR register
      https://git.kernel.org/powerpc/c/1a1e6865f516696adcf6e94f286c7a0f84d78df3
[4/8] KVM: PPC: Book3S HV nestedv2: Keep nested guest DEXCR in sync
      https://git.kernel.org/powerpc/c/2d6be3ca3276ab30fb14f285d400461a718d45e7
[5/8] KVM: PPC: Book3S HV: Add one-reg interface for HASHKEYR register
      https://git.kernel.org/powerpc/c/e9eb790b25577a15d3f450ed585c59048e4e6c44
[6/8] KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHKEYR in sync
      https://git.kernel.org/powerpc/c/1e97c1eb785fe2dc863c2bd570030d6fcf4b5e5b
[7/8] KVM: PPC: Book3S HV: Add one-reg interface for HASHPKEYR register
      https://git.kernel.org/powerpc/c/9a0d2f4995ddde3022c54e43f9ece4f71f76f6e8
[8/8] KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHPKEYR in sync
      https://git.kernel.org/powerpc/c/0b65365f3fa95c2c5e2094739151a05cabb3c48a

cheers
