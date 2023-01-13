Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1E668B95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 06:37:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtVYP3psLz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 16:37:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QqJsZWNJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QqJsZWNJ;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtVXN6S1Gz3cD9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 16:36:34 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id p24so22384186plw.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 21:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6+pSwox7nvOrX3DcFjVuwZuoLpU/mTInToIx9lpnOk=;
        b=QqJsZWNJ2uhmkCsES7RSyK/45OPE6gk0Ti9FTuENRviNFRQOxZ3CGCAiq6Z2fpIrE7
         DZh65cqk9G1w/Ah7bP+K0q56LCJVZCBzXEk19rws00zlG9C/sMVsmnATblfeMg9OiBz8
         PVf/ubSpG1MWXytZwcpTWDPWRfcDzRemhHuaheMQROx+JJC/7je4SpHIuvEEksnQOt+5
         yGWSLNLC6DVzvw+jkoU1QL7K+1OKrDyt0UeHuv7k46Nr81wzogaxWKJZssNpjtHX6YS2
         G34XyM2uQBuaE+BR/6KJB70UBMqSoqHaGCGaAUoMBZyi6J/CLTtkdvunkmb/XVBJJPki
         7GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6+pSwox7nvOrX3DcFjVuwZuoLpU/mTInToIx9lpnOk=;
        b=4InT5ss7sb0aqruiLr4sdueaMu4qJ1Kvyj8x0siNbe87xftqbEnKK0WYMi1ud+hpux
         61t3MzwPio4aIov54xVQo4ZlRRPgsCfJDAgSF1BAhKp6LU27+XT18rzk0EkMo0FvNqSb
         dvk3erKYj1Wd3W5kbEJ9tfu8VXlFfGXfPZR40EfuqlRkoiXePjrGuT81FMaVDxFKDg+K
         weJAox9rF5SoGZcozbkmrWvYLxbKukPx+PSJShfn+QsCMVcyeNiUT4kdS9CtS9/A5FAQ
         RVlFDL/gWOrYaw5aMOIw2TFMgb3BiVRSbsMEbMi0eI7n5blU9EShvwECsojZRHhR+uB3
         u85Q==
X-Gm-Message-State: AFqh2krcXf2G2sfQWhD9Mvst2OtVOynrlokgEmKOqxC9UtPrxeTjcmrj
	6G1P68OG+lies5H22l5X/e0=
X-Google-Smtp-Source: AMrXdXsAusqKnG3jBsLdJrhaGyX+g1MJ5aJKfF+C/Ql9K9ixqRt11Dq+YZPlY+Crg24/8/AWo1EUOg==
X-Received: by 2002:a17:902:8d95:b0:192:8d17:78e0 with SMTP id v21-20020a1709028d9500b001928d1778e0mr56046828plo.42.1673588191816;
        Thu, 12 Jan 2023 21:36:31 -0800 (PST)
Received: from localhost (193-116-88-198.tpgi.com.au. [193.116.88.198])
        by smtp.gmail.com with ESMTPSA id f17-20020a170902f39100b00194706d3f25sm360376ple.144.2023.01.12.21.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 21:36:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jan 2023 15:36:10 +1000
Message-Id: <CPQTHRRWI40R.5SDS94D8EFFA@bobo>
Subject: Re: lockref scalability on x86-64 vs cpu_relax
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
X-Mailer: aerc 0.13.0
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com> <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com> <CPQQLU1ISBIJ.2SHU1BOMNO7TY@bobo> <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com>
In-Reply-To: <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tony.luck@intel.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jan 13, 2023 at 2:15 PM AEST, Linus Torvalds wrote:
> On Thu, Jan 12, 2023 at 9:20 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
> >
> > Actually what we'd really want is an arch specific implementation of
> > lockref.
>
> The problem is mainly that then you need to generate the asm versions
> of all those different CMPXCHG_LOOP()  variants.
>
> They are all fairly simple, though, and it woudln't be hard to make
> the current lib/lockref.c just be the generic fallback if you don't
> have an arch-specific one.

Yeah, it doesn't look too onerous so it's probably worth seeing what
the code and some numbers look like here.

> And even if you do have the arch-specific LL/SC version, you'd still
> want the generic fallback for the case where a spinlock isn't a single
> word any more (which happens when the spinlock debugging options are
> on).

You're right, good point.

Thanks,
Nick
