Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDA303A14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 11:21:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ2nP2dRzzDqKh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 21:20:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=otcVSaDk; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ2l10cxTzDqyb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 21:18:51 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id n25so11217000pgb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 02:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=bY0+m4945nWumwbU1TQ36SLdrna7sXMlUaFEMn9azHM=;
 b=otcVSaDkyuN1IFfRVEUqE8c2bayHgbWl4fMLIM9/NfgujwypOXpNCcVfJqbv3XPmZ3
 m3T5caX+X2PFVmGS2PuAM3DSxmuqsEC/qtdlFRNyvNLgA2erWkj02+d+0ZXfH7NVvlXC
 vqRzjdUDLgbJtG4ELaHWDai/2D7gTuh3zm1QMuO71egNZ4GSOIWdHOcUpN6/oFiPSJMF
 A+60AwwtKXpNmPyHLosablQqAjRgC2NEXvZdVafBbW1JrK1peRmOMIj4xDbwwbTrEpz2
 w1GPLMXda9qvRv6Ra5qKFx5sNXiTBCmfFdzV36XhdCsAPC+RV/6TVAJqsyJCq9+mmAvj
 cawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bY0+m4945nWumwbU1TQ36SLdrna7sXMlUaFEMn9azHM=;
 b=WF/wWVSxy3xhOzKVZwmAzuI4oprFcG3BzVecSzjgq+3dcGpIE0W9Wg3WXwdW1Xd8+j
 s42/zS9Fjv7DDV/mgP3EpJ47w0dwv/OCKbGnPWxGaDOF+2N6cBBvPSWjx65oJ1vT6BvP
 1npV1KBxhRtgNGX1sh1kZG7k5UqePanOtczBiIxQ1s3b6qS9XgVAUoV9CVxTSFY+Jtj2
 yjNYSXnixifw+hstS22GAwJR2DuRrA+YANgV6ROBfcz03TzVFYbTyH8M0BoU72MxMGCn
 irN0Gb530oUhom0KdZfPuMQ2mLkwe7ogK9vLbCmv8CJUwaa9PKBZ0at+dO/XXObqGb/o
 JBYQ==
X-Gm-Message-State: AOAM532JAUZybYW6BwZiX5xuij+AoBGKFQOP5wf3+uOdbIDSe4ZFZmSA
 0vBxlyLxjpiZ7V6bOFIQUGk=
X-Google-Smtp-Source: ABdhPJxaG61OapcH+qCGgTpLGcWf8cvXcfM4YrAfMSY5mvjCygYR8PMQZXdWfG/BQof6ssxK0ITAqw==
X-Received: by 2002:a62:144c:0:b029:1c0:d62d:e16e with SMTP id
 73-20020a62144c0000b02901c0d62de16emr4542328pfu.25.1611656328201; 
 Tue, 26 Jan 2021 02:18:48 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id 77sm13765743pfz.100.2021.01.26.02.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 02:18:47 -0800 (PST)
Date: Tue, 26 Jan 2021 20:18:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 14/23] powerpc/syscall: Save r3 in regs->orig_r3
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <5d375bea8f519924e110842f6b0d05e83cd04470.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5d375bea8f519924e110842f6b0d05e83cd04470.1611585031.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1611656262.d3l09kg9o2.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 26, 2021 12:48 am:
> Save r3 in regs->orig_r3 in system_call_exception()
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/entry_64.S | 1 -
>  arch/powerpc/kernel/syscall.c  | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_6=
4.S
> index aa1af139d947..a562a4240aa6 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -278,7 +278,6 @@ END_BTB_FLUSH_SECTION
>  	std	r10,_LINK(r1)
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
> -	std	r3,ORIG_GPR3(r1)
>  	addi	r10,r1,STACK_FRAME_OVERHEAD
>  	ld	r11,exception_marker@toc(r2)
>  	std	r11,-16(r10)		/* "regshere" marker */

This misses system_call_vectored.

Thanks,
Nick

> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index cb415170b8f2..b66cfcbcb755 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -29,6 +29,8 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  {
>  	syscall_fn f;
> =20
> +	regs->orig_gpr3 =3D r3;
> +
>  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>  		BUG_ON(irq_soft_mask_return() !=3D IRQS_ALL_DISABLED);
> =20
> --=20
> 2.25.0
>=20
>=20
