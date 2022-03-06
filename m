Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ED64CEC59
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 18:02:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBSZH5sx4z3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 04:02:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=iJCGNxdF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f400:fe59::715;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=mikelley@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=iJCGNxdF; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBSYW51g4z2yHS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 04:01:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYMnlDLnCoTlQ0m0bfddJAdHUnc0KWQe1gNc/5nZKL+bOXXO4x7IJ1Lzo+J6+5g8yJ/7f/khf5gDmSHC3r6uVNI6yUbP+r7KIRg+vmQCwXSaUy/kzR0sBUqFktRUy5XozVHzpsBMSv+xL6L3QYy5Ez1WZbfMeyhauU7+GRQtQrlr1hZ3s4kXtehlcDyyAN9+DNVjZOeGZtUEJF6rmp+0wXOUZ+TpIHh+trpkGXUyavel/aFtOLAnYnUqvPBl+BTYXLagteOJRdfOWFjhMQBV9jXmIZXLSU/NH1otendfS4WhEhUsrNn2bE/Ff24dUXkK4zTQeQF/m6gxbd6HJV83Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOLUEoNUTj3NHP00m/Xck2wpfIX+AoQV3lb6Af/zENw=;
 b=i3leWI6ml4/sGDaUguV3EF6vrimkBHk+Ntf1hC6+tgEKdh9FfyKFDUXdJt6Mc6gGp62eSHewYa7JVjUk8SvDwVHpEDEJ02+GCEZ0HYUchH0KRQWbJx0Rj+6UtmjU0eOkQy+UfMkJGpb9m7Q1cOLruPHt5WO+i5+vSmGpqXXlcjVkhXbQ881cgusbgrdC7/f5hsjoipWeLbR2EaFHv6bhOEvnODmaYKNpPvPw+30cFQ286SWDNabAI/gh+D0Ph11kloM9/mYb13PuKVkrwBYIShD4Yz+kYX74dJZnPRPzARS6GhaYcti+twRFwS5MRjz00Vkm0SiRhgJK/Us9iJ27zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOLUEoNUTj3NHP00m/Xck2wpfIX+AoQV3lb6Af/zENw=;
 b=iJCGNxdF3Fo0JwCRGxSWD8hV5azsE8sqYRXKmv+oOMtnpDVDrsqx6f3tT+jCO/MhFWdWUjGKeM4YxMCgxFi4ZNUAwkizBqYblPXhhdgSVxh6YazT1NVkCNrv8hdTV6XMVczk0C5pVdjD2fmIsOE0uwX/CRXIZjW/1ZFY12LBio8=
Received: from MN0PR21MB3098.namprd21.prod.outlook.com (2603:10b6:208:376::14)
 by BYAPR21MB1365.namprd21.prod.outlook.com (2603:10b6:a03:10c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.4; Sun, 6 Mar
 2022 17:01:28 +0000
Received: from MN0PR21MB3098.namprd21.prod.outlook.com
 ([fe80::a0b3:c840:b085:5d7b]) by MN0PR21MB3098.namprd21.prod.outlook.com
 ([fe80::a0b3:c840:b085:5d7b%8]) with mapi id 15.20.5061.008; Sun, 6 Mar 2022
 17:01:27 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Dongli Zhang <dongli.zhang@oracle.com>, Christoph Hellwig <hch@lst.de>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH 10/12] swiotlb: add a SWIOTLB_ANY flag to lift the low
 memory restriction
Thread-Topic: [PATCH 10/12] swiotlb: add a SWIOTLB_ANY flag to lift the low
 memory restriction
Thread-Index: AQHYLVq0uSlYkDWbKUeZ67gbcRgpDayviVjwgAAHDgCAAwkZ0A==
Date: Sun, 6 Mar 2022 17:01:27 +0000
Message-ID: <MN0PR21MB3098558B83B5A520FFCCE6D1D7079@MN0PR21MB3098.namprd21.prod.outlook.com>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-11-hch@lst.de>
 <MN0PR21MB3098F7AFC85BE5D83B0E64E5D7059@MN0PR21MB3098.namprd21.prod.outlook.com>
 <556312e4-da86-b980-475c-1cfd7818ffdc@oracle.com>
