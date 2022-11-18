Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3782562EE7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 08:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ND7rR0nhvz3f38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 18:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dGhS9tDq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dGhS9tDq;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ND7qQ69w3z3bjQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 18:35:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668756931; x=1700292931;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=11muvdBO8sITiWfjRzAAYaxyg8dpZJVC4K6Z0ePBoQA=;
  b=dGhS9tDqM31zZWskZY28JNd8dZ/0p04eTUtBkJ8dRkXLxntEcPBNWdqa
   DsyXTrxhRCjzB1+LwXWiI8sA/FgYrvEs/krM+IgXegyZOId5VuoO/TxPD
   o+bbxhkn2+R2/pOwZwtbFq1wIJ6ILqFH//twJrAMTSs8dns+9/tqQtDq0
   y5GC+Sr+nrzIQzHL8oU0vnxK4KkdNJh898g1iaifmxp831mDN8JMYPp4V
   cLDpUf8Qpl1tabC22Xi+Y/UtMeoBp+Lccqlti+LRWEXlbG9khpPMOrpeY
   WKMA+pLfmU6Up1RspDalmVHdwzmvi4JfRmM6hoDmgxj/b3IjE21oTvqqR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311781332"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="311781332"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 23:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="885198673"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="885198673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2022 23:35:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 23:35:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 23:35:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 23:35:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXHUrvyby21ZJ2UIP1LQKsi7SZbEA0sBE2S1tEQY0kHHv54217APS2SGT6HUbUYX1w0BAwcTbcuXC9icSxIlNvvpBtYSk++mKqrXdIUlSIiW3ZM4ptGw/LM4n7MqFrg30xIGYbhKT7diJhDibaPpcItf06fHkaXRLZYLdEJDp2i7A1hPCtVkbHtoMZQGsFHFc4dKX2rN+/gDQk2+q5+sAF8bgzz2CxBoUMyrE1ZSdn7/cvsx3NI4g9x1SVbP1GsWPimtALspDSOyfkAKexHE403CkSa+jwwXynQpKdCagtFxY0vTxkak03up5IDQHOTNbvhE4APzJBQbEYjB2Pmf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11muvdBO8sITiWfjRzAAYaxyg8dpZJVC4K6Z0ePBoQA=;
 b=bQd30BhlDvJeSy5ZajQeR89e4VmbbU97WJKuEVvmJ7FDMa5+PEF9e3KAkjxneBmRDVvMszCoQ7woNJuE6jwZK6LafCadGBVoPounXd5Eo6P4ZnxHlEvJeGPcUQQrfNH4i+KVrPHpCAHp+l9niToixxMcoIERS50m1PeGcORi/Z0CITIwG40mdMI/wNuxU4iU2mMVGV+9WYsp6G5g1Qob9sWcZFo9sp9jtjEawm81iwPe/PqjGVdlEzgqKR8TuISuMiEczcbZlAjfZUSaJ15KvYqIY8fcWtgNNKsp9vrDdE+F1vDZ1Ye21icmbRfTG4igGdNos2glefZatc04iEIYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 07:35:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::9929:858c:3d20:9489]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::9929:858c:3d20:9489%4]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 07:35:15 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [patch 01/39] PCI/MSI: Check for MSI enabled in
 __pci_msix_enable()
Thread-Topic: [patch 01/39] PCI/MSI: Check for MSI enabled in
 __pci_msix_enable()
