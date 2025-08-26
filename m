Return-Path: <linuxppc-dev+bounces-11272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4FDB35142
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 03:53:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9rLC1Lwtz3d1B;
	Tue, 26 Aug 2025 11:53:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756168433;
	cv=none; b=iue1Ubb24B6mqdnconeQ41D9Qm+/6C/X8BClAkqX0M6cvnjQb7DeXgW34k1hWtstF6t4GFc1fvM0sz/S4FmYZ/ETkArgA/k8Lw8EjGdlYXfPf4Dy2HZpc6/e+2cNxPAJS+OrdQB2I2AdHsvbqq+oB9C0zgW/9vlvx8jEffF5SADcGS6Ilxxwgg5DLuWyTEXdqE/BOiq7cvGEucJF7Ls/u0rxIVYMHZqgFY/CctpAuNgcH2mAXH4iU+MO+0I6+5rYV5Vh5bHVymGx/JRW/7lrjwezKHODOUKTGhI/zUWpwxTU4PIFi7EG/tBY6x7fG/xj25R43fvs3/HPs+NtwRSJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756168433; c=relaxed/relaxed;
	bh=XT4pOKw6nF6FL5OY1g3It/B3VzTyCW9u3yGY3nXUjRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqpbWUP82F3Q9VWyqhXYTo8JNL+qV5jxaHMBN5Mya2HsVJAThOcWKay+Mj8KpTrJTadbTOx13Pf82pBjb9ebqse82s93oHGMIThZpnxoG1SXCiyp3cTo0lGG71Y1x1W/L6DLxQemj8xnsICUdOq/15OCN3fB7661957Eq9Ni45MlcWXc4nEqrwSpbrrT/ogLe8UO/nfZV5kC1Q/Sxi/mHb6k9+wbib1/Ez703DRN23mWW1SiXieGj4+MI2WN8fg1QNAWR0PzIgRI3UmpsRRb0wHQHK/42157C/cFjoux3fO1l2brZbcN0hZBLbpWzyIBXbjL/zzQjbLqUVDJy4oKJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9pYq6M7lz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 10:33:51 +1000 (AEST)
X-UUID: 2d68e01a821411f0b29709d653e92f7d-20250826
X-CID-CACHE: Type:Local,Time:202508260830+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7270a5f9-40e3-4977-a28e-c6ba5a72d0d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:73c0f838f0cb681a0e66fa356d1f9674,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2d68e01a821411f0b29709d653e92f7d-20250826
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1699495493; Tue, 26 Aug 2025 08:32:42 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id DEE60E008FA2;
	Tue, 26 Aug 2025 08:32:40 +0800 (CST)
X-ns-mid: postfix-68AD00A8-3459444
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 3F6F9E008FA2;
	Tue, 26 Aug 2025 08:32:33 +0800 (CST)
Message-ID: <e91bec22-3e7a-4092-b44b-6a8946e6dea4@kylinos.cn>
Date: Tue, 26 Aug 2025 08:32:32 +0800
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
Subject: Re: [PATCH v1] cpufreq: use __free() for all cpufreq_cpu_get()
 references
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
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
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
 <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/8/25 22:13, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Mon, Aug 25, 2025 at 11:29=E2=80=AFAM Zihuan Zhang <zhangzihuan@kyli=
nos.cn> wrote:
>> This patch replaces all remaining uses of cpufreq_cpu_get() with
>> the __free(cpufreq_cpu_put) annotation.
>>
>> Motivation:
>> - Ensures automatic cleanup of policy references when they go out of s=
cope,
>>    reducing the risk of forgetting to call cpufreq_cpu_put() on early =
return
>>    or error paths.
>> - Brings the code in line with the latest kernel coding style and best
>>    practices for managing reference-counted objects.
>> - No functional changes are introduced; behavior remains the same,
>>    but reference counting is now safer and easier to maintain.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   arch/arm64/kernel/topology.c                  |  9 +++----
>>   arch/x86/kvm/x86.c                            | 10 ++++----
>>   drivers/acpi/processor_thermal.c              | 13 ++++------
>>   drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
>>   drivers/cpufreq/cppc_cpufreq.c                |  4 +---
>>   drivers/cpufreq/intel_pstate.c                |  3 +--
>>   drivers/cpufreq/longhaul.c                    |  3 +--
>>   drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
>>   drivers/cpufreq/powernv-cpufreq.c             |  6 ++---
>>   drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
>>   drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
>>   drivers/devfreq/governor_passive.c            | 19 ++++-----------
>>   drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
>>   drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
>>   drivers/powercap/dtpm_cpu.c                   | 24 ++++++-----------=
--
>>   drivers/thermal/imx_thermal.c                 |  7 ++----
>>   .../ti-soc-thermal/ti-thermal-common.c        |  5 +---
>>   kernel/power/energy_model.c                   |  7 ++----
>>   18 files changed, 40 insertions(+), 93 deletions(-)
> This changes different pieces of code maintained by different people
> and the changes are not interdependent AFAICS, so better send it as a
> series of separate patches.
>
> Thanks!

Thanks for the suggestion.

I agree, splitting it into a series will make the review much clearer.


