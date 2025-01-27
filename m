Return-Path: <linuxppc-dev+bounces-5603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 982F9A1DAB6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 17:39:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhYz93r46z2yvk;
	Tue, 28 Jan 2025 03:39:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737995957;
	cv=none; b=ae3Eak4WX9ZB04hHWNUSa/rzXYwKKNHR51tZziOkMPNsmnBAdrbkYktNxnqMp01HCPtPBPlTqACyrUigL6ApTDKW0kfymluFcS+wQ649TAAZeVwBjyzXX1goW4kh7vox7sPfx5JyGwBDERleRDr7JKGsMQsVhJwfcI5DFKCzfzCiq8J4rcRE2x5dtNX1bhMp6XK5tpCkSXlkQ9CB8NoyRB7xiUEO8mPR1nzQZnYL/OGE9xMijCaMG01uRwwCwiWV/6Gtp9BE0ekgV0/Y1X9ISWzkOp5vkfBs8oZ7rjPCSaoERfGpoZFougifeQzcYtaMEDWzz2A4mjOmyi69O1dKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737995957; c=relaxed/relaxed;
	bh=0kmLUKaJ3BMvvTn/QnKIriM4RQyDYfxaJMLk0iUSExE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A55sJW+zrkzNWa0ERgNmmVdMJVgeNGLTFPdrdbuRGgxKOOM4EW6h9YGX0LmCACnmBiLbs6d4FNKb88aNqbhosDteuu7IY5YWf2h4CeCKjFMbfn2HHkebOYmVjeTI4MTozCdZEaLEep+bQ/HxCMqWtqyh1NpcG757KXWtnqiTp8xGL4IqPxGMhQ+qqY4k0AuxkyAQ29xe3M2yY/mpW/XhJcntveJVRPPZClBeqJCCmICFWDlkV5+GartkEzafnwLJuMw9K8YHF59ZEimkMghZTaKVgLIas3gpxq5a1b3cauammyszyrdaDtIAVn8P+wbMuS15FmuwdfYeAoW8OHOjgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KjbXtwYy; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KjbXtwYy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhYz83wkBz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 03:39:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 059E35C1178;
	Mon, 27 Jan 2025 16:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40C3C4CED2;
	Mon, 27 Jan 2025 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737995953;
	bh=fmZlVwU6uR12bQbSxMQf1gRYU1EYKK1u0Z90fzYu2zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjbXtwYylY77rIpZgK3aGfJ56B1/5Xw37p2eUDiAEdIfdrEuMSNA4Cm5qPP4ZRW0v
	 NPofe0Y4Rjf9IIo9dFFq4V/yQY8fpvCThe7/ZMffHtIvOIwRUFgf09d7RS5v4mKh8k
	 vonNl59vSBwaT8RKyBTUXlEOL0Jjo2wwyyjaE2pJrKji8YizjYv69Le9B0XMksAjl5
	 O+jbchyBHlqeiCTTnqxadWhPuV0eI63+E53B3F8rRzs+vg7nCyQvA/Hn9SzDgbAyx2
	 HcfPYVwKfTpHiwfJAN8b7bE1E31SKSXV9eEcsPxzf+sdAph0HPbgBYkWigadPBVumj
	 e/W2scjh0n5wA==
Date: Mon, 27 Jan 2025 16:39:06 +0000
From: Will Deacon <will@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, tglx@linutronix.de,
	akpm@linux-foundation.org, bhe@redhat.com, hbathini@linux.ibm.com,
	sourabhjain@linux.ibm.com, adityag@linux.ibm.com,
	songshuaishuai@tinylab.org, takakura@valinux.co.jp,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	jonnyc@amazon.com
Subject: Re: [PATCH v6 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Message-ID: <20250127163905.GC25757@willie-the-truck>
References: <20241204142003.32859-1-farbere@amazon.com>
 <20241204142003.32859-2-farbere@amazon.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204142003.32859-2-farbere@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 04, 2024 at 02:20:02PM +0000, Eliav Farber wrote:
> Consolidate the machine_kexec_mask_interrupts implementation into a common
> function located in a new file: kernel/irq/kexec.c. This removes duplicate
> implementations from architecture-specific files in arch/arm, arch/arm64,
> arch/powerpc, and arch/riscv, reducing code duplication and improving
> maintainability.
> 
> The new implementation retains architecture-specific behavior for
> CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD, which was previously implemented
> for ARM64. When enabled (currently for ARM64), it clears the active state
> of interrupts forwarded to virtual machines (VMs) before handling other
> interrupt masking operations.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> V5 -> V6:
>  - Change GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD to not be user selectable.
> 
>  arch/arm/kernel/machine_kexec.c   | 23 ------------------
>  arch/arm64/Kconfig                |  1 +
>  arch/arm64/kernel/machine_kexec.c | 31 ------------------------
>  arch/powerpc/include/asm/kexec.h  |  1 -
>  arch/powerpc/kexec/core.c         | 22 -----------------
>  arch/powerpc/kexec/core_32.c      |  1 +
>  arch/riscv/kernel/machine_kexec.c | 23 ------------------
>  include/linux/irq.h               |  3 +++
>  kernel/irq/Kconfig                |  6 +++++
>  kernel/irq/Makefile               |  2 +-
>  kernel/irq/kexec.c                | 40 +++++++++++++++++++++++++++++++
>  11 files changed, 52 insertions(+), 101 deletions(-)
>  create mode 100644 kernel/irq/kexec.c
> 
> diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
> index 80ceb5bd2680..dd430477e7c1 100644
> --- a/arch/arm/kernel/machine_kexec.c
> +++ b/arch/arm/kernel/machine_kexec.c
> @@ -127,29 +127,6 @@ void crash_smp_send_stop(void)
>  	cpus_stopped = 1;
>  }
>  
> -static void machine_kexec_mask_interrupts(void)
> -{
> -	unsigned int i;
> -	struct irq_desc *desc;
> -
> -	for_each_irq_desc(i, desc) {
> -		struct irq_chip *chip;
> -
> -		chip = irq_desc_get_chip(desc);
> -		if (!chip)
> -			continue;
> -
> -		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
> -			chip->irq_eoi(&desc->irq_data);
> -
> -		if (chip->irq_mask)
> -			chip->irq_mask(&desc->irq_data);
> -
> -		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
> -			chip->irq_disable(&desc->irq_data);
> -	}
> -}
> -
>  void machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 100570a048c5..dcc3551cf6c2 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -149,6 +149,7 @@ config ARM64
>  	select GENERIC_IDLE_POLL_SETUP
>  	select GENERIC_IOREMAP
>  	select GENERIC_IRQ_IPI
> +	select GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD

Is this really specific to VMs? In the new code, it's just controlling
this part of the old code:

> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 82e2203d86a3..6f121a0164a4 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -207,37 +207,6 @@ void machine_kexec(struct kimage *kimage)
>  	BUG(); /* Should never get here. */
>  }
>  
> -static void machine_kexec_mask_interrupts(void)
> -{
> -	unsigned int i;
> -	struct irq_desc *desc;
> -
> -	for_each_irq_desc(i, desc) {
> -		struct irq_chip *chip;
> -		int ret;
> -
> -		chip = irq_desc_get_chip(desc);
> -		if (!chip)
> -			continue;
> -
> -		/*
> -		 * First try to remove the active state. If this
> -		 * fails, try to EOI the interrupt.
> -		 */
> -		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);

which is about active interrupts. Why can't that happen for the host?

Will

