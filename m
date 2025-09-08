Return-Path: <linuxppc-dev+bounces-11874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DCB48809
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 11:14:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL1V94q4Fz2yPS;
	Mon,  8 Sep 2025 19:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757322849;
	cv=none; b=bpDGG0s/9MziWZnRbaGmvwaNM2+t0EHcXCARlNr0apkVlWsoFH+8Rjvbm0dsZvUZKt0wTu4QntLBVuykFG4fFByaEWVYy3td5sqX9Wff8cx4FGhmMRawihfnyH2po+AyZqFWTLxiR6z5zpBh9YR38F9QLYl3XYytj0mbqR61MCZigzb10xm4DDmyESmVkGXtA9WiitJ2mB9bpyBu6SnXPpc6CDHp33qeNEgukjXg1+H8riP3Tdv8n2V29QsgK7RpIF+ydLJPmRgrgVx0HOoCQ7p4qNDOG8655oVQ3zUzGjM5aALJMWYcn2y47dlOs3GpidT4mSuXDqXFYGI2NL+aGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757322849; c=relaxed/relaxed;
	bh=GS6lLyogcUyWt2QWCP3u/jPoGcNZrF6hU9Q0eIOZE10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qj3wi35r/NF/rUCYm3Z6qyM3O0wvT8S6wHgsvQhZ9VwSaJJX+Y1x4mVqWhY6bTkWSDHdevJKuoqU3x/xNZcInt+doJ3GueacfhjMd8C7Yk5jRisul8T/qCHi43iQt7vHEDj3L/u74Ti47pefa6fNP+LQRfa/rSIiLgBpbW8ZU9chvBKP5xIT8GWtqGSuDCBGWH+dIwtbpfu0xeidQag6Yc4AjprWEhWLcFe4XN7CfHD5FPPVBI6J1/EdRaUb7pWlLV2qFvMn6HNUGPWvCQ2HYp+qErBkZWLE9dpXn/tCAZkh+Tng2wXXlzcKVppuOYV/0bNoiBpSjPDmTtrd3gOD+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL1V801mPz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 19:14:06 +1000 (AEST)
X-UUID: ff62280e8c9311f0b29709d653e92f7d-20250908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:e2fab22a-c7aa-4216-90ca-404e6fb63c6d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:046415f91e77839f7ce3c5f8880d4853,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ff62280e8c9311f0b29709d653e92f7d-20250908
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2046176838; Mon, 08 Sep 2025 17:12:52 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id A0BDEE008FA7;
	Mon,  8 Sep 2025 17:12:51 +0800 (CST)
X-ns-mid: postfix-68BE9E13-43449476
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 8B40BE008FA3;
	Mon,  8 Sep 2025 17:12:38 +0800 (CST)
Message-ID: <a968c6da-265a-405c-8f79-cf0474c80bc5@kylinos.cn>
Date: Mon, 8 Sep 2025 17:12:37 +0800
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
Subject: Re: [PATCH v5 0/6] cpufreq: use __free() for all cpufreq_cpu_get()
 references
To: Borislav Petkov <bp@alien8.de>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
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
 <20250905174928.GFaLsiqKV36JDowX94@fat_crate.local>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <20250905174928.GFaLsiqKV36JDowX94@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/9/6 01:49, Borislav Petkov =E5=86=99=E9=81=93:
> On Fri, Sep 05, 2025 at 09:24:07PM +0800, Zihuan Zhang wrote:
>> This patchset converts all remaining cpufreq users to rely on the
>> __free(put_cpufreq_policy) annotation for policy references, instead o=
f
>> calling cpufreq_cpu_put() manually.
> Sep 01 Zihuan Zhang ( :8.6K|) [PATCH v3 00/12] cpufreq: use __free() fo=
r all cpufreq_cpu_get() references
> Sep 03 Zihuan Zhang ( :  65|) [PATCH v4 00/10] cpufreq: use __free() fo=
r all cpufreq_cpu_get() references
> Sep 05 Zihuan Zhang ( :8.3K|) [PATCH v5 0/6] cpufreq: use __free() for =
all cpufreq_cpu_get() references
>
> Please stop the spamming. While waiting, go read how this kernel proces=
s thing
> works:
>
> From: Documentation/process/submitting-patches.rst
>
> Don't get discouraged - or impatient
> ------------------------------------
>
> After you have submitted your change, be patient and wait.  Reviewers a=
re
> busy people and may not get to your patch right away.
>
> Once upon a time, patches used to disappear into the void without comme=
nt,
> but the development process works more smoothly than that now.  You sho=
uld
> receive comments within a week or so; if that does not happen, make sur=
e
> that you have sent your patches to the right place.  Wait for a minimum=
 of
> one week before resubmitting or pinging reviewers - possibly longer dur=
ing
> busy times like merge windows.
Sorry for the noise. I=E2=80=99ll split the patchset and avoid CC=E2=80=99=
ing=20
unnecessary people in the future.

Thanks for the reminder!

