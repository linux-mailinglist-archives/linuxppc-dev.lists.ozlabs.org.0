Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F25ED356
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 05:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MchRB3Ncmz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:13:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QEWJIyKZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QEWJIyKZ;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MchQY2TbBz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 13:13:22 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so533520pjk.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 20:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=ynZzDYV3qu3pTVsoF69OFstFK1wv0X8GI1hFwjv8mpQ=;
        b=QEWJIyKZ3vlw+J92IlrJjBi8Ic1yWYx28+r67c/zhB9fJyCfkKS9JoGTGiLCOVoV3w
         8emQt2CvtPOZ7fyBTgPmoLBkoJV66rK2jolVH1QlRbp1dQ9VqSs3SUHUoM6SXTrnQcFE
         +3mdQtSaUKIIgTuENawcwy2nMgxMQtIs9OKalkPYiBBGV9e7yMLewHDS8070BwEMr8Cp
         kWeJIPk07zDvWxo6Z/RL7BwL8Qao5dPcwRJXW66G3E97EtOebdgUGG9Nz6RZrPEf3HS/
         ovVcWCMZxER62VeN2D3+5z9UvL1EQyaSxitMWNTMEPPZ7JZnVNpGLIw9oU7h08JaaOVy
         E9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=ynZzDYV3qu3pTVsoF69OFstFK1wv0X8GI1hFwjv8mpQ=;
        b=bLawbxHsUQYe5zNNZ2kvrCGHHaDHVFvy/ByjeQ+bgu6eKRqjlThdaXxQ0x5zgAqkGG
         U8fY8YnNDpywigFkdRgOGUAFhVtWCXy1du8hqPjKvvaEAB+eVqZGnhseHNAfYo9ISwsA
         SFbZHQ+Sta4chAwJj/BB3knQbTK2mIW0rFC3FOd5SgvGVIq8iqM2WF1P3nH7u4B/mb3f
         sL86GH7Uua4LMhe/LLwLxTbbHtFArtE2ndewpZZ5fOYVzYWOHq03LFqJYvoQncOVpUFK
         T3tCYH+3D7AXChueyXd/0qy6J63KZKn5ZGPMTZit7ybjeDNL8GxN8sDB0fZYACjiP9Ja
         tZPQ==
X-Gm-Message-State: ACrzQf32vWGqIRMah1GTskXi27HwYH9cO8UicDSy36UqMqeF5Ka3vyxK
	O6FBLLsZ8D1B/ofxv5zjK3/BhpUYRkY=
X-Google-Smtp-Source: AMsMyM5Ey/LDF7FHbAoWisWwj7cXTDaEaevRp8tdfxAhHzCd1kUJVZq0sEZpehaBJ7FrJepZyAukHw==
X-Received: by 2002:a17:902:e801:b0:178:11e9:2ba2 with SMTP id u1-20020a170902e80100b0017811e92ba2mr28670093plg.26.1664334799971;
        Tue, 27 Sep 2022 20:13:19 -0700 (PDT)
Received: from localhost (193-116-92-8.tpgi.com.au. [193.116.92.8])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902f14900b00176b63535adsm2267953plb.260.2022.09.27.20.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 20:13:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Sep 2022 13:13:14 +1000
Message-Id: <CN7PG1IA5HUZ.MCPQ7S3QQKWO@bobo>
Subject: Re: [PATCH 2/2] powerpc: Reverse stack frame marker on little
 endian
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220927150419.1503001-1-mpe@ellerman.id.au>
 <20220927150419.1503001-2-mpe@ellerman.id.au>
In-Reply-To: <20220927150419.1503001-2-mpe@ellerman.id.au>
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

On Wed Sep 28, 2022 at 1:04 AM AEST, Michael Ellerman wrote:
> On little endian the stack frame marker appears reserved when dumping
> memory sequentially, as is typical in xmon or gdb, eg:
>
>   c000000004733e40 0000000000000000 0000000000000000  |................|
>   c000000004733e50 0000000000000000 0000000000000000  |................|
>   c000000004733e60 0000000000000000 0000000000000000  |................|
>   c000000004733e70 5347455200000000 0000000000000000  |SGER............|
>   c000000004733e80 a700000000000000 708897f7ff7f0000  |........p.......|
>   c000000004733e90 0073428fff7f0000 208997f7ff7f0000  |.sB..... .......|
>   c000000004733ea0 0100000000000000 ffffffffffffffff  |................|
>   c000000004733eb0 0000000000000000 0000000000000000  |................|
>
> To make it easier to recognise, reverse the value on little endian, so
> it always appears as "REGS", eg:
>
>   c000000004733e70 5245475300000000 0000000000000000  |REGS............|
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Both look fine to me.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/ptrace.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm=
/ptrace.h
> index 6c23d1d25dc7..2efec6d87049 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -99,7 +99,12 @@ struct pt_regs
> =20
>  #define STACK_FRAME_WITH_PT_REGS (STACK_FRAME_OVERHEAD + sizeof(struct p=
t_regs))
> =20
> +// Always displays as "REGS" in memory dumps
> +#ifdef CONFIG_CPU_BIG_ENDIAN
>  #define STACK_FRAME_REGS_MARKER	ASM_CONST(0x52454753)
> +#else
> +#define STACK_FRAME_REGS_MARKER	ASM_CONST(0x53474552)
> +#endif
> =20
>  #ifdef __powerpc64__
> =20
> --=20
> 2.37.3

