Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A8F306D0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 06:40:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR8T15CKpzDrg5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 16:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G0SveYRO; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR8RJ3pbSzDrfR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 16:39:08 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id u4so3609550pjn.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 21:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=CGOvg9Y+/H5yesvChwrrT6hJ2p1Sf0WMou+qdDOKwEA=;
 b=G0SveYRO4ISRl7pcK9U3IISfXnt2iUD9UPD+Bmjzu7gX016YfaYqxwVxSre/0Wp9jn
 PPMlHDztDCCtgOYbZidvVVc0FIw5G/1/z2tkncWDU1o0eqp0c2QoU8YbasLc1tHOmqDg
 DUHUecGCl7YOmogtc0aevQ+jQ/oGVV7j05Xy7e6aPd47jio+8xqPd8DaONlGT8XdXYBa
 8OZ0tcFCqOi3V1rjE6JEmtvYDYA8Mj0wUfwCxwOvMyS35P8x/RcpDqHteiPPXAHDrhf2
 XL6/umgc9QvUO40B0eacsqwBz6/HdBg1xvj6MmMM8/o4zM5xl0yeKZA/QptYP28RtSFR
 JCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CGOvg9Y+/H5yesvChwrrT6hJ2p1Sf0WMou+qdDOKwEA=;
 b=W35URgKni3c1VQUD8T2f/w5VsDyTd5xHmqYRpkRueai8TkIXBIyGxldgPrLflErASR
 naJal1jclxC5TIM7MTw5J7nP8nYIdT2Jqqakt85O/fLgTBOrd9IJCr2oERXWP9UCg0K+
 4K5FyOZxNR+oWr/V17E8Dhiq3owFHPP6MfrY3nE8bWTZfOJ6MqmtPaIIBLl/ZKImvF5f
 PMfDCXIPYtd4cxjsFjtmw3L9BkxPxU6hDtVMMzkG5mA19NOgGuReIxB8X35l4MVfKzPe
 2qEnsyCYgHb4+KFzxs5TbcKiHUUrkQ1X2LYw62oQiILlNxLdia2SYmdHSjDXyB+2Etl1
 Q6+g==
X-Gm-Message-State: AOAM532mE+W5AqLMpMWu1zAAsWXYWY/UvJawX2zQpz7FDv5r64XiAGoj
 FUuMtQVN2cwxYj7EQJqFWTU=
X-Google-Smtp-Source: ABdhPJxqts9oHAtc8VSeMZOqDX1wMQ8bxCV5sOxxbcafRczaZwIayBkNJ8qJCkifgM7OPMhtr1aQfw==
X-Received: by 2002:a17:90a:bd0f:: with SMTP id
 y15mr8324260pjr.141.1611812342072; 
 Wed, 27 Jan 2021 21:39:02 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id l2sm4358676pga.65.2021.01.27.21.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 21:39:01 -0800 (PST)
Date: Thu, 28 Jan 2021 15:38:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc64: Workaround sigtramp vdso return call.
To: Paul E Murphy <murphyp@linux.ibm.com>, Raoni Fassina Firmino
 <raoni@linux.ibm.com>
References: <20210126130515.jivsqeoyj5nu5znk@work-tp>
 <8735ynbxe6.fsf@oldenburg.str.redhat.com>
 <92b0ba5f-082c-5d4d-7998-075973fb32f6@linux.ibm.com>
 <20210127162140.wtetd4ob2iynvvvt@work-tp>
In-Reply-To: <20210127162140.wtetd4ob2iynvvvt@work-tp>
MIME-Version: 1.0
Message-Id: <1611809862.uje6q2b5ib.astroid@bobo.none>
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
Cc: Florian Weimer <fweimer@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 libc-alpha@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+linuxppc-dev

Excerpts from Raoni Fassina Firmino's message of January 28, 2021 2:21 am:
> On Tue, Jan 26, 2021 at 08:45:00AM -0600, AL glibc-alpha wrote:
>>=20
>>=20
>> On 1/26/21 8:12 AM, Florian Weimer via Libc-alpha wrote:
>> > * Raoni Fassina Firmino:
>> >=20
>> > > A not so recent kernel change[1] changed how the trampoline
>> > > `__kernel_sigtramp_rt64` is used to call signal handlers.
>> > >=20
>> > > This was exposed on the test misc/tst-sigcontext-get_pc
>> > >=20
>> > > Before kernel 5.9, the kernel set LR to the trampoline address and
>> > > jumped directly to the signal handler, and at the end the signal
>> > > handler, as any other function, would `blr` to the address set.  In
>> > > other words, the trampoline was executed just at the end of the sign=
al
>> > > handler and the only thing it did was call sigreturn.  But since
>> > > kernel 5.9 the kernel set CTRL to the signal handler and calls to th=
e
>> > > trampoline code, the trampoline then `bctrl` to the address in CTRL,
>> > > setting the LR to the next instruction in the middle of the
>> > > trampoline, when the signal handler returns, the rest of the
>> > > trampoline code executes the same code as before.
>> >=20
>> > Thanks for the patch, byt:
>> >=20
>> > No one has explained so far why the original blr instruction couldn't =
be
>> > augmented with the appropriate branch predictor hint.  The 2.07 ISA
>> > manual suggests that it's possible, but maybe I'm reading it wrong.
>>=20
>> bctrl is the preferred form of making indirect calls.  You can add hint =
0b01
>> to bclr (blr) to get similar behavior on power8/9, but as noted in the I=
SA,
>> it is optional.
>=20
> What branch prediction we are talking about? I think there is only one
> blr that is relevant, the one returning from the signal handler to the
> trampoline. In this case it if it is a simple blr is already hinted
> correctly with 0b00 (I think it is the default BH for blr), that it is a
> subroutine return. We don't have control over the blr from the signal
> handler to change the hint to 0b01 anyway. So IIUC, the return address
> predictor failed before because the signal handler don't go back from
> the same place (+4) it was called, and it changes with the added bctrl.
>=20
> I am CC'ing Nicholas and maybe he has more insight.

Prior to the kernel patch, if the signal handler code used blr BH=3D0b01
for returns that would indeed prevent the unbalance on processors which
implement it.

But you are right, as explained in Linux commit 0138ba5783ae, the blr is=20
in the signal handler function so we can't change that.

> (I know that now this discussion is split in two places, the original
> thread Florian started and this on for the patch. Not sure where best to
> continue this)

linuxppc-dev doesn't mind responsible cross posts to other lists,
hopefully libc-alpha is too.

Thanks,
Nick
