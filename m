Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12980C59A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 11:06:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ACbBRqCH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpcpV4xFLz3c0H
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 21:06:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ACbBRqCH;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spcnf2lbNz30NK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 21:05:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702289137;
	bh=rlfqbyyd+AtkXsEpEv1WncfhVdk1Vp9VajzWq/dwkls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ACbBRqCHBrv36OFbZ0Rd6BYgudHg0So7dfIkRI+ALi69BnOELtAhdoiOVsG0fBI22
	 uNZPrm0xDtQ1g7ImuCCHtLZ6DqUqzp1r/nBx0XHJPUom0BHo5EI6qpYKvuFylgaYP3
	 e49sJ8Kv3jUs6ZpqOAR2Vey5GOTun+AwdHzBhR0voeQN5xfTvTzu6X5nRDTYV3wit4
	 4xyOCC45hLG9bAVIteG5T7J9El3W11TYm01YgfqKhIGUMzBl6sPUR5+qvXZi0BA8cQ
	 MrX4nGOg/2CXUVZwOeHdk4Ms82Pd00wVbDyM20JmVnKNxsXjaviTUJ1xMt0Y5CzjwW
	 tGVcnbeVDM5TA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpcnY1yL4z4wdD;
	Mon, 11 Dec 2023 21:05:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH 1/1] powerpc/debug: implement HAVE_USER_RETURN_NOTIFIER
In-Reply-To: <475A60AEEAA99F6C+20231211025054.885-1-luming.yu@shingroup.cn>
References: <475A60AEEAA99F6C+20231211025054.885-1-luming.yu@shingroup.cn>
Date: Mon, 11 Dec 2023 21:05:32 +1100
Message-ID: <87plzddpg3.fsf@mail.lhotse>
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luming Yu <luming.yu@shingroup.cn> writes:

> The support for user return notifier infrastructure
> is hooked into powerpc architecture.
> ---
>  arch/powerpc/Kconfig                    |  1 +
>  arch/powerpc/include/asm/entry-common.h | 16 ++++++++++++++++
>  arch/powerpc/include/asm/thread_info.h  |  2 ++
>  arch/powerpc/kernel/process.c           |  2 ++
>  4 files changed, 21 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/entry-common.h
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c10229c0243c..b968068cc04a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -277,6 +277,7 @@ config PPC
>  	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
>  	select HAVE_STATIC_CALL			if PPC32
>  	select HAVE_SYSCALL_TRACEPOINTS
> +	select HAVE_USER_RETURN_NOTIFIER
>  	select HAVE_VIRT_CPU_ACCOUNTING
>  	select HAVE_VIRT_CPU_ACCOUNTING_GEN
>  	select HOTPLUG_SMT			if HOTPLUG_CPU
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> new file mode 100644
> index 000000000000..51f1eb767696
> --- /dev/null
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef ARCH_POWERPC_ENTRY_COMMON_H
> +#define ARCH_POWERPC_ENTRY_COMMON_H
> +
> +#include <linux/user-return-notifier.h>
> +
> +static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
> +						  unsigned long ti_work)
> +{
> +	if (ti_work & _TIF_USER_RETURN_NOTIFY)
> +		fire_user_return_notifiers();
> +}
> +
> +#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare

AFAICS this is never called because we don't use CONFIG_GENERIC_ENTRY ?

cheers
