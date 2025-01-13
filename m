Return-Path: <linuxppc-dev+bounces-5120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D2A0B154
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:40:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm0j5mGdz30WT;
	Mon, 13 Jan 2025 19:40:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757605;
	cv=pass; b=D1/lzjVPN5fmsSPx7kHV4tDlCE+ayYyv6TZh6m7h4WJ9Iso1CvN6v31EkyTE/2sFceqBIcZvKMFAXC+ZmuvhvntmW7A/ecXMVMKpz/y9VnKhab5Wxu0BiBr0uIA5oB0/xM/pWxkcgF8q8vewl+IKojtsrYHBanGyisqzyQEtbxEuwkT+l26pyUlHO5FlJddqwiS972DRI1tf4j6i2ddyHlghgXHWkatC2VFplxIIk9BYUjdLWRwDGBfFBNdmibGxMLbgbPH0j4sXYS++d2SoP+4ZfVS1oJ/+3sI6YtNI3TS1b8mWE2hEc91fXximJMMef4D1RPrg7AqFNN/mqOsHBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757605; c=relaxed/relaxed;
	bh=iReTsquqdakRgLXsk9K1+pSqIKZ5BbTbYlGf+A9WAc0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dt8V1GbZKPF30PjqNv62ZyqjxVLCQV7eNFRtayYYVf7IaczKnztZnbKTVSfb1EFO606sDuD18ljWw//hyz2EWmtBvaomOmXQQQpn5D0ADPg99aAwTfYJmVJzlcApc/fYdYec2d6/k3t/ICpMjU+Pz/zhBaQ42l2aiEwoIUUm/vPsxbfcUpzaQshnSoKS6La1AFmi+kLscgN7Bff+VmN9aIO0O/wHDZsF46aehavFhkH0OHclltbmaunCHnRsKgmUwL1PUd4mnWgcuqaHapmIpGHMpXEhTeQBJwdZBIN0+XbYBuH+0Xm7UWLGDZICBT5PftnOHz243gnW3th/gdrifw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cwsGne6q; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::62b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cwsGne6q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::62b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm0h1Xg7z305C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSX9APcYRxNvipmlWxDM2SBlPqGPkQMyRcUovDtWWUSA+g1tZTRUddPFcTUBgNRJXIO/QljiHIIHKWObMHwZFKhThW4RW4d3klkyucZn3e8qASLP19UzbAO/pGwIBLCMCiyBAcT4DWAQQ4FsxUmy7VbJ4Fwno2+B/1twVg4isHtawaJlcWIauzKUhIo1moA48xH9qB6RxOZ9iVkF1sBKI7d1ROy9BOUajK7hb+wEm3dGsb9XmvkeTWm6FNvGky2jxWP+PM38PDXSFkvhqIFLtoCTzpOr3SoAXQmL+Sq+DiLrGQ1ZrMGlHmMBcRm8imwMip/n1MO2f5o+gJIa7nq9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iReTsquqdakRgLXsk9K1+pSqIKZ5BbTbYlGf+A9WAc0=;
 b=qkxmWZ0J/i/vOzRanLMWC9gXlMaQaotjcc56qiJR3NvrphBihA1jYGYtFAmB6t1uCBz9Y4nQih8ugw06JJJNGMAaIuJEVfm1PEF0ostJPaKZtq1mbpMcTZyq/AJAcRsy4FhINMCzAcie8MCFlp+niB94LRphjPnzcITzEMpaVmtNB+pw3E662ZeVD4SYRoCh3hjaiHuI+TIUPWcyXdHxzd6cCWioqKlJ0yy5OGnusVqU99oiUJVJCvXWQTkg2GoiT9Wi3iAaWAfAstYszfk2gVkJaBfCIIV2u28jZqBMKz+8lwzlo3nKE8mCj1tssic1xeSySg0Gz+zgkcneBuZ4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iReTsquqdakRgLXsk9K1+pSqIKZ5BbTbYlGf+A9WAc0=;
 b=cwsGne6qrjMMulu1uxFrEhj6QZzUp+5YUbn5CY/kMCPM9KTHCI+u3dP842gT+/QRy/lE6e1/1UAmRJooF2ShVwJGVzuqyC+JMGD7MEjFcLPE2QG7iMdKpXFbktbe0FvnawQW5qdS/O4rARgnU1CS/qjf5/v3EY5ZEh2Jn95J2IZPJEiVXgEuq+JbLiakhuqmS8kzOMTEHbgSmhI0qEY/iQZ2tLiERwRfoeU1+UpGGDdXM6Q7J6OgSZ6xbAN/kIKvxGeKYT8L/7TAoGKk7DXa6DZuI2TJBFNY8TVs0ZwRXd1xkDtdjyKdss4/GHad19+umkSTjCKYSY4QLeHxhFNILQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:39:43 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:39:43 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 00/13] Add more feautues for ENETC v4 - round 2
