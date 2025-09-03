Return-Path: <linuxppc-dev+bounces-11647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE578B4117D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 02:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGkbh1H2Kz2xlM;
	Wed,  3 Sep 2025 10:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756860752;
	cv=none; b=CUk0jTkyi2zrlEuTc5yyC2BOvd/nq44ae888cx+ZARboFccVQg5bzyRKZcDpXiHXtyjt/FgY5pq5UAR/7vJuZqQfpHfTi/dcw3ITP1FKwAr4DGTgWbtD88+qOtbToslbCRcoYrZ/Y+v3H0lABvLy0tBuHKFPpbxt7evGEAysRB5N6ldmnVTLwO7vAPL5FYXedG+ApwaHDkjijuyplrcMlNrF1JxkqAsemvUs7aXl6Lgs8GQzdGkbJjLp/f/mrWm9TBgKhDxuBTaQuDctdsKGhwTnkj9F7KPNSYLluZXFIeHPKzepazdQCJqcZEn6ybptbmk92MNrmtgUt0dcMkQldg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756860752; c=relaxed/relaxed;
	bh=zxqA4w29q+rwRyQ2/Ht97x0u7kuCwxko6jKzWp02gGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIqyHuNZJFhAdbX0WRwFxmQdu8Rsp62Ihz0iv1bL9ScBypdIQlhRKwWm8pkV6uAZTI/1ELtHePaOUfuEPqD1yMFP1GvmjEz+lZPfNJkWQc1aebi2BUSZ5A3Xa57PxsxtFVuo5VgcU4C07BsBPJJNSksdlMbJWGCNScSaOtW25UfhIlwyOrmz+pe/sTWILa81RzQI66IjH5CS3XPqHg5HK3ezczotc/ngF6g0DB4v529wJOXWO4z389+sH5hXopGPF761hJ8Gw75E4N5RJRafBT5cWss9I01tKEEZ7GloDZ8zK1kr0z2jee5dENeD7rDJapGoua8VWvx+iWSd73Gv0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGkbf2K6Wz2xcG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 10:52:29 +1000 (AEST)
X-UUID: 1864b9c6886011f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:149e317a-1aff-43d6-90c9-1a5d04dd57b0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:461f970947de3929c2a541614ce8e229,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1864b9c6886011f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1164660955; Wed, 03 Sep 2025 08:51:15 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 22D4BE008FA3;
	Wed,  3 Sep 2025 08:51:15 +0800 (CST)
X-ns-mid: postfix-68B79102-9412696
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 28EDFE008FA2;
	Wed,  3 Sep 2025 08:51:07 +0800 (CST)
Message-ID: <40706b1f-e23c-417b-b3e1-2dc839828588@kylinos.cn>
Date: Wed, 3 Sep 2025 08:51:06 +0800
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
Subject: Re: [PATCH v3 03/12] cpufreq: intel_pstate: Use scope-based cleanup
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
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-4-zhangzihuan@kylinos.cn>
 <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
 <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn>
 <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/9/2 19:47, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Tue, Sep 2, 2025 at 12:33=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
>>
>> =E5=9C=A8 2025/9/1 23:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
>>> On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kyl=
inos.cn> wrote:
>>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>>>> annotation for policy references. This reduces the risk of reference
>>>> counting mistakes and aligns the code with the latest kernel style.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>>>> ---
>>>>    drivers/cpufreq/intel_pstate.c | 8 +++-----
>>>>    1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_=
pstate.c
>>>> index f366d35c5840..4abc1ef2d2b0 100644
>>>> --- a/drivers/cpufreq/intel_pstate.c
>>>> +++ b/drivers/cpufreq/intel_pstate.c
>>>> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(str=
uct cpufreq_policy *policy,
>>>>
>>>>    static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
>>>>    {
>>>> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D=
 cpufreq_cpu_get(cpudata->cpu);
>>>>
>>>> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
>>>>           if (!policy)
>>>>                   return false;
>>> The structure of the code is intentional here and there's no reason t=
o
>>> change it.
>>
>> Got it. Thanks for clarifying.
>>
>> So for this case the current structure is intentional -
> Note that I'm talking about this particular change only.  The other
> change in the $subject patch is fine.
>
>> should I also avoid similar changes in other drivers?
> That depends on who maintains them, which is why I wanted you to split
> the patch into smaller changes in the first place.
>
> My personal view is that code formatting changes, which effectively is
> what this particular one is, are pointless unless they make the code
> much easier to follow.


UnderStood, Thanks!


