Return-Path: <linuxppc-dev+bounces-6583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256FA4A478
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 21:59:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4LDq32SLz3bqy;
	Sat,  1 Mar 2025 07:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:d408::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740755252;
	cv=pass; b=Ve0cnh8G/aF7IyRolimoZJpwfXxuhymWRbbcJnfGb4ziUVjdR0t0hOAXZNU7IogpM/xMC/WxlbzVW7emONccireRtOlHGwo7/x4Mz04pgVM+eZXXRv2tz/8O4lvVoqxAsaAnZ47Q8E47t8k7lr+5HWEXnN3CjzMJSiqiKbS18WeH4YoBd0VM2mqXoRrDB0bGJN93ajFD3SNZ7ja3h28ABK9G+u6EA/VaB/pH5RbcXKRcSBiwFP+8NhmINSAJ0JcW7xaShUh3VUgHHb+aUcjph2KqlHloJguvuY0R69QcqDXoTU8jdDEmxBKCElH5swu6hxgbLNp5kDBf4T/eoizQ5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740755252; c=relaxed/relaxed;
	bh=vO8RLkdun0eu2LcrZP+WAPRoXCAQErF/+P2JF4H7XFU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TeTRwtYffQAm/EbE58n1IXlqlriznQXLCiTZein82dfhF8Jy8Ze3REXU+fWdhOPUBeKElwNHj/P01/XktU2V2Ji99KH12BfBsqLVAGTGyHKX+Yy0O6klHYCPt7WVpS24d4+gG2NLVO57nIqkBFva6i3vXrxeN8qyx2bjOnzoW8KW3BiTEMP8GxLkralF4y1HwIHbUwEJ6jp1RiOVxArIDIkvjJtALIP9E2J2GCSMQjmlf4ExUX1885pbg7b34y2yHPHSc5WblvpL1oS7sji/0PGBuN2STa30A1tSjkayqDti5gvuygZnG7mwgauVfQBIcdiMVI3xQN0/U/X/jT4AiA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=live.com; dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256 header.s=selector1 header.b=GRmiFAA2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:d408::; helo=ma0pr01cu009.outbound.protection.outlook.com; envelope-from=gargaditya08@live.com; receiver=lists.ozlabs.org) smtp.mailfrom=live.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256 header.s=selector1 header.b=GRmiFAA2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=live.com (client-ip=2a01:111:f403:d408::; helo=ma0pr01cu009.outbound.protection.outlook.com; envelope-from=gargaditya08@live.com; receiver=lists.ozlabs.org)
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn190100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:d408::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4BQV4vsfz3brN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 02:07:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFMZcSzek8aJBxRkEpSskIyag8j9rfAA68KAECpvymBlkmzEpF1HIUSIwLf9XYZxF66/a9+yJW27N0A49vvCLUrkKxqGxZog+wTKj7aJCCi31MI9+6QtAzGOh6pZ9I8zHAKHFgtWU3cZp7wQj3z8drwRoWJMVDk6yPBA7yWSlXt9fFIG/illli3niMIGIxpP/P4J9i2s6jlpazOV1eNhGxnxPLOCfss3SmBy8o+gYmgVZxITBIAwMXemPY6p9J9wBHWbOeHxguuC3XhRGWBCwhIlhJWzGyI2eJarQs4Sa6uIKR2HA209OwSTRXZkT5hc8pY5v0+hhAinUYaGLLikAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vO8RLkdun0eu2LcrZP+WAPRoXCAQErF/+P2JF4H7XFU=;
 b=RRe6JLJkVmiSuVQyp1PD8xTiri9PQnJTYxa1iT+gx7n1xCDxFOlI/TNpd1IHG/t12WnteVf/F1+LQMps/XAU/wxZFW8q/HZvy3qEZgqpIyYBGd+1AfvGZ1JI8rEF8NFMDCxAptzLXOr1thVz2wo6UNIUf5lDLu38h4uZMwcD942WKXKH/1Uv4OgFveou1DZVqR2vpa2Acvq/QbinVN/m0v4LfPNMaFxNhu0ZiGeHh02orevfTEDwZDkMIZr4kDfbN0HZw0y/Vs7HtVobSzI6uOkvDIbBVkPLBgGe3tJ0VqJGyxT/4jVT4iWIgdLMpa6BYJbJjSvMacromG/1RURpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vO8RLkdun0eu2LcrZP+WAPRoXCAQErF/+P2JF4H7XFU=;
 b=GRmiFAA2bJG1tbwb/5d2kmibPJFM195fgz/Vq6P3GHZXnc0G5ywEuXGMOh9B/TtcRVeUJeh+vqbVet4105uvMW3z4Be0d0OTW0HMUTDjy7LO7WeZac2nX9ppeQ7y80R4S6Ntv60tWcXHupnEStWrqeF6ael7f9illtOvLcOK8ScP6TUFpK0Ptxzn4CjOQPeFwqlt00HBktIWAOkQuDII6MXymv+PVJpJ8cBRsYGuDXvuR03+Gq3xJBuLHivo2enR59o9GwTdBCdNxnF2GDcLA79KQON+gif0Y9IcvFX76i6o1UohkbNNsKYQi/nvxYXnojiq1LH8q9MsLPW7AxpBNQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB6153.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:76::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 15:07:03 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 15:07:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "castet.matthieu@free.fr" <castet.matthieu@free.fr>, "stf_xl@wp.pl"
	<stf_xl@wp.pl>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"b-liu@ti.com" <b-liu@ti.com>, "johan@kernel.org" <johan@kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "i@zenithal.me" <i@zenithal.me>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] usb: replace strcpy() with strscpy()
