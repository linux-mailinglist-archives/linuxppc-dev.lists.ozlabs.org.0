Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C514738997C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 00:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flp6M50rrz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 08:52:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Li4+10qZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Li4+10qZ; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flp5v5crzz2yWv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 08:52:02 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso4211890pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 15:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=K/gtSQyGUSDU2Jx3SxY9nAC3F0K9RnJVQwhiYzkSGHo=;
 b=Li4+10qZfuoAIzSIdJugbWgsSwoc1VZ1cdDPmdYg/YSbcOh/JRR+H6pZrgwFRDnUEo
 HGaEbrAhJe7+B5Glo+itY5TnswaO/K7rPHq1jJQgzhgX0leCQtJnPES6l9+tlC3YieE6
 S/HQtpfeC3os3GwDdARMl27O8ubM/rlGmyZG+G3jzHM6KrPuGba3wdNYRwYki08XnMi0
 A8UEKrOacg2Wrxx4Rejhv55B3yAwt1CynTgNc2c052ybYVpUHufFmowo4uNohnQBLZIF
 hFYytl+q3SuIuwV+yhuVmt2BTZz+wY1e/lgWlrCUXqSojnpw3nx66trf6xWhBWA2W1VE
 HbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=K/gtSQyGUSDU2Jx3SxY9nAC3F0K9RnJVQwhiYzkSGHo=;
 b=KW3i2eRNvxQMA+5reSPvyidq47NDR2acowQKtGwfmqJ4PiVKrDSJkeyf+rlCEUxHIc
 CntX3/CZ674EawQgKafr/rgYVyFr7xsVEQ055bH/uKb8I4s44TgM0HbEIuriZ3mSYgVs
 AncoQ2kr2OYve5zrzT/94qixGkxux5t08Rmty6yeHDa1inm6n9bNlcZt5Nc2SslvkwJ2
 RHNuYot867Db3+mgxf3uBsrE0ZfU4yDvpQnkf+8VYrfg8fk6Jqxh8PZWCtLghY79s50+
 cM6PQHIeN7Ob7YsnQ9IzwSE1ElH2EapJ7kASZ7Mqrwh70QVbpMjIA+rtPWpmzO26qMqv
 otgg==
X-Gm-Message-State: AOAM533WABcUavoynLLzcQV+2v5R8fkBJVJAOkL2Ok5KSQCyhdbrh3z2
 VtOwUibzUbXtjcpyP68Nbv8=
X-Google-Smtp-Source: ABdhPJwwHW0r8aMTiKvsh1z2gjgvHDbBcxnmnURC+BE3zkCPCR2+LFtab8vdgFm6O8pyoHn65LB4gQ==
X-Received: by 2002:a17:902:a40e:b029:e9:7253:8198 with SMTP id
 p14-20020a170902a40eb02900e972538198mr2160441plq.82.1621464720134; 
 Wed, 19 May 2021 15:52:00 -0700 (PDT)
Received: from localhost (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id gg10sm364500pjb.49.2021.05.19.15.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 15:51:59 -0700 (PDT)
Date: Thu, 20 May 2021 08:51:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: "Dmitry V. Levin" <ldv@altlinux.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20210519132656.GA17204@altlinux.org>
In-Reply-To: <20210519132656.GA17204@altlinux.org>
MIME-Version: 1.0
Message-Id: <1621464056.o9t21cquw8.astroid@bobo.none>
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
Cc: libc-alpha@sourceware.org, Matheus Castanho <msc@linux.ibm.com>,
 linux-api@vger.kernel.org, musl@lists.openwall.com, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Dmitry V. Levin's message of May 19, 2021 11:26 pm:
> On Wed, May 19, 2021 at 08:59:05PM +1000, Nicholas Piggin wrote:
>> Excerpts from Dmitry V. Levin's message of May 19, 2021 8:24 pm:
>> > On Wed, May 19, 2021 at 12:50:24PM +1000, Nicholas Piggin wrote:
>> > [...]
>> >> With this patch, I think the ptrace ABI should mostly be fixed. I thi=
nk=20
>> >> a problem remains with applications that look at system call return=20
>> >> registers directly and have powerpc specific error cases. Those proba=
bly
>> >> will just need to be updated unfortunately. Michael thought it might =
be
>> >> possible to return an indication via ptrace somehow that the syscall =
is
>> >> using a new ABI, so such apps can be updated to test for it. I don't=20
>> >> know how that would be done.
>> >=20
>> > Is there any sane way for these applications to handle the scv case?
>> > How can they tell that the scv semantics is being used for the given
>> > syscall invocation?  Can this information be obtained e.g. from struct
>> > pt_regs?
>>=20
>> Not that I know of. Michael suggested there might be a way to add=20
>> something. ptrace_syscall_info has some pad bytes, could
>> we use one for flags bits and set a bit for "new system call ABI"?
>=20
> PTRACE_GET_SYSCALL_INFO is an architecture-agnostic API, it hides all
> architecture-specific details behind struct ptrace_syscall_info which has
> the same meaning on all architectures.  ptrace_syscall_info.exit contains
> both rval and is_error fields to support every architecture regardless of
> its syscall ABI.
>=20
> ptrace_syscall_info.exit is extensible, but every architecture would have
> to define a method of telling whether the system call follows the "new
> system call ABI" conventions to export this bit of information.

It's already architecture speicfic if you look at registers of syscall=20
exit state so I don't see a problem with a flag that ppc can use for
ABI.

>=20
> This essentially means implementing something like
> static inline long syscall_get_error_abi(struct task_struct *task, struct=
 pt_regs *regs)
> for every architecture, and using it along with syscall_get_error
> in ptrace_get_syscall_info_exit to initialize the new field in
> ptrace_syscall_info.exit structure.

Yes this could work. Other architectures can just use a generic
implementation if they don't define their own so that's easy. And
in userspace they can continue to ignore the flag.

>=20
>> As a more hacky thing you could make a syscall with -1 and see how
>> the error looks, and then assume all syscalls will be the same.
>=20
> This would be very unreliable because sc and scv are allowed to interming=
le,
> so every syscall invocation can follow any of these two error handling
> conventions.
>=20
>> Or... is it possible at syscall entry to peek the address of
>> the instruction which caused the call and see if that was a
>> scv instruction? That would be about as reliable as possible
>> without having that new flag bit.
>=20
> No other architecture requires peeking into tracee memory just to find ou=
t
> the syscall ABI.  This would make powerpc the most ugly architecture for
> ptracing.
>=20
> I wonder why can't this information be just exported to the tracer via
> struct pt_regs?

It might be able to, I don't see why that would be superior though.

Where could you put it... I guess it could go in the trap field in a=20
high bit. But could that break things that just test for syscall=20
trap number (and don't care about register ABI)? I'm not sure.

Thanks,
Nick
