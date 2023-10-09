Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B28527BD49A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 09:49:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YhrbV2W1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3rlF4Q5fz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 18:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YhrbV2W1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=kevin.tian@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3rkJ1xgjz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 18:48:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696837704; x=1728373704;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1Khd8tcE33VNFsPCtLMSHp2tqOLq4p2ejvez7N/2BMw=;
  b=YhrbV2W1SVCE3vrhbkcA5mJmiO71dyTxtnCpwGOIj2VzJLSLPoVCnVYe
   TYgj+GjwoY8sEB0HNNpvgCL4JoQ+gC9SNgUOIAbGOlv4ESl8VwVXkkcir
   CoxxOOG0UwCORWNLC16D/Q8w/zPG5GYmb2TfHE4zwaqYttvRdY857dxLk
   AtsC7ES0indx2x3rqCLAeAX/c7iauG1kTORRkLZSPNEJ1J73rtdVN8PVt
   Sw1ODC/EftdhvWQskGJ5xjnY0DObvReoPfJCA7iBh7nnYFU3KmbPstLRa
   cDkNoi8fCiDz/SXSbWtuGDckHIVEkdQNAuRNgQgL2IkLlG9aXq8pT0pfo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="364380501"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="364380501"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 00:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="756627780"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="756627780"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2023 00:48:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 00:48:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 00:48:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 00:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUPaUOxXWe+aEQ4E7HUkPWN9VjF0Kx9hc+83rKvx6c+HcJUjJg3no85Z+vGXdJAtG1VWNPh9sTlaCNuCoXsvNVbKaSDccSfjvnoxFgr5BAFFCG3TrMQItf9IZCLczFtaYNJans231+wOlR1/22l+LtX9Tgxf5ajT47Z58NfniXoo7gPuM0dAaedFlNluwILRhsRf6w3rrI+EE+7Jmdpa8S1BmZgLxfpdhfwRf+6AJPeTuF4yzrZFM4igzE2Cfzby6RuDfos7iZOVJrV0fpqzQXouVQBQYZxZAOHihiSlBKzFJ0jEJ6fMLxAkpYh9rTwMhAR60EjmybycQRoiIC6Saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Khd8tcE33VNFsPCtLMSHp2tqOLq4p2ejvez7N/2BMw=;
 b=dZe41XWPM/+4ZRUb8ybX++/rjFpPG14NzrglafJMk0bviQ1GcstLbNw0ARBbDzmMzd7I/KZHBBVGEF87Hm1JS9X+gQ7fxDyT0JDdalYMFqZe++0G4Z0n6C8SCcWFjlEXEkApQHSh/jfg1AgIX/8HESb1e1VXZSevwKxpgfFZi0czGyEqZldRVRFAa4oTnfZLGFN9YwXIrm1lLIN0H6rdr8FbtshKQ5IGj1Uk7/maIyXzssJB5JyGzPlJLAWozRq0OAnGxf7b6224ErANFe7SCG6JoC7/Q6t47tDCKkPMZgsPln2tSapNPrxjzMRBV6Yh8Ynr7xHkax2VnCtriBfvwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH8PR11MB7045.namprd11.prod.outlook.com (2603:10b6:510:217::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 07:48:13 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::7116:9866:8367:95b4]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::7116:9866:8367:95b4%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 07:48:13 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alyssa Rosenzweig
	<alyssa@rosenzweig.io>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, David Woodhouse
	<dwmw2@infradead.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Joerg
 Roedel <joro@8bytes.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Hector Martin <marcan@marcan.st>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Sven Peter <sven@svenpeter.dev>, Will Deacon
	<will@kernel.org>
Subject: RE: [PATCH v2 4/9] iommufd: Convert to alloc_domain_paging()
Thread-Topic: [PATCH v2 4/9] iommufd: Convert to alloc_domain_paging()
Thread-Index: AQHZ8Z0Nwuo6PGrErkWqPWeScL3Ir7BBJpHg
Date: Mon, 9 Oct 2023 07:48:13 +0000
Message-ID: <BN9PR11MB5276357F748504D2C40AACF18CCEA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
 <4-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <4-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH8PR11MB7045:EE_
