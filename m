Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE06EF0FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 11:22:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5tgV13Bnz3chy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 19:22:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HerUBdqZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HerUBdqZ;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5tfX0vjfz2yHZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 19:21:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682500902; x=1714036902;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mxFdp1O5b5FTbYwIZMk91pgtFeNHJ35qSgpIUCGP9I0=;
  b=HerUBdqZN4ygHmGiwQsFDX5PtSMhzJla8GmRbr1kozskQ++T0sQOGpGy
   P15plVvjvTnNFQU8JUPwME4OCRNMZBZh8C93mbRsmJpYkgW1GMMZGqbFQ
   j/F4WCkxkj4RwKyoybpZJ0foBQdEFM592vj0xuAs4yBal+uA26NPf1CGj
   o82FlSPMXo/zYfJNh+c1EsTklbLJ9mOemE+55ZdPXrEkJ4kRpEgmRW7Rk
   6pxCNNUjMuJzS3A/D4Lrwxbv6EJakuhXGKggEDkAtIsNZSad3l7PgSY7b
   H0vDmiVAYfN5mTFG7LYOcQEeoZzMYPQ+ZfzQAhKh3dtHAedPXf4QyBXxr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="344506370"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="344506370"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 02:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="1023517197"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="1023517197"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP; 26 Apr 2023 02:21:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:21:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 02:21:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 02:21:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 02:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elqjOiN+O+qJIoDUbCOVzOC9iymgjL/+z6zZFLMY1U1hbEb8ki3V3oeChZbOjvS4pqEWMtwRgIdgvJdGHzXZQfCw4LiPHowOWjLAQAS90dKgg0EiKw04yV3CxbDnDJ4IIq4HYSuJPfIrTgxb4dBsPlmN2p1Kgz4kVhD5NygvK/wf0WWcVEHcjhyyi2z1I2Xiqb02jjNmqKAxvpWRcpeazpNuUI1CM/SIU0jEznknNKZEb23ea9PwnjM1t0OmFhnrYB0IUgbw5jhFUCzTBdr6rURi8EXuyW+ugCc2dVj8ES8UGbb/no8Wmcdk/cU+FqoqkchQtF7c96cu4Eu1JAe00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxFdp1O5b5FTbYwIZMk91pgtFeNHJ35qSgpIUCGP9I0=;
 b=dLURnWFX9eGIUG+v7YyZiS/UUKmQ7UNUYsFs4LuSOEi7CG6f/6h5TzX7YRHNc2bMPzuxdYKTbNIekDmwozbHkxHLDduB7smYovySIvfwsohNOCJ09q3AtWTwLpuhM9qdpVBSs/hz0cyC2hpJRNTuv3V2sVmCikmGbSg+0ua45Y80qXFJZg0u/Wfo/pU/enHcHJj4aOMBl9+X84ZH+2CFPxxD26YR1OT2Ilzmr3dcHFtSc9htexuOPQCbcixafYNTmUK6l1oFE1Bv2tHQ6SuT7RnyDbBC1NxnfvqdbIgD+YNhbiRd+373dR8HERHP5PIY9e/WDWp4c0UDqowR7wrLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 09:21:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%6]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 09:21:32 +0000
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
Subject: RE: [PATCH 03/11] iommu: Inline iommu_group_get_for_dev() into
 __iommu_probe_device()
Thread-Topic: [PATCH 03/11] iommu: Inline iommu_group_get_for_dev() into
 __iommu_probe_device()
