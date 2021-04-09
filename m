Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95C35A884
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 23:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHBmh35fBz3byJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 07:56:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=JSDjr/pM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.78; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=JSDjr/pM; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHBmB3Mk9z3bTH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 07:56:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYMSKTuRi2o7X/oL570QG3qiau8WPPn+evcGopL2uGqpWwkt3nt8iCWKtsr1o8IXLbml8jgeYhcn0bJiotLNVnjjWMyZM3dNyQMcc1JSakikws+7OOGt6/ZtuclUl7wzXo2s3RXhWtM5DtkC2hfyiqeI7IUpSPKKfjXW36IagbFbZ7ns3CEKoy3LLXoMEt9qBIex80z/Me3K27y+rMuhlGrwIVcQtPxCJuzbOem6da+fO/qAkVk04icGnRliyBLBC/gN5jVj7iS6HbJlYWxmW/3/1LhM0xGtWDEumvDDW0FA4KDk5p4pEJvrbVj9tqmBLw2o2rMz/d1n63io6M39oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iaSEqGmYlpiIHYKCpKnMALw/TWq8eXhy6MTOGwqd/A=;
 b=VoB5TEKiw00yGDaVfY7dYhS2AYlO8yqUjod6IJl/WBd6K3bvIBELdVRqWm3aTmX+XuYYr2OIuRvqbXmY3iGuwDHanIJWPcek7ZUr7kgX7gZwURVy01QKacl/R/HpcG6VT9v+UTn7+CcyLsifpy60qEtaAAot34hPqoE3LEvEosmQfaw+BTcUXQkUpLNYcIQeQ15DA+axy7SGzF7dCqg07/+l6jX2X/+gYfW50sw9zxMMtwdDsLl7lfjmyhrvhV4E8orzP0RLN4VMr0MWEYFf6vTiqn3GtL/5ytQyPlTBjNxuAfmh0mUQF0XpcBpnYA7aakuiUR9ydyIcdUQBiErdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iaSEqGmYlpiIHYKCpKnMALw/TWq8eXhy6MTOGwqd/A=;
 b=JSDjr/pMiwpInZBWWCqE5mk96lVO5Y/WK+CVcZS+cTqntV/CWOE9VxVJRe9qGSB22hWDM9Sv6w6ayMVdF4Hfi/YaD3XRcjgq8yYF9qaXaT5j+h6Ug9Sp1juMSbj8DbC4bTBxnVDvsgk7ueBC2HMUdnqFqCYHLALpQpRlEko8Nv8=