Date: Mon, 13 Jan 2025 16:22:32 +0800
Message-Id: <20250113082245.2332775-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 855f30ab-de4d-4e93-6989-08dd33add378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IO15KkvSJHfKVkHQkxN0TXjUKo+/EokHw34826Bt07BU0pmAxgbWn9Sxutx3?=
 =?us-ascii?Q?81LtHM6Ja+8RjfaO7NtQBlD5D9WJOW4hbEsp5EeXGk213BTYmwcMfHWT2kN8?=
 =?us-ascii?Q?3KdpSTDlaNuOgZXgbS/cV88kIJSJ2d8GumgFMzFsihXQc+qdZr4UtbR7fgjx?=
 =?us-ascii?Q?i34ri2Ft4gr7/L6BRZkoEcA5/jO6CEQx6HnCBJxd3DubiEnqLdnAbDLahO0o?=
 =?us-ascii?Q?uJ4v+3U7vyOD/4GU/G3F2KRSDc3a6o3PRX0CQ70omrkjAN6yntpZljYzaUXV?=
 =?us-ascii?Q?T7T2B/+9NuCvW7s8W/sPql/1gtkqFJtJeMmrbK9ar9q3SfLbHUF7TaonMWs6?=
 =?us-ascii?Q?nWPbBOjga4gV7UbGyTRctpJCjokzdmUhZ9j1YFhLcM0ffZ3TfgSypvGS3dSL?=
 =?us-ascii?Q?S8AhazL/M2qgIuHS6u+qPZAPVcUHabxAXJTTFTYiK5bEEPoWI64cujHVDg0Y?=
 =?us-ascii?Q?EVhi0mYsNCR3Z9JjPdQHWD1lumbdc4J+u42OOrbQ5xgfkwyCkMUnMsMji7x0?=
 =?us-ascii?Q?BEmY4Nf+Entq5/HU07FTN806S2SMsl3Zxk5FJc3tELsGJhS7RzsfDcePJBXn?=
 =?us-ascii?Q?K5G5O8cc1vlBfM92AML721nbQINsIH/NaOfVGuERDBhzGhOCSh+48aOpxhMF?=
 =?us-ascii?Q?lBTwYROde437aqDmqy3mnbTlrbcA+MwaxKOZ540VyPNOheD6RoRO/01h9Wt1?=
 =?us-ascii?Q?NoyCrGMIO1TOfypfMUxtfoR3BZ9vq5FEpoM6LwbM36JajkxeUXvmj6aK4bAq?=
 =?us-ascii?Q?aMM0i8SePbSue+kAW9Q3zSHBtYYgnZ+39C0N5kljYevIcIISB1fiX+QBI5Jk?=
 =?us-ascii?Q?X64n1oRxQt+RSV/tYPQEAFmNsA72EXJVDkkTumCVnK4/jb9aV90HLkszNezJ?=
 =?us-ascii?Q?Ha58aeYdMhgVyOp35hV8YyN7ssGzdheTspFp3LTzQgzXWA0Qaxlm5JRmCiyX?=
 =?us-ascii?Q?KL8nKp482/5lOLxaCy+prEFMFwwW8rjG9ZPC5//05zBT6vzVU31Q0PjMgFZd?=
 =?us-ascii?Q?fzMe/TP/7oBsYzBfxf+KMKvcTo1/bRpr0AWgiBn/m3wSeEZ6VmEL6XLgbB/r?=
 =?us-ascii?Q?12mIHx6AEGvDUxsUSOo+zvewLFD5fACgNodL6PSd4oRglnYElTNB47zxu/1G?=
 =?us-ascii?Q?CwRtFJ//GgZ0ys0HHCWM0+ogDULyrAiKvcCJmc+zD+pND5zC6Ma17Ar6ENSy?=
 =?us-ascii?Q?GrIrKHXMELNb/MKKaNca8r0sNnxwzlEpdN0NdPiuzDAzIhNajXhD0DgjJ2eN?=
 =?us-ascii?Q?u/N4x4hKo0OvN6FuwzCzfEzNvg75HaYBvM4+ekpUQo0iAnemWr6+0AqGpVJ8?=
 =?us-ascii?Q?AkMEqZBnwqkgdpKExOycMkVfgUVwMY1PpN6a2licadI4lqWNQd0teIBxcUz/?=
 =?us-ascii?Q?lfO4mJ3MRaN2j50PlijW3pa5LG1Ahx6hye+PM177Wa1T48PdEOB0/TPug/59?=
 =?us-ascii?Q?+IiAQot9BbApOFqVQS+OIAhP5Cbkks3d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+jTl2iKLrPLJ7MnDc/h25Gh7q7qu+2JJiiy798NM+iixwTWRPDVIBwWa5vMN?=
 =?us-ascii?Q?Nk9UnyB5Rqm9oPqt6EjK4j54/xvJ3TU9SRryro6/nh/5XKoeHxEhyhMNxnFJ?=
 =?us-ascii?Q?TBfHBTY9mEvOp+QdhsxGK9rWRxzznji5s9bWmb+Q1Ef1TANwUa34K0d48rC8?=
 =?us-ascii?Q?+1EJfQ5S9G+TumhDfRCSyzRXybvWZMxM+C7JhJr/3akyJaI8dwnJ89NWrLaG?=
 =?us-ascii?Q?oRE/RRmimk3rGsMntVCze0emxIUjOBaRUw7PLjMzmycKFws9Zb7lqXBcFil6?=
 =?us-ascii?Q?ZBTtWFnKIKFOAom694M57h5XMTIB7r9THeHhVjfJ4uh2Lm8q4aPzl67DNk0l?=
 =?us-ascii?Q?rSKQw9R7OXPazVdd7TWntSp3A8ON8yxaahiygavfSGSwEZ7XjZv7gu82iUFs?=
 =?us-ascii?Q?qnmQwW35zBxPEfJa+1WBzmuAk4zKg83+N8GOUBicTEV4jWPCgkqHd7VsCk7D?=
 =?us-ascii?Q?1BljCV/XUGorao6uu690Q787/zWdKTolntilv3s/rBEpvVHY5UBSHZkmRQCq?=
 =?us-ascii?Q?IQXQlz+CIcB9vphyeHC2Y3tH9c00o3LW3pUFhuOPuthzFzNvE8k4yQrfo0md?=
 =?us-ascii?Q?7f862kNegc78MjbDzwQv5Nn9zbgsZjYtIfubripMFnEBwX0yWoHgkwCfgPgs?=
 =?us-ascii?Q?3dm+xjpiS1/vBLTlywfYeOteAVigUAk2Fe+rYdRpARw0cAfrMFl5LvOCkz9W?=
 =?us-ascii?Q?56iczGxRKaUG++kTkObdkPD2+GJWXIq/pmGlZTmPaWyW14hcUjFJp0MsG6Ba?=
 =?us-ascii?Q?lZGp9GDtURgMiXL1tYZkmd05hUV8Fcn49pid2sjcEizv4m+y9rzWnQf8xX1y?=
 =?us-ascii?Q?6K1wgIRxrtH/ipl0bS1Rywn3GuR9h8AqHmoo5t8QCWWma74r92wt9DjySe54?=
 =?us-ascii?Q?S0WB8xSL9tcnIbLw2ejgzWT5F7k+8lgKhw4Fg4FS9wXzeORpcHiBn/1TnEXl?=
 =?us-ascii?Q?j2D2H2i2Ot2ZrQCF4cyaNVIM3SNWbmZHJoxnQxXq6F3//f47oCZI2EjrjGNt?=
 =?us-ascii?Q?Yo6sCj7np8JoOXXLY9KzZDzOpJzs1GpJO6CLSAXWZbZrlTPwoehmhxE5NHNG?=
 =?us-ascii?Q?OY7IT6HMx2J9yl2M8BNbstC5T9R/FoaZeBamFkcycefvD025uiT+opOmG5LM?=
 =?us-ascii?Q?u3C4b6EChxlpypLW/SGPdSXFMm0KFJMwe4sSgns5DlK77nnO4TAMxiulMVi4?=
 =?us-ascii?Q?/bMJq24vsaJ/B2GjX0KJ1CKtin8xLOTa09vtUG9MYlzmfLJO2qprRCkkQAW8?=
 =?us-ascii?Q?MB/mMD9xwcltui1BXj4Rpyd76Kx8JTgn0S6kXmHQB2/Hqp21VK6SY/VPl6MB?=
 =?us-ascii?Q?LTYQEW/DwXXlIuJFne37x14MSqza+C85iCUdriV8sHiXLvV5rsECLb3POxNp?=
 =?us-ascii?Q?bUXDV4d1rofisfDf2dC6wK3TJkUV+55gn68cjkbrFGKHhgUfwwhWf1sV3MnK?=
 =?us-ascii?Q?g+XpZnI6CrkItcPDfDFo9m8FT8KAXc6s5SKVNZQcR1a7iKJ+L++sBdL88Jvd?=
 =?us-ascii?Q?PR8UjJBqxLhfoCL/7Fx4Oe+p++v1cMtiQtzlWrsGHX3ZCumJPIzFzHkHfpE/?=
 =?us-ascii?Q?qqoAwOltCMKFiqb0mxg998LiO/dOnfOBkX7vuUkv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855f30ab-de4d-4e93-6989-08dd33add378
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:39:42.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnyMxQTyQcPh/EzwqTH/rXW1FgVpurhz5syh2OAhygTLzoHmYdZqlLWLPaqj5SuaBnpLLPd/jyBC0DzxvEnXgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patch set adds the following features.
1. Compared with ENETC v1, the formats of tables and command BD of ENETC
v4 have changed significantly, and the two are not compatible. Therefore,
in order to support the NETC Table Management Protocol (NTMP) v2.0, we
introduced the netc-lib driver and added support for MAC address filter
table and RSS table.
2. Add MAC filter and VLAN filter support for i.MX95 ENETC PF.
3. Add RSS support for i.MX95 ENETC PF.
4. Add loopback support for i.MX95 ENETC PF.

