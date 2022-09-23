Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8305E73BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 08:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYhhH0HVYz3cdk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 16:14:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U8eZ9gii;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U8eZ9gii;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYhgf4M0Sz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 16:14:20 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id q9so11325451pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=OnJ83dF1qV1i/ef9Zz/i+NT4j3S5o4tHB+OpU3je0nk=;
        b=U8eZ9giiizXYFHHGL2LNn/6kPTcRncZpw5gxt8io68dnr0qnX3y/2UzLA0SGMWPMaG
         gEeDH0ozWckNLP7UM3SggwElG9yMRbUhsB4IV/uYHWni1/VYYUHtpLWUvYG+6DyIl4sI
         vENJzIuSkgM5sK9XgJ7HtHo5AC8f+BBQ49Ua72/OjkhC+qeYgcN51dfiAdjdtKmRUoNc
         TG5hb4LGGXb29opABcnQh19lsp2KlGaiS8phA5YOPz8iJVtTHRiqOVmPONzQpd22d1q9
         qvOkp2eU9BS1JgrxJEhZgXD34dp9gmq0dTLyRFxwjin0p6rXTqI7v4FI4HGAel4gr01d
         Aecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=OnJ83dF1qV1i/ef9Zz/i+NT4j3S5o4tHB+OpU3je0nk=;
        b=W7UlzC1h3BivpHym9BQ+V+rrdIA77YHoNLBQChfeNmJZvEQLTwKKKh+Jevb81KITqf
         Dd5MzrQ1LWnCYkkcnhjbr359ysjgmlw6bUqV6xOBXs6D1QUtRpOw3WjOZzl9z7NV3Y4q
         TjMEOklP3zvFPRDzWzwb+UhQFVoMFrJ5NKtvSbdbyB4X48a6OSMsakX952PZopfroc6N
         6wvqyWfYi7Kg/EHqhs/W8zHdw7jZadkYbBzmfjcTO+H/LJYpXOY5KFicVIYVPxo8dg07
         OQqXGvqtOSn1k+upkSHM/aJDcB6nK7OOe+Yh9PP4k/qf+pSLRzjN7opIvDX+y/jtDfHi
         JvBg==
X-Gm-Message-State: ACrzQf2J3i+c0lsx910ZI0mKCFQlGx1JzPd1odAgyVoi37YLPphjJTPd
	IrUGkkirPz33FPQC6RglfXo=
X-Google-Smtp-Source: AMsMyM4DBxgyjB+6mvsyWXKm3g082wBkAIlqSe8wb1z/F6+xKPowmbcyZK8Y9lTSnpFLSFLmVsUfQA==
X-Received: by 2002:a63:510a:0:b0:43c:4558:b47e with SMTP id f10-20020a63510a000000b0043c4558b47emr1708214pgb.464.1663913658445;
        Thu, 22 Sep 2022 23:14:18 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id f13-20020a170902ce8d00b0016dc6279ab7sm5210552plg.149.2022.09.22.23.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 23:14:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 16:14:13 +1000
Message-Id: <CN3K5VX0KUD2.3NX10RABZV007@bobo>
Subject: Re: [PATCH 1/5] powerpc/64: use 32-bit immediate for
 STACK_FRAME_REGS_MARKER
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220923032512.535725-1-npiggin@gmail.com>
 <20220923032512.535725-2-npiggin@gmail.com>
 <13f6b8bd-ecc3-cd8d-7e7e-71887326fa40@csgroup.eu>
In-Reply-To: <13f6b8bd-ecc3-cd8d-7e7e-71887326fa40@csgroup.eu>
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 23, 2022 at 3:34 PM AEST, Christophe Leroy wrote:
>
>
> Le 23/09/2022 =C3=A0 05:25, Nicholas Piggin a =C3=A9crit=C2=A0:
> > Using a 32-bit constant for this marker allows it to be loaded with
> > two ALU instructions, like 32-bit. This avoids a TOC entry and a
> > TOC load that depends on the r2 value that has just been loaded from
> > the PACA.
> >=20
> > This changes the value for 32-bit as well, so both have the same
> > value in the low 4 bytes and 64-bit has 0xffffffff in the top bytes.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   arch/powerpc/include/asm/ptrace.h    | 5 +++--
> >   arch/powerpc/kernel/entry_32.S       | 6 +++---
> >   arch/powerpc/kernel/exceptions-64e.S | 8 +-------
> >   arch/powerpc/kernel/exceptions-64s.S | 2 +-
> >   arch/powerpc/kernel/head_64.S        | 7 -------
> >   arch/powerpc/kernel/interrupt_64.S   | 6 +++---
> >   6 files changed, 11 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/a=
sm/ptrace.h
> > index a03403695cd4..49d720bb888b 100644
> > --- a/arch/powerpc/include/asm/ptrace.h
> > +++ b/arch/powerpc/include/asm/ptrace.h
> > @@ -99,6 +99,9 @@ struct pt_regs
> >  =20
> >   #define STACK_FRAME_WITH_PT_REGS (STACK_FRAME_OVERHEAD + sizeof(struc=
t pt_regs))
> >  =20
> > +/* 0xffffffff8d9a988d on 64-bit */
> > +#define STACK_FRAME_REGS_MARKER	ASM_CONST(-0x72656773) /* 0x8d9a988d *=
/
> > +
>
> 0x72656773 is "REGS" in ASCII (Big Endian) and you can spot it=20
> immediatly in a memory dump.
> 0x7265677368657265 is "REGSHERE".
>
> 0x8d9a988d is not printable.
>
> Don't know if it can be a problem.

Oh. I guess it doesn't really matter if it has zeroes or f in the
top 4 bytes so I should keep it "REGS" then. I was thinking about
later moving it into the reserved word next to the CR word on
64-bit so we would only have 4 bytes for it anyway.

Thanks,
Nick
