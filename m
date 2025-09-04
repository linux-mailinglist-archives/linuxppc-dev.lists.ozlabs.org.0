Return-Path: <linuxppc-dev+bounces-11703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB479B434CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 09:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHWzc4SMZz2ywR;
	Thu,  4 Sep 2025 17:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756972652;
	cv=none; b=HKuREXYMI73HYNISuemhjz//ukegXbE4Ptr40SmYJyufeNNbjqwt9ReOCi7X0/AkRGj47tr8536mrp4eFC6YUjqWoSLfpnLWrV1gJmb9CswfV+WFVzyVr0CA/qKf+MEuRhBR7Z12iXDxbMbJDZ5IUWXp8IztHaWRzQPF02hPA3Yit3Ee5gv78oWs1hCS7M2+6ZjB66O2hq262eiIEj4cudfsPam6cyAI5cXPsJfPywmSbKhbFzOS6vEDXLBFsvR9BK7MC/oK8EE+Ue4QUPMOwsBKYWfRqoMSihTD9FX6JRyDK7tCEo0bDpxAZ+gNOQmjcKVHKbhW52eNCkqWWhd0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756972652; c=relaxed/relaxed;
	bh=qLgdaicy4xT/ZCFA/qfIr/ZB22HD/WJky9fL8YP+pUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9kle61G/OfCiD+PkIY+XBUKl5HIMSPFFvyYj2MipD05b4+f1v+I7S3ysEe4ID9UnMu83Me61YH5rOGCGuAJvFJ1kyLBJDusiW7IVk9gLpxakKIIeS1OhbIyAN9/cp6n8dR/YNLBqQNPRTcBU1WEKHcbn6HjPMtgXYWwhkaoWKo1eisTmiOgBz1vQFxNiCu+tXR4Xd+FqU9jCNQgb7OXfcncmaL2Fzp1QvBVSLnMoK+tD8kvfM9uEaGVqLAgHgF6lu6qadD86rXeS5h2w9Re+UZDyMZ/HslUcmMbceVP9+gy0zuQUTR4kk6Q5iWM2ciBBjKoin0V2cdAqLVNhf3OMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHWzb0dwKz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 17:57:29 +1000 (AEST)
X-UUID: a2cd01a4896411f0b29709d653e92f7d-20250904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:b7ccec76-f4fe-45e8-bab3-dc73c52616ae,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:0d8ddf5d75b8f48b58bb293ff09316f9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a2cd01a4896411f0b29709d653e92f7d-20250904
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 582611713; Thu, 04 Sep 2025 15:56:16 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 86A2BE008FA5;
	Thu,  4 Sep 2025 15:56:16 +0800 (CST)
X-ns-mid: postfix-68B94620-384750805
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 1766FE008FA2;
	Thu,  4 Sep 2025 15:56:08 +0800 (CST)
Message-ID: <861a6077-a7da-4899-b971-a003d6e2290e@kylinos.cn>
Date: Thu, 4 Sep 2025 15:56:08 +0800
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
Subject: Re: [PATCH v4 10/10] PM: EM: Use scope-based cleanup helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
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
 <20250903131733.57637-11-zhangzihuan@kylinos.cn>
 <34b5e01e-2f4a-4d57-93ca-ab4549681b17@kernel.org>
 <CAJZ5v0hisM6vfdNXaY7qCGtcMb1FENGxiBb=E=tkqDbRyjs=bA@mail.gmail.com>
 <037855bf-c878-4794-b145-266a36302fc3@kernel.org>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <037855bf-c878-4794-b145-266a36302fc3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/9/3 21:43, Krzysztof Kozlowski =E5=86=99=E9=81=93:
> On 03/09/2025 15:41, Rafael J. Wysocki wrote:
>>>>   em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_=
state *table)
>>>>   {
>>>>        struct em_perf_domain *pd =3D dev->em_pd;
>>>> -     struct cpufreq_policy *policy;
>>>> +     struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D N=
ULL;
>>> This is not really correct coding style. Please read how to use
>>> cleanup.h expressed in that header. You should have here proper
>>> constructor or this should be moved. Or this should not be __free()..=
.
>> I gather that this is what you mean (quoted verbatim from cleanup.h)
>>
>>   * Given that the "__free(...) =3D NULL" pattern for variables define=
d at
>>   * the top of the function poses this potential interdependency probl=
em
>>   * the recommendation is to always define and assign variables in one
>>   * statement and not group variable definitions at the top of the
>>   * function when __free() is used.
>>
>> and thanks for pointing this out!
>
> ... and the only exception would be if there is no single constructor,
> but multiple (in if() block). That's not the case here, I think.
>
> Best regards,
> Krzysztof


Sorry, I didn=E2=80=99t fully understand this earlier. In v3 I split the
definition and assignment mainly because the CPU value was obtained
later, so I thought I couldn=E2=80=99t initialize it in one go at the top=
 of
the function. Honestly, it was also for =E2=80=9Cprettier=E2=80=9D style.

After looking at the code Rafael just committed, I realized I can
simply define and assign the variable later in one line, without
needing to separate them. I=E2=80=99ll fix this in the next version.

Thanks for pointing it out!



