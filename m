Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD361F33A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 13:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5Vsb2Lcyz3cMn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 23:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O4LiwNnE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O4LiwNnE;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5Vrg4X4wz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 23:28:33 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id u6so10888618plq.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 04:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IADPc7pyHlbyK73T06HNwDomah80v+n1pw7xf5PNnVk=;
        b=O4LiwNnEFGwmIGu2cCkL96kBx3al4uBzk5XjVpv8dhaAoPEqt4kBSBc4n1Mbx9FHjf
         ZpFET2eZNfwh8sxr2+f7RKIIyJ+CPpu4wxnJJUuuhl09s/YdR1Cment6H0+tc1QitZLC
         yjOtcsRWTWpzjykxtq31/SWRKv30pjtOad0LhZe6fIaFXJiqmRL0xR+0dd9qYwPYUNUC
         gpWnaj3TmbI0B5HSQdTSNzYmd6LSnJhiMLlyJ4DlLUAzbOw3uapErP2V5iaYG6Q9zRvu
         UdmDWCAsPJSG6dULBU/NR8XLjX5YWjU2z6xoGrRsZTq6E5L30A25yu/xFE4rXnTn7FC+
         8vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IADPc7pyHlbyK73T06HNwDomah80v+n1pw7xf5PNnVk=;
        b=20Z1iBdWimbe6bPfW72hpA2+XGxLkk32NQB37vK7PWaxwVqS0Nb1Fr3SgVeryZiMSF
         +bxhH6U4V2PI6DBzHoE1OJgvfk3uhOuK0G1rXVls5qQX8pOtPG9Snz+DxR1nU6EpNaku
         Lya3jgGoexb/9j1k+rC+uqHc9VGuXR9GCEvGtf/buEvJZflKL/suwTb5FyVk59GuvD2H
         49aJboNaE7qTSRW8jb+yMRuw5oB9votcGbXZFYWnpk69Fc4KdJZjrr5G+GJnSiixcSgH
         9ikcmDnA4bQ9mSyxhg0bmNnXqpZfVfyjc/JVXuBxjrNM2lb9QPC4xC/pcUDJp2XVzocS
         Ic/A==
X-Gm-Message-State: ACrzQf1G2TGQAs/dGWxTZmAlAxWeR+xZiYHVZE0MNywuqrcgyWgwltxq
	spVJxp8F0fiCGy7Fh5fWhJY=
X-Google-Smtp-Source: AMsMyM7LKVBy+zoCUiJrrEtufo1DSH2rC7vCpztuV1utPD5RX56HVRWfMQJI0hOy4I2rQeRy3Y6NAQ==
X-Received: by 2002:a17:90b:198b:b0:213:2574:7e0e with SMTP id mv11-20020a17090b198b00b0021325747e0emr49997163pjb.177.1667824111367;
        Mon, 07 Nov 2022 04:28:31 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id c16-20020a056a00009000b0056c3d3f5a8dsm4360957pfj.56.2022.11.07.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:28:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 22:28:26 +1000
Message-Id: <CO62AX0EBW9Y.2SCODZ31UQD4N@bobo>
Subject: Re: [PATCH v9 5/7] powerpc/tlb: Add local flush for page given
 mm_struct and psize
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Benjamin Gray" <bgray@linux.ibm.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20221025044409.448755-1-bgray@linux.ibm.com>
 <20221025044409.448755-6-bgray@linux.ibm.com>
 <6c13afb6-3b58-f673-a396-1ae80931b80b@csgroup.eu>
 <b2d1c870311672650798c0e7eee5532b505a0176.camel@linux.ibm.com>
 <cd76d514a59088706721bbd3817b0ae664751acc.camel@linux.ibm.com>
In-Reply-To: <cd76d514a59088706721bbd3817b0ae664751acc.camel@linux.ibm.com>
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 7, 2022 at 4:58 PM AEST, Benjamin Gray wrote:
> On Thu, 2022-11-03 at 11:39 +1100, Benjamin Gray wrote:
> > On Wed, 2022-11-02 at 09:56 +0000, Christophe Leroy wrote:
> > > By the way, 'extern' keyword is pointless and deprecated for
> > > functions=20
> > > prototypes, please don't add new ones, even if other historical=20
> > > prototypes have one.
> >=20
> > This and the above commented parts match the style of the surrounding
> > implementations. For example,
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0static inline void loca=
l_flush_tlb_mm(struct mm_struct *mm)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (radix_enabled())
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
return radix__local_flush_tlb_mm(mm);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return hash__local_flush_tlb_mm(mm);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> >=20
> > I am not going to add code that is inconsistent with the surrounding
> > code. That just causes confusion later down the line when readers
> > wonder why this function is special compared to the others. If it
> > needs
> > to use modern style, then I would be happy to include a patch that
> > modernises the surrounding code first.
> >=20
> > Though why the hash__* functions are empty I'm not sure... If they
> > were
> > not implemented I would have expected a BUILD_BUG(). If they are
> > unnecessary due to hash itself, it's odd that they exist (as you
> > point
> > out for the new one).
>
> From what I can see in the history, the empty hash functions were
> originally introduced as 64-bit compatibility definitions for the hash
> MMU (which I guess doesn't require any action).

Yeah the hash MMU does hash PTE update and TLB flushing in the Linux pte
update APIs (which end up at hash__pte_update()). By the time Linux
calls flush_tlb_xxx(), the powerpc code had already done the necessary
TLB flushing.

> These empty functions
> were shuffled around, then eventually prefixed with hash__* to make way
> for the radix variants, which are hidden behind a generic
> 'local_flush_tlb_mm' etc. implementation as we see today. So basically,
> the empty hash__* functions no longer (never, really) served a purpose
> once the generic wrapper was added. I'll add a patch to delete them and
> clean up the return voids.

Yeah I think you got it - the functions had to be there pre-radix
because they were required by core code, and when radix was added
it probably just followed a template. Removing empty hash__ functions
should be fine I think.

Thanks,
Nick
