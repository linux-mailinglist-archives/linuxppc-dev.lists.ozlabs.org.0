Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5111B378A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 08:33:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496VxX5BFrzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 16:33:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M5wgX8o3; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496Vvw5kc4zDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 16:31:54 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id k18so543235pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Yvs+jDMlztJFPt5LzfczyrUzcW5qABLRNQxvKGI4VrM=;
 b=M5wgX8o3tW2GHJyD1APO0kyeeywMQvwgTA9EPixbd9OdbrzKptK1e8tsM8U8H0Nasp
 SaljzHJnrnvV3+315c3Y0BaLx6asMU8hgmPFZIZddy/sDuuBiiYBGnpVaPD6dZIkBVMW
 L5QRNXZmEweq4uee1SSbVV0E4j2kjvDnVThP2nBR/KL2PE54lAxbG0abcoIwAfp3vfM2
 oO3vQ06IbjfnbE8OI5JcSw6UxTXtY7gT4ajkw33S3fgoJe7fy5TblxcqjAYkLx/AsNO/
 Zd0+yx/Tp/69UmThoy6OSNFJLsDzylQAKporJlk2DpfUkGrIXPi1FfmmB10jj0htyJWt
 GstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Yvs+jDMlztJFPt5LzfczyrUzcW5qABLRNQxvKGI4VrM=;
 b=jBi3ZHq7opWblPoaFPQr0YUAU50R1fnXQ5+udSDn96nC+rbadnDz9/CkZVYFvT33if
 jEiosaTk7yAPWZHXkE7rdX/5cmCQhHr2G/9e5jjhPxcL8l+zR8zfKQKRr7fCS6s77M8w
 zf4dRaMu4kvOkKfnV4kcsei6tBKdNGhY1dqUPZ768vbs/O9rc/Y0flHgpsbmWcS5DSqA
 enDG2hxAlRxBCO7OfRHSwhz6TorkGLVQxbBdudGlmHvYMmK1oc39EQxcjXmHYOse0yxt
 Yc8JD1sjxdQPRuY0YHJof5upNI5zKeFynIs9bdWVS0rtCF4jB19GJcMKSLVSzLSQMRTO
 Oytw==
X-Gm-Message-State: AGi0PubyteqAs3V8LsJzeq1SRFAaKm9kLuD3lOeFXNwC9JKawNTGwpD3
 ZbESwJNhk0Fk5iL0o8hnj6Q=
X-Google-Smtp-Source: APiQypKuGcETuyIq4RG/HZlsaI7LvJV6ngILV0Zr6Un5OwN9MLfxRx6PweQUn2wRwKHWETGX/t9f7w==
X-Received: by 2002:a17:90a:4ce5:: with SMTP id
 k92mr687845pjh.192.1587537108752; 
 Tue, 21 Apr 2020 23:31:48 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id y184sm4443556pfg.127.2020.04.21.23.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 23:31:48 -0700 (PDT)
Date: Wed, 22 Apr 2020 16:29:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <20200420013412.GZ11469@brightrain.aerifal.cx>
 <1587348538.l1ioqml73m.astroid@bobo.none>
 <20200420040926.GA11469@brightrain.aerifal.cx>
 <1587356128.aslvdnmtbw.astroid@bobo.none>
 <20200420172715.GC11469@brightrain.aerifal.cx>
 <1587531042.1qvc287tsc.astroid@bobo.none>
In-Reply-To: <1587531042.1qvc287tsc.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1587536847.k87ypbo53k.astroid@bobo.none>
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 22, 2020 4:18 pm:
> If we go further and try to preserve r3 as well by putting the return=20
> value in r9 or r0, we go backwards about 300 bytes. It's good for the=20
> lock loops and complex functions, but hurts a lot of simpler functions=20
> that have to add 'mr r3,r9' etc. =20
>=20
> Most of the time there are saved non-volatile GPRs around anyway though,=20
> so not sure which way to go on this. Text size savings can't be ignored
> and it's pretty easy for the kernel to do (we already save r3-r8 and
> zero them on exit, so we could load them instead from cache line that's
> should be hot).
>=20
> So I may be inclined to go this way, even if we won't see benefit now.

By, "this way" I don't mean r9 or r0 return value (which is larger code),
but r3 return value with r0,r4-r8 preserved.

Thanks,
Nick
