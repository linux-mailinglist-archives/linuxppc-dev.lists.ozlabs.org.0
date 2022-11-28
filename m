Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B32E3639EC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 02:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL73C40bHz3dtk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 12:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fs+r8YGZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fs+r8YGZ;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL72H2KFVz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 12:20:37 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id q12so4940000pfn.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 17:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJd6+e8mhcCcTivAC/HlgoAd1qiwjLY2uyKhidA3xg4=;
        b=Fs+r8YGZ3cbCTHkuVKyUuLjHDBcq5XFLjc1JWFMwFJ8getRNfxDYHUrz4n2Hc2Z/0b
         Ozws+n2eNC8XZTsARq07YQflGkLptdkeOjFuNLM5328Ngdi3eABfxDdQt7unkYU0aFc5
         Rpl89htMhQzVWgFJW/q6LJ2INJc7tFiv2SZPXLSWAxgB53zKmG+ASMnDdd3yUo35neU6
         M/ER0mSKfED1Y/qlt3nSrYmXmO86kGIxqvWouakCyXmK8V7TS+yVZ//NoBE60bjkSrLn
         db7fGpkZJjCwhIF/dKL9zhojv53Zrpdwhz5RHt//yqaGnSvKhsix2wrrQ4Ka+uFKdeQq
         M3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJd6+e8mhcCcTivAC/HlgoAd1qiwjLY2uyKhidA3xg4=;
        b=pUNV+tF5LLYZtFjBfF/E5B4+GVz3jlrX67ACB5FXOXai4ImlImj8lJRjzzt98OPLXX
         e0bRB/oeQ/aIkxzQpHTV8R8hMNAHMvUOH8n8UIVunMdMTFTsqI3MMCQhbJkFzwjtF7go
         rE9IxdIGYK5uf7yINz55krJ70tHOtajjGK8xeZxpH7snFZxXP6CrPF0Fws8WJay5EgRL
         leph8gN0B74ceVk2KIMqCxPzh7+XMabgfC0z9HtpA2G3KKSJUOI129CXzHusfZ4VZd6F
         KC0xp8Ae+HjpAjk1VTZNP84RC+NBqoy99X084ovWqOklGQCD30C75+Q39r1U4eQLXABV
         DJoA==
X-Gm-Message-State: ANoB5plb9KODvWEuEecqBiVdr4YpKWwbhbj92KcjABGhWTxbMV7nGyGQ
	5kW3WO5OCwyxM/Ec+wgi85ZTyr3ANcg=
X-Google-Smtp-Source: AA0mqf7iRiPqx0a5Er2MUuU1/h/RqsQCxFNdf8BbpVve+kiWovY8rB5REL1SFuuAttPHdO8oTcaTmA==
X-Received: by 2002:a63:164f:0:b0:477:f9fa:2a1e with SMTP id 15-20020a63164f000000b00477f9fa2a1emr7599686pgw.87.1669598435015;
        Sun, 27 Nov 2022 17:20:35 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902650700b001801aec1f6bsm7427872plk.141.2022.11.27.17.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 17:20:34 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 11:20:30 +1000
Message-Id: <CONJ8YH1QG4L.NJTVBL81SQ6V@bobo>
Subject: Re: [PATCH] powerpc/64s: Add missing declaration for
 machine_check_early_boot()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221125132521.2167039-1-mpe@ellerman.id.au>
In-Reply-To: <20221125132521.2167039-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Nov 25, 2022 at 11:25 PM AEST, Michael Ellerman wrote:
> There's no declaration for machine_check_early_boot(), which leads to a
> build failure with W=3D1. Add one.
>
> Fixes: 2f5182cffa43 ("powerpc/64s: early boot machine check handler")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/interrupt.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/=
asm/interrupt.h
> index 4745bb9998bd..6d8492b6e2b8 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -602,6 +602,7 @@ ____##func(struct pt_regs *regs)
>  /* kernel/traps.c */
>  DECLARE_INTERRUPT_HANDLER_NMI(system_reset_exception);
>  #ifdef CONFIG_PPC_BOOK3S_64
> +DECLARE_INTERRUPT_HANDLER_RAW(machine_check_early_boot);
>  DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception_async);
>  #endif
>  DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
> --=20
> 2.38.1