In-Reply-To: <556312e4-da86-b980-475c-1cfd7818ffdc@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=433969a6-4cde-4cdd-a529-34a7717de2f8;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-03-06T16:49:10Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d1051ce-a5a5-44e0-5274-08d9ff92f44c
x-ms-traffictypediagnostic: BYAPR21MB1365:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BYAPR21MB13659872C94F06366112C6F1D7079@BYAPR21MB1365.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sKKeFCLNvMjnyHGD9VaKYbwd5Pg9weElV4ETq1Pqmqqn32mZiekTXGmrD/vwB/odF3nTejr2LIYwdMHnQecOFII8b3qUpO2cBVumdJCLy5ngI66nhqP55bgBzK6QgqSSTt93iceFbEkbcuG+asHps2xQeJDpL6taKFhFHfB2DBmjELCWMGSlOhqgRPXv67/d6rkkNSL2/ggsmbdBvEbbH0tgF0kNJ/ctZy8onH62M/KB8qv8FIQmk4+dgUJ2T936HgwGihBH6mUhop0z+Hf9zeFasO7mEkJcV5CNxOTmhER+vVzVE1GFkmiz6gqZctQp8nXHkLjPSuWwB3UNzdOddSXlb7gNxaW8zzc/mGdgWJBErOr7tVA4NEEcveqXJ/UKRP6OvcGON9var2DtSXuZkxQG7cpAv0hxWKfHJ3kj/GBpubxjKySlYu6DkwwiuyJekUyEajpyjC4XBVRcoqRNK3V+GxNeagAlTAkeTMDLa3EMVDs+gxrg8itYEIXzlvByy6E/82xoV5cWC1EN7BZIpiLu5MoBXt0Gouy1z9OzWwTcJo6hX+15tRw83DQ0UrqNt5PVBorphcJ9+2EeL8kCMw1RNXfzw5hMeu11i1GKnbO0I4sdrCvlEXLMCSGum0oSXeYpoNmG6IuURedIR+YjwCIibQMGVELKWEc8bH4Oumfnxw1DwjTr/kJkp0YfcnCg8JSGRzgqrHxjVe/97258itAcqQMemqR8Gm24NZ7adN95x9aBW8eb8KxIR0aOGb//MUtUbLbJQHr3mheMTFV5uTMLfCgqJ/UlUe+EX+r8WS+5uWnoRR08ItokhtRpcZPL4UM9+1xcnW2jgzA5MlPO4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR21MB3098.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(8936002)(71200400001)(508600001)(7696005)(5660300002)(26005)(53546011)(83380400001)(7416002)(55016003)(52536014)(86362001)(8990500004)(186003)(66556008)(64756008)(66946007)(76116006)(110136005)(4326008)(66446008)(33656002)(38070700005)(9686003)(316002)(2906002)(10290500003)(66476007)(82960400001)(82950400001)(122000001)(966005)(8676002)(54906003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xwcnoc49++k/XhQTp+2xSDHA9y6nJz1z6k0O1G26LmO5odDj/mcyDy67UKpQ?=
 =?us-ascii?Q?atsCmhOUT1CNoCRvsRb8FJ15c9CcTSJjscmwn5zBVkuYykgc5hTEkO5ubS5Q?=
 =?us-ascii?Q?G538yKWNDx5PH93yx3TryuzdyH5nS43Ye0o0AEufYshObFIybN8nC+m68cH5?=
 =?us-ascii?Q?C2slQIIBhjp2nUMG6wFxsLo1bskfI4bPX3H+PCHw6O4X2XbmnIiap7/GBTS+?=
 =?us-ascii?Q?/DOAOc3fS/Ydm1bbmXFypF4miLfReMO5WJ9mqWN39GuQo7nF2QCCA9B56pjh?=
 =?us-ascii?Q?N9iV2ducIHefTDbAC/Ylt5O1k/mwFoLRlSsk0BXY5vx94mzelBOmrV2f5gEH?=
 =?us-ascii?Q?QpxJ50Xz3f9v/GLa6QuIJBDyU6Z5w+1mWtASBeZakgsenBrHs6vpLc+nAuWs?=
 =?us-ascii?Q?zD8WOsuZveyljsCkxzUdhaw4FOWu/e83hI+Jn0/iY4lUL6/9IvoGqrBCsNbM?=
 =?us-ascii?Q?2IiH4PRXYfUiiNcjiaAqjEZZuMLapJ/Xl0RFMLOdNX0xlfI4AGE0qQd87A0Q?=
 =?us-ascii?Q?/FG/my6ddA8Rld9tKAMbMZrmWHNp67KoM15gYAdYVHDUdkFG3HRBh70ySdqJ?=
 =?us-ascii?Q?E345gse/QkZqtt90wGCVdGQZTsmqC682iQlOeNdd03LiEsobH1KrAi9GShyz?=
 =?us-ascii?Q?BNag8SVzmr+RcOJ+przr77WaIgb/OHw89MiITVdJZ6l2XAPb7ffb31/9kjsc?=
 =?us-ascii?Q?PLI/ebYE69W0zxOhyTK6A+zKj004ROzHjd7avlxfjlFN3w+1o+/uTpT8sChW?=
 =?us-ascii?Q?SLHRjLsTq2Vtld8UDs7E12yswQyfbSTv4qZFrFEKXR88gqZnvcM/5+UULPiQ?=
 =?us-ascii?Q?dbYUkCFtQ0Hzf/7Qr7eAQTXBDqNLfZyYcvR0B94CO+y9RhOD5LltrpwI+er8?=
 =?us-ascii?Q?6QE07Qi0W5gizDqrWeAl+dfOUgqo/YerLnvRffG/DEvo0P4pSuD4xtFyqyP0?=
 =?us-ascii?Q?9rC1GvF/aky2xcQhqdJZ5gTIvcDEvY//3x+zyfvX7OoNBQx/BAVHd43tE2ZJ?=
 =?us-ascii?Q?dwUyBphT15DI8gmCDgHtX5lDMsdkgaNQDZantDHFJzs1sgV3eqQ4vC1rcjKb?=
 =?us-ascii?Q?qx18JiDUikv/LWeabdhyicg83Uhx0/TfItI6XW9uy8dfCHCnkpbibYA3Cn2X?=
 =?us-ascii?Q?6ulK98fJukbpLv7k3CuiwCnBe7xZIF5gIIyS2z0QlWrfxUbQqZ3N/zjsJ3VH?=
 =?us-ascii?Q?o1mF4oWflEKfjAgZ7DV6d/irZ4u9qVNSQ6ovp5EYG4ivC3Zala8A8OSNadOR?=
 =?us-ascii?Q?70KPAhcVq/HShpqT2avpnIdshnYUio277Oscxj5eHYDwXwCSZ0dfEzHfQkU8?=
 =?us-ascii?Q?QDSuuvI1DzoXS055cIJI6z1QUuXBlB2s1v2PxaxikB2CS1vYlAs5pSjpE+uP?=
 =?us-ascii?Q?H/hpqt+CxLOBq3GA/bAjCLWUFW7xufRy1i2eDyLv6Y6tl5/MG0snzjjR0EgH?=
 =?us-ascii?Q?/tz+aVekbQq8cN/mYRDSOSTFpMha6iN7LO3GwYE9oLufTZm6Xmnt/A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR21MB3098.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1051ce-a5a5-44e0-5274-08d9ff92f44c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2022 17:01:27.7736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Q0P5BfbqyMvCZd1dvCYqFGw3KLmQ/5chX9kG4KyKK7Eoffm0WWVL9/U+9PkReHFRC8UhPbPgRfmtnQ6VwnAaX7dxPg1zbseOeLON1XtiHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1365
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
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Dongli Zhang <dongli.zhang@oracle.com> Sent: Friday, March 4, 2022 10=
:28 AM
>=20
> Hi Michael,
>=20
> On 3/4/22 10:12 AM, Michael Kelley (LINUX) wrote:
> > From: Christoph Hellwig <hch@lst.de> Sent: Tuesday, March 1, 2022 2:53 =
AM
> >>
> >> Power SVM wants to allocate a swiotlb buffer that is not restricted to=
 low memory for
