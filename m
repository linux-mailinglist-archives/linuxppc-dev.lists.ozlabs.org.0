Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33192456C18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 10:06:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwW4P0Wq4z3c6P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 20:06:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Of71Etz4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Of71Etz4; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwW3g3WqFz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 20:05:49 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id b13so7669328plg.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 01:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=vse7Zj+HMzf9UVxdMmzIM1aPBJvCeywMOii/Bfq0WaI=;
 b=Of71Etz4KWugaZ9dI13ZeE63TEWmCsu0PjF24ls75byNwL5NzL/gpLQMa+N3ywrB1Z
 JS9qjBBvDIxbl0wCu8lW+SR6hbL58ShRS9N0lTR98l2/wNJWS5Eho90/6yLHRCWpl6JL
 PwloaCJqNrC9AX7LJQJCRci5DRXGX88ykeFmLyRK5TuTDOi9fvNDn8qWG6319/CjkaQ+
 cs0C7uouhW1XevAWyOcl2/SZIyzjlHAKZaXRIcAfGcShkX7WrYs9WA7dfSCxWsplmawC
 L7cxfmzfcOHsB7pT5WqoAMXtbaXr6eegtWh3LJcaB4/3X2G+1mzs5y4v+gT+351YQZze
 lfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vse7Zj+HMzf9UVxdMmzIM1aPBJvCeywMOii/Bfq0WaI=;
 b=5095n6sJGGC+EAMchxGiR3Y2MCkLSDpGEh3EQByIA1LiJjZgBUb6LfbKVJ03Sjn6Kv
 GnwEPKdnc9NGAR8q3CEUKMT2WbkctqF7QaWdVrt9NxuV3busRXckp0Ufe5PUcwtatYk0
 Mg/TO2CFAi2COLoBH9sgMZEMedgj7Mz/1cr17R9k7GrHq59ry9+zRXr+qKkswTVuqdqr
 Vzdh59rZWzjKDVGd4MrxpNuK4kBNCI6rqu0U2awly5VMUOPTj/U4NL99sGviu4ksq0j8
 EPy4mkexa/Ba8Y8k7sn48QFMUJqiDyB1y++CPDFSDc09R7SxVyI92Z38zOYfyYUh8K03
 plfQ==
X-Gm-Message-State: AOAM531RHxY9lJ7V1uwZV7C/GHQRLFRi92qGWn9anaYB0MxBrd980GjB
 YwhKNBzIbX6EKLhd60dynPI=
X-Google-Smtp-Source: ABdhPJzLmeIqQTHA6MeglqkjmU4EFPVpkcgYNc2c5/cUJ5YjYamN2GOB/MsSzmpzONPYAXbtaoyCGw==
X-Received: by 2002:a17:90b:1d0e:: with SMTP id
 on14mr2743078pjb.119.1637312746092; 
 Fri, 19 Nov 2021 01:05:46 -0800 (PST)
Received: from localhost (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id e7sm1528013pgj.11.2021.11.19.01.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 01:05:45 -0800 (PST)
Date: Fri, 19 Nov 2021 19:05:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/4] powerpc/watchdog: Fix missed watchdog reset due to
 memory ordering race
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211110025056.2084347-1-npiggin@gmail.com>
 <20211110025056.2084347-2-npiggin@gmail.com>
 <0b0cffcb-c99a-bad5-5620-9f3ad154b61e@linux.ibm.com>
In-Reply-To: <0b0cffcb-c99a-bad5-5620-9f3ad154b61e@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1637312006.m6vfbmx01l.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Laurent Dufour's message of November 16, 2021 1:09 am:
> Le 10/11/2021 =C3=A0 03:50, Nicholas Piggin a =C3=A9crit=C2=A0:
>> It is possible for all CPUs to miss the pending cpumask becoming clear,
>> and then nobody resetting it, which will cause the lockup detector to
>> stop working. It will eventually expire, but watchdog_smp_panic will
>> avoid doing anything if the pending mask is clear and it will never be
>> reset.
>>=20
>> Order the cpumask clear vs the subsequent test to close this race.
>>=20
>> Add an extra check for an empty pending mask when the watchdog fires and
>> finds its bit still clear, to try to catch any other possible races or
>> bugs here and keep the watchdog working. The extra test in
>> arch_touch_nmi_watchdog is required to prevent the new warning from
>> firing off.
>>=20
>> Debugged-by: Laurent Dufour <ldufour@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kernel/watchdog.c | 41 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchd=
og.c
>> index f9ea0e5357f9..3c60872b6a2c 100644
>> --- a/arch/powerpc/kernel/watchdog.c
>> +++ b/arch/powerpc/kernel/watchdog.c
>> @@ -135,6 +135,10 @@ static void set_cpumask_stuck(const struct cpumask =
*cpumask, u64 tb)
>>   {
>>   	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
>>   	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
>> +	/*
>> +	 * See wd_smp_clear_cpu_pending()
>> +	 */
>> +	smp_mb();
>>   	if (cpumask_empty(&wd_smp_cpus_pending)) {
>>   		wd_smp_last_reset_tb =3D tb;
>>   		cpumask_andnot(&wd_smp_cpus_pending,
>> @@ -215,13 +219,44 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 =
tb)
>>  =20
>>   			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>>   			wd_smp_unlock(&flags);
>> +		} else {
>> +			/*
>> +			 * The last CPU to clear pending should have reset the
>> +			 * watchdog so we generally should not find it empty
>> +			 * here if our CPU was clear. However it could happen
>> +			 * due to a rare race with another CPU taking the
>> +			 * last CPU out of the mask concurrently.
>> +			 *
>> +			 * We can't add a warning for it. But just in case
>> +			 * there is a problem with the watchdog that is causing
>> +			 * the mask to not be reset, try to kick it along here.
>> +			 */
>> +			if (unlikely(cpumask_empty(&wd_smp_cpus_pending)))
>> +				goto none_pending;
>=20
> If I understand correctly, that branch is a security in case the code is =
not=20
> working as expected. But I'm really wondering if that's really needed, an=
d we=20
> will end up with a contention on the watchdog lock while this path should=
 be=20
> lockless, and I'd say that in most of the case there is nothing to do aft=
er=20
> grabbing that lock. Am I missing something risky here?

I'm thinking it should not hit very much because that first test

    if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {

I think it should not be true too often, it would mean a CPU has taken=20
two timer interrupts while another one has not taken any, so hopefully
that's pretty rare in normal operation.

Thanks,
Nick
