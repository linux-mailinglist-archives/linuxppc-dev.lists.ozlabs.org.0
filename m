Return-Path: <linuxppc-dev+bounces-11779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEF7B4547A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 12:22:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJC8N0Mypz3bsR;
	Fri,  5 Sep 2025 20:22:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757067747;
	cv=none; b=fsoG4P8l1EktYu3YKQr2QngEuJb0uVpwjtGtuT3KTkQz+HdsfVm0QpWTH16CbS7j8DMieUFiRtKR8RCOvIDaiFMCxbgEunklUQW785Jbp0T7DztA5j7SSCe4llQ6AO00PPqW2dCQHb0QiEDj3mAv96HrlgRpKlAwvue9XbY2QeNQewgeIL14CkYUVX6bUGdll8fZlpV/t6KEb5e9Hn6n5vPysAAAk3hnJabNz8QGAgJpsy3ZPNnJAie/kgf+b+LC1g065A4jRcNzaVekYPBIkyfrydHOOEXivm/Yk308WyQEd6e+yyfyXfCoKiuUJBQcWeUTN7v6/GCNbqIzZgrvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757067747; c=relaxed/relaxed;
	bh=OfTOMWX66TbAfkqnKGzCFdhIOFRb5l9VXCVY15B8Ww4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBg3J/gf+k9YCraWnb805OAeMBwA7k49TY+CXK371kZEiWO6Y4X5rh/Wa3LJDGFWTpIhSTZQ5RDIcCEvKBWffx4GIDjBCwbUIGgU6zQ4ie3kW5SjATPwMh2FIcMDFylUOzVDzaQXfwfvO8y/mrYbAUu0wIKrnL2Ot5nU3NUSvTRLvQbCLnMwtnwUH0WKY+yNQ28DCjufnFiOHRhXUTdwPxoQ/fN0mKYYo5Ykxk2f//hWvlaXPiDLAuMBdXJibU/TayoCzNS8U6kY58VDoBQV/HVOtqAezc+9+3HfHllBHMG9mfZD4Ux4cuWaqcS/XfMQ+SBryIctPe/SmzXCYsMONw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJC8L2Wp0z3bl5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 20:22:25 +1000 (AEST)
X-UUID: 0e7797928a4211f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:14f482f1-1678-4861-8721-a3d21e06eb8e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:91ab872eaa9ae72f0b505e024ab096ae,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102,TC:nil,Content:0|52,EDM:-3,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0e7797928a4211f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 829448159; Fri, 05 Sep 2025 18:21:16 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id E4DD9E008FA4;
	Fri,  5 Sep 2025 18:21:15 +0800 (CST)
X-ns-mid: postfix-68BAB99B-76698910
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 96DA5E008FA3;
	Fri,  5 Sep 2025 18:21:07 +0800 (CST)
Message-ID: <59305500-9ecf-4eeb-b4dc-9c9eed02454f@kylinos.cn>
Date: Fri, 5 Sep 2025 18:21:06 +0800
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
Subject: Re: [PATCH v4 08/10] thermal: imx: Use scope-based cleanup helper
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
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
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-9-zhangzihuan@kylinos.cn>
 <20250905110551.00006588@huawei.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <20250905110551.00006588@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/9/5 18:05, Jonathan Cameron =E5=86=99=E9=81=93:
> This radically changes the lifetime of the reference to policy.
> If that is valid, then I'd expect a lot more description of why!


Thanks for your comment.

Initially I thought policy was only used within this function, so I=20
moved it here.
After your feedback, I realize that this change might affect the=20
reference lifetime in ways I didn=E2=80=99t fully consider. I need to rev=
iew it=20
further to ensure it=E2=80=99s safe.


