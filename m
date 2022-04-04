Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F24F1974
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 19:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXH9y470cz3bcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 03:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=DW0RX7Wd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c111::3;
 helo=na01-obe.outbound.protection.outlook.com;
 envelope-from=mikelley@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=DW0RX7Wd; 
 dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXH981xLwz2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 03:00:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TACXj0m5hlmQg63whxFwyL+531Il1rQSzay6Lg3zbQ793OSXDONDtIcP3yxKCeOLzNq+a9nKCfS9oGNhGHTdQOZFhLr0KmLkUNGu1Uv9G4mGtsChcsixeehYuPXpDPcN6geLHzVOd7PNYcVQHqYn5a1oDjOZdIs3/5uGOY/L//It7L+pBhSzgOHw/Uqu93QEDFMdQDTi7n63kE3QHv2FtOxH6qvcl7vDmpOC1fRWEPK0A5Itp/Jhic1b0LOXv+ekzPO4ny5Qm8fvwvQ1cc2WSUQpmUGYnfbw9Jz4xvUncA8cS/PVNCoA6HzlqD/hny61mT3WcKWWTBkvO3+mYshGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwWuMUnDqeO5LcJCMJgId+ohHq7d05qbPMrinxsEVd4=;
 b=g98GTQnZ0+iEKqpX4LwakFK0l6OOYr09Og7Zm7ASbL/gvuUrGd69foMk91LSmc1oNRllnfGUzcvPKBHachYxEyQrllIuJDwI25Bbzm6Pw2qdc+1VEw8oK+Y16ohuPVQKhflKlHeaDuOaukA1tkkrAiyZXIE153oQ1TnG3veDVNGzRcAaXprJdkYo/0u3cICDWfqoIkhoYORcnJ+a8vk/Dp02VU3mUOfk27bpwZnYYiLr7sBJmOIDoxX8UDAMCZxRcPuyCPPDXRHX5z5lIP91b9es/N82pcxWD3Xxux5eQALby9BCErhXg0DNrVdkSpm/YzWOmYLZGUE9ZRSqqCBRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwWuMUnDqeO5LcJCMJgId+ohHq7d05qbPMrinxsEVd4=;
 b=DW0RX7WdAbBMowT/ezuRthE5lySFbX1fxtjO+bW2AHly9LSwHQ+FR+JEX4AJuQO9qIbIjZp2v8nc+GT2pM1++nwECkOhYDNpoKMgcSXHaZvt1/K3OlXgiyExeHvg/HhQoRa2cbxt51yuwzTxd9A/cm0+3deTV7+J77fk20XcsEI=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by SA0PR21MB1881.namprd21.prod.outlook.com (2603:10b6:806:e6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.2; Mon, 4 Apr
 2022 17:00:34 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::e516:76e:5421:5b22]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::e516:76e:5421:5b22%5]) with mapi id 15.20.5144.011; Mon, 4 Apr 2022
 17:00:34 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Christoph Hellwig <hch@lst.de>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH 09/15] swiotlb: make the swiotlb_init interface more useful
Thread-Topic: [PATCH 09/15] swiotlb: make the swiotlb_init interface more
 useful
Thread-Index: AQHYR+HYUbt0/GHOLkW0vuXDGPTqsKzf+nXQ
Date: Mon, 4 Apr 2022 17:00:34 +0000
Message-ID: <PH0PR21MB3025EED7E82FCD8595D82540D7E59@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220404050559.132378-1-hch@lst.de>
 <20220404050559.132378-10-hch@lst.de>
