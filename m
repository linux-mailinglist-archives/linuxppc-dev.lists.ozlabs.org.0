Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0F56B71E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 12:19:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfTmM5p6fz3c5X
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 20:19:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZTNxHEAq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZTNxHEAq;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfTlX3CTSz3bc1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 20:18:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657275544; x=1688811544;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s0hLTPOz0QEzfv7e/tV1XB+D4nmJ9D7EYxooCByT/vE=;
  b=ZTNxHEAqAE+VGF9Qfv9hoaorRKgwe4SRa3mj1Y1P53N442pQzlM06Qqr
   CTKPmT0jmsHhjeUF8JS+6Dt3/hAzFu42f8JjMieB5lJZmUPt0BsjgEY2K
   FIOQ6vt71YmpsyqWGjNZL7V8ORXi66jnYE9mBIgDwLT/rzOVJqmXZN4MV
   54fisKhLVEuPFewjCYHduyOshjgENFER4Et3rQNm7AzghtV4clFBoNjR3
   yRS8rYGcU/Fad2cmBMfqmyYEYhc9gVRhukMMunsXcuMDBAKhFoxi6H20K
   eviHryYsV4EO7D7l4Y81FtyTc+xPcEYCsoYDWAn9c12JBASW2z4AoCqpr
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="309815909"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="309815909"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 03:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="661729832"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2022 03:18:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 03:18:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 03:18:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 03:18:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2Bksy0qxhdqDyxagFfgHcoNvFvI27R4IOJ1xy64YXADWaS/fmcbSp7dCdqavP2l6WO4A6p2KEEPX9ceiebaGh5bQSVIGODpDi0o6rc92Tcj5jgMQScTfC/hUjKnZpAThOc2pAZw62IEdGf5VGh0NEelSGqoJ3I8GYXAMBH3mKnq0eFtqbmqL2q09k9JWVYvaETwExRlEHIw3ewfUu9vgi2LWhzG3Hv0s4VrTk5BRg/RXP9uyXVt2JrUjUg5L799fhJloaToV7gXmbgJ7ei6jCW2mqzFi9Q9Fn5yxUqBjmQSHxg2PcSXTd8KcQoujktAeUL6Ng8nr2htj5aRKnA1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0hLTPOz0QEzfv7e/tV1XB+D4nmJ9D7EYxooCByT/vE=;
 b=doECscJXK7CjVzzX073abfcB9Vs/MoTv/kVJfxP7KzRN/xF3hGHdGetOoaP3fWyLGLzgXFDCeccTwdin+PHiysitZqo3wo+rkM9Bn/NOh1LA8PhDmmiEjqqsVAucXJqdnRyHDRe70+x2ouNlfUCHyLICKPkknXcmF2pKbZAE7HJPx5WiqdgW7A6Q5SaXbw9tGqzRcOeOsYhUygHZnoRCrce58uzdc1pukRXPks8vPXY8+3aVbCMvv9cvMeJahAnO6B605jFzwgtqDEzUAPtqeBfcr1/nLKkpkYaUIUe5/F3I41a8+vQ++FelGDg/WQM5RDpFcMlJ1DnjsS8VtprdUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 10:18:52 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 10:18:52 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Thread-Topic: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Thread-Index: AQHYkgm2SLPFbZ1K7Emw8giwhTYMU61zAy8AgADn6ICAABqBgIAAC2DQgAAqAoCAAAj8cA==
Date: Fri, 8 Jul 2022 10:18:52 +0000
Message-ID: <BN9PR11MB527603E1D1C32C21FE2DCC3F8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
 <26838575-f06a-4525-f3ca-7fabb19e3550@ozlabs.ru>
