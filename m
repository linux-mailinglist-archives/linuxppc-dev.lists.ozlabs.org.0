Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC943E28CB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 12:39:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh2662Hy4z3dDh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 20:39:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GEzDGV4h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GEzDGV4h; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh25h4s6Qz30FD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 20:39:03 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d1so6526109pll.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 03:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=88W0lAvp0jwmzu1x9zXpNG3t1sQTUzSTr6wOIBY785I=;
 b=GEzDGV4hYjzA4lCnSPxqHV0yhACnH9mpQBNYtgI/sT/OnYaclVdJd11Xz+QMAwEgMY
 sDs1PPyWH+fJpv/oZw4K9B6V+shkctEecJ+/bv6X3jamVl7eXbE9tgmjxjuaKpvK3Qdx
 BaeINBW5Aq0F18El2dGgsj9V5Wjbr/3Z9edv+ntyzh4xjc29qs0kTJmvQ1xG559cfZ2d
 keG19TDaIjcYrE++ky5HeCrGPu4K/b6AAkUyDPe5/OrgjB65ixUjXekYkoblHkyJCvIS
 EWjkpxjUl0i+0n0rl3Y2hzdJz1f1JgK+H4ZAi4ylUxy4iiHnmYA0C3yz2Pl7rwLedUsP
 HlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=88W0lAvp0jwmzu1x9zXpNG3t1sQTUzSTr6wOIBY785I=;
 b=DyQ6yEhKYV6ZCkdlxpN/FjItl164EY9IogED95WHKwEAzzd/Uxq4GsAfZyfFnoFlGY
 0n8rIb4C1ucpacfIeG3Yo2ao2k5VhrXlByIE0xqzGYXMZf6K/qh06OleFCUI9Mj1I4wF
 RLur16mHFOWLOT3SAQ4CkI8MOpq4EEfLuM+FMYFXIRjfFE+a6eODBHLBF3K5Tnp7dgWb
 3XtcKiO+kriuZk5WxENwIwd8j/yF71V7Xv3gboo3np2c30P/fuT+8SonDqqDJBVCu1oP
 Y3dtcgwGuB3+/QAd/LbxCvpk8wYE0mNIuMhOlh/8R6twZmmopmRF2vRLHUTBiOU+6NYf
 LSEQ==
X-Gm-Message-State: AOAM530s1X3lxhwBsu/u56RRjw1ClUwomzV7J76E+Nf2Ym6nUfylWrtt
 2CNP0knLAx//iL0gLVpbXqs=
X-Google-Smtp-Source: ABdhPJwTnOhhPO7zfzz85sosQbFbOr3bSl5RbGkGOqtE9B0fBF8VMqQ0WniWiM3MReZ3y26IEVvkrQ==
X-Received: by 2002:a17:902:9042:b029:12c:c03:20e2 with SMTP id
 w2-20020a1709029042b029012c0c0320e2mr7943795plz.36.1628246340419; 
 Fri, 06 Aug 2021 03:39:00 -0700 (PDT)
Received: from localhost ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id o192sm10125805pfd.78.2021.08.06.03.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:39:00 -0700 (PDT)
Date: Fri, 06 Aug 2021 20:38:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 16/55] powerpc/64s: Implement PMU override command line
 option
To: kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-17-npiggin@gmail.com>
 <e7bb1311-3b50-dcc2-7fb0-1773558e9abc@linux.ibm.com>
In-Reply-To: <e7bb1311-3b50-dcc2-7fb0-1773558e9abc@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1628245966.h9u2e2m21l.astroid@bobo.none>
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

Excerpts from Madhavan Srinivasan's message of August 6, 2021 5:33 pm:
>=20
> On 7/26/21 9:19 AM, Nicholas Piggin wrote:
>> It can be useful in simulators (with very constrained environments)
>> to allow some PMCs to run from boot so they can be sampled directly
>> by a test harness, rather than having to run perf.
>>
>> A previous change freezes counters at boot by default, so provide
>> a boot time option to un-freeze (plus a bit more flexibility).
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   .../admin-guide/kernel-parameters.txt         |  7 ++++
>>   arch/powerpc/perf/core-book3s.c               | 35 +++++++++++++++++++
>>   2 files changed, 42 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
>> index bdb22006f713..96b7d0ebaa40 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -4089,6 +4089,13 @@
>>   			Override pmtimer IOPort with a hex value.
>>   			e.g. pmtmr=3D0x508
>>
>> +	pmu=3D		[PPC] Manually enable the PMU.
>=20
>=20
> This is bit confusing, IIUC, we are manually disabling the perf=20
> registration
> with this option and not pmu.
> If this option is used, we will unfreeze the
> MMCR0_FC (only in the HV_mode) and not register perf subsystem.

With the previous patch, this option un-freezes the PMU
(and disables perf).

> Since this option is valid only for HV_mode, canwe call it
> kvm_disable_perf or kvm_dis_perf.

It's only disabled for guests because it would require a bit
of logic to set pmcregs_in_use when we register our lppaca. We could
add that if needed, but the intention is for use on BML, not exactly
KVM specific.

I can add HV restriction to the help text. And we could rename the=20
option. free_run_pmu=3D or something?

Thanks,
Nick

>=20
>=20
>> +			Enable the PMU by setting MMCR0 to 0 (clear FC bit).
>> +			This option is implemented for Book3S processors.
>> +			If a number is given, then MMCR1 is set to that number,
>> +			otherwise (e.g., 'pmu=3Don'), it is left 0. The perf
>> +			subsystem is disabled if this option is used.
>> +
>>   	pm_debug_messages	[SUSPEND,KNL]
>>   			Enable suspend/resume debug messages during boot up.
>>
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-bo=
ok3s.c
>> index 65795cadb475..e7cef4fe17d7 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -2428,8 +2428,24 @@ int register_power_pmu(struct power_pmu *pmu)
>>   }
>>
>>   #ifdef CONFIG_PPC64
>> +static bool pmu_override =3D false;
>> +static unsigned long pmu_override_val;
>> +static void do_pmu_override(void *data)
>> +{
>> +	ppc_set_pmu_inuse(1);
>> +	if (pmu_override_val)
>> +		mtspr(SPRN_MMCR1, pmu_override_val);
>> +	mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);
>> +}
>> +
>>   static int __init init_ppc64_pmu(void)
>>   {
>> +	if (cpu_has_feature(CPU_FTR_HVMODE) && pmu_override) {
>> +		printk(KERN_WARNING "perf: disabling perf due to pmu=3D command line =
option.\n");
>> +		on_each_cpu(do_pmu_override, NULL, 1);
>> +		return 0;
>> +	}
>> +
>>   	/* run through all the pmu drivers one at a time */
>>   	if (!init_power5_pmu())
>>   		return 0;
>> @@ -2451,4 +2467,23 @@ static int __init init_ppc64_pmu(void)
>>   		return init_generic_compat_pmu();
>>   }
>>   early_initcall(init_ppc64_pmu);
>> +
>> +static int __init pmu_setup(char *str)
>> +{
>> +	unsigned long val;
>> +
>> +	if (!early_cpu_has_feature(CPU_FTR_HVMODE))
>> +		return 0;
>> +
>> +	pmu_override =3D true;
>> +
>> +	if (kstrtoul(str, 0, &val))
>> +		val =3D 0;
>> +
>> +	pmu_override_val =3D val;
>> +
>> +	return 1;
>> +}
>> +__setup("pmu=3D", pmu_setup);
>> +
>>   #endif
>=20
