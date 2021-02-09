Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6402B3145A8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:33:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZQPh3p97zDvYx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KeG0M8Zi; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZQL75gfzzDvXh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 12:29:50 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id u15so8850633plf.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 17:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0H+UcHXc0T0Hzs8GkN3sRs6CKrIAKPFmzn4TQbxmO7M=;
 b=KeG0M8ZieeBu/SsqRk/HCFfir4K98AM3ocyjGEhadP4MgpkB+k5k0qqht6gA+iV1yJ
 JZnJb746dhFLbS02uTMuP4yZTCzvPxIC/UxLXYRXuZK9BnCTx2w1wuVxGDL//ZTinvle
 fF86f8G3MFsyfpzuzaNsFBXHGhjn+S/OoYTcyYkUueMineEVfbVx9/Gr4uPnBp3mXjaB
 70EJntHYYVHOrQFEpqgumrkE0fbbOjBz6VbYYNzQXTsrQVhGbHuyJplTeYPwxVXhFOcF
 /2TaGT2TaEv5zKia4g3y/V6hewwC8MOBZfKMTw2QL2p99YvUL7XMTzgkTkzR32OisMu2
 JdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0H+UcHXc0T0Hzs8GkN3sRs6CKrIAKPFmzn4TQbxmO7M=;
 b=DpTeLujtv9BV+J7eBd0lZt0vWf6VdWa1Fb1LvZyPyvQ6wYVOILSjvfHpe4AyOJq4eT
 PL7j1v3SK+5y6uHJfBrSJAdVHX7iBqhaXMhpsIYzkqz6S2G/SZ5T/cTCxjk3KaMFUpB1
 RElSOf0mTLgPdo5u4AdsvAzrcICzBm7n0ifZSoIFS8B20/Apv/ZpF35rskcJyS+IIPZX
 rIODSdIAuWrk9VvVMLj7vDXZWBMZQ2k/dNjIXkW6kCwAfG1krvr03lON0fNRdAr7AM5A
 ediEoiSkGSBImaJItyE0Pq88DMyfQMvHNHbPeeiL0koX8qRpfgFlxiKi2SmSVCTdEbpb
 SYTQ==
X-Gm-Message-State: AOAM531BqO77upTtWwSHPfGnoK+Bui0WS5ZJ3CAFoTIwjX4S2iM2Yic2
 dnbSEG1XCT46rAzflAIWXNs=
X-Google-Smtp-Source: ABdhPJzZDCTiTRsiqzRDENBV7cojfewrYQOjo8/jteVxFcY+2p8vgBCT7O7QUANeC4+r47sUQTU/rQ==
X-Received: by 2002:a17:90a:a22:: with SMTP id
 o31mr1487149pjo.221.1612834187264; 
 Mon, 08 Feb 2021 17:29:47 -0800 (PST)
Received: from localhost ([220.240.226.199])
 by smtp.gmail.com with ESMTPSA id d12sm6254201pgm.83.2021.02.08.17.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:29:46 -0800 (PST)
Date: Tue, 09 Feb 2021 11:29:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 11/22] powerpc/syscall: Save r3 in regs->orig_r3
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <9a90805ab6b9101b46daf56470f457a57acd86fc.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <9a90805ab6b9101b46daf56470f457a57acd86fc.1612796617.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612834174.puqh8atps5.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
> Save r3 in regs->orig_r3 in system_call_exception()
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> v5: Removed the assembly one on SCV type system call
> ---
>  arch/powerpc/kernel/entry_64.S  | 2 --
>  arch/powerpc/kernel/interrupt.c | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_6=
4.S
> index 33ddfeef4fe9..a91c2def165d 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -108,7 +108,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
>  	li	r11,\trapnr
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
> -	std	r3,ORIG_GPR3(r1)
>  	addi	r10,r1,STACK_FRAME_OVERHEAD
>  	ld	r11,exception_marker@toc(r2)
>  	std	r11,-16(r10)		/* "regshere" marker */
> @@ -278,7 +277,6 @@ END_BTB_FLUSH_SECTION
>  	std	r10,_LINK(r1)
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
> -	std	r3,ORIG_GPR3(r1)
>  	addi	r10,r1,STACK_FRAME_OVERHEAD
>  	ld	r11,exception_marker@toc(r2)
>  	std	r11,-16(r10)		/* "regshere" marker */
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 46fd195ca659..1a2dec49f811 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
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
