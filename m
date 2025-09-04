Return-Path: <linuxppc-dev+bounces-11721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48047B438F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 12:39:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHbZG0GYXz2yrp;
	Thu,  4 Sep 2025 20:39:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756982357;
	cv=none; b=iSjpc0jNU0kWW0rz83ysYgVsezjNX5vzQ1i2O4GPEuaIjpyzkyWA3YjPYS3gBaXIPpPaybcNYI2RR3KGpguQydctWY8YIRN7e9wefjx0aWiBhdaTk+PE+L2w0r9MjaUBQhc5cg6zuezRw2r7c3X5aN+NYT5+l+ICvey7gCAZojTxNRhQs37GutpHZaUbKcbH1DukIqzYMqGrlQIaWd6a9lCmOaaYri4QlVeOnWqA8TeOVrEGOyIRpQZn4fhswbhtbc8+U59QVE2VPwDObHTXlZ+NLOiWvVtEIApn232Jadx3tXoFvdK3Edt5JEZGP1NaqvBJ/AJNkBltCpOG5kb6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756982357; c=relaxed/relaxed;
	bh=aSWeFTnmHxNL9NzQg+0RRcK61UxESBXBESIGSVxbF0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/CmQz5GXZ76ZegGjk05+Mz+hB9fva9G00WptiDaBzuYwTjisvBk+Qfum3GV2d4nh/yIM7vFVX8KTNEOFkR/gVtc6OiM5C06iY5RZ98T7UbLMAQzeNGc5mQJLlsF5iDonbbIOz0MeRGi8cQJJIr6JkjMT4zhfyjNqZ4W3hARmjHTnfWT1NzSwca/tGrmb+t20j5q0pPSVGM9q0ToTT2i7y5vzYijjRrVqnsle/6SbBlYCByDRd4fXuhQr9QD8FdesLCFREYuEIQgT1yzbhejuSdrr4QFpp5QA9hCbJlDWJRpg+Iqva0JTO5o4Je01+9ZdMtidqlYQZI3FswE0SoE9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHbZD2K38z2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 20:39:15 +1000 (AEST)
X-UUID: 3d5fbc1e897b11f0b29709d653e92f7d-20250904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:300f2fa7-17a5-4d38-96a3-11fd4189ac0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:8818228a5c537eaf9504e99b0c50a8d8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3d5fbc1e897b11f0b29709d653e92f7d-20250904
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1160067433; Thu, 04 Sep 2025 18:38:05 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 93A19E008FA5;
	Thu,  4 Sep 2025 18:38:04 +0800 (CST)
X-ns-mid: postfix-68B96C0C-3265371312
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 0174FE008FA2;
	Thu,  4 Sep 2025 18:37:54 +0800 (CST)
Message-ID: <52e322e5-2dd4-488c-a98e-3a4018f0c323@kylinos.cn>
Date: Thu, 4 Sep 2025 18:37:54 +0800
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
Subject: Re: [PATCH v4 07/10] powercap: dtpm_cpu: Use scope-based cleanup
 helper
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-8-zhangzihuan@kylinos.cn>
 <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/9/3 21:45, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
>>   1 file changed, 11 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
>> index 99390ec1481f..f76594185fa2 100644
>> --- a/drivers/powercap/dtpm_cpu.c
>> +++ b/drivers/powercap/dtpm_cpu.c
>> @@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtpm)
>>   static void pd_release(struct dtpm *dtpm)
>>   {
>>          struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
>> -       struct cpufreq_policy *policy;
>>
>>          if (freq_qos_request_active(&dtpm_cpu->qos_req))
>>                  freq_qos_remove_request(&dtpm_cpu->qos_req);
>>
>> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
>> -       if (policy) {
>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
>> +               cpufreq_cpu_get(dtpm_cpu->cpu);
>> +
>> +       if (policy)
>>                  for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
>>                          per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL=
;
>>
>> -               cpufreq_cpu_put(policy);
>> -       }
>> -
>>          kfree(dtpm_cpu);
>>   }
>>
>> @@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
>>   static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>>   {
>>          struct dtpm_cpu *dtpm_cpu;
>> -       struct cpufreq_policy *policy;
>>          struct em_perf_state *table;
>>          struct em_perf_domain *pd;
>>          char name[CPUFREQ_NAME_LEN];
>> @@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm=
 *parent)
>>          if (dtpm_cpu)
>>                  return 0;
>>
>> -       policy =3D cpufreq_cpu_get(cpu);
>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
>> +               cpufreq_cpu_get(cpu);
>> +
>>          if (!policy)
>>                  return 0;
>>
>>          pd =3D em_cpu_get(cpu);
>> -       if (!pd || em_is_artificial(pd)) {
>> -               ret =3D -EINVAL;
>> -               goto release_policy;
>> -       }
>> +       if (!pd || em_is_artificial(pd))
>> +               return -EINVAL;
>>
>>          dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
>> -       if (!dtpm_cpu) {
>> -               ret =3D -ENOMEM;
>> -               goto release_policy;
>> -       }
>> +       if (!dtpm_cpu)
>> +               return -ENOMEM;
>>
>>          dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
>>          dtpm_cpu->cpu =3D cpu;
>> @@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *=
parent)
>>          if (ret < 0)
>>                  goto out_dtpm_unregister;
> So this change kind of goes against another recommendation given in cle=
anup.h:
>
>   * Lastly, given that the benefit of cleanup helpers is removal of
>   * "goto", and that the "goto" statement can jump between scopes, the
>   * expectation is that usage of "goto" and cleanup helpers is never
>   * mixed in the same function. I.e. for a given routine, convert all
>   * resources that need a "goto" cleanup to scope-based cleanup, or
>   * convert none of them.


Should I replace all the memory allocation cleanups here with `__free`?
That would allow us to drop all the `goto`s, but since this function has
quite a few of them, I=E2=80=99m concerned it might introduce new issues.=
 What=E2=80=99s
your recommendation?

Thanks!

>> -       cpufreq_cpu_put(policy);
>>          return 0;
>>
>>   out_dtpm_unregister:
>> @@ -251,8 +245,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *=
parent)
>>                  per_cpu(dtpm_per_cpu, cpu) =3D NULL;
>>          kfree(dtpm_cpu);
>>
>> -release_policy:
>> -       cpufreq_cpu_put(policy);
>>          return ret;
>>   }
>>
>> --

