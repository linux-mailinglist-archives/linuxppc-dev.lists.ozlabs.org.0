Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7B67BD4AC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 09:51:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TicWt8ob;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3rpJ46S6z3cnS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 18:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TicWt8ob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=kevin.tian@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3rkw2R3Fz3cHT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 18:48:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696837736; x=1728373736;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bYHoyD0+/b4PUdY4iXwsXc6mHqE9GBFU91jJTIwiLT4=;
  b=TicWt8obx4wz89I6rlkmlgfsyRdPyCFCq+aINJLLy0YN6NWT8Ckg4wMV
   ohF8jYqJNmd4uzioFsNxuLSfs+XRSozA3/6BN6PlX9Edb9L7Pduz0thHP
   lpfZXj1CMk6ZRNCrgoP/v99jye6SDSinpBkTl5FAA9BNNePoyA5RGyzE7
   mYsG67futUHf2UwB5eVsrqpUzu5BIQ68Puy0BvZgIaxRVsVuGDQid+5Zt
   GHQqYj+sv19VZVDVNK0V/nQpdk92exrAZO5C0aNOFzhKnxyG3i5GLNnBG
   3PlANALcIQXLyvEob3P8BX0Ri84zcLmEIFEZZyvWBfLW1LRyT9q0m0Oh7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381354625"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="381354625"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 00:47:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="782404041"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="782404041"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2023 00:47:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 00:47:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 00:47:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 00:47:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IadIbpmQE8Q7FqsRhWLFQMxf6F+4r8oeE4KIFuRraxA78eDB+Rz9WgT72+YmetIvVl8zWk/KMXaAzOS+COTvoyhyw07RsBgs5O1TCoNIyaGzHtNSyEQUsi3b4yLVklPokVrkwvppK7HdliCmLMswoXfjVA5ZEp0CfDZ11oKsj1BlzX1OvTSDdWHk5c/90jsrLAQ/2sQY5yDNX0Zj+d5e/p1Zg5YLm3tBDns7T3x7pgIQb4XWXINhbHz9xOBoRpxqYIzzQIYT6tTawJFcLz2qKUyZj0q+erUQ8KPyIgsVijdzkwi0PMQkgxaZaGyXRh5yW0DjedQHYl+azB4IHRd0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYHoyD0+/b4PUdY4iXwsXc6mHqE9GBFU91jJTIwiLT4=;
 b=JjV8sZFnDeRlAcGkiuuPnffc0ryhzJdZxOn11UdWx0Z4YB99tPd/tTxMMXHRPKu8ZTANFyyKyAxTmySjJf2T0U+HmeQ+nRQT60zJwRRO4oHtP/1mM6Lu4HKv5arb5ks3yIgEQ57Id2ASjiWztJGtMak9C9vtgngq9kyNRIkK7BwQ14qqBdFx/bye2q3e2CvNiJqW9EQr4sSiUS9DKCXskYfUfxx/kIsTVU8RzfL3mZXE8yMw7QkoFYbZDpjTa9/JqZU4NDIR/CjsMW7HcUHKmZaS8CzNy+CbrTWvOYZJzH6bw19iDB0s8kf64OXxjhEC7vJDYQDcFpvINqSyq0uuyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH8PR11MB7045.namprd11.prod.outlook.com (2603:10b6:510:217::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 07:47:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::7116:9866:8367:95b4]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::7116:9866:8367:95b4%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 07:47:47 +0000
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
Subject: RE: [PATCH v2 3/9] iommu/vt-d: Use ops->blocked_domain
Thread-Topic: [PATCH v2 3/9] iommu/vt-d: Use ops->blocked_domain
Thread-Index: AQHZ8Z0LAuKskghIC0yb53RiGV23trBBJoHg
Date: Mon, 9 Oct 2023 07:47:46 +0000
Message-ID: <BN9PR11MB5276D24F96465287BA28E9DF8CCEA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
 <3-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <3-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH8PR11MB7045:EE_