Received: from AM6PR04MB4471.eurprd04.prod.outlook.com (2603:10a6:20b:1f::27)
 by AM6PR04MB6166.eurprd04.prod.outlook.com (2603:10a6:20b:b6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 9 Apr
 2021 21:56:16 +0000
Received: from AM6PR04MB4471.eurprd04.prod.outlook.com
 ([fe80::5961:303c:4973:f21b]) by AM6PR04MB4471.eurprd04.prod.outlook.com
 ([fe80::5961:303c:4973:f21b%6]) with mapi id 15.20.3999.032; Fri, 9 Apr 2021
 21:56:16 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ye Bin <yebin10@huawei.com>, Qiang Zhao <qiang.zhao@nxp.com>
Subject: RE: [PATCH -next] soc: fsl: qe: use DEFINE_SPINLOCK() for spinlock
Thread-Topic: [PATCH -next] soc: fsl: qe: use DEFINE_SPINLOCK() for spinlock
Thread-Index: AQHXLSTUMJPMTYcgGEmdwjH8p41/uKqsu+wQ
Date: Fri, 9 Apr 2021 21:56:16 +0000
Message-ID: <AM6PR04MB4471507F0A759451E68FA8638F739@AM6PR04MB4471.eurprd04.prod.outlook.com>
References: <20210409095152.2294487-1-yebin10@huawei.com>
In-Reply-To: <20210409095152.2294487-1-yebin10@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.83.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd46d67c-e573-40e7-35e4-08d8fba24cc5
x-ms-traffictypediagnostic: AM6PR04MB6166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6166D60485880084493EB5018F739@AM6PR04MB6166.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Utu+jVcHGUt2kcnmGan/d0xyuVSVpsoEbqinA1Y7T5MeY7lCE/cg4RaE3WAhATiue7ufQs2iAi2Qq6/ZIm4M5OY4vvOBOUB7j+vEM0RMGp46gbea/NeQcrs5bspdChyxs8cxKP5Is8GI4EiH+xLW/3I7SL7JMkXtS5lKGysXcQ+6A7xNVgF+j4OpGhZLgY1r+Um21kqDBUflJ2ccdSa3SkbI8KiCEI5tXhsdwBUB3uw5WvyYaPfkhu2k04d/53uX70WUfhw/6O45HxjSikgr8OszYkcfcJoL/EPHxpJwZhugz56J9eh+ncdjaFjBw8B2b0fPR761Vz2y1DuGnRlZY71vzOeHYSRsQlaaGUc/N6AeLYMZkaOt6dZ7k7GMk+j/VxP9AlIh6BjK5ZIgUIvUEPWoY1t5AsmQcUmyrDJf2KNFXNHeX28oAyIi3Ey5EnsasASb5bRQW7X1NcN5q960hVrZgcU9t7prRjUiB0TfRbjV2a4MKOVnQ17VybUvubpzvXCgBMm9vXO2r7bLpD5ppPr7g9Zd89LGlyapcYPtIDQfMyt+gqa1bz4VHKUeq5VnPInaN6xZRIgBF+c0t+JZIHWDxI9XWUpukjWIGDt6yXvMYVDD4fWvpDp1lyYMi8DC3lxQpLsB2mw8linwJ50vnrkfQcNQA1+nc0OsPqIVKno=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4471.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(64756008)(66446008)(5660300002)(66556008)(66476007)(52536014)(26005)(83380400001)(110136005)(53546011)(86362001)(2906002)(6506007)(478600001)(6636002)(186003)(38100700001)(55016002)(7696005)(54906003)(66946007)(9686003)(8936002)(316002)(71200400001)(76116006)(33656002)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pUp35RPrR6pJ9De/l5pSQLXidcDwLXrvrj6p2xKmFvNwIawbtoEwOvvYo4yy?=
 =?us-ascii?Q?xzH9k/qXVds/qQZgCsii5z3ZMGeXhr4jpKnvIdERWBBOklxlkl5ryjPwlab4?=
 =?us-ascii?Q?2ERbBHv02Rr9jQikNcaLrhJMXVTsYj0oQegm3uDHuflkSbtynKm0a5UELCN3?=
 =?us-ascii?Q?nVUqCQId95TDebPbCYT1qW5J53OwSD5KJwmdDwhhMGj3MyY+hgcXcd5j/BP8?=
 =?us-ascii?Q?2WLMK7TVwgp9Dgxh57PQciE17pY1yIB+or0s9v1pyzhaeqNv+RpHcA5DLtks?=
 =?us-ascii?Q?p7wW1NMvQFHEUZ1cd6DzWcRH15p9LNX0Y8T6/R6m+duUEX6kOUz+Xrt+d8LP?=
 =?us-ascii?Q?NYmY4Ji/1juJhfzfTZ/PdnN6/5esW9bY93+CkpfenVlEvSf1pOY+p5FtD7iJ?=
 =?us-ascii?Q?NgTljgjn8Qew5r+SAgxhPGQHSlWJ4DVY7fNmd+GDPPK6NbjvUqHDXE8YKetO?=
 =?us-ascii?Q?cESyz0BKp9Bla708jbcMK2TBx/GgUneM39OTmutm/R9iEGsTloTWmsvQKbBk?=
 =?us-ascii?Q?YzSldPipJrSxV0TU0ewQVFy4spMyIkgb5wGgedGIafPFX8wVPucqFRq3ySzw?=
 =?us-ascii?Q?KnlusuY2n/pKxeYyHNFPSrsgt92gEiQtHW85nuWbE1WjVLSC2TBsrzMz64ZX?=
 =?us-ascii?Q?Xzi3hXVGdqHbD9NhdiV3/DavZL5L8XSVNfRDwxHh90kR0hd0HJVXxDVelJbg?=
 =?us-ascii?Q?tT2W6x6NxzPjDKYxl4HL4FY2V5srSuaEwnludzg4yiThGgdtq2WNhVLvhjlx?=
 =?us-ascii?Q?QCGkrurztlT8qHO9BBAQo1+xo97rULgPN725WCKc++HaH5U+2a6FDGfDH9vC?=
 =?us-ascii?Q?lCFADvZA0r8c+vbr0ttcvd9OxyxxotmFpOWvOwpzTu84n228ajy0nbg0Y0Ft?=
 =?us-ascii?Q?t0S3ZKEIgh5kUO4xUj5BZ2XX334zmAmL7Bio7Htv7Gg3rAP8yA3JQTK+GcmJ?=
 =?us-ascii?Q?rKBIN2TEVmC0uJ2s5mqloPtkvGyUsNVl5IFV8n49knPHgqkK+D51/RuexdyJ?=
 =?us-ascii?Q?/X1fjSZdDpq5oTcnVJCOI17SdwJ34JltdfavaKVuBf6Gu4PAZwFSo4eTuKFh?=
 =?us-ascii?Q?3nYW7SM3wnod05XxkNZtpPLurx+gkQ4vgwPpWMQukC7SZ/ypfbQErlcxl87J?=
 =?us-ascii?Q?WrblUOyET0WiSrrONawVXZNHDjFNvCIqQz2R9Ueh4mvyZ9BpkfqEHDg+tjiQ?=
 =?us-ascii?Q?B9wDe1kYMZpdtBOpXm72ECiPhEHYJpjcBMiVsySlf3UrjS3XhDeMP8VN6JzE?=
 =?us-ascii?Q?Fm12Jf7XyINHcsXAMWI+GQ2g8aVZjtFiBTAauqV4hhXsfQT36jbsSIZy0OwP?=
 =?us-ascii?Q?QKyNZkyopUUNQBku3DtpCJF9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4471.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd46d67c-e573-40e7-35e4-08d8fba24cc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 21:56:16.2449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lqwp379Nl/i/6Iernp4tZeH74OfvJLJWb0BSbxrIWx0t33LwdOhNbECQe8OBqarfmKxk4GMlGM9vTvEncvBNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6166
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Hulk Robot <hulkci@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Ye Bin <yebin10@huawei.com>
> Sent: Friday, April 9, 2021 4:52 AM
> To: yebin10@huawei.com; Qiang Zhao <qiang.zhao@nxp.com>; Leo Li
> <leoyang.li@nxp.com>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Hulk Robot
> <hulkci@huawei.com>
> Subject: [PATCH -next] soc: fsl: qe: use DEFINE_SPINLOCK() for spinlock
>=20
> spinlock can be initialized automatically with DEFINE_SPINLOCK() rather t=
han
> explicitly calling spin_lock_init().

The previous version has been applied.  Thanks.

>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>  drivers/soc/fsl/qe/qe_common.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/qe/qe_common.c
> b/drivers/soc/fsl/qe/qe_common.c index 654e9246ce6b..a0cb8e746879
> 100644
> --- a/drivers/soc/fsl/qe/qe_common.c
> +++ b/drivers/soc/fsl/qe/qe_common.c
> @@ -26,7 +26,7 @@
>  #include <soc/fsl/qe/qe.h>
>=20
>  static struct gen_pool *muram_pool;
> -static spinlock_t cpm_muram_lock;
> +static DEFINE_SPINLOCK(cpm_muram_lock);
>  static void __iomem *muram_vbase;
>  static phys_addr_t muram_pbase;
>=20
> @@ -54,7 +54,6 @@ int cpm_muram_init(void)
>  	if (muram_pbase)
>  		return 0;
>=20
> -	spin_lock_init(&cpm_muram_lock);
>  	np =3D of_find_compatible_node(NULL, NULL, "fsl,cpm-muram-data");
>  	if (!np) {
>  		/* try legacy bindings */

