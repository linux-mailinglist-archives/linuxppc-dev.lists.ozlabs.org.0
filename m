Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8653BD820
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 16:06:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK48y5W81z3bXj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 00:06:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=A15ChI17;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A15ChI17; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK48C5Xggz3bWm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 00:05:30 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id h2so6289117qtq.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jul 2021 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=gArRMkGSvj6krjFU3jG+9A2cGwl/JVcWkskQOwn7uhg=;
 b=A15ChI17fe9F8wW7YWEMEXpPV81+PjF9w433Pjzw8dHMWWjpIk/FyLbZA43r8MOTUn
 iHouCFsTLPpRAjTBE1rcCyIuDuRjRmnklu+1dDhMv9/nPrCqFj5y/l6bbFFOHpvB9gnj
 /ly8L0k3lizszNcJ79HCFOwTDmsHLkLoirCrabAQRw4qS8jENQ9g8NcF6TYkznonypXm
 8X4UXi3CAdSvIEurl5beFJguV6H8CQuL3WAAQWzciKxlHIFxod8CgAoB193lEnLxNXZu
 iY3PI4LNFfYl8F0xkVP+TNZsVB+o37lxsg/tzAsEUk2hlyWbjRhG0Ie9csaGwy+l/tSM
 Ve9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gArRMkGSvj6krjFU3jG+9A2cGwl/JVcWkskQOwn7uhg=;
 b=BoKweSh+gajoKfIN6e0iQzbVURG5abFW5BVWA2VrxJnpzZcatxIPaDJG/w/YDP48C0
 EjbpKYcE4H6PK7WLLa0eW+by09NNXqZG9c0A3prgxUZZU2ovUJA2/DuHD4t9ljgWYuWt
 n/759hLoL3F8HjEZICHz5DN6ZS808nn9Xr6NdZ6VfCwmaUBV1FlHT3X2Z0wZt/RvBboE
 NatAjCVwjEfCVHd5l7iDaB3e0opvFl/Pdop/+wWtcAKO5AgrDHFh5NAGGcCNzflWKP5G
 GuVrQuTggwCjTCUVY3iL8LexkGncJtJBHs6HYXVpWZjDgns1Za2z4TGkiojtvXyKAECd
 6jMw==
X-Gm-Message-State: AOAM533TerQQ9v4F3w89cqgPfqLvKu66VMG/6kvLyoZEXcWtP7mFCqwB
 sShxuBas3PqlRj9cl9QSrCw=
X-Google-Smtp-Source: ABdhPJz0Ho5EGwUzxv6nDikRwOSSbgdKU9ecZbd2fpXrMDdcaZO3xACNbH8CFFuQsHdy5eMftMt/lg==
X-Received: by 2002:ac8:5f0d:: with SMTP id x13mr17654563qta.69.1625580327323; 
 Tue, 06 Jul 2021 07:05:27 -0700 (PDT)
Received: from bat.mindbit.ro (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca.
 [72.137.118.157])
 by smtp.gmail.com with ESMTPSA id b188sm6922004qkf.133.2021.07.06.07.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:05:27 -0700 (PDT)
Message-ID: <c5f245d84ba7b64263af47743aac1e1ab67c0ca4.camel@gmail.com>
Subject: Re: Hitting BUG_ON in do_notify_resume() with gdb and SIGTRAP
From: Radu Rendec <radu.rendec@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 06 Jul 2021 10:05:25 -0400
In-Reply-To: <376d1887-1deb-1c04-a2c7-3680daef7505@csgroup.eu>
References: <6b5327e32549860c1e6c73e5b669528bfb383df2.camel@gmail.com>
 <d02fca74-933b-4586-496b-65511e435628@csgroup.eu>
 <786399a77d82890a391172fee269272e12c52489.camel@gmail.com>
 <200445ae-c3fc-ccc8-f77d-aebce2b09046@csgroup.eu>
 <159a8bf58c9f8838bf38e495a3a376aaae14eaa6.camel@gmail.com>
 <376d1887-1deb-1c04-a2c7-3680daef7505@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-07-06 at 15:53 +0200, Christophe Leroy wrote:
>Le 06/07/2021 à 15:50, Radu Rendec a écrit :
>> On Tue, 2021-07-06 at 15:16 +0200, Christophe Leroy wrote:
>>> Le 06/07/2021 à 13:56, Radu Rendec a écrit :
>>>> On Tue, 2021-07-06 at 12:43 +0200, Christophe Leroy wrote:
>>>>> Le 04/07/2021 à 23:38, Radu Rendec a écrit :
>>>>>> I'm trying to set up my (virtual) environment to test an old bug in the
>>>>>> PPC32 ptrace() code. I came across a completely different problem,
>>>>>> which seems to make gdb pretty much unusable on PPC32. I'm not sure if
>>>>>> this is a real kernel bug or maybe something wrong with my
>>>>>> configuration.
>>>>>>
>>>>>> I'm running kernel 5.13 in a qemu VM with one e500mc CPU. I am running
>>>>>> native gdb (inside the VM) and setting a breakpoint in main() in a test
>>>>>> "hello world" program. Upon running the test program, I am hitting the
>>>>>> BUG_ON in do_notify_resume() on line 292. The kernel bug log snippet is
>>>>>> included below at the end of the email.
>>>>>>
>>>>>> FWIW, gdb says:
>>>>>> Program terminated with signal SIGTRAP, Trace/breakpoint trap.
>>>>>> The program no longer exists.
>>>>>>
>>>>>> I also added a pr_info() to do_notify_resume() just to see how much
>>>>>> different 'regs' and 'current->thread.regs' are. Surprisingly, they are
>>>>>> just 0x30 apart: regs=c7955f10 cur=c7955f40. Also, 'current' seems to
>>>>>> be OK (pid and comm are consistent with the test program).
>>>>>
>>>>> The TRAP = 0x7d8 is obviously wrong.
>>>>>
>>>>> Need to know which 'TRAP' it is exactly.
>>>>> Could you try to dump what we have at the correct regs ?
>>>>> Something like 'show_regs(current->thread.regs)' should do it.
>>>>
>>>> Sure, please see the output below. It looks to me like the "correct"
>>>> regs are just garbage. Either they are overwritten or current->thread.regs
>>>> is wrong. But in any case, r1 = 0 doesn't look good.
>>>
>>> Yes indeed. I think I identified the problem. For Critical interrupts like DEBUG interrupt, struct
>>> exception_regs is added, therefore the frame has 12x4 (0x30) more bytes. That's what you see.
>>>
>>> Commit
>>> https://github.com/linuxppc/linux/commit/db297c3b07af7856fb7c666fbc9792d8e37556be#diff-dd6b952a3980da19df4facccdb4f3dddeb8cef56ee384c7f03d02b23b0c6cb26
>>>
>>> Need to find the best solution now to fix that.
>> 
>> Awesome, happy to see you figured it out so quickly.
>> 
>> I'm not sure if it makes any sense, but one thing that comes to mind is
>> to put struct exception_regs before struct pt_regs when the frame is
>> saved. Unless of course other parts of the code expect the opposite.
>
>Yes I think it is a good idea. I think I won't have time to look at that before summer vacation though.

I can take a stab at it. I'm not familiar with that part of the code,
but the best way to learn is to get your hands dirty :) In the worst
case, I won't fix it.


