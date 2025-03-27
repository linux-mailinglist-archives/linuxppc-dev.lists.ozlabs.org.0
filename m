Return-Path: <linuxppc-dev+bounces-7347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC9A72913
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 04:24:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNTXh5VSmz2yqP;
	Thu, 27 Mar 2025 14:24:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743045860;
	cv=none; b=fTAVW1sdTPkL6KayS6XAEes9UATYrPKZQzwLNJdT7TPrF2Ajj9CKgw7B4y3rudNu3YMCiWe/ARoF6N3py5lClJRT4gtCjfHL7MPBC075AYmjhF2VVYfgEDsyu2DLktzDzrNv2qsYPGau6mk/9E0fXOSJhqOKQIrt807R2Z9WwujQ9jw0ZMp5fxNoPH/z1h7ornOxl+QoOEW86/rB9F8KTq5DQaQItFlRtAd58hK1mCIWd+MHYZzuXVpbyrUleUnVYFPYTPGpFNS9oAtRENsQK7arUE2H9cNvGrpPH3q+/auBdCIuBr0bq/UWHG2OKociGhUPiiyWxctCJFv3ZqYkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743045860; c=relaxed/relaxed;
	bh=nbHOE3LAzwUNXQohBY3f+MJtijH6oB+n40/Np3jImiY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=G82lZrZG6NE3vCqjji/lyVG8QFNiwHiq6+/EQQVw9T1O2WENFSB2wd5BCOjRQtKqx3mPCBxykXc0x8T7ACq+tK8WBuOmGQmM5PjQxsxxN/oZ7kHfGJ4og7Pj00kpZAdXOJ6UzjbIH9cGa4kpGNC4Ds8/LJsk0/n2U4yEuAVmSo2BMVQsCA4QiOL3TKmZAZ+yAl6u0qh+XS09e/lBzUGog3NnWmfUsUPNGP5vYzdJxzoZDcjQpZ7SI/aHNMOJiLrlaBSscS7UHC7dIdUl8hxtUI9ZdOtqzww6RiU99OGEPnfiR5SIYwa+yw7LwbRiBdnEEC4wadS5ZRQdVryx0QVLMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UQJgvNz2; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UQJgvNz2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNTXg4cxKz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 14:24:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C66C6116B;
	Thu, 27 Mar 2025 03:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE74C4CEDD;
	Thu, 27 Mar 2025 03:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045856;
	bh=pfieFhDpfQvLevcNm0LMhPf+5kEs/vR8/60fuGlDo/s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UQJgvNz2l0z8fqtCdNnyUvqSjVoXL9wFCHHbvvPzybzC9+Gmf923AguCn+7ATs1dB
	 /l2CeBHujWK+xvCJN0M2aMdsKhViozJInjMMHMHuTHdemgu0HYqp/81iWGeZDsLvzd
	 rbyEySOqo0DaqGftGgf/4lE5qQCtgsvJfySatQPTo3xdKaI0+H3NF/GPTdd12tdB4i
	 IkHxpZ5h25C8oY/cPYvhAaPf+y26NAdF9cjddpEqLLo0nWxloMQ5npTdW/W8dkCepw
	 Jeb7lHih+Mj6k6AsS5KBshhrXBx4thVfrpsR6pUdWrEOLVPz8IvjinOfuk6M3fNFAf
	 cIwI8TWsAgfcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFB4380AAFD;
	Thu, 27 Mar 2025 03:24:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] KVM: x86: nVMX IRQ fix and VM teardown cleanups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304589224.1549280.1623157194395422949.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:52 +0000
References: <20250224235542.2562848-1-seanjc@google.com>
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev,
 zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org,
 maddy@linux.ibm.com, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, pbonzini@redhat.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aaronlewis@google.com, jmattson@google.com,
 yan.y.zhao@intel.com, rick.p.edgecombe@intel.com, kai.huang@intel.com,
 isaku.yamahata@intel.com
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Paolo Bonzini <pbonzini@redhat.com>:

On Mon, 24 Feb 2025 15:55:35 -0800 you wrote:
> This was _supposed_ to be a tiny one-off patch to fix a nVMX bug where KVM
> fails to detect that, after nested VM-Exit, L1 has a pending IRQ (or NMI).
> But because x86's nested teardown flows are garbage (KVM simply forces a
> nested VM-Exit to put the vCPU back into L1), that simple fix snowballed.
> 
> The immediate issue is that checking for a pending interrupt accesses the
> legacy PIC, and x86's kvm_arch_destroy_vm() currently frees the PIC before
> destroying vCPUs, i.e. checking for IRQs during the forced nested VM-Exit
> results in a NULL pointer deref (or use-after-free if KVM didn't nullify
> the PIC pointer).  That's patch 1.
> 
> [...]

Here is the summary with links:
  - [1/7] KVM: x86: Free vCPUs before freeing VM state
    https://git.kernel.org/riscv/c/17bcd7144263
  - [2/7] KVM: nVMX: Process events on nested VM-Exit if injectable IRQ or NMI is pending
    https://git.kernel.org/riscv/c/982caaa11504
  - [3/7] KVM: Assert that a destroyed/freed vCPU is no longer visible
    (no matching commit)
  - [4/7] KVM: x86: Don't load/put vCPU when unloading its MMU during teardown
    (no matching commit)
  - [5/7] KVM: x86: Unload MMUs during vCPU destruction, not before
    (no matching commit)
  - [6/7] KVM: x86: Fold guts of kvm_arch_sync_events() into kvm_arch_pre_destroy_vm()
    (no matching commit)
  - [7/7] KVM: Drop kvm_arch_sync_events() now that all implementations are nops
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