Thread-Topic: [PATCH] usb: replace strcpy() with strscpy()
Thread-Index: AQHbifJs1uyH9jYjVk6FIi4JiLsd3A==
Date: Fri, 28 Feb 2025 15:07:03 +0000
Message-ID: <DEF7EF73-12C4-4F30-BC14-DD829F0C6884@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB6153:EE_
x-ms-office365-filtering-correlation-id: 2d9a01dd-062f-4e2c-c460-08dd58098ef5
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|7092599003|19110799003|461199028|8060799006|15080799006|10035399004|102099032|4302099013|3412199025|440099028|41001999003|1602099012;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8+zY0U6PvzkxuWDFHyUxV6Bhug7TAccwP11H/fpMq/VybUTAGqwxqT5w+AXZ?=
 =?us-ascii?Q?jDocq8Po9tr4MHCTLpgQE076hFfkhIQvU5nqdT3oibC45Z/Vvg623hTRTEeu?=
 =?us-ascii?Q?QJlPWL/FZVLA643KoaHKeZ7X9C1W/YpmcbOrVRtcPU0mldHMDfwlDtL8dUIb?=
 =?us-ascii?Q?gtvdF8t9nMuFCbp5TgZU/MXI+QyoqaY7CGIE//Q8tzO94wfCG7cJXOAsqDcq?=
 =?us-ascii?Q?fdG8m35GDMze8mmGZr3W08HRrPo438zrepByEd9dW8UZ0BOzvLQJBS7KLQsH?=
 =?us-ascii?Q?D4fEzC3U7F2dCHEHtp4gOPMJblpsbXoOfnJy+8/ztEo2uafcXBpi2AMhyM2j?=
 =?us-ascii?Q?fzeW8jlpbAgEa9NDkr/WnQen2s7wkH5flHlFg2Av5PEyjexSL/8UF3ZRLovR?=
 =?us-ascii?Q?8ShkHcS95iGS3kw1ypL+/A10i6K4fql/wdl9KriK4XRvdH5DVJf8B1g2WnjX?=
 =?us-ascii?Q?E39mICYuj9jiiidsMhaj2SjjrJtwtQJkW2esFFZ0Dx0KI5SoaUEKIgy70EEK?=
 =?us-ascii?Q?HjCKSvEx1ugi204pZlP/uRmhLu2Wjv77QDCOYsUOgxU/ASz+sh/3Lifltcyh?=
 =?us-ascii?Q?9Z2rLrNC7wnCxlbL4zR5W+uaMQ2NzmhSHnsUdlaX29v8s7jWK+psh9EZJTVk?=
 =?us-ascii?Q?CWIZ8ULASkBuJNHxpNQbFRbIMcRt+yWqwdMAlE1P6sDaMcPumskPah/BlN5y?=
 =?us-ascii?Q?dodGHnLLw6KlcsGbi8+UkK7aQXh0r+k/IqricTDUO3n/HKE5KWtH+8czBlR1?=
 =?us-ascii?Q?hQLXMu7N+82Zfk73kMux3VwG2axYjb58UnZBSscXGUXpKJRT1A7T8bnbfuOr?=
 =?us-ascii?Q?61xFad+bfarYB5frrOsl/9FG6D9WEwekKm6Fmmr3+0olK6urw8to1fzoA+f4?=
 =?us-ascii?Q?BqXMTIUKykjH0472WXtjyMYXz2YEseijlplfwBNXJP1keuuhCVGC0XZpdU+u?=
 =?us-ascii?Q?I3VxAX6zfZTiA+p8o2SYacebwl+ugiTTKKMnvF/2g9/Maas1XUlZvT3EYcdR?=
 =?us-ascii?Q?tKR+L+P0YcSbk/Ap5fteK19v/PHN9GI34Qcx7XvEWlbrO8da68aeDHzCK0Cj?=
 =?us-ascii?Q?pzyz/S/7oQphjyjhg3ToB72DC624Yt5c33CyNK0KMhA5qozZNlKezrZp8Wnc?=
 =?us-ascii?Q?ewL0haTLhwk//TbtESBA6xaD6kNCokM3hVMBFSE7/4j9ytnWLUDbElb5pg3L?=
 =?us-ascii?Q?DyQ/r///F1XbE7bHJjbb6KeXf5mgru2+zS9chw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EhqK9gI7v8VrKbc5lhagEsMklnAupFwmDuWuGlZfTczObznSWI0jT7o3+Gsw?=
 =?us-ascii?Q?+wp2J4Wg9EHFvLHvQQ8jJGZ6/wvbBvbDN91LW801uwvfJJQRMKGfuwofllPA?=
 =?us-ascii?Q?aK5elFlAUtcGwDb8gYcUTJyH6LBeAfIj7SOWuEMi+nfLDj/xDa2KuCfEbLPf?=
 =?us-ascii?Q?BG7zfrLXivWgDsqbpP87fxXVnIQBVzxm3QfXq2Wn9NLEnNA8fanPk88OnI8r?=
 =?us-ascii?Q?ry1U8vYeQBCpav83D7HG94trhPe/+mlzaQjnDDmZYtI3WzoL8rVEOeyjX+BC?=
 =?us-ascii?Q?COMeUPPlw58bMVQF8evKaeOhmLOTSluj2CECIQKqVBaplWOxDPPdF65TYlWG?=
 =?us-ascii?Q?ekaXnf3UsVEvRzxsrPX58MdlU4o6Pcrg2XIoKks23SllhImL96OwZg/znHI/?=
 =?us-ascii?Q?no2zc0Fambra8Lb5Dvo0yvvrOUUrhmJPajTgm3cxTza6gwph2vJQHtmDrY86?=
 =?us-ascii?Q?pV5TTcuhck6385YeetthT6vCvUbZ/ci7HfUI4yDu+cQJTUAl14LO48vP2cZ2?=
 =?us-ascii?Q?deKj3lmvcJWau0vnog/s8EVgv/ASeBoKovUrX/o6MrAbrv3YJnwyNs6KUspJ?=
 =?us-ascii?Q?c2/sX5Bp1bqX8OxYQRCyF4E5ZLonxuWrV9MMxcifcqmwty2tATCPgsmTusRd?=
 =?us-ascii?Q?VtzrFAD3arfGUhG8UcB8m3824XoR47g9QbRKUi1aCNLYuaQf1xugmnGn95ov?=
 =?us-ascii?Q?bjuQ9Aaa1/ikgFjdygcqWgLOBZE1pj8B8UyjnxlvG3xKyBFCKHbGY/KkOIaL?=
 =?us-ascii?Q?Dn9hpU+5HkABCwp7RnqKpemNyIGdECCo9J5KOKqfshT/8PhPWbir94bCURzK?=
 =?us-ascii?Q?zl5CTa+HLe+DmSMqCECr4rInQRo9cyQ4QcRiluf3xFghzxXglFhq1ciS84mD?=
 =?us-ascii?Q?V2RGIK9+oIr2JP9Bm3Pq920FEmmtlDULB0FPuVSP2eCqpVBG8f1qU9qferwO?=
 =?us-ascii?Q?xLnyH317yXm5L4wwGrkGf6wjp6F4d5snThuKXT2ISlaxexZvL4EnIGRP0nt2?=
 =?us-ascii?Q?ium7+jx27k9QPnJPhKteJy1sKLEcPCP05H/zqdaGsAvwH6qUrUY8u6AaslcO?=
 =?us-ascii?Q?4N6MBwWkxBvDOTSilT2IZB8rztAfuOxW15EMZLQnvBx48djezASoujsI4kdL?=
 =?us-ascii?Q?4jvxloZO3hPdxxL5J1od9703myrpRJcepgkLNK7HaKEt/KQtUzC3fl77nFGe?=
 =?us-ascii?Q?+gw3SZ9hBzgNA95RYmDEZDOyg8BnDh2gcSoLZfmqx567oHQpqi99lBrn12BH?=
 =?us-ascii?Q?TlAmjXSkAYUOm6AnrElZ7VYBtMc2AdzLrb8AtZbJJCTZHXWjbJPonftu43Ke?=
 =?us-ascii?Q?3gUwKNdsBQXe1yO0wiD4sIWv?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <09541ADC0F9B5C41B643ADE5EBE726B0@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9a01dd-062f-4e2c-c460-08dd58098ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 15:07:03.2287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6153
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Aditya Garg <gargaditya08@live.com>

