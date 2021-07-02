Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE0B3B9A83
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 03:25:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGHTL0Zsgz3bX7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 11:25:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BVJd8KA0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BVJd8KA0; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGHSr4Jzkz2yMw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 11:25:14 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so5128904pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jul 2021 18:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=j6iUe8HIceUkFWNmIAR8GP6qmF3Cqvbw/0ZMAoaDhVk=;
 b=BVJd8KA0TcF1xsUFLwjzboqq8/UqTibUuLCT6ADFWD8uaYRLpnFbPYwNQzB0JtU3fd
 c1selm/jyb47/Ovmnj+qS/V8cQGSQ9VKOGOBLZI9bdH8FY449Swd9w3Y7aMRE38BM6TS
 cKtBEeGMJBzr8naae1D62/WP76was1WgxdQj+qoutP0QaVVDGRkL4Z6/dtbn4uJlFtgZ
 25+oqKJYZlqKSZ++wz9ICI1K2qKYxqg0yrajgx/as4v1qLO1OmLoLs+4R/AWz0oVYwai
 fNQ3v0YJNSQ8dmhmPN7zmHKJqTS+79huaw8tZ9fEC3J6bcXFUr4gdEx6tvjtr2by9yGB
 E2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=j6iUe8HIceUkFWNmIAR8GP6qmF3Cqvbw/0ZMAoaDhVk=;
 b=nNaZbUamxzBO/a3GArtr1xLoAlL4vynBKekqlkRW3wFIf/3ceCxfpGIViUcgtNm6Is
 iy816ouHxQrIH+fuEgEt5p+LNV1iTZA0+64G6qWVStYbFx4D5Jf8kxpfOczXUa92G/88
 VQY5J0FylMOHj4FsWWxs0ZRD/bxtNP0Q6J6W3WAo/FvZMuWBy8/kNho3IoriPahZjfha
 99F89eWmrnfonKBYtTtrc7e3UZuNux1esgTH7HlwWim+J+S+BG85QClm6gRfUHdABuHm
 +LT/sO680PEvynnU7q187mEIHGrL33CeXOGzg5fyScQnjsjW8NLJi6HBYxqDJb2/pNHD
 nARQ==
X-Gm-Message-State: AOAM531fGpxbu0SvdaycBPkG5sgOt1sJKZcnQoBcsfQxiz99z2HUVAlD
 BEJfmkHY9vvqH2h/Pnv8HXI=
X-Google-Smtp-Source: ABdhPJz07vEU+x8XcahatpwhI+bYmWSvGSidNX2mrf79YEecOn/xmhTR08mLQr9mGsbQbAEDE2+xbQ==
X-Received: by 2002:a17:90b:4a0a:: with SMTP id
 kk10mr2353106pjb.16.1625189111444; 
 Thu, 01 Jul 2021 18:25:11 -0700 (PDT)
Received: from localhost ([118.209.250.144])
 by smtp.gmail.com with ESMTPSA id p14sm1259110pgb.2.2021.07.01.18.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 18:25:11 -0700 (PDT)
Date: Fri, 02 Jul 2021 11:25:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mm: Fix lockup on kernel exec fault
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <024bb05105050f704743a0083fe3548702be5706.1625138205.git.christophe.leroy@csgroup.eu>
In-Reply-To: <024bb05105050f704743a0083fe3548702be5706.1625138205.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1625188324.lt6lsizhsx.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of July 1, 2021 9:17 pm:
> The powerpc kernel is not prepared to handle exec faults from kernel.
> Especially, the function is_exec_fault() will return 'false' when an
> exec fault is taken by kernel, because the check is based on reading
> current->thread.regs->trap which contains the trap from user.
>=20
> For instance, when provoking a LKDTM EXEC_USERSPACE test,
> current->thread.regs->trap is set to SYSCALL trap (0xc00), and
> the fault taken by the kernel is not seen as an exec fault by
> set_access_flags_filter().
>=20
> Commit d7df2443cd5f ("powerpc/mm: Fix spurrious segfaults on radix
> with autonuma") made it clear and handled it properly. But later on
> commit d3ca587404b3 ("powerpc/mm: Fix reporting of kernel execute
> faults") removed that handling, introducing test based on error_code.
> And here is the problem, because on the 603 all upper bits of SRR1
> get cleared when the TLB instruction miss handler bails out to ISI.

So the problem is 603 doesn't see the DSISR_NOEXEC_OR_G bit?

I don't see the problem with this for 64s, I don't think anything sane
can be done for any 0x400 interrupt in the kernel so it's probably
good to catch all here just in case. For 64s,

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Why is 32s clearing those top bits? And it seems to be setting DSISR
that AFAIKS it does not use. Seems like it would be good to add a
NOEXEC_OR_G bit into SRR1.

Thanks,
Nick


> Until commit cbd7e6ca0210 ("powerpc/fault: Avoid heavy
> search_exception_tables() verification"), an exec fault from kernel
> at a userspace address was indirectly caught by the lack of entry for
> that address in the exception tables. But after that commit the
> kernel mainly rely on KUAP or on core mm handling to catch wrong
> user accesses. Here the access is not wrong, so mm handles it.
> It is a minor fault because PAGE_EXEC is not set,
> set_access_flags_filter() should set PAGE_EXEC and voila.
> But as is_exec_fault() returns false as explained in the begining,
> set_access_flags_filter() bails out without setting PAGE_EXEC flag,
> which leads to a forever minor exec fault.
>=20
> As the kernel is not prepared to handle such exec faults, the thing
> to do is to fire in bad_kernel_fault() for any exec fault taken by
> the kernel, as it was prior to commit d3ca587404b3.
>=20
> Fixes: d3ca587404b3 ("powerpc/mm: Fix reporting of kernel execute faults"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/fault.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 34f641d4a2fe..a8d0ce85d39a 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -199,9 +199,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, un=
signed long error_code,
>  {
>  	int is_exec =3D TRAP(regs) =3D=3D INTERRUPT_INST_STORAGE;
> =20
> -	/* NX faults set DSISR_PROTFAULT on the 8xx, DSISR_NOEXEC_OR_G on other=
s */
> -	if (is_exec && (error_code & (DSISR_NOEXEC_OR_G | DSISR_KEYFAULT |
> -				      DSISR_PROTFAULT))) {
> +	if (is_exec) {
>  		pr_crit_ratelimited("kernel tried to execute %s page (%lx) - exploit a=
ttempt? (uid: %d)\n",
>  				    address >=3D TASK_SIZE ? "exec-protected" : "user",
>  				    address,
> --=20
> 2.25.0
>=20
>=20
