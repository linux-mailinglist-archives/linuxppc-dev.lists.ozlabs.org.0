Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 331C9476A46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 07:15:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF2110xtHz3cNS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 17:15:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=Ycav6qsZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.93.12.8;
 helo=na01-obe.outbound.protection.outlook.com;
 envelope-from=mikelley@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=Ycav6qsZ; 
 dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azlp17010008.outbound.protection.outlook.com [40.93.12.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF2081P6Pz2xsh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 17:15:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImnwxWgJfJNOTow3iwSqSIHmRBr2j0oZerUh01KmbrfVRjfOCU1Ifxyk3ngB041EDVhed+FqHYQzKiyxj6y/Z/mii1LJK8D4FpyjDfLQSYAp4YzZRg5xK3MBjTU2F3PCK4Ib85pdGKWh2cKR8q2lhQCSEpmjp+kllK/wQy8O5lhrXhE5vbrXKx3tsU80jdDJIRhjPT5ulB7lCwps/mSKobxO7eAP3vb4XZTUO7mveLDbFMxIPe6ch2GOWCG+hKb5NSFvMb9MUA4X7Ok/iYl3BOxoEAjzOz+GWB7aQWuA3lTqWVo6BOFNzfsNRNu6hR/h4PApY9d9fEzoaTDeap5paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj6f1cHHbnyHLhg4aA25mqY9UgdPFT817BJ+fttssdo=;
 b=FilI8fEv1FliLEwa0/pDU5wFg0ADI47DATLaijYE1KCLbAD2YR0b+V0WXkYAojlYJk8Qq0bk/lkgMdPTJX0jrQifP9dSwZDehRWhBNlEt9guHHxajoVUVuy60CEX9rfmB3tmPkr8TF6/QSBwzWqV43nMUGlnMoNEd9e9JwmQDmcWoeXInYj8RwFgcviHuLFMSRnmnnXh8vsVKIn+/JOZzoFBRGmxzkQmnfsDXf9oNRN3jM7lC2Q6D9ssuUOFEnzEdw1UVwpqfr4jViGAAIsU+iMf5/wUJz6DX8Km2/vUmz3d59YIT7FVZZwK0zKW8Xg9aC5C7q2UkoIsc2+7gwU2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj6f1cHHbnyHLhg4aA25mqY9UgdPFT817BJ+fttssdo=;
 b=Ycav6qsZKWLy+JhjK3iVGvddk44Zk+7uznPkQuMUf3Mz+5319ZF2hY+ae9QcoSCb0FI9WALjwRqJbgbTuYMbIm6vpr+ygF/TttTlBJxEv2AVFCiME8BbVTsOPYVgzNlhWtal0jWH24O3ZuwB0AXhBmLyqTU/dQBx/G+bsQuLotk=
Received: from MWHPR21MB1593.namprd21.prod.outlook.com (2603:10b6:301:7c::11)
 by DM6PR21MB1273.namprd21.prod.outlook.com (2603:10b6:5:16c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.8; Thu, 16 Dec
 2021 06:14:38 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::e9ea:fc3b:df77:af3e]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::e9ea:fc3b:df77:af3e%6]) with mapi id 15.20.4823.005; Thu, 16 Dec 2021
 06:14:38 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Thomas Gleixner <tglx@linutronix.de>, Nishanth Menon <nm@ti.com>
Subject: RE: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
Thread-Topic: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
Thread-Index: AQHX7hP2OO+j8bTrKUC182AbgaxaDKwwwrUAgAD+lACAAHA4gIAAA7EAgAAHxwCAADWSAIAAC2sAgAAGkoCAAT4FgIAABOkAgADieNA=
Date: Thu, 16 Dec 2021 06:14:38 +0000
Message-ID: <MWHPR21MB159301D63518283F813FC32ED7779@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator> <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider> <87wnk7rvnz.ffs@tglx>
 <87tufbrudl.ffs@tglx> <87mtl3rli1.ffs@tglx>
 <20211214205626.lrnddha6bd6d6es5@possibly> <87h7basx36.ffs@tglx>
 <87zgp1rge4.ffs@tglx> <87wnk5rfkt.ffs@tglx>
