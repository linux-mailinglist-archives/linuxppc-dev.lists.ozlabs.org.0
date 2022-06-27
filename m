Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A255BCB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 02:30:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX59W3LdYz3bqN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 10:30:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qccesdkim1 header.b=gWVql1TE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=216.71.142.165; helo=esa.hc3962-90.iphmx.com; envelope-from=bcain@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qccesdkim1 header.b=gWVql1TE;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Tue, 28 Jun 2022 00:33:49 AEST
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqwY48Zmz3bhf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:33:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1656340429; x=1656945229;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eYXH/ctB6v6XAcg42LM5ozEFN2HdhzgzZ+oK7wTjzCM=;
  b=gWVql1TEj4RO2BWs+7qcoGqClWACNI1nXWVUzc+8t3i3M45kPhEh/Yln
   FlnaW4Ez94dJgeZegO3Mm900+pflRl2wJgQLRc4aVVXU+HvIlPZ9glzb3
   1k+J0ozN8IXtGGiXybUVdIRSiSE97jjw+C78/1hk7PQAkgDjQY4uNkPl8
   0=;
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 14:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGOW8HUQIVaBTKpLWO+C4aPx6X9Xj3tooAfUWy+sPob781xwBfm+C7JsnAksVL3znA9fm8u9Q75Yeyd1o3Tge/tgaB1QffUppb747SaJw7lnJLJEB2Xolc+JaNjb7JGObqPkaNoXE5DSopsiW9Mz+IgZg7Q6LgK8dem1EfY/Dom8edgAwsjSPNiacB+Hm2wzLwIUdwES/SUxe7yPv5rnwHaMz/wspCxkPKRIaycwdqM2wHSk9mY5u492fZdBRANCSJlUmUMbcg8VJ4szN2By0Hj7ofjbjGE+lD1M2HU+LUA6MB3sN16m1uRBbHyqicSMhC2JSQuKZ7BagnmJAqeNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYXH/ctB6v6XAcg42LM5ozEFN2HdhzgzZ+oK7wTjzCM=;
 b=NZV31S8FY6LC+g0g4cS2e7+2EXToeuvX68UC8oiP7n15GL6EZoAyZ1Mk1LHHX6fJX7VbAv+uimUrpPyQNsAC0kPaga/El4ds1wJy/cUhoO9f/AUWI9p0aAw7xE0g616srjc8/TO5zPLlR3p3S5f1GWXxGuJrdLgScP+KM8s9alFA7vwQIrE/EWOEIOGH6W24mSg5e2A4jrxGMnrxSVeZBY3/bdNKpW6zIyQUWeApbFkcPIz5rVzVthWopVzFqCLjm8u8BWNFFMjxBwObIj6EtyDtdfBdxIB5F+UnczM9fuBx4/wn2aVBgcNsgo2gZa+FV5t69Qn33EI2GYHVUGr4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by DM6PR02MB6138.namprd02.prod.outlook.com (2603:10b6:5:1fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 14:32:29 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::f4c0:89e2:789d:ceb1]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::f4c0:89e2:789d:ceb1%7]) with mapi id 15.20.5373.016; Mon, 27 Jun 2022
 14:32:29 +0000
