Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19761F39F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 13:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5WF566MHz3cTC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 23:46:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EiCRWtUA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EiCRWtUA;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5WD713nSz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 23:45:25 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso14442795pjg.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 04:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwbwO6++xAZOeOY80zc6kwYKIn8yufEQSv/H0qeF+rQ=;
        b=EiCRWtUA5g1s+ovSncTxCNjasllErY5nIh/Cxl5q5g3t8rz6mWI8k7bJnNdV5n+COf
         gbWk6+UrDJTCrz92LgpAViraU7Ong67neE8mKkbku2rrJVNBYcb8IUqfIFDzGis7BNWd
         nhwFgUP0/RXnQWjIW0JfMIXy5XCp8LUJmeTw27jrQArqyRziUT4oTrSlZvURyn7c5HLi
         P2rU8RuzqBx6PhMBXpVnxui3E74citSsfAWa2YefJMRdw492QTvdlgxS/8OqCOTFFov8
         JNQ06EkycFKvxzV1X1WmCVgq+0lBnSvOnBHjNuBlLWjaC4CHDZUPCfyOuyRd6jSZRZqP
         gjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EwbwO6++xAZOeOY80zc6kwYKIn8yufEQSv/H0qeF+rQ=;
        b=SFARtvj6PtnTusdsUYaMxmEKd+SFbhBCNLSK02lJ7fFaneb5n4uvCdwxu/Ggi1RgD7
         lI1cihNG0Hp/eOYYS33YYLvRi/5Zt8H4QKb633bb6VlmdlPcPV0QPpEKTpF4H7sx4bGi
         YTxzABK2nRIV7UX2pRThVwrE/lEU7JyP5m+YCt+cZMrRVr0UgCyp1uy5rlDDXbxwkGnx
         EIOASlU3IldgKedrlI9T2WuL5mKVaXdMtYW7qJdJjAFPCifFxkVxw6tUZGFRtX1ftiOJ
         I+iBoWIscdLFQkCgaIoxUl9/BgRadXPVbSCJSlwOD3obWIV+JQ7/kkfcSSM22aUA/7be
         dTjQ==
X-Gm-Message-State: ACrzQf1kl4SLE2yLkeG4Y7N4GNwvCA1YUylELFKmTFcp1uaXX2doavTn
	rpu0VNR2wkP/ZD0BjPYb8t7tme02ovE=
X-Google-Smtp-Source: AMsMyM4JvyUGdL95R9RNUAkmpTn7e4Y3p3Ct5/CAnYK+kuDq7VnzVGf9myautiUUAdY9F3lvdzCE8Q==
X-Received: by 2002:a17:90b:2306:b0:212:533:3188 with SMTP id mt6-20020a17090b230600b0021205333188mr69068917pjb.210.1667825122176;
        Mon, 07 Nov 2022 04:45:22 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902e88c00b001780e4e6b65sm4927235plg.114.2022.11.07.04.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:45:21 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 22:45:18 +1000
Message-Id: <CO62NTZ4AV1U.NQ68OKKW9L6E@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 05/19] powerpc/32: Use load and store multiple in
 GPR save/restore macros
X-Mailer: aerc 0.11.0
References: <20221031055440.3594315-1-npiggin@gmail.com>
 <20221031055440.3594315-6-npiggin@gmail.com>
 <6dd19b06-f967-7643-0857-88c92bf1ea79@csgroup.eu>
In-Reply-To: <6dd19b06-f967-7643-0857-88c92bf1ea79@csgroup.eu>
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

On Thu Nov 3, 2022 at 6:26 PM AEST, Christophe Leroy wrote:
> It contradicts commit a85c728cb5e1 ("powerpc/32: Don't use lmw/stmw for=
=20
> saving/restoring non volatile regs")

Hmm okay. Do you want to keep the #ifdef case in ppc_save_regs for ppc32
to save ~124 bytes of text? I don't mind either way.

Thanks,
Nick

>
> Le 31/10/2022 =C3=A0 06:54, Nicholas Piggin a =C3=A9crit=C2=A0:
> > ---
> >   arch/powerpc/include/asm/ppc_asm.h | 18 ++++++++++++++++--
> >   1 file changed, 16 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/=
asm/ppc_asm.h
> > index 753a2757bcd4..ac44383d350a 100644
> > --- a/arch/powerpc/include/asm/ppc_asm.h
> > +++ b/arch/powerpc/include/asm/ppc_asm.h
> > @@ -57,8 +57,22 @@
> >   #define SAVE_NVGPRS(base)		SAVE_GPRS(14, 31, base)
> >   #define REST_NVGPRS(base)		REST_GPRS(14, 31, base)
> >   #else
> > -#define SAVE_GPRS(start, end, base)	OP_REGS stw, 4, start, end, base, =
GPR0
> > -#define REST_GPRS(start, end, base)	OP_REGS lwz, 4, start, end, base, =
GPR0
> > +.macro __SAVE_GPRS start, end, base, offset
> > +	.if \end =3D=3D 31
> > +		stmw	\start,\offset(\base)
> > +	.else
> > +		OP_REGS stw, 4, \start, \end, \base, \offset
> > +	.endif
> > +.endm
> > +.macro __REST_GPRS start, end, base, offset
> > +	.if \end =3D=3D 31
> > +		lmw	\start,\offset(\base)
> > +	.else
> > +		OP_REGS lwz, 4, \start, \end, \base, \offset
> > +	.endif
> > +.endm
> > +#define SAVE_GPRS(start, end, base)	__SAVE_GPRS start, end, base, GPR0
> > +#define REST_GPRS(start, end, base)	__REST_GPRS start, end, base, GPR0
> >   #define SAVE_NVGPRS(base)		SAVE_GPRS(13, 31, base)
> >   #define REST_NVGPRS(base)		REST_GPRS(13, 31, base)
> >   #endif

