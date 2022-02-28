Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC2C4C6175
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 03:54:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6Q2t21lfz3bgh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 13:54:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=WH4Au/u1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f400:7e8b::725;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=mikelley@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=WH4Au/u1; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::725])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6Q225p97z2yP7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 13:54:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uxr/H+0VHYjtixcCNiJhNVsAkUTVHABVRiEjtjIlwufEjFxZ8Eh0ltsXlBE8Oqw2JxNZUNmgPXtOdjO502CC4IgYnJ6SLY0VEtialT9getwLzbPg7hcoWvgrwJhUaWT773wjlSGb+QSfqweOI31hR8H6HEtWz0lGqpetZF5GBQM4BF4mHGLHS7GuL9tSm7sFgNC76chJcMQHb3wPonQQw8lQ5ArllHB3jOY6CvmQl+Rj2QDQV3RS4xSarhc5s5BxT83HiHD+sFG6cnxcvfjfDzJEoZqUB5u8XKXfxs1zbDa9pe1ElQSZzHySpGgyZyZrLSNNBlNkpY0Ih7Q+hRb5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUQzgDhFXj39UwjsoncgNcIWa1l4ZcVYsMn1FkSIhVs=;
 b=KuABfYBu8dRbhpq/Ms8IkUlKlVTgZlgCCxlFYN0GSr+Cuo8MOH0L/PqrVUXDP07RxO1lgq9DbGDcho3sjJs5/1vu2/nfoU5fxB3j3WuePzpwfjtSJ4R2TYxoJ+GJvoVd6Qn3ognoByz/TtOoAsDllrz3LL1E/mhXUu11kUMghzkIxCmHhkFMGhr+fkqlS7nSKawXUhTTzulsdZIvshYviBGj72mhvdldLlbVkITesqF+zDsA17Tk/GLl48cx/pUrwzyiidxv9XKlJGmpTjphHdSPPR+r4c7VPEjdXw+gtIgZC3drdIIGE3WfMFTQhvvONb+YpgxyYXiFNiXsHqc40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUQzgDhFXj39UwjsoncgNcIWa1l4ZcVYsMn1FkSIhVs=;
 b=WH4Au/u10QL2YXuccVwaVhYaL5TtX3pVeqdOhHKxnSrj11hBx5hD5Z+hK2LCyxc94YTU8yKBlXeH87ObgvZbNzbv9bQ2oUBpO6aHaOYHTrjtnORXb5vGmcWzyQNSVOVz6cd7enMYQQ9UnoE0TL8Z0MzrfUUXR5jdMltX4O+2eIs=
Received: from MN0PR21MB3098.namprd21.prod.outlook.com (2603:10b6:208:376::14)
 by CY4PR21MB0135.namprd21.prod.outlook.com (2603:10b6:903:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.1; Mon, 28 Feb
 2022 02:53:39 +0000
Received: from MN0PR21MB3098.namprd21.prod.outlook.com
 ([fe80::69f8:51be:b573:e70c]) by MN0PR21MB3098.namprd21.prod.outlook.com
 ([fe80::69f8:51be:b573:e70c%5]) with mapi id 15.20.5038.006; Mon, 28 Feb 2022
 02:53:39 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Christoph Hellwig <hch@lst.de>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH 08/11] swiotlb: make the swiotlb_init interface more useful
Thread-Topic: [PATCH 08/11] swiotlb: make the swiotlb_init interface more
 useful
Thread-Index: AQHYK+bNn5GdGBwbMEGdpROKeAVKTayoQv4A
Date: Mon, 28 Feb 2022 02:53:39 +0000
Message-ID: <MN0PR21MB309816A344171B46735CA29CD7019@MN0PR21MB3098.namprd21.prod.outlook.com>
References: <20220227143055.335596-1-hch@lst.de>
 <20220227143055.335596-9-hch@lst.de>