From: Brian Cain <bcain@quicinc.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: RE: [PATCH V5 12/26] hexagon/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V5 12/26] hexagon/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYieNaF68nviM9AEWMdUsq7TAcg61jUU0Q
Date: Mon, 27 Jun 2022 14:32:29 +0000
Message-ID:  <SN6PR02MB4205D2460F6DB1F3C82999BDB8B99@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-13-anshuman.khandual@arm.com>
In-Reply-To: <20220627045833.1590055-13-anshuman.khandual@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4ab36eb-bfe6-4b73-98a3-08da5849dd6d
x-ms-traffictypediagnostic: DM6PR02MB6138:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6LCBwa4CDTnSlgl6CnuvSHylK43fGHMLoBG839b+bXfVd5N7nYAqXddIKZqfMqXLDn6rdkMCP1/tZanVPeTPStEENKwpoEwvg8a0U6B/0/Ru8PHLp8EMwwlxlorNMwaAPhooSIHXe7nn8Z1ShjJ0dbEY2E3yX75YVCgoONo8/wT4Yp6zLqRil2kKMbKONi36XpqRJ62+CwUUA0rs8EYeg183Y/Nnzo8iYxACJkCAvv6uMW4GQlZO+IT8CgIrtpAaFh8vh4oq3k8339e0GqYlzOjkOwDqIfJDV4g3950HVCaF7gJRK8W/YV4c/M2sTtKAnZAzAp8OJnCivz55DqELuL+WRsKJOQvqZmwJdVdEcUS6HnSuyQZEjzX5c2CuBF6vVaMKBpkmRnBRlZn7mQhLMmQIGEtZhKClBhltEqaQAUMuE6h2rHsyU/HNe6/zj7Pniiyg77NtFG695+ENaEfPLLX8eBmdMPen7Wsl95DYcmW5egsFZmfXQ3rmNkz7xZxIotgUiku9DQAVGXvhGg6rFa8TTWNy7DcQXB5Hq57Qi/2nig5m7DruO8mx/x339XgDAo+wpIhkdysR0Xb3viQDLPnLEFX/NFqwRO8f6S1hJLGrZtxw3nCBuS7djTB/OYrEh0bRQbCS+XpS+5u74i+LLi89/GWkJbV0rSokF7YMuKyr2wfVZbnYPBfFLPEMyl/NZ8/npwsOHL3S22bC/riomYaiHfFjkhVIB3H8V/MO4W1u+CO6mrQ6oqQ+S6hzCuM98onf4SChF/QNMNhu2JlgX6H5pEuPIykBm/FLc1PIeTw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4205.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(7696005)(64756008)(7416002)(66556008)(83380400001)(76116006)(71200400001)(66946007)(41300700001)(110136005)(8676002)(38100700002)(122000001)(316002)(5660300002)(26005)(54906003)(9686003)(86362001)(186003)(55016003)(2906002)(33656002)(4326008)(66446008)(66476007)(38070700005)(52536014)(6506007)(478600001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?fjdQUrKtASc2PpuHSL32JID+E3A8OdplJEurfWMCyWe1Ev0UAJb0kdJj2NuG?=
 =?us-ascii?Q?TlHv362lWxFoa5ALdsalq6xQWXSkO1YHoSJZY1k/rgx3J9dRCpUpxJtleWXj?=
 =?us-ascii?Q?ODdcjBHLqnp8WDg5wZVvpSO+GL8oXGAHwTr/ZjunTHyCIIEI/9QixrMCTsHp?=
 =?us-ascii?Q?7c5StcktmyuahjQeoeWVM/YQY8NsrQovteH2B/LvMZ6KGp024b0F7uUisWfq?=
 =?us-ascii?Q?+qQB1c1bIgNNH1WqYoZcu5gHJp337FDnuLe4nTqkDp3+cY42e2lP7jx6P9YY?=
 =?us-ascii?Q?GhUh5g+n8x8YRQt8Mpul/tlamczbwc/Dwh4pMotReDzXA8otSpw7fHIgqXj+?=
 =?us-ascii?Q?P7RlC0kVsZ7z5Az84FNGanwqy/bzikZoZYizroHVA/rmaC8EOzC2Rk4CkyXv?=
 =?us-ascii?Q?bZ8kSJGpToeh8O0GmHov5z2+/y3o2y0WWRvHOajDZXYB/5DpQZml+CgrN7Hs?=
 =?us-ascii?Q?Ou7iPMNFH+llQl3dtFofdGRcVZgRRKlKlNZvlTdLRUHpOwDGNi0x4k1zyEWN?=
 =?us-ascii?Q?TF6mzhZU4b3NFyGD/uG4/FWlbwgB4dV/IAL5MjjYug+4Z6P3IHUynKxDFbKz?=
 =?us-ascii?Q?ld/E9TkW1XZdKvkO805FstbIC4WtHsR0/erVsqP5MBSsRIJ7vfXLHYU284GL?=
 =?us-ascii?Q?kdVdT4aFiZsFORwOYvCuACAo9COWGeNV3AvFy+QxZwnsExzUgKcqqFc/wnRS?=
 =?us-ascii?Q?GQV6446YR4t9ooSnxQksthTEWeRWBNqkPTXe030jVc4yT5zeAXe5X6aGyEBN?=
 =?us-ascii?Q?VI6sPh+1rOEjS2/J4/GyFcbxW36qPqW4WWtKI1CL5lCH8A2N764ShZOKmoJx?=
 =?us-ascii?Q?IT0TMj8HZaeNiFuU5jCbUTJZPm6ARtU4eRp8rJdPWp0mCzU48npI4j0ga/bT?=
 =?us-ascii?Q?ns61D7TIBY98KX+NRDwu9anufHWBA8F45bVSPmvVsqouV9T0cN2z8tRtILcN?=
 =?us-ascii?Q?YBWCpGRq6B53gAqpAP6ERpRWDnbmS3zzNz4gElNUQsUiiyE62DhXwx4eoerU?=
 =?us-ascii?Q?3tClec7saJePlwbyuI+e7R5ysSR0cNnqLnHZtSU5Oa6iJpykIqtef0MYYRvE?=
 =?us-ascii?Q?p/wuhHMG5ys9bOxu3CpQudb2iDo7EvXruu0mrNxQVkF0f3sSBvgIRwQZH/3S?=
 =?us-ascii?Q?4eGoZhjEfrowgTio9EVAdKZ9FsSLrTfax+q5bW6C3PSaZB5F3Qv6ki+OZD9a?=
 =?us-ascii?Q?cnSVWsU72bjIXvLVSmM8lepIJhvSBbsCMXg1MaBU86su0Ipiqyzwh0IoO+SU?=
 =?us-ascii?Q?hm0J0op3lWe/SWrxgDhzur+2KBstLAH5JpBTlQ6tlwaY1xSc4UbI1eslgG6Y?=
 =?us-ascii?Q?WQEZ8lV1EFXR1uWVEJVZCI+SE98u4nI7h1aEw2t8DqveVLGyxF19c9SCNhJD?=
 =?us-ascii?Q?Oeflzg69bdYlLrdLheBQyDg5nnoRfnNJneD0CpPbrXYWggRXTSRPXggodcn3?=
 =?us-ascii?Q?N9RgBCFjUkp8ohtO/cnQgW1IdvFSX31rCJuDpOsg3nf7aFjqVYxX8wYadu2Q?=
 =?us-ascii?Q?XngHluuV8mZbArW9Q+q6i7T3IuXo9L920bB2loJhgUKHY6vu6HLBscmSIbM+?=
 =?us-ascii?Q?uA7yYrM07LaCL9dzQfTN1fZctgrOxlZODvGqAb+s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ab36eb-bfe6-4b73-98a3-08da5849dd6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 14:32:29.6681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yz3IG0XM+MN1EUq2d+bRK8OLWKZV1yEnYf/4cni8BG9mK0RhLJTaLfTZn2doXORgMtR06QceXTPWnrNZpZNkrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6138
X-Mailman-Approved-At: Tue, 28 Jun 2022 10:29:05 +1000
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@l
 ists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Anshuman Khandual <anshuman.khandual@arm.com>
...
> WARNING: This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
>=20
> This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports
> standard
> vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT,
> which looks
> up a private and static protection_map[] array. Subsequently all __SXXX a=
nd
> __PXXX macros can be dropped which are no longer needed.
>=20
> Cc: Brian Cain <bcain@codeaurora.org>
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/hexagon/Kconfig               |  1 +
>  arch/hexagon/include/asm/pgtable.h | 27 -------------------
>  arch/hexagon/mm/init.c             | 42 ++++++++++++++++++++++++++++++
>  3 files changed, 43 insertions(+), 27 deletions(-)
>=20
> diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
> index 54eadf265178..bc4ceecd0588 100644
> --- a/arch/hexagon/Kconfig
> +++ b/arch/hexagon/Kconfig
> @@ -6,6 +6,7 @@ config HEXAGON
>         def_bool y
>         select ARCH_32BIT_OFF_T
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +       select ARCH_HAS_VM_GET_PAGE_PROT
>         select ARCH_NO_PREEMPT
>         select DMA_GLOBAL_POOL
>         # Other pending projects/to-do items.
> diff --git a/arch/hexagon/include/asm/pgtable.h
> b/arch/hexagon/include/asm/pgtable.h
> index 0610724d6a28..f7048c18b6f9 100644
> --- a/arch/hexagon/include/asm/pgtable.h
> +++ b/arch/hexagon/include/asm/pgtable.h
> @@ -126,33 +126,6 @@ extern unsigned long _dflt_cache_att;
>   */
>  #define CACHEDEF       (CACHE_DEFAULT << 6)
>=20
> -/* Private (copy-on-write) page protections. */
> -#define __P000 __pgprot(_PAGE_PRESENT | _PAGE_USER | CACHEDEF)
> -#define __P001 __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_READ |
> CACHEDEF)
> -#define __P010 __P000  /* Write-only copy-on-write */
> -#define __P011 __P001  /* Read/Write copy-on-write */
> -#define __P100 __pgprot(_PAGE_PRESENT | _PAGE_USER | \
> -                       _PAGE_EXECUTE | CACHEDEF)
> -#define __P101 __pgprot(_PAGE_PRESENT | _PAGE_USER |
> _PAGE_EXECUTE | \
> -                       _PAGE_READ | CACHEDEF)
> -#define __P110 __P100  /* Write/execute copy-on-write */
> -#define __P111 __P101  /* Read/Write/Execute, copy-on-write */
> -
> -/* Shared page protections. */
> -#define __S000 __P000
> -#define __S001 __P001
> -#define __S010 __pgprot(_PAGE_PRESENT | _PAGE_USER | \
> -                       _PAGE_WRITE | CACHEDEF)
> -#define __S011 __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_READ |
> \
> -                       _PAGE_WRITE | CACHEDEF)
> -#define __S100 __pgprot(_PAGE_PRESENT | _PAGE_USER | \
> -                       _PAGE_EXECUTE | CACHEDEF)
> -#define __S101 __P101
> -#define __S110 __pgprot(_PAGE_PRESENT | _PAGE_USER | \
> -                       _PAGE_EXECUTE | _PAGE_WRITE | CACHEDEF)
> -#define __S111 __pgprot(_PAGE_PRESENT | _PAGE_USER | _PAGE_READ |
> \
> -                       _PAGE_EXECUTE | _PAGE_WRITE | CACHEDEF)
> -
>  extern pgd_t swapper_pg_dir[PTRS_PER_PGD];  /* located in head.S */
>=20
>  /*  HUGETLB not working currently  */
> diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
> index 3167a3b5c97b..146115c9de61 100644
> --- a/arch/hexagon/mm/init.c
> +++ b/arch/hexagon/mm/init.c
> @@ -234,3 +234,45 @@ void __init setup_arch_memory(void)
>          *  which is called by start_kernel() later on in the process
>          */
>  }
> +
> +static const pgprot_t protection_map[16] =3D {
> +       [VM_NONE]                                       =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  CACHED=
EF),
> +       [VM_READ]                                       =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  _PAGE_=
READ | CACHEDEF),
> +       [VM_WRITE]                                      =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  CACHED=
EF),
> +       [VM_WRITE | VM_READ]                            =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  _PAGE_=
READ | CACHEDEF),
> +       [VM_EXEC]                                       =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  _PAGE_=
EXECUTE | CACHEDEF),
> +       [VM_EXEC | VM_READ]                             =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  _PAGE_=
EXECUTE | _PAGE_READ |
> +                                                                  CACHED=
EF),
> +       [VM_EXEC | VM_WRITE]                            =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  _PAGE_=
EXECUTE | CACHEDEF),
> +       [VM_EXEC | VM_WRITE | VM_READ]                  =3D
> __pgprot(_PAGE_PRESENT | _PAGE_USER |
> +                                                                  _PAGE_=
EXECUTE | _PAGE_READ |
> +                                                                  CACHED=
EF),
> +       [VM_SHARED]                                     =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  CACHED=
EF),
> +       [VM_SHARED | VM_READ]                           =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  _PAGE_=
READ | CACHEDEF),
> +       [VM_SHARED | VM_WRITE]                          =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  _PAGE_=
WRITE | CACHEDEF),
> +       [VM_SHARED | VM_WRITE | VM_READ]                =3D
> __pgprot(_PAGE_PRESENT | _PAGE_USER |
> +                                                                  _PAGE_=
READ | _PAGE_WRITE |
> +                                                                  CACHED=
EF),
> +       [VM_SHARED | VM_EXEC]                           =3D __pgprot(_PAG=
E_PRESENT |
> _PAGE_USER |
> +                                                                  _PAGE_=
EXECUTE | CACHEDEF),
> +       [VM_SHARED | VM_EXEC | VM_READ]                 =3D
> __pgprot(_PAGE_PRESENT | _PAGE_USER |
> +                                                                  _PAGE_=
EXECUTE | _PAGE_READ |
> +                                                                  CACHED=
EF),
> +       [VM_SHARED | VM_EXEC | VM_WRITE]                =3D
> __pgprot(_PAGE_PRESENT | _PAGE_USER |
> +                                                                  _PAGE_=
EXECUTE | _PAGE_WRITE |
> +                                                                  CACHED=
EF),
> +       [VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]      =3D
> __pgprot(_PAGE_PRESENT | _PAGE_USER |
> +                                                                  _PAGE_=
READ | _PAGE_EXECUTE |
> +                                                                  _PAGE_=
WRITE | CACHEDEF)
> +};
> +DECLARE_VM_GET_PAGE_PROT
> --
> 2.25.1

Acked-by: Brian Cain <bcain@quicinc.com>
