Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C95BE4C7273
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:22:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6nHv6lhcz3bYY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 04:22:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=g9nhUzwY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f400:7eb2::71f;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=mikelley@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=g9nhUzwY; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6nH64w3Cz30L7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 04:21:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGROcgBaEOXb7LR3FSSNEbts4Yq/gvHTx+QKUuXbAAY5UqWvNzfG7p7f8KZ/E4oIY2Rg3W/6thQHYo5rve1gDrELKt8iS2YFLRoH9fR/9AjQ2lsrgmn9iDX80UAjlSXOSPjssDUT8bTtfta610/KrIXF2KrxowYbVA72b+NZKjemn6I3Q8qTA8pRTtF8REV/JBSss17jNVGtO1VcQKJc/r0HVJUDodOMK67YsY8jVlw4hKBUGKXamkEqnLxEDesq1hYllQrmCfk3QY6HyBfqf6cbFPKkF3CKIzRlGdswgVbTtwwpkjOaxMQW3IwFnOYSnAGrVG3h0f1J30AqcmDstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpdUqKZ7g1q/KewkZ6ChsRglmfEx00uxvbcobvCdGfU=;
 b=LJMs1KTZ7v/9xPQzWqwE99HpshKHrcrSRvv/ORlRAYjEQ4QMFbz9SSuQz569NU3uSyxbw7qgL8vThmNVrmL+iOoOZ5Q05OOgLdlnVnuyY6rt8CO3+nJ7pO6RhgJs5YRQ6hsBnmgzIr9q4dr/DnKFZ7cId8sNR8mK1kPz+NjJsYmsHCLHbZjW/S2w4xeNV0MBOZwP1OY9w/Pm5csoksYWBXZLx9aLCD2H2wSEQ/aNiJomsEF0PFRWEmgnxrcWHd9g/6DyV5ZH6ZfvKyrunrSO9n+PYyWpqMNlu9SlmdfaxECG9OT8XX/tiZEog93mBNempxlHZOzdJ/YJEFwMvv/XAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpdUqKZ7g1q/KewkZ6ChsRglmfEx00uxvbcobvCdGfU=;
 b=g9nhUzwY7Vv8E+CpoSKp6JTM3px3JlWNs6F2X8reB07guIM/x41SwxKlqSwheS10FFvB/Fkeq7/rfh8dcoeOfoUnWfG+L0jxfKfrdqdCGm4VlN8iNabrsfcnlk6IAdWKRQX46VsBv09YurvywJ/Jr7kAhgjG5GLHzKCGlZRnNLY=
Received: from MN0PR21MB3098.namprd21.prod.outlook.com (2603:10b6:208:376::14)
 by MW4PR21MB1969.namprd21.prod.outlook.com (2603:10b6:303:7c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.0; Mon, 28 Feb
 2022 17:21:09 +0000
Received: from MN0PR21MB3098.namprd21.prod.outlook.com
 ([fe80::69f8:51be:b573:e70c]) by MN0PR21MB3098.namprd21.prod.outlook.com
 ([fe80::69f8:51be:b573:e70c%5]) with mapi id 15.20.5038.006; Mon, 28 Feb 2022
 17:21:08 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH 08/11] swiotlb: make the swiotlb_init interface more useful
Thread-Topic: [PATCH 08/11] swiotlb: make the swiotlb_init interface more
 useful
Thread-Index: AQHYK+bNn5GdGBwbMEGdpROKeAVKTayoQv4AgACScQCAAGA5YA==
Date: Mon, 28 Feb 2022 17:21:08 +0000
Message-ID: <MN0PR21MB3098608AE81E444CC3C25B3ED7019@MN0PR21MB3098.namprd21.prod.outlook.com>
References: <20220227143055.335596-1-hch@lst.de>
 <20220227143055.335596-9-hch@lst.de>
 <MN0PR21MB309816A344171B46735CA29CD7019@MN0PR21MB3098.namprd21.prod.outlook.com>
 <20220228113042.GA10570@lst.de>