Thread-Index: AQHZctm2YOqcbTQsN06Z1c41VR4/Ya89WyLw
Date: Wed, 26 Apr 2023 09:21:32 +0000
Message-ID: <BN9PR11MB527679421ABE5E74546649B28C659@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <3-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <3-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CH3PR11MB7345:EE_
x-ms-office365-filtering-correlation-id: 3eafb3b4-991f-483e-d0f6-08db46379fdf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qQcAJem6ETNeLbV906/JTv5LeM9B/sRSBxMrkWkh4ziQRc4nAeE/ISfIxuHEBD04MbatRQEJ69qvFxd8pGOuHSbnfVB/dOWj5yvehylz5/q7HzwSLGrMlqym8cUP4qXlT2/A9w+veUnRgSCHvLtGn8Lhi+j1yxK09J3Lxh2DMs2vyaKiWzA0NEnwdde4Lx+INymXB1OY3MZAT+sIR0+L55BLghkMyccjUgotFInuYp0WTM25WCBO0CNyC7Y2OMn4eupUiw7RHTbsScetWAqzs1oFnzgFtLQIV9j48XlciswuI3Bi+ePYGKe1Jqzb5ULlXMNbH9HcbdCv66gfui9rEkKD7+AcVgUWwPATUG82ZBc8efgsYO+uvkOh4Qf1706jFahWfPaxTVvnZD7TJMUU+Qws846IJ2TaLelYfQ+RYv7M50Q/ypW0IklaUPfluUgcEB2WUDijB11VP7wseb1Gb8JL+07o4k2N/rrBDX3FZIKKKBNyZU7ttVkFoOPsmXs8WaY303DOmyZAMs8DoPfJs6D9x/BAgTGN/8wGbyyQFSPC9ka56N9OXq5JcIr1S9s+PeMXQP7ll2a3A688N2kn1jL8AYexA0fpiXsM9AQe8iJlDSzq8pMPAMn7vZFsQNtO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(86362001)(33656002)(4744005)(2906002)(38070700005)(55016003)(7696005)(71200400001)(186003)(9686003)(6506007)(26005)(4326008)(66446008)(76116006)(66946007)(66556008)(66476007)(64756008)(478600001)(41300700001)(122000001)(316002)(82960400001)(5660300002)(52536014)(921005)(38100700002)(110136005)(7416002)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LsC26GEwkG76btg4TYVTRrHarv+khz7EiHfW/FPK5O9ofzoz4Oucr1Kt9V+L?=
 =?us-ascii?Q?ZR5i4APcGa7UA19oYQwqB6+51rYVoyA4qjHZoRLrteVZQv6Jt/APgRN0ntFm?=
 =?us-ascii?Q?kEJ0GOW3c8p4kkYCdO7zeaeg2z1duHtVVFN7EDIWCnQ1kFzJKa7RQCr6eDT5?=
 =?us-ascii?Q?4ddc6G7gM2CbWjHuax3936C+1hmEBqCKTpw3UJ9ypxseqzEmSP3TbGu7UW36?=
 =?us-ascii?Q?tKA11TQSXjTbXXX5rsf8TeZ1GABXLv7K9M7ctk/vrEZ/ewBfX2UhhoR86uEe?=
 =?us-ascii?Q?lDdlR/Xr7VOQLlT1s0pkMhkIAVe1d8DmDZSXsxjp/qXC4nTRiKkqdYxenpiV?=
 =?us-ascii?Q?JhH0ALheGAE+JkvVqc6fTEt4Tx56uBxIcFFYwkCL7kZtbWVC7GD+YaNUppot?=
 =?us-ascii?Q?hJ50G7jpEwoIWuf397et6LoK6FWmhBUBRovASfkH1i9muxsJo1TbFLUiuviC?=
 =?us-ascii?Q?ck+RS2kUPmCcrS5jt8rh8hmHhDdQ9GQgIfjs5dIppySrTI+o9JXNh+p5inNs?=
 =?us-ascii?Q?vnWz8QMYEsO90DWgXcfBvAbgu8sp0MwN+mPlUPIwLvXOLYHHDIWbzbfczQFk?=
 =?us-ascii?Q?xwtVi7Z8odJs80iOwOvclhnKwbOARP+uFfjORIdqUu+J2f9dC+hoK/CyJUHS?=
 =?us-ascii?Q?Jlhn6C/MCP80MVRAPP1fsll9VUYJNDEWD0sjuF7kags9b51vGfgfWHriR/gc?=
 =?us-ascii?Q?fiktELuL4BLguQqq26UyfioIkNBtpLsVlJFFccvBImF9ecAvegSqszaQ2edf?=
 =?us-ascii?Q?ds4uPLdm8YXuqaRPipiojHRChyNn7po2WB/LbBjwpYyGNF5TMW7nX5jz3+jb?=
 =?us-ascii?Q?nHQWur0zjxq75W9qtBDRn7ZlaYm8CoqHtT2qHdV9D96WTCsAKuo/gy0wHfK6?=
 =?us-ascii?Q?ZxYv+xadfj3VfrSAKSYpeiAd9zOHo9jDyzX0s+m4gqfALb6o8KJaXK5Y2adx?=
 =?us-ascii?Q?s/vYt0gWZch9ln43+GwXNUV4ZXRw5I/879rrO3b43NVCK0LPC4Ipd4MGNhYt?=
 =?us-ascii?Q?wtwul5NCJ1UyWWAtw/KX4IhrtVFN7XpPoTAplkkBybk2Hv8PYwtV41jDg5JK?=
 =?us-ascii?Q?Wnmv3/wHBJ8dixpWepIILqMaiQNSfCcp9YQTMyiIOxE1Wtt+ZrFs8o5ptzQ8?=
 =?us-ascii?Q?UnYHloPK2j2nGCwzTSJH1F2veMHlASl0MYvK4JiyVtz1t9CWPVAc6ZQ2gLoW?=
 =?us-ascii?Q?G2DjkQOXPO/f6P6zEG8SY4cMQYbnco4fAjOcDA+mk6JmCatOBgZdlDHsZ4Bp?=
 =?us-ascii?Q?PtZpDcTQlgAO2rHmygK4yq6psLrG/aiZN+a5y5UeLlnDbqD99SKicljQkg0l?=
 =?us-ascii?Q?uyaPcJKNVOa6p++5Cq7bfX+LSj4aSyZgBl0ChbYj2aBtcOOrMCWs3F8sk9bi?=
 =?us-ascii?Q?G5YxOBKlcia4xKu06EFklvqqsAQotKYLqPICXI63d0vpeQCbBuiXWWANzi0z?=
 =?us-ascii?Q?gIVl72AF/EhM1J9eiO2UUIvEyDUblquFJ1Qy7dOYZOo9K7u5lG2BOtspInH9?=
 =?us-ascii?Q?boAJOtIwEK5T46ncksgNsGcWcSE6wv6TPFVvv640KUbkviFc28cFXM8O+0NH?=
 =?us-ascii?Q?r5aYQn02CGDz5nwzVv3etxJamJ0LU+wHkUUTsCu5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eafb3b4-991f-483e-d0f6-08db46379fdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 09:21:32.2074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5O8LOUiGuqt8nEmJebH9JyKz387Eq3BO2fFXv1Z1I6hpJGG2Eg3ui5lQCTztRezjFl/S/i1snzUfukVmZo6hwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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
> This is the only caller, and it doesn't need the generality of the
> function. We already know there is no iommu_group, so it is simply two
> function calls.
>=20
> Moving it here allows the following patches to split the logic in these
> functions.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