In-Reply-To: <20220404050559.132378-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=e3951091-16ea-4d78-8883-633f622913fb;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-04-04T16:57:47Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0587c4a-b78c-488f-e1c2-08da165ca264
x-ms-traffictypediagnostic: SA0PR21MB1881:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <SA0PR21MB1881564FA196CBC2EE6D4CB0D7E59@SA0PR21MB1881.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZaeLbJqs81svlLk+SlzjXdK7N2xVa7rka5ocDDrJe7kYTlmEWQqOr77Y02NWVd6f4KSqvGEPZjh+AmKuA0l7K7ojZUO1ujvYu0k8Nwk9Wy065JNPaW/NzkP3Ngm+NQdZl/CjUL/PjbkZZZ+72dZU/vKVvHONW5BHUrl4Zhgzp2qjZt+hsmysFmAfUUWAvi7OONsRTHdUplzvrj+yH8KGZwKCvNYoj7WcA6TW2CTf4113p9U+O7G7ReFmEN+GATkvqLiwjNJV9Elpu4lVuuIh7FG7rqfbHilExATXSNIUChS4146eWKnVfjJLcNklN0BfSdIZ6hPZObDWNOAA/RpmiZUcq+R4artc4lpJmfBl9CTeY7VkJeWYpW4ogBSadjp54jWFa2P0WQ7XsqxbKAWczvO8J/r5nV6wXIrRQFrGluPshTMfkO1yNXiXF3WkM/K5HiRMIEvDuMzWmw+6brTkjEp5nqvRhSWusBpGMzFeoAQIEfIJUA3L7ocLltefNjErIUqCzyTkCUFoAY2UZiVHC2t3KLWKH9qkZENQRBsn3BCWhzXMWQfDu9ut+wKT4yY3n98yu56vkJLJ1roaR/3dwY9gju3iGLAESd7wBmC5r6oH2d6GMgdsrI+0WSddwtcv5SiGqKNFuwxDffVPPXNATfxQQ0aqtVsglftTipfX+zbel0uCBZXLuNGuqkuK13RpZVVsqbL7cw5Kh0XiTBuRMqBPe6MTOQFfzT9iIasd/vt+HoI3Dnywo2GFpT+dvKwr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(54906003)(7696005)(10290500003)(38100700002)(2906002)(6506007)(83380400001)(8990500004)(110136005)(38070700005)(86362001)(55016003)(26005)(186003)(5660300002)(9686003)(66946007)(64756008)(66446008)(52536014)(82960400001)(82950400001)(7416002)(8936002)(71200400001)(4326008)(316002)(66556008)(66476007)(8676002)(30864003)(76116006)(122000001)(508600001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+wiONLzmu/b4DtrUgGfyKUS9rf6Ok+jmTeOrdw4Y9aWQ1QWdS8RDUXqgt2NO?=
 =?us-ascii?Q?6RChP/etz+tW4uco3CM4EdCb5Jh1F/VM/nW0IIm++P0jlcwlL4KBxdOeBTvG?=
 =?us-ascii?Q?hzK5FFbmUa6AjxN34Izya3qjZ9BKPBogUcVV8/u6RL+IDA7Ouvhalq6Yg4hF?=
 =?us-ascii?Q?s1VQ1DPbtjBP6WlRoeckQdR413O4x7c0FeOyYZwhNEWSGOb3Pt0SNLo1BYTj?=
 =?us-ascii?Q?hZHZIOx7LAGje+3gemGY9xpj6DhjsvAD4oq16NGQVS0In+rV3qpyC6J8jS/A?=
 =?us-ascii?Q?Sp5I2hL+SLbQsOTJ0KiXebpEA/RYusPfKj3VjlIRc5Hvb66OTqiX392rQBGL?=
 =?us-ascii?Q?pbRqSUGDegGez0JPiaUtkGwKLU8OdJTeiRVljzCBE4e363nc9oyh6RNYDI8z?=
 =?us-ascii?Q?22HxXyRM6yFGhBCTsxj3QQPWp0kSilO5VcwbSjnbtOkmb7teU2XTPxNCiz2G?=
 =?us-ascii?Q?bz9l7WHYjO9CgOZ119O/HHPlUCevrD/tZgG0W7WaAvS5QKUtSVdcPMcskIVX?=
 =?us-ascii?Q?TDXdaugh00DSLOQSSB1MwvLAJL4vR1bw3u/5Yj1MdLfC1h538Um7blHWh9C9?=
 =?us-ascii?Q?O0i9hhVoZwkfbd+JzA7RG3bTCpHlsXvI48YE5gtBvz98/h1Fsmx60yHRbvjg?=
 =?us-ascii?Q?j2CXWPgiEZOGHMjQ8v5Kmnr/yrtOftnZ5bUr71EdjEQzYW+gXW/ocL1rdQbY?=
 =?us-ascii?Q?Yq4u4Xd11ocY5OUVat1IUO02aKeKif77CUUEzssbmc8VISRg0QcnrcU2a6u3?=
 =?us-ascii?Q?BbMRbBegAmFt7umIB1EoMKtYbBtFwjKKvcHhtc3vDxFa+CD11nPQy4w/dVlQ?=
 =?us-ascii?Q?DgrOkmjafrm2Eavxby7gMTbaN0CH70G1zq7138FJIxg9rESmDA1rXQr27bvL?=
 =?us-ascii?Q?T7hxoChQij7HGGEnHqOdI8wU8ccYC4IYp5b5TV2ss/6UhBYCvMNUHz8N9C0I?=
 =?us-ascii?Q?JXsC08yWJ+ratznHhqIjFIJjUnHWyoWzcmRueJnx6vPIGUZjhqhGKLBl6kA6?=
 =?us-ascii?Q?jH7HECVOygO2pk8eP99metWf4cCeL/h7AfXePjtml++bOtpystg1+KbVy0H8?=
 =?us-ascii?Q?XxTFK81uOQrWnCED9EZDlk/ZGocqsIc04rZyN4z7KpBb8N76udfU+CTfmF4b?=
 =?us-ascii?Q?2kCaime8tRk/swF1jB53NJ6ez3b38uY4mWcvUwr/pKrElN5Y6a2i7g4RdgHd?=
 =?us-ascii?Q?DX+ii7nDbiea7eDutJaf1JkEc27D4+EnP7vfBUvhtrYiYgv2ipx/ZfsMmVG2?=
 =?us-ascii?Q?Rs7gYKc7dOI+NSKTA1E/3yR1kkMKaqlcSFMmVoGFnwU1wQb2vl25th8Lt14v?=
 =?us-ascii?Q?APnKMVQ2PTZiEATHkfdtL9ViMXqTdFRWOc8npwny94btoEBL836OUrLJYyMZ?=
 =?us-ascii?Q?zVupnUUaQj4zy3P9Mip7dbHFDWAmzQP12NUoy3mj1GTt9vlKjba9vPfMIzzl?=
 =?us-ascii?Q?ZgUWsWtsKkZi/UYm54ky3kGcKXZDNM0bV6w9MSyx/1U0GMF9juzTjlIlm2p0?=
 =?us-ascii?Q?aulKnI8VGHtCiHWQ7ceMlYAUN2F2VY5GHDTE8zkeQVGT3hkr0Xb2drM8o+53?=
 =?us-ascii?Q?AZLLXVDFeOimziMU++B018eU0i0+NYPYK4ODz0CO6PiS2L6TZJQ+OkxxzUTO?=
 =?us-ascii?Q?j5VGjXik4oqhh8Y8topFs2KSo8bAYUhcCxCESmb4cxAOMYXh0wUFM83k0QUa?=
 =?us-ascii?Q?niA7L0p8gL3ZKD2VceZHD9JlPB69PNigh/aUrKAZAPwz1PrROeUPr//KC+nY?=
 =?us-ascii?Q?PH+vuAetdEv3PjoCRv66yZXIjt/uDFk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR21MB3025.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0587c4a-b78c-488f-e1c2-08da165ca264
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 17:00:34.0892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZAEkQFQsq5F0lsmoSa6iO94AzGRANX+uCVWnkau3YyCHVWt/RxSfMF+G5QUjGXqlJ+zNi4C/JRH/ac02l43Z+Hf9OyTroP8i5QaFk/7fCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR21MB1881
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

From: Christoph Hellwig <hch@lst.de> Sent: Sunday, April 3, 2022 10:06 PM
>=20
> Pass a bool to pass if swiotlb needs to be enabled based on the

Wording problems.  I'm not sure what you meant to say.

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
>  arch/powerpc/mm/mem.c                  |  3 ++-
>  arch/powerpc/platforms/pseries/setup.c |  3 ---
>  arch/riscv/mm/init.c                   |  8 +-----
>  arch/s390/mm/init.c                    |  3 +--
>  arch/x86/kernel/pci-dma.c              | 15 ++++++-----
>  drivers/xen/swiotlb-xen.c              |  4 +--
>  include/linux/swiotlb.h                | 15 ++++++-----
>  include/trace/events/swiotlb.h         | 29 ++++++++-------------
>  kernel/dma/swiotlb.c                   | 35 ++++++++++++++------------
>  15 files changed, 55 insertions(+), 82 deletions(-)
>=20
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index fe249ea919083..ce64bdb55a16b 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -271,11 +271,7 @@ static void __init free_highpages(void)
>  void __init mem_init(void)
>  {
>  #ifdef CONFIG_ARM_LPAE
> -	if (swiotlb_force =3D=3D SWIOTLB_FORCE ||
> -	    max_pfn > arm_dma_pfn_limit)
> -		swiotlb_init(1);
> -	else
> -		swiotlb_force =3D SWIOTLB_NO_FORCE;
> +	swiotlb_init(max_pfn > arm_dma_pfn_limit, SWIOTLB_VERBOSE);
>  #endif
>=20
>  	set_max_mapnr(pfn_to_page(max_pfn) - mem_map);
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 8ac25f19084e8..7b6ea4d6733d6 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -398,11 +398,7 @@ void __init bootmem_init(void)
>   */
>  void __init mem_init(void)
>  {
> -	if (swiotlb_force =3D=3D SWIOTLB_FORCE ||
> -	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
> -		swiotlb_init(1);
> -	else if (!xen_swiotlb_detect())
> -		swiotlb_force =3D SWIOTLB_NO_FORCE;
> +	swiotlb_init(max_pfn > PFN_DOWN(arm64_dma_phys_limit),
> SWIOTLB_VERBOSE);
>=20
>  	/* this will put all unused low memory onto the freelists */
>  	memblock_free_all();
> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
> index 5d165607bf354..3c3e15b22608f 100644
> --- a/arch/ia64/mm/init.c
> +++ b/arch/ia64/mm/init.c
> @@ -437,9 +437,7 @@ mem_init (void)
>  		if (iommu_detected)
>  			break;
>  #endif
> -#ifdef CONFIG_SWIOTLB
> -		swiotlb_init(1);
> -#endif
> +		swiotlb_init(true, SWIOTLB_VERBOSE);
>  	} while (0);
>=20
>  #ifdef CONFIG_FLATMEM
> diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octe=
on/dma-
> octeon.c
> index fb7547e217263..9fbba6a8fa4c5 100644
> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -235,5 +235,5 @@ void __init plat_swiotlb_setup(void)
>  #endif
>=20
>  	swiotlb_adjust_size(swiotlbsize);
> -	swiotlb_init(1);
> +	swiotlb_init(true, SWIOTLB_VERBOSE);
>  }
> diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
> index 364f2f27c8723..8220a1bc0db64 100644
> --- a/arch/mips/loongson64/dma.c
> +++ b/arch/mips/loongson64/dma.c
> @@ -24,5 +24,5 @@ phys_addr_t dma_to_phys(struct device *dev, dma_addr_t
> daddr)
>=20
>  void __init plat_swiotlb_setup(void)
>  {
> -	swiotlb_init(1);
> +	swiotlb_init(true, SWIOTLB_VERBOSE);
>  }
> diff --git a/arch/mips/sibyte/common/dma.c b/arch/mips/sibyte/common/dma.=
c
> index eb47a94f3583e..c5c2c782aff68 100644
> --- a/arch/mips/sibyte/common/dma.c
> +++ b/arch/mips/sibyte/common/dma.c
> @@ -10,5 +10,5 @@
>=20
>  void __init plat_swiotlb_setup(void)
>  {
> -	swiotlb_init(1);
> +	swiotlb_init(true, SWIOTLB_VERBOSE);
>  }
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 8e301cd8925b2..e1519e2edc656 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -17,6 +17,7 @@
>  #include <linux/suspend.h>
>  #include <linux/dma-direct.h>
>=20
> +#include <asm/swiotlb.h>
>  #include <asm/machdep.h>
>  #include <asm/rtas.h>
>  #include <asm/kasan.h>
> @@ -251,7 +252,7 @@ void __init mem_init(void)
>  	if (is_secure_guest())
>  		svm_swiotlb_init();
>  	else
> -		swiotlb_init(0);
> +		swiotlb_init(ppc_swiotlb_enable, 0);
>  #endif
>=20
>  	high_memory =3D (void *) __va(max_low_pfn * PAGE_SIZE);
> diff --git a/arch/powerpc/platforms/pseries/setup.c
> b/arch/powerpc/platforms/pseries/setup.c
> index 069d7b3bb142e..c6e06d91b6602 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -838,9 +838,6 @@ static void __init pSeries_setup_arch(void)
>  	}
>=20
>  	ppc_md.pcibios_root_bridge_prepare =3D pseries_root_bridge_prepare;
> -
> -	if (swiotlb_force =3D=3D SWIOTLB_FORCE)
> -		ppc_swiotlb_enable =3D 1;
>  }
>=20
>  static void pseries_panic(char *str)
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9535bea8688c0..181ffd322eafa 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -120,13 +120,7 @@ void __init mem_init(void)
>  	BUG_ON(!mem_map);
>  #endif /* CONFIG_FLATMEM */
>=20
> -#ifdef CONFIG_SWIOTLB
> -	if (swiotlb_force =3D=3D SWIOTLB_FORCE ||
> -	    max_pfn > PFN_DOWN(dma32_phys_limit))
> -		swiotlb_init(1);
> -	else
> -		swiotlb_force =3D SWIOTLB_NO_FORCE;
> -#endif
> +	swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOSE);
>  	memblock_free_all();
>=20
>  	print_vm_layout();
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 86ffd0d51fd59..6fb6bf64326f9 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -185,8 +185,7 @@ static void pv_init(void)
>  		return;
>=20
>  	/* make sure bounce buffers are shared */
> -	swiotlb_force =3D SWIOTLB_FORCE;
> -	swiotlb_init(1);
> +	swiotlb_init(true, SWIOTLB_FORCE | SWIOTLB_VERBOSE);
>  	swiotlb_update_mem_attributes();
>  }
>=20
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index 04140e20ef1a3..a705a199bf8a3 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -39,6 +39,7 @@ int iommu_detected __read_mostly =3D 0;
>=20
>  #ifdef CONFIG_SWIOTLB
>  bool x86_swiotlb_enable;
> +static unsigned int x86_swiotlb_flags;
>=20
>  static void __init pci_swiotlb_detect(void)
>  {
> @@ -58,16 +59,16 @@ static void __init pci_swiotlb_detect(void)
>  	 * bounce buffers as the hypervisor can't access arbitrary VM memory
>  	 * that is not explicitly shared with it.
>  	 */
> -	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> -		swiotlb_force =3D SWIOTLB_FORCE;
> -
> -	if (swiotlb_force =3D=3D SWIOTLB_FORCE)
> +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
>  		x86_swiotlb_enable =3D true;
> +		x86_swiotlb_flags |=3D SWIOTLB_FORCE;
> +	}
>  }
>  #else
>  static inline void __init pci_swiotlb_detect(void)
>  {
>  }
> +#define x86_swiotlb_flags 0
>  #endif /* CONFIG_SWIOTLB */
>=20
>  #ifdef CONFIG_SWIOTLB_XEN
> @@ -75,8 +76,7 @@ static bool xen_swiotlb;
>=20
>  static void __init pci_xen_swiotlb_init(void)
>  {
> -	if (!xen_initial_domain() && !x86_swiotlb_enable &&
> -	    swiotlb_force !=3D SWIOTLB_FORCE)
> +	if (!xen_initial_domain() && !x86_swiotlb_enable)
>  		return;
>  	x86_swiotlb_enable =3D true;
>  	xen_swiotlb =3D true;
> @@ -120,8 +120,7 @@ void __init pci_iommu_alloc(void)
>  	gart_iommu_hole_init();
>  	amd_iommu_detect();
>  	detect_intel_iommu();
> -	if (x86_swiotlb_enable)
> -		swiotlb_init(0);
> +	swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
>  }
>=20
>  /*
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 485cd06ed39e7..c2da3eb4826e8 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -251,7 +251,7 @@ void __init xen_swiotlb_init_early(void)
>  		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
>  	}
>=20
> -	if (swiotlb_init_with_tbl(start, nslabs, true))
> +	if (swiotlb_init_with_tbl(start, nslabs, SWIOTLB_VERBOSE))
>  		panic("Cannot allocate SWIOTLB buffer");
>  }
>  #endif /* CONFIG_X86 */
> @@ -376,7 +376,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device =
*dev,
> struct page *page,
>  	/*
>  	 * Oh well, have to allocate and map a bounce buffer.
>  	 */
> -	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
> +	trace_swiotlb_bounced(dev, dev_addr, size);
>=20
>  	map =3D swiotlb_tbl_map_single(dev, phys, size, size, 0, dir, attrs);
>  	if (map =3D=3D (phys_addr_t)DMA_MAPPING_ERROR)
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index b48b26bfa0edb..ae0407173e845 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -13,11 +13,8 @@ struct device;
>  struct page;
>  struct scatterlist;
>=20
> -enum swiotlb_force {
> -	SWIOTLB_NORMAL,		/* Default - depending on HW DMA mask etc.
> */
> -	SWIOTLB_FORCE,		/* swiotlb=3Dforce */
> -	SWIOTLB_NO_FORCE,	/* swiotlb=3Dnoforce */
> -};
> +#define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
> +#define SWIOTLB_FORCE	(1 << 1) /* force bounce buffering */
>=20
>  /*
>   * Maximum allowable number of contiguous slabs to map,
> @@ -36,8 +33,7 @@ enum swiotlb_force {
>  /* default to 64MB */
>  #define IO_TLB_DEFAULT_SIZE (64UL<<20)
>=20
> -extern void swiotlb_init(int verbose);
> -int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
> +int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int =
flags);
>  unsigned long swiotlb_size_or_default(void);
>  extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
>  int swiotlb_init_late(size_t size);
> @@ -126,13 +122,16 @@ static inline bool is_swiotlb_force_bounce(struct d=
evice
> *dev)
>  	return mem && mem->force_bounce;
>  }
>=20
> +void swiotlb_init(bool addressing_limited, unsigned int flags);
>  void __init swiotlb_exit(void);
>  unsigned int swiotlb_max_segment(void);
>  size_t swiotlb_max_mapping_size(struct device *dev);
>  bool is_swiotlb_active(struct device *dev);
>  void __init swiotlb_adjust_size(unsigned long size);
>  #else
> -#define swiotlb_force SWIOTLB_NO_FORCE
> +static inline void swiotlb_init(bool addressing_limited, unsigned int fl=
ags)
> +{
> +}
>  static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t pad=
dr)
>  {
>  	return false;
> diff --git a/include/trace/events/swiotlb.h b/include/trace/events/swiotl=
b.h
> index 705be43b71ab0..da05c9ebd224a 100644
> --- a/include/trace/events/swiotlb.h
> +++ b/include/trace/events/swiotlb.h
> @@ -8,20 +8,15 @@
>  #include <linux/tracepoint.h>
>=20
>  TRACE_EVENT(swiotlb_bounced,
> -
> -	TP_PROTO(struct device *dev,
> -		 dma_addr_t dev_addr,
> -		 size_t size,
> -		 enum swiotlb_force swiotlb_force),
> -
> -	TP_ARGS(dev, dev_addr, size, swiotlb_force),
> +	TP_PROTO(struct device *dev, dma_addr_t dev_addr, size_t size),
> +	TP_ARGS(dev, dev_addr, size),
>=20
>  	TP_STRUCT__entry(
> -		__string(	dev_name,	dev_name(dev)		)
> -		__field(	u64,	dma_mask			)
> -		__field(	dma_addr_t,	dev_addr		)
> -		__field(	size_t,	size				)
> -		__field(	enum swiotlb_force,	swiotlb_force	)
> +		__string(dev_name, dev_name(dev))
> +		__field(u64, dma_mask)
> +		__field(dma_addr_t, dev_addr)
> +		__field(size_t, size)
> +		__field(bool, force)
>  	),
>=20
>  	TP_fast_assign(
> @@ -29,19 +24,15 @@ TRACE_EVENT(swiotlb_bounced,
>  		__entry->dma_mask =3D (dev->dma_mask ? *dev->dma_mask : 0);
>  		__entry->dev_addr =3D dev_addr;
>  		__entry->size =3D size;
> -		__entry->swiotlb_force =3D swiotlb_force;
> +		__entry->force =3D is_swiotlb_force_bounce(dev);
>  	),
>=20
> -	TP_printk("dev_name: %s dma_mask=3D%llx dev_addr=3D%llx "
> -		"size=3D%zu %s",
> +	TP_printk("dev_name: %s dma_mask=3D%llx dev_addr=3D%llx size=3D%zu %s",
>  		__get_str(dev_name),
>  		__entry->dma_mask,
>  		(unsigned long long)__entry->dev_addr,
>  		__entry->size,
> -		__print_symbolic(__entry->swiotlb_force,
> -			{ SWIOTLB_NORMAL,	"NORMAL" },
> -			{ SWIOTLB_FORCE,	"FORCE" },
> -			{ SWIOTLB_NO_FORCE,	"NO_FORCE" }))
> +		__entry->force ? "FORCE" : "NORMAL")
>  );
>=20
>  #endif /*  _TRACE_SWIOTLB_H */
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 9a4fe6e48a074..86e877a96b828 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -62,7 +62,8 @@
>=20
>  #define INVALID_PHYS_ADDR (~(phys_addr_t)0)
>=20
> -enum swiotlb_force swiotlb_force;
> +static bool swiotlb_force_bounce;
> +static bool swiotlb_force_disable;
>=20
>  struct io_tlb_mem io_tlb_default_mem;
>=20
> @@ -81,9 +82,9 @@ setup_io_tlb_npages(char *str)
>  	if (*str =3D=3D ',')
>  		++str;
>  	if (!strcmp(str, "force"))
> -		swiotlb_force =3D SWIOTLB_FORCE;
> +		swiotlb_force_bounce =3D true;
>  	else if (!strcmp(str, "noforce"))
> -		swiotlb_force =3D SWIOTLB_NO_FORCE;
> +		swiotlb_force_disable =3D true;
>=20
>  	return 0;
>  }
> @@ -202,7 +203,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem=
 *mem,
> phys_addr_t start,
>  	mem->index =3D 0;
>  	mem->late_alloc =3D late_alloc;
>=20
> -	if (swiotlb_force =3D=3D SWIOTLB_FORCE)
> +	if (swiotlb_force_bounce)
>  		mem->force_bounce =3D true;
>=20
>  	spin_lock_init(&mem->lock);
> @@ -224,12 +225,13 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_m=
em
> *mem, phys_addr_t start,
>  	return;
>  }
>=20
> -int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int ve=
rbose)
> +int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
> +		unsigned int flags)
>  {
>  	struct io_tlb_mem *mem =3D &io_tlb_default_mem;
>  	size_t alloc_size;
>=20
> -	if (swiotlb_force =3D=3D SWIOTLB_NO_FORCE)
> +	if (swiotlb_force_disable)
>  		return 0;
>=20
>  	/* protect against double initialization */
> @@ -243,8 +245,9 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned =
long nslabs,
> int verbose)
>  		      __func__, alloc_size, PAGE_SIZE);
>=20
>  	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
> +	mem->force_bounce =3D flags & SWIOTLB_FORCE;
>=20
> -	if (verbose)
> +	if (flags & SWIOTLB_VERBOSE)
>  		swiotlb_print_info();
>  	return 0;
>  }
> @@ -253,20 +256,21 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigne=
d long
> nslabs, int verbose)
>   * Statically reserve bounce buffer space and initialize bounce buffer d=
ata
>   * structures for the software IO TLB used to implement the DMA API.
>   */
> -void  __init
> -swiotlb_init(int verbose)
> +void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>  {
>  	size_t bytes =3D PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
>  	void *tlb;
>=20
> -	if (swiotlb_force =3D=3D SWIOTLB_NO_FORCE)
> +	if (!addressing_limit && !swiotlb_force_bounce)
> +		return;
> +	if (swiotlb_force_disable)
>  		return;
>=20
>  	/* Get IO TLB memory from the low pages */
>  	tlb =3D memblock_alloc_low(bytes, PAGE_SIZE);
>  	if (!tlb)
>  		goto fail;
> -	if (swiotlb_init_with_tbl(tlb, default_nslabs, verbose))
> +	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
>  		goto fail_free_mem;
>  	return;
>=20
> @@ -289,7 +293,7 @@ int swiotlb_init_late(size_t size)
>  	unsigned int order;
>  	int rc =3D 0;
>=20
> -	if (swiotlb_force =3D=3D SWIOTLB_NO_FORCE)
> +	if (swiotlb_force_disable)
>  		return 0;
>=20
>  	/*
> @@ -328,7 +332,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long n=
slabs)
>  	struct io_tlb_mem *mem =3D &io_tlb_default_mem;
>  	unsigned long bytes =3D nslabs << IO_TLB_SHIFT;
>=20
> -	if (swiotlb_force =3D=3D SWIOTLB_NO_FORCE)
> +	if (swiotlb_force_disable)
>  		return 0;
>=20
>  	/* protect against double initialization */
> @@ -353,7 +357,7 @@ void __init swiotlb_exit(void)
>  	unsigned long tbl_vaddr;
>  	size_t tbl_size, slots_size;
>=20
> -	if (swiotlb_force =3D=3D SWIOTLB_FORCE)
> +	if (swiotlb_force_bounce)
>  		return;
>=20
>  	if (!mem->nslabs)
> @@ -704,8 +708,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_=
t
> paddr, size_t size,
>  	phys_addr_t swiotlb_addr;
>  	dma_addr_t dma_addr;
>=20
> -	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size,
> -			      swiotlb_force);
> +	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size);
>=20
>  	swiotlb_addr =3D swiotlb_tbl_map_single(dev, paddr, size, size, 0, dir,
>  			attrs);
> --
> 2.30.2

