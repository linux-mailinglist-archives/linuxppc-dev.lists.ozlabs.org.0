Return-Path: <linuxppc-dev+bounces-7130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96820A64CF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 12:40:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGY1W6hY5z2yn4;
	Mon, 17 Mar 2025 22:40:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742211615;
	cv=pass; b=FOBnvLvv22BFcETO6eNtqTZnbmZ35kHAX7e7R6JSVDFwUTjaAwmWUuj5p2iDGVqcYiahBIzTTh/MMh34qOF+4vNiKJNvV9N4cXBaWnBRcIOuwNJRUG6NsX4zvkxoiR84/d7teOnQSUmIm8aQMvmlBpemw7BFh9uXotYEKcOeTuWaeIu0tVayifynKLrGn0fPstoAeMm6g8HyTnozjS0Zu0ElMFB64A++wmczfkZiVVukhu52xCQXwx+6oiUhWeumzarBFuE73WSLSDetaOPYTbUWJgslP/P1rjZAcaWURR/6TKrc/rrXAze9+99f2IHXKNzOIn+SkWut+Z09JIQiqA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742211615; c=relaxed/relaxed;
	bh=RjefKmpwA1TdYiFQ2SyVcYb8VR+4vKRUsoIbPU9ZxTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VFqnIdFYTruigCQD13+OXKhYRwgzy1/NBYOb7CtsB4rkX+/LFYK71bPZ84HeFZU2paQlOLnUGNAaJ7Xn1emBYkb1LBMzrYLZK8+6tAkZTFQ9ZP5sJ8jyoK+tskegFsyZIajTZ7P1u/h16Q48zigLIo20BQ2mhC2fWIQ8vvczWUba6u6D0sOqN4Qe0J7yfis37NZZh2qgMZbvvia4oe9RzV+vMfRD71iuMOmvQzGEABv4WoKP6tbU9hVnq+bulYDMNkbCpV0Ojt+cQcjIy5vOQyVF8gH0uiqiqPXj/owojK3ektHEQZyIGS104wYl0A7L6wiZyNFVjMh7nVOXw/ZDhA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=L/PBsg9a; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=L/PBsg9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGY1V5V9Bz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 22:40:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9lo2tVBWeWz9s5KHIUuKWGq6Hh6OEyPICnI2QX1Unmhbr3If+xRL8O52hF3kwbydoV9gyYWimEmCEOLFflD45iIYcWIxJb3aC8Q1tZzECZUQ5/iscqzGMT/yarHcmBIw7AJ4lqJjZ1ecevhG8u/c3XTd6UCQhH9L4aYQrKWkrvZHDa/OibXHlhjqdp/1HZvcbJ611ehT97uScpe5wGjaGYZXpdllTg9qN9B++S2jJCxWI0DZkeCjkoSTwzH+8JOR/EAJVLorfgq0N9nhhANGykwqL2V1AWuotUftn0dBgOXWafWPntJSg9lnNmObe/ZAI2AIDgq465+ChPJnFxZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjefKmpwA1TdYiFQ2SyVcYb8VR+4vKRUsoIbPU9ZxTQ=;
 b=Aa5Dvy8GSauzT4vJ77tDKvQaQ+UoGamKB0CGAUggcAE2W4SN33oo8jK28USvTbNwDu2lV7U95YP32V6IEdThSTvQpL+aiEXHYkQUxlFpXvzW/64VwwY7JRVCrYoGel6w1qxWgevwr2xWc42OnFgnAVW5qYTTMkhbIYQIIyPT7jX23N3DtU2apbFCY6dn+i8C2sn7OBiELbW7t3PjYGxYQT4sKifxJc8D9+l8wXVWWrx51+Aq15Nrvl0PcSbynpet5pci6FzpQ5j755nuMXVU7burZimqMfyU5o9HVrfBeciWutWeuIedbOhEdtFm/nJBGgBekP2BaUeDOp3Rb8DEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjefKmpwA1TdYiFQ2SyVcYb8VR+4vKRUsoIbPU9ZxTQ=;
 b=L/PBsg9a1XtIw70vHPlkqR+6gtFFW4R2V8MyfuFGkuOt9qOch8rC5Oq/Qt5fQw1T5bL9xeYO0XvnEhDiEYyTs/ZWM07V8Rq6NqAGVvFfmP/6NIrsItMKBieyMMuEmE5pEm6O2dhHXHX5vizJgRNyJD9rUk3xNMnBxIkgdTY0b4HpF0ZkgISkBu0XHme3Y/uJ2VLcIqDTr9FQVqIk5a19NOm3MFCPE0acM3wWuFqQuR2f+6lm3RzN2THtK6zLB4fPODNsz1UUUg51ltlmbuSr9ldi/vrfdmR3GDvo5NPoEkwvrKpqDOFsgLYaqcgHqpQbWNVfVRjp63TYEtQz5gFnKA==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:39:49 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:39:49 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib driver
 to support NTMP
