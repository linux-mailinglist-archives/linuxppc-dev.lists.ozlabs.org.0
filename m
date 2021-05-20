Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB7389B79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 04:41:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlvBL0jmCz30Hk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:41:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Rgkk8HE7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rgkk8HE7; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flv9p4Q5bz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 12:40:45 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id 69so8162857plc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=j6sMI+bZA9YMbk0fCYjyAAWKqPr1erMiXEBhyqYazhg=;
 b=Rgkk8HE7bzITtQpiG1iZ+eN/RQcwSitph8N7cKXTytkcYCtjFwxiWICl4a6+/tjE8Z
 XX7x1RbHbcTbZq2xs11q8x81hxpYfQ4aTi+He4QZaYKBRVuC84N8YTP5JgOROp2n9acM
 9IwBdceFbp5Id4mh24g/BDUpzpc5o8WRsk4BhfXcSIhCjbCb2WOfEvfYAbLc1IWbORT2
 XpJKTf8aKt/sL/1kHZozeN/sa6Xz7im2Nytbn6DnR8Usltw2/A3ZN3mVe3bPsU0jPwjP
 oV4uNvQP0PuIf20k+q3chNJvMRPd+WgVoo+oPnCb6yaaUlT2AzDkGtxA7+oCGGNmTX4J
 F4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=j6sMI+bZA9YMbk0fCYjyAAWKqPr1erMiXEBhyqYazhg=;
 b=suwOiIW+VPvHqzceMZTiToi+EVaqOhln/8smaf42ZgiXlQ36hE9kw7yxdSgkNqvnw8
 FavV+ha1b/n0sn7YESFaGQ+plH+Ey3jigjBo3eW5+svn9m6zcfFo+kwe9oGShls2xZGN
 5vbZQ/EwdFqV7c/XBB1a2Zg50N8ZqJJxMHgFJjFittOYE9RIIJqFCp6vMNOybiSiiwvy
 D7WOnx+5nreT/imoh9n08JdjlmYoyjsKpXTYF5cTHqP/f9DFspcKEsFKudPdT06Ucduv
 HtxXnxB/3U+T/MtJMXPNUxsSmOTLpoLtxVam+pspqgFSKSGglSXwrKVkZIi/5wRILVVC
 A7Zw==
X-Gm-Message-State: AOAM530ZdIi5K2q3+F6t6pXAt4DXcL3PRSzD4CfSWZA7KYK3ZjihUha0
 2gAX4CkdKkBcEbAW6y0u2UA=
X-Google-Smtp-Source: ABdhPJxyeeNTthbt4jQGW2C22vOGa/e/gQB/AVNS+yPXRn6R5CDD986w6024+wQ1CIyHmrgxIv4bWA==
X-Received: by 2002:a17:902:7795:b029:f2:63cb:ab16 with SMTP id
 o21-20020a1709027795b02900f263cbab16mr3104479pll.7.1621478442283; 
 Wed, 19 May 2021 19:40:42 -0700 (PDT)
