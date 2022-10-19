Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBF605154
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 22:31:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mt2Ss56vhz3drW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 07:31:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P8UwS7tN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P8UwS7tN;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mt2Rv3T0pz3br0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 07:30:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666211451; x=1697747451;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qYcivq/H5iFdUMepf2B2X36P3YpSNn4pozoPEXzAK+4=;
  b=P8UwS7tNNRPiAxa2jR4H8auAWZ94g9YHJ7CugHdbboE0/30mSR0o9frA
   aoRCGGFBU5NWzVIFxVXaspampAu80FfTZx2E7bJ3p2neB+3sYnXIMrort
   kQLCZij6zhm+NaJ3o0tdsH3XoP7Cq+RKukluupqRyAZXbLM8EBsBwbyDF
   XkeocBCaD5XSpBJX/ijwuoEjsZanFfgYWG++z9gnCv2oxvQrOectqxDSK
   jcVdJbP9CYTZTpgW91+PkUx2qfzWiK5CT+WK35bAO+D7uTaCph6V1Xwa1
   xDcdM1IU48WDx/uj0RMHgIEj7htT8D6kAnupO5yfoWe8XEil3Ct+IKMih
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306513451"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="306513451"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 13:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="958518627"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="958518627"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2022 13:30:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 13:30:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 13:30:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 13:30:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 13:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayFGyq+B8jYX4Epa6gEdxJUDHkM+wNgmvY2HIUBKMcEKfj0XSVcrWyCrc5Wlygpg3o2FhRMiH2aBvFi/X9/X5zFRjrHzVisDJv3m1b3TraehH2O6RLDIXEGbdwmrOQHMEr3dASCOkvIFK8SbVVYtvRDp+O+fFWx5JbF8MAXxTqXWjBdpjujNWks7SonDrsW+pZe9Gf+UeYrqbmxpU0bZnOWuJSM+Wu+L2yzC2yUZHn8zc2Sv9SyxXzwl6fBsLXJ3LhZPBCpUoknZDgoGUXJO6IVsORG78ToKxu+yK5ORLQNSdzEyOZhVRXvC2f6knW/03rfH1ySsNJHMAF3vSWMCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYcivq/H5iFdUMepf2B2X36P3YpSNn4pozoPEXzAK+4=;
 b=XJUKNgTCkhxq7kUnHv5JFNhftoTgHLr5qTlIdwEF3WrTh88Cmi/C7/NIKFQbyM11im9nRJClR+8Z1CLJp7vTgNDEuoF2hvC8dHCy+9oq5tzO10N5xuOYaR5IsbtVdW7KgTXbhVH4fVkizHRQeqehIvGAYpK2LjEtalQLqrsdu073mVIXz18pENSCxE2nmTQephielyvPqgFqpqHg+d22v93ZcFa6xopJut6OjDybTYWDRMJS6we74mrrjygPfIenYz8nO7mMrbyQqC91tk/X/mc+FkwbuV89rl5bWlbYLx77UJA+3gyxa7PUG9khOTBHuTecfYevQiSggTcvnU4lJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 19 Oct
 2022 20:30:41 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::10a6:b76c:4fb1:2d60]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::10a6:b76c:4fb1:2d60%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 20:30:41 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Thread-Topic: [PATCH v2] mm, hwpoison: Try to recover from copy-on write
 faults
Thread-Index: AQHY4918CFTupvxOP023uLR6ydGaFK4V/XcAgAAtXAA=
Date: Wed, 19 Oct 2022 20:30:41 +0000
Message-ID: <SJ1PR11MB6083134C4D58D3A49632460DFC2B9@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
 <635037c26bafa_24ac294c7@dwillia2-mobl3.amr.corp.intel.com.notmuch>
