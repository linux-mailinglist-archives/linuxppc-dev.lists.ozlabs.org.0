Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F3348786
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 04:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5W2N2VRNz3btp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 14:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Avv86z6t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=rashmica.g@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Avv86z6t; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5W1t1s8Gz2yh8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 14:34:41 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id y5so632744pfn.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 20:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=uiHuANgZnUbs15erWI7jFJ06CQL/PCIuoG5tp+3N4nE=;
 b=Avv86z6t3Wlrh6ex01MDKbR5Qe9MemwRgAj1PIprTZWNVr5vpe2TpYSZANV1n5OATL
 zZaJ5qQDZiEGkKvCSOgAzKB5ZRAWg5HSq1KkfAKxYbEZHJh8sIb/XK14yCwGXMBGtS20
 0U5XPJ/LWeAlNBbnHotvyKWXTpSt1e8cT+ux9w14OrihPnXYnQW/chh2WGfXisDqBNJv
 N0cozmY90iTzeixUAC/W76VPTg9kexWXW8wfUB3Lo0VVwQ1Iz7Hq6ZnFdIudcvtjxsau
 qhM7nGl4xM9XkTONd2PpCzC/OUDC0ssP7urAYzZ/amK+kCESzmhH7+6zuxySYcgxDqu0
 qmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=uiHuANgZnUbs15erWI7jFJ06CQL/PCIuoG5tp+3N4nE=;
 b=LDHjJHszQPsS9MJA6xOfBEV8yw/HYUibQIK//u0uQPxmsiHXUtwVz2xvDpuTp5YGnJ
 eYx7PKpc1cSY7Lvv6HHanh3xMMVczlkYCnsGO716dDnZxl2Q3zGMOtYES0KdtFgkPGF8
 QaOQg2jumf2V5ckWWoR3roo5x1IC6dS9YrQRB2ppOYZIxx7daxm+RK/qU2S45hqu6M/c
 B9UYOqsFBbwWCDpSv8cyoYfyktnw2VvaDEmcsSfQR6GG+9DR9WISKumDlzVE/N3PGqJ7
 swKZrP/r5bCJXbXw0q79gS/L1R2MNleL4RzzJwRdHAYRjdkwrb1az2GvJXONeZA3K0Pl
 W4RA==
X-Gm-Message-State: AOAM5329j3zPAcTOW9itprHkqIRdUB62QixN32dDtuKKzAPNK62hXH0z
 MmozU8NKSHKjO63JB6eyBcg=
X-Google-Smtp-Source: ABdhPJxImsKBAHNehdnBOjZGwfMv4q2M2pY7ju3E01s04z4pvRiTdZAPGc2tU3JodE7AeVEWfWa/mA==
X-Received: by 2002:a62:7f86:0:b029:20a:a195:bb36 with SMTP id
 a128-20020a627f860000b029020aa195bb36mr6160832pfd.4.1616643276590; 
 Wed, 24 Mar 2021 20:34:36 -0700 (PDT)
Received: from rashmica (150.24.220.111.sta.wbroadband.net.au.
 [111.220.24.150])
 by smtp.googlemail.com with ESMTPSA id m3sm3528784pgk.47.2021.03.24.20.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 20:34:36 -0700 (PDT)
Message-ID: <fa0803a7ca3c88835e113e06e32bed68adbc45c2.camel@gmail.com>
Subject: Re: [PATCH] powerpc/asm-offsets: GPR14 is not needed either
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Thu, 25 Mar 2021 14:34:31 +1100
In-Reply-To: <9881c68fbca004f9ea18fc9473f630e11ccd6417.1615806071.git.christophe.leroy@csgroup.eu>
References: <9881c68fbca004f9ea18fc9473f630e11ccd6417.1615806071.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2021-03-15 at 11:01 +0000, Christophe Leroy wrote:
> Commit aac6a91fea93 ("powerpc/asm: Remove unused symbols in
> asm-offsets.c") removed GPR15 to GPR31 but kept GPR14,
> probably because it pops up in a couple of comments when doing
> a grep.
> 
> However, it was never used either, so remove it as well.
> 

Looks good to me.

Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>

> Fixes: aac6a91fea93 ("powerpc/asm: Remove unused symbols in asm-
> offsets.c")
> Cc: Rashmica Gupta <rashmicy@gmail.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/asm-offsets.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/asm-offsets.c
> b/arch/powerpc/kernel/asm-offsets.c
> index f3a662201a9f..4d230c5c7099 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -323,9 +323,6 @@ int main(void)
>  	STACK_PT_REGS_OFFSET(GPR11, gpr[11]);
>  	STACK_PT_REGS_OFFSET(GPR12, gpr[12]);
>  	STACK_PT_REGS_OFFSET(GPR13, gpr[13]);
> -#ifndef CONFIG_PPC64
> -	STACK_PT_REGS_OFFSET(GPR14, gpr[14]);
> -#endif /* CONFIG_PPC64 */
>  	/*
>  	 * Note: these symbols include _ because they overlap with
> special
>  	 * register names