The strcpy() function has been deprecated and replaced with strscpy().
This patch shall replace it in the whole USB tree.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/usb/atm/ueagle-atm.c           |  2 +-
 drivers/usb/gadget/configfs.c          |  2 +-
 drivers/usb/gadget/function/f_midi2.c  |  6 +++---
 drivers/usb/gadget/function/u_serial.c |  2 +-
 drivers/usb/gadget/udc/fsl_qe_udc.c    |  2 +-
 drivers/usb/gadget/udc/fsl_udc_core.c  |  2 +-
 drivers/usb/gadget/udc/snps_udc_core.c |  2 +-
 drivers/usb/musb/musb_core.c           |  2 +-
 drivers/usb/serial/ti_usb_3410_5052.c  | 16 ++++++++--------
 drivers/usb/typec/tcpm/tcpm.c          |  6 +++---
 drivers/usb/usbip/vhci_sysfs.c         |  2 +-
 11 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index cd0f7b4bd..04f114d0f 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -1571,7 +1571,7 @@ static void cmvs_file_name(struct uea_softc *sc, char=
 *const cmv_name, int ver)
 	} else
 		file =3D cmv_file[sc->modem_index];
=20
-	strcpy(cmv_name, FW_DIR);
+	strscpy(cmv_name, FW_DIR);
 	strlcat(cmv_name, file, UEA_FW_NAME_MAX);
 	if (ver =3D=3D 2)
 		strlcat(cmv_name, ".v2", UEA_FW_NAME_MAX);
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index fba2a56da..0c80a4011 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -129,7 +129,7 @@ static int usb_string_copy(const char *s, char **s_copy=
)
 		if (!str)
 			return -ENOMEM;
 	}