> >> the trusted hypervisor scheme.  Consolidate the support for this into =
the swiotlb_init
> >> interface by adding a new flag.
> >
> > Hyper-V Isolated VMs want to do the same thing of not restricting the s=
wiotlb
> > buffer to low memory.  That's what Tianyu Lan's patch set[1] is proposi=
ng.
> > Hyper-V synthetic devices have no DMA addressing limitations, and the
> > likelihood of using a PCI pass-thru device with addressing limitations =
in an
> > Isolated VM seems vanishingly small.
> >
> > So could use of the SWIOTLB_ANY flag be generalized?  Let Hyper-V init
> > code set the flag before swiotlb_init() is called.  Or provide a CONFIG
> > variable that Hyper-V Isolated VMs could set.
>=20
> I used to send 64-bit swiotlb, while at that time people thought it was t=
he same
> as Restricted DMA patchset.
>=20
> https://lore.kernel.org/all/20210203233709.19819-1-dongli.zhang@oracle.co=
m/
>=20
> However, I do not think Restricted DMA patchset is going to supports 64-b=
it (or
> high memory) DMA. Is this what you are looking for?

Yes, it looks like your patchset would do what we want for Hyper-V Isolated
VMs, but it is a more complex solution than is needed.  My assertion is tha=
t
in some environments, such as Hyper-V Isolated VMs, we're willing to assume
all devices are 64-bit DMA capable, and to stop carrying the legacy baggage=
.
Bounce buffering is used for a different scenario (memory encryption), and
the bounce buffers can be allocated in high memory.   There's no need for a
2nd swiotlb buffer.

Michael
