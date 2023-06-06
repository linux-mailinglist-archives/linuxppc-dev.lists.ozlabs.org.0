Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FF723C6E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb4F80pDVz3f7F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dPR7PAcB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dPR7PAcB;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb4DF0ztWz3cD5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 18:59:40 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-bacf685150cso7349883276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686041978; x=1688633978;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6kW28rRS95PBT40ZyGvD53ULubXonpBS0T08hlvYzY=;
        b=dPR7PAcBEbq14AyijUdKPeY9aopH5oxf/XU5xNmYSoOyjYqERl9cm3yey7nh0m1wiS
         1fQw4PTKPUr1LJE40ZZd38eOjy07GYhYSuKlqSPiw9DGP2NV1Aew+xNyenr+gJKvfyEv
         Y673QHzNp/7uVnjx13QJvFKmESHWi+kGU/7hSOalAPdHTdKRkE5GkH2WPHuEeLevB7hY
         fg6S/VW2ocpOzz2HcK6UtqUmuV68T5KMZHULgMQU8YeFJ/522xFXPPa4x+MmRNG7uo3B
         Ir72yEqU5vuJXbw10qlB+t+kNprQd5pxm7t7+R4QcijkqpA6eNRyCE7+kDOarN9nzyr+
         ZNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041978; x=1688633978;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N6kW28rRS95PBT40ZyGvD53ULubXonpBS0T08hlvYzY=;
        b=UmxszNy4giFTxkGVdvu77xGVfyis+y/ISmgzITZnFjBN12bXgeSa2S8XSyD2Gd+g+D
         xE6s8JfX7UXe7rXRDjSq3S1L4qkd+q7khO9p364VanzaKKQF3Wpx7wGZjBZm+Zegdq/1
         TiSocbR+FUXEOOHZX23lSX/KOQWUIJUuDf68ta7hmcsg1lTPiv7dgVFzpk+JVuUY8KqS
         nFvW6z/I1blHuFL79b4QONIkswVkrg50BjjL6v65AMChCgXB2g9QRyOaplzLpPG7XrZl
         mL8XgOW+g8lBd/nAeos/FNF18ttbX4O0JUAgGfyqzO4cQ/197MgN4iJhBjmdvMk9B7F1
         8dPg==
X-Gm-Message-State: AC+VfDzkiIOzi5mn+DlRrYaGhfh7OEzmU/3zyiy3+xAp/nqeJyXaR7Cn
	T+H2Hmyq4j445Y3TfXdDTVU=
X-Google-Smtp-Source: ACHHUZ6AeR7qesANdIDtp2lhgxb5Ewp8VMikOiupHZ9Q+qMTh31yK+rF2gXmNDrRFS8peWohfho2dQ==
X-Received: by 2002:a25:c382:0:b0:bb3:b0ab:d626 with SMTP id t124-20020a25c382000000b00bb3b0abd626mr485746ybf.31.1686041978611;
        Tue, 06 Jun 2023 01:59:38 -0700 (PDT)
Received: from localhost ([203.221.142.9])
        by smtp.gmail.com with ESMTPSA id o1-20020a17090ab88100b0024dfbac9e2fsm9010107pjr.21.2023.06.06.01.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:59:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jun 2023 18:58:46 +1000
Message-Id: <CT5FZBY14ZM4.OYXBJNXQU9A2@wheely>
Subject: Re: [PATCH] powerpc/signal32: Force inlining of
 __unsafe_save_user_regs() and save_tm_user_regs_unsafe()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.14.0
References: <7e469c8f01860a69c1ada3ca6a5e2aa65f0f74b2.1685955220.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7e469c8f01860a69c1ada3ca6a5e2aa65f0f74b2.1685955220.git.christophe.leroy@csgroup.eu>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 5, 2023 at 6:58 PM AEST, Christophe Leroy wrote:
> Looking at generated code for handle_signal32() shows calls to a
> function called __unsafe_save_user_regs.constprop.0 while user access
> is open.
>
> And that __unsafe_save_user_regs.constprop.0 function has two nops at
> the begining, allowing it to be traced, which is unexpected during
> user access open window.
>
> The solution could be to mark __unsafe_save_user_regs() no trace, but
> to be on the safe side the most efficient is to flag it __always_inline
> as already done for function __unsafe_restore_general_regs(). The
> function is relatively small and only called twice, so the size
> increase will remain in the noise.
>
> Do the same with save_tm_user_regs_unsafe() as it may suffer the
> same issue.

Could you put a comment so someone doesn't uninline it later? Marking
it notrace as well would be sufficient for a comment, if that works.

Thanks,
Nick

>
> Fixes: ef75e7318294 ("powerpc/signal32: Transform save_user_regs() and sa=
ve_tm_user_regs() in 'unsafe' version")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/signal_32.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal=
_32.c
> index c114c7f25645..7a718ed32b27 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -264,8 +264,9 @@ static void prepare_save_user_regs(int ctx_has_vsx_re=
gion)
>  #endif
>  }
> =20
> -static int __unsafe_save_user_regs(struct pt_regs *regs, struct mcontext=
 __user *frame,
> -				   struct mcontext __user *tm_frame, int ctx_has_vsx_region)
> +static __always_inline int
> +__unsafe_save_user_regs(struct pt_regs *regs, struct mcontext __user *fr=
ame,
> +			struct mcontext __user *tm_frame, int ctx_has_vsx_region)
>  {
>  	unsigned long msr =3D regs->msr;
> =20
> @@ -364,8 +365,9 @@ static void prepare_save_tm_user_regs(void)
>  		current->thread.ckvrsave =3D mfspr(SPRN_VRSAVE);
>  }
> =20
> -static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontex=
t __user *frame,
> -				    struct mcontext __user *tm_frame, unsigned long msr)
> +static __always_inline int
> +save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontext __user *f=
rame,
> +			 struct mcontext __user *tm_frame, unsigned long msr)
>  {
>  	/* Save both sets of general registers */
>  	unsafe_save_general_regs(&current->thread.ckpt_regs, frame, failed);
> @@ -444,8 +446,9 @@ static int save_tm_user_regs_unsafe(struct pt_regs *r=
egs, struct mcontext __user
>  #else
>  static void prepare_save_tm_user_regs(void) { }
> =20
> -static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontex=
t __user *frame,
> -				    struct mcontext __user *tm_frame, unsigned long msr)
> +static __always_inline int
> +save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontext __user *f=
rame,
> +			 struct mcontext __user *tm_frame, unsigned long msr)
>  {
>  	return 0;
>  }
> --=20
> 2.40.1

