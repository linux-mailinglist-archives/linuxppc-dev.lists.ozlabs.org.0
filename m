Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60617CA80
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 02:35:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z6Vn4ZQQzDrCm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 12:35:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.193;
 helo=mail-pg1-f193.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z6TK2QTCzDqyn
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 12:33:54 +1100 (AEDT)
Received: by mail-pg1-f193.google.com with SMTP id 7so1891243pgr.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 17:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=utbLqXD9CMgavbCxnlr6/AcL14xuX+rVDyDAq46auJA=;
 b=aRJsmhc3cewVCEP4AZhnFINE0WvEFandNRFswILE38ZNibP0htc5t+sXuBwP7hgLpl
 AWIX12ow5/Xkz1fof5hGHNDAMf195Q5H13wLvsVPQBqhSQ2IL3aLU2zb00CyZEOUT+1U
 8BKO/K/3TCZ8smnNEWzsTPff1Si4DW+raOqtQfyXs68tbufOVOw29fYgi/vRN1xWwMfK
 ql7M7H1m37RFnI8KiUicvyj57om6U26bRII4mOcdYByKnCz0RGyXBvUZOAQaCQyQ2C4+
 YJX9dnK5ljlYh6BWti3tjjXPz73yicU+qTugrkAfwmzHe0Mswua1mG+xeuonj6VHfYyw
 clnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=utbLqXD9CMgavbCxnlr6/AcL14xuX+rVDyDAq46auJA=;
 b=fZyGXzDhMk1WF34GkzCObMQpobuJze7KhWHkSUnqDWJoxlO+Tp2GhNCZeQse30f3Og
 95xPAR8dgTZjnOpCYpJtRDwOT2RP7YexvcZzNEORFWuMdT0TAa0ykGNf8N4M+OrOe5bk
 8cTd0ekA6oQf8e6WVo4YpgEvlrnJoduB+ZQu6pnN7C7piHcwzm7pIvrQ7iMeUc+gSXTx
 E81Xm/cGRfhTMIUWLeBkGYIXJ5snisOtux6OVoSmws1zLomubiaw/HXEmCm9zYvQUZMm
 PjOccLjVIZFr8Q8jeWW7ecjRHCOCcpfiwNGbapz0LgsHhYLN5rhX1Q15INypzm5I8sgn
 ZO+Q==
X-Gm-Message-State: ANhLgQ2kYMWX5xgmhbEjBVxdLk6iWcw7IsLxADq6OaUW6erRVgjCStdI
 9Nz4rkEeyyd4wXxPbGsLvSo=
X-Google-Smtp-Source: ADFU+vuoCBd9PeYvVd50a4nWUK05dFEI4n0+PZoZxrM+BDuA4mc4IESxF144/lK1F/uT+EdTEiBPsw==
X-Received: by 2002:aa7:880e:: with SMTP id c14mr6491095pfo.76.1583544772709; 
 Fri, 06 Mar 2020 17:32:52 -0800 (PST)
Received: from localhost (193-116-204-226.tpgi.com.au. [193.116.204.226])
 by smtp.gmail.com with ESMTPSA id o128sm3168730pfg.5.2020.03.06.17.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 17:32:52 -0800 (PST)
Date: Sat, 07 Mar 2020 11:32:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20200306073000.9491-1-dja@axtens.net>
In-Reply-To: <20200306073000.9491-1-dja@axtens.net>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1583543617.bp71axgtlo.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens's on March 6, 2020 5:30 pm:
> kcov instrumentation is collected the __sanitizer_cov_trace_pc hook in
> kernel/kcov.c. The compiler inserts these hooks into every basic block
> unless kcov is disabled for that file.
>=20
> We then have a deep call-chain:
>  - __sanitizer_cov_trace_pc calls to check_kcov_mode()
>  - check_kcov_mode() (kernel/kcov.c) calls in_task()
>  - in_task() (include/linux/preempt.h) calls preempt_count().
>  - preempt_count() (include/asm-generic/preempt.h) calls
>      current_thread_info()
>  - because powerpc has THREAD_INFO_IN_TASK, current_thread_info()
>      (include/linux/thread_info.h) is defined to 'current'
>  - current (arch/powerpc/include/asm/current.h) is defined to
>      get_current().
>  - get_current (same file) loads an offset of r13.
>  - arch/powerpc/include/asm/paca.h makes r13 a register variable
>      called local_paca - it is the PACA for the current CPU, so
>      this has the effect of loading the current task from PACA.
>  - get_current returns the current task from PACA,
>  - current_thread_info returns the task cast to a thread_info
>  - preempt_count dereferences the thread_info to load preempt_count
>  - that value is used by in_task and so on up the chain
>=20
> The problem is:
>=20
>  - kcov instrumentation is enabled for arch/powerpc/kernel/dt_cpu_ftrs.c
>=20
>  - even if it were not, dt_cpu_ftrs_init calls generic dt parsing code
>    which should definitely have instrumentation enabled.
>=20
>  - setup_64.c calls dt_cpu_ftrs_init before it sets up a PACA.
>=20
>  - If we don't set up a paca, r13 will contain unpredictable data.
>=20
>  - In a zImage compiled with kcov and KASAN, we see r13 containing a valu=
e
>    that leads to dereferencing invalid memory (something like
>    912a72603d420015).
>=20
>  - Weirdly, the same kernel as a vmlinux loaded directly by qemu does not
>    crash. Investigating with gdb, it seems that in the vmlinux boot case,
>    r13 is near enough to zero that we just happen to be able to read that
>    part of memory (we're operating with translation off at this point) an=
d
>    the current pointer also happens to land in readable memory and
>    everything just works.
>=20
>  - PACA setup refers to CPU features - setup_paca() looks at
>    early_cpu_has_feature(CPU_FTR_HVMODE)
>=20
> There's no generic kill switch for kcov (as far as I can tell), and we
> don't want to have to turn off instrumentation in the generic dt parsing
> code (which lives outside arch/powerpc/) just because we don't have a rea=
l
> paca or task yet.
>=20
> So:
>  - change the test when setting up a PACA to consider the actual value of
>    the MSR rather than the CPU feature.
>=20
>  - move the PACA setup to before the cpu feature parsing.

Hmm. Problem is that equally we want PACA to be sane before we call too
far into the rest of the kernel ("generic dt parsing code").

Does KCOV really need to instrument code this early? If not, then
change

    if (!in_task())
        return false;

to

    if (system_state !=3D SYSTEM_RUNNING)
        return false;
    if (!in_task())
        return false;

If it does need to instrument early, then something like

    if (system_state >=3D SYSTEM_SCHEDULING && !in_task())
        return false;

Thanks,
Nick

=