In-Reply-To: <635037c26bafa_24ac294c7@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS7PR11MB6221:EE_
x-ms-office365-filtering-correlation-id: 00b43950-cd0e-4dba-74b7-08dab210ca7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GNoitdkwdnReQBCy9lQ0XmoklG4o5oFhjCyFyZIJMk9BtD7gYw/LTzS4kfms/7KrpF/nEfQpfOmUib6AX3k0/4BOrT2abEvJmOb1Qt1Y7bq6mWr65anU8BRnE2a5JIh/u9TvL/+S0qvJd1H2r2P3gLVoPuF4uJDWXF3ox7gavQWjWjo1tUWA8ZAkqZLxSEfab2wbvM7/snY9SdXD8MwxgDexucMQMmLZHIzMf4+oA73L70HqM0eD+1BzLykcBaYZKOYZATHDepBvmmMGKsgQN162za+5jj0WIDmTf9CNgoGQQnlsPO2aOPhMQDRclHjNJnBhV67ZpLabUw0ofX2nY3RVkVNJyU0ccvKo1Bbt1laN/6LsDtpP2DP5DqbsOPDyos4vnsuNfKwdkfcqvmnOgLIM56F+ACm5pyN4gHkSFuSf2DnYH1DktakHRv7w6MbMAXgROA1IgmNGaqFhO0xqzCjITxHFdY1k/hTHsZXZnqLTAYe3t1KHskcf/gVz2PHinrMUWjYAHqHzFK46oEwXF+QAuYLshwDOYVe/5ZWNqOMmOkOnq2bErD+k8r0hW0+bq1eLg2/gTHCmye+qNErwpg7pNr/gr+wmcvRJ8TIcYr1/Xcnej4cvo9Zg7CAe9/cg3r3YCmPOz7FG9J05txe+Jq3ts+RJsndepvlwDcw6grgaqkP2Y/PJpVy+l5qNGIjc+X1uYF8F9YTc/wFWUtsjntm6m9W+MfgOaQsGWTLE0+9BMcYHp5F6gEe1K/05sYIdBFfRiaQkrU9XrTREE1FaTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199015)(55016003)(38100700002)(110136005)(6506007)(7696005)(8676002)(64756008)(122000001)(86362001)(82960400001)(478600001)(4326008)(71200400001)(7416002)(41300700001)(2906002)(38070700005)(316002)(54906003)(66946007)(33656002)(4744005)(26005)(66556008)(186003)(52536014)(8936002)(66446008)(66476007)(5660300002)(9686003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u5CToDFx6P4Q5Lghuvr6eHuhijdNq4zww0XmB3iaAvtaeYTrwHQPIiRLLmS6?=
 =?us-ascii?Q?CKIlE5zttdRTBiU8Ap7zV/Y8UhV1BgqCOCDK49uLJDQSzZHPKGJMhmUFgEfF?=
 =?us-ascii?Q?53GzjvgFz9YMtNf9RM1XXPnstphh/ebxj6VRwLXWOVoVmeSVzg68x0TjzToO?=
 =?us-ascii?Q?1LA+c2oo70Mi2QrKIp+PmaNd7fcWq1MwR/U5pfkMsefh80Y2x63SF6PEIjuh?=
 =?us-ascii?Q?cc7rogaJ8KtLlfHfJOb2vp+gZQ4aqsxvRUQrYPIEi9djx9UBaOJVFzREJZEU?=
 =?us-ascii?Q?ClQOa/j5I7aZWjGwaTNSVKVdRM+fNlK6AEHEmmJQ6Sy42WJBk/7FpwLhgHws?=
 =?us-ascii?Q?rR/Kn0sgxcIsPOQKnorQ4be3hzN/oV4CD3TDfOMdqzPE97FJg5vr3PoBJ4Sx?=
 =?us-ascii?Q?J7GUGclg1kK9eCTAKSbqdrkmt/m8B75zMZailwsbxlUUpfyq4u5j8rmlw/C7?=
 =?us-ascii?Q?Kx2I1YfE/x2jkXMb7lWEsvW1L2T13ncfMYPFn0FMrEbGxn7isjiHUR7XOZ9h?=
 =?us-ascii?Q?AFagv2OmMWpxtkYw1BmwIW8rYPL8kgBBc8QTS6e2Bx4fCaOoUSSe53npcx0f?=
 =?us-ascii?Q?8hqd5wI7zypKL2dDj5hKyM4P4RiOhjA7nTWGFXxWsGuVGplFr7i9t4n7Zmps?=
 =?us-ascii?Q?i++sUmYJcHpCdqeBIlSuFWm9v5UWfmhxhHnu/dw3GHkAmS8QFlGLpg/seX9F?=
 =?us-ascii?Q?/h50JtTf3h/htbXoavTboXX9d9yrlgSOTQqq2V6blEyz5MAUs8DTX1Hkm4U4?=
 =?us-ascii?Q?5Rse9u0LWwiPFziSuNd5jHsMvk75uU6HKcnTUrPSLEHdGxBaNuX4g5+p9UCC?=
 =?us-ascii?Q?v4RLwCShpnD+L1MzxysYRBM8YgDQaMaPqYieo/N7iLb0fl7RJ5HyZDnLaEaU?=
 =?us-ascii?Q?mYZC1xnLyDOpPL8FcYPrKfO7JhL63dt5i6V+ZYjvP3I+7ucQe2X1K8wSL8l4?=
 =?us-ascii?Q?4Whsk6j4LGvDELKH5x2E3Y+U9KuRh8+UuODmi2D5pqgq5BlZw7qRsUZiX7oZ?=
 =?us-ascii?Q?nBUsXe40+XkLFo7RiWEh+3Q6jmcNVQ/8r0A/3ibJQPvq0BZpw0C2cfpw3xCZ?=
 =?us-ascii?Q?QjrlWwqhgpi16xVp+gPgFXGqOILwldQNYaX4T4C5npKA6fP5naq/pfrBTKiA?=
 =?us-ascii?Q?0rRbc945TF01GybGL1/09bknXUZwSKE3e5FTdClssK46o1CA3tcWXLDL2lth?=
 =?us-ascii?Q?Y2ebMbNE/Pv+I0eu2pGW8v3QtDHAoAtcEsIP2LaOqXWVziGy/u26wWh4TxU5?=
 =?us-ascii?Q?R2JVq1SdnSLSj/8WDCp2Vp6a8Ft8RUimqmlToQmEDdQCme5aw2haKNN6inpZ?=
 =?us-ascii?Q?Ai+nm6owiX5NiTh6vxwV9gX+axKyYHVR01XDE7rsBoBvUXV1bNm/16qeBec8?=
 =?us-ascii?Q?URi0I8x4KZsH3WhilBdeNY8ed0KWLAhKCgIYQyhzjSWEAD0cbTzdYDGhGyGI?=
 =?us-ascii?Q?HwQS0MgrYGn8bSGzHTUhDxR2Zf8EsDtLCcw4S1/RaOFPlQIhe7+dfLjwMv2U?=
 =?us-ascii?Q?t28g18KrtA5KQnPcgdaqlNhvwba+OqvcqdYDVFa10Zd7XlAXgMiBEo4NM5+f?=
 =?us-ascii?Q?/bEeUKLNHGk8wm1z1+8FQVNp5T+FS2WWaTawIzvp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b43950-cd0e-4dba-74b7-08dab210ca7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 20:30:41.2408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74Iprjuk0NtlXtm+vFaMRKcRsiTE6526zuBU0v4AbKgE+teu/vdIdKJlHu3RR9zkEzo4yuL7UBOqohv+arXmbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Matthew Wilcox <willy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Shuai Xue <xueshuai@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Given there is no use case for the residue value returned by
> copy_mc_to_kernel() perhaps just return EHWPOISON directly from
> copyuser_highpage_mc() in the short-copy case?

I don't think it hurts to keep the return value as residue count. It isn't
making that code any more complex and could be useful someday.

Other feedback looks good and I have applied ready for next version.

Thanks for the review.

-Tony
