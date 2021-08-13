Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C60FE3EAFF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 08:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmD2G4lwvz3cPY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 16:20:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uh320nEJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uh320nEJ; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmD1c4DQrz30F4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 16:20:04 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so3926688pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3Plf9kYprckAlJtYbb7SyhR3dTcw+NdeOwPa/nQw2qQ=;
 b=uh320nEJ2La0l2ayXToOEW/pFFNDV4IY+u1oTBcLjMAFVRSG3DAPfo/hPs+T7LiKFI
 dly3bhsDBpKtyQRzECa444UPfQVrIB3XDQXtPifiYLDJkREE4qAQZunXeaiX4qxO3uAz
 CE6fUWMzZDQ7NsW3nBfncRxjGIgKPSgd89onfG4mPkDt0WNiWtplH9sw+JWpjcsRif0b
 lrOU/mBCAlrAZUob8UR3RLm3cVtRilQ0PU2RTX9BsF4Yi/FPpxD4PprjhOKGzOjdLUcc
 tHiy/gjnnpvJ+SwLoxwavleSITLsTGBh5VarwFOoH9e82cCKLUAE93OetgTrgUMLm1Uo
 jMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3Plf9kYprckAlJtYbb7SyhR3dTcw+NdeOwPa/nQw2qQ=;
 b=MpYtUiMGv0ZV5ip4uRTM2MxuC8ONwewd/Xuk29to+gONTuAjQr8a3ol6ChJ6yvze5s
 RdwKQ6RRU/TsUT9typvZGc/kEo9JtBSXGv9yZo9bzBwSz9sIaeF0XF92Nn4wOTmJI2Rh
 GZkgq+Pn5fkdlm5t+Ux4Unyjq3sIwIAzSzT+AxkFaguy/bq8gRx1AW1Ef/RhMGXOvl3K
 BStGHctJZ0oDmoaV28ucm1Rd/uNTQfgkHDRa4fmL8lLUngCSrubFDJ7oTFTzkU0jHQzO
 Z9KxJOD17FcUSBWfYWx8vh0BLS+Y4noSQrDxHQchg3AknAqs/+3ULxrJ6jZvg1NVJqeW
 G27w==
X-Gm-Message-State: AOAM530uN4jUlrF1tUqXkajGsJlg2gnr5Dytos6YbErx/sQu3ZoZr5u/
 O8HM3U2SoA7eWPzr4emcl0M=
X-Google-Smtp-Source: ABdhPJwjY9sww6bgXsU1OD1U78Y9YWxbhl7MSl2Q+cyvPbyaE3AzOVb4t7pilHfLFPL8vJ4tHmwfaA==
X-Received: by 2002:a17:90a:db09:: with SMTP id
 g9mr1068009pjv.205.1628835601865; 
 Thu, 12 Aug 2021 23:20:01 -0700 (PDT)
Received: from localhost (60-242-208-220.static.tpgi.com.au. [60.242.208.220])
 by smtp.gmail.com with ESMTPSA id
 y23sm810874pfb.130.2021.08.12.23.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 23:20:01 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:19:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/bug: Provide better flexibility to
 WARN_ON/__WARN_FLAGS() with asm goto
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu>
 <389962b1b702e3c78d169e59bcfac56282889173.1618331882.git.christophe.leroy@csgroup.eu>
In-Reply-To: <389962b1b702e3c78d169e59bcfac56282889173.1618331882.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1628834900.ecs68prq9x.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of April 14, 2021 2:38 am:
> Using asm goto in __WARN_FLAGS() and WARN_ON() allows more
> flexibility to GCC.
>=20
> For that add an entry to the exception table so that
> program_check_exception() knowns where to resume execution
> after a WARNING.

Nice idea. How much does it bloat the exception table?
How easy would it be to make a different exception table for
unimportant stuff like WARN_ON faults?

>=20
> Here are two exemples. The first one is done on PPC32 (which
> benefits from the previous patch), the second is on PPC64.
>=20
> 	unsigned long test(struct pt_regs *regs)
> 	{
> 		int ret;
>=20
> 		WARN_ON(regs->msr & MSR_PR);
>=20
> 		return regs->gpr[3];
> 	}
>=20
> 	unsigned long test9w(unsigned long a, unsigned long b)
> 	{
> 		if (WARN_ON(!b))
> 			return 0;
> 		return a / b;
> 	}
>=20
> Before the patch:
>=20
> 	000003a8 <test>:
> 	 3a8:	81 23 00 84 	lwz     r9,132(r3)
> 	 3ac:	71 29 40 00 	andi.   r9,r9,16384
> 	 3b0:	40 82 00 0c 	bne     3bc <test+0x14>
> 	 3b4:	80 63 00 0c 	lwz     r3,12(r3)
> 	 3b8:	4e 80 00 20 	blr
>=20
> 	 3bc:	0f e0 00 00 	twui    r0,0
> 	 3c0:	80 63 00 0c 	lwz     r3,12(r3)
> 	 3c4:	4e 80 00 20 	blr
>=20
> 	0000000000000bf0 <.test9w>:
> 	 bf0:	7c 89 00 74 	cntlzd  r9,r4
> 	 bf4:	79 29 d1 82 	rldicl  r9,r9,58,6
> 	 bf8:	0b 09 00 00 	tdnei   r9,0
> 	 bfc:	2c 24 00 00 	cmpdi   r4,0
> 	 c00:	41 82 00 0c 	beq     c0c <.test9w+0x1c>
> 	 c04:	7c 63 23 92 	divdu   r3,r3,r4
> 	 c08:	4e 80 00 20 	blr
>=20
> 	 c0c:	38 60 00 00 	li      r3,0
> 	 c10:	4e 80 00 20 	blr
>=20
> After the patch:
>=20
> 	000003a8 <test>:
> 	 3a8:	81 23 00 84 	lwz     r9,132(r3)
> 	 3ac:	71 29 40 00 	andi.   r9,r9,16384
> 	 3b0:	40 82 00 0c 	bne     3bc <test+0x14>
> 	 3b4:	80 63 00 0c 	lwz     r3,12(r3)
> 	 3b8:	4e 80 00 20 	blr
>=20
> 	 3bc:	0f e0 00 00 	twui    r0,0
>=20
> 	0000000000000c50 <.test9w>:
> 	 c50:	7c 89 00 74 	cntlzd  r9,r4
> 	 c54:	79 29 d1 82 	rldicl  r9,r9,58,6
> 	 c58:	0b 09 00 00 	tdnei   r9,0
> 	 c5c:	7c 63 23 92 	divdu   r3,r3,r4
> 	 c60:	4e 80 00 20 	blr
>=20
> 	 c70:	38 60 00 00 	li      r3,0
> 	 c74:	4e 80 00 20 	blr

One thing that would be nice for WARN_ON_ONCE is to patch out the trap
after the program interrupt. I've seen sometimes the WARN_ON_ONCE starts
firing a lot and slows down the kernel. That gets harder to do if the
trap is now part of the control flow.

I guess that's less important case for performance though. And in theory
you might be able to replace the trap with an equivalent cmp and branch
(but that's probably going too over engineering it).

Thanks,
Nick

