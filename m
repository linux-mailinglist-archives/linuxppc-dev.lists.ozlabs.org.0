Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746721DDBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 18:43:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B58cC5MxKzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 02:43:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZHizbtdR; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B58TR3X01zDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 02:38:03 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id u185so6253821pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=M5dpdZlc5AZuc8tZn9pjfJ2OiWZnUg35Z95DTEBKlZo=;
 b=ZHizbtdRidV9cfFTxfh65frYRNUlflcm6LTD/pTO+ppqZrNb1UozTzRBS3QIhj/ewz
 z6qgK/i1tvzQYvdny3WQAwi3hIWr+gFD9+zqwi1YwmGUPWLpdkNvQ6U3Dp7fHfJ6HIEc
 VuSNItQ8fcWp4jUQGtrTPhziYA25CZBhzR/mMs1fOmpHpQEiVr8B2/NOhrzl9zRqapS9
 xwGiQKT77/AlvaB6CS2Q5VmQOk8VEgYpUwIFLVOwm1goC5wU78VOpj1zURE442aWsNJV
 /1PcmOJgcNqo3ducruFABMwbbV78U7MUejA2VpesDTFpmg+u4V1TiDkrcinM/wtaDS7i
 1uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=M5dpdZlc5AZuc8tZn9pjfJ2OiWZnUg35Z95DTEBKlZo=;
 b=pn9dsMs3Je/JtqvbJ2hVYoYWrtIcrMk0OhmDsOATGmHR+1zJv+w3aPM56TTsOPqG3M
 G0aQX0jgaWn+Tf9YQH7fj8KJUImH4/q/B4WVodeHDPKosKmq3hrHZryZVxRiZd+GGphM
 4C8AZ1neF00DMP1swRPZzPO88PVy+sL08iSSjSsmkbMoNIBBOTN1oyIDO9iJCcVZQ/8E
 RGQj3+2kKho+6aDYXIeSYte0vrep6PkvrTyaZAsItrPkuPvuA8w4x/OifkoPyA/mtg4o
 yWYHmqNPxZOZrvQGNXWSp7w6U7Ka8oc18+Nl9Ny+DAl0EX7tk73uFPbW3Wxch6p0tBlF
 m0wA==
X-Gm-Message-State: AOAM531Dfy/GpLZ7lL2hkBLh8uyi5wndlofApJFOlPcIXX/Vj/ZouXYf
 08cEnao0DcRv3u/Td3mxVAY=
X-Google-Smtp-Source: ABdhPJw9blcXi0cwBw8hKPF6SRaThbvsNvjZVSvg4Nwa/FV+DAxp/Hp10QGcc4RN2z6Lzg49giorhQ==
X-Received: by 2002:a63:1406:: with SMTP id u6mr76802pgl.108.1594658278427;
 Mon, 13 Jul 2020 09:37:58 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id nl8sm115886pjb.13.2020.07.13.09.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:37:57 -0700 (PDT)
Date: Tue, 14 Jul 2020 02:37:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Andy Lutomirski <luto@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200710015646.2020871-5-npiggin@gmail.com>
 <CALCETrVqHDLo09HcaoeOoAVK8w+cNWkSNTLkDDU=evUhaXkyhQ@mail.gmail.com>
 <1594613902.1wzayj0p15.astroid@bobo.none>
 <1594647408.wmrazhwjzb.astroid@bobo.none>
 <284592761.9860.1594649601492.JavaMail.zimbra@efficios.com>
 <CALCETrUHsYp0oGAiy3N-yAauPyx2nKqp1AiETgSJWc77GwO-Sg@mail.gmail.com>
In-Reply-To: <CALCETrUHsYp0oGAiy3N-yAauPyx2nKqp1AiETgSJWc77GwO-Sg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1594657848.8og86nopq6.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of July 14, 2020 1:48 am:
> On Mon, Jul 13, 2020 at 7:13 AM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>>
>> ----- On Jul 13, 2020, at 9:47 AM, Nicholas Piggin npiggin@gmail.com wro=
te:
>>
>> > Excerpts from Nicholas Piggin's message of July 13, 2020 2:45 pm:
>> >> Excerpts from Andy Lutomirski's message of July 11, 2020 3:04 am:
>> >>> Also, as it stands, I can easily see in_irq() ceasing to promise to
>> >>> serialize.  There are older kernels for which it does not promise to
>> >>> serialize.  And I have plans to make it stop serializing in the
>> >>> nearish future.
>> >>
>> >> You mean x86's return from interrupt? Sounds fun... you'll konw where=
 to
>> >> update the membarrier sync code, at least :)
>> >
>> > Oh, I should actually say Mathieu recently clarified a return from
>> > interrupt doesn't fundamentally need to serialize in order to support
>> > membarrier sync core.
>>
>> Clarification to your statement:
>>
>> Return from interrupt to kernel code does not need to be context seriali=
zing
>> as long as kernel serializes before returning to user-space.
>>
>> However, return from interrupt to user-space needs to be context seriali=
zing.
>>
>=20
> Indeed, and I figured this out on the first read through because I'm
> quite familiar with the x86 entry code.  But Nick somehow missed this,
> and Nick is the one who wrote the patch.
>=20
> Nick, I think this helps prove my point.  The code you're submitting
> may well be correct, but it's unmaintainable.

It's not. The patch I wrote for x86 is a no-op, it just moves existing
x86 hook and code that's already there to a different name.

Actually it's not quite a no-op, it't changes it to use hooks that are
actually called in the right places. Because previously it was
unmaintainable from point of view of generic mm -- it was not clear at
all that the old one should have been called in other places where the
mm goes non-lazy. Now with the exit_lazy_tlb hook, it can quite easily
be spotted where it is missing.

And x86 keeps their membarrier code in x86, and uses nice well defined
lazy tlb mm hooks.

> At the very least, this
> needs a comment explaining, from the perspective of x86, *exactly*
> what exit_lazy_tlb() is promising, why it's promising it, how it
> achieves that promise, and what code cares about it.  Or we could do
> something with TIF flags and make this all less magical, although that
> will probably end up very slightly slower.

It's all documented there in existing comments plus the asm-generic
exit_lazy_tlb specification added AFAIKS.

Is the membarrier comment in finish_task_switch plus these ones not
enough?

Thanks,
Nick
