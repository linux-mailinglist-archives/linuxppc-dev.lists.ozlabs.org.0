Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8016EF15F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 11:45:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5v9r1MR5z3fV0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 19:45:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JL/xT1h8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JL/xT1h8;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5v7H1wjGz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 19:43:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682502187; x=1714038187;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O58WcEWPtQJzYRTfXEhcueKa7gqbES7yiUI8QhwPG48=;
  b=JL/xT1h8gCtq8pYwEBt5fOyBn99hTb4paWXAWO9DVEwGUe/U0Ia6yrow
   DhYJ+Ny2saX3kQGMJ6sg8smWa12VxiH9gcqxBo36J0AAftxw+lPmyJbrO
   Vy/uYMxnPVC95p/hP/D+IcazW4PXgWXVYcPsb7Fc23jbwNKeAlUYsu4C+
   VmxRRviW77MuNBPFp6BSZ43KesFA9kTCJVMe1gia4DFrfVCoVBbHe2oFI
   4jkqxsy0t4TDPzijnIg7AsKBn1tP7gYQ/Opt/2LKwU6cvd37Xle0u8aP9
   thuqrOc4seMTBsT3+Q8GjvLsAQjEFBQihegtw+zLdKEvvkJoyUJcjzkKC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="347082091"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="347082091"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 02:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="671271137"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="671271137"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 26 Apr 2023 02:43:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:43:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:43:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 02:43:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 02:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKilIpSoU1VG+f7bERi4AhGqXB3cxOHn+Z2bG9+IRwQWT5hueDLC2ZdlwNSyK5RM/oG3tJqW7NgC6XRDY/e+cDDDYqAcJVIfDJyCaf966uKDCCExnCwk8ErIBqL2b0H2Q/+KvYoMSBkJXfXqn4lbMbKVUb+UbAi8Sfko2ROo+Ho+kyqQ2iRF+CPsI2L1kT/C/fg8wqESl3GW6kwYOIMcnRgb9Pk2OSPdIdu/RvSS42/yX8JmX/ojFJxZq8L9ermLlVSzCUVddtPM82e16ygNOQUSAHLF8jR6kR8FYtqjhCIXbRIJYvTuuIefWB1dU1OeXIRCIdD24RvlHulhkVhDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKJ2835Fk/WvqnJ0uZJYxMsBLt4Ac++VWimQW0XjLR8=;
 b=i7+nDC8kj6fN1Y2KabqTV+kOM0j5Zkv9sD6pSNL2zxxZtUKyloDEe1MSRr9uoCJHY07VhY2BKU18XmTCxoScSHQLoTC7mIJTli1pR7lJru0a26UShan63NNqfzOHnYPz/Gd7aNzMHgCtCcjubqemLhmTxIQmUxTKnxu35++OIYTcjmKp6PhzXjbKEtYmJ/A/30zP00v2fDxm40vTbZCKwguaQlkIg7FJF8+w200Tj5wIOzYCuGjzNK8DLXlcPkVXat09f5/f4K/QjCfPLgVmjwVV+PxmEERkjgOluq1rtE+qNLIHsPNFa249ldSzCxOlLrApS1rVEDnnffGSud//RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 09:43:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 09:43:00 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, David Woodhouse
	<dwmw2@infradead.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"Joerg Roedel" <joro@8bytes.org>, Len Brown <lenb@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Will
 Deacon" <will@kernel.org>
Subject: RE: [PATCH 08/11] iommu: Always destroy the iommu_group during
 iommu_release_device()
Thread-Topic: [PATCH 08/11] iommu: Always destroy the iommu_group during
 iommu_release_device()
