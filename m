Return-Path: <linuxppc-dev+bounces-11372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024DB37E35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 10:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBdgl5J0tz3bV6;
	Wed, 27 Aug 2025 18:56:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756285011;
	cv=none; b=QkBjmYQQ4pRnvICBlMHXbbLKbjUYZ5KXACet6CUC7YjO7uEVoZXpqOio42bpuxm1h14mV39EwCACu2/VUSlmpet23DyKcBTdG7pP8OJgxO4gCjFWeIITdCoHeJHMUDF9+AI1HpxyupMzmdwOHckO0+nDeLQBfKH6k8e3APMFxXe5vakYm9Y5WexH8ZzUmgNN09CK6W6bZO2eMd/m3Z4SvY8R5UD0AztjM1qQEg2zNmBPothtmMiS1eBNYtTmLNGDZGe7Wao0YGWFnWXktP4k/y+JkbWeJPbftqGhv7fxVcA2cKNIyXmVUnHAFdeTagWxSbwu6r2NKgQ5Vi0PNO/5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756285011; c=relaxed/relaxed;
	bh=cm7jRPMBPf4sf2l068Yy96KaDTgweWGkolU8ivKz92s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnCiJoKW1tiPj9XM5yPSV6543kwqV53OiNboYfL1TIqd+XBRsc6HqflXvaLOPQ3u8XsXONv8vazO2E8Q9NKWoj5JwU4DfuKT6e3/7PAzMckli3CYvnzvxKcTmqZdcFibhzdQCMDl0so4vK3UIdB9DFUNMthSw+0LFWuRkL4YtiERwTNRHxcaO/9Z009P73oRBLOPwwaArjM5vbeoS1jOKrwQbMKbSCNMBYpTGL0U/j6Xs8Gy+I7zZqJS1IHp+h9IDokKarK+5bQfdceq+oD3C+zOhe7R0YW5aI8ZjLJyebV1kWa+Bq4pO6Szl6FKbCk3mDb6XkXw5kEB/LDZiZF5tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBdgk0DQzz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 18:56:48 +1000 (AEST)
X-UUID: 9b4b7a88832311f0b29709d653e92f7d-20250827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2338019c-bb8d-48a6-93ba-58ea29929953,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:b5736a825b981a30f067edd239e3633a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9b4b7a88832311f0b29709d653e92f7d-20250827
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 175818411; Wed, 27 Aug 2025 16:55:40 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 97C48E008FAC;
	Wed, 27 Aug 2025 16:55:39 +0800 (CST)
X-ns-mid: postfix-68AEC80B-467347751
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 74564E008FA3;
	Wed, 27 Aug 2025 16:55:21 +0800 (CST)
Message-ID: <57016487-0fee-4821-9cd5-d6e5fe80a65d@kylinos.cn>
Date: Wed, 27 Aug 2025 16:55:20 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] arm64: topology: Use __free(put_cpufreq_policy)
 for policy reference
To: Ben Horgan <ben.horgan@arm.com>, "Rafael J . wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Markus Mayer
 <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-2-zhangzihuan@kylinos.cn>
 <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

=E5=9C=A8 2025/8/27 16:30, Ben Horgan =E5=86=99=E9=81=93:
> Hi Zihuan,
>
> On 8/27/25 03:31, Zihuan Zhang wrote:
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   arch/arm64/kernel/topology.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology=
.c
>> index 5d07ee85bdae..e3cb6d54f35b 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
>>   		 */
>>   		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>>   		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMP=
LE_EXP_MS))) {
>> -			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
>> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
> Based on the guidance, in include/linux/cleanup.h, I would expect the
> assignment to be done on this line.
>
> "...the recommendation is to always define and assign variables in one
>   * statement and not group variable definitions at the top of the
>   * function when __free() is used."


The reason I split the assignment into multiple lines is because=20
scripts/checkpatch.pl gave a warning about the line being too long.

But if you think a single-line assignment is better, I will modify it=20
accordingly.

>>   			int ref_cpu;
>>  =20
>> +			policy =3D cpufreq_cpu_get(cpu);
>>   			if (!policy)
>>   				return -EINVAL;
>>  =20
>>   			if (!cpumask_intersects(policy->related_cpus,
>> -						housekeeping_cpumask(HK_TYPE_TICK))) {
>> -				cpufreq_cpu_put(policy);
>> +						housekeeping_cpumask(HK_TYPE_TICK)))
>>   				return -EOPNOTSUPP;
>> -			}
>>  =20
>>   			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
>>   				if (ref_cpu =3D=3D start_cpu) {
>> @@ -329,8 +328,6 @@ int arch_freq_get_on_cpu(int cpu)
>>   					break;
>>   			}
>>  =20
>> -			cpufreq_cpu_put(policy);
>> -
>>   			if (ref_cpu >=3D nr_cpu_ids)
>>   				/* No alternative to pull info from */
>>   				return -EAGAIN;
> Thanks,
>
> Ben
>

