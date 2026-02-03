Return-Path: <linuxppc-dev+bounces-16533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KBuBPBngWl5GAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E689D404A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 04:13:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4pTX6Xgtz3c9b;
	Tue, 03 Feb 2026 14:13:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770088400;
	cv=pass; b=HK0n7D1QcJ3NFEjg2zz/tgc1vNy5AojJ4jAKkGzeikG7cZTsc/HAUEJbfW2c8YbZcJjtIJaKX+Ge8iSdn0Yf2DqXXXpc5nItwbHOtVUs/xBWnBqK0khfb2hmDCrXPnrEHlXRaguHmnlRgiLB7+yy5AtZtoMRmE/VxcsX6hFcg/Q4ghCNYFDVG89Lzw1uuo4cUJ3wAxJVJKaS/bH66cFmWXf0IdvPYJSYBTbEAV8lY/1bLJQVDB10DD0nNYeFt3mqCzCziALgVigMNozG5Kg2KgpgRfZ31D2G0u+VdbDLsJ1XEQnZ/U3QJfEME6Eu+70ID89npVco8hRW4NeFzCuv8g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770088400; c=relaxed/relaxed;
	bh=nYBCgdVnJ9uTFWH49fM4PwhUjwp3X164WXPES8CBV40=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jcQCtL2zt2Xi1ZWXUunxWMtI1MzxOKN0sXTnRK21OUIddJvd48+7NjyqdhkJNZCgChWyPzwFRPX9tOafFXPgFwHYBRI7oyberp+MP4f/8XZAr7SrzDo8rFrrro62GExDSd0zUuZSBBmG1ge5MAVyJPpO9+3NxUMrhLxObGvYNYZEDpoT8MIb3wVAy23vgZpps1ygcQl8jcGI7uhf898tncF+WAPDNVYSwKM3P3epE1vHKc60ISOk1VyFEawu+2k8ms7kLveKY/BV9ggKRmssrKf0Vh2fEQtQXuh2y82xYUE1YzHXRnoScxjbDKwE1O4GRQZ+zNUrgQJVWyEXumzRTQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ERMeU9iI; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ERMeU9iI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4pTX1mWgz3c5f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 14:13:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7El24h8z+L2kvklYgU/Fjedi6HuF49zWfXQ1IJhwRXHiKZ3Lf0XLcBqO7XyEZ/DI9NOluqsenruSR8YY3X/W8IPJl9UKEVsQrTtbOpSCu/DEmTEHo38MbGMC02LR5nQb87jvWuZ7zRdkuoy9Vb5E8aiz4QDcrPuSfWrjTt5XNwbwwVWQRUXlmuMOxGd6/K0vHsyJBtdpjkwE2Ete6JVim4rd8+uAt7jTiJZcakUwkUm2gPZZC0DZsbL/s/07t691AKDCo9ovllfRcxvklJAWODbneuaPkimz4/NDqsAZzrG7PgYeYv7wq2aJHmuMz0aePm637IHpCBH65uIKvHNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYBCgdVnJ9uTFWH49fM4PwhUjwp3X164WXPES8CBV40=;
 b=QVF9fP4xnN1tZb9AkFNHpmIfV8nIF/0aPVQ9DnlO11vx/IyxW5fE6oUPeCBGuLaQm7c55hQbnQYepyUWJibJ50lO5jjgkKIhjKlf2tT+IzY+0oWwGzJLAP97yyfV4qcWUFj4WiRDczMH9fGLZi6ppgH562sbXlDzj4ObL6ePlMs8kAI7aQ6ttQsrz39c2nF+nAsyBvZT/TMPJps5wT2wq5sF93FAfbUgFfcTA2HftdO4Kw5M2WN76HGG6Mq1WDl4kpRUBcnNjZqyy9kEQHoaZHcaqyUeX6OGiXv3EJEufKdwY/uU4ErME0vKi5fPl47vsfqZ9hjGA6ZDHr3+FUr+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYBCgdVnJ9uTFWH49fM4PwhUjwp3X164WXPES8CBV40=;
 b=ERMeU9iIoYFux5l5kk7IcFYzaYAU4/eK9EOw2R912Nd3rPCgHG2p1DYirN/9k+EXGySNuNGwqI+NJkwOBocjQTg/SXdcnd/qaVPjtgu3kD4Vcl5S4GCKwNXbtvNQlJJ5JLbWkl6tKocE652SKd/jmilS/pw1ZFmaldm7TFcXoGqpfrO+xiZuNHIgkKub03tolRJ0o2z+iwRGcIZskYCIj/Z8hxJOP22BZtMUnLCcT8XezzHBF5+GjVbucllZRmYpfqkdzcVY1R/oPczfSpYJwNkbjV5wd0UMAHDsBOxEjLlUaJCGvTnN7mamChtOh8mGRHmhrEgK2Q10mbNkumHr1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:13:07 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Tue, 3 Feb 2026
 03:13:07 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/4] ASoC: fsl_asrc_dma: allocate memory from dma device