---
v1 Link: https://lore.kernel.org/imx/20250103060610.2233908-1-wei.fang@nxp.com/
---

Wei Fang (13):
  net: enetc: add initial netc-lib driver to support NTMP
  net: enetc: add command BD ring support for i.MX95 ENETC
  net: enetc: move generic MAC filterng interfaces to enetc-core
  net: enetc: add MAC filter for i.MX95 ENETC PF
  net: enetc: add debugfs interface to dump MAC filter
  net: enetc: make enetc_set_rxfh() and enetc_get_rxfh() reusable
  net: enetc: add RSS support for i.MX95 ENETC PF
  net: enetc: enable RSS feature by default
  net: enetc: move generic VLAN filter interfaces to enetc-core
  net: enetc: move generic VLAN hash filter functions to
    enetc_pf_common.c
  net: enetc: add VLAN filtering support for i.MX95 ENETC PF
  net: enetc: add loopback support for i.MX95 ENETC PF
  MAINTAINERS: add new file ntmp.h to ENETC driver

 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/freescale/enetc/Kconfig  |  11 +
 drivers/net/ethernet/freescale/enetc/Makefile |   4 +
 drivers/net/ethernet/freescale/enetc/enetc.c  | 103 +++-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  58 +-
 .../ethernet/freescale/enetc/enetc4_debugfs.c |  93 +++
 .../ethernet/freescale/enetc/enetc4_debugfs.h |  20 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  12 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 537 +++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c |  65 ++-
 .../ethernet/freescale/enetc/enetc_ethtool.c  |  71 ++-
 .../net/ethernet/freescale/enetc/enetc_hw.h   |   6 +
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 140 ++---
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  32 +-
 .../freescale/enetc/enetc_pf_common.c         |  46 +-
 .../freescale/enetc/enetc_pf_common.h         |   2 +
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  19 +-
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 468 +++++++++++++++
 .../ethernet/freescale/enetc/ntmp_formats.h   |  59 ++
 include/linux/fsl/ntmp.h                      | 178 ++++++
 20 files changed, 1729 insertions(+), 196 deletions(-)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_formats.h
 create mode 100644 include/linux/fsl/ntmp.h

-- 
2.34.1


