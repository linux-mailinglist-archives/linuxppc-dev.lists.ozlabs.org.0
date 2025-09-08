Return-Path: <linuxppc-dev+bounces-11875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC30B48819
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 11:17:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL1ZF1xlZz2yrB;
	Mon,  8 Sep 2025 19:17:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757323061;
	cv=none; b=JsYv2+QI8yFRTTG6IhlK52IbxPjh9oIUZuDZWW5iTj0fHXh2nv35Ct2MYih8sJ5XzDGq2vwJ9z5XJUoE3tVioeC5he0hKMkvDaLNol6cm39J6+7mhGR1tUiXrcYzs+E9GuAtXBUO07gDqN92/smUiYkIPY+DTNc43JBvRzG5tYp/qsBqHdIvNv7pqEWMH5nHZtCEYZQ7mKFg0e0eqlnVAkJYloIA5XwpsA5/vgZ3Kq2fWomxK1nQH9Wf8GtfjBsFiUIrFjEWO2uqpWX3jJvtq3YWQrI2mo45ASZD06YCFmRP2umEO4ETZ6gWzq80JjGyvpW8UwGFVxYnqQy2QEjiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757323061; c=relaxed/relaxed;
	bh=c1rTwCX1gGB8QQVNRS7ouYjjzfXA/53kPUrPTUN5UGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCcpa0IAAkxFsIFINC8wI+izQkvMgR9ZU0v3ptSHXYXcJUT/C39QJv1S/Kl2Q977SwRo80kOhbR5QKv05EaoibRQbX7rccPh+sVzeYHTVxPAz+TBfQvkKYpGu0/hbd6F29eD7ZnX5vZOMbjhwCnuuZ/zb8E3IbP/PG1mrBeBzX+017BXmGQUIMdInxt0ydaujm3dC+Iwqpxq3hj7XHMIIO8+TC677GGCofOzb43xyRz703d61mLvbT6gQa3KHaNosNmQMhxZ0Q/vanqnOTplTbRvbWAkm9ORlaoOAlGyY64R0dDR3pf391LwXJ6UxFg6/BHagREBjKNplt8LbnHKUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL1ZC67zQz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 19:17:39 +1000 (AEST)
X-UUID: 82469cbe8c9411f0b29709d653e92f7d-20250908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:362d1ff7-467a-43a9-935c-6d62cfb7ac08,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:6f743686b177cd0b2ef1f647a16908d9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82469cbe8c9411f0b29709d653e92f7d-20250908
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 532145651; Mon, 08 Sep 2025 17:16:31 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 3BE43E008FA3;
	Mon,  8 Sep 2025 17:16:31 +0800 (CST)
X-ns-mid: postfix-68BE9EEF-2433684
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 03BACE008FA3;
	Mon,  8 Sep 2025 17:16:21 +0800 (CST)
Message-ID: <6683fb5a-64f4-433e-a22b-153b01dfa572@kylinos.cn>
Date: Mon, 8 Sep 2025 17:16:21 +0800
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
Subject: Re: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup
 helper
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
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
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
 <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/9/6 04:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Fri, Sep 5, 2025 at 3:24=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   drivers/acpi/processor_thermal.c | 52 +++++++++++++++++-------------=
--
>>   1 file changed, 27 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor=
_thermal.c
>> index 1219adb11ab9..460713d1414a 100644
>> --- a/drivers/acpi/processor_thermal.c
>> +++ b/drivers/acpi/processor_thermal.c
>> @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
>>          return 0;
>>   }
>>
>> -static int cpu_has_cpufreq(unsigned int cpu)
>> +static bool cpu_has_cpufreq(unsigned int cpu)
>>   {
>> -       struct cpufreq_policy *policy;
>> -
>>          if (!acpi_processor_cpufreq_init)
>>                  return 0;
>>
>> -       policy =3D cpufreq_cpu_get(cpu);
>> -       if (policy) {
>> -               cpufreq_cpu_put(policy);
>> -               return 1;
>> -       }
>> -       return 0;
>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
>> +
>> +       return policy !=3D NULL;
>>   }
>>
>>   static int cpufreq_get_max_state(unsigned int cpu)
> The changes above are fine and can be sent as a separate patch.
>
>> @@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>>          return reduction_step(cpu);
>>   }
>>
>> +static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acp=
i_processor *pr)
>> +{
>> +       unsigned long max_freq;
>> +       int ret;
>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
>> +
>> +       if (!policy)
>> +               return false;
>> +
>> +       max_freq =3D (policy->cpuinfo.max_freq *
>> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction=
_pctg)) / 100;
>> +
>> +       ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
>> +       if (ret < 0) {
>> +               pr_warn("Failed to update thermal freq constraint: CPU=
%d (%d)\n",
>> +         pr->id, ret);
>> +       }
> But this silently fixes a bug in the original code which needs to be
> documented with a Fixes: tag (and it would be better to fix the bug
> separately before the using the __free()-based cleanup TBH) and
> introduces some whitespace breakage.

Thanks!

 =C2=A0I=E2=80=99ll follow your advice and handle the Fixes tag and white=
space issues.


>> +
>> +       return true;
>> +}
>> +
>>   static int cpufreq_set_cur_state(unsigned int cpu, int state)
>>   {
>> -       struct cpufreq_policy *policy;
>>          struct acpi_processor *pr;
>> -       unsigned long max_freq;
>> -       int i, ret;
>> +       int i;
>>
>>          if (!cpu_has_cpufreq(cpu))
>>                  return 0;
>> @@ -120,20 +134,8 @@ static int cpufreq_set_cur_state(unsigned int cpu=
, int state)
>>                  if (unlikely(!freq_qos_request_active(&pr->thermal_re=
q)))
>>                          continue;
>>
>> -               policy =3D cpufreq_cpu_get(i);
>> -               if (!policy)
>> +               if (!cpufreq_update_thermal_limit(i, pr))
>>                          return -EINVAL;
>> -
>> -               max_freq =3D (policy->cpuinfo.max_freq *
>> -                           (100 - reduction_step(i) * cpufreq_thermal=
_reduction_pctg)) / 100;
>> -
>> -               cpufreq_cpu_put(policy);
>> -
>> -               ret =3D freq_qos_update_request(&pr->thermal_req, max_=
freq);
>> -               if (ret < 0) {
>> -                       pr_warn("Failed to update thermal freq constra=
int: CPU%d (%d)\n",
>> -                               pr->id, ret);
>> -               }
>>          }
>>          return 0;
>>   }
>> --

