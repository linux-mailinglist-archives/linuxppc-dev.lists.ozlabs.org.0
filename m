Return-Path: <linuxppc-dev+bounces-10156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA9BAFC652
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 10:56:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbw1q3lBSz3bNt;
	Tue,  8 Jul 2025 18:55:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751964959;
	cv=pass; b=S7yg01ZTWqyKe2TD2cHgMingUzT8+duCxi9P2Ap6nAKHwWTenNJcDubBR1JGsQCIlSsF2FK17MpM8I/zjpVknHihPa6TbiXG1MHhtBj14MF22yqQNrooXgCFfwvdrz0cxizF4AJVvpHCs/tG2fGctPhVLCn1bqzE6miwgny0rEsLsuqjQeEK+pk8EMUjmZmyYaRsG8YFmB7a86l3L7xSDMiNnVPRFLkyiBun3GU0eSTEL439B0Aw9kwqMRXgphHEpsupXvUXlGHKYhY6AMzkETCKKs2xyFDZcPQ02axCWekJc/sJINjyQbZOuyJ3JqhZa1SbIW+B0KwHQzbVr1NCUA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751964959; c=relaxed/relaxed;
	bh=LmX9i/Fnt3TZmUX/Z4Fu80SBTdnUh4l+RNdNk93IN28=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=o05POWhsa/XHJD6ENzztGF1DzGcHlAN7kZJsTTBQvCt0M3iHvk34OlkfVg3OoRxmEF3WPd3mX8sz2b98+RTOFOGCam0s1PPCu7IXVo3iZs3aGRWmpYgNJZsgbEyk3mbFhO+hKM20pfqjz8f+R4xCaPnseTTAWcy/rJdlKGLSgymyvi2CElEVYDAsapSGKmx4ZQ58egPKr2lr9PUkn2o1HxyMB+e/F6fwVr0FjLCIEHl6/xtwEOVHfBlQKmlQwX7JPC+XtWCqqBf3Txua5obmcStTa4S5CtYwqK3g93xZBE4+DVmlQ6TdeOGJdELblNxaEP5pBg4tixmw/tF3tNK+/g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=U8bnUSgB; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=U8bnUSgB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbw1n6xSGz30WX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 18:55:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swPuhavhaVwk2ypFq4Xg2OU1OYAggXgt5XuZNQtK4eI/HsP/q/GmilbkF+4d5d6jTmHoGY32vrUFR4NGLW8llVVhpbJ9n2PKTAksBIa9Bwye0CuaqeGXnZHjNme3BY1mMb2LxeIPcQnjMgmchb+ExJRiqKoFaDtpuHzj+HnDK25CMBpWnt1PUrONs6Nm1n7CQy85BPx26d+J8eQww7c/cI5VmuY4JGbgFt/ObZBFgT6VS+EpXSMS2NNvCBpIllMMTupWwUYgeTNKhkNYCUI+Q9HG17KQCiOdc6nKuM5+vsHHVncA2aG8wkHHaSZJrNp+XczbMPOqdXpu2aIp6M632w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmX9i/Fnt3TZmUX/Z4Fu80SBTdnUh4l+RNdNk93IN28=;
 b=qxJa1KZG2qseKM2Ol/1nBXdbpGEuPQuRewETW9QokTEx/KyEb0RXWYgC6+4U4jwnFFlU3PxXrsUp3rLumNJ1xbDM+k/A604TFy26bYYYnSPrNyYIm2zn6d6kJTQkj4h5K6ZaDDCLtbHQqUbR+ndqeAnwcJHuL+SJcMIPefRX94E8z6ODSGGYAhZnrPqCI204DxmZGR8P64PoU0QVtQxh/LyxiEzmschOBmztYEluPZDXeCdle1sfz5l5P8xMps9bVEc+Kq6bEQdUsmLlQH7C+vUtQ/t3wjtxFWI9fm+3iZDRiR24HBeLveD/ZWsBeS4qnZpFp4hZ93+DicFIRl+UNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmX9i/Fnt3TZmUX/Z4Fu80SBTdnUh4l+RNdNk93IN28=;
 b=U8bnUSgBFLXNmG1s/1RessgNTmvmgJYpuVK5/HH4x0wQ+5+X9h2F1u7qQg6p1SJ5qCe6d4mNqn+5PtErM0MfbL8eCZaCoPLNQ6iJi9q6smQXicFgZUU+tK8uzFfDtpEyRU9XV3hWU5GSXH8b+xv8Y7DbO7A9WMo79baYPT8Xlm3llqq77P+37GinqsbFMlUwSVao4KIC7IFThwslCLhokDG+RRDY/lDbuuKVrlp06YCGZZByq+Bxi3wExuyZxra4pX37YpV7Ov07WWDHE7pwIS+oS5mM30ITGCrcUVjQDrnlU2gj8MBluD8b8B6qeQEvYrVPuhzsdcyjo4j3+DQ+XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 08:55:31 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 08:55:31 +0000
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
Subject: [PATCH] ASoC: fsl-asoc-card: add sysclk_ratio for calculate sysclk frequency
Date: Tue,  8 Jul 2025 16:53:17 +0800
Message-Id: <20250708085318.2563521-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c19fe87-e264-463f-c9a5-08ddbdfd318e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+iXYfL+MZvoNjG1Nao9sk6wgWPjo/S8wlh9LZ8L3G9UiegV9gC4JN4RN5I/4?=
 =?us-ascii?Q?sSi31Q0OyZV4CmEYIyZfEauZWQh7H3AEGD+M3NrXHYWvs+ybhPBUbWJ3khFI?=
 =?us-ascii?Q?Tlz5CyGAnd6Gy03e4x3OTaiPkiN6O0hfu3hm5Jt13o2jE+9g3V985ppZ/ZD+?=
 =?us-ascii?Q?QglOV2InJz+b93YWP/3BKJK38qBeejzSvWHR5lBI0g98kt2Fq9KQljvbYkIw?=
 =?us-ascii?Q?OdYc8VZBeyRjTSzT8d5TGgm991U3XSeMHyfdL6tWA44B8RST7BRQzs31EcdG?=
 =?us-ascii?Q?6l8bB8gBdSjjrERw4DFqfzBTYJ6eGcZ4ZRPxY+FI6UUlvdtU8QIFE6fUfW4b?=
 =?us-ascii?Q?V1G9FjTw55SRhAfIMBP2J9kfHgFiilJj4M5hWQT0W6awa3HOfr4glRVfRzVs?=
 =?us-ascii?Q?aNb378qZ0qK7zMQhNB4paS0AJVAN2Gg9Y3YNUB+Xfr+eihW/QCJdzCGXNxTk?=
 =?us-ascii?Q?URgVbsbkyHfOl8AurU4T0Go2CimNWhqeDg5MurmEh7/C4bnILV0zzGEJm7Ot?=
 =?us-ascii?Q?n0+jxBeeoAf0m/K7nqeaJYDa7jvhW7SSpkr4Am7xau5O0wecx67u73irtinT?=
 =?us-ascii?Q?knlbUsq/zN1/AUXINKq8SDdlSbwiGRST4y424rzM3r3KcrcTHYHKSLfArBI5?=
 =?us-ascii?Q?PIVOkqzO2KvSLVluUPQeT2J/TF7PCeZz6b0fb/n951U3jHUFXz9th03zVaH2?=
 =?us-ascii?Q?ZQeprductPVs1cCfTlkUXQk4eEuLkpcHvQ/Mrfhr/udcKvdMU9YyhZgKyO+c?=
 =?us-ascii?Q?8H1D5GOm6q3XC7B6ItsCtTfedZgheoZ2ToMlZxzd0/PKliW6jmhPEVpGNDpf?=
 =?us-ascii?Q?H+m77u2v4so5gle5UFfD9GJz+QUbW7hQ800l8CtZqyUSM5tkyIvsH7nsaA2q?=
 =?us-ascii?Q?UlzDRUVZR0JhxQgJLL8yCOQQU8xlFgc0sJa3RKzTDWKy8WUoHlUdbbZuV9Ru?=
 =?us-ascii?Q?a7SyzEGFbXO4DHRPuCKsKh2EloBqA5s9WuxkfG2dhd6h7nLVasPJZFgLgz2T?=
 =?us-ascii?Q?jrs36bAoTfu1yUJlaQPLlQeV6ISLSWHsxJCv4xj+HcpwWqjERE1nuWmwnSWK?=
 =?us-ascii?Q?pahpZZA1FdxQp2Ghj5+0XfMiWCJSM4EuQYSJuUtFLecAyPcPWWykl4PIUHrn?=
 =?us-ascii?Q?ACWGckz0kMI661uA7vHyAWE4wIbbRsS9oNy7c77eH688Xre/Ome+JeMTfiMH?=
 =?us-ascii?Q?ltFh3KOVpbJ+l03PbPaJALFESBSH81q78J9iHTaKIcQpEjiTY4nLpSfEIl4b?=
 =?us-ascii?Q?pUojM4BCML5dGM7A7ou6mniNP70B9ovUDQJ4KpIFX/RJJ2I0em3UV+cHiwrC?=
 =?us-ascii?Q?hcD5uAB5WJYBJUFrAPkRLSybWRgr5j/rCYENgNt61tp3NIjfWMgo2AptBhLQ?=
 =?us-ascii?Q?yzxXtZ+j8YBwjGY5EpN/YfBKgv41qKmqMjK9Q5c0WoFPRYCpRHEvvbRGVJCk?=
 =?us-ascii?Q?9URfdcll22IyLvzf6SwaUVWvgWy2J+SMj5j1ijZy7QeV2Bi8LJYusrwe2Hqa?=
 =?us-ascii?Q?wpF2ZxJP031dg9w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f//q6kWwVUGxbt5D5k7SK7bC+tI9Zvc4QUB6SrnDHwUqW83ebVsS3F8I2q3G?=
 =?us-ascii?Q?wj+LCHUwJwVltamnRcKCKa4CJiVCalBVUwklJJ/uebatU5OSecQMhkCfXJgx?=
 =?us-ascii?Q?YT21rXylKHtdb35BScjBOCRxfOJP2AnAnDeNvnXuar40xbePO61T6pLPEFT1?=
 =?us-ascii?Q?a3bngA9Z92yEVKXchTTZAo6108QhXh7yizi5Lk7J/rQxpWbWxtZkDyl4GfX3?=
 =?us-ascii?Q?CL/JjpmUBhnM6qiAXEDdi7B2+rNgAknfH892NYlHuQ4dS8Hu7nKeETO7JhXD?=
 =?us-ascii?Q?Fdaw6mNnaK34MKW3XPGtMGGnGGnqUXSeiu6Cas7+hywjcX9LOFTewH6Uy9KK?=
 =?us-ascii?Q?xXZ1oXd35OJqZflx0c0N2P99fJgQoNWL7UIVZCXPhuo4rJvoPQxU/9fZP24I?=
 =?us-ascii?Q?KKjzFqGDyVZMCqKbP7ojEWXew2L+SCbEnmeuvSgBfyZWVtAF1FKn2zg8doVu?=
 =?us-ascii?Q?5k8CDgzahCq8SVXAWSv1z/G2MFlUR7xnuMBi0hN9gCeVrrlzVUCoQM8N+H1V?=
 =?us-ascii?Q?rHPIp5xyumLRGfZwPgcLHDmzTDtCeHovFocu6ReuMIlZ3bN3lIbhNqJ17hG+?=
 =?us-ascii?Q?FUjjLNjzOUioySW/OSADBhotmPcL6QLXimQG2/cweUPe3uaIiaJRC+stEwUK?=
 =?us-ascii?Q?diehn+Iv19Dl1xWWXx67SGCMX8eErHZsHKaZltXfgfxs58cI7ZIdnP98TvNB?=
 =?us-ascii?Q?PYWYt+QjMTtDAe+X2oUTOVUXiAL39Ogx9MkAMy6z7RJa+X1WzKJAZoAC2BBS?=
 =?us-ascii?Q?luT0N7i1V3C67LWYNi5S2wQvbCCs3r9mYrNSSqbX4aVJvqUrbMZkrGGA3pK0?=
 =?us-ascii?Q?kgEmTrftTBJBHN+seJ8tfEL4PlyIc3OxqqGeAg9JPB2jHFSQYspL4oo9T6SL?=
 =?us-ascii?Q?0XthDZvHkUBI3q3DeG7U0JucJTV2JRufS1aBKKi+9Wv2NIqrJYhLVPK4KOti?=
 =?us-ascii?Q?f+K8j2ufMFaQqCRJaPAG8r5sqQZyZoeSyr7DcGk80+0ggPrVEzsWtHZQQeix?=
 =?us-ascii?Q?tjYZT4VaFyPlQsADCG0eD1zZcLcDpqJBZ0frVAtzWznrrIlS+eDw47iIjub6?=
 =?us-ascii?Q?1sIyE8jnV19ThkMrSJUiz1F18GHVx998zfool4s1IR1HtLL+DjfugAtVTzdm?=
 =?us-ascii?Q?ripDYtLo47xtoibHGDXf5iFyy2Q3zsuuoh6iwHwUakauUhEJW8L2jNAsOK1p?=
 =?us-ascii?Q?eQ2DjqRHj6gEF23zMjc8Ze4rrMQfTJmzk69HJy9qhWY2fKJWabVea+WfhmN+?=
 =?us-ascii?Q?1oLu446ueuF5MAahW6iU8uAT9SyelUS3urVgd6KknD2eQY3p37kPUbE24uwV?=
 =?us-ascii?Q?+qyo8yHdIYnjqf8WSDPbThedWbEl6n4RMIIDOlNgcnYgwV2psb0mPQqoFWAU?=
 =?us-ascii?Q?S2DOawUqv0IujfPDLoQvxFk6mjTpsC55c2mswIKnwPOPhjT3O0O4/bM4yjnk?=
 =?us-ascii?Q?LLG5NxTvJvBa+NKjGIM5sGtBYhXn6Jsy+cWVO3d6CtbvGCTsbUCOeAp6zFoy?=
 =?us-ascii?Q?ptU5h4mQZFD05q0YanGCX8fzddodvErs822X7LrvqLxjBPyePRBjDpOqeSJ5?=
 =?us-ascii?Q?ebdw9iSlTBqnXakU9VXWC5W4+dbFSdk5A9e/aXIh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c19fe87-e264-463f-c9a5-08ddbdfd318e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 08:55:31.4973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSE77NNHNxW6hFm+tjQ3EVfE5BFt5mVJguhOM097XUCG8FIC7DFN9MrInMq8fXjiVRCqnGPgvk+BmbU162TOTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The sysclk frequency can be calculated from sample rate multiply ratio.