Received: from localhost (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id c19sm22268pfo.150.2021.05.19.19.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 19:40:41 -0700 (PDT)
Date: Thu, 20 May 2021 12:40:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: "Dmitry V. Levin" <ldv@altlinux.org>
References: <20210519132656.GA17204@altlinux.org>
 <1621464056.o9t21cquw8.astroid@bobo.none>
 <20210519232726.GA24134@altlinux.org>
In-Reply-To: <20210519232726.GA24134@altlinux.org>
MIME-Version: 1.0
Message-Id: <1621478238.xha1ow4ujh.astroid@bobo.none>
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
 musl@lists.openwall.com, linux-api@vger.kernel.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Dmitry V. Levin's message of May 20, 2021 9:27 am:
> On Thu, May 20, 2021 at 08:51:53AM +1000, Nicholas Piggin wrote:
>> Excerpts from Dmitry V. Levin's message of May 19, 2021 11:26 pm:
>> > On Wed, May 19, 2021 at 08:59:05PM +1000, Nicholas Piggin wrote:
>> >> Excerpts from Dmitry V. Levin's message of May 19, 2021 8:24 pm:
>> >> > On Wed, May 19, 2021 at 12:50:24PM +1000, Nicholas Piggin wrote:
>> >> > [...]
>> >> >> With this patch, I think the ptrace ABI should mostly be fixed. I =
think=20
>> >> >> a problem remains with applications that look at system call retur=
n=20
>> >> >> registers directly and have powerpc specific error cases. Those pr=
obably
>> >> >> will just need to be updated unfortunately. Michael thought it mig=
ht be
>> >> >> possible to return an indication via ptrace somehow that the sysca=
ll is
>> >> >> using a new ABI, so such apps can be updated to test for it. I don=
't=20
>> >> >> know how that would be done.
>> >> >=20
>> >> > Is there any sane way for these applications to handle the scv case=
?
>> >> > How can they tell that the scv semantics is being used for the give=
n
>> >> > syscall invocation?  Can this information be obtained e.g. from str=
uct
>> >> > pt_regs?
>> >>=20
>> >> Not that I know of. Michael suggested there might be a way to add=20
>> >> something. ptrace_syscall_info has some pad bytes, could
>> >> we use one for flags bits and set a bit for "new system call ABI"?
>> >=20
>> > PTRACE_GET_SYSCALL_INFO is an architecture-agnostic API, it hides all
>> > architecture-specific details behind struct ptrace_syscall_info which =
has
>> > the same meaning on all architectures.  ptrace_syscall_info.exit conta=
ins
>> > both rval and is_error fields to support every architecture regardless=
 of
>> > its syscall ABI.
>> >=20
>> > ptrace_syscall_info.exit is extensible, but every architecture would h=
ave
>> > to define a method of telling whether the system call follows the "new
>> > system call ABI" conventions to export this bit of information.
>>=20
>> It's already architecture speicfic if you look at registers of syscall=20
>> exit state so I don't see a problem with a flag that ppc can use for
>> ABI.
>=20
> To be honest, I don't see anything architecture-specific in
> PTRACE_GET_SYSCALL_INFO API.  Yes, it's implementation uses various
> functions defined in asm/syscall.h, but this doesn't make the interface
> architecture-specific.

No. But a field or flag it exports could be architecture dependent.
It doesn't detract independence from the rest of the ABI. That said...

> PTRACE_GET_SYSCALL_INFO saves its users from necessity to be aware of
> tracee registers.  That's why the only place where strace has to deal
> with tracee registers nowadays is syscall tampering.  The most reliable
> solution is to introduce PTRACE_SET_SYSCALL_INFO, this would make the
> whole syscall abi issue irrelevant for ptracers, maybe the time has come
> to implement it.
>=20
> Unfortunately, extending ptrace API takes time, and it's not going to be
> backported to older kernels anyway, but scv-enabled kernels are already
> in the wild, so we need a quick powerpc-specific fix that would be
> backported to all maintained scv-enabled kernels.
>=20
> [...]
>> > I wonder why can't this information be just exported to the tracer via
>> > struct pt_regs?
>>=20
>> It might be able to, I don't see why that would be superior though.
>>=20
>> Where could you put it... I guess it could go in the trap field in a=20
>> high bit. But could that break things that just test for syscall=20
>> trap number (and don't care about register ABI)? I'm not sure.
>=20
> Looks like struct pt_regs.trap already contains the information that coul=
d
> be used to tell 'sc' from 'scv': if (pt_regs.trap & ~0xf) =3D=3D 0x3000, =
then
> it's scv.  Is my reading of arch/powerpc/include/asm/ptrace.h correct?

Hmm, I think it is. Certainly in the kernel regs struct it is, I had in=20
my mind that we put it to 0xc00 when populating the user struct for
compatibility, but it seems not. So I guess this would work.

Thanks,
Nick
