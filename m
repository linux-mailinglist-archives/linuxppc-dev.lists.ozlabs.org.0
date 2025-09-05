Return-Path: <linuxppc-dev+bounces-11768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32BAB4506F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 09:55:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ7v009hRz3bcy;
	Fri,  5 Sep 2025 17:55:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757058939;
	cv=none; b=bt8l4uHQDt0CouZs6yvZozSB2L0tMl/iW7mWFyRTUyy5zI4/plbo5kukrSPEMwbGPEQyGMyllaOoQhksxgiKzwaMahx+Ohjmd5Z1TemC5TEwdH2gw9OOUE+oLIZ5WJRMV0uRD1ZnRuLPfFCu+2noPgF3vzoZ/EPdb0j2AyG+BOcVP2HqA9kyNppzVRtx2jk5puVp99je48q6H2hDnT5WTu7oWScBtEk+e/4+91B7qe3p8iA42k5UVk23nl3+e3eddbws0zaWhWDgBQG0NHChtKdCRScIlifejc3TDsohHjGd4qKHpQVhWma2Cd1e/8k5s7RNWpafTjR7E7TBvDJRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757058939; c=relaxed/relaxed;
	bh=U7VBhWYPVvktoXZ1dLXIUVka8/6TNbmCz4fkqfpuIvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqfdCogVkB1raMTZb/fAutiiOvpWtySWy93lQ6P9M89YnJ7eiRyfQy2s4t5TlhI0knMu/cq63CRTEEG9DEOT8BoeD0WOprfZzyG/tUS+rS6/w2VH4bdkb3D996ayLe4pH/vYGumSQI1Bt+wxv+JRxnaWsdlhAO5ezNY+o8cYfKGb/v40xqPPfY2jsUeB9K24P7nRhV0qpCxxR6O+I2q8kgvG/fUeW/rEjKAL2nBshgDr7tjQVRSg77II7/NoMqv7Y4tC8pRQ0poVVSHKXhlrp4mPkcRZrgiY/Ps0FHX94ba8bLGapQo6FLYijTRqbVm1h9vP2jGNQ2G218heZQAzjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ7ty4p6Lz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 17:55:38 +1000 (AEST)
X-UUID: 8b7cd9b08a2d11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:b8911e54-e0aa-40d7-9e56-019791a9cc88,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:1038342e134dfa48eabc61cf9e37c597,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b7cd9b08a2d11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1912680162; Fri, 05 Sep 2025 15:54:26 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 49564E008FA7;
	Fri,  5 Sep 2025 15:54:26 +0800 (CST)
X-ns-mid: postfix-68BA9732-140429547
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 33213E008FA4;
	Fri,  5 Sep 2025 15:54:22 +0800 (CST)
Message-ID: <2ccca29e-4d5f-44fa-bfc8-d77c659bc9f3@kylinos.cn>
Date: Fri, 5 Sep 2025 15:54:21 +0800
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
Subject: Re: [PATCH v4 09/10] thermal/drivers/ti-soc-thermal: Use scope-based
 cleanup helper
To: Andreas Kemnade <andreas@kemnade.info>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Alim Akhtar
 <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
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
 <20250903131733.57637-10-zhangzihuan@kylinos.cn>
 <20250905085726.2bc6fcb4@akair>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <20250905085726.2bc6fcb4@akair>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/9/5 14:57, Andreas Kemnade =E5=86=99=E9=81=93:
> Am Wed,  3 Sep 2025 21:17:32 +0800
> schrieb Zihuan Zhang <zhangzihuan@kylinos.cn>:
>
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 13 ++++--------=
-
>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/driv=
ers/thermal/ti-soc-thermal/ti-thermal-common.c
>> index 0cf0826b805a..37d06468913a 100644
>> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
>> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
>> @@ -27,7 +27,6 @@
>>  =20
>>   /* common data structures */
>>   struct ti_thermal_data {
>> -	struct cpufreq_policy *policy;
>>   	struct thermal_zone_device *ti_thermal;
>>   	struct thermal_zone_device *pcb_tz;
>>   	struct thermal_cooling_device *cool_dev;
>> @@ -218,6 +217,7 @@ int ti_thermal_register_cpu_cooling(struct ti_band=
gap *bgp, int id)
>>   {
>>   	struct ti_thermal_data *data;
>>   	struct device_node *np =3D bgp->dev->of_node;
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq=
_cpu_get(0);
>>  =20
> this looks as it changes the lifecycle from the device lifetime to just
> this function...


I thought policy was only used in this function, so I moved it here.

Thanks for clarifying the lifecycle issue.

>>   	/*
>>   	 * We are assuming here that if one deploys the zone
>> @@ -234,19 +234,17 @@ int ti_thermal_register_cpu_cooling(struct ti_ba=
ndgap *bgp, int id)
>>   	if (!data)
>>   		return -EINVAL;
>>  =20
>> -	data->policy =3D cpufreq_cpu_get(0);
>> -	if (!data->policy) {
>> +	if (!policy) {
>>   		pr_debug("%s: CPUFreq policy not found\n", __func__);
>>   		return -EPROBE_DEFER;
>>   	}
>>  =20
>>   	/* Register cooling device */
>> -	data->cool_dev =3D cpufreq_cooling_register(data->policy);
>> +	data->cool_dev =3D cpufreq_cooling_register(policy);
> and it is passed on to something living beyond this function. I see no
> _get(policy) in cpufreq_cooling_register().
> Am I missing something?

This indeed causes a problem.

Sure,=C2=A0 I will drop the patchset.

Thanks!

> Regards,
> Andreas

