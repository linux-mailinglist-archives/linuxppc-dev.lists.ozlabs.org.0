Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E361F1A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 12:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5TF10Wsxz3cMf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 22:16:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CisQrfLw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CisQrfLw;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5TD6238bz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 22:15:15 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so9951838pjd.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 03:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41Q3Rt2neSqcBAk0jFkS+Gtrc9tMldgHUWZ2TfpLFXM=;
        b=CisQrfLwVWVlyCy3WjOC4SN0UVZq9nim2SEHkICf1c6GexYDt+9p1RG+0FcNQnRWge
         uWNox6NngjMQZAp8gXmGOCt06nX27Uk0Q+wOEyotySJH8HV7QOKtqAZUY9otJW6sNAY/
         ImyZb3HA1m3rdjyeUgAMycap9VeC93cQW6zhZPdbNvULKeC0lE7ONa9Empui9w5uAn7+
         pKjBetX7KBwONNi4ZaO3dw/eUhYX9e8oGlLrRwzO2lfd/wgPRReL3p8GjLJcp4MnTuQ/
         bQAZ+zOQIQCwHwA5CbFqaIAwrpe/XYwgp0aiyDtSy7NQytucfXkSzLU9ocGMKSChekIZ
         Z99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=41Q3Rt2neSqcBAk0jFkS+Gtrc9tMldgHUWZ2TfpLFXM=;
        b=PVuSAqaZYEwsU4AG12JZ4lO4GD0de3eLnDTy0tLc59Lz7jDgrh7A5h9X628EpHHQx0
         mqqemZLqlLc2KQThnq7b3e0GzNVOySSICdFnrh/uvjJKXbqKKUB4+WYQpF83CjvUnQki
         fASe6Y1R91asbEtr9x8HjWdFJrZlbSbXXk/LnbVufs6RF8GGk4cs4ThVpX72NapOna9q
         LiSicTYGcgMMpTszBxrzGbuKKWbepdgcK1+pfNFuhmqv7JFPCX8MOd1GoXyLS7f9TPhe
         i9UdIAWYppP/oQ+3svE9zZw4y9h+Ce4v0+7+AvaJlRwR3/n8SybIjcMof2mtVNjWZhFh
         O/tg==
X-Gm-Message-State: ACrzQf2V4D8FXjB88aE3bpY0FZH4UiHzxze6ZNK8GxI52q8SVSwOz0YO
	4r6n4utUe8uJB4bBoGOnx2c=
X-Google-Smtp-Source: AMsMyM7DYQQlIOATstAFP2AD9y8o1nL82UZ+ErmXXw5DFTl2QF3ey62fWxjFtRpF/XpD5eeDxP32qQ==
X-Received: by 2002:a17:90a:cf06:b0:212:d9ab:811b with SMTP id h6-20020a17090acf0600b00212d9ab811bmr51875358pju.65.1667819714344;
        Mon, 07 Nov 2022 03:15:14 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id z11-20020a1709027e8b00b00186f81a074fsm4697120pla.290.2022.11.07.03.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 03:15:12 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 21:15:08 +1000
Message-Id: <CO60QSLZNBQ0.3NK6WVSYR70FZ@bobo>
Subject: Re: [PATCH 4/5] powerpc/kprobes: Setup consistent pt_regs across
 kprobes, optprobes and KPROBES_ON_FTRACE
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
 <1d0cb183f48c4179646c0c5e183fd296da58f4ca.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <1d0cb183f48c4179646c0c5e183fd296da58f4ca.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Oct 21, 2022 at 3:29 AM AEST, Naveen N. Rao wrote:
> Ensure a more consistent pt_regs across kprobes, optprobes and
> KPROBES_ON_FTRACE:
> - Drop setting trap to 0x700 under optprobes. This is not accurate and
>   is unnecessary. Instead, zero it out for both optprobes and
>   KPROBES_ON_FTRACE.

Okay I think.

> - Save irq soft mask in the ftrace handler, similar to what we do in
>   optprobes and trap-based kprobes.

This advertises the irqs status of regs correctly, whereas previously
it was uninitialised.

> - Drop setting orig_gpr3 and result to zero in optprobes. These are not
>   relevant under kprobes and should not be used by the handlers.

This is for CFAR, which we can't get anyway because we just branched
here. I would rather zero it explicitly though.

Otherwise,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/optprobes_head.S        | 5 +----
>  arch/powerpc/kernel/trace/ftrace_mprofile.S | 6 ++++++
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/o=
ptprobes_head.S
> index cd4e7bc32609d3..06df09b4e8b155 100644
> --- a/arch/powerpc/kernel/optprobes_head.S
> +++ b/arch/powerpc/kernel/optprobes_head.S
> @@ -49,11 +49,8 @@ optprobe_template_entry:
>  	/* Save SPRS */
>  	mfmsr	r5
>  	PPC_STL	r5,_MSR(r1)
> -	li	r5,0x700
> -	PPC_STL	r5,_TRAP(r1)
>  	li	r5,0
> -	PPC_STL	r5,ORIG_GPR3(r1)
> -	PPC_STL	r5,RESULT(r1)
> +	PPC_STL	r5,_TRAP(r1)
>  	mfctr	r5
>  	PPC_STL	r5,_CTR(r1)
>  	mflr	r5
> diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/k=
ernel/trace/ftrace_mprofile.S
> index d031093bc43671..f82004089426e6 100644
> --- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
> +++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
> @@ -107,6 +107,12 @@
>  	PPC_STL	r9, _CTR(r1)
>  	PPC_STL	r10, _XER(r1)
>  	PPC_STL	r11, _CCR(r1)
> +#ifdef CONFIG_PPC64
> +	lbz     r7, PACAIRQSOFTMASK(r13)
> +	std     r7, SOFTE(r1)
> +#endif
> +	li	r8, 0
> +	PPC_STL	r8, _TRAP(r1)
>  	.endif
> =20
>  	/* Load &pt_regs in r6 for call below */
> --=20
> 2.38.0

