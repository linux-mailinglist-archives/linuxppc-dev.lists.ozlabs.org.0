Return-Path: <linuxppc-dev+bounces-7363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CB6A745D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 09:59:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPDx96FwWz2ySS;
	Fri, 28 Mar 2025 19:59:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743152381;
	cv=pass; b=D59DWbzH0wwmlklbnEbXnlOjItY3C6V56248lzZ9VIhZbuE4t2tyIxOhwCMpt795cPg/jBVtvNhM3EYKl7nXhzZszHsl38daBfCAwsGd8O/j43Bfb7crMqMDKFauUP2sptODfjHD+6yLFNDZrmxcq9z9mn99rIEVcfNGIg6XQHsaCi0+jF12bsXDoyq3vinupb84p4e2qhJe10DAuD/rddbAeheY1zjboVoiD4miywFPOtOy0bid5GpvHWlY8VCgGND3CSmPOS9IWW31Us4Ce0GVt0EZOwOpmaFQNQEfS5y6dWK1fhfU7HwomQIIYAG1ooJjB272xCIyUVQ6xQhLRw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743152381; c=relaxed/relaxed;
	bh=criywvnVcXaw3T7TccJfW4N8p0Pg9JlC7dN7/Fl2/8A=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jcdcWwpo/6TvN3Uau9lGGLRdNdLidlLigqA6oUm8EnNMuN5og5ZF1aYgkCfZaWunDZg+8nhKX/RXVyq1nK9gmoC+HJa3hz5SBC7XC3p14OX5FokO3xmP4KO+60ukECJoJRo/sgBMmi0W3PzKhhGGDtqdHwHbv5ml4AlwDIu5Xj4SUHPCUFevtHknhaRObzxn/szMwB4zcGvck0QzV8UZfwhnJwC03/mEZiYnWFslW/vh7ic8Z5EYEy+3TVQt4IW+cNp3DqoqPQCKSJOh6jHhQuY3PsdG1TZh/MDjX2uPu1idTCvKDrbCAvN4iyfmJNq7qsT1xOhxsHgXqA6jwRe/Bw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Fvbq6Hf4; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::601; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Fvbq6Hf4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::601; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPDx84JKCz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 19:59:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSUspfh2tkNyay/18fvmN9ZQ041IhlAnFTbGWqkkhdhXRC1pZddsodjyXnZuw0EgDLFvA/kw7tcjeMDWS/SKcSG3/tJU+QmH55t0xxaXd9CMyvqMBrn6wXuBzo3yjbNxiy4oGQzljytEDFtuO/Ps2h/rzWXg1E4YCrSRoFq3ihQbytJkVNHXzOC+NMNn8h+zhVjrQ1rv88BMvu/bbFnFqKOfEXlp1fBd2lrT0vgqcloxWSb+A8Ankt+r4ZJ2Jj4HmLQysDPsHmXbM/2izaIXWh50+m4DtdxVQb3z7mCcwkU9zQU7c/UXZO5fGtwsiKjFvR0joKADOaDSh6fpzrZb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=criywvnVcXaw3T7TccJfW4N8p0Pg9JlC7dN7/Fl2/8A=;
 b=auHNpuvs6bcijT7N3iX5r3KtEo61l+unUuoqwetiRZZK1UaxHBRY0W0ajAJqgsL/bSjFIrallfqms3jBF4jZXcHLYs6xrZ8v34hxzNoPvgAnSAEfSxY+3QMIb8F8UJZ600Z7l1YywLyGW9jQsCpOaZIbgFk9AME8+q1mnov/LJQ1GuOuGHkvYxUcTQlvkmTM1nI1I2iJpi7Yy4nXwL1AbXOPKWHLG2XTKChK0FYUTWY/N1iUC97+w49Rd38vG7UE2qXbN+GOfWWjB6M1JkWFN7ozNy+77ucqGAdChhUS2S7z+vw9Bxo3NDg1n3HICgZvK11RKMGmVrhLGJS+Z0eOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=criywvnVcXaw3T7TccJfW4N8p0Pg9JlC7dN7/Fl2/8A=;
 b=Fvbq6Hf4AgJpgS2VQi1E/rCNgrGMfTOwYvt8z//1ssCkUCCd8cpkOFYM8u7JeGl/3XlDNmKnp4sr/gpJ4IdeUbyl+uo/MMOimsLriTzTrcjWf/vAtmlZp/BjxvWc6SwUE0x3py5mPAKK36WP/ntq7wTpSG7GpX0pBzZDYZuGSq6vVlMuwsZclRgfnsNXS3KSvF7zGCVqMgu7hTymdphp9pfBJeSG+772eb54T8sem8aIY3tYt3kbBs7vF7O1XWj4OZa4YwZDkTEfQRbn7l8hhlaupvV1s9HGLTatZH3YGfW75gKeizKW/S2o7Ogi8KnMYk7z9HrJnQkQLjM9MF9Xww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB11046.eurprd04.prod.outlook.com (2603:10a6:800:269::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:59:20 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:59:20 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ASoC: fsl_sai: add several improvements
