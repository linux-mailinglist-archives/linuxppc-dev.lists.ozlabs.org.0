Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AE74462F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 12:46:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlzHw4lfDz3bjJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 22:46:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lh2IVbr7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lh2IVbr7; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlzHF4dc2z2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 22:46:15 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id f5so8136381pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=v/9rSOtBUk1U6jL8bf8WC/L8nGiMlFG3fN1ElMXtP/A=;
 b=lh2IVbr7KeNxM4rEiPHlsTYzCq34c1L7fFmXV6BVh+PvwyqJIJ0V3gZu+d8LcpejEE
 3b+lBrNYAWAWYco5BNBEcoxssN3EDvg2BUsJxGZ+KvK3LIb9PgmVTExVvxc5x/jaAJ+O
 QFjuZ9HNV8zMFvdvxi4Pm5Agh0K5z6F6j5Nma52jeR2RCtcZVOMeqWOyDMYGPW96Fj5o
 hP8PU8re4xOfh82vtKEHQbLQYtb0kEmhAVTepvCKqFpLC4zL2kXa2UO3F7MAgr16LtJY
 zBF5kxbUEGpt/tHfjCll035/fi5VyOigYCF3A1JlZh2pmp82crQ88OLMt25pH7UB/d/Z
 aCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=v/9rSOtBUk1U6jL8bf8WC/L8nGiMlFG3fN1ElMXtP/A=;
 b=sk2GYmh6Jd1fHxiaU7SUbcm2vLxy2z6qfT60kNHFAR21lBn5n0w/Ih1BSNswn7UA7U
 07w1dHUXqx58nDOiDMCfAx/VYJIE6No7K+5wWDE7G2owBRvlteS6TXmEu0xcOtJl1QdG
 +g3/nySkxREkNh2c11eaYVCakjs11Sb8u/liFEEGWepi/E4IUY8nXPJ8KukIre5eh/3c
 uS+nRhPZwN5AXWQMcvKwxfQbJ6L7MrfbH2d7umllgCQDUzguf1YgM4GP4umMZyBdYA55
 UqoZphFVBIcJxqL7VmmOUmJLH71N0vHShOr5Gy8W2YV+vmdNAbCICepYg7gUCDrQ+/a0
 AkpQ==
X-Gm-Message-State: AOAM530WV/pRxvQcnNrwvnj/gvqiIp4W//dlXM6larUhadmVSJICprz+
 7qx9tQ/5mNyoywxOxpGrwEGN+YTKQZM=
X-Google-Smtp-Source: ABdhPJzUtEnVXGj9Geuh/MmLSb0LFWz2rGR0yBcIkbHiV6PQoctxU5O66awTyORenP9uylZYnN+0PA==
X-Received: by 2002:a63:be4b:: with SMTP id g11mr44235303pgo.46.1636112772302; 
 Fri, 05 Nov 2021 04:46:12 -0700 (PDT)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id i2sm7069274pfa.34.2021.11.05.04.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 04:46:12 -0700 (PDT)
Date: Fri, 05 Nov 2021 21:46:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/5] powerpc/watchdog: Fix missed watchdog reset due to
 memory ordering race
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211104161057.1255659-1-npiggin@gmail.com>
 <20211104161057.1255659-2-npiggin@gmail.com>
 <e060e154-a807-d087-a80f-a802a858c13e@linux.ibm.com>
In-Reply-To: <e060e154-a807-d087-a80f-a802a858c13e@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1636112623.v4srs2ivuv.astroid@bobo.none>
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

