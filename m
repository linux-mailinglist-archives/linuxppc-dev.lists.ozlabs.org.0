Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B068715E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 07:30:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dOpDvb9a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpm0069Plz3vXy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 17:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dOpDvb9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TplzF6sj7z3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 17:29:45 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5dca1efad59so4498605a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 22:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709620180; x=1710224980; darn=lists.ozlabs.org;
        h=in-reply-to:references:message-id:to:from:subject:cc:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehs1FMrNqF0Qm4Cmnd1jrKgeBA2AS8z5jsASXRqX00s=;
        b=dOpDvb9aXV5niCJucHUl/GYF9FuATGrdSCaoTYnH1iOaNLJgnCz551bPCvH3MwQmSk
         2oFr3/zimNMJqn+VH6ISVCPh07aFdng/qTH9GbkZo7CiqhEhmPv59jIynnfuhFeFCB1k
         o6MbG7T9EKrW14Fq/qUOHAL9FxzJXIli7FkqZUhVvsYcSIiAB+WeFQklU8NaAc+tqOne
         FCTm2dQTGjAxa47iEGMqVGAhhZiBIJ9dzU6sVL0RUFR5rfOa+GM5i4qtCRQY4eiDrZ9v
         3GTfLiUjHnSXl68Mr0uyFzc8c0JiSScKve3r8xGxy9IlLMHmU0/2MoTDTB1u/qlFE8q+
         g03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709620180; x=1710224980;
        h=in-reply-to:references:message-id:to:from:subject:cc:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ehs1FMrNqF0Qm4Cmnd1jrKgeBA2AS8z5jsASXRqX00s=;
        b=fqi0Ue0SpM5dKyc3FveA5ZpbaOB5pGiOB3Kry1yjKSTgCVWLDeaDAD9Q9mtDmP7S6F
         KBR5jB3WdKTflKTHhbGUJcMEun3dkb4srNkXwhhQnx4k4zOMVZYW/cMcbO3zNtrZbsl0
         jHIZNPBlw31ncKRZUeyyx2vqPvLkJXt4tKaZ0pViNEKCc63YPg12IXSKohFY/gAgfu0S
         MdF4YXMw7A8hCP5s+wBG8xY0Gc3A5TLy8eJOmuQp1kFkiP5QJ3Wl1ZeQV5fu2cUjeke0
         SSRGeJdTS5iIn8AHr/FrdINt8apDIYg2vn+NdO9uxnWUV14WQKhHkFVRIP67UxZvou/n
         RsCA==
X-Forwarded-Encrypted: i=1; AJvYcCXS7uaGAUgMzNTS2FNbLjXHE59CKldUH3/2LcfRT5tyRJqrE5BMJ8OlVJ6FAuuHAa/y9SGo5py0mcCu1IZopuPgAbPXjZ0IfaCVeoS0GQ==
X-Gm-Message-State: AOJu0Yz0ut9AtzxuJ+5/USONuNOpvMQwYW5fRYNafkX6pUNRh9uF/6Ok
	RlScnbXrJl1JxQ8GQyXT5/uYfDOETdFsbRdq7b7qRAzajnIApEAJ
X-Google-Smtp-Source: AGHT+IHIYYuQtqS0F/i6cQjBW10zNWzbuGB2R1vTgeNkjVwR3RJ9xvDa6ArYyZ7HT2BUnF/IASYQgg==
X-Received: by 2002:a05:6a20:9f89:b0:1a1:44c8:e61a with SMTP id mm9-20020a056a209f8900b001a144c8e61amr1036917pzb.59.1709620180295;
        Mon, 04 Mar 2024 22:29:40 -0800 (PST)
Received: from localhost ([1.146.6.26])
        by smtp.gmail.com with ESMTPSA id lo16-20020a170903435000b001dcc160a4ddsm9651538plb.169.2024.03.04.22.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 22:29:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 16:29:34 +1000
Subject: Re: [kvm-unit-tests PATCH 03/32] powerpc: Fix stack backtrace
 termination
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
Message-Id: <CZLLLI5JUI8L.1CQ5IF84ZGBYO@wheely>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-4-npiggin@gmail.com>
 <94491aab-b252-4590-b2a7-7a581297606f@redhat.com>
In-Reply-To: <94491aab-b252-4590-b2a7-7a581297606f@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel
 Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Feb 27, 2024 at 6:50 PM AEST, Thomas Huth wrote:
> On 26/02/2024 11.11, Nicholas Piggin wrote:
> > The backtrace handler terminates when it sees a NULL caller address,
> > but the powerpc stack setup does not keep such a NULL caller frame
> > at the start of the stack.
> >=20
> > This happens to work on pseries because the memory at 0 is mapped and
> > it contains 0 at the location of the return address pointer if it
> > were a stack frame. But this is fragile, and does not work with powernv
> > where address 0 contains firmware instructions.
> >=20
> > Use the existing dummy frame on stack as the NULL caller, and create a
> > new frame on stack for the entry code.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   powerpc/cstart64.S | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
>
> Thanks for tackling this! ... however, not doing powerpc work since years=
=20
> anymore, I have some ignorant questions below...
>
> > diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> > index e18ae9a22..14ab0c6c8 100644
> > --- a/powerpc/cstart64.S
> > +++ b/powerpc/cstart64.S
> > @@ -46,8 +46,16 @@ start:
> >   	add	r1, r1, r31
> >   	add	r2, r2, r31
> >  =20
> > +	/* Zero backpointers in initial stack frame so backtrace() stops */
> > +	li	r0,0
> > +	std	r0,0(r1)
>
> 0(r1) is the back chain pointer ...
>
> > +	std	r0,16(r1)
>
> ... but what is 16(r1) ? I suppose that should be the "LR save word" ? Bu=
t=20
> isn't that at 8(r1) instead?? (not sure whether I'm looking at the right =
ELF=20
> abi spec right now...)
>
> Anyway, a comment in the source would be helpful here.
>
> > +
> > +	/* Create entry frame */
> > +	stdu	r1,-INT_FRAME_SIZE(r1)
>
> Since we already create an initial frame via stackptr from powerpc/flat.l=
ds,=20
> do we really need to create this additional one here? Or does the one fro=
m=20
> flat.lds have to be completely empty, i.e. also no DTB pointer in it?

Oh you already figured the above questions. For this, we do have
one frame allocated already statically yes. But if we don't create
another one here then our callee will store LR into it, but the
unwinder only exits when it sees a NULL return address so it would
keep trying to walk.

We could make it terminate on NULL back chain pointer, but that's
a bit more change that also touches non-powerpc code in the generic
unwinder, and still needs some changes here. Maybe we should do
that after this series though. I'll include a comment to look at
redoing it later.

>
> >   	/* save DTB pointer */
> > -	std	r3, 56(r1)
> > +	SAVE_GPR(3,r1)
>
> Isn't SAVE_GPR rather meant for the interrupt frame, not for the normal C=
=20
> calling convention frames?
>
> Sorry for asking dumb questions ... I still have a hard time understandin=
g=20
> the changes here... :-/

Ah, that was me being lazy and using an interrupt frame for the new
frame.

Thanks,
Nick

>
> >   	/*
> >   	 * Call relocate. relocate is C code, but careful to not use
> > @@ -101,7 +109,7 @@ start:
> >   	stw	r4, 0(r3)
> >  =20
> >   	/* complete setup */
> > -1:	ld	r3, 56(r1)
> > +1:	REST_GPR(3, r1)
> >   	bl	setup
> >  =20
> >   	/* run the test */
>
>   Thomas

