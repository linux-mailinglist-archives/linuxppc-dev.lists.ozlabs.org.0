Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EB2303A08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 11:18:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ2ks48rgzDqxZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 21:18:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hByZTPn+; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ2hd6DthzDr0L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 21:16:49 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id 31so9504500plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 02:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=sR1f6/9qxbOzaGUBvKshvPIEd27XjEPY6YY4xmBmtPw=;
 b=hByZTPn+kC7e4UW2FPK/AIyIGf9W594vufpomYmL3zBVkQjdrkkQGpHS3xs7297uF8
 VOZuXvTyW9sl55CPyhKIIMU+riCrnYcmolSmzO7a2ks0VOAD5PMXwyn75ZqZWJt9qd0f
 fgvVhIgSOjxP+3wo55hLn6DBp6ZeyaybNzl7PQFEyHP/ZCCm93jKAiAbAkNLYGghQIag
 TqE5huzf5DEhD5ui8CJ2NJPiTNuT1oUOjfl4UoGUE2sZnIoHd8lmUCLKDEPX+0+H/MCW
 Qi7nLK7V9o/vLa4YcxC1L1QBFwSMvu3lrbd/9irKOurZORXuC/OvuF5VuOJIx4D6xK8Q
 DINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=sR1f6/9qxbOzaGUBvKshvPIEd27XjEPY6YY4xmBmtPw=;
 b=oUU/2fINQI5OV+3Cim1XITwY3X2/vm2EYmu0jqGYaqyiTNMyBCZ9IO2aaZu1RNALM+
 GccGJN+9QNpThbL9mWGacG+uQcUNsF28pdGE3MOJh0Ke12EJaQ3d+1l0xOE8RlbmNt5D
 Ov4psCzUdKKG8KR2MRu10016FTJMMozVr6NOSRBkrxDEVQfGTw762Pv4JUCFUVere+Av
 AipwLjK8sCvaIAF7ggpDJ6fe8z13fJGhTp40qLeruCu/1qwcMKtoa9ithrwWb7wP9ozi
 mpuVAWdlkYZRwC1Cak1wJhbDwS1prQRUph9dhZq9s3MUOwOQ2QMINmUYXP3a8b8upPd7
 SD7A==
X-Gm-Message-State: AOAM530/9HIvQHVhir0vf5dQY0o5v/IYdPYA/gsrjfiP/ydj18x5AvFZ
 al94OAEkSJQVQz3brnXFUmY=
X-Google-Smtp-Source: ABdhPJwg+JTjblgrrhG9vFEfUG1cblX6qFxLOGQzgNLdQMrgRvDnqGJyI0cCwhxPL54X1bAz2FR0zA==
X-Received: by 2002:a17:902:9a4a:b029:dc:435c:70ad with SMTP id
 x10-20020a1709029a4ab02900dc435c70admr5154709plv.77.1611656206142; 
 Tue, 26 Jan 2021 02:16:46 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id d2sm1840594pjd.29.2021.01.26.02.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 02:16:45 -0800 (PST)
Date: Tue, 26 Jan 2021 20:16:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 20/23] powerpc/syscall: Do not check unsupported scv
 vector on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <f02af988a86f7e83b6492df7c4fa1b53bcd1919b.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f02af988a86f7e83b6492df7c4fa1b53bcd1919b.1611585031.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1611656145.efq1cxcpts.astroid@bobo.none>
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
> Only PPC64 has scv. No need to check the 0x7ff0 trap on PPC32.
>=20
> And ignore the scv parameter in syscall_exit_prepare (Save 14 cycles
> 346 =3D> 332 cycles)
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/entry_32.S | 1 -
>  arch/powerpc/kernel/syscall.c  | 7 +++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 9922a04650f7..6ae9c7bcb06c 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -343,7 +343,6 @@ transfer_to_syscall:
> =20
>  ret_from_syscall:
>  	addi    r4,r1,STACK_FRAME_OVERHEAD
> -	li	r5,0
>  	bl	syscall_exit_prepare
>  #if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
>  	/* If the process has its own DBCR0 value, load it up.  The internal
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index 476909b11051..30f8a397a522 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -86,7 +86,7 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  	local_irq_enable();
> =20
>  	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
> -		if (unlikely(regs->trap =3D=3D 0x7ff0)) {
> +		if (IS_ENABLED(CONFIG_PPC64) && unlikely(regs->trap =3D=3D 0x7ff0)) {
>  			/* Unsupported scv vector */
>  			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
>  			return regs->gpr[3];
> @@ -109,7 +109,7 @@ notrace long system_call_exception(long r3, long r4, =
long r5,
>  		r8 =3D regs->gpr[8];
> =20
>  	} else if (unlikely(r0 >=3D NR_syscalls)) {
> -		if (unlikely(regs->trap =3D=3D 0x7ff0)) {
> +		if (IS_ENABLED(CONFIG_PPC64) && unlikely(regs->trap =3D=3D 0x7ff0)) {

Perhaps this could be hidden behind a function like trap_is_scv()?

trap_is_unsupported_scv() ?

Thanks,
Nick
