Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED03A5C90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 07:50:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3LCD4B8wz3099
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 15:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QQnbJVDY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QQnbJVDY; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3LBh5VHBz2yWN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 15:50:01 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so9366813pjs.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 22:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=rv8nglMrODdS8owQfQS9R5whyFklWUCbswIxFEXLREc=;
 b=QQnbJVDY1UHIdDWWwPquStzb8qMukFjbNi6viGaCBlUwB0/N1YrDR2eaJsTHUPHurp
 FiIu+V9hhMpJeyzfaBhuAnpDA1K6y45p3ZvRog/13BKjBOnVKU0mMaVzsxTeRlvz9XHY
 CIJilgwdjMzxeCo//V6+hOa1PHdGR+znn+hAjGiH+FbnFapb5Z6fJsD9tNBw2Gu4ynJ2
 GKDMBPwLmXCQo//65uTlT82riQb+6DRTlfZw/9fEOZcFDQ+/A/gcfHMPDY5NM42Bl1a2
 oIjJf7b5tMU6rf98RjuNL7SRBOUE+mL23v9nYIjN83xSbJBTPzwQyW3VYNKsDGRmC6pD
 3YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=rv8nglMrODdS8owQfQS9R5whyFklWUCbswIxFEXLREc=;
 b=HBgD5CRT+FsXA5btn60TpwBd9QciLrZUelHnhk2jsJEamUaxBncjB5KE3GUan+t0Na
 udlZ68emRnTq8k3/K0VerqsZ2FAXi/m7rEfeP1ZYj1wafVxLvHdV1JzxU/6BxuD1oLZ7
 DORuSu1wWVyEIqN/If9z5lHUmU526F8bRrxnLX3tTvrjO6XscBW4FyMDYIhH8x4aYs+u
 /pYrlpvWAz+09g9S8CGKymGP5n8GvgSG2tcKZIVyUEM8sUk9Jh3bqtnlQritujAS0D4k
 H7/Rn0H8T8KopJqGYxeMZY/FMK+ZJCxCNHz7lLykaw6q3sk9vsPLDyb/X3ZKAl757hGe
 mCVQ==
X-Gm-Message-State: AOAM532r+Qc8l1E564BlJD6k5wGnMmANInht8EBRZh7bWquZThQDP/p3
 qLb/B5hCcTPvTnDE6NqpRoU=
X-Google-Smtp-Source: ABdhPJyq9ST15J5OGjxS9rJ66srLMW01pyeOWAXj7CsFyj/17zSd6f0ZzZxSeOSeXK7UCFd6ICS1nA==
X-Received: by 2002:a17:90a:fa10:: with SMTP id
 cm16mr13113928pjb.175.1623649797323; 
 Sun, 13 Jun 2021 22:49:57 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id v4sm1304932pgr.65.2021.06.13.22.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 22:49:57 -0700 (PDT)
Date: Mon, 14 Jun 2021 15:49:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/signal64: Don't read sigaction arguments back
 from user memory
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210610072949.3198522-1-mpe@ellerman.id.au>
 <1623633444.p3rmbd7eti.astroid@bobo.none>
 <c677eab1-0ecd-8630-89c0-6fcc35788356@csgroup.eu>
In-Reply-To: <c677eab1-0ecd-8630-89c0-6fcc35788356@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1623649744.mbu8z4p0v5.astroid@bobo.none>
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
Cc: cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of June 14, 2021 3:30 pm:
>=20
>=20
> Le 14/06/2021 =C3=A0 03:32, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Michael Ellerman's message of June 10, 2021 5:29 pm:
>>> When delivering a signal to a sigaction style handler (SA_SIGINFO), we
>>> pass pointers to the siginfo and ucontext via r4 and r5.
>>>
>>> Currently we populate the values in those registers by reading the
>>> pointers out of the sigframe in user memory, even though the values in
>>> user memory were written by the kernel just prior:
>>>
>>>    unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
>>>    unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
>>>    ...
>>>    if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
>>>    	err |=3D get_user(regs->gpr[4], (unsigned long __user *)&frame->pin=
fo);
>>>    	err |=3D get_user(regs->gpr[5], (unsigned long __user *)&frame->puc=
);
>>>
>>> ie. we write &frame->info into frame->pinfo, and then read frame->pinfo
>>> back into r4, and similarly for &frame->uc.
>>>
>>> The code has always been like this, since linux-fullhistory commit
>>> d4f2d95eca2c ("Forward port of 2.4 ppc64 signal changes.").
>>>
>>> There's no reason for us to read the values back from user memory,
>>> rather than just setting the value in the gpr[4/5] directly. In fact
>>> reading the value back from user memory opens up the possibility of
>>> another user thread changing the values before we read them back.
>>> Although any process doing that would be racing against the kernel
>>> delivering the signal, and would risk corrupting the stack, so that
>>> would be a userspace bug.
>>>
>>> Note that this is 64-bit only code, so there's no subtlety with the siz=
e
>>> of pointers differing between kernel and user. Also the frame variable
>>> is not modified to point elsewhere during the function.
>>>
>>> In the past reading the values back from user memory was not costly, bu=
t
>>> now that we have KUAP on some CPUs it is, so we'd rather avoid it for
>>> that reason too.
>>>
>>> So change the code to just set the values directly, using the same
>>> values we have written to the sigframe previously in the function.
>>>
>>> Note also that this matches what our 32-bit signal code does.
>>>
>>> Using a version of will-it-scale's signal1_threads that sets SA_SIGINFO=
,
>>> this results in a ~4% increase in signals per second on a Power9, from
>>> 229,777 to 239,766.
>>=20
>> Good find, nice improvement. Will make it possible to make the error
>> handling much nicer too I think.
>>=20
>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>>=20
>> You've moved copy_siginfo_to_user right up to the user access unlock,
>> could save 2 more KUAP lock/unlocks if we had an unsafe_clear_user. If
>> we can move the other user access stuff up as well, the stack frame
>> put_user could use unsafe_put_user as well, saving 1 more. Another few
>> percent?
>=20
> I'm looking at making an 'unsafe' version of copy_siginfo_to_user().
> That's straight forward for 'native' signals, but for compat signals that=
's more tricky.

Ah nice. Native is most important at the moment.

Thanks,
Nick