Thread-Topic: [PATCH v4 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Thread-Index:
 AQHbkkpJSjcnE6eIUE+0uP7QMRa23rNxR0QAgACVlrCAALozgIAABn+AgAR7qACAAAK24IAABl6AgAAYVDA=
Date: Mon, 17 Mar 2025 11:39:49 +0000
Message-ID:
 <PAXPR04MB8510C930C602101C4649791A88DF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-2-wei.fang@nxp.com>
 <20250313163526.pqwp2wsfvio7avs6@skbuf>
 <PAXPR04MB8510327277CFEAC750FE49F888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250314123715.fivq2cbczd4khxkk@skbuf>
 <PAXPR04MB851027E5F830F08F3395083888D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250317092808.jel2au3cgfwblaxk@skbuf>
 <PAXPR04MB85102185D0A4C30F0688AA5488DF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250317100037.7o7r7gch433s5lq4@skbuf>
In-Reply-To: <20250317100037.7o7r7gch433s5lq4@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DUZPR04MB9968:EE_
x-ms-office365-filtering-correlation-id: b3c2f807-40b0-41cd-cdfb-08dd65486cbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j7E3IK3y9m9ikhjrDW8piwCi4Hf3PuDtNAgHlcnplf11fWckbiTURc9mgWMX?=
 =?us-ascii?Q?XrDc4a3YbdzMYfb/50s/hXSswOYfR83RIT7Fzu/GfyrSFq02I5QP8UT/U+rG?=
 =?us-ascii?Q?Isw7IvNHXynM9+6HqXuD6dpzvVZJxQLq5SoGPGZ/RzAIRJt0skS4gT96qSOM?=
 =?us-ascii?Q?wvf1kAnC5r6emlua+W8oFX5uY0RZF+w0eYdcT/kBXH9l9diE3sHbidI8rTpW?=
 =?us-ascii?Q?++eD9m5cj0IrdbU9BpQowqnBE8QbzuK4/2MKDXpMTZi3T5b2b7Pvdkw5KKcN?=
 =?us-ascii?Q?Kb+hMG/Nhthr/tUwAX89qEMFTdmxabmYmNS6heFvZJ65qOQDJvIs23G56u/9?=
 =?us-ascii?Q?x1OAQdBFF+WROFur6kBWecpOwuYghnNvdMcPiywCTRG1l85iDEQE2LBTjI3V?=
 =?us-ascii?Q?NEcMfDaiPJakrJRR0vsdEOHcyeemWyy57crzcNK/P+cTrR/fCcJB3Rpx1Fvp?=
 =?us-ascii?Q?hNg0voJU8C332DOS0eBGE6Mghj/GM8CBZgRKmijLonMqMlKi8c6qOWTtZuhx?=
 =?us-ascii?Q?6o1uOXsRWCWGVZ0KE23qqDdIr+UgVdAxQtaFEV43QnezIUzjdGtJB8ni8DEy?=
 =?us-ascii?Q?yBvtoErxqwp9uwWdfsPulZ0QgUdRCb4KispCYhnm2djvaOAwU0Qth414mYpK?=
 =?us-ascii?Q?+P5HBxWM7pmrjyZcSRWDYJgCVxq8MbusQkQp3OelNyoiGdfevA+UE5HAK3Ec?=
 =?us-ascii?Q?svWKLWKDdxJEKP0x5TPb3LCgEN2M6yuCruCEx0J5mlcsyxN/fwtkDIa8AUWe?=
 =?us-ascii?Q?EMw5Os3nlK4dwbfZ/xRnSTixjxlnxDwlFy8BIyMYg1sPLBsonAsOpsK/HZE/?=
 =?us-ascii?Q?7LWKo5nffwePTy7dFPXO3W9w8+1XwgxAGLRzTqFkvgHiXJWcHcdHHKSRg6cb?=
 =?us-ascii?Q?qvLhgWo8RWxdKGaQ/9bvXlAoY76YaswUYCKigxtjUkZmbwJb1gYSnD2os2VR?=
 =?us-ascii?Q?JMQJQPXthPLoETYfp5zT0W0sPwBwZ9E+Btz8w+itI1voHspSqGHF3YAZnlpZ?=
 =?us-ascii?Q?sA0N9HVIKJDCJh9khKeHEGj1JdPczd5maZYkww3eiLdAFfsLK0STAjCbVZDA?=
 =?us-ascii?Q?kHE3kPtJJ5iugVUqoEN/dxPPaluFLwEXr5fHwl1DA7rkO+IZFaU/0TIYBOBp?=
 =?us-ascii?Q?Dr57utFLbfXxFed8CAn3NOsv/1orfUJ53mrheVF13slkoLBcd8rch/H27J95?=
 =?us-ascii?Q?Q68wpJcXX001Cj0JFmCaKVakMyD2/e04OHd2jbNjlei0sUiNonFHgo3gWR4k?=
 =?us-ascii?Q?+gQ3PYv6Yui2V10WfdX/3hKyO3OKZux8e6ub8jJ0df9EIZLC+hNug7OJCBth?=
 =?us-ascii?Q?EsrviaCcrLT97qoqkg061O8z3WC5txNMVtq6JWZRmQjfzPbvIUu9FIKFjlXU?=
 =?us-ascii?Q?3FE+Y4vrhxtscQrgEFN58rsytk0/oFgcaWcBFvAgi55PIwUUiyB2hlu4bue0?=
 =?us-ascii?Q?u5GBqJQkPBsvd087gmJ1gjHN12yDTHQA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6ya/iisYb2VquVNjzIWPsyjl5IWSRtG2p9S90msjgZuyQvwrekPszSVzqjW5?=
 =?us-ascii?Q?miUtlN1tlMCeXo0SYZAVXvH69OVMzBBq7E1tEVHYTA0Zsta/0UjM3dN5RNAZ?=
 =?us-ascii?Q?HTTI7bAZ6ZS5e8q+2BRdtf8yBRhmuVw6/sp9cAlKY3hfkKC+yhO+cPTjPBi6?=
 =?us-ascii?Q?IT/mDepWfzsdyRxZJM3AVI7Wk1hJQRdnn7T6i8UAqFm2KjwOHJ055e8LlZC7?=
 =?us-ascii?Q?UQvgMfjhkyKVnU2KXiokLwOGpLLz6L86QHr9XOEx6xhGzjnXs/LZi6T+27qu?=
 =?us-ascii?Q?siosUvPM9ounczdXadd9EkGoly0OJ+I3yf1DRRhmDm2LGj3DyNaTjH4jk8ex?=
 =?us-ascii?Q?uS6xGc1RmlfEe6CAlF7PQK5PMB18ky+OhiI+xT9BY4VxKZMT7bpZhFSSqVwS?=
 =?us-ascii?Q?Oiq2os56qXUion5+KswTcIqYBP1a2hM3kz+amvsmR3d57tpzO/Pc7LUedjOB?=
 =?us-ascii?Q?jLPxsxRAgW0A4AEaA2kQ+LBX4IthnbPU6nLQ+UKZTBUItn5jMr+DwQ/3R5yW?=
 =?us-ascii?Q?px6vr2xudpEbRY56GGDxwpGVIHq4lIxaiDzyDgkyl5oH35dHSy//WTA/hpR4?=
 =?us-ascii?Q?eXUUXoW0XSIuiMeq08ot+3wb1RyTGdQaMvTs6u/8nuJ062zV/BX312XkNvRS?=
 =?us-ascii?Q?ov+5ex4whOnoZj/gtq3WP2pLh3abMYmiDdrgyNLaNNq+Ur4/4CWLBjYQdzr9?=
 =?us-ascii?Q?K27u6JvsTH3xDBFUkjCrxaTnw4hndWtxz6eWiThmOc5FuJfvRbwzvPqZpaj+?=
 =?us-ascii?Q?tslJinQHEgb0dremhMLfEeFpFzNAyzEKBCO8RqyGTv9Kmv5QXio6S2ugibWj?=
 =?us-ascii?Q?xi1f0M2SyysVHWSLfvNWY+HtGnnqjX4Wxb9o85iuxU0mAlv3Z7bdz2ySEow7?=
 =?us-ascii?Q?fpNN2pblwhO3vTWtZRS24qWpxzz4M/ZXUNlywahN271/f1Epbmj4GkBSjfAf?=
 =?us-ascii?Q?35rSR4wT6AD7dtDW4oaXLcXxZPmd7jSxqXVILROtszQIbBr+DRDrnbs+GnBy?=
 =?us-ascii?Q?80+/63SCeXIfD+CEHVkHWiFiaTCAH3Hb87Vv9tvKWxocDs66oh5FnE5LSNGs?=
 =?us-ascii?Q?bjrX+gTeHW5fcqGU30+qOS29XQIk8Edql3XRnU6+9GMBZdiWI06t51LnXaH5?=
 =?us-ascii?Q?3yzoSQv+f563brlC3AvOSN1YDYO40YrI5jpV5J+2eUUrTVo/EpEjLmtqAa6I?=
 =?us-ascii?Q?S8vAP8jyebatnIu9YBrBpjnbrtdVDvtFSlVblVj2Zyw8WALO+4w8iC0qEIEE?=
 =?us-ascii?Q?LJXWwqzan4GyxW/IXgFBGw5Qry/iB9bbmGivGMo6vYwHQkDNJqfC+9wp8E1e?=
 =?us-ascii?Q?9Bt9ObEz3C34x5uNyARAMu/cZj5XFbcJOel2oJ+JviM3+P5SGo4f6gZBD2Fy?=
 =?us-ascii?Q?/1neLC0qBl1xnrNDntCUxwgeH1909xFp7QZVOkQxXJGKqrP8zf9AnnPgiZL7?=
 =?us-ascii?Q?+KfTuRtMXbT4/3aOJIDaQtARxEdtQYHeja6neGiAUM6cq12e73y6e3bJtyet?=
 =?us-ascii?Q?whc1inF3dFxp3XcL2tElZpCi7bXqSXKoi0RgN0snVg2IEhe/N5Cgz+vD+OYu?=
 =?us-ascii?Q?iyYmIH6cmML7D1xRy28=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c2f807-40b0-41cd-cdfb-08dd65486cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 11:39:49.2471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: foiQSPPodUQDgwE59PJvj9TvFWaXXEKKtcO6raA9n1Tn9hAl4FprZluEfVIaSMbzMzdY3JXgiWuB2gntFyE6DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Mon, Mar 17, 2025 at 11:55:26AM +0200, Wei Fang wrote:
> > Actually I did this is the original version, I mean in downstream kerne=
l 6.6
> > tree. I add a "ntmp_mfe" in ntmp.h like below
> >
> > struct ntmp_mfe {
> > 	u8 mac[ETH_ALEN];
> > 	u16 si_bitmap;
> > };
> >
> > And the conversion was done by the NTMP driver. But then I found that t=
his
> was
> > very troublesome. We get data from kernel "struct A,B,C", then the enet=
c
> driver
> > converts them to "struct D", and finally the ntmp driver converts it to=
 "struct
> E".
> > So I thought why don't we convert "struct A,B,C" to "struct E" from the
> beginning?
> > After all, these data structures are only used by enetc and netc switch=
 drivers,
> so
> > in kernel 6.12, I changed it to the current way.
>=20
> I understand. With pack_fields(), "struct E" (the packed representation
> of "struct D") doesn't explicitly exist, just an abstract type
> representing the u8 *buffer, and the struct packed_field_u8 array[]
> which is hidden inside the NTMP layer.

Yes, "struct E" will not exist, but we need to pack every member in
"struct D" to convert them to the hardware structure, so there are
still two conversions ("struct A,B,C" -> "struct "D" --> hardware
structure).


