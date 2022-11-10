Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695266241C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:49:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Krh1fSQz3dv5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:49:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RLd0Wtk4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RLd0Wtk4;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Kqm3PMsz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:49:07 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id b185so1792097pfb.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jl813NfUgtSTP2ltbXT+xoUR9JW8/uHFW9e6l6vsFrk=;
        b=RLd0Wtk4DoaDEOkXAEH+Yl5bMDv17vNqqCilaXAtthr2HQH7MRUKgKo9lCc9Bk0EfN
         fbcBwtiVAiHUC0D4UX84PLt7olg/QxvqNrtd/DQMuETBl6PO/9A7dWPrWCCOoc2G5Mrj
         xG+T4QBFd0/0s0ldV8ooYTWZjT37MgJ34YJWBdPfAc6YL8aa1PVSsqmkBYuRNOJSbKm8
         wOQ1SmXgnm2CPHjHrCBHel3XNeXoXBX9DZAeK3YQwk5He+esJwokcztUNfd4JXEPN/Lw
         kVHju4YEVrFcHXo/0Yl24fm6Yg9r9UMy1R+vfd0tFrkukN8IYxIO6y4ukCOKAtgtkiF1
         235Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jl813NfUgtSTP2ltbXT+xoUR9JW8/uHFW9e6l6vsFrk=;
        b=smugksE7iDRT3V6rtJU3LDj2x2qd/WDrDv9B16unlT5P8ZMO/5l0Kh2dx0kx5d2QRY
         NqqGG23qoVGtRrLPCpOBm8vEGKLM6VLv4FBK+D3FN55P0/MBr5L6++DxZawbrJPgUyvP
         lTr25EMfWKqfcHajlPFibuYXLXL3sXYizK1udE7RLObwTpbWYnzuKF4tZ1YXY6Tyn7GO
         zXRi92MYIOu3dhcqCfcPF+V0EP9LVaarlIxKB+L1wzDJMaDufNenMogr9wWJfdBsVGWc
         H935hZmQfUUvJ5QvxEisx37XRS9uBkn1AMeeu6puZJybwEz6MQPmzsdHqA/34Jznru0w
         neFg==
X-Gm-Message-State: ACrzQf1r5wnc0CmcbClASwBCthEXEXw6Okv7ENWO33uVjor7rtY2uesM
	wB5y+D0bTZAygzxWKHKC3SQ=
X-Google-Smtp-Source: AMsMyM6Cr5KstartOLFt/wZRAIItscB5AhdCNsj5Fr8dbC5uLhgt8UvweilSm1zqBsQaJDCTgtOqFw==
X-Received: by 2002:a62:f243:0:b0:562:3acc:7a63 with SMTP id y3-20020a62f243000000b005623acc7a63mr2435508pfl.51.1668080944877;
        Thu, 10 Nov 2022 03:49:04 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id x10-20020a17090a46ca00b002131a9f8dcbsm2874043pjg.46.2022.11.10.03.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:49:03 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:48:54 +1000
Message-Id: <CO8LCA89WZYL.3APIMVZTFJ2QT@bobo>
Subject: Re: [PATCH 04/17] powerpc/qspinlock: convert atomic operations to
 assembly
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Jordan Niethe"
 <jniethe5@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-6-npiggin@gmail.com>
 <9ccfa76e921ea0b79a7ff166604004370e7aa30b.camel@gmail.com>
 <9226e7ca-c74b-845b-d10b-9928449a9489@csgroup.eu>
In-Reply-To: <9226e7ca-c74b-845b-d10b-9928449a9489@csgroup.eu>
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

On Thu Nov 10, 2022 at 6:36 PM AEST, Christophe Leroy wrote:
>
>
> Le 10/11/2022 =C3=A0 01:39, Jordan Niethe a =C3=A9crit=C2=A0:
> >> +static __always_inline int trylock_clear_tail_cpu(struct qspinlock *l=
ock, u32 old)
> >>   {
> >> -	int newval =3D _Q_LOCKED_VAL;
> >> -
> >> -	if (atomic_cmpxchg_acquire(&lock->val, val, newval) =3D=3D val)
> >> +	u32 new =3D _Q_LOCKED_VAL;
> >> +	u32 prev;
> >> +
> >> +	BUG_ON(old & _Q_LOCKED_VAL);
> >=20
> > The BUG_ON() could have been introduced in an earlier patch I think.
>
> Can we avoid the BUG_ON() at all and replace by a WARN_ON ?

Lock has gone wrong here. Critical sections not working means data
corruption and little prospect of continuing to run.

Thanks,
Nick
