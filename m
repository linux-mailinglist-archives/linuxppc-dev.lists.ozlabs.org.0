Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A835E750F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:44:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYkgF5lx2z3cf1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:44:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h4nUtgpB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h4nUtgpB;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYkfg49mnz3c21
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:43:39 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id bh13so11519939pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=rLV9p6q9yI81aauScdeQl4cl/mOX9PCFhqhacAHLNr8=;
        b=h4nUtgpBsj//wy4jtjkq1nql8SXQ0sfF5hmq+IiHdLxGjxn2jX+1VhNi6u/t1J1gfv
         LYAJNpArIe1+Xll1H9zC3AArdkHW1Jlod7d3sdbT/BOr91slmRfh50c6lQ14XKRdODlK
         sDCWzIHfQBJwqDBkTkY0KmfoXWlR8uCnyOdwHQCFXz7GWdrQLcOyI9PVXckJKhPPSCTz
         B/N30SHRn9IEdzHauHMkhAzPwy7kykLH3KrC9DO62hLH5WtRSmRmJAyEmBSNks3M62pP
         H6ikl8ZuztXu+uwvCmI6ufkhBc6d2mBcefPjZVJ/DABhZ7F8tVHR1ZLsMFzJodPsxhFm
         BmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=rLV9p6q9yI81aauScdeQl4cl/mOX9PCFhqhacAHLNr8=;
        b=rR5xlpi3TFpeCHbMb96YCCTKtD7AYa236c0HkWf1dzIIdTLgvl4torfZrbcRNC2Xuw
         RMOxEmcXRIC8iJhPfqIxvn43nm1xurik4Z3o3qQAw0p9mekLhuTe0MG7X7RsbYcWCJfA
         loOFCj+AD7lLE5mYhJDkPcGWrd+wam/O7x6yPrTHKCf9Hh5BBRAiBc93eCyLTZsaL/BS
         a1sCtMUmUWXQcplYSjm1XUNhDg/yJSy5LgPo3XONU6HEflfPVxSstDaAJFCunDHzaaeH
         bVtREYu/v1rtSzxxyCJuxHlrynlmeW/TksB7h82DjZz9MqqAUgStIYyFXFkzOaVQ4GNn
         rSeg==
X-Gm-Message-State: ACrzQf0hzlrZsqQ58/vefLyd4Q20u6CGQoizL7Gf6TKFkzrA9lSB1CrE
	uJlb7qznmJ/RidDr+0WeGL041gPK1ZY=
X-Google-Smtp-Source: AMsMyM6QlIn2QZTlCJfr7g+gAowEWdVScB8jKW2o9zMedFJOU0kyzmocRADwqSdUN4CUvpf+lH34yA==
X-Received: by 2002:aa7:9532:0:b0:53e:7875:39e1 with SMTP id c18-20020aa79532000000b0053e787539e1mr7704343pfp.82.1663919017444;
        Fri, 23 Sep 2022 00:43:37 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id ik24-20020a170902ab1800b0017495461db7sm5340685plb.190.2022.09.23.00.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 00:43:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 17:43:33 +1000
Message-Id: <CN3M2A0W1J3A.2V3NYEDYLSIVQ@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 20/25] powerpc: Change system_call_exception calling
 convention
X-Mailer: aerc 0.11.0
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-21-rmclure@linux.ibm.com>
In-Reply-To: <20220921065605.1051927-21-rmclure@linux.ibm.com>
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

On Wed Sep 21, 2022 at 4:56 PM AEST, Rohan McLure wrote:
> Change system_call_exception arguments to pass a pointer to a stack frame
> container caller state, as well as the original r0, which determines the
> number of the syscall. This has been observed to yield improved performan=
ce
> to passing them by registers, circumventing the need to allocate a stack =
frame.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Thanks for splitting it out, I think it does make it nicer to review.

[...]

> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index 15af0ed019a7..0e9ba3efee94 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -13,9 +13,7 @@
> =20
> =20
>  /* Has to run notrace because it is entered not completely "reconciled" =
*/
> -notrace long system_call_exception(long r3, long r4, long r5,
> -				   long r6, long r7, long r8,
> -				   unsigned long r0, struct pt_regs *regs)
> +notrace long system_call_exception(struct pt_regs *regs, unsigned long r=
0)
>  {
>  	long ret;
>  	syscall_fn f;
> @@ -136,12 +134,6 @@ notrace long system_call_exception(long r3, long r4,=
 long r5,
>  		r0 =3D do_syscall_trace_enter(regs);
>  		if (unlikely(r0 >=3D NR_syscalls))
>  			return regs->gpr[3];
> -		r3 =3D regs->gpr[3];
> -		r4 =3D regs->gpr[4];
> -		r5 =3D regs->gpr[5];
> -		r6 =3D regs->gpr[6];
> -		r7 =3D regs->gpr[7];
> -		r8 =3D regs->gpr[8];
> =20
>  	} else if (unlikely(r0 >=3D NR_syscalls)) {
>  		if (unlikely(trap_is_unsupported_scv(regs))) {
> --=20
> 2.34.1

This is probably just missing the hunk

+       ret =3D f(regs->gpr[3], regs->gpr[4], regs->gpr[5],                =
                                                                           =
                                                                           =
       =20
+               regs->gpr[6], regs->gpr[7], regs->gpr[8]);       =20

which got into your next patch.

Otherwise I think it looks good.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
