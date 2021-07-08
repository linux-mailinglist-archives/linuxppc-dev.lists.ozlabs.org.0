Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A33BFA8C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 14:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLGHz6zLHz3bmG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 22:46:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YlSg5KTL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YlSg5KTL; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLGHW46bQz300S
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 22:45:59 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d12so5364694pfj.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jul 2021 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=V9F9nU6MbirMGKo2lzCFkdt6YjO4+T9M0GAqL4st5Zw=;
 b=YlSg5KTLns4/Qz5wajNfrxRNcTtoQ5Jl7jDZZ8dCrtRuMoAi+WhE9NMrncKXJtZU7U
 MN3ekSTUvnqBT+gbt+YEWbvvO+XaytYyI9CruRDbPyACkiFatEFAQSsqXMj1WP8aI31K
 EY6zjek/+/cHVdY+N6IetLxdW+WUTyvC6QxuuvHG+YaYX43i1IwXwlIJMI7RjLoyO0fR
 Rxxb0RPJ76EwXRHGiNEgE1MChDTYw2mXVqZc1wbCMZI7inE2v9TXuUHzri1L7ktyn77g
 1f3jA13z+V/BcjrMosHdmkfzmNqO8bfFYN7Q0hXjRdnkmxOf80840wjVraLeCQYMcBXi
 5hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=V9F9nU6MbirMGKo2lzCFkdt6YjO4+T9M0GAqL4st5Zw=;
 b=cUbZrLEgJBNzPNGrIuhuoICTsxsh6Cyv6FzbNW5LJip8P0R9NZyLKAGZD8cBNPD0IK
 WsbvrRqYGbOnivCSbeiAVVhcygz/g7/aklX1hXJvFkbvYLcwmaGy7Jv2K0YBrH2M5w9F
 MmUP3MUZNWCBWWeutinnr+vVU7Vw0zC1PKzSYUarxJ+LFi26T0l32fg5i5WpmPtXwxD6
 uTybkKzQ/icXp74nICaBVuoSFRjXhsXQIBaaMI7tXYLigSFYbLUpL/1pLnNb+eUEE/Lm
 d1DyszqYkh79WD9VSTW70rEfSqGJHtWklkpqp0Em/5SEC3sL59RD2z5KBF2jTU4F0EIg
 Yy1A==
X-Gm-Message-State: AOAM530Jeo2lBg3bVz4dAokhLy8FeCPbQ4j5VjjxB56arGYqcjWLjT25
 EtnJ7h6COL4WNy6OviT+0rc=
X-Google-Smtp-Source: ABdhPJxzzRZ518bBwLsflS/TK5EJCPaRfOj6cR9e7GiPVRZuLq8P25e3BS1Wypre4supFoO/8GwObA==
X-Received: by 2002:a05:6a00:1a0b:b029:31a:25cf:3dbd with SMTP id
 g11-20020a056a001a0bb029031a25cf3dbdmr28132323pfv.57.1625748355755; 
 Thu, 08 Jul 2021 05:45:55 -0700 (PDT)
Received: from localhost (14-203-186-173.tpgi.com.au. [14.203.186.173])
 by smtp.gmail.com with ESMTPSA id e4sm3519813pgi.94.2021.07.08.05.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:45:55 -0700 (PDT)
Date: Thu, 08 Jul 2021 22:45:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 10/43] powerpc/64s: Always set PMU control registers
 to frozen/disabled when not in use
To: kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-11-npiggin@gmail.com>
 <c607e40c-5334-e8b1-11ac-c1464332e01a@linux.ibm.com>
 <1625185125.n8jy7yqojr.astroid@bobo.none>
In-Reply-To: <1625185125.n8jy7yqojr.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1625745913.qxusux97eo.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of July 2, 2021 10:27 am:
> Excerpts from Madhavan Srinivasan's message of July 1, 2021 11:17 pm:
>>=20
>> On 6/22/21 4:27 PM, Nicholas Piggin wrote:
>>> KVM PMU management code looks for particular frozen/disabled bits in
>>> the PMU registers so it knows whether it must clear them when coming
>>> out of a guest or not. Setting this up helps KVM make these optimisatio=
ns
>>> without getting confused. Longer term the better approach might be to
>>> move guest/host PMU switching to the perf subsystem.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   arch/powerpc/kernel/cpu_setup_power.c | 4 ++--
>>>   arch/powerpc/kernel/dt_cpu_ftrs.c     | 6 +++---
>>>   arch/powerpc/kvm/book3s_hv.c          | 5 +++++
>>>   arch/powerpc/perf/core-book3s.c       | 7 +++++++
>>>   4 files changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kerne=
l/cpu_setup_power.c
>>> index a29dc8326622..3dc61e203f37 100644
>>> --- a/arch/powerpc/kernel/cpu_setup_power.c
>>> +++ b/arch/powerpc/kernel/cpu_setup_power.c
>>> @@ -109,7 +109,7 @@ static void init_PMU_HV_ISA207(void)
>>>   static void init_PMU(void)
>>>   {
>>>   	mtspr(SPRN_MMCRA, 0);
>>> -	mtspr(SPRN_MMCR0, 0);
>>> +	mtspr(SPRN_MMCR0, MMCR0_FC);
>>=20
>> Sticky point here is, currently if not frozen, pmc5/6 will
>> keep countering. And not freezing them at boot is quiet useful
>> sometime, like say when running in a simulation where we could calculate
>> approx CPIs for micro benchmarks without perf subsystem.
>=20
> You even can't use the sysfs files in this sim environment? In that case
> what if we added a boot option that could set some things up? In that=20
> case possibly you could even gather some more types of events too.

What if we added this to allow sim environments to run PMC5/6 and=20
additionally specify MMCR1 without userspace involvement?

Thanks,
Nick

---
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3=
s.c
index af8a4981c6f6..454771243529 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2425,8 +2425,24 @@ int register_power_pmu(struct power_pmu *pmu)
 }
=20
 #ifdef CONFIG_PPC64
+static bool pmu_override =3D false;
+static unsigned long pmu_override_val;
+static void do_pmu_override(void *data)
+{
+	ppc_set_pmu_inuse(1);
+	if (pmu_override_val)
+		mtspr(SPRN_MMCR1, pmu_override_val);
+	mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);
+}
+
 static int __init init_ppc64_pmu(void)
 {
+	if (cpu_has_feature(CPU_FTR_HVMODE) && pmu_override) {
+		printk(KERN_WARNING "perf: disabling perf due to pmu=3D command line opt=
ion.\n");
+		on_each_cpu(do_pmu_override, NULL, 1);
+		return 0;
+	}
+
 	/* run through all the pmu drivers one at a time */
 	if (!init_power5_pmu())
 		return 0;
@@ -2448,4 +2464,23 @@ static int __init init_ppc64_pmu(void)
 		return init_generic_compat_pmu();
 }
 early_initcall(init_ppc64_pmu);
+
+static int __init pmu_setup(char *str)
+{
+	unsigned long val;
+
+	if (!early_cpu_has_feature(CPU_FTR_HVMODE))
+		return 0;
+
+	pmu_override =3D true;
+
+	if (kstrtoul(str, 0, &val))
+		val =3D 0;
+
+	pmu_override_val =3D val;
+
+	return 1;
+}
+__setup("pmu=3D", pmu_setup);
+
 #endif