x-ms-office365-filtering-correlation-id: 1e24df82-04b2-4c7f-af9e-08dbc89c0791
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: peqfw0BrUaL4cFJeRKabMqF0vTlna87ZRT8okzDDENG+aH1aW3Lg4Xolsg3nR5I5C7Ax6dmIsIXZSQZWRHJY3hN27QomfWfFsdBd7UXJoAYxhKIHD5TxSvIUi02lvqKU3nes8CSA3sf2vrm82HDU5gkcV0k8yAIUO53vwILydJ5qFBAVawKl0alEyyBtINZN1kQ00sI9NFR39Nt+CK9vDCwB2XPAFzm1MozgenYzZpLsrNTnsKy7Kl3TfwiuCD60HBRn8l8Lv7uQpEOny9J2WBc2/R3hH6tWJGpcMN46ETxyHUAe1TqRxHaj1GEEL5tP63Dl5t1//+tuqboDuEuDSgNoC54YV7P4cUhraSbKDi/5f/jtZx9fIOxc1oMfQfSL2ny4mEv3K7X9XX0v2mXnugvxvMna3OUVuxA6NJMB0SnOJOSK2ZsPZzQG4j0pVQNNqlzq0HlHXgybussZkgBL2QJNBD0KHlhirCXTIZayg2UvTu2vD08VtKBteKaB1c658e+PQMNlC+m4g6mhyG/Yr003ZfFkgEUu+lWVIzNvnZu3J2VkXIYLJe1R03Qod7HTyr272LIWdSQ/roZ5GGcOhMx4mDctp88oqs8mEn1ClRwWODAxOgpNyMSO1g1IE1SHy4kNrUWkPTIQxNkJ6JDVtw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(55016003)(83380400001)(26005)(66476007)(66556008)(316002)(76116006)(110136005)(66446008)(54906003)(64756008)(7416002)(66946007)(8936002)(4326008)(5660300002)(8676002)(41300700001)(7696005)(52536014)(6506007)(15650500001)(9686003)(2906002)(478600001)(71200400001)(558084003)(33656002)(38070700005)(38100700002)(82960400001)(921005)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5pyk7yEE+j8s0uF4VBQK5fqoX/eAFgFcGFT5FCik56AY9puQ5imQRX2NJH5Z?=
 =?us-ascii?Q?7jCcsZp9cnH9isB3hEggrZnGwSGTytMAX75H1LpqDyd3y5TAph/cT5rrmnug?=
 =?us-ascii?Q?CHl6BUt0yC/9fSNIcEJMhBIzTFCuaz0GxB6gx4zKNNMIT+5zjr0cdPfiKbfv?=
 =?us-ascii?Q?y/f16VjwMdS/z95MkfL+AZefxTKA2BXs6+uk8ft16f6GCKWMrYsytVlmqdbM?=
 =?us-ascii?Q?ahDZV4Dl92u3q0eNrRhFqMEnnWIt8E9oCGGtWDywPPO0dGlDLjdKlBZg5Fwk?=
 =?us-ascii?Q?3+tTv2RkeVcwUFN0wfvA0j3YRXPctI3feBLkAcHtOywROwmObPqjE4QyzW7y?=
 =?us-ascii?Q?QvChJAXmqoSyQgpuUf3NyjoLYFFRodnPSxwjbLYbdBjv1lCNFPNDYtzmiZiT?=
 =?us-ascii?Q?B4NUvHN7LH34lsx6z0F/OZGXPStZLrPhS2gKjzJCGdV/vsJckYwa3tDpxILo?=
 =?us-ascii?Q?S7kgNmv2wI/cApO5kA14lQ+jyR1wJNoudxyzM4J5tIpc5nEGgdPtygIddi08?=
 =?us-ascii?Q?rKQpQcEm2d1ihnuzBKb5dKlnTPzj6ThEF1pGmgVqm0H/uE/ILb8XwNfV7Fiu?=
 =?us-ascii?Q?jKSDDMM4Dhikf65+wVM0tPDoL0+fdiCguYC1g1YCOvHfct+Hpwvz2XoZEkD0?=
 =?us-ascii?Q?/RCcuq9HauU8st4pMCFUQywGGD0MHnRVgpSJNO/K9c376vIgVssaa21aAX10?=
 =?us-ascii?Q?g0yO8hxP8xbHdaAuxMJcmEzL9clw8lxBCRvIEU9pE5b7O8iBaI/KgYw37vCs?=
 =?us-ascii?Q?1ahAE0kdbkNajwofJQAwJNXKSgE/wWcjgp7jO1AAmjli30hKEgH1svq8org3?=
 =?us-ascii?Q?aeuuFxfHuPi5juzoqOfVZE2UCvbGRmKBN+KsqYUnqG6IlQ12xU/3p1QZlYGW?=
 =?us-ascii?Q?2ryg5WK5eebLgmKGtYFI//TM6jbunWXVKNudEks+IjpN4hMstA/iaS3FodFf?=
 =?us-ascii?Q?PSxOCygYNKvu0k1Ucrm/ffNKsIw89T0sj5zqVnyrGQMndayTJfN5DU+GSp5n?=
 =?us-ascii?Q?i1K/nXNRteqZfRvbTqETx3fCbFEh7W/IMFZew5ETakJZrFmIYEiD9JyQWWQ8?=
 =?us-ascii?Q?rNIy+1lw6Ah7pjCHic+bDJzIhQrlkxbTkD6OGdLmIZiJmtLwBt4jwF26rd0f?=
 =?us-ascii?Q?lX/wpZDxgtsQZH6TX2nzciAdt4XOeKeNlB6DygnjjU7uu0VODb5M1nHylg4b?=
 =?us-ascii?Q?mpgVDy/L5WTP+XhxoRQ6yuwqoeqKz8oUZgMuTwG4IrZkDI93aju46thvb6AB?=
 =?us-ascii?Q?ZiOmE9vKfdRyornSXC17bnZ8SkaL+Crnafu4UJh1Zjhh6eqbv73fS0UmBYQ0?=
 =?us-ascii?Q?cBR6Ths2pBzsLp3i+euXtGYdA83YJSENS3gKE3xRWLbLfVYCSvd6n2z2ebVW?=
 =?us-ascii?Q?57q+L/brwS4ecjCm6WxGHfkj2MY7umZ5rwA6ln4x9X+7KLsWH/7nBzaI11du?=
 =?us-ascii?Q?vGZVgGvSnTLBMQuzBZMGZttiISqYS40IPRtBaC73DLv8XOno1BqW8YbrC3gU?=
 =?us-ascii?Q?pf0IssKm5q8njz1QhYBrreW0XFxxB7aMOLFAGCfR/f91y8L2aHwSp0UG1uIc?=
 =?us-ascii?Q?38H0XrZyYBUHCeyVB0lFctTpONRElYEAWg/DHdvD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e24df82-04b2-4c7f-af9e-08dbc89c0791
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 07:47:47.0335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ie30uJWHZUwklSebJl7yLeCHl+aYXO/+dlvGNy3XftWi0UhoE+adHx9cHFWy+UtklaxjLwv70cSsRzrL7SW8g==
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
> Trivially migrate to the ops->blocked_domain for the existing global
> static.
>=20
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