Thread-Index: AQHY9dUeS2gQh1Rq9kqBKfbeUjxWSK5CyXcg
Date: Fri, 18 Nov 2022 07:35:15 +0000
Message-ID: <BN9PR11MB5276733F02CD0D9F2CE1B1E58C099@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.653556720@linutronix.de>
In-Reply-To: <20221111122013.653556720@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH7PR11MB6721:EE_
x-ms-office365-filtering-correlation-id: 48d3ecc2-6a26-46ed-39a6-08dac9376f8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yEIy0mJUSkY2+kmsjG33K8lYQ4XcZzjoh3y+CmnwLHDOhG+H1iOfm+vWHsvUfdM6gQm+fltqY/HZg4Co7Ra7y9cXF1IDaTIozGAii7CUiUXhbd2J7c+g9I7ow8WK4zJBY2sLdjR1XaTBkF/dZP8UpCNOrbUCi9M+EWZ/Lr0Y6yoZeU83H13KKcYtD1T7cTj2n2Zf6SVTJfZm1aLnHVJYjtXOdCS3IzKkmPMZJn0s4/RD5JT33o+QGqf4NSiEyVp/WEW0/PjPDLQf4OiTfQKX4LaRtpO4K5HCCg6yaccoIkdZf6R7c7uIiyeCtm+Zl9LjcfTPe1u+Z74Y73ribEvuf1T0FlH5AIxvYFcK/LFsQ8k7kSkNNzLkKeeCQv4lvwgxbgIh/Zc6tTZ3ktu84/DKXKml5fCjunpbz7vP+eE49xFD4p31Xu6d6ITRVAa6wRJATSIF1uhj060OnPrPeaLHzE24ouVc7/F0vLqW2WPcMmQvT6y1eYUee6Wj80WqTKd6/adHTTULcPLRqOwWv9G8/F0wPqIeZC7iIZ/SK5Us4PRGXctvYGELlIPTbs56nQEZY/YK9BRSpht9qGD66z2Jc4Tg5qCAx3B7gdQBE1lPXGTtZ73t+aGpu+b5HmFvlFP0FXfKfQyGz7jpOCMYNbgQBIPazdVBtMeEyP7yo1iZeAgWTtVUaIPZPElOsw7UprCPmct7YZhxgvFE9rDQcmW1sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199015)(38100700002)(8936002)(7416002)(41300700001)(122000001)(38070700005)(316002)(26005)(186003)(9686003)(107886003)(7696005)(55016003)(110136005)(2906002)(83380400001)(54906003)(6506007)(66946007)(76116006)(66556008)(71200400001)(82960400001)(64756008)(66446008)(66476007)(8676002)(52536014)(4326008)(5660300002)(478600001)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDZOVFo0anZsV2tKWEFEWlJvbDJpazRTRk5qbkovQVZPWWVTQUw1bUgyd3g1?=
 =?utf-8?B?YTcxYnlsZTJzU21LQW56LzhZRTcxNXlCaGZDcVU4enR1K1V2SGVteGtXYlpz?=
 =?utf-8?B?WFJMcHpDVnB2Ym4wdS9GMkNDK2YyRm1MZkg5RTR2bEFiRVBrZk5iVHdnYXVq?=
 =?utf-8?B?MWxxaHhKYmcwTXp5N2hGWU5mRXZEa3llYVo1THk0N2k1NFBpS3VxWjAyTjd0?=
 =?utf-8?B?dU1ZbHlCb1N0ZDkyRWdvbzBmcExRRzdZV2IvcFI4VEZhb3RrcTlmTElLcjNt?=
 =?utf-8?B?dktwUVBTNUFCTXdzbnBIbkxidlFoK3crQ3M0K0c2SzJnV2Vpam1NQUJMUDAy?=
 =?utf-8?B?RVdVRjV5YjVhWkdUY0kwUndLeUlEWEpRYldxS0RHWHFtTjlteTJDU3NaU2hF?=
 =?utf-8?B?RVhvWE01TTVlZCtTa01PbWhpWDd4Z09VRG0wR2FWN3o0aWxtTlJTUlhabm50?=
 =?utf-8?B?Ly9vQ1FrQmxrVmpHUCtPSENDUHNCZE5idlQ3RjVvaDVoUEtyR0s1aEtUTzdK?=
 =?utf-8?B?UUxMdUQ1TUtJY1ZuaXlKL1BRM2pDeER6dFhyL3N4N1grdXphcnVPV3h1VFZI?=
 =?utf-8?B?UFNSWjQrOURCT2hnTG4xdkQwYkp6dldERkQxQkkwU3NIUWdlbHFPREhTVkln?=
 =?utf-8?B?TWZ6OEhzQVB3dHpudjNnOEtNY0NPWXFIWlR1amhJMkFRbWNvcWRNb1U5MG5T?=
 =?utf-8?B?SGVwQ0ZaM2lmbk1aMUk3blRWTzVoVFYwYlNKWk5VZGJ3eFBiUTZnTXBsNVRr?=
 =?utf-8?B?djRHeVpzNUp3dW82elExcitaSUZlRXhjei9CcE5jUWlqa2RtNys3RldWdE02?=
 =?utf-8?B?ODg5V2oyeWhZZmV1MnlBTjlESURsakI4YUMzYlZlaUIxek5iSDNlRCs4UHRQ?=
 =?utf-8?B?UUh2OUhTSXFRU2hLbGpheGdvVE5pMHlLTUhJOEVQS3ZjZXVxem5DLzdNU01t?=
 =?utf-8?B?Z0ZoQkVweWRCU2FOd2ZGVHhoc3Nxb1ZHM1VBYmdhV1F0MXJGN2VDWlZHZDhm?=
 =?utf-8?B?Z283MGsxN0pqNXJQSW1IcEZuSG5aVVRJRmhkQlM5UTIyenlFMVgxNlJmVTNr?=
 =?utf-8?B?d3FhM2pLSmFuckYwTlNnQit3NUZ4UTlYMTFnZFUyZExiZGpzNVRuUCt6U3NG?=
 =?utf-8?B?bTJGT2p3UlpVMHltYk9ncTRLbldSTHJ3UFlTT1RxZFArc216OTBCT2ZFYitD?=
 =?utf-8?B?WmozbTdvZzFRQ1YvSDl1U0J5MFdjK0xtSHJiOVl1LzBpNzl3OFA3aVV1dHUz?=
 =?utf-8?B?a0pZRC9rczY4WGN1ejZZa08ycWVWT21nTHBWanFRdXBqWkw1QmdoOHV5bUZz?=
 =?utf-8?B?eHRiL3VDVDBmTy9JeTArV29SQTBueHpvcUhWZ251ekZ0UlF1SnNLWlVkVUha?=
 =?utf-8?B?dTllRUVGRlNQeDlRWVBTY2JXbEZqeWJ2WW04dUtzK01mZ3FPSXNoQmxlbElw?=
 =?utf-8?B?NGNJdjdxWkJMQTNUTDc5a2pIWENUOXFTQkNnSmd6bnliRUdTQm14UDBLakZH?=
 =?utf-8?B?MFFlVjFjMnhzMGl5WkZhdkUzYkc4T2RBd01DU1VEOGIza0p1QnFDbXJpb3ZF?=
 =?utf-8?B?UFErMFpTUm9sc1VZTFQxK2UvNTNkazJhcGFXZWoyMnA2eEpMd1NqMEUvUitT?=
 =?utf-8?B?aWpDTTJuTlFORFo1eUJsWUNjUmhsZ0Zka3F5VjA5a21kWkVpMXNvZC9XakRM?=
 =?utf-8?B?b0dTODFZTmxKeVl5U2JUWUpwWWVMMTI3VVAyeDNJZ290TkV0Vys4NS9WR3or?=
 =?utf-8?B?TjNQaWlmWmZ3Q2crb1JCWkYxSFlLYkpaQ1FjMXV2cVB6dmJyWHBlakhvRmhJ?=
 =?utf-8?B?QytrajNRMU1YMXJsYVlnK0NpUjlUdUVpeFhVVGZPeVZLdWtPczFMQVNRVDk3?=
 =?utf-8?B?Uk5FLzFld0taRmtmSTR0VExNWkJTaXN3elo5MjVNQWNyaExsWk55QTBJQU5r?=
 =?utf-8?B?bE1rS3dpL3dLMXFodk1ONlVuU2k5UlhBTnJhMTBqYXpIMGhDN0JLbU0xekt1?=
 =?utf-8?B?b0xEL1hsdHkwRnRKL1lSMTJwdXg2SnJGa1NhalVJS3l5b0dEa1dwK0IrNU0x?=
 =?utf-8?B?ckorYzIyK1ZBQWMycHFVVVpRZ3BVT0FoRGJmZGEvb1NDZVpSYTA1NTAwYlVU?=
 =?utf-8?Q?wWmRRWhphUIODsNdheQcLrXrQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d3ecc2-6a26-46ed-39a6-08dac9376f8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 07:35:15.8035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GekbYZmC0VXO5Xdfu6KPzzR7m2xUtbRYa0czLMmgbB2UTcP4QPG1M2BOLenURFcZdNdrYeOFuCVNgW8zMVm6sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
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
Cc: Logan Gunthorpe <logang@deltatee.com>, Allen Hubbe <allenbh@gmail.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Chatre, Reinette" <reinette.chatre@intel.com>, Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Williams, Dan J" <dan.j.williams@intel.com>, Jon Mason <jdmason@kudzu.us>, Will
 Deacon <will@kernel.org>, "Ahmed S. Darwish" <darwi@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4NCj4gU2VudDogRnJp