Excerpts from Laurent Dufour's message of November 5, 2021 7:20 pm:
> Le 04/11/2021 =C3=A0 17:10, Nicholas Piggin a =C3=A9crit=C2=A0:
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
>>   arch/powerpc/kernel/watchdog.c | 36 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 35 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchd=
og.c
>> index f9ea0e5357f9..be80071336a4 100644
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
>> @@ -215,13 +219,39 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 =
tb)
>>  =20
>>   			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>>   			wd_smp_unlock(&flags);
>> +		} else {
>> +			/*
>> +			 * The last CPU to clear pending should have reset the
>> +			 * watchdog, yet we find it empty here. This should not
>> +			 * happen but we can try to recover and avoid a false
>> +			 * positive if it does.
>> +			 */
>> +			if (WARN_ON_ONCE(cpumask_empty(&wd_smp_cpus_pending)))
>> +				goto none_pending;
>=20
> I run a stress on my victim node on top of this patch and hit that warnin=
g:
>=20
> [  C475] ------------[ cut here ]------------
> [  C475] WARNING: CPU: 475 PID: 0 at=20
> /home/laurent/src/linux-ppc/arch/powerpc/kernel/watchdog.c:260=20
> wd_smp_clear_cpu_pending+0x320/0x4b0
> [  C475] Modules linked in: rpadlpar_io rpaphp xt_tcpudp iptable_filter=20
> ip_tables x_tables xfs pseries_rng rng_core vmx_crypto gf128mul be2net fu=
se=20
> btrfs blake2b_generic libcrc32c xor zstd_compress lzo_compress raid6_pq=20
> dm_service_time crc32c_vpmsum lpfc crc_t10dif crct10dif_generic crct10dif=
_common=20
> dm_mirror dm_region_hash dm_log dm_multipath scsi_dh_rdac scsi_dh_alua au=
tofs4
> [  C475] CPU: 475 PID: 0 Comm: swapper/475 Kdump: loaded Not tainted=20
> 5.15.0-rc2-ppc-bz192129+ #72
> [  C475] NIP:  c00000000003d710 LR: c00000000003d478 CTR: c00000000003e2e=
0
> [  C475] REGS: c00006b16026f420 TRAP: 0700   Not tainted  (5.15.0-rc2-ppc=
-bz192129+)
> [  C475] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22000222  XER=
: 20000000
> [  C475] CFAR: c00000000003d480 IRQMASK: 3
> [  C475] GPR00: c00000000003e3bc c00006b16026f6c0 c000000001b28700 000000=
0000000800
> [  C475] GPR04: 0000000000000000 0000000000000800 0000000000000800 000000=
0000000000
> [  C475] GPR08: 0000000000000000 0000000000000000 00000000000000f8 00013f=
06986272e7
> [  C475] GPR12: c00000000003e2e0 c000000007d3df00 0000000000000000 000000=
001f043b60
> [  C475] GPR16: c00006b1601b7b00 0000000000000000 c00000000003e2e0 000000=
0000000001
> [  C475] GPR20: 0000347411d4cf28 c00007adbdb0a898 0000000000000001 000000=
0000000000
> [  C475] GPR24: 0000000000000000 0000000000000003 c000000001b6d7d0 00013f=
0698627d84
> [  C475] GPR28: c000000001bd05c8 c000000001bd05b8 c000000001bd06c8 000000=
00000001db
> [  C475] NIP [c00000000003d710] wd_smp_clear_cpu_pending+0x320/0x4b0
> [  C475] LR [c00000000003d478] wd_smp_clear_cpu_pending+0x88/0x4b0
> [  C475] Call Trace:
> [  C475] [c00006b16026f6c0] [0000000000000001] 0x1 (unreliable)
> [  C475] [c00006b16026f770] [c00000000003e3bc] watchdog_timer_fn+0xdc/0x5=
a0
> [  C475] [c00006b16026f840] [c000000000245a4c] __hrtimer_run_queues+0x49c=
/0x700
> [  C475] [c00006b16026f8f0] [c000000000246c20] hrtimer_interrupt+0x110/0x=
310
> [  C475] [c00006b16026f9a0] [c0000000000292f8] timer_interrupt+0x1e8/0x5a=
0
> [  C475] [c00006b16026fa00] [c000000000009a00] decrementer_common_virt+0x=
210/0x220
> [  C475] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
> [  C475] NIP:  c0000000000e5dd0 LR: c000000000c18f04 CTR: 000000000000000=
0
> [  C475] REGS: c00006b16026fa70 TRAP: 0900   Not tainted  (5.15.0-rc2-ppc=
-bz192129+)
> [  C475] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22000824  XER=
: 20000000
> [  C475] CFAR: 0000000000000c00 IRQMASK: 0
> [  C475] GPR00: 0000000000000000 c00006b16026fd10 c000000001b28700 000000=
0000000000
> [  C475] GPR04: 0000000000000000 0000000000000000 0000000000000000 000000=
0000000000
> [  C475] GPR08: 0000000000000000 0000000000000000 0000000000000000 000000=
0000000001
> [  C475] GPR12: 000000000000ffff c000000007d3df00 0000000000000000 000000=
001f043b60
> [  C475] GPR16: 0000000000000000 0000000000000000 0000000000000000 000000=
0000000000
> [  C475] GPR20: 0000000000000000 0000000000000000 0000000000000000 c00000=
0001a46cd0
> [  C475] GPR24: c000000001b68e38 000034738d859946 0000000000000000 000000=
0000000001
> [  C475] GPR28: 0000000000000000 0000000000000001 c000000001472360 c00000=
0001472368
> [  C475] NIP [c0000000000e5dd0] plpar_hcall_norets_notrace+0x18/0x2c
> [  C475] LR [c000000000c18f04] check_and_cede_processor.part.2+0x24/0x70
> [  C475] --- interrupt: 900
> [  C475] [c00006b16026fd10] [c00007adbdb0a880] 0xc00007adbdb0a880 (unreli=
able)
> [  C475] [c00006b16026fd70] [c000000000c194f4] dedicated_cede_loop+0x174/=
0x200
> [  C475] [c00006b16026fdb0] [c000000000c15b2c] cpuidle_enter_state+0x3ac/=
0x6d0
> [  C475] [c00006b16026fe20] [c000000000c15ef0] cpuidle_enter+0x50/0x70
> [  C475] [c00006b16026fe60] [c0000000001a7f9c] call_cpuidle+0x4c/0x90
> [  C475] [c00006b16026fe80] [c0000000001a84f0] do_idle+0x310/0x3c0
> [  C475] [c00006b16026ff00] [c0000000001a8948] cpu_startup_entry+0x38/0x5=
0
> [  C475] [c00006b16026ff30] [c00000000005fb5c] start_secondary+0x2bc/0x2f=
0
> [  C475] [c00006b16026ff90] [c00000000000d254] start_secondary_prolog+0x1=
0/0x14
> [  C475] Instruction dump:
> [  C475] 48eb7049 60000000 e8610068 4bfffee4 392d0918 7c20492a 482c54f1 6=
0000000
> [  C475] 4bfffe4c 60000000 60000000 60000000 <0fe00000> fb210078 fb410080=
 fb610088
> [  C475] irq event stamp: 0
> [  C475] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [  C475] hardirqs last disabled at (0): [<c00000000014342c>]=20
> copy_process+0x76c/0x1e00
> [  C475] softirqs last  enabled at (0): [<c00000000014342c>]=20
> copy_process+0x76c/0x1e00
> [  C475] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [  C475] ---[ end trace 6e8311d1692d057b ]---
>=20
> I guess there is a possible race here between watchdog_timer_interrupt() =
and=20
> another CPU watchdog_smp_panic().

Hmm, yeah of course there would be. May have to just remove that warn.

Thanks,
Nick

