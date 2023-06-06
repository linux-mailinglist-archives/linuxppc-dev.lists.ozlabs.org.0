Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7087723C62
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 10:58:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb4BX4gn0z3dsr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 18:58:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=BFPBPBMO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=BFPBPBMO;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb49c55Ddz3cD5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 18:57:22 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b011cffef2so54529085ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 01:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686041839; x=1688633839;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsotnkYKJJ++RTq8ZDtbyGBYv6z9/iH+HO0zFVXW2NY=;
        b=BFPBPBMOf8PaUueNf8+J6cBztMB5syO78BMYAFc1m1fjSMKH/wMqWhHONypMA29RMO
         JtBnIWN7Jsasj7/GY5Y1TAs6jlKQSn1WsWS8qDZ4F6hadfLZ7NTHz4jLdmhSp4SP2ZhM
         b/cfC+/Eg5ingZrGS8jXDxJwMuFPZzJOGSlXawGgRVQnirUI/qdJagt2EoFxzMlip5OL
         r624yUamptZtkyS0pcyo3eGZxkmqCzcS3/aQ3TudnaI2i5o0tToip0hiexqVRgyGkr0Q
         ZCykcnep9ptsT5gra0Pz2sxmMrMjenSdFGVVwMA2uJkNg8TvGyi8dYKZgfpAsVNzA2/y
         qerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041839; x=1688633839;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsotnkYKJJ++RTq8ZDtbyGBYv6z9/iH+HO0zFVXW2NY=;
        b=Hk3ZwGe7sZdd5S5o73EGBI4qnVw0i8RrRe2/LTTWVi5f+LTv3H6Sc6tcIcLvAjbcGt
         FpfODRMzpIjqubBHom0AbBR6oOQiZl26cYsoyzzYbhK0I5l5BVJvVp/S3zi3MFbLNt9U
         eopY6gpqSR3m1bjvZV/2WZoHkepv9FaTc79FxEBExbDBz0jXu1D2m6om5YEE+XEIsh+q
         3UxQEBg61PQcJclL5VHLPDiptphqcCWpIw1bcnXka418HEZABXTQOWAOKpiMdHhXFAgr
         DJ1Ih6tWEFvLZ/m7Q2Ef1lOOLg1KMVULSzNFuedJTzN1xRZgmp5n48S0DGXGVjYBxeeK
         MNWw==
X-Gm-Message-State: AC+VfDzUF7TO+9gO7mkfzJW4ny1QeyaCs1+loOQNTq6S6Yt/woMGUnb6
	V+tKhL4VwHnVDNXKPV5O+ts=
X-Google-Smtp-Source: ACHHUZ4vx4ct4+UKChRJItU5T4VejzTrB4ZZ6XhJCp/+chr8riquVxvwcjpWSDzxg/yW8vU2i3C7QA==
X-Received: by 2002:a17:902:db0f:b0:1b0:4bc7:31ee with SMTP id m15-20020a170902db0f00b001b04bc731eemr1570388plx.32.1686041839240;
        Tue, 06 Jun 2023 01:57:19 -0700 (PDT)
Received: from localhost ([203.221.142.9])
        by smtp.gmail.com with ESMTPSA id x20-20020a170902ea9400b001a6d4ea7301sm7924557plb.251.2023.06.06.01.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:57:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jun 2023 18:57:03 +1000
Message-Id: <CT5FY0YBBTYX.X4UB9DSZQCMY@wheely>
Subject: Re: [PATCH] powerpc/interrupt: Don't read MSR from
 interrupt_exit_kernel_prepare()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.14.0
References: <df36c6205ab64326fb1b991993c82057e92ace2f.1685955214.git.christophe.leroy@csgroup.eu>
In-Reply-To: <df36c6205ab64326fb1b991993c82057e92ace2f.1685955214.git.christophe.leroy@csgroup.eu>
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

On Mon Jun 5, 2023 at 6:55 PM AEST, Christophe Leroy wrote:
> A disassembly of interrupt_exit_kernel_prepare() shows a useless read
> of MSR register. This is shown by r9 being re-used immediately without
> doing anything with the value read.
>
>   c000e0e0:       60 00 00 00     nop
>   c000e0e4:       7d 3a c2 a6     mfmd_ap r9
>   c000e0e8:       7d 20 00 a6     mfmsr   r9
>   c000e0ec:       7c 51 13 a6     mtspr   81,r2
>   c000e0f0:       81 3f 00 84     lwz     r9,132(r31)
>   c000e0f4:       71 29 80 00     andi.   r9,r9,32768
>
> This is due to the use of local_irq_save(). The flags read by
> local_irq_save() are never used, use local_irq_disable() instead.

I did have a patch that warns if you do a local_irq_disable() when
irqs are disabled which is why I did this, but it is kind of silly.

You could do 'if (!irqs_disabled()) local_irq_disable()'

Unfortunately that adds another branch but if it is not taken
frequently then maybe avoiding the mtMSR/EID would make it a win?
If you don't change that I might end up doing it if I can get that
warning patch merged (needs a few core kernel changes).

I wonder how much that would help local_irq_save too, if interrupts
are already disabled then avoid the mt? Maybe those things are not
very costly on smaller in-order cores.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed up=
 return from interrupt")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/interrupt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index e34c72285b4e..f3fc5fe919d9 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -368,7 +368,6 @@ void preempt_schedule_irq(void);
> =20
>  notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs=
)
>  {
> -	unsigned long flags;
>  	unsigned long ret =3D 0;
>  	unsigned long kuap;
>  	bool stack_store =3D read_thread_flags() & _TIF_EMULATE_STACK_STORE;
> @@ -392,7 +391,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(s=
truct pt_regs *regs)
> =20
>  	kuap =3D kuap_get_and_assert_locked();
> =20
> -	local_irq_save(flags);
> +	local_irq_disable();
> =20
>  	if (!arch_irq_disabled_regs(regs)) {
>  		/* Returning to a kernel context with local irqs enabled. */
> --=20
> 2.40.1