ZGF5LCBOb3ZlbWJlciAxMSwgMjAyMiA5OjU0IFBNDQo+IA0KPiBQQ0kvTVNJIGFuZCBQQ0kvTVNJ
LVggYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZSwgYnV0IHRoZSBNU0ktWCBlbmFibGUgY29kZQ0KPiBs
YWNrcyBhIGNoZWNrIGZvciBhbHJlYWR5IGVuYWJsZWQgTVNJLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9wY2kvbXNpL21zaS5jIHwgICAgNSArKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gLS0tIGEvZHJpdmVycy9wY2kvbXNpL21zaS5jDQo+ICsrKyBiL2RyaXZl
cnMvcGNpL21zaS9tc2kuYw0KPiBAQCAtOTM1LDYgKzkzNSwxMSBAQCBzdGF0aWMgaW50IF9fcGNp
X2VuYWJsZV9tc2l4X3JhbmdlKHN0cnVjDQo+ICAJaWYgKG1heHZlYyA8IG1pbnZlYykNCj4gIAkJ
cmV0dXJuIC1FUkFOR0U7DQo+IA0KPiArCWlmIChkZXYtPm1zaV9lbmFibGVkKSB7DQo+ICsJCXBj
aV9pbmZvKGRldiwgImNhbid0IGVuYWJsZSBNU0ktWCAoTVNJIGFscmVhZHkgZW5hYmxlZClcbiIp
Ow0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gIAlpZiAoV0FSTl9PTl9PTkNF
KGRldi0+bXNpeF9lbmFibGVkKSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KDQphIHNhbWUg
Y2hlY2sgcmVtYWlucyBpbiBfX3BjaV9lbmFibGVfbXNpeCgpOg0KDQoJLyogQ2hlY2sgd2hldGhl
ciBkcml2ZXIgYWxyZWFkeSByZXF1ZXN0ZWQgZm9yIE1TSSBJUlEgKi8NCglpZiAoZGV2LT5tc2lf
ZW5hYmxlZCkgew0KCQlwY2lfaW5mbyhkZXYsICJjYW4ndCBlbmFibGUgTVNJLVggKE1TSSBJUlEg
YWxyZWFkeSBhc3NpZ25lZClcbiIpOw0KCQlyZXR1cm4gLUVJTlZBTDsNCgl9DQoJcmV0dXJuIG1z
aXhfY2FwYWJpbGl0eV9pbml0KGRldiwgZW50cmllcywgbnZlYywgYWZmZCk7DQoNCkl0J3MgcmVt
b3ZlZCBsYXRlciBpbiBwYXRjaDMzIHdoZW4gc2FuaXRpemluZyBNU0ktWCBjaGVja3MuIEJ1dCBs
b2dpY2FsbHkNCnRoZSByZW1vdmFsIGNhbiBjb21lIHdpdGggdGhpcyBwYXRjaC4NCg==
