Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4071A50CE49
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 03:52:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmB386ks5z3bbn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 11:52:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N99tKL1V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=rajvi.jingar@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N99tKL1V; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlXbZ0TBZz2ywF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 10:44:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650674666; x=1682210666;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M4dnxnhrXPozsBXyfv17cINsmliZiIpCNaxDfVlZsr8=;
 b=N99tKL1VpH5332gofo+HoZWkchhqiD4dvmmqiR77gvGtKHuVnwV+2Ic1
 ylu0GyKBCyZeypCHOd72X7bTJZbcfWwbF7kqDltPVeqStezzllE1JvDGz
 TaioOVlt2jrWxqHtVKFK9H86RHV4gPeJrTv+g4lzfMJtgis7M8vLyI5xb
 m2sAN+q8hfgaF8BLNyDDjkGVY0DNZ7whtrQtFVyUhFfgiymlBYeQLhJGl
 13+kDS0yHKPImWPA7Roynz2cUztektBd+BQgynl4sv2U7KO9cPhdW20PT
 J5xInUpBqflXwXDjh+1D2ATmv8iuFI/5uL1rcQBduG/nSToM1miR0C5xt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245396028"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="245396028"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 17:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="556645703"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 22 Apr 2022 17:43:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 22 Apr 2022 17:43:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 22 Apr 2022 17:43:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 22 Apr 2022 17:43:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeR5q4Y5zFJ6XhaGJZR9kxk+0iuXFoB1H1r4LUyv1AVkcq6nqDCEkmfzNLw55nsJItOj/ySozuCTFqVfDvrbujZf5wKMo8WpXLIhN05plmgL3dfGhtmNNIO15VhijDGQFqTDSBeBT6z5eLKNMuHyrUJOgMrpuwIwlBs/Fcl7cHdjagQhaBCSE58rlOgNPcIwToD4oo1Yloyz7sFe2gVtUxe+I+P11TjEsWK50Todv446e9XGrMH395lNHjVapmzWCr317JenQTLhG6/Jb/r4w53cUaKlYk0f0YqsrwH3Yae278D6HFK3fifMw0U1U4lVsaNxHiOsAjjSiQOp8SeN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBBEHTLaoR7qTvas6pTTnIsUjf/8DtCZZ7Iasad58BE=;
 b=Q0Bnrx/5w1rZiYuZ+/xVoaC6g27iJfr8Wh5xedPrpaBGpOiFlIch7sJDADjC2rsP5SFBoFQUg6lbq1YkM0kiwnowe31OH/BAZ11KlJ6gSLGP2UcBICElYCTtCY4FZb64DU3p2XWBCWqap2z2/2cvDE/eCyltUwSG8qBODZZUsNBjAFaZVseLod6Y4zUsIHJRa4FwbR8DU8eunWGa3NiS8GBZFOjKJbcXCh8Ry3YkJnrAh3ywVMJeqlnTuw4kNXzCK2lh+HAONN3I2jQSb2eldOjyPGe23lomaYa6HKg/lAoN9NJ1GCWte1Fo6mlGVyTH64Qfj9mqPZYIVpBzUt4FWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 by MW5PR11MB5812.namprd11.prod.outlook.com (2603:10b6:303:193::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sat, 23 Apr
 2022 00:43:14 +0000
Received: from SJ0PR11MB5070.namprd11.prod.outlook.com
 ([fe80::15c7:ebeb:fa0a:bbd9]) by SJ0PR11MB5070.namprd11.prod.outlook.com
 ([fe80::15c7:ebeb:fa0a:bbd9%7]) with mapi id 15.20.5186.015; Sat, 23 Apr 2022
 00:43:14 +0000
From: "Jingar, Rajvi" <rajvi.jingar@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: RE: [PATCH v4 2/2] PCI/PM: Fix pci_pm_suspend_noirq() to disable PTM
Thread-Topic: [PATCH v4 2/2] PCI/PM: Fix pci_pm_suspend_noirq() to disable PTM
Thread-Index: AQHYQIGzE0/LKKZHKkmXPRchVsogIazv0DwAgAzeSwCAACSt0A==
Date: Sat, 23 Apr 2022 00:43:14 +0000
Message-ID: <SJ0PR11MB507047C0109C5163EF20D9AE9EF69@SJ0PR11MB5070.namprd11.prod.outlook.com>
References: <ba571993-90fb-ae67-6617-0b63571298be@intel.com>
 <20220422222446.GA1522716@bhelgaas>
In-Reply-To: <20220422222446.GA1522716@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd349aa4-95d9-4280-3b1a-08da24c2402e
x-ms-traffictypediagnostic: MW5PR11MB5812:EE_
x-microsoft-antispam-prvs: <MW5PR11MB5812E80A38CE7A6EAEC6BE2C9EF69@MW5PR11MB5812.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kEXOSTnyRKSUOsIPMFbn0YggF9d0NxB4y/zmfp9pv6N54l/vWsIIvDHgHn/uCd7XeglvF/g5nx4Egr9+GkaG2eqoU+MR0jJ+tTUa3BqTT5UFCxBNoeWcYWkyEwvONFJJZmL8lxOmsZBJXz+DXPsQAN4H9wRn7miziL3xbzVMsWjCeq3jR1AR/C76eJ0SWvrds6ULELGdZoob4ppSxdfEMrAMB06zwo1T1Dip3GNkgYUOBKAajQM8wFel4g32yRELluaJmdQl/Z69+minKmD/uz86bPWu0HDY7HNou1I4tN0Z6kMsANNfNpsCx+Y4IyYeCeXLd8Hy+gJX8lUEaaQK9sJQwskyx3IIcb2bHp0hN34iIIXevrq9004itUbOfil4D911BxIB1SG4s7yt/rUQms8c2eP+a3T8hn/erL3IEFtviGwqE/G9XQKXU9QMOJI2wdBZlCcJyE2ffiZTfSoTkIkimLdqc4bWYulptIbxDNdMLhOOZzfnPr2aGAugf3qTdhiKVdE6AUgrd4aHYxQ6acS/6r9ZEEVZHYTHmsLSY2JFnV81Ubl8TPYeB1ANuKiPCR2kZaSo7cJ2UQr9cv6KRzE6TBpAARzW6M2jwHYy4RyN0nBif0eKZfC6lTcQjKDcxrQXfdB3Jn/C+g3ES3UEeE08G2FLPcrbM4X4EkcaHmKX7mDthkrQwjYtc2ciMqOaFsK5ydg//j5/jZDl5Jqx8EoIW/Z8XEMRKC/7dnF0YzBvxin6laQ61a9yUD3b2RvKT7PGPmAYltoJHKzf/v6HvFIhTahePxO+8JnsqYA0Nn4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5070.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(186003)(7696005)(66556008)(53546011)(76116006)(26005)(83380400001)(64756008)(8936002)(4326008)(966005)(8676002)(7416002)(66446008)(66476007)(9686003)(6506007)(66946007)(2906002)(5660300002)(33656002)(55016003)(508600001)(52536014)(38100700002)(38070700005)(54906003)(82960400001)(316002)(122000001)(6916009)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NehV+Sw0guYNcdXrgh5iyDs5s7RXURhAlwGAFXChfTtCdoOhu+m6XxJhjAzx?=
 =?us-ascii?Q?I70Nq7cx4vKh+TEqkw08VO5H3/o6U7xJ24K/vGEH5o77aOROv5Uy82ORzn68?=
 =?us-ascii?Q?e8UYD4EFFcdPY4bwA0LBPhNElNg+D1AUsjwQgrqb2aoj4QEMeNtJTob7Un69?=
 =?us-ascii?Q?BSm8wd2uWgcrJOdscqUqsfK04aMzEDVTnaP3rlyUIMnpUQRYqLdspHBMCkHP?=
 =?us-ascii?Q?x+MNENSZGY7hJ5m2BMkmpl1ixyh00GuqZrN7PbkTzF3bsGQAcptJpDfC9MQQ?=
 =?us-ascii?Q?KOteEq0xHrzIl9IPmutXQk1XmRai9sGDfd+NKqVBI+hLw414W6epYaX8hz1C?=
 =?us-ascii?Q?TaPbGzhU0JlV5Z7Fbj5NU1BejOgecux8cYY2yCc5kCW6zjjgPQBRtst/rTFn?=
 =?us-ascii?Q?G+uypTAYechIMZtHrmS8QGyYJkc0+1OmEfh5ocdBa2gGjnigR3C7uSpOeH5c?=
 =?us-ascii?Q?aDmkmG5rFGlYUczkOtIY5CbVUSBkSHKhJLaBfAeVIFcGsBFD7OcuJgsPmz+I?=
 =?us-ascii?Q?oOdW5lqM5i5q+gHmFYcTrw2kBwsCS2RHgmbox/z/cBUegkAGoMX2Clshpovk?=
 =?us-ascii?Q?RIB9THJhcvZN7BGJus8ZNm3oAzaTJzhL5I5gqbUDa4wMwBsbV+/FLNFvDoF+?=
 =?us-ascii?Q?XQSHJQuzbn8N69NUryFvp8cqRlowTbM3QEg2dT2wHw3DRh+Fet3WX9tJm6rN?=
 =?us-ascii?Q?K2s4OO3blIf+l0cR4mVuGNy06NxcQURMD818oYgqs3BgJ8JgebHoZ/6Mpt5q?=
 =?us-ascii?Q?+YdIGEfN3aspu/l/gFeLBSyaIau7KXgqPkZRrBLTw0tPkJnrUZ91OsuUJh7y?=
 =?us-ascii?Q?G1cQGuWripVM1DtsXoReIi6pt3E1k2V7Hrzl9Gakw6oJd5OMmNg9xtSxKbQc?=
 =?us-ascii?Q?qAqAOrSHAese2O4v5qPoeSQMtfZbd7aUYdFAjDlrBGJYINFdHQPjbDeOdfu2?=
 =?us-ascii?Q?rcYkkhXaEK6d5hanfwKTW8QKYo992rLAgqXOiPJhekHaC6KHdsp6coWsDB5c?=
 =?us-ascii?Q?7eTUev+umi6mgPSxims/Z3tKnutr6TQs1gET/U1pUA3HCXE9uoriqoNpaHez?=
 =?us-ascii?Q?W7uhYLRyO2IaV26uTN7yEkbNwi7UqKFypa5M7MiCGreXd8AtRknm2cUzgmnI?=
 =?us-ascii?Q?HfLBf3W3dkdmS1rKviXa+gMktA2B5e2rWFCf874rzLdk4kJzPOmxmuTWDfrA?=
 =?us-ascii?Q?9sQ947h7qZ49r4IQeSRd4HBDx4S/YbSaNqDeZYUpIJtw3oU2mglClgjCISuH?=
 =?us-ascii?Q?o1dwinlNwGSWtmy4KGXgXd9O8arTNBsdt1e5sF6hVfNpI8UIv2ge0GXNnlm9?=
 =?us-ascii?Q?MOegYDs7XZ+W/F2OTh5qPpmyAjJpLV6Yj18YGonB0yzv5XjAzwodP9l30ewY?=
 =?us-ascii?Q?OuLEEdXZdvtW98qqQbpuvkD64aNkKONV/UNM1NbkDv8r+8qCdMgo0uJR+5kE?=
 =?us-ascii?Q?44+kJW2eLHEeGPQZO2lJhkbCfLW0s1a+bQFpIpUGzK5fParkSDsIL20xTTRF?=
 =?us-ascii?Q?wgFfOCHWiKSj6peNZ8mZvNNH9gh/JR6LxyPbq9aotTiCoSNCDLmK3OhirGQz?=
 =?us-ascii?Q?kzIA38LeBFNcZ2eQ1laVtst8u6Q8Htf2byF72hJ50Tp5KGGHy+lKAfkl3EOk?=
 =?us-ascii?Q?/s0dsOzxGkQFloVDmISzh8bX2JNjh8vTYcCRXmcKirkIUvkYEGU0VPgFZKQ2?=
 =?us-ascii?Q?mPLkW9XhpnsXCFaH9trM4M6hNsF5MmkCQLigTXLz6hesfuzMNjGMr5/8lud/?=
 =?us-ascii?Q?hgpfHWsukw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd349aa4-95d9-4280-3b1a-08da24c2402e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2022 00:43:14.5061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSFB/KD4hJVCQooDJ+tYvUkPJoLFE0PL18A+T8v1lvkB154wHH6VuU0ftaragwuydo1pL2QzQ1KZQMI2dkcQfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5812
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Sun, 24 Apr 2022 11:51:24 +1000
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
Cc: "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "koba.ko@canonical.com" <koba.ko@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> -----Original Message-----
> From: Bjorn Helgaas <helgaas@kernel.org>
> Sent: Friday, April 22, 2022 3:25 PM
> To: Jingar, Rajvi <rajvi.jingar@intel.com>
> Cc: bhelgaas@google.com; david.e.box@linux.intel.com; linux-
> pci@vger.kernel.org; linux-kernel@vger.kernel.org; linux-pm@vger.kernel.o=
rg;
> Wysocki, Rafael J <rafael.j.wysocki@intel.com>; Kai-Heng Feng
> <kai.heng.feng@canonical.com>; mika.westerberg@linux.intel.com;
> koba.ko@canonical.com; baolu.lu@linux.intel.com;
> sathyanarayanan.kuppuswamy@linux.intel.com; Russell Currey
> <ruscur@russell.cc>; Oliver O'Halloran <oohall@gmail.com>; linuxppc-
> dev@lists.ozlabs.org
> Subject: Re: [PATCH v4 2/2] PCI/PM: Fix pci_pm_suspend_noirq() to disable=
 PTM
>=20
> [+cc other folks interested in PTM from
> https://lore.kernel.org/r/20220408153159.106741-1-
> kai.heng.feng@canonical.com]
>=20
> On Thu, Apr 14, 2022 at 07:54:02PM +0200, Rafael J. Wysocki wrote:
> > On 3/25/2022 8:50 PM, Rajvi Jingar wrote:
> > > For the PCIe devices (like nvme) that do not go into D3 state still n=
eed to
> > > disable PTM on PCIe root ports to allow the port to enter a lower-pow=
er PM
> > > state and the SoC to reach a lower-power idle state as a whole. Move =
the
> > > pci_disable_ptm() out of pci_prepare_to_sleep() as this code path is =
not
> > > followed for devices that do not go into D3. This patch fixes the iss=
ue
> > > seen on Dell XPS 9300 with Ice Lake CPU and Dell Precision 5530 with =
Coffee
> > > Lake CPU platforms to get improved residency in low power idle states=
.
> > >
> > > Fixes: a697f072f5da ("PCI: Disable PTM during suspend to save power")
> > > Signed-off-by: Rajvi Jingar <rajvi.jingar@intel.com>
> > > Suggested-by: David E. Box <david.e.box@linux.intel.com>
>=20
> > > ---
> > >   v1 -> v2: add Fixes tag in commit message
> > >   v2 -> v3: move changelog after "---" marker
> > >   v3 -> v4: add "---" marker after changelog
> > > ---
> > >   drivers/pci/pci-driver.c | 10 ++++++++++
> > >   drivers/pci/pci.c        | 10 ----------
> > >   2 files changed, 10 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> > > index 8b55a90126a2..ab733374a260 100644
> > > --- a/drivers/pci/pci-driver.c
> > > +++ b/drivers/pci/pci-driver.c
> > > @@ -847,6 +847,16 @@ static int pci_pm_suspend_noirq(struct device *d=
ev)
> > >   	if (!pci_dev->state_saved) {
> > >   		pci_save_state(pci_dev);
> > > +		/*
> > > +		 * There are systems (for example, Intel mobile chips since
> Coffee
> > > +		 * Lake) where the power drawn while suspended can be
> significantly
> > > +		 * reduced by disabling PTM on PCIe root ports as this allows the
> > > +		 * port to enter a lower-power PM state and the SoC to reach a
> > > +		 * lower-power idle state as a whole.
> > > +		 */
> > > +		if (pci_pcie_type(pci_dev) =3D=3D PCI_EXP_TYPE_ROOT_PORT)
> > > +			pci_disable_ptm(pci_dev);
>=20
> Why is disabling PTM dependent on pci_dev->state_saved?  The point of
> this is to change the behavior of the device, and it seems like we
> want to do that regardless of whether the driver has used
> pci_save_state().
>=20

Because we use the saved state to restore PTM on the root port.=20
And it's under this condition that the root port state gets saved.

> Bjorn