In-Reply-To: <26838575-f06a-4525-f3ca-7fabb19e3550@ozlabs.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79586cfa-c19e-4445-02ca-08da60cb41cc
x-ms-traffictypediagnostic: PH7PR11MB6522:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d0fzCH+0F7kaj3HfqDBTt4apUcWz6GQBlIL4AVg2ZtXNQYP65kmF8Iwwh8yDr4RZq8kqsWgXiz8b8Jw4GLbHOfTtOIIboFUjnDbPFM1joR5gsdVEPLRMjDAA1U8Y1KWEBULU17Le2GZ+RNScM33Y2Veb1h+02x9SgR27H1B+T2R5HPpbwCwA8niuV4YeroM/LUGibKetud7SAEr66y/eKS1y8IvnJLufQ00Dek4D/xMtySFORlYQCHuM062ubtcmWe+T/dfwBuQelVUuLyGOHnGYU/yz/5aKi5yMk+e9nLlbolbFZbvJkwhoG2UFdrtkO4R2nCQN+ZDyXWz0NbpLEgBE4K8CQPOcpuXRS2WUMqVKQo27t21XCdU0cjdnwNSgAHuCbT2fu7+3VAYI3VQZHSz6NSDBWoiZPtOOc8DhR5vevilh2RDRoRPS2gevF9LDNvtMtXsXbhD5i1EisfYW4hVmcMMsZOXHJwqw68oVEw0aT/tDol1Tp6a++ioH2DavSi5gqSaoLkNsL0mN0TU5AQuUKkTWWYqAYFbwt7ZcF+dKB1e1foDOWe/A/hpR4aNl84GvWI8weKvKGt446HEErnFk5M7bGtZah6jIp8qy8piQIFpjvEG6FTFsdXhpt/f0uievWiYStWB4VQ8y0eJQTPv3AfbebwgcJhPnoA+MW5fQW0HIIGi5V5ZDWfuNcmOBCxFB6JHiLWroY1zQwRbcjOwXiAv2+Y3PTp4xHRPJ3EO0Y6r3DTdpOKJ0inikrtdp69s93mQUrpMEq2DDSXeyAHHUQCaEh6rwB1x4Dp1fZYsaPzO4M2gw5NFbD5k4riu3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(346002)(39860400002)(366004)(4744005)(5660300002)(52536014)(8936002)(26005)(7416002)(4326008)(55016003)(2906002)(8676002)(38070700005)(83380400001)(86362001)(38100700002)(122000001)(64756008)(82960400001)(71200400001)(33656002)(9686003)(478600001)(76116006)(66946007)(41300700001)(66556008)(316002)(66476007)(54906003)(110136005)(6506007)(186003)(7696005)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEJYdTQ3b0M4OVYxSVpJbDlZNEJQZCtHRGE1QXJaS0dGc0NUV1dxYkMrN2ZL?=
 =?utf-8?B?T2FOVEJLMG15UGR5OTlxYXhYSFBBVElSQUVFV0hFRGpaTk1kdlZNVHlVNDJE?=
 =?utf-8?B?QnpiOG9aQWJiUUhTQ0NyM0V5Q3d6UXpYZTNhczRxRGw3NEZsRmxXQUxjNFZo?=
 =?utf-8?B?WklpdldUWHB4YVIycVVmbkd1SmlYTnhPS2thbnZkN254WFBYbFhLOGo2dllL?=
 =?utf-8?B?N3pGZWRBSVZRNGtkaWRyN3N6dittVUNKUUFSRFl6b3VOZys5WkxKUVYvSkNZ?=
 =?utf-8?B?OUFERCtWT1A5YlVFaTFtdjhLNVRrcXVPV3Y3MHBtcnJFWEs3MGNiaUZUYWJF?=
 =?utf-8?B?MXpmbVhGRXp4THlHdnlVeHZTSjBpbkY0NnVqclBSLy80cHArTmtNUDFPT3Bz?=
 =?utf-8?B?d3lDa3dpUGY4M0xtby9jV0ZSS0V5S2ZoclJ3Y1pLUFovVUtpaGZkQktaTHJ0?=
 =?utf-8?B?c1V4OStWVURBYU9ub3FlSHV4T0VVeEViVnNBNC9XWFh1eHNtbkRyQXJXb3lH?=
 =?utf-8?B?MFRwNmZZNGFiaWNwWmcyRzI1ZUw2NEtwa0VNVXdKaE4ydE80aWJGOHBTTGFQ?=
 =?utf-8?B?WTlmVGI3MUlTMEt2Z25JQkJEb2lreGhIem0zamFuQlFVZ3hGaHRiODVWckVv?=
 =?utf-8?B?VzZoUEhOaFEyT0R3eHpCR29wWXV3UjU2MDNhTkx0Tk5oTDJxbEc5UFRrYW56?=
 =?utf-8?B?Y3dMaURoTkg4UTVHVUFNaGNCVGp5L0sxc1E4R09TZElZQUhTVUtQakJBeEl0?=
 =?utf-8?B?RlIrRE0zMWpqVkhsaUhwT0tlcmszVEdOUHNSdzhPMWljT2tteTFiSUVVQm12?=
 =?utf-8?B?NVo3NHFxTk1zRzRpdHlHK3dFNEthZllxQTFwMU8rOHNyZDZjQUVXS1c5cmhk?=
 =?utf-8?B?R1RERm9NaGQ3YVZyUGR1WWhoWis5UkdmK0FFOW5aYzgvU2I2Q1B4akZHNXg4?=
 =?utf-8?B?VXVPbHRITzl6VDViTGNraEhraDd4RWhIWXdJVW1xSkNyZUdKdjQyRXJnKzB0?=
 =?utf-8?B?Rm9nd0tVRk83QlBCTGlESXVwTWhRNVdBRHZCMUNpODdkVGNaRnlmZkljY2Zw?=
 =?utf-8?B?UDd5RU93NXlFUkFlMlJFYnVnRjhqazJmcjRQNVpHQzJremRrZzI2Z2dIaVd1?=
 =?utf-8?B?Tk9janNqWXovVEZEbDErQnlZb0t4eVR6UE5kL3gxeDhxalJVT2FiL1dWUTFj?=
 =?utf-8?B?Sng5bHFpcUlJak10MnV3dU5va2hlTmtGTUxUUzhKYmliTnMyVlhtMEUvem9Q?=
 =?utf-8?B?NWxFZlFZV3I3UXRIMHZVZnhVb0pkQSs1T2U3bFN4empESk9DbzRGRHFSTDlq?=
 =?utf-8?B?MGpRSzQzYmp5SytWSEpSbkRBK2tQZUtMd20vRXdDRDlrL0J0YkdMSWM4cWNE?=
 =?utf-8?B?K0crbE5wMVpVYW5HUFZTNzRkenNNczQ0M3gyL0NUNnI2VFkzNkdDUEp1dGly?=
 =?utf-8?B?SXhLWnUyQlRlVnZOWnlXRXY4dTRSbXlEMEFKR28xSC83TWlTT1FtVHFlZ0Zx?=
 =?utf-8?B?SzU5L0IrYTVGMm1oSVNOV2pNREZQQkt1MzFQTENoalpKQWtRU0RaZTJuanAy?=
 =?utf-8?B?Q2d5UEFFVVVXSklBd0lNbVg1Z2FRMjA2WnlZNFd6OVZobVBMNXZTcUF4RVkv?=
 =?utf-8?B?NnQ3R1RJL2pBMllENXdrM3dmOVNBaG5zL0hTVUUxKzNaTng3ZXlmR09Rc1c2?=
 =?utf-8?B?TndXRUEvSWZMcm9Gbjhha3RzcXlwRUVkL2R5Q1hGS2ZtVzJpT0JtNFdRdXBs?=
 =?utf-8?B?d0tvRDRZZytyY05iOW5yMnduV0wxeXVpaWk0Sk5WRTV6VUlFWVl5endDN1dY?=
 =?utf-8?B?QlVsT3BvcEJoaDBQN1gyTU1pelFWNXhOM3VoT2ZSemV5TjFhQTZjZkRsMVN5?=
 =?utf-8?B?Q2d3bXFNYW4wakZpUGVNNE5yNXJBWnBtdGhiQTV3bTBGc3hkOGVzcEp5NUk2?=
 =?utf-8?B?MUJnNWVXVFE0NkM5bFZoejFyZDlpZHAxL1ZEVWUrWkxUWjlqZFlLZkRYV3Nn?=
 =?utf-8?B?Zk1wcldwU3NMN2F5WkVkNmU0d05lQTVMakZxampCOXZBOWlzNEs3YTJvVFlL?=
 =?utf-8?B?QVRnQmNqQ0NCYy9XMTRKc1YrYjgxeTBUZXNFK2sxcUJjTkREWTd2bkpmdDJO?=
 =?utf-8?Q?lWQzngwrjqB3dcWdRalV74Q8g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79586cfa-c19e-4445-02ca-08da60cb41cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 10:18:52.4707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fp4xdNUSIFce6tWGoM08kKjNguuplQzYTe/JAKoeDPe/HeF7xXtoJYcz6i/YbmS2ST5gF9+9aGfo+B5SfpIWZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6522
