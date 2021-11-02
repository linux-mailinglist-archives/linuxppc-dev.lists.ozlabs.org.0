Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8058E442CB8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:36:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7CS31RJz2yYS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:36:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UoRxzPpY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UoRxzPpY; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Bk6YZMz2xD8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:35:56 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id s136so19880676pgs.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Nov 2021 04:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gWUbQ0ngiipLMAY2ygC113pJXGGPZ3VIQ15r0hKIpEc=;
 b=UoRxzPpYUeZyTcdv7hiiaQOXY0wgp7bncPUDMUpPG9LzJBWuPg424RxrcX/xAFzWcU
 7l4imTKtNT9y+6KhX4t4/fXwK6LvVEvgHkf2GePtwZ5AfpyC1KCqxqkwvz2EqFEnLTrs
 +vwYylUin2JOJ2h4vbERYEHe1GI5M2V9sGUl/V8PaMPRYmyRgiSCuHroTdk9fTcQJWai
 X/Rg1bFJh08eAGOgGMes7gLfAQjyMG2ciBRQJmWD+06mXdRbfvUVOywQBCZ2gIwAJEqL
 oq1agf2W0ntcVyzXXUCfbDZylRw5OzJ4Of4XDZA1Nr8XkNPA6qLhTgT4B0dBP/Vkioth
 DHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gWUbQ0ngiipLMAY2ygC113pJXGGPZ3VIQ15r0hKIpEc=;
 b=mQ2OQHb7GYUophIjFnyDuFhTI1rUhnZnujYj3k/JDdATX32+sVmN3aMcfnbaLeYeNM
 9GX1lZK240mUkoljNBRAFEOGqolN7+f/Pb3smyrSFDO3fx81aFF67aZNMDgNB7Q20JHW
 NC8Fu/Y6esmhYzwVNfpCnhVrJzuAMOtk1pcZpQPDVlvw1DGy+AHObVuA1y+8vlFHkaWN
 AKFCdypD+ITPANpliGk/raTPBINHHHBCOl3bhWnxQHHtBjGdBP9IMui0DUFAN9b8uj0C
 6Zfn6LC9RI6GyRqY3kKekzpgy5tV/KObaCaHI1le9H88NzdhCQNIsPXdtBjnrXnMtqED
 sHiA==
X-Gm-Message-State: AOAM5325lR5hyrfcE2Xnv+rpMs3LcWOyI1YG57uB3cZW4DnxQitafMnb
 kAcAC6Udk37X3twQ1j7L2Ac=
X-Google-Smtp-Source: ABdhPJxj0C1biRs/Bp2SIFbgNQerZbEIJ+1DR+1Z/mksyuMVXzOQKawMHqWKkD4ke9E1mLceSkRDNw==
X-Received: by 2002:a63:9a12:: with SMTP id o18mr27230405pge.419.1635852953580; 
 Tue, 02 Nov 2021 04:35:53 -0700 (PDT)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id t8sm16616416pgk.66.2021.11.02.04.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:35:53 -0700 (PDT)
Date: Tue, 02 Nov 2021 21:35:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
 <1635487923.hwdpof7s4v.astroid@bobo.none>
 <87sfwk7z0m.fsf@mpe.ellerman.id.au>
In-Reply-To: <87sfwk7z0m.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1635852231.aebe6lt6u4.astroid@bobo.none>
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
Cc: nathanl@linux.ibm.com, kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of October 29, 2021 11:15 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Excerpts from Athira Rajeev's message of October 29, 2021 1:05 pm:
>>> @@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 handle)
>>>  	if (ret)
>>>  		return ret;
>>> =20
>>> +	/* Disable PMU before suspend */
>>> +	on_each_cpu(&mobility_pmu_disable, NULL, 0);
>>
>> Why was this moved out of stop machine and to an IPI?
>>
>> My concern would be, what are the other CPUs doing at this time? Is it=20
>> possible they could take interrupts and schedule? Could that mess up the
>> perf state here?
>=20
> pseries_migrate_partition() is called directly from migration_store(),
> which is the sysfs store function, which can be called concurrently by
> different CPUs.
>=20
> It's also potentially called from rtas_syscall_dispatch_ibm_suspend_me(),
> from sys_rtas(), again with no locking.
>=20
> So we could have two CPUs calling into here at the same time, which
> might not crash, but is unlikely to work well.
>=20
> I think the lack of locking might have been OK in the past because only
> one CPU will successfully get the other CPUs to call do_join() in
> pseries_suspend(). But I could be wrong.
>=20
> Anyway, now that we're mutating the PMU state before suspending we need
> to be more careful. So I think we need a lock around the whole sequence.

My concern is still that we wouldn't necessarily have the other CPUs=20
under control at that point even if we serialize the migrate path.
They could take interrupts, possibly call into perf subsystem after
the mobility_pmu_disable (e.g., via syscall or context switch) which=20
might mess things up.

I think the stop machine is a reasonable place for the code in this=20
case. It's a low level disabling of hardware facility and saving off=20
registers.

Thanks,
Nick

