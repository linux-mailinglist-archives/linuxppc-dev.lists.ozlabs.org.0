Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233724F9759
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 15:53:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZfq86r9bz3bY3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 23:53:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SPBcHZTj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SPBcHZTj; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZfpV5zFXz2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 23:53:05 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id p135so4744794iod.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5e9dlqqGa3XJS0I5rHwbdGy3FbPKnOAA+VlJTkacARQ=;
 b=SPBcHZTjSqSCpo5GYly+wtmy+XoJdfchQrLSBDc8XYbL+gUDKfgrxN2I8z6IMp4GkD
 y7nxQcl/1AXr+6DIkf+TY+h7guouYc6qZiemUprSYfeQfBDhtytCgJAZfrO4bt1qfz9S
 2IILQqJli4hYcy0LJ+mP4W5qMfY7sk8W4ZfPRfTGSjFtPxMk12gYmqvhv/i/GaCcldGl
 OSpAt9V9ndydv2ZaoRMEVlAVNvYfFY/P/3fBjJ4Wb54kLuANHBy90dzQA2atRYAy+6IS
 6Et0UdQojaMfzJyAGIJ7ZW8UZTRJdKEiFVoBtB+JRux+2VuG1FRe0VWIQwCRQU6ReOgU
 5tQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5e9dlqqGa3XJS0I5rHwbdGy3FbPKnOAA+VlJTkacARQ=;
 b=C2S/zd72yCcULpX8YNT0xKvhXxcDTlP5Df8xrc8cvVNQC+McwUPeMenGW4cqnKzH03
 nLNGvyHcsYOHzSYm9z6MKEiJtsd6S+65i0rYldF7WUGhBE5zXC4zbtaPnKiT497AnqT7
 SiI7uT/wmrAHkoHK5V22iEM6YEW9At5oWNvyqZbNlZLY64lLpoUVrKDqU1O5iPhsmETX
 KHq7WQv8ZxG+RfHweTC97ENeOfzLTtRhlOmntEM+wbpw2Fc+u/1M2AHq3swVRxXEHvt9
 1yyMR49jxxgEW0/8R10fyfKampqxr4dL73kO0r26/db/BJNO8QFOuLWRenjdTMolYYfY
 cu0Q==
X-Gm-Message-State: AOAM531mlkDarKs0+aSfCUKI3Il7H9oeAhkKjZHvi2EBZIeWXnYS2w0n
 VjUja+NvUFsXDP8vsYEFB1tUxBQ2QESpfWJA1kk=
X-Google-Smtp-Source: ABdhPJwRDgOcxjcoMrIlfHAH1sjXyZsj5D5yz2RRUJm8HP9pAHyYbj6LekeZ7xrD6AvrV8bAaBvo9yeF0RxhHATdGCs=
X-Received: by 2002:a05:6638:2490:b0:323:b728:429f with SMTP id
 x16-20020a056638249000b00323b728429fmr9594498jat.308.1649425981987; Fri, 08
 Apr 2022 06:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmls6nt7.fsf@mpe.ellerman.id.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 Apr 2022 15:52:50 +0200
Message-ID: <CANiq72mWFrN8TP6Rj0cyON0MCR3AFW1b4qhjFrNQZ8rZw9B1RA@mail.gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: rcu <rcu@vger.kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 8, 2022 at 9:23 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> I haven't seen it in my testing. But using Miguel's config I can
> reproduce it seemingly on every boot.

Hmm... I noticed this for some kernel builds: in some builds/commits,
it triggered the very first time, while in others I had to re-try
quite a few times. It could be a "fluke", but since it happened to you
too (and Zhouyi seemed to need 12 tries), it may be that particular
kernel builds makes the bug much more likely.

> For me it bisects to:
>
>   35de589cb879 ("powerpc/time: improve decrementer clockevent processing")
>
> Which seems plausible.
>
> Reverting that on mainline makes the bug go away.

That is great, thanks for that -- I can revert that one in our CI meanwhile.

> I'll try and work out what it is about Miguel's config that exposes
> this vs our defconfig, that might give us a clue.

Yeah, it is one based on the "debug" one you sent for Rust PPC.
Assuming you based that one on the others we had for other archs, then
I guess we are bound to find some things like this at times like with
randconfig, since I made them to be fairly minimal and "custom"... :)

Cheers,
Miguel
