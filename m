Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC017D80F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 12:41:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=0FhfDv/K;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Z/GpDOuJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGMmK55mFz3cW6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 21:41:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=0FhfDv/K;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Z/GpDOuJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=svenpeter.dev (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 332 seconds by postgrey-1.37 at boromir; Thu, 26 Oct 2023 21:40:49 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGMlP5YlMz300v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 21:40:49 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id A7C0032009D0;
	Thu, 26 Oct 2023 06:35:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 26 Oct 2023 06:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1698316509; x=1698402909; bh=6+tEepzRhbdqOl9MvWwXAiJ7s
	lUiFVVeF7abKCPfm54=; b=0FhfDv/KuaeIZtneUDMGrWLD1ZJiTNqf17t4XuEB2
	kZJbinjrfZEJLXTmxZ9oQgiWiAF2Kfpks2Jvm9VwN1AlEAjcSlEKKqjaY9cxIs/J
	rrQ0xBmmCgFUSJ0ARA8Dv9x0OwA3RD3eRLFicr/ZXPI4eWccXTl5oo+9FB9lPb9O
	VDHvG3Uni7/CY/TXKzNHusP93vQX9FrFk2Ovpfi4oDEBnkVoLpWROOGgdXCGZHe5
	f4sHmun5mmPDFX8t9MU4qUZk2hFscjGLsyeaLNCCLaQFtQHqoM/H7/57+3iycwVm
	pPH/moj08A6xa/oZNvMnfKaOmUGdbwYcdrP+1zhdTJ/3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1698316509; x=1698402909; bh=6+tEepzRhbdqOl9MvWwXAiJ7slUiFVVeF7a
	bKCPfm54=; b=Z/GpDOuJxjpBrSe1P9TbIfdEJm4mziK6+DKBFDZx4c5jTzaTgRs
	yagsPVCJSxz2gnnLpuHrgvSJDAKzwcGbez1H9FZAP3m37Cq08Xo/Z3M4GhpH3IfJ
	J2NvmOQXZpxqfcAQ38ZXeRGzB4+AbdkhphRiFjg+n0g4/+Rzv81bLKO4wJptW6Sf
	S/T3I4iqRX5BRyiT0V0cAKvEu01IFBVltMiBLV1VX5f1ziQWM7695voVc7h7kU/F
	Yxh53DQmU9pX3ZJdjKLgJrnqk9WUntEZamRID33lJTKUBpuK+sC8eQxsVPrXjt6m
	qUMvehFXEkrgCEBWDyV9FpVAO7DarIQANNA==
X-ME-Sender: <xms:20A6Zf-FHDUZINSEU_EOssEXtwfNoH3iXVp_wmsvcyBwRLHemeETbQ>
    <xme:20A6ZbtDki5Jg2R3ymkLBnMsKAfVSErf21xKvc1wxPOgyEACrobgNbaiZl8NbmpT1
    1qLf-jeNTFxlKvIkyE>
X-ME-Received: <xmr:20A6ZdAw5c4da6kJapVoXjcA4rE6gumZw2-SgokMN2zWuxCxr_D2Ru7w7BzW_ON1rneS8bzpQI4lMBaoVDqXf9FQuKX7QeD3y7xqMY4I2Pr2o8EelGJo47FXPVk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledvgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpegtgffhggfufffkfhevjgfvofesthhqmhdthhdtjeenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpedvhfdtudduvdeujeeufffgudekvdefvefgueeiiedvledtheegieevffdtteek
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:20A6ZbcUFKYSw09WrpR9ZGvX0qEvZZFsUkabN8756-wfQfW4GnqVvg>
    <xmx:20A6ZUMAIcgtj2Gpkgi6PkKhCGR8EZcPcOR-x862bEmwaz2T2-nEag>
    <xmx:20A6Zdnq87T4UyMpFpjL9OOX4M8PPL2xyeAIpPPOgZsbgrqc-xvbKQ>
    <xmx:3UA6ZZs-p2ku1VBDSNY2vf3ANsa4KAmVOibmLjzOO1uwXs7ODj5LHg>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Oct 2023 06:35:07 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Sven Peter <sven@svenpeter.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 0/9] iommu: Convert dart & iommufd to the new domain_alloc_paging()
Date: Thu, 26 Oct 2023 12:34:54 +0200
Message-Id: <20F398C2-8F87-4149-9154-44EFF2A966DE@svenpeter.dev>
References: <ZToaD1tuNJ7tra-g@8bytes.org>
In-Reply-To: <ZToaD1tuNJ7tra-g@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
X-Mailer: iPhone Mail (21A360)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>, Janne Grunau <j@jannau.net>, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>=20
> On 26. Oct 2023, at 09:49, Joerg Roedel <joro@8bytes.org> wrote:
>=20
> =EF=BB=BFOn Wed, Sep 27, 2023 at 08:47:30PM -0300, Jason Gunthorpe wrote:
>> Jason Gunthorpe (9):
>>  iommu: Move IOMMU_DOMAIN_BLOCKED global statics to ops->blocked_domain
>>  iommu/vt-d: Update the definition of the blocking domain
>>  iommu/vt-d: Use ops->blocked_domain
>>  iommufd: Convert to alloc_domain_paging()
>=20
> Applied these 4, the dart patches need reviewed-by/tested-by/acked-by
> from one of the Dart maintainers.

Sorry, must=E2=80=99ve missed the series. I took a brief look and this all l=
ooks good to me. Given that Janne already reviewed it in detail:

Acked-by: Sven Peter <sven@svenpeter.dev>=20


Thanks,


Sven


> Regards,
>=20
>    Joerg

