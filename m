Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960E3715C4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 15:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYjz92H3Gz301N
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 23:11:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lqGGCtzE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lqGGCtzE; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYjyh71Nkz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 23:10:51 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id b131so7422152ybg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q6aPtToSrVgBi/90t1ZUB9kHaOhzD5C9bj4BQEcePPk=;
 b=lqGGCtzE5m8F9orYtPate6N4BTFbRDldnXzGj2tE87HBcn1BRn7f5XfxsJmYODrxik
 e8EkfaDCxloU/Q9iBapQyXgVjXP0S4DEJ0fXLrl9h3WPztOm88MubRYvbs9d3jfqGqx+
 iy9k59bjEyTqA/JJgPQ3YBDSOg4s+trVOYoxK6J7Lt5Gi2GwquvTtB02IITfC21XkxNA
 lGyAB0OIcRbwh0FVuTlthtGxfWSXpeBK0cMQGMm7c6fDD1CV4+4N2Ay8M/08fvry9jyw
 TF22FDOSLWt3qkPw5KtV5L2sv6tZ8jOFNTAw83cA9C4ThWwXkIpT0aLKrSpPx/QUefiX
 Kbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q6aPtToSrVgBi/90t1ZUB9kHaOhzD5C9bj4BQEcePPk=;
 b=KZFhdgS2Tmk2s1aJrOFzxWJs25iQJ4nZw3Fa9N/6lSd1T670QjbB7G/hPiS/if23zz
 4A0hfANNbtz/ai3q9Ne0ScCpvu0tuOyxzoqrKhBQnF1maKzrIXJZdZB6ZMaEaCq8uBwF
 YuiIMtLDxzhlzRALfaUnnZHqsb1xnwhJ7OrfTSbK1SKcrzCowYbr6klmNiLItZ8uLThJ
 V/9MtOzr4jnITVk3h/rL6oc3QJ4NW1a0Sz4TWKCkrkvnMSs8UFzEeAFhMxNz1IyT3vz6
 lHSgqAVhf8jrNPCsTu7uSZJHVl5K4oNeulrtwWO1Fla/Ye8Ys44llYBDuZsgEGA/SO56
 9iaw==
X-Gm-Message-State: AOAM532EIrliubKF9iFoldKfNoLXV0nTYaAGZS0qDvhn2+Y/cy3ajt/5
 9+zowGn8w7j6CDnJTYzDR0Fju/QOicdEFAW1hFw=
X-Google-Smtp-Source: ABdhPJxvygbDWGxmRr6V8Vm4D83Fq4MRol9PEQb74s8BS9df3UUbSP8yls4vcRx2kU2tZhdFxHQp30hnnaM7RamlTpQ=
X-Received: by 2002:a25:7909:: with SMTP id u9mr25466002ybc.22.1620047448169; 
 Mon, 03 May 2021 06:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
 <fc0c7c092f274ab8b760b3c897830347@AcuMS.aculab.com>
In-Reply-To: <fc0c7c092f274ab8b760b3c897830347@AcuMS.aculab.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 May 2021 15:10:37 +0200
Message-ID: <CANiq72nyvrb6ZrVVeaT9py7D_Sv9q-a1HGYH-hNpqfmcCmb4dg@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: David Laight <David.Laight@aculab.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Joe Perches <joe@perches.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 3, 2021 at 2:20 PM David Laight <David.Laight@aculab.com> wrote:
>
> It would be nice to be able to build current kernels (for local
> use) on the 'new' system - but gcc is already too old.

I have seen such environments too... However, for the kernel in
particular, you could install a newer GCC in the 'new' machine (just
for the kernel builds) or do your kernel builds in a different machine
-- a 'new' 'new' one :)

Cheers,
Miguel
