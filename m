Return-Path: <linuxppc-dev+bounces-11767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EF7B45031
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 09:46:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ7h746Drz3bb6;
	Fri,  5 Sep 2025 17:46:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757058375;
	cv=none; b=N0z7fcIVmUr8Gy7n1WYFje60pJY3jdT3wd5hgJ+QjZseqHwdp5BCyqJ+5oA31nwVTFg66h+EUvVwmbEgBFhO38SY7728ibF1QMS3urJ4xe7lyi6AEPamwOTSW9qS6F+6BsivdW+ijnQ/F6f+1KaNke7NGpkB950K1EaCdBJ+MWTlnWlhHpEi6x7AF48N7+O3OOHOHTm144aaZ7jUOqRTaCTX9YbHX9Kn0dE6zyM+Qe8bL0AP9WFekZinw0VuCZou74fGCc4kvFbeqIf8m+xmOtXAA5IFBTxhtj/1IFQ3EDVoaR+ldeECNHxfHXr+B26yQpEyXcvC7GBzjOtw1fyHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757058375; c=relaxed/relaxed;
	bh=jdTr0sANZg3YvkZ81UCoQHkeuI5x7ADGpEJKdXOD4QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mABj379RBUQlq9hbzfpistAjffmXTkgrP25xIPDAAXYMd/PE2U+c9XF6jys0kssZ2e6ABEHCQRd8QqyJY/5TQYlFmnl0RmH+wNxIMxgQ4BxwVdqkvoSR9IdV2pJNymhQnwOTRzaAT5ydhbUGjLRcvQX3GOgUOdoyU3CI9sSUiK6Uo3iqtMFAnDRRTob6Czy9lvCIpHfFmxlI+527aBUp4HMDDFh3k9fGAmP9Ylh7iIq8Hjvvp+8WjG0LQtN6jHc9BxKqA4J1GK23tUauboBBAJiVVcwQH7+4t8k9Nw75UlfYl1AjeihhledkYDvpavUO8WXZ/pdnkEGjVrFmg9ofSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ7h55YtYz3bWX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 17:46:12 +1000 (AEST)
X-UUID: 397b25d28a2c11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:f87db68f-3c30-403e-8904-d7166b6f16d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:07aa7fe718078e46c5eacd4bb0c408a3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 397b25d28a2c11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 541260558; Fri, 05 Sep 2025 15:44:59 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 29A5AE008FA4;
	Fri,  5 Sep 2025 15:44:59 +0800 (CST)
X-ns-mid: postfix-68BA94FA-497226507
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 27E5DE008FA3;
	Fri,  5 Sep 2025 15:44:40 +0800 (CST)
Message-ID: <11bcb7cb-2169-479f-9247-a48e48e9c54e@kylinos.cn>
Date: Fri, 5 Sep 2025 15:44:39 +0800
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
 <20250903131733.57637-8-zhangzihuan@kylinos.cn>
 <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
 <52e322e5-2dd4-488c-a98e-3a4018f0c323@kylinos.cn>
 <CAJZ5v0g__9g_dfA3=4GVi351f4CKBegKkW9nU81j+Qu=2Hfg1Q@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0g__9g_dfA3=4GVi351f4CKBegKkW9nU81j+Qu=2Hfg1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/9/4 21:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Thu, Sep 4, 2025 at 12:38=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