x-ms-office365-filtering-correlation-id: 42da43bf-d9a4-4ad9-7d35-08dbc89c175c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ml+FCnWTJ9vnwpyb+0mPsE5Fojk9+ESfF9c+oIwIRZy5wXglVBsU3lYYMkc5X46gOs/YL5TtB+doVGQIMagTr1CpUSBDrOZy5jZMOGvK0/91RoyR/68KcSTmZ8Hfq60lU5DwlOD12aRPH0cK2Xw0IAlrj2LF3kECkBIp9u3wXIGnEQI8BparmOgCTEigbvGmBbgfh43OHBj0nGKPHAW9FWYOa+9YrlVDM3acj9XprTszP0l6pqZfJCcCZX6wnpAW3EFUVXqg4OSdNWqbRlfMEiYGOFRyI2vKCV+t4id4PXHSfYS6W9M/e7LlL0liETijHQeipna0PzGA0XDGJfNXSs1kZKpGsDaodzqpMpf9HhBkoy2Y+eiBbQaq2FGMBTgBneHwjXrSAd1/F+GmrpO9v1RV8SmdJKUJkxLjQEj173v5NydWI+Wn0P/FAaW/YkGAx0VMIlw5dnO+ypvjo1fH4of6DIiuvB5UiUrKQcOukPGP6MXOYo8gZz2zia91Zllu6s/m8knOMrf7Zs/4q9aoCglO7XbP2e1rt9fsZ3yIvg48LxDuvfyL6aomUMAT7k4Fygt/6YMpEvL9kvK+e9K7oIGyKmdrTiGrP50cuS3InDo9XnD1F4K6TvP/W+DvOukGdBKuMxjRi6GcfSU3TRrb+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(55016003)(83380400001)(26005)(66476007)(66556008)(316002)(76116006)(110136005)(66446008)(54906003)(64756008)(7416002)(66946007)(8936002)(4326008)(5660300002)(8676002)(41300700001)(7696005)(52536014)(6506007)(9686003)(2906002)(478600001)(71200400001)(558084003)(33656002)(38070700005)(38100700002)(82960400001)(921005)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cyd+LvkZhT8zaXzcag8fB0ta4x+TBe9leRx0hy9mNrA2ivEkZjmsY1WIHppf?=
 =?us-ascii?Q?SPQrX4pGb2idUeA/84RMtTJ4egpgDXrGMVGW8KlCQcrNd2dMfCNzgygrI5f8?=
 =?us-ascii?Q?codOJyjBxmwsfPGEEUrmz+8/DSQnDxgxcXIlunLZgZFg0b46iuHzHd4Y4Lkx?=
 =?us-ascii?Q?XjmLHVeKPWEdj4wngc/+aDQBvtBgP3IdKr78vAacLX7uyNbkTEU5Om+GjULQ?=
 =?us-ascii?Q?eGwZPOy6kBxg7zmIWoPuTQJssnhQC8qv4/pMk8YlI26H9WUF/wba7MJ3sfL7?=
 =?us-ascii?Q?mw/rhLA4eZbxmik+DolC5pg0siNO+WMtkQMjPM/s6o6Gj16jdjG7IlTy+Otv?=
 =?us-ascii?Q?diaVSlrNdpC7MsiGg+cXHIWBwguBkdWLr286yOWWospu6Vzi3zPauYP2xzdc?=
 =?us-ascii?Q?bhB2LWdjLdUbb7Iv4uA0vsJckXDRXF1drLlLhHKrObPzFZMqygVVQnnSlIHb?=
 =?us-ascii?Q?r/a6AybGQWE/xn32FsaztSJLsCE8vjRVxY+tB+HSculP3J5zLlY6X98JKZCg?=
 =?us-ascii?Q?AexRiWT06rKMP4xpvIDuqYWCvDz6s9KGnswT1aB26a0eiPDksIDvBqZV84+L?=
 =?us-ascii?Q?tMFTio3/DybUv4l1q+HGTxk5D2NIe9/Yt0EktJS9bq7gfTQa/ODMYnByf7XH?=
 =?us-ascii?Q?cianLhr20xUfHvpZtn28nCk3mGa3qAXOOdnSfMy7tA+4/BqF6Aunsb/fYir/?=
 =?us-ascii?Q?1cHLyyoNS+b1uoPpVjFtL847UZIWfus7234jzEhNVDu7omadtKVxjcaoXMgd?=
 =?us-ascii?Q?8YTnVXTtS1zPt3tkIPoxfESrwbzu3OGIEF86g/0MZYPUvWvIMhx/Mes20yUZ?=
 =?us-ascii?Q?OeO+c+abeTnuNg56ouehizf/hwP9UxrHkvM3D62peNSUYSul3x+X9teXcuKE?=
 =?us-ascii?Q?RfPfmHyXHXUPh88gUFfYtaF8gfxVhp/s2WUfVcky/SbTtopRDVbhdc4A1Cs1?=
 =?us-ascii?Q?+B0/iRLX9OHAKis86ySwW/C/sxeiRnmDqDbCBuJMKB8wYtJsHRC6wzp/qlkO?=
 =?us-ascii?Q?b9YeZFH/gybQUWazRcz1BCzQ7xD1zhQ9t616pJ6RLOL//YZGkELzUe0U4ovv?=
 =?us-ascii?Q?6n/cR9xj59CFzecd0XGiDfndECcgjYii5IdgnDKSlRfPnzORwomprmhpW71S?=
 =?us-ascii?Q?i5SrKe5XErjvh1mJgl7FVSvLWGj6u51PHTsx8otfP1lWcyEwPp06O1HTr1Xh?=
 =?us-ascii?Q?3vWpHP4YYTcXVZpdtyzbfDa+AP2LOzV2S1Laqfs7e7riRlf3WEgpN3IYfco5?=
 =?us-ascii?Q?YLFIYlxafANSohkeKV4QFv17VoHwF57290nOdtfrEO98IpF5QscKahSkZ0Wc?=
 =?us-ascii?Q?7zMED6g9B/TlVWAdCYQf7SDUblQ1RezFi9OJH8GfJ24CWz+G38UEqjRT1Sxe?=
 =?us-ascii?Q?oK7gyPkR1ylgVZJ3elF9ZdT0Gm+05omTYN/0zD4NIpC5mWexI2ASecLNl5cC?=
 =?us-ascii?Q?3oPadSqLhbIyT2tVFwgB/OkXkpura9j3YDWu9Ixo73XgX/BZI9mX8IngJwLl?=
 =?us-ascii?Q?vWOofba2OY3J44dbtTq273veWD50MGmh1a4IgrAnvrNUJIuEH90opgn5fEPm?=
 =?us-ascii?Q?0g7eB8IdOJcX7Xcwi4dTz8lDzzgk2qA828kkrkNM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42da43bf-d9a4-4ad9-7d35-08dbc89c175c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 07:48:13.4844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVYQGgsXwAZaIHTdYG4HvH1Y8zVE+k90MbvC8LpTsiVU1suqFpD6ul56UaQFKGatRgI9g2I585GUEYNuu2AOVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7045
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
Cc: Janne Grunau <j@jannau.net>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, September 28, 2023 7:48 AM
>=20
> Move the global static blocked domain to the ops and convert the
> unmanaged
> domain to domain_alloc_paging.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