In-Reply-To: <20220227143055.335596-9-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=54503504-d8f3-4c3e-a3cf-4bee18dc2a5e;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-02-28T02:46:33Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad617b86-9c9b-4e42-4228-08d9fa658626
x-ms-traffictypediagnostic: CY4PR21MB0135:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <CY4PR21MB013561022727D491FE6CAF60D7019@CY4PR21MB0135.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jgY3to4oAxE+ZbyD313tm4v2LKB9wgdM/t4YKDWaNfCvbK0n+Fd3cojE1ClcO7QxvKMwF/uoufBShgtPGVTookIDiit+Fcjs/CtlqwsgEvEo4fQFnoFV3/1YS4VjkI5iooYW8QfBgPveg5sC6UkAgzma431tSutH7J7B68uasxC8IpKZDwgpaQX5tVtWURwLUEPdekPQr2Fy66CSy9uEX9PAbtyjH6gGRva4egr9bx+NLYcWuCOCML22RZDZxzp9K9zQ5/UkDPoltk/0sCiffwK8ZP6OlEXCZMpQfV4gN3xyZdTYp7QVBAi5MInJQJJ4sWsbbFwN2AE37HW3rspqojnINkB+YueoibYA3ftD2U53G3Slgid5Vp1pvUVdMjw8k5X2l0o4c8rvodEaqvG+1++Y6uMeDz80bhyq7YCQo60CGpic2JFXgSbbbfF1wat5FEGC65HXY9jGw4LDInsbJrVRIeKr9xXzDKrRCSMIf47Edu2KZWsiA0fbm11PsYTnx/zD1/aAF+151CIdXz5fN1MPp/jSDB5Id1ZPTFBmPhW1M1Yxo0hdW+9XTVVdv4QpjhCvSoQPUM9tSqm7o2EGSH6n5v4etwyhoHDEKV/qQb8EGMxnEi9CbZN05fN6wbR+A/LZSc0yJyquLD6rRcF4HI0XSOhLpot/uQWELl5MN11aEYRY3dUJA0iy/vi/JUuxc/UqJHsHKADReFFdoo+Pd0kYiIVT/vPx7ozfSALqTv4Y2v7AzQ3PVH0naZ4RIbMH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR21MB3098.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(316002)(7416002)(83380400001)(8936002)(76116006)(86362001)(122000001)(52536014)(4326008)(8676002)(38100700002)(33656002)(110136005)(66946007)(66476007)(66556008)(66446008)(64756008)(26005)(82960400001)(82950400001)(5660300002)(54906003)(186003)(8990500004)(6506007)(38070700005)(71200400001)(2906002)(9686003)(10290500003)(7696005)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bI3bCFBx6zsQOCHdRhVezvuntStzw2ubtckeFpHc6FRUctIevqiE7viqUUMk?=
 =?us-ascii?Q?XLAwGeVVeDMurGjR/Q+JYa67qMrcn7lnZVlho37bdx+OfmZoH6P4QRY3Uv6N?=
 =?us-ascii?Q?oC39s+hMI1aLvlgJRY5ac9p/kuzRmv5pARGW9VNE//6XeIuxjvpn0E1/GYlB?=
 =?us-ascii?Q?5baH/JwBHhbePMb5NrWTEp7Chv8J923oKbwVB5OPEAgm6Y26DilPQgidrXpS?=
 =?us-ascii?Q?Tp1WKWF0V3ZU/nwKfDl1TxK2wPxpBQ4TPs1M7VR+Mluv5E9p47N3LpCchXBQ?=
 =?us-ascii?Q?/kzdxwpGnjv21Wkdu8UBqkpH9QCEpokR3gEdzxYz4Lne//7IAZmHJNKBc0Wx?=
 =?us-ascii?Q?DrLES/rDF9pEuCqBAqvthSOhAYo8TmhIlmn4LzsEpAn2ooLfby2eN1AKFOji?=
 =?us-ascii?Q?4K9g0Jj7cghNPgPaSTXRo0i/hONGui2O8/w4Eoka0wSFuHuPoTRdh1hUOWoG?=
 =?us-ascii?Q?qc/rixUlG+ImhiFuwkAu8dtndrkox1HzC0uCB6MzwH9W4Lurb4C+WccM76Ea?=
 =?us-ascii?Q?MxBacIus5w6Zm3F0D9ThiZ936iL+6L5L0hcuIwL8MdcYvQgY+JLVcXjH8Gv2?=
 =?us-ascii?Q?Fme1GRcqgEyucZyj3wA9MDEpPMJUnXRoWC7lt+20EP6B6phcSHGEPcE0mLZV?=
 =?us-ascii?Q?if/QiOUNvHsh8vSRixEZUrVYl49ilI2c25b38VhZm+YNLfWhhwQncZDqhK9y?=
 =?us-ascii?Q?JrDj3APCrAMpwESWdu42hnAxYw/X94rtNXCR8pokyc0Ds/KmDb0wSnS7hP0Z?=
 =?us-ascii?Q?h8vspIlXxjMwVlWXJd9hHLjYFw5MFLuE/JFVqV/6AnSzLU87pFaeKvoIWu+P?=
 =?us-ascii?Q?On6/qewv3P5ZehLY1lb+GuW8IU9MeLjAO+m5JSDvi+rIoOCL/wJMG6vT0K2+?=
 =?us-ascii?Q?U4iLRx0tEgym7IdSDKMj6vZajYd5aYBrF99ikT5pC0aOIyTMIkf/CN2MJP98?=
 =?us-ascii?Q?PCE3vEkdsi+HN1akosWx6vQEDbzWW6gN4DBu0MZsmpymyQrz8CImXdIJ5lwC?=
 =?us-ascii?Q?JR0xBIXPGb1/IqsYZVVr0fQgCcrwlYqMMuf0wr8hJ0eHjwot++uNuCnZrYV/?=
 =?us-ascii?Q?TMREqnmp436YIFK/j3m4WsI3PmwtIYYkQGgsJ+QKjSgGVyy9+YXcaStaOLAs?=
 =?us-ascii?Q?7/S+J4H5UK3YDA+qm+DQUBZU/aYzGc+xKm/k0NP8Uc8OS7fYw7+EzvxHoXsQ?=
 =?us-ascii?Q?2CGWTIy7L19LFU01lANImKIxPVvgkd2ydXpJGU0AAVFSTA2KiyrVvuJogK9s?=
 =?us-ascii?Q?4px/EQJ+fTByINM4KtL7WrD27DdUfxzh4YWpkn5tQEVtBIZ6nISzva4fL1Za?=
 =?us-ascii?Q?WSF5t2PChgd8tFGSv3ov5hr971K7PMrLu5SL2LCrE2U5e/lpBM7TCzkVtrfT?=
 =?us-ascii?Q?YkPp7KphcWAzEL7INpnql/Awh4O1m92TDMNyXIuE02TDoObTdIXvVgkXITno?=
 =?us-ascii?Q?65STsxtjRIAoPjVKKuyymTczT0L5OWO2F/X3HMuBMIwD2Fuv8S8qnw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR21MB3098.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad617b86-9c9b-4e42-4228-08d9fa658626
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 02:53:39.7488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q9m4+4xhejZm5i6EYSB7ZZnkSKhosXtmzoGei3eyArUh57G0m5VTfc7xylx9wwvd4b9gPdNNpH4yjn7LuEGVnmYpGWDjM4GJQEejazXlEMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0135
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

