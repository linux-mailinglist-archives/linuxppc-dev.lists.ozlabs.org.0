Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B139B871377
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:15:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bb7zEOkp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpfKw3GTkz3vZ0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bb7zEOkp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpfJs3KR9z3cZD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:14:37 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5ce942efda5so4234448a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709604874; x=1710209674; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Glrxl2oFaqFsQaFLm3CDrPWwsMAFvXjuJugoNqHYYbQ=;
        b=Bb7zEOkpKtPrXMTb3jMMlUUe9piaWJZ05k2cy17DNg/kN6bJ8fvclpQPRCgyHldIYg
         zKe3/q2TfikleH4Nij1M+x94Rdj0N252MpO3TaWu1/F04/Fa6OiSLyYo508/cFfPd4mf
         OlnGQVfnEhv9Nc7zAeUWNsZRkgW+ufaGED5hjFqmVBcLratQKCqSrd+hidKCDP95NcPa
         gQIRM2OhCih00eejWVIXyVYlpOZLL+Ugg6fyOkAtKF5gDnu4IRnxt0LExCERFPDKl9IF
         z3BXakw/PPf/Su2TrBe318hXavM1cgk9JoxsgQIjeD8/d2lO88b24HhgZuC4VBV2Kp2m
         VPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604874; x=1710209674;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Glrxl2oFaqFsQaFLm3CDrPWwsMAFvXjuJugoNqHYYbQ=;
        b=AaYZ4XR1tIKwnJf6lF4DpgGL8uR0tHcIBtuWTm8QTiX1uw5DLjYaah+ZZxII6trHJ9
         eXvXoxc2H2HcISRYHxdHnCE29eLVGE8li6QMv0WiaK3EfrXZ4dcNSig59C3IAI0oTxQI
         Q7M2M55/7w0KAGkgw6ksVTKgZrRtASOfRSZeNJAu2FLE2RRDrxg65YwSytuKyz30Z6+A
         q8gaDYai6JZ2wyguvNepP/zjQE9EgdHjdzk5D/C26tfRK9mx4f66PAQsmVnaXdDBKvh0
         n91FWACTgSEMKFeaxtbwQghE/8sGTCLV+knd8U4z2loG+07e2KbQZssDQaZjJNH5RID4
         H1fA==
X-Forwarded-Encrypted: i=1; AJvYcCURFYXmkIe+a1SNCxX1f1JrAJchx0v/XWwkB1rmIS7B+zmVA2+EB5uM8M/6g/ODWfWDuyQDupD87eiZy1NG3Gec4blZOYPNe8vKeX9OdA==
X-Gm-Message-State: AOJu0YyU4U52b1p30pnB+y2Vkyqe7Nwiu20lrg72YKxKokNXAEq0yZQs
	2cuLgxIOOmnrJJ/Nr+ySYHewGL4VcvOcyHWXyVGe2ZCW+DF3nUTK
X-Google-Smtp-Source: AGHT+IHjfT1+2QFMfQcAPYcvu8DZ+vjEp/Mvi30WYIv5XycXGtY/URBVHcfPW0OIRDmmDfGHfVlOiQ==
X-Received: by 2002:a05:6a20:7da9:b0:1a1:4bec:4835 with SMTP id v41-20020a056a207da900b001a14bec4835mr545319pzj.3.1709604874345;
        Mon, 04 Mar 2024 18:14:34 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db6da30331sm9231687pla.86.2024.03.04.18.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:14:34 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:14:28 +1000
Message-Id: <CZLGCIHLYA0V.33QYW4MF394R7@wheely>
Subject: Re: [kvm-unit-tests PATCH 12/32] powerpc: Fix emulator illegal
 instruction test for powernv
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-13-npiggin@gmail.com>
 <a9441736-e254-49f0-9bea-e8008cec3e96@redhat.com>
In-Reply-To: <a9441736-e254-49f0-9bea-e8008cec3e96@redhat.com>
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

