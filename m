Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CFB89E8DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 06:29:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ddaHtn2d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDqbm2vFyz3vZ9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 14:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ddaHtn2d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDqb14y85z2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 14:28:44 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e4f341330fso1853455ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Apr 2024 21:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712723320; x=1713328120; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2u+70epJjW00+Aasor34vmJ+f/znX0w0jA47UJBKtDg=;
        b=ddaHtn2dVo7MfOljVnwyBnwxgDs/Y73yEm7aTSPMC1Sn04o59yQv54dtb7cHE91Nol
         9FwDiV3m9ElXnlOPlnQug8oR0WpRmVMY69i+IiOJpxnpsjN41ycca3kjPKc+ZLLX+wdK
         XK32sCmOHhxhVqAoQBQxW5ScqdyzNECDjWBG1p1H3tZOZ8UeXmXlv0uGQLFX26+JXiSu
         YIH64n4BiVk2RSIDmHgZBVQ7rTcfoKrztT1KKKeA/w/VJW2vD3ZA5H1bSyQrRZ5iLjrP
         HLiHfqxIXnXUEkCsKkxhVnqWGlMZ1tiP/QkAF5/75e7+X/Dn19fB4z7xYEiExAiyYN6v
         wzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712723320; x=1713328120;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2u+70epJjW00+Aasor34vmJ+f/znX0w0jA47UJBKtDg=;
        b=Sc8xQG0DY0YpaaHgXpR5GDoJjVQloArODwbrHO7xof0zT5lWG9HG+gdRVXS1CjtX7y
         YKcGXaKyFi1NY+zt1wt+KVbdGXMK2UZtUXaooJlVXpuqBHu7XB9ysJaP4EBi8LDb7Lcu
         8IHlgdudswsvE72fmSvR1gcUria9lgwhpjbNTbg3eXP92Xl2A1IOPBhE4teca2scbEuN
         Qo9NMZ2CMw6VwIQ2SOupD4gD+Lf4BD+sUP5d+A2TQxlf7K76SSu0eMyBQsLogicyADYf
         jG0a5iCZdjyajpipRUxGChUYf5MzLkmrnsEULLcsXdXZiCN9UJDuBwVZ7jUIKMjcK07K
         jwQg==
X-Forwarded-Encrypted: i=1; AJvYcCW06LvxNd/KkeLFEVChqxbg7ENHAObtr2kkuvikVHvk4Ik4b3EpEE6OFzc3/b8nXfzHeaigALPybNpC1R7KXJc2XkRecnCTyy7g869cbQ==
X-Gm-Message-State: AOJu0YzB7Xm0dFRnlENMYZrKPFnmhasymJK3OWKA5iBhoA0siPjCUImL
	8AWYJOam8jojZ6Bb63QicE5cALYjc5RW4JidF6cf3Zb9RiZMqtKs
X-Google-Smtp-Source: AGHT+IEe7rAnY9uQDbz0Y7OlDS91jLim4bdEpY9FTdShRZXCnoeQFpggWylXUmXRifVvfewT7s5iJQ==
X-Received: by 2002:a17:903:228a:b0:1e4:c75e:aace with SMTP id b10-20020a170903228a00b001e4c75eaacemr1883931plh.29.1712723319585;
        Tue, 09 Apr 2024 21:28:39 -0700 (PDT)
Received: from localhost ([1.146.50.27])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902ea0100b001e042dc5202sm9721472plg.80.2024.04.09.21.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 21:28:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Apr 2024 14:28:07 +1000
Message-Id: <D0G5QG4M991A.1QAWDKSYM6A89@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV nestedv2: Cancel pending HDEC
 exception
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Thorsten Leemhuis"
 <regressions@leemhuis.info>, "Vaibhav Jain" <vaibhav@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
 <kvm-ppc@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240313072625.76804-1-vaibhav@linux.ibm.com>
 <CZYME80BW9P7.3SC4GLHWCDQ9K@wheely>
 <a4f022e8-1f84-4bbb-b00d-00f1eba1f877@leemhuis.info>
 <87sf007ax6.fsf@mail.lhotse>
 <cb038940-63fd-4348-bed2-13e1b2844b92@leemhuis.info>
 <87y19obfck.fsf@mail.lhotse>
In-Reply-To: <87y19obfck.fsf@mail.lhotse>
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
Cc: mikey@neuling.org, Linux kernel regressions list <regressions@lists.linux.dev>, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Apr 8, 2024 at 3:20 PM AEST, Michael Ellerman wrote:
> Thorsten Leemhuis <regressions@leemhuis.info> writes:
> > On 05.04.24 05:20, Michael Ellerman wrote:
> >> "Linux regression tracking (Thorsten Leemhuis)"
> >> <regressions@leemhuis.info> writes:
> >>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> >>> for once, to make this easily accessible to everyone.
> >>>
> >>> Was this regression ever resolved? Doesn't look like it, but maybe I
> >>> just missed something.
> >>=20
> >> I'm not sure how it ended up on the regression list.
> >
> > That is easy to explain: I let lei search for mails containing words
> > like regress, bisect, and revert to become aware of regressions that
> > might need tracking. And...
> >
> >> IMHO it's not really a regression.
> >
> > ...sometimes I misjudge or misinterpret something and add it to the
> > regression tracking. Looks like that happened here.
> >
> > Sorry for that and the noise it caused!
>
> No worries.

It is actually a regression. It only really affects performance,
but the logic is broken (my fault). We were going to revert it, and
solve the initial regression a better way.

Thanks,
Nick
