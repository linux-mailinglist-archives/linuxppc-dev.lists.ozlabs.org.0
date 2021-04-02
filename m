Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C88352484
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:37:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBLjW5VFHz3c4W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 11:37:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HjxdSQ7E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HjxdSQ7E; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBLj42712z2xfq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 11:36:53 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id p12so315551pgj.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 17:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mHTyduBV8QUncoW717T6beBC22w2IZVY/ijF4hpWxGA=;
 b=HjxdSQ7Em1sGaJLSqIRFvOZc1jv3Oi4ZrUw/yKg63yuR7RoFq/k1PM14qEQ0KEogo9
 fp+5ClfYUlMHEff7uYKEy2p+WZ4YJjDzq3uMvNUT9eMU4cjWwnFb6WMUtxIL7fWRZ/kO
 KpwKjsAX6Z/sYGxUdDJk/o90TDCH2dZR8zNeqhPC6QpV+jkZMhwTse7QoTS3i0FgTo8v
 FXfIKyzJSANQM5ZZaZzqb3ofD9MNuRkgiF1Eb9aj8N/D4fvsprzgVZlqbLbiL3HW5rU5
 XAggGW6Sk66ett192EbU3F/X17FsG8H/Kxfnf55dXhD4/no31Djvx7jelJb9jqjBZe1e
 6IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mHTyduBV8QUncoW717T6beBC22w2IZVY/ijF4hpWxGA=;
 b=hD0eisYgNdD9EISO5Gr38MD16KSqGGDNR4ax8Fplpe6Wkj1tQ/WxZ4mz9YOoAplBsD
 eR2/Q+bRoMxMSYaOsw28oVo6h+0dr+O2G6+v2F47BZS3JmWOc3i7mYzGAjAEaz5VqwUQ
 x1/xm9h3+Kq4LnwJdPtVqkixzvoBI1U7wxkcZ6qGOT9OrcCpON2DpQZL1kicuoQ6kcSv
 VVT6cE4puIeo/BCQlTWsT6KXHAosDW4+CvVcZiGOWOxlInl6THGOVM/rdpdy3g+/NWR0
 iolbHDcHLUWGNni3A0AEAZ8JRidFxy4kX6mAweOtSzwhN4b42ikxUEy5K8j5TiGMqzlO
 /qFw==
X-Gm-Message-State: AOAM5324TnEYZhXUyUumaoak26vmACHVhlMaPvT3I6rfpqjXQ8XnxRVO
 Do+N2e5IZwuqEVjMoBX6FGQ=
X-Google-Smtp-Source: ABdhPJzbvBbwx7VuBDpNxt3r39dNZxIn24MT44kQ2ysEs5seZxJ8UK6xP577pFsYiVsxPTaEfw0ZnQ==
X-Received: by 2002:a63:4502:: with SMTP id s2mr10219216pga.94.1617323811574; 
 Thu, 01 Apr 2021 17:36:51 -0700 (PDT)
Received: from localhost ([1.128.157.222])
 by smtp.gmail.com with ESMTPSA id w18sm6196736pjh.19.2021.04.01.17.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 17:36:51 -0700 (PDT)
Date: Fri, 02 Apr 2021 10:36:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/traps: Enhance readability for trap types
To: Segher Boessenkool <segher@kernel.crashing.org>, Xiongwei Song
 <sxwjean@gmail.com>
References: <20210330150425.10145-1-sxwjean@me.com>
 <875z17y79i.fsf@mpe.ellerman.id.au>
 <20210331212550.GD13863@gate.crashing.org>
 <CAEVVKH8XDiEGHjXj6sJAHynhwqKWpNqj_Ws03AqwNjR8OmHf5w@mail.gmail.com>
 <20210401161131.GE13863@gate.crashing.org>
In-Reply-To: <20210401161131.GE13863@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1617322416.z3cicnpfxy.astroid@bobo.none>
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
Cc: ravi.bangoria@linux.ibm.com, aik@ozlabs.ru, peterx@redhat.com,
 oleg@redhat.com, paulus@samba.org, kan.liang@linux.intel.com,
 leobras.c@gmail.com, mikey@neuling.org, maddy@linux.ibm.com,
 haren@linux.ibm.com, peterz@infradead.org, kjain@linux.ibm.com,
 msuchanek@suse.de, pmladek@suse.com, john.ogness@linutronix.de,
 alistair@popple.id.au, kvm-ppc@vger.kernel.org, jniethe5@gmail.com,
 atrajeev@linux.vnet.ibm.com, Xiongwei Song <sxwjean@me.com>,
 linux-kernel@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of April 2, 2021 2:11 am:
