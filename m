Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6744D4CDBEB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 19:14:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9GFg2Fcyz30Kj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 05:13:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=dUn7ernP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c111::3;
 helo=na01-obe.outbound.protection.outlook.com;
 envelope-from=mikelley@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=dUn7ernP; 
 dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9GDr371sz2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 05:13:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSmHMD9Jw6jHx5Z8fGehEpi9YvYaBqa5J/EQaGE7VUEr50RTeV3DCiT0VvHimDTzMNMHX9h8fszRYlJ1rQaHgbz8+pwudplU6E9GugIBK+F0LPIVn+6iJ4HnlvNyJtK24TGk6D5+k2p9T1seuvmUy5zGzefUR1H0XiXahhRyVfc5A51isOU1KzGWSMbuV5hFdf/wk4NX219XgTwpfzeJcrc+5rRPAPEovDzb5l5Hhkho4Qy+1Ko7fOTXixdokbg7PNoTtKy8xHb6OnD5RwtwUK3MmS8y5KuWowL1W0+JfyLrrHJqrZjgnipZfIqS/mXD/H5jVbLvJOJOxzuuIQhuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OXTrBswO8QeeqMfl0MoFLx04JPU/sOVAvR5g8UTxKQ=;
 b=Kkh8zqHJVF7JY3FzTgtz9DYYrDzmz+TRgI1bQj3ypS2AzkCsz83EFuBOfXNbLKZygE6ODLPiUfZGV+QaV/jYEeClRV7G97ZLzKv4jwJAq7IJHKLkA2fcLRhoJL+wFb+xgAEJnzSvhDz5E/sAQ0bEsVdIQgUqUVVLy6bQBH+gib1G+/ydfO14VJbo7oYAwWCKLb3FsB1ho3VjySXscRY3Zqpr2gjFs+QqbyxMaPrwxgiN0qN2mU8vQGfCgSwRTtrskCnmsQflsQ250yrIVogHMpx9JV6rkk9ZvdZwrPL+tK1x12ajaFkiBRokuUSbQZY7tmHTS+TeN2LEDwkl1VaiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OXTrBswO8QeeqMfl0MoFLx04JPU/sOVAvR5g8UTxKQ=;
 b=dUn7ernPzjoigXe7i1rMEHsk9/iOLg8cw09r8hB2dxGB6LhBj8v9RJaiSJY7lxqccNKxNxry27Z3fr1N6z0nMm1YAoXFZ0kbFKhUOqIEVzk85FkBYicbiZaneadPPEp9iuy/uVIWA4CG4xlSD7dGjYjvJFLpZK0S9pIxWCWPkHM=
Received: from MN0PR21MB3098.namprd21.prod.outlook.com (2603:10b6:208:376::14)
 by SN6PR2101MB1726.namprd21.prod.outlook.com (2603:10b6:805:64::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.8; Fri, 4 Mar
 2022 18:12:52 +0000
Received: from MN0PR21MB3098.namprd21.prod.outlook.com
 ([fe80::a0b3:c840:b085:5d7b]) by MN0PR21MB3098.namprd21.prod.outlook.com
 ([fe80::a0b3:c840:b085:5d7b%8]) with mapi id 15.20.5061.008; Fri, 4 Mar 2022
 18:12:52 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Christoph Hellwig <hch@lst.de>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH 10/12] swiotlb: add a SWIOTLB_ANY flag to lift the low
 memory restriction
Thread-Topic: [PATCH 10/12] swiotlb: add a SWIOTLB_ANY flag to lift the low
 memory restriction
