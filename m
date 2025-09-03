Return-Path: <linuxppc-dev+bounces-11649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 224D8B4123B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 04:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGmPm5pvcz2yvv;
	Wed,  3 Sep 2025 12:14:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756865644;
	cv=none; b=Vkhdj4j8X77IDZlJPHXDuL2Kx7yYTF9upw9ZT8j1pBpEwwnDeuKUrqvI/p1mWh/ETt+II7s/PVjn6lieQpNb+ngtYSYJjug+vij4poNAANdh009BgHwJxqhiJJKdCulespuC2CVhRvxegcsl1+miTKkM+nQ7B9m6FvmgPm0QE5TBD3wKiKNubvpAgyzO6XnFQuH/1wucOq6qT2fRXs18Ihk+Ww1a4Yhat/ra+wXBb3anKSakxBjo2OPrATEwlp1SX3Wg9uQZdpuHyvw5kIqyrMLoV0nzLNqGk9CpJl5NDIbnCWaCk7Xua24PPQ5fYZBn/rRj2hepVMt+XjD/rD5tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756865644; c=relaxed/relaxed;
	bh=2eq391jKO+ibx5qiY1WDwk2WI1cXYKR+uFHcNHxENAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8yrvx1mtlNibSiY7fCX198f5fA+spXPj3K6UbC8h2M0gEk3LdzW6eTYddGEb89PIpRkgkPi7axlbgQPRWojACXUksQMjiwpZlDIpk8E18Q1zuzwjTuuxUyEc+yOvRdTq5i0hLRxNFuRBqFSoYLMiqBhSsiniE5h7+0Tv5SzpNXWxqD7pvJBGCdTHN2/u++sxzl/NFTZ4v2vf57UEForr00tkPoD8JrdSZk3haCpIBC7daQXzIxO7+tfaNbEUD6Ti0wolMmrwhO2qS2O86J1t5cUP0mvXCFTHy0+UkOlr5dgTB7u+40yHkUZ5PkSxFXq4F+rRRe3chLlr3FRQqZGOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGmPl1Pkgz2xnw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 12:14:02 +1000 (AEST)
X-UUID: 7e64a03c886b11f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:a08d3f21-1eda-4701-933a-4d08872f3f53,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:aa48c90d2685f52c421d2b43104888ae,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850,TC:nil,Content:0|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7e64a03c886b11f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1390030646; Wed, 03 Sep 2025 10:12:51 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id A8973E008FA3;
	Wed,  3 Sep 2025 10:12:50 +0800 (CST)
X-ns-mid: postfix-68B7A422-507635249
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id E1C47E008FA2;
	Wed,  3 Sep 2025 10:12:30 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: krzk@kernel.org
Cc: airlied@gmail.com,
	alim.akhtar@samsung.com,
	beata.michalska@arm.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	cw00.choi@samsung.com,
	daniel.lezcano@kernel.org,
	dave.hansen@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	edubezval@gmail.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	j-keerthy@ti.com,
	jani.nikula@linux.intel.com,
	kernel@pengutronix.de,
	kyungmin.park@samsung.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukasz.luba@arm.com,
	mpe@ellerman.id.au,
	myungjoo.ham@samsung.com,
	pavel@kernel.org,
	ptsm@linux.microsoft.com,
	rafael@kernel.org,
	rodrigo.vivi@intel.com,
	rui.zhang@intel.com,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	simona@ffwll.ch,
	srinivas.pandruvada@linux.intel.com,
	sudeep.holla@arm.com,
	sumitg@nvidia.com,
	thierry.reding@gmail.com,
	tursulin@ursulin.net,
	viresh.kumar@linaro.org,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhangzihuan@kylinos.cn,
	zhenglifeng1@huawei.com
Subject: Re: [PATCH v3 12/12] PM: EM: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 10:12:30 +0800
Message-Id: <20250903021230.1044454-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b38e64cc-4971-4e71-931c-820453aa91a7@kernel.org>
References: <b38e64cc-4971-4e71-931c-820453aa91a7@kernel.org>
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
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> You are not improving the source code here. This is not how to use
>  __free() and you clearly do not understand the source code.

Sorry for the problem, policy should be assigned after cpumask_test_cpu()=
.

I actually realized earlier that __free() only frees at the end of the va=
riable=E2=80=99s lifetime.=20
I had suggested using a braced macro in cpufreq.h to allow immediate rele=
ase after use,=20
but I understand the maintainer=E2=80=99s advice to =E2=80=9Ckeep it simp=
le=E2=80=9D and will follow that.

> What's more, you did not use standard tools which would tell you this i=
s
> buggy and wrong.

Could you please let me know which standard tools you recommend for detec=
ting such issues?=20

I=E2=80=99d like to use them to avoid similar mistakes in the future.

> Don't introduce cleanup.h if you do not understand how it works.

Should I drop this patch?