On Fri Mar 1, 2024 at 9:50 PM AEST, Thomas Huth wrote:
> On 26/02/2024 11.11, Nicholas Piggin wrote:
> > Illegal instructions cause 0xe40 (HEAI) interrupts rather
> > than program interrupts.
> >=20
> > Acked-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   lib/powerpc/asm/processor.h |  1 +
> >   lib/powerpc/setup.c         | 13 +++++++++++++
> >   powerpc/emulator.c          | 21 ++++++++++++++++++++-
> >   3 files changed, 34 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
> > index 9d8061962..cf1b9d8ff 100644
> > --- a/lib/powerpc/asm/processor.h
> > +++ b/lib/powerpc/asm/processor.h
> > @@ -11,6 +11,7 @@ void do_handle_exception(struct pt_regs *regs);
> >   #endif /* __ASSEMBLY__ */
> >  =20
> >   extern bool cpu_has_hv;
> > +extern bool cpu_has_heai;
> >  =20
> >   static inline uint64_t mfspr(int nr)
> >   {
> > diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
> > index 89e5157f2..3c81aee9e 100644
> > --- a/lib/powerpc/setup.c
> > +++ b/lib/powerpc/setup.c
> > @@ -87,6 +87,7 @@ static void cpu_set(int fdtnode, u64 regval, void *in=
fo)
> >   }
> >  =20
> >   bool cpu_has_hv;
> > +bool cpu_has_heai;
> >  =20
> >   static void cpu_init(void)
> >   {
> > @@ -108,6 +109,18 @@ static void cpu_init(void)
> >   		hcall(H_SET_MODE, 0, 4, 0, 0);
> >   #endif
> >   	}
> > +
> > +	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
> > +	case PVR_VER_POWER10:
> > +	case PVR_VER_POWER9:
> > +	case PVR_VER_POWER8E:
> > +	case PVR_VER_POWER8NVL:
> > +	case PVR_VER_POWER8:
> > +		cpu_has_heai =3D true;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> >   }
> >  =20
> >   static void mem_init(phys_addr_t freemem_start)
> > diff --git a/powerpc/emulator.c b/powerpc/emulator.c
> > index 39dd59645..c9b17f742 100644
> > --- a/powerpc/emulator.c
> > +++ b/powerpc/emulator.c
> > @@ -31,6 +31,20 @@ static void program_check_handler(struct pt_regs *re=
gs, void *opaque)
> >   	regs->nip +=3D 4;
> >   }
> >  =20
> > +static void heai_handler(struct pt_regs *regs, void *opaque)
> > +{
> > +	int *data =3D opaque;
> > +
> > +	if (verbose) {
> > +		printf("Detected invalid instruction %#018lx: %08x\n",
> > +		       regs->nip, *(uint32_t*)regs->nip);
> > +	}
> > +
> > +	*data =3D 8; /* Illegal instruction */
> > +
> > +	regs->nip +=3D 4;
> > +}
> > +
> >   static void alignment_handler(struct pt_regs *regs, void *opaque)
> >   {
> >   	int *data =3D opaque;
> > @@ -362,7 +376,12 @@ int main(int argc, char **argv)
> >   {
> >   	int i;
> >  =20
> > -	handle_exception(0x700, program_check_handler, (void *)&is_invalid);
> > +	if (cpu_has_heai) {
> > +		handle_exception(0xe40, heai_handler, (void *)&is_invalid);
> > +		handle_exception(0x700, program_check_handler, (void *)&is_invalid);
> > +	} else {
> > +		handle_exception(0x700, program_check_handler, (void *)&is_invalid);
>
> The 0x700 line looks identical to the other part of the if-statement ... =
I'd=20
> suggest to leave it outside of the if-statement, drop the else-part and j=
ust=20
> set 0xe40 if cpu_has_heai.

Can do.

Thanks,
Nick
