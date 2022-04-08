Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B12294F8F78
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 09:24:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZV9m4Nykz3bZY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 17:24:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PLzuzBZE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZV973JG6z2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 17:23:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PLzuzBZE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KZV946Vnzz4xR9;
 Fri,  8 Apr 2022 17:23:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649402616;
 bh=4jwQvxQO66d9TdKQhOTVEri6SbF6WMVq/LItYU9thDg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PLzuzBZEeg5vcEy5EsnIO/0xUz/9F7L9UTzXCXwGbh4FRY1v+zLw4A41TSDn+wGWC
 T84hGsQJvW+nRy8GYcvjTR3FphXVLQWEFB9MT1vf6tcOkpTMIqjQfWKb4a+NszrfP7
 lLfCeRWrFWnwRp6MqLpsHkYOu6oKNfQFJ0b1YDbSLAsQmDzBuqq0xQUs5o/NQ7qMPc
 ZJcsg3HtdcecTvb9ecgrFCoQ0/1RYMrZDZlJoqQa2Th02LBIgCXFT0EiEzJeRFdfgZ
 sdECTjK2qfLe7ZzELGZT0LPZQYt8eMRC6IdSbDSDnHy9h0frla0hwx9CHkxsP+xqQI
 8mIsNgbfWtlJg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: paulmck@kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
In-Reply-To: <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
Date: Fri, 08 Apr 2022 17:23:32 +1000
Message-ID: <87pmls6nt7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: rcu <rcu@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Paul E. McKenney" <paulmck@kernel.org> writes:
> On Wed, Apr 06, 2022 at 05:31:10PM +0800, Zhouyi Zhou wrote:
>> Hi
>> 
>> I can reproduce it in a ppc virtual cloud server provided by Oregon
>> State University.  Following is what I do:
>> 1) curl -l https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-5.18-rc1.tar.gz
>> -o linux-5.18-rc1.tar.gz
>> 2) tar zxf linux-5.18-rc1.tar.gz
>> 3) cp config linux-5.18-rc1/.config
>> 4) cd linux-5.18-rc1
>> 5) make vmlinux -j 8
>> 6) qemu-system-ppc64 -kernel vmlinux -nographic -vga none -no-reboot
>> -smp 2 (QEMU 4.2.1)
>> 7) after 12 rounds, the bug got reproduced:
>> (http://154.223.142.244/logs/20220406/qemu.log.txt)
>
> Just to make sure, are you both seeing the same thing?  Last I knew,
> Zhouyi was chasing an RCU-tasks issue that appears only in kernels
> built with CONFIG_PROVE_RCU=y, which Miguel does not have set.  Or did
> I miss something?
>
> Miguel is instead seeing an RCU CPU stall warning where RCU's grace-period
> kthread slept for three milliseconds, but did not wake up for more than
> 20 seconds.  This kthread would normally have awakened on CPU 1, but
> CPU 1 looks to me to be very unhealthy, as can be seen in your console
> output below (but maybe my idea of what is healthy for powerpc systems
> is outdated).  Please see also the inline annotations.
>
> Thoughts from the PPC guys?

I haven't seen it in my testing. But using Miguel's config I can
reproduce it seemingly on every boot.

For me it bisects to:

  35de589cb879 ("powerpc/time: improve decrementer clockevent processing")

Which seems plausible.

Reverting that on mainline makes the bug go away.

I don't see an obvious bug in the diff, but I could be wrong, or the old
code was papering over an existing bug?

I'll try and work out what it is about Miguel's config that exposes
this vs our defconfig, that might give us a clue.

cheers