Date: Tue,  3 Feb 2026 11:13:45 +0800
Message-Id: <20260203031345.3850533-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|GV2PR04MB12271:EE_
X-MS-Office365-Filtering-Correlation-Id: c7421a48-e716-488c-59ac-08de62d226f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4DpkwxxT8Yp1HzXOxb14f+w35riXgc5x3Qd+NUfKUxk7D0BGdu7MCYjWKWnu?=
 =?us-ascii?Q?5OuYLB2Yn+DBe6N7rdrlWUfPjMANNmMcVn2AXqyIg/RkG9NYlnO25w2bi5lO?=
 =?us-ascii?Q?bFMuoT8yOtk2FbMUzz8D8DZ2pI9PCg/xL/ktdWO6FqTloqrbIRA9WGeX8YWO?=
 =?us-ascii?Q?It4EMLT5MY1pouQOdpoND8Kuoa0Lyr89puaoShKMgcT17N57VIhIdmOeVqA5?=
 =?us-ascii?Q?m9KjprLuvq8KMGOKJDy5Q3JULlMGywfeo3MLzntCgWCT32z+xHlox7BC6MrP?=
 =?us-ascii?Q?ulkbF26oaTG9yQgxmVUf5nLsG/x2NitKY/DTICFR04oSChnQZ9FiXB6x9udd?=
 =?us-ascii?Q?A2XlSH6URz7iU4YgkvgVvaobKsTOWCcM+pD+YFLqTdMH0M8nZL/exxBYDzu3?=
 =?us-ascii?Q?1IQqib9pZHzq+f4B6pH30LNiWJ1WPYUjG9BpZDQGHotWGl0mSLVlmtYFmXUz?=
 =?us-ascii?Q?WhvN0rxn0jWr2hwKJZ7wBz39YTPq0FNU/7t5YconzyvMjujDhAAoR3u/m51e?=
 =?us-ascii?Q?WBD/gv1HsYFYmoiYw4P7tNldbxxKE9e2DMyOZ4BBOLx7OoWOLdmQEe3hLOPQ?=
 =?us-ascii?Q?cbsnA0yLl0zhXbtltSbmBKS+bLEmE+cnm26HLlN41WZnpebFXtnOMa85CkdT?=
 =?us-ascii?Q?mb9p3UqJkleIqezGA0yQbbePK42h5BWiRMR9dtCFV7NrcpNnv62OZvOlHLAw?=
 =?us-ascii?Q?MMV2Q37kqcuC9B/b5/f1AuqaPxGxg2ERN4nBE2V7P+KyzW7JpUry8jo/jYAm?=
 =?us-ascii?Q?ujPH0qvqZUd+pPTIOfI9IlberWqfn7J9Eqel9tz65TPyvgdy8H8/T/PrgiiT?=
 =?us-ascii?Q?7jHf6cQRIIlTTMq226d35Wb2i/QwhsHU9pzrrrSMHlDXs8hbxx8Z19ocFcgQ?=
 =?us-ascii?Q?zi8pFWzwWDVdCn2ol6px2U2Tp10bxYp788+Bz5gvbcEg5El+BGqlmNBp5q5g?=
 =?us-ascii?Q?A3OSP+ZJ+2Kz9aGQqLIcCYD9FbECbUh8JyYAXjntBQvIN00wBtAP0b8idqI0?=
 =?us-ascii?Q?22XjDnmPrqDZa0ZyvxXDvMm7IOX6NH6Z90WR1YvN7murhLXdp14jfpDMmr7o?=
 =?us-ascii?Q?4dJRq4HhSqITAg0O33MGXQlfQGYIjKX6s4dLY0+12vK6YtY1Xp36jZSPYS7s?=
 =?us-ascii?Q?M6fVRRe7RJDT86scoO+00UBSCP37jBNlSo8G2umHmm7ypEOBPxmrlQL9PQBt?=
 =?us-ascii?Q?9xdYrCElBxaDHCRgF5ZYRK0F9pBwNChzhLG9NNddjIsbu/Dgx4Mgo0gygUA9?=
 =?us-ascii?Q?fWaJAY2NuMvn0cyyMlbnuIPQdu8YW4g3hPINMyOY9WctzlUkuHEb9dwgE9e2?=
 =?us-ascii?Q?0SMK2B1/6/V4yGB9uW3zDN221RFi7IFp6l3tVTdcD48szVTZZu7gLTZBCwbH?=
 =?us-ascii?Q?s4hRnd48CRzBc6lbMISmgq+ORilRpwftNQufMkTzIL2RFKIY3vqiD6nZhIoT?=
 =?us-ascii?Q?KqJA7V2u3fq968OipJjUhbR4c4WA5t9LbID0V/7VtbvSYYOBtfPTnqoY9rus?=
 =?us-ascii?Q?dM4IiHTtMQGw1Lan34eSkB4RfhTVLywd52q0cydqPkjXKx1Ol5YkF25/phdK?=
 =?us-ascii?Q?mFgNLS7krOyrdOvmfpTvkwgSWhdGcv7xqx8l1FYhzG7Y8CUduqrd2W0WhJuB?=
 =?us-ascii?Q?PX/k+0MJlvSQmyqOU+KxoiYahKcdQE9ZLVt8Q1kimX8G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j0D7N1OgQV+5GV01yTx1rRlyHdn3CjdorIlcbKQv2PdeKHt9prVrrzcModzI?=
 =?us-ascii?Q?xS8p0ypI9gS5k//7CExL9SIhqcgHYshOCihxIplmRtkZK1I5ynXJzSK8v1A+?=
 =?us-ascii?Q?6Xl3fse8R+ubnOfzSPnqEGmihKay/5uka7l4tP+3Ca+l1AS3FaoC90COr1SE?=
 =?us-ascii?Q?tslRJXRz2sFmM12GR/pcFlkL5rk0AQ4xjvOyPa/gb0hB5/K5fEI37EOda2CC?=
 =?us-ascii?Q?RSp4kD5tJ+p0qCeje98K0AYqsgfa5RZao+bS8W3fjbpUWfN0LtZekOfY0nNh?=
 =?us-ascii?Q?9hMbGAZCiVZZwpEISWhLC4go6koBakgyqYT8ASO0iyXsbDb3h/7Cn7veBSy9?=
 =?us-ascii?Q?o0d7Jb/n2DLhAPH4G+yn6P5emUvdul7wJILH7Ld5ixtzZLXGG6+lYLn4SEq0?=
 =?us-ascii?Q?RgZuw7/aOW3YZJEIrMX1Le4ujFwoNtEWh12O7RYgcthHlKDEn5kAYeh+4YGK?=
 =?us-ascii?Q?3vmuCH4sZcFskwq2WMtlg49K3mBLwyhjh3qqKEsWp4BzuML9V6hKpLmHPB6F?=
 =?us-ascii?Q?3CTDxWXxGhUID8vCCc4WBZiUgBIrJhILXWCtKpxSOtcRxTsbKrj68d3zIOnJ?=
 =?us-ascii?Q?h68TxUSjSwLdKAWWRvvEEAqP2NGWnuUMsknz9FV52eoqr0NCJFrZB1znJ1ja?=
 =?us-ascii?Q?lBw5Uo1N0Ls1G/WH7XRXMGznO6Uhuo61fvTFLojvJG5bpAkh+A++Kiks2ao+?=
 =?us-ascii?Q?zBNMU1yyWcV4WbpnhJRTsI10Msap3X50ZMl5GG77xWHJTEJrzKzqfmyTzWP9?=
 =?us-ascii?Q?xk97y9grmybz0n8SPOCE+CaC9SCHtTcRT/xrSfrV3LKtNONmFejCkspi4lHr?=
 =?us-ascii?Q?NftegsoB+FO71a8pu4WHtEFgpvLxE1xPjN/AFOHArjm6pc9js8QqlUfKHwlm?=
 =?us-ascii?Q?rX/t7dduL4Bcnwlp1a/5SI5TYBdtvAdBIjHJXuontYT8Mn8cRhaNygfjX9ZU?=
 =?us-ascii?Q?nawzkJriJToJfXm4PPssCuvEuuce2BgB4HWDPj8TufTpxeTI9tpp9aqjLwGx?=
 =?us-ascii?Q?7GojoKeaIDPmmjk4NcKNKskyXGCraUtBgcQTS8mHz8Qy1pQ0cxXZckcteO9A?=
 =?us-ascii?Q?lyoiwTUCYz+7qkOqgKj61Gx4pyeHuCfUNzmJTB5Xz76OiqRs2RsKAFYDPmqH?=
 =?us-ascii?Q?I09Y7RnlNZZBSol5pe/1gHwhaeV5uqb8L2kZy/HEhgdWjomuAfvVlsn1jg1b?=
 =?us-ascii?Q?PhfhUvay4QbWriPvrZf21t50cLL7glF1/n8RKv6U8eEHha7Omkflw1rv6UJc?=
 =?us-ascii?Q?jotl9Fsscf2aXNFoXzHmGqsu4WZvh9ZmIxYknUJz3hTSYCQQHTDJT76CxgYy?=
 =?us-ascii?Q?HYqx0hVjCj+NF0mpLumMirwFe/C846WV/OLacyqOrgrq5jO6gUloIhilV+SU?=
 =?us-ascii?Q?cxkcVibiIbMqhmT0DnUbnIEVquLhOKZEOtte7JLefCKG6ibahPRjdn3a/3Lp?=
 =?us-ascii?Q?ro83GnPLLLEI3n/CFxNfGcVXw8HqEvRu0VR6a5Hio8EAKDIE85IEAdDfBbgW?=
 =?us-ascii?Q?Msl8iUJ+EWgbBtfQUyl8knxzLJLFJHqKdvpe1GfEHT9AJBjkxrBR+LgmBkNo?=
 =?us-ascii?Q?+I+QEf79kkh8K2W5CQ46f/kD+A5LFOgC5oqz85bkr3MTd2PhmLEuo+OXuuM+?=
 =?us-ascii?Q?u3QL+OLHaBFDKjULATRuwwXYjSlNzfi9MJcWPqc5eKY+DIZmG1AM+ylcPMb7?=
 =?us-ascii?Q?DtYqW7zkvUyPln36UfrY77f7jHSl/8Z1ZEu+heRuH0xvns2HzVwEu3EaUOhp?=
 =?us-ascii?Q?Ej19qIOQ7w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7421a48-e716-488c-59ac-08de62d226f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 03:13:07.4488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zjfsy3J5TZ7GWY8dodsXPVIb9+JmzsMxjmEnSpjZEzxUjo8RwJ0fOOMh3cNXLpXlhYkHOUyN5pdrS5jHPCWbng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12271
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16533-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 3E689D404A
X-Rspamd-Action: no action

