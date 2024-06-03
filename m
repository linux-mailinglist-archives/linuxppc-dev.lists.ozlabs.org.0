Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA84D8D79FD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 03:57:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nokia-sbell.com header.i=@nokia-sbell.com header.a=rsa-sha256 header.s=selector2 header.b=EeEbp9iv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsxgD0HxZz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 11:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nokia-sbell.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nokia-sbell.com header.i=@nokia-sbell.com header.a=rsa-sha256 header.s=selector2 header.b=EeEbp9iv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nokia-sbell.com (client-ip=2a01:111:f403:2606::619; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=qianbin.zheng@nokia-sbell.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsxS53jqTz30Wf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 11:47:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIeIAqfnY+DQJmrZBkV9ZGhY1E8xFNbfRljZ1bK1mmmVFIJVk8srWkiO037v+dXqQ8KIGGv5RxYqVY8HZdIEzqXiGiUHWEeBNC7fNkTCYYNYdOtYqEnOWLWaes9WpLbNPky6fVDbO0tc9j1H3+M948Vmtlkk6gwQNDcJxXCpudBBWU0aj5/T/t/GAnVuwMl9qKAADx68kZofd1bHhEoOfT3sEZfW0WJwcB6JNHnXCXUKxGhLVnjspzx7+9jO3jyOWOGuv7wRUAuws4zBqWNybDIXiWmtHbuxzyXEnapB/57mYIY+UPg92Y48umyuHFHDVuNY3sJThsCU40eVBd9r5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f5l3jyuUgkJyW0jPm2QZBJLMIq7NSzIo2nuxrTDNq8=;
 b=eucjbDuQdHOjCEFbjlSUOPdkmbr7wNKUGwt+9pCvDARZxalZxQ0gwj5UINBKK4ifo1Oe6WjNbZ2xDIpPmECi2/vVR5yion/IeS7VVKi8rWoIwZHuy5O2tPgZx4xPM0AbZvxGTs+9Gw5xuvGNrAHYfitCQUvsaoWDHsV0np9pyXgFZDGr2VDrljWrJfBvRrNTm2aax9UqGkeACfUrEXZH8rR5e91++buKsnDeGRsVs8M+Lig5Qj62ckLXLP4JOV0c9Kt2+kB8RwDBBDKZltJCeNvH59sCrnglJu8fjFBIPT06CECVMQ14yVYeU3oaqzuteWTqjS/0ML8YsldyjPtzKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-sbell.com; dmarc=pass action=none
 header.from=nokia-sbell.com; dkim=pass header.d=nokia-sbell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-sbell.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f5l3jyuUgkJyW0jPm2QZBJLMIq7NSzIo2nuxrTDNq8=;
 b=EeEbp9ivsJTD8TKa1WTlkqB6vWPmeU8iLnoAT+tzvftgwteTkxgtP+KbwtCmGIXqfkF4Iy8mdCbXJACwijA9/f+IAD9RJ8aWBGpGUtimXkkxkKrLIgIufpF55DXSYI6xsYycATBOsr+L1WQZ6eQRiSt6DIr7sDs52rICTQKVcDtm9H6NoT5R91dovabQ1NkOEy4v92lLeijmUjvAMg+MhsdShADO2QEzptzMziyKlSgT7iOo8U54+G86+IroTVbtPs4KOW1dXQpsdysXqdyWZxZaji7dGM4RitIWupBcO2Mf6/CbrTmKKfWX3X4wM2Qbdou8GxtFhDZohlEW9ZfB5g==
Received: from HE1PR07MB4169.eurprd07.prod.outlook.com (2603:10a6:7:9d::25) by
 PA4PR07MB8390.eurprd07.prod.outlook.com (2603:10a6:102:2a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 01:46:52 +0000
Received: from HE1PR07MB4169.eurprd07.prod.outlook.com
 ([fe80::93cb:c23a:3cda:4fa1]) by HE1PR07MB4169.eurprd07.prod.outlook.com
 ([fe80::93cb:c23a:3cda:4fa1%4]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 01:46:50 +0000
From: "Qianbin Zheng (NSB)" <qianbin.zheng@nokia-sbell.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: fsl: Enable usb snoop on PPC64
Thread-Topic: [PATCH] usb: gadget: fsl: Enable usb snoop on PPC64
Thread-Index: AQHaszupw160VnAcEUi+I4pyUMNTnrGxERVQ
Date: Mon, 3 Jun 2024 01:46:50 +0000
Message-ID:  <HE1PR07MB4169B7A47CC7105A9FC3E993ACFF2@HE1PR07MB4169.eurprd07.prod.outlook.com>
References: <20240531091926.3324847-1-qianbin.zheng@nokia-sbell.com>
In-Reply-To: <20240531091926.3324847-1-qianbin.zheng@nokia-sbell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-sbell.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR07MB4169:EE_|PA4PR07MB8390:EE_
x-ms-office365-filtering-correlation-id: 7b78c9c9-b7f4-4b06-6035-08dc836f0984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?Fu1Zx73sQFZQdLJ1HsrC/1M+FqXhYsaWZOZvdPlRjDWKvNZkgDW0dxvNlaql?=
 =?us-ascii?Q?PApalWmz+niY7/kqfTwnpvuGTQgzd1LbVYQlmSl9K5X9OCPsUiuaxtL+ys9a?=
 =?us-ascii?Q?hjLunjrTEL+qYm2ANa3LtvpEQdz0PISqKug3pgmuTKqS/EYeE367r1Fq+01U?=
 =?us-ascii?Q?AKTMNiVT3/d4cqFyYQe+sUKg+kYWX1Ntnlb9HJWdjSwxXnhYPB4AIxhtJAr0?=
 =?us-ascii?Q?M3VCadfADsThDwXZ4aBqWd+JEBfJh9B11k1+K7P1FyQOd3gJO5pq4vhOCa5Z?=
 =?us-ascii?Q?/z14YFsUbNa2VnGgC3jrc3IU+hSiKZrdBuEx93sAYDoglWnpl4n3hHVmn0jm?=
 =?us-ascii?Q?UeHMC5fbUTKKNQcJxlDbQcWK/TLJpbXNV6PxC0RRiO6/VDHOD+91Vt1ea9te?=
 =?us-ascii?Q?nMHd3LTDjGJbptI2ppLPdgp3Zpb8Di5bhGlZcN5ACaXu1IGGtd6cCML+FFO7?=
 =?us-ascii?Q?v+foVP1k6rcZdc9RZlDTgXh5RI9/Temu8gePd0EINE+uF5TTl+rtHhVj5Jiz?=
 =?us-ascii?Q?z1Z9FlUAgm8rEgWOzjGxy5sqL63CGeq2reG/ux0zCfXkFPVLOctzwvqoYQey?=
 =?us-ascii?Q?uOc4H+GoLOfnAEY5EUVFkl/pYb9XFbN46MKj30zcl/KNdRKcSUjBFHIFMfkh?=
 =?us-ascii?Q?WdFxVRwdvNCBYn6trUs6YLxjXlE87UsrObZgUnh/SQIC54Uchvy5guIvem7T?=
 =?us-ascii?Q?Eph6LBwdJULNOukVGz/lc+W/N27o3jTu7NPxo+OLA58486l/ac9lYUdLKkIj?=
 =?us-ascii?Q?+GiwGUko7WQbJkBS5JU0FOQsxRWoOY5Qv40Q5AUdZ8FYEXYKtNl/jHD19GEU?=
 =?us-ascii?Q?vnNbbIZv6hipIg3lImtBYT/Ww/ZtsoIMlQACTNtXasbOkqPwmn9sxWiLOdNg?=
 =?us-ascii?Q?bR+gwJQUhhX1ddBHHIJAjeUdz0hFRvIUE+hrItlrkJKeDgUQDBe+ad5M8+IT?=
 =?us-ascii?Q?iQBqJ9rzjF4qJ1J8XFH8Ce4L8K8WVHfCVsaC0/6Zc+hvNvg5djztmVseyMZY?=
 =?us-ascii?Q?UvKrXuALvDlmORkxgHmLSRVDswmK+K48xHu7ZzVL9vT9+PswmOUgGmO+wK7L?=
 =?us-ascii?Q?qtpLhdH1TreFaiTbVxuzZfBFCVEfmiNmn+DWlfCGpKBdMPA+qcvZszZJM640?=
 =?us-ascii?Q?uiwj2/FZB2SNxGRkrSifAUR1rcUXJb9I0vM7fGb9yxfKc3Bpen5l+bi5J5xQ?=
 =?us-ascii?Q?34sygJsq0U7vIFiwxW5/20M8+/AhvzrlWUY35Z+N0UcjkaQVDThv8iy3WxIm?=
 =?us-ascii?Q?Z+PVfi7MlN7QPSxfeCPmD0uzxjXfFf0tVqwHMAYsCvyPvb2lh0g1i3vaLlBV?=
 =?us-ascii?Q?Hjg+T6JQkOkN0xYV5Q4JeyUFvBwRhiI8HciuE73DOKx5kQ=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR07MB4169.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?c5lMwK3fen+A2UX2JMH0loPTqUh2UgOysh6y/2yf/ZZqcTOQ1hvCXtFmHbDS?=
 =?us-ascii?Q?DTX9XxRTevTvaqjmsK0QthnLEb7yK5uT7zyynjfCIB5WW5WAktBmMP6B+Xy0?=
 =?us-ascii?Q?rvSBoCHWwMOGahMduU5BgMy1hGIE1DyZuKEGknr6ZIZ9VLr5esiowVeqRHwY?=
 =?us-ascii?Q?ayEVRMWL3ODpgxTZRRQ/dELflemXL4jmW4zY4RYEPOcpFXj2hXDpCkvu8p7c?=
 =?us-ascii?Q?JlNPlgpo15n0lW5SCk77BpenPv2iDpsqmNwpQfMm/3U/sOaaFJPVHLUTpMXp?=
 =?us-ascii?Q?CQCKSnRR/5/giN31FetVkHPNuH661OgqitQPykpW7uuQsFQCpO5fuvcP6+Lk?=
 =?us-ascii?Q?b+ictMtU3Xt8/nDppUBdHD7hj4YTVaXRw/FmJ2QTivFtgUBjePsemU8nbqSs?=
 =?us-ascii?Q?lGgd7MMaFesOjE2nu6WO8mrwXn12N9dlSoHmGDBtMQnqvGG0sLs0UQUGgU1i?=
 =?us-ascii?Q?cbW5LWDCn17jf9A9w1B4wNARkqHDeU4bmHeZuLlRAF2CACX8NwW3tSVuKGqu?=
 =?us-ascii?Q?irrLyd6xceXb1POjZlQsQHJZthKQ0RhWdH1smtTcthexJic2dMxx8a057Gj7?=
 =?us-ascii?Q?/gDU9hXugEzvtkUAk+UcQ4EybnPhh9ZeTqa8D6lSYKUOXnsw0k5OWWdS4ocM?=
 =?us-ascii?Q?pHlvJClftFvkahpvbib4TRjp+bLZs/gpMcgdiKFJ5fDyWbuYovrQthLaQf2R?=
 =?us-ascii?Q?Ca7wy/XBXUpiZuBFhKQqIn6Lra3i3Hnh2h13JnyUjoryTdQ9bMjhxUC5IdSd?=
 =?us-ascii?Q?Lse/sFDJUFpnjnOD6Zmnju9eUSe8VsbeTeIhpOBIiIDAqdcqGkMZBSBCwRde?=
 =?us-ascii?Q?KXpnrs5BYQfddosZTVNpj1fj1jI6RvzZkhpNekVHO7ZALtbsh+2SBloem1At?=
 =?us-ascii?Q?SW466bWhwXpYRBf5Rdfv9UlZnx1DYS5o2UD70c5CE0dfyw69+kZyMN70BAO3?=
 =?us-ascii?Q?qZ+hvNYI0PdjX06hRrLAt3jeiE6G4pcMYoic1mtlwjsLuXq8rUSJu7cdvzHv?=
 =?us-ascii?Q?mDRGQ311o64MjpfmVTi2HHcD4k0YhzlOpjZW+bOpXY2POy5a+E2ZUbKVwRJ1?=
 =?us-ascii?Q?JvrbEI0ZQCulq9mF+egq6F7jnwhbx3ZWzTI1XN87O4UoXtB7OiFqgA73nUlb?=
 =?us-ascii?Q?QxmEalHwbZfBEtJyGGi4u5HhvoxmG1b7xPcEdQh92Ruy2mnqU3y9Pe9wU9G/?=
 =?us-ascii?Q?TPDkoHg5/yvJZ9NAY87cusDDOeeaOLUR+SiZWv1s6Hyqg6oynjwgTnleqzR0?=
 =?us-ascii?Q?ZF2okyQciGpTrDYFUShsJRVaSdedAqiV5lNpVy7lwMRpCgV7T5cu3oeYWfIT?=
 =?us-ascii?Q?Q5N1cJEVMD7ZU5YzEgfZ1PEZUZ7izYK3fb3cgBujAgmAnF9r6NL5GLcZkIcn?=
 =?us-ascii?Q?D61H6wdmnJ9fxwlZYvqeDfvC/wjWprZCsnWUFLyDCZK82F8+7Eycgjq5Fq0z?=
 =?us-ascii?Q?K9BGnSVdsrnLaiHKQrPqDRI/TVwgH3f05nM5wpCGC2mEFgAIcvaG4IiSZdfb?=
 =?us-ascii?Q?gBpyM5IVlBPBn9hJ19H5p0IzPavtnG9VOsx2NBSocbwbrRI9wu9PAwrmXvGp?=
 =?us-ascii?Q?+9hF+gqsAi3Y87wPaUeahsLEmkwCo8Waezj+UKRSPKPrpspWKl1El2UoWyOh?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia-sbell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR07MB4169.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b78c9c9-b7f4-4b06-6035-08dc836f0984
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 01:46:50.3665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vXKvjukFJarVPRHJMY6x7wf3N82j4rR2djMptYIyWtzzyDTaXDexUQ0b0Yegc68GaPLuzOtGN7+ZgqR9aqDbPgAXCrPibtM3drO8UwrD2xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8390
X-Mailman-Approved-At: Mon, 03 Jun 2024 11:56:37 +1000
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Turn on usb snooping on PPC64.

Signed-off-by: Qianbin Zheng <qianbin.zheng@nokia-sbell.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc=
/fsl_udc_core.c
index 3432ebfae978..a0f3498086d5 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -328,7 +328,7 @@ static int dr_controller_setup(struct fsl_udc *udc)
 		__raw_writel(ctrl, &usb_sys_regs->control);
 	}
=20
-#if defined(CONFIG_PPC32) && !defined(CONFIG_NOT_COHERENT_CACHE)
+#if (defined(CONFIG_PPC32) || (defined(CONFIG_PPC64))) && !defined(CONFIG_=
NOT_COHERENT_CACHE)
 	/* Turn on cache snooping hardware, since some PowerPC platforms
 	 * wholly rely on hardware to deal with cache coherent. */
=20
--=20
2.31.1

