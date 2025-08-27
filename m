Return-Path: <linuxppc-dev+bounces-11368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5593B37BC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 09:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBbph4H88z30Yb;
	Wed, 27 Aug 2025 17:32:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756272174;
	cv=none; b=CoPiU4WcBg2k1PRQEYD1VmHwoauoYr2AEjc2x/6wrua7zFlCMOz6cNxocBchPhQXXFB0T62ey8f0EnuyDmbK+cYH/MSypi0CgbmJjjzySSN6H+XH7SF/0lGXXxZh/ivj+xkyQWEuiwfVoOA5ZEdOo/2fhZF5g952ShAOIjDSwH6RTn7n5aWIkuXsWtVnK5XLL1AEwGhMhzdmCl+xavMXK4oPTMcYw8zciNwxIbLEAjbozuHx+2s8FJ/InG7uYL8T8AFUIpznDywxodIAl/rXQuHuIPua8M7J7na/TF+o17z2ef/KyUZ0VQTd3Osq+LtbY7QUCGUHeTHsKdlw8twvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756272174; c=relaxed/relaxed;
	bh=NDlRUXFSzOD8o9dRxqhPtKP8cvwp8unMAQ8DWdMPjx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ozvl9/MQKx3pu43U0/yPtjaZ5p5m3s0ILbAa17Z1ylyuzigcUKC6F19rB5Wclw4vODlGmElFyCNrTj5acXZ/rDiXK0hRKvZi+g7C/STjQ2PS6SPhAjvqFzLH0kkpnLLHj4MhLjoNgh6A686vrD0uqeNmr7BRjJYRopU/YEVRKw3dU3L5z0hUZQ6uKC75UnoLdzQs0HBFOfM/APcsT2U5cVjiXJbbdl+3IAQjE3znSfuAOhKbBFaJE9lZTeADyXm7AF5c2YWatGNJZjx3PkWtZuyd2yrP8d66TmuchrzJqHLCwEnvVHFTfUKxMbhfG+Raje26mF+RdDZ1bxyj1ThQwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBXwr0V2Cz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 15:22:50 +1000 (AEST)
X-UUID: b6af3eae830511f0b29709d653e92f7d-20250827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:6ea4852e-198b-4763-9082-b5b6a3a6dde7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:ff25b090511d28585eced737a980893b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b6af3eae830511f0b29709d653e92f7d-20250827
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1580791657; Wed, 27 Aug 2025 13:21:41 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id ADDAFE008FAB;
	Wed, 27 Aug 2025 13:21:40 +0800 (CST)
X-ns-mid: postfix-68AE95E4-5407809
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 0D64DE008FA3;
	Wed, 27 Aug 2025 13:21:25 +0800 (CST)
Message-ID: <773da273-4ab7-4672-b4d7-f9c560f3fccc@kylinos.cn>
Date: Wed, 27 Aug 2025 13:21:25 +0800
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
Subject: Re: [PATCH v2 15/18] powercap: dtpm_cpu: Use
 __free(put_cpufreq_policy) for policy reference
To: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
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
 <20250827035056.353772-1-zhangzihuan@kylinos.cn>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <20250827035056.353772-1-zhangzihuan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

=E5=9C=A8 2025/8/27 11:50, Zihuan Zhang =E5=86=99=E9=81=93:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>   drivers/powercap/dtpm_cpu.c | 24 +++++++-----------------
>   1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index 99390ec1481f..65117569d0f3 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -144,19 +144,16 @@ static int update_pd_power_uw(struct dtpm *dtpm)
>   static void pd_release(struct dtpm *dtpm)
>   {
>   	struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  =20
>   	if (freq_qos_request_active(&dtpm_cpu->qos_req))
>   		freq_qos_remove_request(&dtpm_cpu->qos_req);
>  =20
>   	policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
> -	if (policy) {
> +	if (policy)
>   		for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
>   			per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL;
>  =20
> -		cpufreq_cpu_put(policy);
> -	}
> -
>   	kfree(dtpm_cpu);
>   }
>  =20
> @@ -192,7 +189,7 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
>   static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>   {
>   	struct dtpm_cpu *dtpm_cpu;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>   	struct em_perf_state *table;
>   	struct em_perf_domain *pd;
>   	char name[CPUFREQ_NAME_LEN];
> @@ -207,16 +204,12 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm =
*parent)
>   		return 0;
>  =20
>   	pd =3D em_cpu_get(cpu);
> -	if (!pd || em_is_artificial(pd)) {
> -		ret =3D -EINVAL;
> -		goto release_policy;
> -	}
> +	if (!pd || em_is_artificial(pd))
> +		return -EINVAL;
>  =20
>   	dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
> -	if (!dtpm_cpu) {
> -		ret =3D -ENOMEM;
> -		goto release_policy;
> -	}
> +	if (!dtpm_cpu)
> +		return -ENOMEM;
>  =20
>   	dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
>   	dtpm_cpu->cpu =3D cpu;
> @@ -239,7 +232,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
>   	if (ret < 0)
>   		goto out_dtpm_unregister;
>  =20
> -	cpufreq_cpu_put(policy);
>   	return 0;
>  =20
>   out_dtpm_unregister:
> @@ -251,8 +243,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
>   		per_cpu(dtpm_per_cpu, cpu) =3D NULL;
>   	kfree(dtpm_cpu);
>  =20
> -release_policy:
> -	cpufreq_cpu_put(policy);
>   	return ret;
>   }
>  =20
I accidentally sent a duplicate patch in the series.
Please ignore the extra one, sorry for the noise.