The dma-coherent property is used to indicate a device is capable of
coherent DMA operations. On i.MX952, one of EDMA devices support such
feature, in order to support the EDMA device, the memory needs to be
allocated from the DMA device.

The code change here is to make this driver compatible for non
dma-coherent and dma-coherent dma devices.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 7dacc06b2f02..348b0aabfa68 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component *component,
 static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 				struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_card *card = rtd->card->snd_card;
+	struct device *dev = component->dev;
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	struct fsl_asrc_pair *pair;
 	struct snd_pcm *pcm = rtd->pcm;
+	struct dma_chan *chan;
 	int ret;
 
-	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
-	if (ret) {
-		dev_err(card->dev, "failed to set DMA mask\n");
-		return ret;
+	pair = kzalloc(size_add(sizeof(*pair), asrc->pair_priv_size), GFP_KERNEL);
+	if (!pair)
+		return -ENOMEM;
+
+	pair->asrc = asrc;
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
+
+	/* Request a pair, which will be released later.
+	 * Request pair function needs channel num as input, for this
+	 * pair, we just request "1" channel temporarily.
+	 */
+	ret = asrc->request_pair(1, pair);
+	if (ret < 0) {
+		dev_err(dev, "failed to request asrc pair\n");
+		goto req_pair_err;
+	}
+
+	/* Request a dma channel, which will be released later. */
+	chan = asrc->get_dma_channel(pair, IN);
+	if (!chan) {
+		dev_err(dev, "failed to get dma channel\n");
+		ret = -EINVAL;
+		goto dma_chan_err;
 	}
 
-	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
-					    card->dev, FSL_ASRC_DMABUF_SIZE);
+	ret = snd_pcm_set_fixed_buffer_all(pcm,
+					   SNDRV_DMA_TYPE_DEV,
+					   chan->device->dev,
+					   FSL_ASRC_DMABUF_SIZE);
+
+	dma_release_channel(chan);
+
+dma_chan_err:
+	asrc->release_pair(pair);
+
+req_pair_err:
+	kfree(pair);
+
+	return ret;
 }
 
 struct snd_soc_component_driver fsl_asrc_component = {
-- 
2.34.1


