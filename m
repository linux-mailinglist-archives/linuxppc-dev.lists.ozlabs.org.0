Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8E7A6162
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 13:35:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=K5ay55Gj;
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=PhuLhUFB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqfj93kl0z3ccG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 21:35:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=K5ay55Gj;
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=PhuLhUFB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mediatek.com (client-ip=60.244.123.138; helo=mailgw01.mediatek.com; envelope-from=yong.wu@mediatek.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 903 seconds by postgrey-1.37 at boromir; Tue, 19 Sep 2023 20:59:56 AEST
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqdwX2dYCz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 20:59:54 +1000 (AEST)
X-UUID: 8b690a5e56d911eea33bb35ae8d461a2-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=u2vgeCrXDruvDvbz9JWATPKy4P7S8w3erm2asnW/8Oo=;
	b=K5ay55GjjtnEEfCaJvXTx6KheKjGWw3jY8bGBhgNtsCXxiQFGduJsbAasuWRHap+yHYcRIn3WlBX4qXLNUJYVl0im3kUj/RYz/a7fbcSnjhhrKgwuCWedQDB3uqtWIJJEUgv1QHYgj3yJisSc6Eozap22FmnY6TpSvxZw3ASZ4M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:47232ed8-5d1b-4082-bd79-36018d8a5aa1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:46121e14-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8b690a5e56d911eea33bb35ae8d461a2-20230919
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2103801335; Tue, 19 Sep 2023 18:44:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 18:44:43 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 18:44:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOqQWzR6kqjUB0Wfz5CwoSjgEEBY3qGSsddAzEgjvZqqumK4mrVmJEbHG4cCRxZp4GnBs7o3LW2l60JOA84uqwBiVUXYEpncYb8SRSRjvFkYAunkhql5qrb3kw5Jsc7vFuy6HnSPULKwMYYdl8pUcR+/ivZT/epc1Ge59EYnwdlxmhykJGoWt/wZ4fi6o37Z3SV02GI6pb1cDgjS+UJkMddjOYo2HFN1vhGO6/X2KTnJ5NheKyd+64spR4whM7+ynDoA3a8wE0mcp5myjbFEUBk3wOo99XuIsKal53RCuJ7o+UN1zvGIqiOl0XTsRySy7CxZ5Gt82E39ehUHQ4zgSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2vgeCrXDruvDvbz9JWATPKy4P7S8w3erm2asnW/8Oo=;
 b=jEC3FgEdxf0mVppFaDcRlJLHzCS+OXI6op+ldKAB/rpRlnsnN9uP+d9DgRwCTWj/KPx0vwqEgfiO5SYVf/LN69/Zm7G+5c14mbOyuxMHWwIDf33lJHtBBkEtTQUQt3qXpmQHkNSkfnSFO52+cE+ryI5fnabLTtez1NkY6U36gNAXsRXRIwGp1mHc/+6Pvn1SjuouYJ+XTlacjNhtFfCAhPALY8ddQ9sGnqAxpSxdx89k++pMWQv9MDaYJCGgwzpXZPnputJC0xxVYFiK5hRrzyUHutjoeHPa3+KuUKuOrk6EkuyOEH0SAsbVIa2ir4CcKZOZlnROVECi1dTsMyQJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2vgeCrXDruvDvbz9JWATPKy4P7S8w3erm2asnW/8Oo=;
 b=PhuLhUFBIUoamP2aFt9oVWI7OR5YU7dmWoDT9gFh9DP79WoLwROEtClwdVXvQBeKXkrXbl0ucA9XlFOMUpWlT5cmF2Pe1cK9qU03icd1PvBKXAwI+ILVNJE+jsWtG4/FdFioJDmGCVp7lifz9vFHUUr/Rj6dloM/qrmmeBCqzf0=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SI2PR03MB6223.apcprd03.prod.outlook.com (2603:1096:4:16d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.24; Tue, 19 Sep 2023 10:44:41 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 10:44:41 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "wens@csie.org" <wens@csie.org>,
	"zhang.lyra@gmail.com" <zhang.lyra@gmail.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"agross@kernel.org" <agross@kernel.org>, "robdclark@gmail.com"
	<robdclark@gmail.com>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "will@kernel.org"
	<will@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "andersson@kernel.org"
	<andersson@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "mjrosato@linux.ibm.com"
	<mjrosato@linux.ibm.com>, "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "gerald.schaefer@linux.ibm.com"
	<gerald.schaefer@linux.ibm.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "orsonzhai@gmail.com"
	<orsonzhai@gmail.com>, "samuel@sholland.org" <samuel@sholland.org>
Subject: Re: [PATCH v8 23/24] iommu: Convert simple drivers with DOMAIN_DMA to
 domain_alloc_paging()
Thread-Topic: [PATCH v8 23/24] iommu: Convert simple drivers with DOMAIN_DMA
 to domain_alloc_paging()
Thread-Index: AQHZ5kiMm4G2PL5NQ0Sm/zgQgpoMurAiAAQA
Date: Tue, 19 Sep 2023 10:44:40 +0000
Message-ID: <f9b5e9e83db9d6c36d3413c3087204f07f174bbd.camel@mediatek.com>
References: <23-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <23-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SI2PR03MB6223:EE_
x-ms-office365-filtering-correlation-id: b58b5cf4-53ec-4cb7-a577-08dbb8fd6db0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6/POYLn+Kf28FGO/Jo+2U+6j5v6XG/NHtMDNQX2ZCr87G94h8ZXi1PT8FYw+gPno9lJt5cVELcSuPsvXvsZ2ejcV48P4feDrOMcwg5bBXY+h5JIjS9MkMk4gTii+tyjlTbl6N7niYWbAp3DHaFdX+etfLt6psNK+k2I09TC2LzKl9uzh0MMk9i8IUPJMIMNv4H4VnDGs/ZNpDTINbWavJIQ/bFGZCepS/foIvDmUHKYinHLTwCvQMuszh5b/dDRb6FyjXb06LIgo/8SSYwKeGOpC2hr56LmbLe8Q7DXmEmSEHUKZsipIr1NQWUongfnronRRVdGoGPrLIXJ2oTmLG2zTn6UP0vkvK7ogpISedWThVTWACNAspeMUOOaLnSVnIa4OSohPUY6x3Fm6O0VeaExwXtE/Z1S/dzEP1dnxENM7AClri2NgtpL3Pvhe+GbYTNPvX6IbfxdmOxbzW3x6QxqriAYtF5QbjV9UyBogcoLAhqWkFIvOeaAhOeTsNfFraVx3W3l22EZdqwdzc66HFRGeIzABn217mU5pr3luiEu+YCrUBBlmWZqRBIYK94IQhJ/cEuzC+jRhpqQa5nKF0JTPMcHwzqlQ2WzNH8+9NOXXXytN8w5mH171iNJtIStg6xUvyg50f5OvjwxBZaCHifEYN1dUAKSOflxSRr0vmzpu+v0FPVur3uwnZ1sJkWxSk+AFtdD1l6ZLmBthxjLahw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199024)(1800799009)(186009)(6486002)(5660300002)(6506007)(86362001)(54906003)(66446008)(316002)(6512007)(64756008)(38100700002)(66946007)(66556008)(38070700005)(41300700001)(66476007)(76116006)(91956017)(110136005)(71200400001)(478600001)(8936002)(8676002)(2616005)(921005)(26005)(2906002)(36756003)(4744005)(85182001)(4326008)(122000001)(83380400001)(7416002)(7406005)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2ZWRGRBaDR0ZDJkdWdZek10RExIZFlucUE4Q0Qxa2JoWXVHM25sc29zM2xh?=
 =?utf-8?B?YnpLZFpjaXZJOEtXeDBBV3YxMHJTMG9OeFFyVVljSFFnRS8xcGlZN1VZSU9q?=
 =?utf-8?B?YlUwTnFjR1duOGpPaE1TWXdiZHFTTUJ2VUlMakVHKzRWSUtiMUUzZ2Q4RkNH?=
 =?utf-8?B?Z0JGUTFEb3pLaHZLZnN2ZU05YlhicCs5cXl0NHhPM285eENVNVE1WkZ6eXFB?=
 =?utf-8?B?czVMUVV2UjVzSWFObmJsQjF5YTMxRmFRRTVGNmZQNGFLdWs1N0VDRDczajFx?=
 =?utf-8?B?Qy9Dc3JQTkI2bjdtbHVITFFic2M0RUxHUEV0YTdrNGxnOXlyWWZJMHZQWUlI?=
 =?utf-8?B?aG1lUWVuQmdIZVFzYmoyQnNhcktJVDAyQ1UvOEg4ZFc1MStKY0hSSVc3VXR4?=
 =?utf-8?B?TXRpdTd6UVdjd00zQjhWR0h6VTRheDJOUDNpc3ZML1VsT0l5MlkrV2kxalAw?=
 =?utf-8?B?cGhLMnU0bEMxQitTLzMwUkJ1TlZqZHc1ZFEwR2Z2OWdybjFnbkI5aUFiSEln?=
 =?utf-8?B?MzFLa0s1bnJveFhSeWhlK1grdWFiWDk2RktrTmhtazMwclYxQi9vbXhteW4y?=
 =?utf-8?B?VUE4aEtsbEFpbGMvdGZFN2VGN0psNG5VREJHZ2I0RW9qR3NOL2Uwb0pmNkdx?=
 =?utf-8?B?cG02UXUvYno3bmFDbmduRmlhUVZtVnNQQXE4WGJudVBhN3dKMGUwN3dyVW9w?=
 =?utf-8?B?eElGNmFsR3lLN01oMGRvS2hrUWViNjU0eGdFeHV6S0I1bTR5UkgyRVVWdWRU?=
 =?utf-8?B?eERRN2RMTEdnc0tVY2tFOW5sVHVkUzdDTUtoNTYwcldYOGJsRkxGUFpMWE5o?=
 =?utf-8?B?b29UOFhpNXVKRE1Na043SHNjcGxoUnpFWVMrek1OYTd6dGJZVkdTaHpzSEI4?=
 =?utf-8?B?UjYxQUx4dmJzSkh0VFZkcTNkZDIwWmR3MUZLMkg3KzV1VTFjWDI5b3RaamNR?=
 =?utf-8?B?NkU4MDUwVG9FNkFmMHQ0WGltM1FWa05TUFVGeHJkc295NlpyWXVOOGswdjRs?=
 =?utf-8?B?RnZ5bURtQnRmcmpuZkFycFlqbGZTSGd0UnY5RDE5ZDIxTHNQQUd0ZVQrQnpJ?=
 =?utf-8?B?NjhnMHdHaEVHa0c5L2ZwUHJBTzBVaE5KcnNqanEyZCtrT3VHcWhKbWRQZVRq?=
 =?utf-8?B?bTZqdUJZTTJURHM5RzlpeDh6ZGV4QnBwYUY2R2RyZE9sQnlmZkJITFJRODN0?=
 =?utf-8?B?MXBZRmI1TEZyR0ZraEs1ZHpnb2VOZ3hjb0srTkphdy83Z004RFlZbmZaYWZu?=
 =?utf-8?B?bk5pMkFONVNGWWJxUzUrTUI4NTJWamVTMTc2RHM5M1B0cjM1cE4renNlcFFy?=
 =?utf-8?B?TWNjbTE5Y0w0cHN5VlJNSyswRjYrTml6cWJwMjRWaDhlT3N4YmxwRDBpY0tn?=
 =?utf-8?B?UVROQVlpcGU4N0NoS1oyQm9VbmpMWERRMTRrdXhhV2ZiLytlK0pndU54Si9K?=
 =?utf-8?B?N1laelRrQ1dJUnhUWjhTQzNVS3NHeXpoVXo3VVFXalNCRGN6UENNenp2ZUk0?=
 =?utf-8?B?NHRmU2kwSTZ5WGFPZGY2alljb09ZVmhhT2RjeVFTSVZUdmpOdVNkcHBuVmhZ?=
 =?utf-8?B?UEpVLzMveTYrUG5IUVprTy9kOW8veGREWFQ1eUk5NlNaVjdRL1hUQ2hueGUr?=
 =?utf-8?B?RXl0Z0hubVlWUmZnQTlNSzVGMDlReUp2dy9kM0I1MStHYWd4WGFmRzhRb2Zr?=
 =?utf-8?B?SDFEdzhmaW96alFBOUI1T2dIekhGbVhyQlQvNjBBVDZHTTFJaGtWUTJFMVU1?=
 =?utf-8?B?dkR5eTF5TEVYWG9FZm8zdmpadmI1QlpJeXJrL2FPTnhvZUN1Mjd5Z21kNlVS?=
 =?utf-8?B?VU9WZjBUMG4vajBNcWlQVzZKYjBrN2NvYkF3NjQ2enRiMjQ2NFBydkwzRko0?=
 =?utf-8?B?VUV0N2NQMVV1TjNLSkZnczFLb1Q3SGdBVVBmQWU5V2JpNFc1b09laU43ODBN?=
 =?utf-8?B?YXpkY3p1NmlLQzlzN2gyN1F6dUZIdW9VMmFVNm9veCtoRnJvYzgzK0tFNmhI?=
 =?utf-8?B?dGdUVTljQ3gyVW1Obm9YZ3d6dzROdGdsTUpFME5mU2NJbDZoVXNWSmZhUGIw?=
 =?utf-8?B?aERoZFgzVlRjQ0llY240b29IZE5VQTVXakNiQVVaQUhBR2RDcnhlOWxVeGJO?=
 =?utf-8?B?V24ybjd1RkJTcTV3MVh3YzBnUXFWMDd1RGNmUDA0clZRSVZmcHZwMUR3dUUw?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0013D130C2A8249A1883529ED888707@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58b5cf4-53ec-4cb7-a577-08dbb8fd6db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 10:44:40.9441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNPBAyOr00S+ssTp9WPZN1Q7BL+zzErmi4ZTpZ82cYuMKUEnsg5kmot0rYMjzvVi8f0xBH4LtQVS9WAiEaIGqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6223
X-MTK: N
X-Mailman-Approved-At: Tue, 19 Sep 2023 21:34:23 +1000
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
Cc: "schnelle@linux.ibm.com" <schnelle@linux.ibm.com>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>, "steven.price@arm.com" <steven.price@arm.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "digetx@gmail.com" <digetx@gmail.com>, "treding@nvidia.com" <treding@nvidia.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIzLTA5LTEzIGF0IDEwOjQzIC0wMzAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9y
IHRoZSBjb250ZW50Lg0KPiAgVGhlc2UgZHJpdmVycyBhcmUgYWxsIHRyaXZpYWxseSBjb252ZXJ0
ZWQgc2luY2UgdGhlIGZ1bmN0aW9uIGlzIG9ubHkNCj4gY2FsbGVkIGlmIHRoZSBkb21haW4gdHlw
ZSBpcyBnb2luZyB0byBiZQ0KPiBJT01NVV9ET01BSU5fVU5NQU5BR0VEL0RNQS4NCj4gDQo+IFRl
c3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4NCj4gVGVzdGVkLWJ5OiBT
dGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPg0KPiBUZXN0ZWQtYnk6IE1hcmVrIFN6
eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4NCj4gVGVzdGVkLWJ5OiBOaWNvbGlu
IENoZW4gPG5pY29saW5jQG52aWRpYS5jb20+DQo+IFJldmlld2VkLWJ5OiBMdSBCYW9sdSA8YmFv
bHUubHVAbGludXguaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogSmVycnkgU25pdHNlbGFhciA8
anNuaXRzZWxAcmVkaGF0LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxq
Z2dAbnZpZGlhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS9xY29t
X2lvbW11LmMgfCA2ICsrLS0tLQ0KPiAgZHJpdmVycy9pb21tdS9leHlub3MtaW9tbXUuYyAgICAg
ICAgICAgIHwgNyArKy0tLS0tDQo+ICBkcml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYyAgICAgICAg
ICAgICAgfCA3ICsrLS0tLS0NCj4gIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgICAgICAgICAg
ICAgICB8IDcgKystLS0tLQ0KPiAgZHJpdmVycy9pb21tdS9yb2NrY2hpcC1pb21tdS5jICAgICAg
ICAgIHwgNyArKy0tLS0tDQo+ICBkcml2ZXJzL2lvbW11L3NwcmQtaW9tbXUuYyAgICAgICAgICAg
ICAgfCA3ICsrLS0tLS0NCj4gIGRyaXZlcnMvaW9tbXUvc3VuNTBpLWlvbW11LmMgICAgICAgICAg
ICB8IDkgKysrLS0tLS0tDQo+ICBkcml2ZXJzL2lvbW11L3RlZ3JhLXNtbXUuYyAgICAgICAgICAg
ICAgfCA3ICsrLS0tLS0NCj4gIDggZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNDAg
ZGVsZXRpb25zKC0pDQo+IA0KDQpUZXN0ZWQtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsu
Y29tPiAgI0ZvciBtdGtfaW9tbXUuYw0KDQpUaGFua3MuDQoNCg==
