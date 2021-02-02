Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B430B7EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 07:40:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVFYQ21YxzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 17:40:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lioIuEDZ; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVFWj5JcMzDqpC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 17:38:39 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id l18so1734801pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 22:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=vD1g1+uwOQCPPPbfxm4dRfRFhp8B4sJeqT21+NMMZj0=;
 b=lioIuEDZEfEtPfnANMGtZBsMHPclUfU18q1WLAjxe8PVPtc8cfYs8G3JnwaJOoEp/9
 6Xxzrja4O9ltDVFw9yaa3hZIKyr8FSGTUdfa0ShN0rh4tFXaRWFLJrBO18xD2vMqLPHb
 6MpAAGchKqxd+0FB5wix1XKkK7v/sLPVbH370VcmY6flKnlp9SGzD42lO/D44weaNSXA
 3y49TGlJlCWk8YT2doXfFRwietzJeonLNblJiwZWDuuUf5OmTdO685R+02Q8hAP906mC
 LaCrE+DH9oQ+DhAagQHBQx4fQBUOTC5k27aLPe8YaGH7vah2Xda4+AyI90DL0SejBo8p
 GBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vD1g1+uwOQCPPPbfxm4dRfRFhp8B4sJeqT21+NMMZj0=;
 b=LpcTFt6DUTmwfWlQAfMcZPyXPNOSKPGUzd521MAqWGIOYPiNOEuDFTq9Lw9ENJjDSk
 NfEcMtaKova2Qg2/sTytWjzRMVzZFxb6H+Vu7aaVbfcYXN7A4xXoICsCvuviRRlD3KJS
 EkEZutKb4xAHdWR+AVdGlQOpEZEXqy1mkt2UfOdAbyNnPek4r3+x5w06DKMh1sGq5IBX
 Mvq01xwjhkFmuzJi1wucAbbz+aW1Clrx0Pp53xIOwXzqoDSrX7sAxma/5hk0TK6bZ19S
 4/TSROOd7na1Oh/ViZWV1nKxNPjXA2GD0uK2AK6ls+RlF4mSmipIqGYw6RVCwXWC3n7S
 QDUg==
X-Gm-Message-State: AOAM530SbjDZALMjUIeITz54KaVNfBcliY2HweSXuGCqKZT1KBywVJZH
 9hdZTLohV2E3/0OefwkjL/Q=
X-Google-Smtp-Source: ABdhPJwCiQVbVMJIuCyFwf8iv/Nr9wAGKz0HGRgq8WpMG2KH+TF0oxWr5AEMvOcI9r5OdNQDQrNomQ==
X-Received: by 2002:a17:90a:1082:: with SMTP id
 c2mr2739120pja.183.1612247917959; 
 Mon, 01 Feb 2021 22:38:37 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id p2sm1687782pjj.0.2021.02.01.22.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 22:38:37 -0800 (PST)
Date: Tue, 02 Feb 2021 16:38:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 11/23] powerpc/syscall: Rename syscall_64.c into
 syscall.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, David Laight <David.Laight@ACULAB.COM>,
 Michael Ellerman <mpe@ellerman.id.au>, "msuchanek@suse.de"
 <msuchanek@suse.de>, Paul Mackerras <paulus@samba.org>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <ff9dd4accdc897013594768833d54444e4823bf9.1611585031.git.christophe.leroy@csgroup.eu>
 <1611656343.yaxha7r2q4.astroid@bobo.none>
 <d9993f034db848d1afeffa322373b811@AcuMS.aculab.com>
 <1611791083.sqnnh21vv0.astroid@bobo.none>
 <0cf90825-da89-6464-98d4-dc7490bff557@csgroup.eu>
In-Reply-To: <0cf90825-da89-6464-98d4-dc7490bff557@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612247170.ea0f766ml4.astroid@bobo.none>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 2, 2021 4:15 pm:
>=20
>=20
> Le 28/01/2021 =C3=A0 00:50, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from David Laight's message of January 26, 2021 8:28 pm:
>>> From: Nicholas Piggin
>>>> Sent: 26 January 2021 10:21
>>>>
>>>> Excerpts from Christophe Leroy's message of January 26, 2021 12:48 am:
>>>>> syscall_64.c will be reused almost as is for PPC32.
>>>>>
>>>>> Rename it syscall.c
>>>>
>>>> Could you rename it to interrupt.c instead? A system call is an
>>>> interrupt, and the file now also has code to return from other
>>>> interrupts as well, and it matches the new asm/interrupt.h from
>>>> the interrupts series.
>>>
>>> Hmmm....
>>>
>>> That might make it harder for someone looking for the system call
>>> entry code to find it.
>>=20
>> It's very grep'able.
>>=20
>>> In some sense interrupts are the simpler case.
>>>
>>> Especially when comparing with other architectures which have
>>> special instructions for syscall entry.
>>=20
>> powerpc does have a special instruction for syscall, and it causes a
>> system call interrupt.
>>=20
>> I'm not sure about other architectures, but for powerpc its more
>> sensible to call it interrupt.c than syscall.c.
>=20
> Many other architectures have a syscall.c but for a different purpose: it=
 contains arch specific=20
> system calls. We have that in powerpc as well, it is called syscalls.c
>=20
> So to avoid confusion, I'll rename it. But I think "interrupt" is maybe n=
ot the right name. An=20
> interrupt most of the time refers to IRQ.

That depends what you mean by interrupt and IRQ.

Linux kind of considers any asynchronous maskable interrupt an irq=20
(local_irq_disable()). But if you say irq it's more likely to mean
a device interrupt, and "interrupt" usually refres to the asynch
ones.

But Linux doesn't really assign names to synchronous interrupts in
core code. It doesn't say they aren't interrupts, it just doesn't
really have a convention for them at all.

Other architectures e.g., x86 also have things like interrupt
descriptor table for synchronous interrupts as well. That's where
I got the interrupt wrappers code from actually.

So it's really fine to use the proper arch-specific names for things
in arch code. I'm trying to slowly change names from exception to
interrupt.

> For me system call is not an interrupt in the way it=20
> doesn't unexpectedly interrupt a program flow. In powerpc manuals it is g=
enerally called exceptions,=20
> no I'm more inclined to call it exception.c

Actually that's backwards. Powerpc manuals (at least the one I look at)=20
calls them all interrupts including system calls, and also the system
call interrupt is actually the only one that doesn't appear to be
associated with an exception.

Also there is no distinction about expecte/unexpected -- a data storage=20
interrupt is expected if you access a location without the right access=20
permissions for example, but it is still an interrupt.

These handlers very specifically deal with the change to execution flow
(i.e., the interrupt), they do *not* deal with the exception which may=20
be associated with it (that is the job of the handler).

And on the other hand you can deal with exceptions in some cases without
taking an interrupt at all. For example if you had MSR[EE]=3D0 you could
change the decrementer or execute msgclr or change HMER SPR etc to clear
various exceptions without ever taking the interrupt.

Thanks,
Nick
