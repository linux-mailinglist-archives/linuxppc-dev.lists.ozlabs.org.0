Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B04592E2FBE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Dec 2020 04:27:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D3R1g17njzDqFH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Dec 2020 14:27:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IB/2iRea; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D3R0417nWzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Dec 2020 14:25:36 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id y8so4006014plp.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Dec 2020 19:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=jahrBbB1Xsikyivt0QZLDy7t69iyTwYFTr3ACK4DSmo=;
 b=IB/2iReamurlk8Fm3AXeUfE2PLQ8A15zYqC9kuurF8x1BaJzVlI0/mp1Z7yQxLeJUu
 gNz+ImPCTaAZFrt5gQ0Lq9ssI/hwuehvDHx5T4McjzuI1fyDBDIIV5162Onqz3dgzIPG
 FxpX6OIftiCXuvRTC6lTwTFZPlpKOp7RnLJR7NQB2C4kSZtb2KLwNZXemqrWw/UX2J0q
 YkrGrtYEZNyPsbvgwlgj4IjGw7MftyTzGaTJyyV2Tb5GKt/V79/tRs8xiQkjOA+4lFy6
 b3LnIRoDq47D1bNSFwqa7DoqUS13n+7bXax0nD/mI+TEP5K10+wd7NOiX4X2vk5CuCHU
 MVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=jahrBbB1Xsikyivt0QZLDy7t69iyTwYFTr3ACK4DSmo=;
 b=ayeiYB0TfYr0xcgHiIcxok2pWdT7BK7zwCK/hGi1atD2WkWeSZkab9KCooMxaVXxNK
 KiJaReW9urtZVszrNKHgs23ei9LHtD3SWWtHU49v1mTKU/pq0STk5b0RqRYLiEGwZ01I
 GV3JvoZ2nf+wLmmIPBpxJECGTEkFUS5DGPdpxEn7RH1Hy4cjlSJkJVJRBk0SxOMRSWFg
 5/i4rCfSJyCmYcrrVlLj/txleDzZw8RsBUdkhBXY9uU5pQWFymn/m1a01i6RYJm0qeK2
 x5ontteqsD3YWm27pLmD4TkyENWHE/gXk7o/etIjlHdyXuAgzG80PVzHuveGkPXnghBf
 Su1A==
X-Gm-Message-State: AOAM5328WAt0NTVhUWn3fdYDfmMaBkUFc+cR0GohIjXPGkrXGxcgcWHG
 /71yWwjNMuF8RCtEDL/KKPA=
X-Google-Smtp-Source: ABdhPJw6GbV+OVKSHYarpMSTr6gbkZuEnUYX0mTVktW4oYygcdihcPKQTM6ZqAm9yUFHlRmeferM6Q==
X-Received: by 2002:a17:902:7e85:b029:da:72a2:de1 with SMTP id
 z5-20020a1709027e85b02900da72a20de1mr38774333pla.57.1609039531706; 
 Sat, 26 Dec 2020 19:25:31 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id ga12sm9705436pjb.48.2020.12.26.19.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 19:25:31 -0800 (PST)
Date: Sun, 27 Dec 2020 13:25:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 06/15] powerpc: Remove address and errorcode arguments
 from do_break()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
 <0246430576c2ff0aed1d35ccbd6f44e658908102.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0246430576c2ff0aed1d35ccbd6f44e658908102.1608641533.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1609039258.ijw9vns8wh.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of December 22, 2020 11:28 pm:
> Let do_break() retrieve address and errorcode from regs.
>=20
> This simplifies the code and shouldn't impeed performance as
> address and errorcode are likely still hot in the cache.
>=20
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/debug.h     | 3 +--
>  arch/powerpc/kernel/exceptions-64s.S | 2 --
>  arch/powerpc/kernel/head_8xx.S       | 5 -----
>  arch/powerpc/kernel/process.c        | 8 +++-----
>  4 files changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/=
debug.h
> index ec57daf87f40..0550eceab3ca 100644
> --- a/arch/powerpc/include/asm/debug.h
> +++ b/arch/powerpc/include/asm/debug.h
> @@ -52,8 +52,7 @@ extern void do_send_trap(struct pt_regs *regs, unsigned=
 long address,
>  			 unsigned long error_code, int brkpt);
>  #else
> =20
> -extern void do_break(struct pt_regs *regs, unsigned long address,
> -		     unsigned long error_code);
> +void do_break(struct pt_regs *regs);
>  #endif
> =20
>  #endif /* _ASM_POWERPC_DEBUG_H */
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index cfbd1d690033..3ea067bcbb95 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -3262,8 +3262,6 @@ handle_page_fault:
> =20
>  /* We have a data breakpoint exception - handle it */
>  handle_dabr_fault:
> -	ld      r4,_DAR(r1)
> -	ld      r5,_DSISR(r1)
>  	addi    r3,r1,STACK_FRAME_OVERHEAD
>  	bl      do_break
>  	/*
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8x=
x.S
> index 52702f3db6df..81f3c984f50c 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -364,11 +364,6 @@ do_databreakpoint:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	mfspr	r4,SPRN_BAR
>  	stw	r4,_DAR(r11)
> -#ifdef CONFIG_VMAP_STACK
> -	lwz	r5,_DSISR(r11)
> -#else
> -	mfspr	r5,SPRN_DSISR
> -#endif

I didn't think you can do this (at leastuntil after your patch 10). I have =
my
!VMAP path doing mfspr r5,DSISR ; stw r3,_DSISR(r11);=20

Thanks,
Nick