When sysclk_freq is not configured, but sysclk_ratio is configured, then
calculate sysclk frequency according to sysclk_ratio.

Apply this change for wm8524 codec.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index ab583b432c60..71113886e494 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -63,6 +63,7 @@ struct codec_priv {
  * @sysclk_freq: SYSCLK rates for set_sysclk()
  * @sysclk_dir: SYSCLK directions for set_sysclk()
  * @sysclk_id: SYSCLK ids for set_sysclk()
+ * @sysclk_ratio: SYSCLK ratio on sample rate
  * @slot_width: Slot width of each frame
  * @slot_num: Number of slots of each frame
  *
@@ -72,6 +73,7 @@ struct cpu_priv {
 	unsigned long sysclk_freq[2];
 	u32 sysclk_dir[2];
 	u32 sysclk_id[2];
+	u32 sysclk_ratio[2];
 	u32 slot_width;
 	u32 slot_num;
 };
@@ -176,7 +178,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	struct cpu_priv *cpu_priv = &priv->cpu_priv;
 	struct device *dev = rtd->card->dev;
-	unsigned int pll_out;
+	unsigned int pll_out, sysclk_freq;
 	int codec_idx;
 	int ret;
 
@@ -187,9 +189,14 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 	if (fsl_asoc_card_is_ac97(priv))
 		return 0;
 
+	if (!cpu_priv->sysclk_freq[tx] && cpu_priv->sysclk_ratio[tx])
+		sysclk_freq = priv->sample_rate * cpu_priv->sysclk_ratio[tx];
+	else
+		sysclk_freq = cpu_priv->sysclk_freq[tx];
+
 	/* Specific configurations of DAIs starts from here */
 	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), cpu_priv->sysclk_id[tx],
-				     cpu_priv->sysclk_freq[tx],
+				     sysclk_freq,
 				     cpu_priv->sysclk_dir[tx]);
 	if (ret && ret != -ENOTSUPP) {
 		dev_err(dev, "failed to set sysclk for cpu dai\n");
@@ -799,6 +806,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
+		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
+		priv->cpu_priv.sysclk_ratio[TX] = 256;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-si476x")) {
 		codec_dai_name[0] = "si476x-codec";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-- 
2.34.1


