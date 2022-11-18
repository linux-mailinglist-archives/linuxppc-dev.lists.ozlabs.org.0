Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486A62EE8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 08:39:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ND7wK6K79z3f2s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 18:39:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dK+OKcMh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dK+OKcMh;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ND7vL6X78z3bZY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 18:38:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668757135; x=1700293135;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cJf1nmbjZZZvmUL5RGeCD7HNy/fpaaU/IYtp0pjIIXQ=;
  b=dK+OKcMhioUPfQE8G4WKkhxgg+DyU4sH+81w4MhMtbfreQpuczJrbXFG
   gnqABBOkPjOCV8REZVkNofSyrJ+gM0fWttaHYO4SfH4x5MXKh3RsVciRM
   IfROKb54gFT/RexV+JZKaA0uB+QQcVYxPQ1ZI9/IPNbtpaX1nfzCS8AI4
   Qmha0v/HX28ZtGzoPayBDPcHVE/aPYbNhhmre8rAhqsgnxsOROxWlyzOd
   bUnMLRcQ1/7EDImMRVpUzfvagMVwNp2XzBqQ6PluyR1FB2xsWw0MZY39b
   B5+0Dg66IyLAwq2SDbVX7Xx8pbVUUtXQlxkt0Sj0DLcmYcc12vWIcBQ4G
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="314896559"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="314896559"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 23:38:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="814826642"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="814826642"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2022 23:38:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 23:38:50 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 23:38:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 23:38:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 23:38:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrUlkTl729WL/k7lAaTuaFanLuneNsM8YOkJU2HGvQfzysOkjuC23LAmc6hhRMuYXp9oojs21F+KJnGx8WUJeP/kcNnDn78V8tm+krt+AUGuau2ipj/lQri0jCgNEa2QGNTP77wO8K4FzjlZsjNmrjWObHJ8CExQ4B9FamWp4lbxwK/Xc/8Mf2qK4k9K7/a2Iti7kxpBsQsH382vR4tS4giVZdv0GZtAwPf01q0KuJVw5fw5Xjm/i+JBZ4Bhdxzka+rVSvUZNEGpg5+0MSTpnzwq6DvMGBvfvtVrqWifEujdncUvHJeSZqSNh5mYzUj9Genxiur3d5u7bNbVRqR1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJf1nmbjZZZvmUL5RGeCD7HNy/fpaaU/IYtp0pjIIXQ=;
 b=Yt/6JZEChR5cyN9vxxi06wq5FtHWwyD8Ngtl2t51XfDTbL1l+UKhB0oMwYIlTtE1e2AVdQC9bybFJs+tKWwfwvwOW7v9nw7p4/SvbJ+PVnw+L7wpoNv2sHlP84gaVN6vnWddmg7DLA7mNpLcKp/TlIywsCP/J5a4V1p2wCQuqzobEse7m/Vsnoj+TF4q4lBiy5qcsOs+J+OF8PKdGaLTVC2TZd+H9UzI4xaaUiosuWiSk1wUzIqHbpXeryqAJzIwz8X6gixld1458oh4beCO7fgyIccYY4zt/+Isd7L0EtLOf1PQ5C2Av7xZX5QIGlMCBvcpYJzyJw13/a/MFWzubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 07:38:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::9929:858c:3d20:9489]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::9929:858c:3d20:9489%4]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 07:38:47 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [patch 33/39] PCI/MSI: Sanitize MSI-X checks