Thread-Index: AQHZctm4JWkPJJ3CWEWAdNZ0fGcLYq89YTig
Date: Wed, 26 Apr 2023 09:42:59 +0000
Message-ID: <BN9PR11MB52764B749C11FD91D9ABB6268C659@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <8-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <8-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN6PR11MB8217:EE_
x-ms-office365-filtering-correlation-id: dc7dac11-4721-4db2-fc32-08db463a9f74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DRCSqZtqDsIFe78ng/z580ZuHI2olwMcsPxtxRd/qDiRYrVOy0tsXz6sML33VZ2VliLiIx7GPrJT8zgnjWj0VQnSs7BQzP/yqhMwZx1L+7zHmqmD3ox0mjPOJzOsTUJ0G8tgssI3+z6mnn3emlSPBk/3Uo8JBbBr19FGrz3NqDWE12KcxRRtsZmnFltUft9fdPTAWOzACspxd5NUHy+SB9t+RP0FZPozoAIHNipgelmkyiXRjWXEt73TD065LvG5IpimpbqDgjfOo2RQf8ctQA7S//LdB0eIYmMJ66b63fCkQtIefJ5duhFjgd3PDzqpnHjSL2FOcWQDSehMEPUdQqsPj9T07NiQUXnsQAONzhGARULoSwCYTPL3RlFnWCWlBYMGNo7p18unVr/2HuU0ejtHf/R/v4zT7tJMx5nlOo2vkoBjPGcuSwI/J73mHI1dUB2XhOkVX4TcAH36rWs1inwak1vaHf0tHdd0UPyFeplC8Gad892RLxfgplQR350WBW7kyyATzc+8moVo0EaWYRdiXmSUyn9XenHg8TpVNVzKJgCAe2+BSMMxLo8BCU/qyI4UT05bkax9sJSfCFH3pzHK8GLToWyc0RAfkEpEDrk12divA7P+6isn70h1757EAFRL6Jz0CgLL5SP8synVHw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(6506007)(26005)(33656002)(9686003)(52536014)(86362001)(186003)(5660300002)(7696005)(71200400001)(38070700005)(8936002)(8676002)(110136005)(41300700001)(316002)(82960400001)(4744005)(38100700002)(921005)(2906002)(66446008)(66476007)(76116006)(55016003)(66946007)(4326008)(478600001)(122000001)(64756008)(66556008)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?393gDuR7JdQLUKod3jFzQiJp1gvCNrUO1fRMvLxafF4etEQHezE0NzDawUjV?=
 =?us-ascii?Q?ObD9r4lsR2hVtghgVH4jtqubYnpudrV4C9WPprpPCasLLd0piTN++VV9QcKX?=
 =?us-ascii?Q?IXmWHZHj99EfezFBQHCCwwgO2fXY0klFSVPibN8oqWgrA49tSYzPVMpA0HYp?=
 =?us-ascii?Q?qK1XL+/JYIIV69CpYePXr8K9GXk7ov9e/08FHR2v5YAmYe85g88SKfb6+VG7?=
 =?us-ascii?Q?XnJGKqgvvWJeM9siS7aEd5Gd0JFO2TLqr9Azphz0WssnQAyLQt5tFKD8Ij1J?=
 =?us-ascii?Q?PWlyYpt561zkeDdShZE9Ro93Z8EvxBzUPYv++TKUEIUqJ3K3T+jL6dtL7vET?=
 =?us-ascii?Q?X1GD7mobYmYPFVgE75OTRv/9cUJJT0Dr9ty1x/ZHQOqYsbeKhLVVg3oO3B0K?=
 =?us-ascii?Q?FT+PsfE6uRpSDO0qwuVgsozID507Z7lE58iCrknjfXFBJSwTFCOfJ+1wX/iI?=
 =?us-ascii?Q?bJHndVqNzIV102AX1QTE8qfn/OgtYlALiBoEcAHExJV+8FS1/HcbaesbQKR0?=
 =?us-ascii?Q?Ackb8njqNOb83nx+tefdzQEVbCAA8c6aPHZ7HiJWoOqfkuAIR/xl6YX37YyX?=
 =?us-ascii?Q?lh6M+3ptNSykRxjutOlR/tDOwxL/ivd/f0EW0KVS1GXb6HcJk+Vhw7j7TeBZ?=
 =?us-ascii?Q?Wh7fgJhjGn5GBeH+OVFafkjW0Shkk+EDLbYdzYhZAaXbpMK4HatXxvUQUGUS?=
 =?us-ascii?Q?CFRHdFD14nRDPW7YXn3xFjKL26sU12nA9pzMEuqXBvhSUYrq4LS6BRtMG8q0?=
 =?us-ascii?Q?C3WEEfJa7l3yCfwtuu5c+sNEiVKl3g5eOgrPcSMfsHxOHoaStvpOryBo2YpT?=
 =?us-ascii?Q?HPfYttAK2ww7ePIHxJD6zMnCWXvDtrNA2ak9hs80mptINHLGrzoKJgJdzT5p?=
 =?us-ascii?Q?1bU0wLQMlnfmjDs+Uh5EZ1YpawJEkCpnHHbJpVoVGqiWz+j0FBYzYffuV5OE?=
 =?us-ascii?Q?TtXt+13CPdoYos9/r6RiIhqGwznEomUQI1Lahpwbot+C4t7hy2d6e3hWDaf1?=
 =?us-ascii?Q?hHed6HtxHc20F7vfv1q29dYx/qJzTkGbcEPg5co1HMfgUBF05hdoxOKJtvI9?=
 =?us-ascii?Q?m6F/2WF3YEx3QJAeyVObfU2hN+bp5Q2DoDLjL8qcxC+CcRkZBeIlpWB+pP1B?=
 =?us-ascii?Q?UDdSnieUEb72F4J8cQhNWI+zJgTKUS9zDCPE58+8rwhk411RT5TcNeV9APUH?=
 =?us-ascii?Q?OIa22Ko7P/Gx9iE3WSGRcCNxaL8X42S5AWY1YsHc/S8Gqc3kxo7lFjpNiXCe?=
 =?us-ascii?Q?jQnoeYket/2KG/i7e9fFLO38u11mv7UQCl9xlTMZSuhmvA47ZGsWQGZuHyCB?=
 =?us-ascii?Q?+jWqoaAHifQBSjqAdF6B9/K7sS8vbdc5XcNsFr0gLP0BGXgwOAETaQD0gq2c?=
 =?us-ascii?Q?8aAXsGRKsGWUfWexO5s1q3/OLT4tL1T5BIjgcft1gVyWzgFEUqWSzwyJSmiz?=
 =?us-ascii?Q?wQHgRBUs8dnjV5whbEl/JWQVayNLPbeSoW0IqOZ4h1v1jysP4jqn/Frfsws6?=
 =?us-ascii?Q?LRMWi9yDN1V6mLmMwEDd8Sgf0b4Tsy+CS/b6Kp/f9IGep8HKTzcIpkTsoBCQ?=
 =?us-ascii?Q?h6gf8AHfKr0FbOK7c4RKnjHukI9wveoptZokh55l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7dac11-4721-4db2-fc32-08db463a9f74
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 09:42:59.9747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHqE7xhp6JzEoM093+K8HFwH17EXMhZBJjmVcxzfeSqHkqYl2KLvBNK26LAT3NSrXzEJUvkMH8nbhxU/d9lmcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
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
Cc: Nicolin Chen <nicolinc@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, April 20, 2023 12:12 AM
>=20
> Have release fully clean up the iommu related parts of the struct device,
> no matter what state they are in.
>=20
> POWER creates iommu_groups without drivers attached, and the next patch
> removes the open-coding of this same cleanup from POWER.
>=20
> Split the logic so that the three things owned by the iommu core are
> always cleaned up:
>  - Any attached iommu_group
>  - Any allocated dev->iommu, eg for fwsepc
>  - Any attached driver via a struct group_device
>=20
> This fixes a bug where a fwspec created without an iommu_group being
> probed would not be freed.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