> On Thu, Apr 01, 2021 at 10:55:58AM +0800, Xiongwei Song wrote:
>> Segher Boessenkool <segher@kernel.crashing.org> =E4=BA=8E2021=E5=B9=B44=
=E6=9C=881=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=886:15=E5=86=99=E9=81=
=93=EF=BC=9A
>>=20
>> > On Wed, Mar 31, 2021 at 08:58:17PM +1100, Michael Ellerman wrote:
>> > > So perhaps:
>> > >
>> > >   EXC_SYSTEM_RESET
>> > >   EXC_MACHINE_CHECK
>> > >   EXC_DATA_STORAGE
>> > >   EXC_DATA_SEGMENT
>> > >   EXC_INST_STORAGE
>> > >   EXC_INST_SEGMENT
>> > >   EXC_EXTERNAL_INTERRUPT
>> > >   EXC_ALIGNMENT
>> > >   EXC_PROGRAM_CHECK
>> > >   EXC_FP_UNAVAILABLE
>> > >   EXC_DECREMENTER
>> > >   EXC_HV_DECREMENTER
>> > >   EXC_SYSTEM_CALL
>> > >   EXC_HV_DATA_STORAGE
>> > >   EXC_PERF_MONITOR
>> >
>> > These are interrupt (vectors), not exceptions.  It doesn't matter all
>> > that much, but confusing things more isn't useful either!  There can b=
e
>> > multiple exceptions that all can trigger the same interrupt.
>> >
>> >  When looking at the reference manual of e500 and e600 from NXP
>>  official, they call them as interrupts.While looking at the "The
>> Programming Environments"
>>  that is also from NXP, they call them exceptions. Looks like there is
>>  no explicit distinction between interrupts and exceptions.
>=20
> The architecture documents have always called it interrupts.  The PEM
> says it calls them exceptions instead, but they are called interrupts in
> the architecture (and the PEM says that, too).
>=20
>> Here is the "The Programming Environments" link:
>> https://www.nxp.com.cn/docs/en/user-guide/MPCFPE_AD_R1.pdf
>=20
> That document is 24 years old.  The architecture is still published,
> new versions regularly.
>=20
>> As far as I know, the values of interrupts or exceptions above are defin=
ed
>> explicitly in reference manual or the programming environments.
>=20
> They are defined in the architecture.
>=20
>> Could
>> you please provide more details about multiple exceptions with the same
>> interrupts?
>=20
> The simplest example is 700, program interrupt.  There are many causes
> for it, including all the exceptions in FPSCR: VX, ZX, OX, UX, XX, and
> VX is actually divided into nine separate cases itself.  There also are
> the various causes of privileged instruction type program interrupts,
> and  the trap type program interrupt, but the FEX ones are most obvious
> here.

Also:

* Some interrupts have no corresponding exception (system call and=20
system call vectored). This is not just semantics or a bug in the ISA
because it is different from other synchronous interrupts: instructions=20
which cause exceptions (e.g., a page fault) do not complete before=20
taking the interrupt whereas sc does.

* It's quite usual for an exception to not cause an interrupt=20
immediately (MSR[EE]=3D0, HMEER) or never cause one and be cleared by=20
other means (msgclr, mtDEC, mtHMER, etc).

* It's possible for an exception to cause different interrupts!
A decrementer exception usually causes a decrementer interrupt, but it
can cause a system reset interrupt if the processor was in a power
saving mode. A data storage exception can cause a DSI or HDSI interrupt
depending on LPCR settings, and many other examples.

So I agree with Segher on this. We should use interrupt for interrupts,=20
reduce exception except where we really mean it, and move away from vec=20
and trap (I've got this wrong in the past too I admit). We don't have to=20
do it all immediately, but new code should go in this direction.

Thanks,
Nick