Thread-Index: AQHYLVq0uSlYkDWbKUeZ67gbcRgpDayviVjw
Date: Fri, 4 Mar 2022 18:12:52 +0000
Message-ID: <MN0PR21MB3098F7AFC85BE5D83B0E64E5D7059@MN0PR21MB3098.namprd21.prod.outlook.com>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-11-hch@lst.de>
In-Reply-To: <20220301105311.885699-11-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=4eaee8ee-4e42-4e1f-b906-ba38a9503a12;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-03-04T18:02:35Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c274e37a-cbf6-4184-d10e-08d9fe0a9942
x-ms-traffictypediagnostic: SN6PR2101MB1726:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <SN6PR2101MB1726DFD44A7C57C90A679AEFD7059@SN6PR2101MB1726.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NwWlY8JD0sdIRRJYndPBD+fMQqsNbjr8Myiuy1yngANNrkwyC5GPuLIZ+V8h8cty8BbWXBJs1JHLj8PX7A9TNOyMreN1uXKijrwGQFgoKLn1JZCX7YCnOu8ochcaPxXGq8vi3ZTDVpKWxcEJbRge0zZ5wDQg4jBNlUzb5sFx1Y6gPiY0nv91Lh6Xrll6irVJtqkbtND+y2vl2wgz/wi+LZGZd0bPsuuXxm7qpwwUuL27jRg2Ju86yeWD7+blHyk/WaoMwRL+jy0ZPLd6VVEXJWCTBKycnfWEcTU6dQ5xa80iU0qIvsLtPwTFAJ8ep3he5XxNU4mUZn0unFM9SHhRf4i/+rM6sXEwqm2qLxtoC8eJ4fgq1oDdJpCs9cCKb8r5ctTZgOVGfDeb7N4Th4L36JE3iKCRhc6xdZifYRU081MOoSanxusei1F9eG0TLkGRAi58/hj5+kbazeAcdAoR/L+tJuZgm8xzK/8u2pS1SZr29P22KWSUdpzvgwVRJMPw36++4xRROiN/ACJYK665jq5k5XoeBkgrxnIFGIINQ46d6T7XTF25Nlit9QJVL449NLOFwB7GHvnWGn/U1ls7mL/e/miuJ+TllSp0qMccTMXttUc3/UdepSzBXmtvDfhlQwzo61ZdzY6Bfse3EUuZuYerCeCov+D8dYMN5CRC9zsjlz31ooShCPJNXWpZFg8NuLuOgpjnFBb2SmfH7PaADn5irpZXNopFYwzMWr0s7curB25Vlo6ZStSBWKkHN1YGVoVPPWHeLo0kA8lzZaxrS6IuPg9wDfWDQHeeTqFY4Dj6AORNg3wRC7EitNS3o4NbUz480bEIsgTbUe5um9kV7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR21MB3098.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(186003)(26005)(66556008)(76116006)(86362001)(66446008)(4326008)(8990500004)(66476007)(83380400001)(7416002)(2906002)(82950400001)(38100700002)(5660300002)(82960400001)(122000001)(8676002)(64756008)(38070700005)(8936002)(55016003)(52536014)(10290500003)(966005)(7696005)(33656002)(9686003)(6506007)(316002)(508600001)(54906003)(71200400001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5W5BivVjRFu+Bss9JLAzsEBmo3iUXWlHXJ2EQ/pTokCm2fEyrPFggV2IOXib?=
 =?us-ascii?Q?nFpIG4Ob8VfP/9wk13JwsWBxhtJ8hNklFtpS29K9HZ9ipCjWIseAgkrIbHPi?=
 =?us-ascii?Q?5Q/2NwOHR5SytfYxIVCedi/lZwCYfG68u4O/izLzrOKA3c6viWwDvliqIuMx?=
 =?us-ascii?Q?CsXNxsZk4H2DxwYhWHSgg0A7rimq/elHpADeOLAd1f/a1OAMT2t+7U+btsSZ?=
 =?us-ascii?Q?DGGqxCU1xXjqeLrnsFp56gslIRIKYAa26aOjxNkMmkqm6E/48e6tiwFxJyEa?=
 =?us-ascii?Q?FCKz2+wJKBAUyp1sBnfOARGsnbzAwtxSKV2UMh9qZH6YenQ7vN9RYh0fnisU?=
 =?us-ascii?Q?DE7K6aKl+Uxtq2zvOttc3l9UPZJs2Ib2WA6wJzb83EtaAcFaVBBWHakcHQX3?=
 =?us-ascii?Q?vRIikKrI50z6IxXUySvWIf5Hrd18Q/MU621Djv8i0HuBigliC6++rWx4QmQQ?=
 =?us-ascii?Q?fO9EA9XRdWbNW/NNsN6LhN8vHEmd2n0uBLENjEgvUbMx4gof1KyFpqf1hqRw?=
 =?us-ascii?Q?PgF1/R6LCV5P3p5xcUnlIzBFtFNn3UTIYW6h2IZS6n2EHKiWNFTEXAVsKeOU?=
 =?us-ascii?Q?5XF8qeQtjoeZgqzWAKeuTxwXYwMRHLJzLb4EQtR0uhIPFUbwubt9NTrxZA8/?=
 =?us-ascii?Q?6ac/XijW0xfkH3sesEV4BKxhI5Ltw3+xmQ2TOKyLdoTGpPjgIeuNnrNDN7XI?=
 =?us-ascii?Q?OeI46Iuvb5AtSZllpmkpiomET/3QEZCncmvMbST6vsJ88gupV6APjLwyJGsp?=
 =?us-ascii?Q?yW9nzKJnPap3zEXYnazx84H9wRNp1MBxF+8wvXlWE+2WS1gEcaFLMOeAkUXL?=
 =?us-ascii?Q?fAMzfMK2CmcrnBjoaK+10AOz+L3sRZJ4EuSJGD/lwFuQoJY/8VFAfW3FAcdn?=
 =?us-ascii?Q?BSDjYj9QZP9SNzsAYmKdHwYGoo9o202MpnUDteDlJzqCbEscAXV3Ij/D795Q?=
 =?us-ascii?Q?hYTufnM/O7h3s6DOs9IPu+yCV7Y5T4aaqFK7OIHd9XYRTMyukdeG5a0n0IMH?=
 =?us-ascii?Q?uvL4Pc71A2EDamdm8GcFh6qw5HqBFILaJjdxD6REA4hnV95ouGaB8EnvM3nL?=
 =?us-ascii?Q?hVeqyxzspx4d2GdH2hmNKaFe6EObgVmIjU/IbDs4dO8YwfZb1JraJffynPXP?=
 =?us-ascii?Q?K4o0e8glTXGYr8qY3cpB8i8TZohi09XlURYs9cW/+2wJso6HON3GF0mdg5Lr?=
 =?us-ascii?Q?LWrJucZXX/1b2E8no4bmyJ3jfTJJSR+QIm5I2gB0y8moRP0p15ARU7bd4AjH?=
 =?us-ascii?Q?OFInlLN8MZOhasLLo8I4d6GT2e6Vh71Yueo8yAQwBbGCQJ2KzD0l3D5YxxVR?=
 =?us-ascii?Q?Wkioi6nSqtiVdKyBRuxsrg02ZLF0WIQ7lOqlL7YNbFdLrYmqH+xiw2IDYS3v?=
 =?us-ascii?Q?E6WbzJgsnbrldz/h71J2Q4VcycU73JOaFx2xXlaG1/es8ppAWV6uQnyQEbKH?=
 =?us-ascii?Q?MtyhQBTBbJx6SWmUL/q6hkysFQIJm4croZGHhxdDblbG3dNIEjC8rg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR21MB3098.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c274e37a-cbf6-4184-d10e-08d9fe0a9942
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 18:12:52.2507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3cDJwHIdzK5KgvQc+b6vlI/BNS30x5VYpzHZSFhUXZsLjTDZLZ/Q/04G9r+2ZHIIJa5aoSVkdNWVBg0n2BWL9nsjZLmj/ZVPJbpGvpRLu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR2101MB1726
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

From: Christoph Hellwig <hch@lst.de> Sent: Tuesday, March 1, 2022 2:53 AM
>=20
> Power SVM wants to allocate a swiotlb buffer that is not restricted to lo=
w memory for
> the trusted hypervisor scheme.  Consolidate the support for this into the=
 swiotlb_init
> interface by adding a new flag.

Hyper-V Isolated VMs want to do the same thing of not restricting the swiot=
lb
buffer to low memory.  That's what Tianyu Lan's patch set[1] is proposing.
Hyper-V synthetic devices have no DMA addressing limitations, and the
likelihood of using a PCI pass-thru device with addressing limitations in a=
n
Isolated VM seems vanishingly small.

So could use of the SWIOTLB_ANY flag be generalized?  Let Hyper-V init
code set the flag before swiotlb_init() is called.  Or provide a CONFIG
variable that Hyper-V Isolated VMs could set.

Michael

[1] https://lore.kernel.org/lkml/20220209122302.213882-1-ltykernel@gmail.co=
m/

>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/svm.h       |  4 ----
>  arch/powerpc/include/asm/swiotlb.h   |  1 +
>  arch/powerpc/kernel/dma-swiotlb.c    |  1 +
>  arch/powerpc/mm/mem.c                |  5 +----
>  arch/powerpc/platforms/pseries/svm.c | 26 +-------------------------
>  include/linux/swiotlb.h              |  1 +
>  kernel/dma/swiotlb.c                 |  9 +++++++--
>  7 files changed, 12 insertions(+), 35 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/sv=
m.h
> index 7546402d796af..85580b30aba48 100644
> --- a/arch/powerpc/include/asm/svm.h
> +++ b/arch/powerpc/include/asm/svm.h
> @@ -15,8 +15,6 @@ static inline bool is_secure_guest(void)
>  	return mfmsr() & MSR_S;
>  }
>=20
> -void __init svm_swiotlb_init(void);
> -
>  void dtl_cache_ctor(void *addr);
>  #define get_dtl_cache_ctor()	(is_secure_guest() ? dtl_cache_ctor : NULL)
>=20
> @@ -27,8 +25,6 @@ static inline bool is_secure_guest(void)
>  	return false;
>  }
>=20
> -static inline void svm_swiotlb_init(void) {}
> -
>  #define get_dtl_cache_ctor() NULL
>=20
>  #endif /* CONFIG_PPC_SVM */
> diff --git a/arch/powerpc/include/asm/swiotlb.h
> b/arch/powerpc/include/asm/swiotlb.h
> index 3c1a1cd161286..4203b5e0a88ed 100644
> --- a/arch/powerpc/include/asm/swiotlb.h
> +++ b/arch/powerpc/include/asm/swiotlb.h
> @@ -9,6 +9,7 @@
>  #include <linux/swiotlb.h>
>=20
>  extern unsigned int ppc_swiotlb_enable;
> +extern unsigned int ppc_swiotlb_flags;
>=20
>  #ifdef CONFIG_SWIOTLB
>  void swiotlb_detect_4g(void);
> diff --git a/arch/powerpc/kernel/dma-swiotlb.c b/arch/powerpc/kernel/dma-
> swiotlb.c
> index fc7816126a401..ba256c37bcc0f 100644
> --- a/arch/powerpc/kernel/dma-swiotlb.c
> +++ b/arch/powerpc/kernel/dma-swiotlb.c
> @@ -10,6 +10,7 @@
>  #include <asm/swiotlb.h>
>=20
>  unsigned int ppc_swiotlb_enable;
> +unsigned int ppc_swiotlb_flags;
>=20
>  void __init swiotlb_detect_4g(void)
>  {
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c index
> e1519e2edc656..a4d65418c30a9 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -249,10 +249,7 @@ void __init mem_init(void)
>  	 * back to to-down.
>  	 */
>  	memblock_set_bottom_up(true);
> -	if (is_secure_guest())
> -		svm_swiotlb_init();
> -	else
> -		swiotlb_init(ppc_swiotlb_enable, 0);
> +	swiotlb_init(ppc_swiotlb_enable, ppc_swiotlb_flags);
>  #endif
>=20
>  	high_memory =3D (void *) __va(max_low_pfn * PAGE_SIZE); diff --git
> a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/s=
vm.c
> index c5228f4969eb2..3b4045d508ec8 100644
> --- a/arch/powerpc/platforms/pseries/svm.c
> +++ b/arch/powerpc/platforms/pseries/svm.c
> @@ -28,7 +28,7 @@ static int __init init_svm(void)
>  	 * need to use the SWIOTLB buffer for DMA even if dma_capable() says
>  	 * otherwise.
>  	 */
> -	swiotlb_force =3D SWIOTLB_FORCE;
> +	ppc_swiotlb_flags |=3D SWIOTLB_ANY | SWIOTLB_FORCE;
>=20
>  	/* Share the SWIOTLB buffer with the host. */
>  	swiotlb_update_mem_attributes();
> @@ -37,30 +37,6 @@ static int __init init_svm(void)  }  machine_early_ini=
tcall(pseries,
> init_svm);
>=20
> -/*
> - * Initialize SWIOTLB. Essentially the same as swiotlb_init(), except th=
at it
> - * can allocate the buffer anywhere in memory. Since the hypervisor does=
n't have
> - * any addressing limitation, we don't need to allocate it in low addres=
ses.
> - */
> -void __init svm_swiotlb_init(void)
> -{
> -	unsigned char *vstart;
> -	unsigned long bytes, io_tlb_nslabs;
> -
> -	io_tlb_nslabs =3D (swiotlb_size_or_default() >> IO_TLB_SHIFT);
> -	io_tlb_nslabs =3D ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
> -
> -	bytes =3D io_tlb_nslabs << IO_TLB_SHIFT;
> -
> -	vstart =3D memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
> -	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
> -		return;
> -
> -
> -	memblock_free(vstart, PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
> -	panic("SVM: Cannot allocate SWIOTLB buffer");
> -}
> -
>  int set_memory_encrypted(unsigned long addr, int numpages)  {
>  	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h index
> dcecf953f7997..ee655f2e4d28b 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -15,6 +15,7 @@ struct scatterlist;
>=20
>  #define SWIOTLB_VERBOSE	(1 << 0) /* verbose initialization */
>  #define SWIOTLB_FORCE	(1 << 1) /* force bounce buffering */
> +#define SWIOTLB_ANY	(1 << 2) /* allow any memory for the buffer */
>=20
>  /*
>   * Maximum allowable number of contiguous slabs to map, diff --git
> a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c index 1a40c71c4d51a..77cf73=
dc20a78
> 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -275,8 +275,13 @@ void __init swiotlb_init(bool addressing_limit, unsi=
gned int
> flags)
>  	if (swiotlb_force_disable)
>  		return;
>=20
> -	/* Get IO TLB memory from the low pages */
> -	tlb =3D memblock_alloc_low(bytes, PAGE_SIZE);
> +	/*
> +	 * By default allocate the bonuce buffer memory from low memory.
> +	 */
> +	if (flags & SWIOTLB_ANY)
> +		tlb =3D memblock_alloc(bytes, PAGE_SIZE);
> +	else
> +		tlb =3D memblock_alloc_low(bytes, PAGE_SIZE);
>  	if (!tlb)
>  		goto fail;
>  	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
> --
> 2.30.2