In-Reply-To: <87wnk5rfkt.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7cb534aa-630b-47e6-8e34-abedba89cdec;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-12-16T06:06:19Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65d6e4d5-65ed-4dc2-c83e-08d9c05b5726
x-ms-traffictypediagnostic: DM6PR21MB1273:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <DM6PR21MB12735C192931744515825898D7779@DM6PR21MB1273.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vw+EVdznUWr5SaD5O6qTtFR5BytWYLHPOS18p7fOBcUblvxmnzsbXMDN+r0H4I7/46nVIt460P4ESXtZmrqIirY+pv20dQZe/jP2lcdX1WQkHnzzxqGGHG1f0vddrveujsNj5i0fbr9GxZM+9+wmX7m5ZdD3cRH8V4/7lpwgDT0pjedY6NjwndqvmD+lI+YiarRn/IS1hAKVBS3njOSmfLzq+ujEFxJFZ3ootq6dcEi7VPTYiXIhx8IRTDKtq2xJysCeZrGorCgU+xCuT2/Op9nqPfKC0R+ilDj80QuE1CD+zP56/bKu0zh74BH3+A6LHJuwlfGlxsGSkqurPU84MTJETlwOxxlbYVh8596NA0Xet/LlvkmpCSk9cmxxXT7Ga1xWvEqr3iz5+DWpa0K09EzhxwXFo2fx7OiP2HE0NcFEhUK2wtRCQ5LJk6WqOYQC2wUG+cz+Dl8tUhjBi99N/ixetupG713cV4Iau4QujA14IUs1buEcHZsaJcH2CSxmnyxETfgwbhybKz0+sjyRhNdCYC/oEDKETsIJhNT1WO9i9azpB9X6g3yhrZt739wxZFMDrozdmNz92+/n/d4Iv5ubwF0dKcakaaM50cLIR54MfBJoAS2Td+gOaGcp1JXLWIqZqdS4+yCWgw2gyjtBV9BuiWcpkU1ISWZV5CMyvW2hjbIrEXVyyvh3N/bTkSOqDAL0bWgWeJZnyPJ0fuadzapohKxLzx5O3aArglXLgnFvqEaEZhfreBMj7+RjvxCz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(86362001)(71200400001)(8936002)(82960400001)(82950400001)(8990500004)(4326008)(66446008)(66556008)(64756008)(66476007)(7696005)(316002)(54906003)(6506007)(66946007)(76116006)(110136005)(10290500003)(55016003)(38100700002)(7406005)(508600001)(7416002)(26005)(2906002)(186003)(9686003)(52536014)(33656002)(38070700005)(83380400001)(122000001)(5660300002)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BGfwAzFUCiYmI4pdlWbqMKpDx7KnUGggEv9dV+jkLJjVyikFT2zkhP1lCA4T?=
 =?us-ascii?Q?dxR0UOYjdUceWffccPhbHnififYqpK+FB/DeatLhAI1ZIadtjo/RFAk0+X9p?=
 =?us-ascii?Q?sE7nAfuNzGqlX0+HIyX0s3GLKNsVaCgMiIkGJ9rAkHxWe5WTAu2rzS4ouyz8?=
 =?us-ascii?Q?25qPl+kEmF2rkScYzZBJ6tbrAJFtg+aHqTNAIL+J1Y7Y5sSIqf2tzEPn9dYP?=
 =?us-ascii?Q?buZ/0Q/OSY+H92ImKO0jbP+0DL/SphmyW15qzquT7hRTC1KJaj2bNM3u3ZTF?=
 =?us-ascii?Q?s5q7dqubC9KTFLe4LI18oLM5TwRmkyl58znio8uOqffRZxxECB5YixedJ+NK?=
 =?us-ascii?Q?bQ5E9GLXe56e0p773dghG8lUN5iEyHJCeLf7HTFnxUMCDpMYBThmM/rid/9Z?=
 =?us-ascii?Q?TeZUV6K+ZtvtFJfQApeIPi/T6qe3rCj0EGjuoe82MAus32AJCmGSRxE7Nw3u?=
 =?us-ascii?Q?xWrVG9ye8C8EJdMS+pX+DJpynnHzEQELIMvCwZ2P04/fPVU0nCNGE8sblfPF?=
 =?us-ascii?Q?2Ltk+2hQFL9XBiS6tjj1202ADc57jfF7Son3HDOTvdcUphZVABeVtHMeqvEr?=
 =?us-ascii?Q?5iIY6UPhAqT266bPKkMMZ16xIuwn3HbR2AP5jwfnFOLe2Z0wfmV57hcKHyb9?=
 =?us-ascii?Q?3ihBuNkGIv88KqLAjPkVsF5krlcg+gtJKQYrlTtKEpsNSgiK6vbEg3FxPYB6?=
 =?us-ascii?Q?rXgnrdWZ0EBuuffi0To63vXVC8l4duhxnbLO59mMoMZ9Go0eKJ/IyQYV58aq?=
 =?us-ascii?Q?+wWeErwHSlTjA+Hjs2QdLFHK4rET4yHb2gWKitLcG1QyyUgn4nL3cgX4Ymio?=
 =?us-ascii?Q?WtfcM+rb/GhR/Fnp0ygaOAnHoESSHWOuezccSmpbnUfdAQoeKPhw66TPzsSh?=
 =?us-ascii?Q?N/o98VanUQNxhbnPi/fvfie8mUxc6JHHTrUeZEWBc6By5lDrVLpCICk4JH4G?=
 =?us-ascii?Q?sUdKA8oLToxQ+C2uaJ7JoAuwPiopTACT2GmyZm623obOHuma0PB/weQ9tPS1?=
 =?us-ascii?Q?IuBQ8E7hYlO/JeMpmXv8dPY7Iu5zLuhUgpYLwYdHTM9osnvVEmfkdxjNQYIu?=
 =?us-ascii?Q?DfxrWI2iF9rNBynZZt7qu+dZPTnF9z+O2RZPt6o1zpxZYDrq5MbDKqqzujIj?=
 =?us-ascii?Q?uaDqFMVWAYPVK8/VERQpE7RLbtbEQ6gis0P0+5b+hzsd+Jcy6FwnHc1Hrohz?=
 =?us-ascii?Q?0Dct2sE2xGwLTTh0dRxCVVMIU36S3L9L/ORD0NRoimAlmQM5DrJYlnxv4i9d?=
 =?us-ascii?Q?dRvg2ZR/nNZIrRnYEKOHM4qFhL3SBNSCQ710WizmN3UokN/pzVw79coDnBF4?=
 =?us-ascii?Q?P/ncARRTMjVGndaOgQFq5kFbNRhJaX6v5nMmI1GNKDo/7Cv03LB5Ut8Ay+cs?=
 =?us-ascii?Q?LXAoO4GOzxysV8JxtEajV8P0XY57juB4YJxgMGZCocop99tvRoaJG72CGRN9?=
 =?us-ascii?Q?cJJZXzHQlLKOfrtdy6i0V7W1sfKH6YPvMTeUQDOqK9W6WX0c3QT16xdG8Reo?=
 =?us-ascii?Q?fAneX49GPvY6gAsPdtVawydbwwX6Zkkqkx5WqfXHAnY5RhmKccsOkcihhVoT?=
 =?us-ascii?Q?8SmE/jZR9ZWotlCOWwQptC+37oLRwWNVefQdGqpywzleTRawgXfKqgDV3Lnb?=
 =?us-ascii?Q?Bjo3cKPj1m8gXGEBIiFylnRzOQdqsEB9wF1LTrdCYgttayieSbTCJxmIL66d?=
 =?us-ascii?Q?caZu2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d6e4d5-65ed-4dc2-c83e-08d9c05b5726
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 06:14:38.4102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eZ6pq4A7PkIMdqcGP/0mVivXlhB7Zm5ttEPN0eB5RBMFkYw7pr1902VJm30AU6kAFZ3r11LxYBi0TMYOCPy30l0AVasWxzJ11tgrlS3mR20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1273
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Stuart Yoder <stuyoder@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Robin Murphy <robin.murphy@arm.com>, Johannes Berg <johannes.berg@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Gleixner <tglx@linutronix.de> Sent: Wednesday, December 15, 20=
21 8:36 AM
>=20
> On Wed, Dec 15 2021 at 17:18, Thomas Gleixner wrote:
>=20
> > On Tue, Dec 14 2021 at 22:19, Thomas Gleixner wrote:
> >> On Tue, Dec 14 2021 at 14:56, Nishanth Menon wrote:
> >>
> >> thanks for trying. I'll have a look again with brain awake tomorrow
> >> morning.
> >
> > Morning was busy with other things, but I found what my sleepy brain
> > managed to do wrong yesterday evening.
> >
> > Let me reintegrate the pile and I'll send you an update.
>=20
>    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v4.1-=
part-2
>    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v4.2-=
part-3
>=20
> That should cure the problem.

Tested the msi-v4.2-part-3 tag in two different Azure/Hyper-V VMs.  One
is a Generation 1 VM that has legacy PCI devices and one is a Generation 2
VM with no legacy PCI devices.   Tested hot add and remove of Mellanox
CX-3 and CX-4 SR-IOV NIC virtual functions that are directly mapped into th=
e
VM.  Also tested local NVMe devices directly mapped into one of the VMs.

No issues encountered.  So for Azure/Hyper-V specifically,

Tested-by: Michael Kelley <mikelley@microsoft.com>