-	strcpy(str, s);
+	strscpy(str, s);
 	if (str[ret - 1] =3D=3D '\n')
 		str[ret - 1] =3D '\0';
 	*s_copy =3D str;
diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/fun=
ction/f_midi2.c
index 12e866fb3..72d034e78 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -1542,9 +1542,9 @@ static int f_midi2_create_card(struct f_midi2 *midi2)
 		return err;
 	midi2->card =3D card;
=20
-	strcpy(card->driver, "f_midi2");
-	strcpy(card->shortname, "MIDI 2.0 Gadget");
-	strcpy(card->longname, "MIDI 2.0 Gadget");
+	strscpy(card->driver, "f_midi2");
+	strscpy(card->shortname, "MIDI 2.0 Gadget");
+	strscpy(card->longname, "MIDI 2.0 Gadget");
=20
 	id =3D 0;
 	for (i =3D 0; i < midi2->num_eps; i++) {
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/fu=
nction/u_serial.c
index 36fff45e8..053b1f2a0 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1054,7 +1054,7 @@ static int gs_console_init(struct gs_port *port)
 	if (!cons)
 		return -ENOMEM;
=20
-	strcpy(cons->console.name, "ttyGS");
+	strscpy(cons->console.name, "ttyGS");
 	cons->console.write =3D gs_console_write;
 	cons->console.device =3D gs_console_device;
 	cons->console.flags =3D CON_PRINTBUFFER;
diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/f=
sl_qe_udc.c
index aacfde063..b12d2441c 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -2410,7 +2410,7 @@ static int qe_ep_config(struct qe_udc *udc, unsigned =
char pipe_num)
 	struct qe_ep *ep =3D &udc->eps[pipe_num];
=20
 	ep->udc =3D udc;
-	strcpy(ep->name, ep_name[pipe_num]);
+	strscpy(ep->name, ep_name[pipe_num]);
 	ep->ep.name =3D ep_name[pipe_num];
=20
 	if (pipe_num =3D=3D 0) {
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc=
/fsl_udc_core.c
index 4dea8bc30..eb64aa96c 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2321,7 +2321,7 @@ static int struct_ep_setup(struct fsl_udc *udc, unsig=
ned char index,
 	struct fsl_ep *ep =3D &udc->eps[index];
=20
 	ep->udc =3D udc;
-	strcpy(ep->name, name);
+	strscpy(ep->name, name);
 	ep->ep.name =3D ep->name;
=20
 	ep->ep.ops =3D &fsl_ep_ops;
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/ud=
c/snps_udc_core.c
index 1f8a99d2a..ad12b5c16 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -3151,7 +3151,7 @@ int udc_probe(struct udc *dev)
 			 tmp, dev->phys_addr, dev->chiprev,
 			 (dev->chiprev =3D=3D UDC_HSA0_REV) ?
 			 "A0" : "B1");
-		strcpy(tmp, UDC_DRIVER_VERSION_STRING);
+		strscpy(tmp, UDC_DRIVER_VERSION_STRING);
 		if (dev->chiprev =3D=3D UDC_HSA0_REV) {
 			dev_err(dev->dev, "chip revision is A0; too old\n");
 			retval =3D -ENODEV;
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 7f349f5e7..b3a943eca 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -1600,7 +1600,7 @@ static int musb_core_init(u16 musb_type, struct musb =
*musb)
 	/* log core options (read using indexed model) */
 	reg =3D musb_read_configdata(mbase);
=20
-	strcpy(aInfo, (reg & MUSB_CONFIGDATA_UTMIDW) ? "UTMI-16" : "UTMI-8");
+	strscpy(aInfo, (reg & MUSB_CONFIGDATA_UTMIDW) ? "UTMI-16" : "UTMI-8");
 	if (reg & MUSB_CONFIGDATA_DYNFIFO) {
 		strcat(aInfo, ", dyn FIFOs");
 		musb->dyn_fifo =3D true;
diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_=
usb_3410_5052.c
index a0c244bc7..50d76205b 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -1605,29 +1605,29 @@ static int ti_download_firmware(struct ti_device *t=
dev)
 		if (le16_to_cpu(dev->descriptor.idVendor) =3D=3D MTS_VENDOR_ID) {
 			switch (le16_to_cpu(dev->descriptor.idProduct)) {
 			case MTS_CDMA_PRODUCT_ID:
-				strcpy(buf, "mts_cdma.fw");
+				strscpy(buf, "mts_cdma.fw");
 				break;
 			case MTS_GSM_PRODUCT_ID:
-				strcpy(buf, "mts_gsm.fw");
+				strscpy(buf, "mts_gsm.fw");
 				break;
 			case MTS_EDGE_PRODUCT_ID:
-				strcpy(buf, "mts_edge.fw");
+				strscpy(buf, "mts_edge.fw");
 				break;
 			case MTS_MT9234MU_PRODUCT_ID:
-				strcpy(buf, "mts_mt9234mu.fw");
+				strscpy(buf, "mts_mt9234mu.fw");
 				break;
 			case MTS_MT9234ZBA_PRODUCT_ID:
-				strcpy(buf, "mts_mt9234zba.fw");
+				strscpy(buf, "mts_mt9234zba.fw");
 				break;
 			case MTS_MT9234ZBAOLD_PRODUCT_ID:
-				strcpy(buf, "mts_mt9234zba.fw");
+				strscpy(buf, "mts_mt9234zba.fw");
 				break;			}
 		}
 		if (buf[0] =3D=3D '\0') {
 			if (tdev->td_is_3410)
-				strcpy(buf, "ti_3410.fw");
+				strscpy(buf, "ti_3410.fw");
 			else
-				strcpy(buf, "ti_5052.fw");
+				strscpy(buf, "ti_5052.fw");
 		}
 		status =3D request_firmware(&fw_p, buf, &dev->dev);
 	}
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6bf1a22c7..461240086 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -710,7 +710,7 @@ static void _tcpm_log(struct tcpm_port *port, const cha=
r *fmt, va_list args)
=20
 	if (tcpm_log_full(port)) {
 		port->logbuffer_head =3D max(port->logbuffer_head - 1, 0);
-		strcpy(tmpbuffer, "overflow");
+		strscpy(tmpbuffer, "overflow");
 	}
=20
 	if (port->logbuffer_head < 0 ||
@@ -813,10 +813,10 @@ static void tcpm_log_source_caps(struct tcpm_port *po=
rt)
 					  pdo_pps_apdo_max_voltage(pdo),
 					  pdo_pps_apdo_max_current(pdo));
 			else
-				strcpy(msg, "undefined APDO");
+				strscpy(msg, "undefined APDO");
 			break;
 		default:
-			strcpy(msg, "undefined");
+			strscpy(msg, "undefined");
 			break;
 		}
 		tcpm_log(port, " PDO %d: type %d, %s",
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.=
c
index d5865460e..4d6be26db 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -463,7 +463,7 @@ static void set_status_attr(int id)
=20
 	status =3D status_attrs + id;
 	if (id =3D=3D 0)
-		strcpy(status->name, "status");
+		strscpy(status->name, "status");
 	else
 		snprintf(status->name, MAX_STATUS_NAME+1, "status.%d", id);
 	status->attr.attr.name =3D status->name;
--=20
2.43.0