Thread-Topic: [patch 33/39] PCI/MSI: Sanitize MSI-X checks
Thread-Index: AQHY9dU/4zjRQVIdIk2hmVdFEaPH2a5Cybrw
Date: Fri, 18 Nov 2022 07:38:47 +0000
Message-ID: <BN9PR11MB5276843EE1BC8046C42A6D708C099@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122015.516946468@linutronix.de>
In-Reply-To: <20221111122015.516946468@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB6576:EE_
x-ms-office365-filtering-correlation-id: 4738b4a2-239e-4aa7-492d-08dac937edb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6GKb/wc2pdRziy3mYcCGp/fFNUf+MJuCQTTwyRY2vLyN8JGX0pRw117k0bWwN8qdKWaq1Y3fPCy/AtWNBeGbU0PYPH7fh6lmsT88B4wQELDp3Gw0wiIPGsoYoFHjC+2niSYNK5z1Zcf6J/zu3v8ptR5SMb76gNymlSFgqKlWS5cKeB7BbPVs927302D/810XGOIcel2xkWqyRaP5i8aRx7vL7fE9aDYxVaFzjF2slbjBXJeBLcngzdruz1TtH9dxhhBy3ajc9mWU4GP7jZ9hJ1Pb80d4+c97HLJaC1/9lwglvt+AHuk+lahv3zuPvH1udGsGXg+p/91p0y5ErCgwF5Di0uiwDmPptoo4jbfXMBT8LM5NabJu/UJiDUo6jmSUAKNoTw9jntxdBJK89fjHzX2Mj5x9AvWD/00GYa6nhXtOyY5i0b8rZcPJSwuKl8BJ5k7KLQYHQJJwde9Zbe8y2E107Jgq39e3SxpC9lXKJKyRl2U0Cyl9c+1JRJDpV2AdaspG+HvE9adB7KRzQQqy10sWMzJYv1y1g3ULuM+2ABqN5QJ3AXZDSxKydj8XhnSa6XhZ9CWkLeJejTGAETnS+Pyi+T3GAN1mKY6IARsWEpzHqJUubgTOSTvNFvzxTk2cl2DaODxwfdhLchniEeWHGruO11fNXT5G3RS36OfuGVO34peNX5p1pSMJQ82t18c5Ec8+//idU/A23e6TASI+Nw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(8676002)(478600001)(4326008)(64756008)(186003)(76116006)(66446008)(66556008)(66476007)(66946007)(52536014)(122000001)(5660300002)(82960400001)(86362001)(38100700002)(7416002)(54906003)(316002)(41300700001)(4744005)(8936002)(33656002)(110136005)(9686003)(6506007)(7696005)(2906002)(107886003)(71200400001)(55016003)(26005)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlhQczVvVFZZNG4xTnBIck5mRkxZdVVPcTh3V3c0T0VPcHUrZGNSYzBQZXhP?=
 =?utf-8?B?RUcyWURlbnJqWlFnblFmNEdCL3AzWVl2cjF1OVNDc0w4Q2JFQ0pwSFN1aFJ0?=
 =?utf-8?B?czgvTjRuUCtSRGhicjdhWVpCTFV1SElEQmcrUFB2TzRtd0xNUVRUNzg0YXVT?=
 =?utf-8?B?c2w0WmpMYmRDSEp0RkdFRzhYeUtaTDhBNStlcWFPbEVxZGdFMnpZd3dHSUxU?=
 =?utf-8?B?ZHRHNlA1d2lZeVpXQ3VsK3F5TUxVQXBGVHo5T0taYSs3QlZiV2hCcUhWMEN5?=
 =?utf-8?B?MVgzQTU4V3p1VTJzK3RrUmVwR3V3d0FuSjRFYXBuaEYyOTBsZldHQTdpaTJT?=
 =?utf-8?B?TUpZZnI5cGN2bCsrVU15SFV2bG9KNWxUeUFIcjlzWFBkNlg0bW1lQ3NOZmdL?=
 =?utf-8?B?R0k4WmRYZHVoOVRMMnNBSDMzQWJqdVRrdXpJNDdoUG04TXdwYTZzbXFwM3Ba?=
 =?utf-8?B?cHRzelVweVpDSVZNN3JGMG9KSTZnM2J2Qlh5VyszWUhBZGcvUnNXcDJzTDZs?=
 =?utf-8?B?VE1aTHhVNjlOYlRmWjl3UWI5OUYyZCtLZ3hoUW9zSmh1dElwWGFWcldjZGR4?=
 =?utf-8?B?RHo0SW4wQ2l1bG96T3h6MXdYeUovbTJwNHdEcm1RcmV4VndOeDlidkdDbGhD?=
 =?utf-8?B?Nk9mdGw2T1VYL2NycHlSTlIwc1IvWDNIb1dmS2xqM1hVd2svR0kycUxNckZz?=
 =?utf-8?B?UWZQRXF3R2tFZEwrUG9LdVNBQWFDZjNtRmNrNHZIR3VHcU1FSzFCM2VZZTkr?=
 =?utf-8?B?Wlkvcnh4VnBJeTVldmEwdzE1cHJzSVBJamJxR0VJZ3BLTUxlK0tCMUxWZG14?=
 =?utf-8?B?d05nOEN4bWpEWjhwdWlEVjQzZkFOeWxxN3p1dFNoWmVxSkZHMnRSYWIzazNl?=
 =?utf-8?B?UmVjVERWbUJZQkZSZk5TaWt4RnZUSm5pWkZOd0t6bDhuMXAvejdaRDlaczRJ?=
 =?utf-8?B?TDRNRWlZMHFDSjAxaUZJZ0pDdnFOOC9QNktCTi80SjJJUlYrRzZSNk9pcWh2?=
 =?utf-8?B?LzY4cGo0bDVyWndnZnhPcTQ1SUt5d0xPL0R3dERVSDhLaHZsbnd4STNNalZs?=
 =?utf-8?B?bnRVVVdQZ05oVzlWSzdqQTRWcVZjN3p5aHhIcjFORVJVZ0h5YmUwUFZlcjBF?=
 =?utf-8?B?QUJXZWNGMWgxNjY3bmgwcktweDYrOVRDVDJMSGtnQU9TT2ZkRzhxWVJpOTMz?=
 =?utf-8?B?MCs0R3A4NFV1RVRVYWZENU83RjU1MkFiVU1HT2gwdE1SVlcwVTZUZ2RRcmlL?=
 =?utf-8?B?NWRRbEIyZlMva3ZWdkttM3ViOHIrWjMwN3FaUFlWV1R6TzFFUEN4TzZSZVNN?=
 =?utf-8?B?VEpiOGVyVUNaaU1SRDcvaElYQ3lrZ2N1U0NVNlZNcjVhYXdLMEVRRVFwUHFV?=
 =?utf-8?B?TTdDSStLY01rM1U2b1ZYWkRJZ0tIclFEK1luUkNpRlE3TEtzMEFqRWJkYng4?=
 =?utf-8?B?VXNXb3VhSit4QncrVjB5VVRpUnRJV3p3RGpTUVdtUHVxalhiSTBOMmtaOXdW?=
 =?utf-8?B?Vi9ZYTNvWXhFYWVnWXFEd2NCaGNvRE5XRGl2R0xTWmJMZXBxMlFuZUsrS09i?=
 =?utf-8?B?WnlxYnJsZWp4TWhKSkpaRHc5a1kzcm11ay9sRmUyOXhJT2tNZlQ3bWNQUkZU?=
 =?utf-8?B?dzRvajg0cm1oRThqZVdPMm1NQm52SjhtT3JGd0xaQTRiZFdKcHMvZmg5Skhu?=
 =?utf-8?B?R0VWV0JPbmJ3c0JPcmdHR0pCbDZpK1VKWDJ0bFJPeDg1RTlFbW5kZ2FHSDQ5?=
 =?utf-8?B?RGhyai8xMUw5ZXkydXFYcy9zejB0dmF2cU9TTnN6dzFuT2dSaWdzdWZ0ZmR5?=
 =?utf-8?B?TElsNE5xM3VxZ0RoUW9PdmlLdGtXRmZCNWs3cUZ5NDVGdVgxdHVkUWo1NWdP?=
 =?utf-8?B?cUlGcnR0eExEMGJxd3owakIyeVN2QTREWjFzWnBpQXM0cDFlQUIrQ2dacnUv?=
 =?utf-8?B?d2plWDhmM3BMeitCcTNpVUdmeGFCdmtQeXpHUTczOTJjZnd2RU9UT05Wam1R?=
 =?utf-8?B?YStMaTVWVk01SlN6M0RHSzhWekVyVTBDTzBhZWdvQU5IcG42ckNpMTJxdTUy?=
 =?utf-8?B?OUpmeldSQVZ4VUV5VkFPQzNPemR6Nmk4MXl2Z21EZmt5b2xQOGhmZTQ4bUo4?=
 =?utf-8?Q?Kva23akINqH+wP4qE4yOqba/0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4738b4a2-239e-4aa7-492d-08dac937edb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 07:38:47.4081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyFGt5kUEz02GdQKjIZV+vmfIhh4AhDojmwfDrcbSUEFQNdz4MPfoTVczBRTQ9SJjR6YmzKU5O+xqb1J6MUM/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
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
ZGF5LCBOb3ZlbWJlciAxMSwgMjAyMiA5OjU1IFBNDQo+IA0KPiBAQCAtNzg1LDcgKzc4Niw3IEBA
IGludCBfX3BjaV9lbmFibGVfbXNpeF9yYW5nZShzdHJ1Y3QgcGNpX2QNCj4gIAkJCQlyZXR1cm4g
LUVOT1NQQzsNCj4gIAkJfQ0KPiANCj4gLQkJcmMgPSBfX3BjaV9lbmFibGVfbXNpeChkZXYsIGVu
dHJpZXMsIG52ZWMsIGFmZmQsIGZsYWdzKTsNCj4gKwkJcmMgPSBtc2l4X2NhcGFiaWxpdHlfaW5p
dChkZXYsIGVudHJpZXMsIG52ZWMsIGFmZmQpOw0KPiAgCQlpZiAocmMgPT0gMCkNCj4gIAkJCXJl
dHVybiBudmVjOw0KPiANCg0KVGhlIGNoZWNrIGluIGZvbGxvd2luZyBsaW5lcyBkb2Vzbid0IG1h
a2Ugc2Vuc2Ugbm93Og0KDQoJCWlmIChyYyA8IG1pbnZlYykNCgkJCXJldHVybiAtRU5PU1BDOw0K