X-OriginatorOrg: intel.com
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
Cc: "Rodel, Jorg" <jroedel@suse.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo
 Opsfelder Araujo <muriloo@linux.ibm.com>, "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin
 Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBBbGV4ZXkgS2FyZGFzaGV2c2tpeSA8YWlrQG96bGFicy5ydT4NCj4gU2VudDogRnJp
ZGF5LCBKdWx5IDgsIDIwMjIgNTo0NiBQTQ0KPiANCj4gPj4+DQo+ID4+PiBJbiBnZW5lcmFsLCBp
cyAiZG9tYWluIiBzb21ldGhpbmcgZnJvbSBoYXJkd2FyZSBvciBpdCBpcyBhIHNvZnR3YXJlDQo+
ID4+PiBjb25jZXB0PyBUaGFua3MsDQo+ID4+Pg0KPiA+DQo+ID4gJ2RvbWFpbicgaXMgYSBzb2Z0
d2FyZSBjb25jZXB0IHRvIHJlcHJlc2VudCB0aGUgaGFyZHdhcmUgSS9PIHBhZ2UNCj4gPiB0YWJs
ZS4gQSBibG9ja2luZyBkb21haW4gbWVhbnMgYWxsIERNQXMgZnJvbSBhIGRldmljZSBhdHRhY2hl
ZCB0bw0KPiA+IHRoaXMgZG9tYWluIGFyZSBibG9ja2VkL3JlamVjdGVkIChlcXVpdmFsZW50IHRv
IGFuIGVtcHR5IEkvTyBwYWdlDQo+ID4gdGFibGUpLCB1c3VhbGx5IGVuZm9yY2VkIGluIHRoZSAu
YXR0YWNoX2RldigpIGNhbGxiYWNrLg0KPiA+DQo+ID4gWWVzLCBhIGNvbW1lbnQgZm9yIHdoeSBo
YXZpbmcgYSBOVUxMIC5hdHRhY2hfZGV2KCkgaXMgT0sgaXMgd2VsY29tZWQuDQo+IA0KPiANCj4g
TWFraW5nIGl0IE5VTEwgbWFrZXMgX19pb21tdV9hdHRhY2hfZGV2aWNlKCkgZmFpbCwgLmF0dGFj
aF9kZXYoKSBuZWVkcw0KPiB0byByZXR1cm4gMCBpbiB0aGlzIGNyaXBwbGVkIGVudmlyb25tZW50
LiBUaGFua3MgZm9yIGV4cGxhaW5pbmcgdGhlDQo+IHJlc3QsIGdvb2QgZm9vZCBmb3IgdGhvdWdo
dHMuDQo+IA0KDQpZZWFoLCB0aGF0J3MgYSB0eXBvLiDwn5iKDQo=