From: Christoph Hellwig <hch@lst.de> Sent: Sunday, February 27, 2022 6:31 A=
M
>=20
> Pass a bool to pass if swiotlb needs to be enabled based on the
> addressing needs and replace the verbose argument with a set of
> flags, including one to force enable bounce buffering.
>=20
> Note that this patch removes the possibility to force xen-swiotlb
> use using swiotlb=3Dforce on the command line on x86 (arm and arm64
> never supported that), but this interface will be restored shortly.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/mm/init.c                     |  6 +----
>  arch/arm64/mm/init.c                   |  6 +----
>  arch/ia64/mm/init.c                    |  4 +--
>  arch/mips/cavium-octeon/dma-octeon.c   |  2 +-
>  arch/mips/loongson64/dma.c             |  2 +-
>  arch/mips/sibyte/common/dma.c          |  2 +-
>  arch/powerpc/include/asm/swiotlb.h     |  1 +
>  arch/powerpc/mm/mem.c                  |  3 ++-
>  arch/powerpc/platforms/pseries/setup.c |  3 ---
>  arch/riscv/mm/init.c                   |  8 +-----
>  arch/s390/mm/init.c                    |  3 +--
>  arch/x86/kernel/cpu/mshyperv.c         |  8 ------
>  arch/x86/kernel/pci-dma.c              | 15 ++++++-----
>  arch/x86/mm/mem_encrypt_amd.c          |  3 ---
>  drivers/xen/swiotlb-xen.c              |  4 +--
>  include/linux/swiotlb.h                | 15 ++++++-----
>  include/trace/events/swiotlb.h         | 29 ++++++++-------------
>  kernel/dma/swiotlb.c                   | 35 ++++++++++++++------------
>  18 files changed, 56 insertions(+), 93 deletions(-)

[snip]

>=20
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyper=
v.c
> index 5a99f993e6392..568274917f1cd 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -336,14 +336,6 @@ static void __init ms_hyperv_init_platform(void)
>  			swiotlb_unencrypted_base =3D ms_hyperv.shared_gpa_boundary;
>  #endif
>  		}
> -
> -#ifdef CONFIG_SWIOTLB
> -		/*
> -		 * Enable swiotlb force mode in Isolation VM to
> -		 * use swiotlb bounce buffer for dma transaction.
> -		 */
> -		swiotlb_force =3D SWIOTLB_FORCE;
> -#endif

With this code removed, it's not clear to me what forces the use of the
swiotlb in a Hyper-V isolated VM.  The code in pci_swiotlb_detect_4g() does=
n't
catch this case because cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)
returns "false" in a Hyper-V guest.  In the Hyper-V guest, it's only
cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) that returns "true".  I'm
looking more closely at the meaning of the CC_ATTR_* values, and it may
be that Hyper-V should also return "true" for CC_ATTR_MEM_ENCRYPT,
but I don't think CC_ATTR_HOST_MEM_ENCRYPT should return "true".

Michael



