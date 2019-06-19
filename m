Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0624B672
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 12:48:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TMBJ1fkczDqTw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 20:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aaHRBZYW"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TM8R2Q37zDqP6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 20:47:02 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id p10so9460249pgn.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=200XxydEFi55bUNsx9pcWTaDk7SFbRW+2sQbTbQJgsM=;
 b=aaHRBZYWPczbQFqJe9JJFA0dlLlJzzBJC/oTJXqGKCNuMLuBOY+dTvIh9dbUV+V+z1
 M/S9iuWU9FuhO/8Lgi6ik9IeD4gD9wfBvILBynTUQBfUQqb810rGAg7Bmy1wY688mP7+
 7r+hqoXD403MfWK6HCdotz2jLosUibL/qmzWQwAzx7fQ+D8noSJRamt/6HjG2MpPximC
 PQcbcuLZ1v1c5lqOpuBGkAOgGjG4OY+Ulj5cLZ+QfyiZY/fv0AkL3k2SEKxDFHkAFCXx
 nmlFw9MABm5Z4uKJNy4JGtlZdpjiixAU9s/oCG13IzJo7pN8wv3jcDuuuf+E1Vt25rrg
 ibXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=200XxydEFi55bUNsx9pcWTaDk7SFbRW+2sQbTbQJgsM=;
 b=Z/9mKybj47xEEgZRhZ7iqSJ+DAZrzGfV45KbitLZMOz17nz2gU3WEZtH42Gk63+7FH
 HXRa8U5LNhgjGv8HPgKNZkdos5VcASZhw1rXpxGPG2C4tNWjTA722UOEFu0Gdw73Gzhi
 H7D2GVz5vSB3PpvvHarEwtoa+sE7IQpIfhWGs4dQGvoKjt9wNAu1wEwvn+XwRP79cNPI
 kk4kUm2vYNc7+kBuc/R5u8992MYrtoOHOT49Q4083Vtd2T+8zCxIS4vHqigHcv2g9NGi
 kZx6sc/Yt7LuYeHWQVVQeYecbA0cx8j9EuH89Z0EU9E6rmaEsLsPGjWeewRmgQHIzyaE
 sIcw==
X-Gm-Message-State: APjAAAUOyzPPG6dyaH8ejvxigazFkwJVcqyvNDIhjT39TZ/L2Mi72Wn2
 ultjrPIKBc4sadxhqEB0//8=
X-Google-Smtp-Source: APXvYqyUoVCDTnkdi8S5XBhHAWD7lToyn4p07rWUBoIE9b24JPYzcTPmfroVgY3GX4XQa3wGy24piA==
X-Received: by 2002:aa7:9786:: with SMTP id o6mr38027796pfp.222.1560941219859; 
 Wed, 19 Jun 2019 03:46:59 -0700 (PDT)
Received: from localhost (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id v10sm14141318pfe.163.2019.06.19.03.46.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 03:46:59 -0700 (PDT)
Date: Wed, 19 Jun 2019 20:41:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/7] powerpc/ftrace: Additionally nop out the preceding
 mflr with -mprofile-kernel
To: Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <72492bc769cd6f40a536e689fc3195570d07fd5c.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <877e9idum7.fsf@concordia.ellerman.id.au>
 <1560927184.kqsg9x9bd1.astroid@bobo.none>
 <1560935530.70niyxru6o.naveen@linux.ibm.com>
In-Reply-To: <1560935530.70niyxru6o.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560939496.ovo51ph4i4.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao's on June 19, 2019 7:53 pm:
> Nicholas Piggin wrote:
>> Michael Ellerman's on June 19, 2019 3:14 pm:
>>> Hi Naveen,
>>>=20
>>> Sorry I meant to reply to this earlier .. :/
>=20
> No problem. Thanks for the questions.
>=20
>>>=20
>>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>>>> With -mprofile-kernel, gcc emits 'mflr r0', followed by 'bl _mcount' t=
o
>>>> enable function tracing and profiling. So far, with dynamic ftrace, we
>>>> used to only patch out the branch to _mcount(). However, mflr is
>>>> executed by the branch unit that can only execute one per cycle on
>>>> POWER9 and shared with branches, so it would be nice to avoid it where
>>>> possible.
>>>>
>>>> We cannot simply nop out the mflr either. When enabling function
>>>> tracing, there can be a race if tracing is enabled when some thread wa=
s
>>>> interrupted after executing a nop'ed out mflr. In this case, the threa=
d
>>>> would execute the now-patched-in branch to _mcount() without having
>>>> executed the preceding mflr.
>>>>
>>>> To solve this, we now enable function tracing in 2 steps: patch in the
>>>> mflr instruction, use synchronize_rcu_tasks() to ensure all existing
>>>> threads make progress, and then patch in the branch to _mcount(). We
>>>> override ftrace_replace_code() with a powerpc64 variant for this
>>>> purpose.
>>>=20
>>> According to the ISA we're not allowed to patch mflr at runtime. See th=
e
>>> section on "CMODX".
>>=20
>> According to "quasi patch class" engineering note, we can patch
>> anything with a preferred nop. But that's written as an optional
>> facility, which we don't have a feature to test for.
>>=20
>=20
> Hmm... I wonder what the implications are. We've been patching in a=20
> 'trap' for kprobes for a long time now, along with having to patch back=20
> the original instruction (which can be anything), when the probe is=20
> removed.

Will have to check what implementations support "quasi patch class"
instructions. IIRC recent POWER processors are okay. May have to add
a feature test though.

>>>=20
>>> I'm also not convinced the ordering between the two patches is
>>> guaranteed by the ISA, given that there's possibly no isync on the othe=
r
>>> CPU.
>>=20
>> Will they go through a context synchronizing event?
>>=20
>> synchronize_rcu_tasks() should ensure a thread is scheduled away, but
>> I'm not actually sure it guarantees CSI if it's kernel->kernel. Could
>> do a smp_call_function to do the isync on each CPU to be sure.
>=20
> Good point. Per=20
> Documentation/RCU/Design/Requirements/Requirements.html#Tasks RCU:
> "The solution, in the form of Tasks RCU, is to have implicit read-side=20
> critical sections that are delimited by voluntary context switches, that=20
> is, calls to schedule(), cond_resched(), and synchronize_rcu_tasks(). In=20
> addition, transitions to and from userspace execution also delimit=20
> tasks-RCU read-side critical sections."
>=20
> I suppose transitions to/from userspace, as well as calls to schedule()=20
> result in context synchronizing instruction being executed. But, if some=20
> tasks call cond_resched() and synchronize_rcu_tasks(), we probably won't=20
> have a CSI executed.
>=20
> Also:
> "In CONFIG_PREEMPT=3Dn kernels, trampolines cannot be preempted, so these=
=20
> APIs map to call_rcu(), synchronize_rcu(), and rcu_barrier(),=20
> respectively."
>=20
> In this scenario as well, I think we won't have a CSI executed in case=20
> of cond_resched().
>=20
> Should we enhance patch_instruction() to handle that?

Well, not sure. Do we have many post-boot callers of it? Should
they take care of their own synchronization requirements?

Thanks,
Nick
=