>>
>> =E5=9C=A8 2025/9/3 21:45, Rafael J. Wysocki =E5=86=99=E9=81=93:
>>> On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kyli=
nos.cn> wrote:
>>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>>>> annotation for policy references. This reduces the risk of reference
>>>> counting mistakes and aligns the code with the latest kernel style.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>>>> ---
>>>>    drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
>>>>    1 file changed, 11 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu=
.c
>>>> index 99390ec1481f..f76594185fa2 100644
>>>> --- a/drivers/powercap/dtpm_cpu.c
>>>> +++ b/drivers/powercap/dtpm_cpu.c
>>>> @@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtp=
m)
>>>>    static void pd_release(struct dtpm *dtpm)
>>>>    {
>>>>           struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
>>>> -       struct cpufreq_policy *policy;
>>>>
>>>>           if (freq_qos_request_active(&dtpm_cpu->qos_req))
>>>>                   freq_qos_remove_request(&dtpm_cpu->qos_req);
>>>>
>>>> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
>>>> -       if (policy) {
>>>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
>>>> +               cpufreq_cpu_get(dtpm_cpu->cpu);
>>>> +
>>>> +       if (policy)
>>>>                   for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
>>>>                           per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D N=
ULL;
>>>>
>>>> -               cpufreq_cpu_put(policy);
>>>> -       }
>>>> -
>>>>           kfree(dtpm_cpu);
>>>>    }
>>>>
>>>> @@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cp=
u)
>>>>    static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>>>>    {
>>>>           struct dtpm_cpu *dtpm_cpu;
>>>> -       struct cpufreq_policy *policy;
>>>>           struct em_perf_state *table;
>>>>           struct em_perf_domain *pd;
>>>>           char name[CPUFREQ_NAME_LEN];
>>>> @@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dt=
pm *parent)
>>>>           if (dtpm_cpu)
>>>>                   return 0;
>>>>
>>>> -       policy =3D cpufreq_cpu_get(cpu);
>>>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
>>>> +               cpufreq_cpu_get(cpu);
>>>> +
>>>>           if (!policy)
>>>>                   return 0;
>>>>
>>>>           pd =3D em_cpu_get(cpu);
>>>> -       if (!pd || em_is_artificial(pd)) {
>>>> -               ret =3D -EINVAL;
>>>> -               goto release_policy;
>>>> -       }
>>>> +       if (!pd || em_is_artificial(pd))
>>>> +               return -EINVAL;
>>>>
>>>>           dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
>>>> -       if (!dtpm_cpu) {
>>>> -               ret =3D -ENOMEM;
>>>> -               goto release_policy;
>>>> -       }
>>>> +       if (!dtpm_cpu)
>>>> +               return -ENOMEM;
>>>>
>>>>           dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
>>>>           dtpm_cpu->cpu =3D cpu;
>>>> @@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm=
 *parent)
>>>>           if (ret < 0)
>>>>                   goto out_dtpm_unregister;
>>> So this change kind of goes against another recommendation given in c=
leanup.h:
>>>
>>>    * Lastly, given that the benefit of cleanup helpers is removal of
>>>    * "goto", and that the "goto" statement can jump between scopes, t=
he
>>>    * expectation is that usage of "goto" and cleanup helpers is never
>>>    * mixed in the same function. I.e. for a given routine, convert al=
l
>>>    * resources that need a "goto" cleanup to scope-based cleanup, or
>>>    * convert none of them.
>>
>> Should I replace all the memory allocation cleanups here with `__free`=
?
>> That would allow us to drop all the `goto`s, but since this function h=
as
>> quite a few of them, I=E2=80=99m concerned it might introduce new issu=
es. What=E2=80=99s
>> your recommendation?
> Frankly, don't use __free() in this code at all, at least for the time =
being.
>
> There is a problem with dropping the reference to policy at the end of
> __dtpm_cpu_setup() because that policy may be subsequently indirectly
> used in set_pd_power_limit() which calls
> freq_qos_update_request(&dtpm_cpu->qos_req, freq) and
> dtpm_cpu->qos_req->qos is policy->constraints, so using it will cause
> policy->constraints to be dereferenced in freq_qos_apply() which will
> crash and burn if the policy goes away in the meantime.  So AFAICS
> __dtpm_cpu_setup() shouldn't call cpufreq_cpu_put() at all and the
> policy should be released in pd_release() without acquiring a new
> reference to it.
>

Thanks a lot for the detailed explanation!