Date: Fri, 28 Mar 2025 16:57:40 +0800
Message-Id: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB11046:EE_
X-MS-Office365-Filtering-Correlation-Id: 292a33d9-43f0-4238-49b5-08dd6dd6d395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cZWkiQfTYdmW+TLgaFKjviug+7YxmIc4qrXizQJpD56DDnw/3eGB3M59KEF+?=
 =?us-ascii?Q?C4oxuZRYwmtZTHcMbgPtZ+C6RyKO851WBfzd+u852GbUBdX+rSQXSvc3R0WV?=
 =?us-ascii?Q?cKxPjc+1WptoN5jaeUx2wDr+zzaZvnArog7gPC/fGChftD5YmsApoK9/tn4M?=
 =?us-ascii?Q?g0K9xkMeoyFCAWtYLtt3JXwvYa/aDofxF7jssrx4rcY6ef93F5J3EDf6uwFD?=
 =?us-ascii?Q?TJNkGOlYnP+Hx68llnPTbWBKagzzqjo8mMZYB0SROqXaRySsXFrfDJ/1tCah?=
 =?us-ascii?Q?+jrT/UTB/S3KB2isIoZZo++NWwmR9/9wxrz122egFIidn/J2v1pXm/6e7xLb?=
 =?us-ascii?Q?/nkd1ilgrhwUfA5x32rIQRyLa2mVS2ab0QbWqCYgB/dmWb49m9z6wB1tYG64?=
 =?us-ascii?Q?VurtAjoeOB1oVhIhQeyjBz3QfsKfhyuiay3jNvOyTVnlzoZ1lBmmaH2Wih4i?=
 =?us-ascii?Q?BkoZw6sAKGFexszj3v3GLaAfNVc8jvFJS8SRUNsRlh2elv9ahFqWr1OPVbJx?=
 =?us-ascii?Q?ZWaSmreqr7I790CvdGou8leCp1/BHm/scqn72jaBWVRK5SvxoLCII4SzM1au?=
 =?us-ascii?Q?PMFr0Y/MwXosln1wBU4U7i11LWh6uK/DQqYKcJoRaqlSqQFaNJI0quXs1YMg?=
 =?us-ascii?Q?XJnvWqTeXRDymOCl6P8guzh3ftCRWBpud4fOPteClPoNt0d42Xit4HZi5bM2?=
 =?us-ascii?Q?v4yfXQBDLXIMQoScG1+/s6IRf66IF35x5qrzX9SkG/mD/jLRLY29ynIeftRl?=
 =?us-ascii?Q?P1lzANZE77qyYWrFdlmR/wrgkoAsk7Jq8Gy2nxOooRM/kVYWHws8YiFtdfKZ?=
 =?us-ascii?Q?sCkVeBmwTrkxaIG+f3MkjZIVCpAaxiOQXQNVIccSYYXU6dPwzYeqPDyKkRpR?=
 =?us-ascii?Q?2ehHELW6lwv2Btr3lRt72hDBezSYfPLDSqiyi3egYb5fRjj3OFpuGxVnz3SS?=
 =?us-ascii?Q?o0PpHNGKcUhiubPCJyutKc8CpSvBvSZI1ZNtmce/q4jeR14HJ0aziMipaQzu?=
 =?us-ascii?Q?ncR/FbxqU/SwaCQM3LAmqVjPJxtMHNYSNO6tYwGyzmvNYhwgpcmmEU+0Sg0e?=
 =?us-ascii?Q?lE+3yZM8kzbQEucjkEc9dLNa7YGwj4eWNc8YqvWu9Y9s2U4l6/qJPiDhiEh2?=
 =?us-ascii?Q?6WqSpql2APap9WjY7MC4jz1XABN6+07MdRkPRu/zc8TzC1bdF8oglYKs01SF?=
 =?us-ascii?Q?vNdE0HTha6K6Z4wxhvNQstkYz2oEA/RBhT4i526hLMbTAZ+FUtkQewQ/4iBX?=
 =?us-ascii?Q?l+ydPm/YHQRAB1OCxw3SCSkR7Bx+lu67y0/CABk05jB5W2kMkr/hFFBp6x6q?=
 =?us-ascii?Q?TJ8p3ILz1+z2kitfVatroRhxTUx57pb7GQD3XPV8cuuxDsMdwGHjcSVPCqxp?=
 =?us-ascii?Q?XUVpNE4mDeX8AEaina+da81wbrU9oQkfHyTqDjreBIXfpL7oWUcwTlYME6HJ?=
 =?us-ascii?Q?3/YtGIvnUKciu595DBbDAZ9HEINhe1FL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAEmO0dZ8ebq3he8jShvIVwckI4a+jKk2OH4KGpM03zhf66GV/BdLfH31fVQ?=
 =?us-ascii?Q?f3ZeFizROvLrrG8tdk8R5hQyBnW+yp0+Xd1DBPgleCL1gqXiHSSGsVjctjsY?=
 =?us-ascii?Q?io0F05vPqUAM0XlKG1LHikK21eoHvHmYumF+v2bBaeCCeGuJvtYYjlyjMgc8?=
 =?us-ascii?Q?YaOYz8c+DOYGTn3SX1XROy2nbgTLQano8Z9WqOYwsyfe2azv8WWxJhkfhKpj?=
 =?us-ascii?Q?+bwMdkeLGQOkntebo1wzkk+IgIkJkuAA1vNHW5Ofqzkw+9gxBCXEto63TsgV?=
 =?us-ascii?Q?Dfl3QqAJTeQDMkIY++X2s2swFsFfvwoqgEi2Vs5yj5GLmPzdgcaEWCIvYV4w?=
 =?us-ascii?Q?SvBQuaYC95qW6R2nmG24URi21N2+RdZYk5d054s8P9f5xe9AnOG5w0i4JYkL?=
 =?us-ascii?Q?LuB7Am2r3EgMR0DIY2XQ4377cd76/RmExxKTCHDgU1MHBzDrSe+Hhc7XlV3g?=
 =?us-ascii?Q?Y8Q6TSqPfzmbu3qB86NANKiSf6dWsE37IRxIedJ+GvpAo3A2Dmt636sHKj3E?=
 =?us-ascii?Q?A1SSsbyPmBPVRn+lP10mU3nPfNeutzvzfhWqOBRV3sk8ZD9mnhNYyA4HjIHU?=
 =?us-ascii?Q?TihS/pMG9MaPSprSc+XfbKAQkdcSA0jsxvgtlPuX226CWsxmloCacpzzwe5H?=
 =?us-ascii?Q?McJT82/QFGi/AmdGMj1XnAt7qOx7XTbJQAUfBU8bJKmvTy35l2pHaakH0unG?=
 =?us-ascii?Q?FxoTu0qvuq2YlaJ44dWrjPEjZ5wci8zKnPo+yP9eqN1wes5iSg0ad4NvhyhM?=
 =?us-ascii?Q?hPnAs61z3mZuqUuTzUcwCQuThI8M4lJk/liSlaYZl+FhndVlGb6Dbr4f80wQ?=
 =?us-ascii?Q?XwlN6H5dlCBoyHV/MzzNb+6irWLeQ2b7PcITirmqp3p56TnBOSngLdHHvE4z?=
 =?us-ascii?Q?2wMRAQ5t0TxSmpKPHdy8nE8pxfHUa0JEYs/AzZ1lUuxP5xIH65/L2TZzaANO?=
 =?us-ascii?Q?Sjhu4sVhrHXY1/vrt43lsE3rwmTFkxl8SuwgG7Pd4IzPjILd3yq9zy3AUER1?=
 =?us-ascii?Q?PdLJVQRjM+AlGUC2CqN8ToKwrm0XHKdb/5npSx56q6nZQvjyuT45lnAilhm9?=
 =?us-ascii?Q?vp5GeGxFKlWeljfwOzUZTxOxwRKeSqJMAMVMjqFBbxrTlCuwXmOJHy8lLa3r?=
 =?us-ascii?Q?BJQ5FwIAGaEINnLHU6UlWbkKtLXlI0szXOMNNGA1DuoNlvNPWppo/UTfpdxg?=
 =?us-ascii?Q?8ytHwDTHHS1UkIcCOTj4MGQKVCiF5AcHWGe2Ok+EOtXVJ5WmOulfT+aMpjfb?=
 =?us-ascii?Q?CgsD3SP8qdAQEbXF1Q5Z1mQFvonQFKeQ6HhtvBlezQo2Za77kBw++aBnoV1X?=
 =?us-ascii?Q?GKd4eVs6/9SK7otwC8vLHmFWrPPJWr1P8kcwmqJi0tLzms3zVvjOa0jv07RR?=
 =?us-ascii?Q?RFHlHwj9HFNDeAp+3Ehwa19B44gUQFU66VZkbLiO/lec8IQuzffcboMxcRxt?=
 =?us-ascii?Q?oXYiCVAWzT4+W6ccK5lUPNfqvzJV1xkUp/xcY4EXSu8IgSgbeXWrhod3F8uF?=
 =?us-ascii?Q?mkOR2ZORehnXX1PvlljZ+tzxxc8HfyWQHEDg8JF+FnfJWslSx46iIpEkVgbg?=
 =?us-ascii?Q?Wt2Y+KtiP9otTqCUUPZzjoFZ2wqJHUR5EQXk+gTV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292a33d9-43f0-4238-49b5-08dd6dd6d395
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:59:19.9999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4/U+pxp44Xqdw6Gc8rH+52CoFdPUc0OkZUpaMuwX5T5iVr+zYorjLR3CUgrn3SQcy6X5VRowyg5NsfNvCbM1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11046
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add several improvements for the sai interface.
1.allow to set mclk rate with zero clk_id for master mode
2.add xlate_tdm_slot_mask() callback to avoid channel constrain
3.separate 'is_dsp_mode' for tx and rx
4.separate set_tdm_slot() for tx and rx 

Shengjiu Wang (4):
  ASoC: fsl_sai: allow to set mclk rate with zero clk_id
  ASoC: fsl_sai: add xlate_tdm_slot_mask() callback
  ASoC: fsl_sai: separate 'is_dsp_mode' for tx and rx
  ASoC: fsl_sai: separate set_tdm_slot() for tx and rx

 sound/soc/fsl/fsl_sai.c | 90 ++++++++++++++++++++++++++++-------------
 sound/soc/fsl/fsl_sai.h |  6 +--
 2 files changed, 65 insertions(+), 31 deletions(-)

-- 
2.34.1


