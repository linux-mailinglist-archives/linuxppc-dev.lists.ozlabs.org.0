Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602F53C3EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 07:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDrQ95Cy1z3byT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 15:04:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P0S+K8h4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P0S+K8h4;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDrPV3VVDz305v
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 15:03:24 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso11234083pjl.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jun 2022 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SsXI4Nk4c5Nh1pr4u5qRlhhk3cCyerxeVp+BrrM28jU=;
        b=P0S+K8h4XRMLvEc9QTKwW9uqMvhR3+zBegx1U6P265JiOa/bparFXps9NyoQuqJuOM
         3aKtSyLDhaUQ1FzigOTz++Akmx4p085TXLwwomC7BckXgz19BShYLArZaWrRsDQLmoym
         4g7dDUMUDUsNR16SRIx50aFDa8UJ7SOdJYZC1yAHpDn/7nItDFn4VH3ArzcFKL3DPhdb
         wPjDofhVx77GsBNp67N8aDP9Q6kBFSGuzDfOZnlt/A0X3SWMLed4hv7Be7pw41cbafBs
         VE6WI6FcArmVXazBLpCmg6nLByB1h+2YxoVBOi9oy5s5VAPC3sivdwgnlsp1p+toEEi5
         4RzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SsXI4Nk4c5Nh1pr4u5qRlhhk3cCyerxeVp+BrrM28jU=;
        b=Kqoc+rNaG73anrYzazTszb4jLcQCQqJD/Tnlu/0mFAzQVLPekVqakuBW/5mqoenBOX
         F/sri1K1wT9IJXOyPRoHboaX1kUuJ41CiL1CTAu7g876a61N8CZRl6THCZmVm+Ryirka
         1x8i/KjFcd8205EIAfHDlEkFbZjHJHZuGG4aNJ+v5r1nfMc6rX0KYmwAmXmR9VW5/WCm
         ywXcW7ct6ETxZ9UsbPzpucAuQLtKC3Z0WSvKSRwE1mUpX3S9tMwmjWUHOd7QoLYPIr+L
         vPxsC5XYkPxQ/6ooj+8TRHreTDqCKm5t4mSCqW7F0TPSjkL3eR0mUH64OsPSNGuokBQj
         7yOg==
X-Gm-Message-State: AOAM532TTmZPOXOnXhKNXaCsv1KEzpCR5fmpDzl/N3IJbf/hnmwkfFJL
	3OddlKp4K3rYotzPZrABEXZEIjRqHs30iRVPhSk=
X-Google-Smtp-Source: ABdhPJxd29JADV5Ostw9NNrtKKd3NXn0JpTCM+5uc6TQ35/7D1tafukTXMaB7FoE+Txedk/kWffJivGPOFwawGmvIEM=
X-Received: by 2002:a17:90b:4d0e:b0:1e2:bcd7:c68c with SMTP id
 mw14-20020a17090b4d0e00b001e2bcd7c68cmr9214996pjb.74.1654232599494; Thu, 02
 Jun 2022 22:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220531065936.3674348-1-mpe@ellerman.id.au> <20220531222715.GT25951@gate.crashing.org>
 <87fskopsui.fsf@mpe.ellerman.id.au> <20220601162023.GW25951@gate.crashing.org>
 <CACzsE9qZ0OTv07Tw8OM+K_Md904ZzW6mfnu-qb8OSwznWCgufQ@mail.gmail.com> <20220602084654.GZ25951@gate.crashing.org>
In-Reply-To: <20220602084654.GZ25951@gate.crashing.org>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 3 Jun 2022 15:03:05 +1000
Message-ID: <CACzsE9o8wQj+cCqQmWefKttqHtJ2PpmDULbaiCH=DK3Cj6i1ow@mail.gmail.com>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 2, 2022 at 6:49 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Jun 02, 2022 at 01:01:04PM +1000, Jordan Niethe wrote:
> > > What about the more fundamental thing?  Have the order of the two halves
> > > of a prefixed insn as ulong not depend on endianness?  It really is two
> > > opcodes, and the prefixed one is first, always, even in LE.
> > The reason would be the value of as ulong is then used to write a
> > prefixed instruction to
> > memory with std.
> > If both endiannesses had the halves the same one of them would store
> > the suffix in front of the prefix.
>
> You cannot do such a (possibly) unaligned access from C though, not
> without invoking undefined behaviour.  The compiler usually lets you get
> away with it, but there are no guarantees.  You can make sure you only
> ever do such an access from assembler code of course.

Would using inline assembly to do it be ok?

>
> Swapping the two halves of a register costs at most one insn.  It is
> harmful premature optimisation to make this single cycle advantage
> override more important consideration (almost everything else :-) )

I'm not sure I follow. We are not doing this as an optimisation, but
out of the necessity of writing
the prefixed instruction to memory in a single instruction so that we
don't end up with half an
instruction in the kernel image.

>
>
> Segher