In-Reply-To: <20220228113042.GA10570@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=09ca4065-c6d1-484e-9620-c278d7ad8315;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-02-28T17:15:06Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cddbc668-5c1a-4f83-a223-08d9fadeb5d5
x-ms-traffictypediagnostic: MW4PR21MB1969:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MW4PR21MB196937E190D2B2302E542BC1D7019@MW4PR21MB1969.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cWMWzCjniKzqFntSWVtxFr6flL5hbkfMuMWEOfWBvp+rRvG3wx0D3BFme7Yx0KkfWddAX+K0TAjZSoBLG/dbCYqG3J4kOuPfduhdVzscxUWeqlC9sCMkCqC0xiejdz/6IT7f6bapZMAliRvF/vblVA6B2YlRczt5t0sEpaYdr5dazTyWOvIE0KVPw6YW5F/PgZj0YMXKWHad3ywMAD+hHR365wls4O+zcl6VWG7NacfeMBxfTB8Nr+2PhySwoukGk4rzlf6C0OODAj+PoceUmzz6B7ak2FDpI7Hs5qR06yzJdm5EDKWHL9m1v4FwEXi2xJ/kA+nFuVK2YrDBsI0KqQMtV8rp674JXYCFZU3QkL+HedGlbfTYi6d23jn2awU57YHtSy2fQoFZ82WoWOwjEKbhX+lbrpEX9ApOdwVw3S9RUm8hmMDB7RemARCNdIBOnPMRt0n+s1AlgosPl75ZvR59aChrKGJeUPiNSc+5cIffAEKtK70UsCmch8KzNHauzAEuGBCVhe0ad4OAnA/wrjzHa1QNqWU9BBO4zAHWz8/RUx4OtzPqv/q5jZnEDIkvcnrTA1e7sVhEtlDrhAaLXEi9iT5mOAdUaZ+CVshr3g3WBcOUxb8jf1BuTEQoYZCCQEhQLQl2I2x/lcQA04gwYJi3joTUh36T1bkrZdCas1OWQuHFQaDuBk6Tz/A4k+zU15fg6Dh8oVWnyCzEwn1IPkzGbyQPt6KEI4s9I4Vmx0F5qReR6C3txeazzxnncn3L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR21MB3098.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(10290500003)(55016003)(33656002)(2906002)(508600001)(54906003)(316002)(82950400001)(86362001)(82960400001)(38070700005)(122000001)(38100700002)(52536014)(76116006)(66946007)(66476007)(66556008)(4326008)(8676002)(66446008)(7696005)(71200400001)(6506007)(64756008)(7416002)(186003)(26005)(5660300002)(9686003)(8936002)(83380400001)(8990500004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?29qyXTMF81O5S1nx5r+Osp6BQ3ZTLcxu2nBcQagislDsBPG7/Ek1jr6Fh3OJ?=
 =?us-ascii?Q?opz233MPZ2LLUS/xrAR5i+eVc/zjCgiVy/ZZuf3InciYY0kMjj7+5VaO5h5F?=
 =?us-ascii?Q?oRKXGdgstHJssPfSfK2WsKYRNeeviAEFXbmxNfv8bknITEhFH5B4d6jwze4c?=
 =?us-ascii?Q?RWXCGfZNF2gKSkuPcpodmLO0n7bQLJyVr8jAXN+XgCdkV91EVzAAYIUz0Uq2?=
 =?us-ascii?Q?yditzag1mxkeDvx+u3/cN7VJT5I5A5f3wl1WsBcvf6OqUpeRsXsL6w5wps06?=
 =?us-ascii?Q?OeyG5v7grFT6+P+mzpPMYT8SNHnzVUa38NYQWN0X4cFU8K6DyNlWpfpn6zUs?=
 =?us-ascii?Q?MXl9+qxlaYoLCV/Gu/olCdfTvRPkm7Eodi56SkhrywkJLBm2oajaleIuYWgZ?=
 =?us-ascii?Q?8WKC+RGUtlMJg5ivA9cB9olJOCkKlh0E+ruPUFdqZO7Wie3Blz9B5aS4egQk?=
 =?us-ascii?Q?ScpyHViNGJli/C8ys0QP2FW8viCgMAzumWEv4zYc2T7kAwrHxo/a/4w8BCUI?=
 =?us-ascii?Q?S9oSQ8iyUaIrjgFXvC/u/FYkaC+gUt2VBaD38jQfKSKwzADe4iDFJUul2VKU?=
 =?us-ascii?Q?XPLpG/26A6X9zUSa3f2pelG03Q52x2t1kHF6BdmAa6JwPo+bCpqzos58Cdnt?=
 =?us-ascii?Q?126Bg+eFBH6hjPcb3bLc8a4jpbrDeMqMk24DcSPLXYQAe2FrIsduyuGRILDq?=
 =?us-ascii?Q?csTj3oIiSQBfTDJnZll226+FPShkzEpQO1d9rZoxX6n5EpKXblNnTktM+xNN?=
 =?us-ascii?Q?17jXiNYZvs95XMpBYvwqVO6k2OnWdtynypvighqRkDlYRiVWEtcBFdmh1B+8?=
 =?us-ascii?Q?DateI3ggNJxMadDyoNzi/IPwpllwUb7Z381uWK5pgamFLgNUq/0jkKwO0/Wx?=
 =?us-ascii?Q?4mvc5QLQIYLHk7w5Z0Ol56+UsMsGe2eYhrmQ26YoCie5TsFOgvuZYIR/HGqH?=
 =?us-ascii?Q?uDNRa+N9vvPIFo9AZJ7Kp172LlVuDohqcCLzE4HokxuVqpG+6qsemCNBOc/S?=
 =?us-ascii?Q?I5HfA3HwA4LUdCpal4akyxUQz4U//cM6fGRRxFdD66OqmWagCtftMRQV6mkP?=
 =?us-ascii?Q?CMbTal9ZvFOLnTE4bdkS1Y3QgAu7h/tEOq/8pWCANPRmkC/nqavd5Yd6J/MA?=
 =?us-ascii?Q?R5R1P67ITW3DpSXyMGg3AA1wzK5psIK3gkl32DnEjiXmj1WkSEHvNYX6ht5K?=
 =?us-ascii?Q?GPB75YGdMVG7gmxMyCTereGHRheCMA4L0Tsuzz0FkN5brsFZXMNcqQB+h0Jd?=
 =?us-ascii?Q?EFzYZm7uPyaqVuh5aH5HtujJZvEMFrXRhSlYRHvK33rdvCM8j2gqMtVcEbB7?=
 =?us-ascii?Q?W1XkihGMneb+CyMh/KOmYFkqY0Srp/mX97+xBeFPHuMTveuzO7Sg540IMVwp?=
 =?us-ascii?Q?hO/qc1LYfKsSvK1g829RchZje/CiVbp7/4/gEZIYVsOwba0W7dYzYwLPhANY?=
 =?us-ascii?Q?UGF1iEfHAQVHD03WfHcq/MLTHnpj0HHw1yEp6mPS7avfnTkrVuX5dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR21MB3098.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cddbc668-5c1a-4f83-a223-08d9fadeb5d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 17:21:08.7946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzOn32YAvsUYVAMMexjkwRxJ/GCrUPaTSyZyITipNC05D/kQ57R5+nXhVEq9s2CnE36lzOIxTlRer+N0f7Wm6ohAO+aiDJeeTp61TqSz2jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1969
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
Cc: Juergen Gross <jgross@suse.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
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

From: Christoph Hellwig <hch@lst.de> Sent: Monday, February 28, 2022 3:31 A=
M
>=20
> On Mon, Feb 28, 2022 at 02:53:39AM +0000, Michael Kelley (LINUX) wrote:
> > From: Christoph Hellwig <hch@lst.de> Sent: Sunday, February 27, 2022 6:=
31 AM
> > >
> > > Pass a bool to pass if swiotlb needs to be enabled based on the
> > > addressing needs and replace the verbose argument with a set of
> > > flags, including one to force enable bounce buffering.
> > >
> > > Note that this patch removes the possibility to force xen-swiotlb
> > > use using swiotlb=3Dforce on the command line on x86 (arm and arm64
> > > never supported that), but this interface will be restored shortly.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  arch/arm/mm/init.c                     |  6 +----
> > >  arch/arm64/mm/init.c                   |  6 +----
> > >  arch/ia64/mm/init.c                    |  4 +--
> > >  arch/mips/cavium-octeon/dma-octeon.c   |  2 +-
> > >  arch/mips/loongson64/dma.c             |  2 +-
> > >  arch/mips/sibyte/common/dma.c          |  2 +-
> > >  arch/powerpc/include/asm/swiotlb.h     |  1 +
> > >  arch/powerpc/mm/mem.c                  |  3 ++-
> > >  arch/powerpc/platforms/pseries/setup.c |  3 ---
> > >  arch/riscv/mm/init.c                   |  8 +-----
> > >  arch/s390/mm/init.c                    |  3 +--
> > >  arch/x86/kernel/cpu/mshyperv.c         |  8 ------
> > >  arch/x86/kernel/pci-dma.c              | 15 ++++++-----
> > >  arch/x86/mm/mem_encrypt_amd.c          |  3 ---
> > >  drivers/xen/swiotlb-xen.c              |  4 +--
> > >  include/linux/swiotlb.h                | 15 ++++++-----
> > >  include/trace/events/swiotlb.h         | 29 ++++++++-------------
> > >  kernel/dma/swiotlb.c                   | 35 ++++++++++++++----------=
--
> > >  18 files changed, 56 insertions(+), 93 deletions(-)
> >
> > [snip]
> >
> > >
> > > diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/msh=
yperv.c
> > > index 5a99f993e6392..568274917f1cd 100644
> > > --- a/arch/x86/kernel/cpu/mshyperv.c
> > > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > > @@ -336,14 +336,6 @@ static void __init ms_hyperv_init_platform(void)
> > >  			swiotlb_unencrypted_base =3D
> ms_hyperv.shared_gpa_boundary;
> > >  #endif
> > >  		}
> > > -
> > > -#ifdef CONFIG_SWIOTLB
> > > -		/*
> > > -		 * Enable swiotlb force mode in Isolation VM to
> > > -		 * use swiotlb bounce buffer for dma transaction.
> > > -		 */
> > > -		swiotlb_force =3D SWIOTLB_FORCE;
> > > -#endif
> >
> > With this code removed, it's not clear to me what forces the use of the
> > swiotlb in a Hyper-V isolated VM.  The code in pci_swiotlb_detect_4g() =
doesn't
> > catch this case because cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)
> > returns "false" in a Hyper-V guest.  In the Hyper-V guest, it's only
> > cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) that returns "true".  I'm
> > looking more closely at the meaning of the CC_ATTR_* values, and it may
> > be that Hyper-V should also return "true" for CC_ATTR_MEM_ENCRYPT,
> > but I don't think CC_ATTR_HOST_MEM_ENCRYPT should return "true".
>=20
> Ok, I assumed that CC_ATTR_HOST_MEM_ENCRYPT returned true in this case.
> I guess we just need to check for CC_ATTR_GUEST_MEM_ENCRYPT as well
> there?

I'm unsure.

The comments for CC_ATTR_HOST_MEM_ENCRYPT indicates that it is for
SME.   The comments for both CC_ATTR_MEM_ENCRYPT and
CC_ATTR_GUEST_MEM_ENCRYPT mention SEV and SEV-ES (and presumably
SEV-SNP).   But I haven't looked at the details of the core SNP patches fro=
m
the AMD folks.   I'd say that they need to weigh in on the right approach
here that will work for both SME and the various SEV flavors, and then
hopefully the Hyper-V case will fit in.

Michael
