Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E699861F2B5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 13:15:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5VYD4djMz3cLp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 23:15:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JyfGs+MD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JyfGs+MD;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5VXJ3HtLz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 23:14:24 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id k22so10424944pfd.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 04:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ+gNJJepQlf8XJSvmdtr0TPbl2KfXJ0oNv3mgjP2Dg=;
        b=JyfGs+MDUZcifcgPVXFnVeOmLHENtS/FduSr39qrJ8yzXHLIIpPAPnvzSUsrZX3PyN
         zLoBqE/PkL2l2WsR7L56gKnji/tbaOKclVTJ0MQorKznw9Kt8UHAnAPH/+fLVrGljJi1
         EH4O4KJjq6vAvrWsI8lV5kybo9KnmrUA8DF40u1RniyGSMmvsoYr2olNuYxas8ZyNPA+
         8BZO9QygNtkNQFPvCquOpwTVB9CUA9LDeP//fiBrgKprVQcHqrR9nNI4Edh9cCDODFtd
         t9JGzjcqr1UZP46Alm4D/OP0zB/iVgAav42yDfphdgzWZxSMG/nQDTeY7spHCnVvn8Sr
         wSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJ+gNJJepQlf8XJSvmdtr0TPbl2KfXJ0oNv3mgjP2Dg=;
        b=pduxiI5yTADmS2ceC4kpwOOkryHZiaj02+3F7AvQzyN1YN9DRAgB39OiIbA5TnvVPf
         aujJZIe5UQ/8e9wubgyLk1EAbheX1m9VGV0gBXtToic+blI4vs8wpWdJyKjKsYXtc70b
         FnUAhKNeusSazkMBLFJvzLiLd9m6VxWm/zBNhs33HaR/ezshskCxywWY5x2L/UuPY1pn
         m0lM1u/+ID1KL4nRf/OkTORD/gbu0ejyL0T2Xkg0qK/te/WrfAA4bunWij3C6oLNHVVu
         voH0706j89FO165owNuTbOWbpjRWTEbP1sJDcktMTRlTfeXGWap9VqGk2n1XK2wKpQQH
         coFg==
X-Gm-Message-State: ACrzQf1Mzuu35vz36OZEponbOV+oT37+gv1eAWGUyhOfnbkc7GOCy/Mv
	2PPQvdqNR547XC/AIz9Hs4A=
X-Google-Smtp-Source: AMsMyM4HXzx5BuHaRsAFLo+H6id+TDJGAPRqqnErE3GfBt1WV2tNRKTch9s/uiVXFwiAlaTJnRnWBA==
X-Received: by 2002:a63:5341:0:b0:46f:d05d:55cf with SMTP id t1-20020a635341000000b0046fd05d55cfmr33552519pgl.356.1667823261575;
        Mon, 07 Nov 2022 04:14:21 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id r11-20020a170902c60b00b001830ed575c3sm4828350plr.117.2022.11.07.04.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:14:21 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 22:14:16 +1000
Message-Id: <CO6202HG8VAN.1ROEE25G4KDK2@bobo>
Subject: Re: [PATCH v5 2/2] powerpc/64: Add module check for ELF ABI version
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20221031120733.3956781-1-npiggin@gmail.com>
 <20221031120733.3956781-3-npiggin@gmail.com>
 <513e1973-a1d4-c698-1441-9c7d0f5205ed@csgroup.eu>
In-Reply-To: <513e1973-a1d4-c698-1441-9c7d0f5205ed@csgroup.eu>
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
Cc: Luis
 Chamberlain <mcgrof@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Nov 3, 2022 at 6:35 PM AEST, Christophe Leroy wrote:
>
>
> Le 31/10/2022 =C3=A0 13:07, Nicholas Piggin a =C3=A9crit=C2=A0:
> > Override the generic module ELF check to provide a check for the ELF AB=
I
> > version. This becomes important if we allow big-endian ELF ABI V2 build=
s
> > but it doesn't hurt to check now.
> >=20
> > Cc: Jessica Yu <jeyu@kernel.org>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > [np: split patch, added changelog, adjust to Jessica's proposal]
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   arch/powerpc/kernel/module.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >=20
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.=
c
> > index f6d6ae0a1692..d46bf9bfda26 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -19,6 +19,23 @@
> >  =20
> >   static LIST_HEAD(module_bug_list);
> >  =20
> > +#ifdef CONFIG_PPC64
>
> Can it go in arch/powerpc/kernel/module_64.c instead ?
>
> > +bool module_elf_check_arch(Elf_Ehdr *hdr)
> > +{
> > +	unsigned long abi_level =3D hdr->e_flags & 0x3;
> > +
> > +	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2)) {
> > +		if (abi_level !=3D 2)
> > +			return false;
> > +	} else {
> > +		if (abi_level >=3D 2)
> > +			return false;
> > +	}
> > +
> > +	return true;
>
> Can be simpler:
>
> 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
> 		return abi_level =3D=3D 2;
> 	else
> 		return abi_level < 2;

Yes I think both of those can be done. Good suggestions.

Thanks,
Nick
