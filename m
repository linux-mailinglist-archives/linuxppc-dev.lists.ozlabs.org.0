Return-Path: <linuxppc-dev+bounces-11465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B019B3B37B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 08:33:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCpPY1v06z2xnM;
	Fri, 29 Aug 2025 16:33:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756449217;
	cv=none; b=cxMkj1Hv1X7kdNb2CfvaBNng8jx8sgAYn3VEtHPtMDpzK6IqNT3VCqBbwF8oDnHXP43K2dyZLKIiERgxuaL9bVex49RPzIccKiaBNtCP3e1PG3bSuqeprJNwnwMVYNrVv3sTM2ZfXt7o+JU/e/vfSIl4rVupQahqPBiXmtIbGKwiHqEbGF38PqjcChCj7sz38L7KjP5KwGE12TmoDzWvAp7JUp6zWbPQ1SbEcz68a+sIVAqXB3W62rwMTUxykHgIVbhvxd8/KBY41SZTavcQfgLdJe7x1oKIWO0Ut2U4ZIOF1jdEh5o0sguZnHRdnfnsc0vy/ZUtCKaRcnmoGH2ZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756449217; c=relaxed/relaxed;
	bh=Kst+61R8WKCK7sqJxMvcA3ZByeIORdO40H2gwXSWcj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlksmL65Fm2KxE9CF4Vn9epCNAhBxPoyCOylY/HUfhEkPxPWnEFXoZ2EcIp71lDrD0em/aZecpzA3Q5+RlVgHdOzvN8JFooQYLbPEGashFtncEdcBvsU1Uw6KYAvYz7C3cFXSDeDDhA5+p9U6rJorfAR4s0dWLd5LSXAq3x/0g6LL4DQHy9AXd6+DuD3uueI3H2Jn0pmKLpEeg/tdvooNXzrGYimggINcpW4JOxs5waOTee4QwYkOvNZJBNX+sGdi1fuYkrqRLoLJZJvXC0txFTW3pfanLZINUzRqgYUa7ZJW4r6Ie674cf9QtGIR1P70Nv9x6IKAEDioyWZUzkPSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCpPW5lP4z2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 16:33:35 +1000 (AEST)
X-UUID: ecb2216884a111f0b29709d653e92f7d-20250829
X-CID-CACHE: Type:Local,Time:202508291416+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:bc5c578d-29f2-4d5e-8a48-f352afb9ad98,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:363845aa8f825743d29eadcc6fd84d5d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ecb2216884a111f0b29709d653e92f7d-20250829
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 616214303; Fri, 29 Aug 2025 14:32:24 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id DFAA2E008FA6;
	Fri, 29 Aug 2025 14:32:23 +0800 (CST)
X-ns-mid: postfix-68B14976-48111815
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 0777CE008FA4;
	Fri, 29 Aug 2025 14:32:16 +0800 (CST)
Message-ID: <5601fe46-6574-4a9b-8fd5-cab4af8dd390@kylinos.cn>
Date: Fri, 29 Aug 2025 14:32:16 +0800
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
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
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
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
 <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
 <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
 <20250829062624.jalqqsigs7hanf7i@vireshk-i7>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <20250829062624.jalqqsigs7hanf7i@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/8/29 14:26, Viresh Kumar =E5=86=99=E9=81=93:
> On 29-08-25, 14:16, Zihuan Zhang wrote:
>> Thanks for applying the patch!
>>
>> I=E2=80=99ve been thinking further =E2=80=94 instead of using __free d=
irectly, maybe we
>> could introduce a small macro wrapper around it to make the release sc=
ope
>> more controllable and consistent.
>>
>> Link:
>> https://lore.kernel.org/all/6174bcc8-30f5-479b-bac6-f42eb1232b4d@kylin=
os.cn/
>>
>> Do you think this would be a better approach, or should we just stick =
with
>> the current use of __free?
> Lets keep it simple for now and use __free directly. And keep this
> similar with other parts of the kernel.


Got it. Thanks!


