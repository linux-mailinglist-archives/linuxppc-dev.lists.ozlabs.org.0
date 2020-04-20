Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D331B00C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 06:35:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495DQT6JCGzDqT6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 14:35:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G5bHaG36; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495DN64gPlzDqD4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 14:33:26 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id ay1so3496132plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 21:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=/SU6oEkGmAQk0odZCe5iksWkWXpw1rmuYB3XbYdsaiI=;
 b=G5bHaG36ijsBNBKpG/3HaCrTY+ZacEzo7C3n7s0AK+Er4XbP6cMmThvL2l542sG2U/
 CBY1Nlg6B2kHTN3IHyYnfikKxgxj4O+8JwmUCdZZMwVS4vAGpm+B1+kiVMPSGacuC69H
 uC/OW0sMhlntGu4oicKjPHnwXiNxMRu7BTczRiT4KcoyKI8bPpyvm6VEumuDCYCD2IP8
 YboDZcP4XTFf5jDY0mus/xCH/ekhM7puT0gS32l6UhbaMlH/Sjsu4gj5J76dAZa3SixV
 CCOVZV+9GjqbEOsnU/QKwJyjfJSjZ/9Zs7Q1pMopgZ5DDARQLbn3Sqa6ThUP+h4Pj4CS
 kaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=/SU6oEkGmAQk0odZCe5iksWkWXpw1rmuYB3XbYdsaiI=;
 b=uHEatImIw59JBJdT21dO9P4sbYM7gjM9liXmUnyOXrdT4phUqA3jOF/DctOgLfpLM0
 V039cVZhGaNxcEOxLDBJicmL5DHNWB2Zd/KI2b3GVQH3MIpo8hJOvG8tsriFuWpqfRAd
 S+E0Uw5xFlbVxAGd+hU3S5voBFH99FHXZ33zvfbmumC9crj4I8f5paE/aq0iyGU61U+J
 FrhSGeSgHfULN50X/v3O46sIuJq8t7uM1f7SfHr8IzRA0b/ifEkcS2ya3RRSzDTkhnGj
 ndvVksxHbZ6N8zUcaDP4ESm0SVkGTLfZUnqAotdeoQFg4qizBXPPp4qeyz0vTOSqadMJ
 N44Q==
X-Gm-Message-State: AGi0PuZAZ2wNR4WW1IACn/fHVpefbDl8gbypOc2flK/nDfELpSJbrgUB
 DRn1VtsCFx6JvFdzAVFib9w=
X-Google-Smtp-Source: APiQypIXHLzTzY/Qh3MIsu+pH5hF6id8O/cnX7Wfi4Xm/YIeT8paufHl8HNKcBlATNKaxDVJqO65uQ==
X-Received: by 2002:a17:90a:a591:: with SMTP id
 b17mr19624411pjq.90.1587357202797; 
 Sun, 19 Apr 2020 21:33:22 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id s10sm12459863pjp.13.2020.04.19.21.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 21:33:22 -0700 (PDT)
Date: Mon, 20 Apr 2020 14:31:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <20200420013412.GZ11469@brightrain.aerifal.cx>
 <1587348538.l1ioqml73m.astroid@bobo.none>
 <20200420040926.GA11469@brightrain.aerifal.cx>
In-Reply-To: <20200420040926.GA11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587356128.aslvdnmtbw.astroid@bobo.none>
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

Excerpts from Rich Felker's message of April 20, 2020 2:09 pm:
> On Mon, Apr 20, 2020 at 12:32:21PM +1000, Nicholas Piggin wrote:
>> Excerpts from Rich Felker's message of April 20, 2020 11:34 am:
>> > On Mon, Apr 20, 2020 at 11:10:25AM +1000, Nicholas Piggin wrote:
>> >> Excerpts from Rich Felker's message of April 17, 2020 4:31 am:
>> >> > Note that because lr is clobbered we need at least once normally
>> >> > call-clobbered register that's not syscall clobbered to save lr in.
>> >> > Otherwise stack frame setup is required to spill it.
>> >>=20
>> >> The kernel would like to use r9-r12 for itself. We could do with fewe=
r=20
>> >> registers, but we have some delay establishing the stack (depends on =
a
>> >> load which depends on a mfspr), and entry code tends to be quite stor=
e
>> >> heavy whereas on the caller side you have r1 set up (modulo stack=20
>> >> updates), and the system call is a long delay during which time the=20
>> >> store queue has significant time to drain.
>> >>=20
>> >> My feeling is it would be better for kernel to have these scratch=20
>> >> registers.
>> >=20
>> > If your new kernel syscall mechanism requires the caller to make a
>> > whole stack frame it otherwise doesn't need and spill registers to it,
>> > it becomes a lot less attractive. Some of those 90 cycles saved are
>> > immediately lost on the userspace side, plus you either waste icache
>> > at the call point or require the syscall to go through a
>> > userspace-side helper function that performs the spill and restore.
>>=20
>> You would be surprised how few cycles that takes on a high end CPU. Some=
=20
>> might be a couple of %. I am one for counting cycles mind you, I'm not=20
>> being flippant about it. If we can come up with something faster I'd be=20
>> up for it.
>=20
> If the cycle count is trivial then just do it on the kernel side.

The cycle count for user is, because you have r1 ready. Kernel does not=20
have its stack ready, it has to mfspr rX ; ld rY,N(rX); to get stack to=20
save into.

Which is also wasted work for a userspace.

Now that I think about it, no stack frame is even required! lr is saved=20
into the caller's stack when its clobbered with an asm, just as when=20
it's used for a function call.

>> > The right way to do this is to have the kernel preserve enough
>> > registers that userspace can avoid having any spills. It doesn't have
>> > to preserve everything, probably just enough to save lr. (BTW are
>>=20
>> Again, the problem is the kernel doesn't have its dependencies=20
>> immediately ready to spill, and spilling (may be) more costly=20
>> immediately after the call because we're doing a lot of stores.
>>=20
>> I could try measure this. Unfortunately our pipeline simulator tool=20
>> doesn't model system calls properly so it's hard to see what's happening=
=20
>> across the user/kernel horizon, I might check if that can be improved
>> or I can hack it by putting some isync in there or something.
>=20
> I think it's unlikely to make any real difference to the total number
> of cycles spent which side it happens on, but putting it on the kernel
> side makes it easier to avoid wasting size/icache at each syscall
> site.
>=20
>> > syscall arg registers still preserved? If not, this is a major cost on
>> > the userspace side, since any call point that has to loop-and-retry
>> > (e.g. futex) now needs to make its own place to store the original
>> > values.)
>>=20
>> Powerpc system calls never did. We could have scv preserve them, but=20
>> you'd still need to restore r3. We could make an ABI which does not
>> clobber r3 but puts the return value in r9, say. I'd like to see what
>> the user side code looks like to take advantage of such a thing though.
>=20
> Oh wow, I hadn't realized that, but indeed the code we have now is
> allowing for the kernel to clobber them all. So at least this isn't
> getting any worse I guess. I think it was a very poor choice of
> behavior though and a disadvantage vs what other archs do (some of
> them preserve all registers; others preserve only normally call-saved
> ones plus the syscall arg ones and possibly a few other specials).

Well, we could change it. Does the generated code improve significantly
we take those clobbers away?

Thanks,
Nick
