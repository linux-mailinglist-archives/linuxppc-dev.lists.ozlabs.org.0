Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0461F01E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 11:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5Rzr4r01z3cf2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 21:19:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XbmFjgic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XbmFjgic;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5Ryy0ZPTz301Z
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 21:18:49 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id q1so10026388pgl.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 02:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmjQUldf2qDx9iVMe/xEfj1ayGFPpz+tm1TItnKoNXw=;
        b=XbmFjgicdCCoaa+c2oigZD61ty7oRGaFraTxlUNt2sAQZPOk4l4EJ8p+0h8HuWeq/B
         nxKjcXjhxCeDNzmUwgJyYE1tlVPEjsEs4CbWBvcIVyHbStRX5V7EDG27KAWm3yHBg6Nv
         6EFmaC9t0qGOm/xxHHm1Hr3ZlhPBIXB5FL5wcGOW49eoCcEIEKMzwL2lrbXNppibdWk3
         PznWDjOr3A1jIvBcphvNg/6pBB8DDN78zoF62JMx4VHE7gzWQj4NlLmHGEL+BWLRFBb2
         +BcmyK9skNzKJTZI1YOt6FaZjrChO2JzuwPckb9/EIynVR2Yex4hFs97anHGHxT+ynZc
         dKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xmjQUldf2qDx9iVMe/xEfj1ayGFPpz+tm1TItnKoNXw=;
        b=Rq7TV7fNKh80t95FGYTjcqv6Ji1c47O4G2DlzBS/RyJRG5o/iJzeUB2dw39TBwPMlq
         40SiuOCgm71mi9F4FeiNtgFFjoxrvrXaQLCPLDJw2a9IjmH2wPvFsAHVV4bN38jC4aEi
         P9m92LBG9K4CgZVD8ZKiBeRp31ViLp587EFmdMYDTIvVpheilP/XiPHqwOJChFEi96Iu
         NL8Ts1X8iEK18xuxir2TUodaQjQbosjEXtY+mU9nmOGFNX/DRfcc7wezleapiJoFBPor
         8X3n7o5kRQrmQs466EhSS3a4eAazLBf3wY6WTI8Mwc062s0n5YWvBz0rZqD7udiF2HOl
         Pb1Q==
X-Gm-Message-State: ACrzQf0/R5/bzfvgCbxC7MlR5UQLg37u8rqcsvtpelXyWGyfwRv7YRXU
	fn6m2inmpu9UsEgEUMpEXoQ=
X-Google-Smtp-Source: AMsMyM4TXI6oL+N4bExQrkqULTRvKY8ks2B6zqxCuLU16CQ+2tg0YoHDM4C1lx14xAqAp7VMhZy07Q==
X-Received: by 2002:a05:6a00:2386:b0:56c:b791:40f2 with SMTP id f6-20020a056a00238600b0056cb79140f2mr50288452pfc.4.1667816325605;
        Mon, 07 Nov 2022 02:18:45 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id p189-20020a6229c6000000b0056c08c87196sm4103840pfp.48.2022.11.07.02.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:18:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 20:18:40 +1000
Message-Id: <CO5ZJKALFM9H.3R8XSJI13L2PG@bobo>
Subject: Re: [PATCH 2/5] powerpc/kprobes: Have optimized_callback() use
 preempt_enable()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
 <1885bab182626c33d9bf6421f430abf924c521a5.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <1885bab182626c33d9bf6421f430abf924c521a5.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
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

On Fri Oct 21, 2022 at 3:28 AM AEST, Naveen N. Rao wrote:
> Similar to x86 commit 2e62024c265aa6 ("kprobes/x86: Use preempt_enable()
> in optimized_callback()"), change powerpc optprobes to use
> preempt_enable() rather than preempt_enable_no_resched() since powerpc
> also removed irq disabling for optprobes in commit f72180cc93a2c6
> ("powerpc/kprobes: Do not disable interrupts for optprobes and
> kprobes_on_ftrace").

Looks okay. Even if we did have irqs disabled here, we should just use
preempt_enable(), which nests properly inside or outside local irqs.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/optprobes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optpro=
bes.c
> index 3b1c2236cbee57..004fae2044a3e0 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -112,7 +112,7 @@ static void optimized_callback(struct optimized_kprob=
e *op,
>  		__this_cpu_write(current_kprobe, NULL);
>  	}
> =20
> -	preempt_enable_no_resched();
> +	preempt_enable();
>  }
>  NOKPROBE_SYMBOL(optimized_callback);
> =20
> --=20
> 2.38.0

