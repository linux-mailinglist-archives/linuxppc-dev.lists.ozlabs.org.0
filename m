Return-Path: <linuxppc-dev+bounces-15182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B1FCEFE37
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 11:39:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djxrS50sfz2yFh;
	Sat, 03 Jan 2026 21:39:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767436760;
	cv=none; b=Y6NdzBvCG9wxPUW6PBlPwgF2JlQvEgGhCqIeolO4Mdc4KBBD9eju7lj9hDLPK12TsGYd8sVr5PoU7Myx/A2W69dIz5X1MLUO9W57HNrtczWxRDUvo5CuLHokC50+tJBK0ASu0Z1QjbRqmjLB32j+nZIz/veAhdPJC27QfNbvUOFH3af/CgqbnMVgxI7qypwb3BRxIP05a5Y2A9p78cJf2jC1mYvTON+sSlbGi47ENanIgyNPnFz/ptGR+pm13BBRaaAja+gQsX4kkwXBAJBBGmotKEEI30g6U8dXdHRAj2ieGvS0F7yQ5qlKqzsDILgLaPSiybkyzZNCPjeVrTVhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767436760; c=relaxed/relaxed;
	bh=TMsj1kYzVVF9a86NYvMtp9zyQLGIVbJNrRERdMeL7GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7YBgBEpHvob0DUKCqohCxSP6Fs7TaZuolDpOoYcNqv9AlHtuKZr02hZjuuySn5zfNZXJyj2ltJBP7JUxs/C8O97bL90pE3UfpmHZ8ZBtQQFBFQ9sN2lhgwiVBtkTVySqIw/AFb1IsPZKrpHcMnPsiq9w0R717oX9dFVhrKQVEilVPNceTD/hBgzLUF4H65s2zpi5gRtPIe9Kfrr/Pk4doQ6eljXXVFmHj3gwMMTTM8LvZsUWQssGOS1iX9nr9Gwd+LoSBL00jHtqcKMUtgaOYVQse8YOlIHMMaLjDVZAHSjk4g4YabIv0MBMFOInVFlMBv6sdFxqOk8WZtI548inA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z1jg//JS; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z1jg//JS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djxrR5Lbvz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 21:39:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60BB54399B;
	Sat,  3 Jan 2026 10:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1FBC113D0;
	Sat,  3 Jan 2026 10:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767436757;
	bh=6eyfh3jMX1J1eZ7cZHsALtCQzKd/TkTN6PNL8Hj5FaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z1jg//JS4ytc62BBpngrMbSU5yGEKn1srAHRgCUkCO9fj65ls944bDewGE6zLeu4P
	 vMci6Bsfe/NN6E34wTKgOEl8rDzMIJmU3tM7OJwmYRlMyvf4CDc/ER122LZRipU2Vz
	 RF2e8N6FPyB7SsHdCwuyHLIwOAfiVnrz4x28jAzC1tE2SQQYsGBMv3fMPDrsjveAnJ
	 Fa3zL7nlvEe1J37mftVhLG5204nGmJT6UiwOeZajvO2XCErEHsigcl3XQpMgCXgWy7
	 aywOE/mrgaLfqaGnBdoGrEP4ctDyywE/NpIRHCXQfVTFZ8sScz2e2QMSVgx42nRT21
	 pWZGjdvpZ9ZKg==
Message-ID: <f51557ff-412b-46e4-b968-78b4e4d9872d@kernel.org>
Date: Sat, 3 Jan 2026 11:39:12 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Implement ARCH_HAS_CC_CAN_LINK
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20251230-cc-can-link-powerpc-v1-1-82298df6e3bf@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251230-cc-can-link-powerpc-v1-1-82298df6e3bf@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/12/2025 à 08:06, Thomas Weißschuh a écrit :
> The generic CC_CAN_LINK detection does not handle different byte orders.
> This may lead to userprogs which are not actually runnable on the target
> kernel.

Isn't the kernel supposed to handle any userland endianess ? Macro 
SET_ENDIAN() is there for that as far as I understand.

And if you want to be complete, I think you should also check whether 
the ELF ABI is v1 or v2.

Christophe

> 
> Use architecture-specific logic supporting byte orders instead.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/powerpc/Kconfig | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9537a61ebae0..6bb2f90e97ea 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -127,6 +127,7 @@ config PPC
>   	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
>   	select ARCH_ENABLE_MEMORY_HOTPLUG
>   	select ARCH_ENABLE_MEMORY_HOTREMOVE
> +	select ARCH_HAS_CC_CAN_LINK
>   	select ARCH_HAS_COPY_MC			if PPC64
>   	select ARCH_HAS_CURRENT_STACK_POINTER
>   	select ARCH_HAS_DEBUG_VIRTUAL
> @@ -1342,6 +1343,20 @@ endif
>   config PPC_LIB_RHEAP
>   	bool
>   
> +config ARCH_CC_CAN_LINK
> +	bool
> +	default $(cc_can_link_user,$(m64-flag) -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
> +	default $(cc_can_link_user,$(m64-flag) -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
> +	default $(cc_can_link_user,$(m32-flag) -mlittle-endian) if CPU_LITTLE_ENDIAN
> +	default $(cc_can_link_user,$(m32-flag) -mbig-endian) if CPU_BIG_ENDIAN
> +
> +config ARCH_USERFLAGS
> +	string
> +	default "$(m64-flag) -mlittle-endian" if 64BIT && CPU_LITTLE_ENDIAN
> +	default "$(m64-flag) -mbig-endian" if 64BIT && CPU_BIG_ENDIAN
> +	default "$(m32-flag) -mlittle-endian" if CPU_LITTLE_ENDIAN
> +	default "$(m32-flag) -mbig-endian" if CPU_BIG_ENDIAN
> +
>   source "arch/powerpc/kvm/Kconfig"
>   
>   source "kernel/livepatch/Kconfig"
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cc-can-link-powerpc-5ddd2469fd5b
> 
> Best regards,


