Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE272445D7F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 02:46:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HljzZ50C0z30KC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 12:46:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YKgDWMAd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YKgDWMAd; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hljyt4bKkz2xY8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 12:46:13 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id n8so10146841plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 18:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=q8L8GH/JMzzDmLk0WBkvV88hAQVWV9eUSTZD2DY+EmI=;
 b=YKgDWMAdfyzqGyeZMYTsFJFtuji9utA1G6SwrxqJRYqBtNJ3Gy5BEmdMvAjF65ofpB
 Gtq0QljKSCcFPDJmFNTYpIfMk2ew03WTHOrIiwM07mPjeEVOjbqPVed6o+sO7MwYTJq1
 4YsU73CHUlKFt/+ovXOVK+N6DF/ZHkfO4CJRzPFGS9VBHdRgN7vLsP4OYIAhvYFnIKOM
 6IVednZ380/cmeVEsRz3VsHekDkbjOEgQPkmO48MnEDtF/uJ8ueOGreE3DaVlZbGwbRQ
 RYMq407YSICIX7E7aL7P8WK0oUxLdu11asuPew/la/oooFxsEgYbQa1wTC8ezASstrbz
 j4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=q8L8GH/JMzzDmLk0WBkvV88hAQVWV9eUSTZD2DY+EmI=;
 b=6NhfghjtB8oy1XSuuCdDM6Uc25997jgGDGwbDLFMs4l3vGuNDGLdWbUGy0YD+MWJV4
 8wZccOmi5F3s7GQ6wQjiykZCrfKfHQA4DvnPr4Jbd2esRaZ6xYX6KXAm4SRxj2j24VMO
 em35W+6yesFwrXF79LOrL7rs2jnCTpg0RFk1mbHlmiTBGgnp1QeJnwWPbLbr/pfDgtIj
 64GdwHp5Ku3IGFaYmDlgbrJru9svpj8rcSBAhmDtj7Dr42Tx6wqi3/YWiVSrXvi43H9c
 Tmnd19x8/KheyapK++fTTFSJcg57YdtDNnWMEL4CClMXvtstvP7PSxUOZpKqp0v03J2S
 Sk9w==
X-Gm-Message-State: AOAM533PvufhgJ4Pa/NHxD/VUFNHNsyI7lye6qcIsncGlyY/e1zNNr3B
 rqHw6Dz1+l+8iRbvYl6wlkZl1/S7SAc=
X-Google-Smtp-Source: ABdhPJztcYVZNmmgG8QpKah0l2UiJEhcsetCF0bqrJptUA83sjMnuUCfcsbzJVrqJ1jELZ0sUxtY9w==
X-Received: by 2002:a17:90b:4f45:: with SMTP id
 pj5mr10254434pjb.70.1636076770641; 
 Thu, 04 Nov 2021 18:46:10 -0700 (PDT)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id u38sm788813pfg.0.2021.11.04.18.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 18:46:10 -0700 (PDT)
Date: Fri, 05 Nov 2021 11:46:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
 <1635487923.hwdpof7s4v.astroid@bobo.none>
 <87sfwk7z0m.fsf@mpe.ellerman.id.au>
 <1635852231.aebe6lt6u4.astroid@bobo.none> <8735odx7us.fsf@linux.ibm.com>
In-Reply-To: <8735odx7us.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1636075766.ibq0u4kvet.astroid@bobo.none>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com,
 kjain@linux.ibm.com, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nathan Lynch's message of November 4, 2021 7:11 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Michael Ellerman's message of October 29, 2021 11:15 pm:
>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>> Excerpts from Athira Rajeev's message of October 29, 2021 1:05 pm:
>>>>> @@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 handle=
)
>>>>>  	if (ret)
>>>>>  		return ret;
>>>>> =20
>>>>> +	/* Disable PMU before suspend */
>>>>> +	on_each_cpu(&mobility_pmu_disable, NULL, 0);
>>>>
>>>> Why was this moved out of stop machine and to an IPI?
>>>>
>>>> My concern would be, what are the other CPUs doing at this time? Is it=
=20
>>>> possible they could take interrupts and schedule? Could that mess up t=
he
>>>> perf state here?
>>>=20
>>> pseries_migrate_partition() is called directly from migration_store(),
>>> which is the sysfs store function, which can be called concurrently by
>>> different CPUs.
>>>=20
>>> It's also potentially called from rtas_syscall_dispatch_ibm_suspend_me(=
),
>>> from sys_rtas(), again with no locking.
>>>=20
>>> So we could have two CPUs calling into here at the same time, which
>>> might not crash, but is unlikely to work well.
>>>=20
>>> I think the lack of locking might have been OK in the past because only
>>> one CPU will successfully get the other CPUs to call do_join() in
>>> pseries_suspend(). But I could be wrong.
>>>=20
>>> Anyway, now that we're mutating the PMU state before suspending we need
>>> to be more careful. So I think we need a lock around the whole
>>> sequence.
>=20
> Regardless of the outcome here, generally agreed that some serialization
> should be imposed in this path. The way the platform works (and some
> extra measures by the drmgr utility) make it so that this code isn't
> entered concurrently in usual operation, but it's possible to make it
> happen if you are root.
>=20
> A file-static mutex should be OK.
>=20
>> My concern is still that we wouldn't necessarily have the other CPUs=20
>> under control at that point even if we serialize the migrate path.
>> They could take interrupts, possibly call into perf subsystem after
>> the mobility_pmu_disable (e.g., via syscall or context switch) which=20
>> might mess things up.
>>
>> I think the stop machine is a reasonable place for the code in this=20
>> case. It's a low level disabling of hardware facility and saving off=20
>> registers.
>=20
> That makes sense, but I can't help feeling concerned still. For this to
> be safe, power_pmu_enable() and power_pmu_disable() must never sleep or
> re-enable interrupts or send IPIs. I don't see anything obviously unsafe
> right now, but is that already part of their contract?

Yes that would have to be. That's much the same as an IPI handler. Maybe=20
stop machine has a few other things to worry about but I'm not sure that
would get in the way. Just have a note in the implementation or name to
remind it is stop machine context. =20

> Is there much
> risk they could change in the future to violate those constraints?

My guess is if it needed to do anything much more complicated then you
would want to shut down perf more completely in a way that other APIs
know about.

>=20
> That aside, the proposed change seems like we would be hacking around a
> more generic perf/pmu limitation in a powerpc-specific way. I see the
> same behavior on x86 across suspend/resume.

Arguably it's fixing up a x86 suspend/resume bug that might be fixed
in the same way as this -- presumably it's not restoring PMU registers
at resume.

But if they did something generic in perf core, this code could be
changed over to use it quite easily I would hope.  But pinging the
other perf devs to check would be a good idea.

Thanks,
Nick
