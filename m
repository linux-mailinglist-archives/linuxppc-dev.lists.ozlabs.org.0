Return-Path: <linuxppc-dev+bounces-11403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEACFB391B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 04:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cC57l4HGsz3bb6;
	Thu, 28 Aug 2025 12:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756348451;
	cv=none; b=dYOVHtu/Rehn8gc1Gn4Un/nhPIkDNTTvgR1v9H18ef2U+MA1nTdBg0zyk3vi/3oEqxREsVj5cbu9vj7S04QO4nzF0G+yr+iinLNEuEcYBN6SO1I4Op8WAlf+UkS/J/GeOPR5hCvCBgXJlMYq7VebBysA2ONSOdQ4D1HbWAXGl4JzYtR4bjEPBvATvtb+mNpcoBRuim/Lag8lRLt6fX9BRSpCsedJAtx9wutl/T85P42NqW1B2IQ5FwdPRDTw797kPBiI1k2H+lsJKHBFgyBdsRKAGRj9vUfxR0Gg5QwG5J59klmeWkrCAGBv5iT7hoJrWeFy5Gc3QQcJV0e1+8EziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756348451; c=relaxed/relaxed;
	bh=dqLsXv2XpWWEpQrxrT6S6Kl2zparFOPKVK8ZyEs6XGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUgPeRCNZ/jmcAdZ0eKG4Ly0sfd4qVMZHRHa1kz+Mks2CSFbnxyCPrAM1p3Q6fQGuEYIokEjFAAZblYYK1TyrQOXYGmmr1RT8PjqHREsGi9Yz0mWpnR4TRgQ2GLaf40gMOwUTISQL2FjO1StCkZScbuBXIYpDIG3P8XJvXjds3ZvfpfPMKXJCgD9QI8eDh0JaoCPAvC0TUziP4UZ2GibUMgT6G0v9akgCqg0hyIItKOPCbzutLFsVzSkadUD+x194ENuZyJ4iZnpC4Uou1WtfWkvNGmxQoHpUDbuzuiz1EjjTRsS/lkc0IU47b9+eOIy5c0e/Jy+57+FnEU5rXD5+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cC57j69PYz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 12:34:08 +1000 (AEST)
X-UUID: 5053b84483b711f0b29709d653e92f7d-20250828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9e7721f3-4def-4494-ae6b-e8e5dd0438e3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:ab9379ea25ec926fdd1c492817d92794,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5053b84483b711f0b29709d653e92f7d-20250828
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1305374640; Thu, 28 Aug 2025 10:32:59 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 5ABE6E008FAE;
	Thu, 28 Aug 2025 10:32:59 +0800 (CST)
X-ns-mid: postfix-68AFBFDB-172902359
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id ADF7BE008FAB;
	Thu, 28 Aug 2025 10:32:47 +0800 (CST)
Message-ID: <6f6c1e35-101d-4ef1-ac6e-5db337ccdd84@kylinos.cn>
Date: Thu, 28 Aug 2025 10:32:46 +0800
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
To: Sudeep Holla <sudeep.holla@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-2-zhangzihuan@kylinos.cn>
 <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
 <1756341899099493.57.seg@mailgw.kylinos.cn>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <1756341899099493.57.seg@mailgw.kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/8/27 17:17, Sudeep Holla =E5=86=99=E9=81=93:
> On Wed, Aug 27, 2025 at 09:30:13AM +0100, Ben Horgan wrote:
>> Hi Zihuan,
>>
>> On 8/27/25 03:31, Zihuan Zhang wrote:
>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>>> annotation for policy references. This reduces the risk of reference
>>> counting mistakes and aligns the code with the latest kernel style.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>>> ---
>>>   arch/arm64/kernel/topology.c | 9 +++------
>>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topolog=
y.c
>>> index 5d07ee85bdae..e3cb6d54f35b 100644
>>> --- a/arch/arm64/kernel/topology.c
>>> +++ b/arch/arm64/kernel/topology.c
>>> @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
>>>   		 */
>>>   		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>>>   		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAM=
PLE_EXP_MS))) {
>>> -			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
>>> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>> Based on the guidance, in include/linux/cleanup.h, I would expect the
>> assignment to be done on this line.
>>
>> "...the recommendation is to always define and assign variables in one
>>   * statement and not group variable definitions at the top of the
>>   * function when __free() is used."
>>
> Agreed. I did something similar recently and there was a code path wher=
e
> variable wasn't initialised and ended up with freeing unassigned pointe=
r.
> So it is more than just a recommendation sometimes.
>
Thanks a lot for your suggestions.

We are also considering introducing a WITH_CPUFREQ_POLICY wrapper to=20
encapsulate the cpufreq_cpu_get/put usage, so that the release order=20
won=E2=80=99t be accidentally changed.

Link:=20
https://lore.kernel.org/all/874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.=
cn/

Do you have any suggestions or preferences on this direction?



