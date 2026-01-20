Return-Path: <linuxppc-dev+bounces-16056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15144D3BE0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 04:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwD275GfWz3bt7;
	Tue, 20 Jan 2026 14:53:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768881199;
	cv=pass; b=ZDt7UVxPqjWXszWg7hvE7uxDJvV/SwrJMY3zIB48kYZ2OdslbzgW4QqdDsHzHQ/NmLTKFddh3Zoiq1Rno8jIluUDpEdW6d2ws2YUbyCAZLGnbxPS8MGr2dqEb3Nwll+a0wAc3igT4yYIqK9Rw5TRMx3FHQqbTFbNwVoApUQF5Nl175oYIeT6ou2WLLClvpKDwJs6hYwh0fRAmCscvDANdkt887cUTh1aBcNY32JqSRCiBDC4+Kt60GHfSM4uewPU3N0nKqdau30a9zlbvH/d9Abcumqx+nQ0gZXiKYj8Cc3kpaYcD1Ohvfv0GXrGoaub6dK4Y31wA4A+Aqwu/ZE1fw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768881199; c=relaxed/relaxed;
	bh=cKaUODW07i3H4NBeykec3trPohtwhWU1Ohn/fi/bR4s=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N1AoLCbLnB+AduoEo+gHONukEhC0bsSYeVzbShbrU1l645beIbBaObPzfCGZRy3hTe05yeqbHzO67ZzFUndmbASeuEWaaboxGZ//OGP7Wk944OTYAgH0BadFMI+NpQPJTIpUqXo3HCY2CE1rA4cJdG27rzZqZvfip6jl/aU/vwmlB7/tlczO9u+r37hyBYi63dLNLEtuvqhTLcnAqthmIId3EaxG61V/1rhjnqLDAmdi3/0hMA9oAdhiQf5QHW3wj1zsQ5j5SgBWcfF/gOe9/RBvWsIgq7yi19B2FEnj1f5vxibtqvjmx498qyAMk7BOqNw4JtpPBa319/DSNpHdEw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SZCWFAyB; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SZCWFAyB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwD270KZ8z3bll
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 14:53:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJEkqmIR1Tr7AJq2DM7WwoROXPCp2TTOfm8lPxs+1kb5EW00bV99CQCWppMkyorCF6UG7qAgNCoA7yyvGN1IYr9XFypKOaCCJfVixyH5ovIftWyu1RXpqyBBEEv4b9xYv1NVJ+U5bujEICFIk3Newzo49VM/ZWK675TaPoOysMFb5X8+Vl81iTCs6ZRgFRmvsGDzgM90Xcm02kWaStGaRLXQByLXcQLu8M4/BJUGv9o7uTkk/Dkr8Tlmeltu3w9nRj9fm57dKPKUCtiZahPqYKLn10zobf6AbfoaFA5etGgbHM2YPr9hyyY3YvYF0IqzquKCtO5o+m/7oNGfc1m6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKaUODW07i3H4NBeykec3trPohtwhWU1Ohn/fi/bR4s=;
 b=IlCm9WdWwa2DN1ygNumbgjLORxuXWZsCS9ZxQQPYbn1cYKu7d2c3cPW4yhg0Z1n7eijTzGuRTkPQLQYyirTOnma9nyX+A9RwySTd2bl9rDBPTrJRXxGfa23oNMV2SR/Uf0JMpkwchV4KUvFCaKDWmKQTuR7mQtZGwPxj2C/tdbBB+/+xeYZeh+V53M8Az0pB+iCFmPpiSwjjn/ENtb0ek9bEkDFCoxFC3FF35SJe+uSUfQ+fLFL7AFC/NfRukpRLY5xomF320uBJ4j9Z6MPeqhfOhhGsfQS7yAjeRjClkX9R3OBNcA8s2cyGJZJgVmPZInDdDCgpHOivZQ7pik2gZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKaUODW07i3H4NBeykec3trPohtwhWU1Ohn/fi/bR4s=;
 b=SZCWFAyBBZses4BIHSIXZijWo8C6v0KJY1DxxqD5kD8CNK99JiODCulziUJ0tXQjopauU6Lr76moAhy1Ebsetd78F5rOl6e9zrMcoqJywvd9VEM+n5ZeZvCiCI6Jc/yrwnhsB8+YLD9B03JWoyJURj4ERKGMbCKT+Yqq6P46l8Rs6QFL6vOzwohT2J8bh42UtE3+KYGRC0oJ/UQ1+HU7OQOvyOkzVCI3lgMCTLuLf3OzZh46h/ExVAlAVsVa5ipmbHPw8jmCFqCcB3blVDNs7RUgs3ARXUg7+vLMFSbRbwRFCAHOaArm5A0UCZUuWdT0y9cUYruDvKaoL83XdcJFSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:52:52 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:52:52 +0000
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
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
Date: Tue, 20 Jan 2026 11:52:07 +0800
Message-Id: <20260120035210.1593742-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aed6d93-8564-4598-d1f3-08de57d762c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vSEitrzOLyIttTja/imUJ3VjfYM7MDO57UpvKMLQnzwmdrjvPI0ZRgW8r3Uh?=
 =?us-ascii?Q?Jycd+Xx7sCeZmmyK8WSBGsmOaHNbQbRl2/Kf4FItcqPvVWutIrqpHMnoTV61?=
 =?us-ascii?Q?js45AZvpujiCXtXyEkNRmGh+K1VhN8K8W+MjBukrTtxXP3eMX/U82rIFby3D?=
 =?us-ascii?Q?njAYtr7/JMiBHUxCswkwRy9fM+ZVcqJwQz34gafekempVjxmBazSXOPzA/cF?=
 =?us-ascii?Q?G0DkUhRA2dzwq02xXztZmVaJ0hcuQznBvGnVRDCyorm1l3Z2Q50XTO4ZrP03?=
 =?us-ascii?Q?x9Z/KkZDyfLK5H9CfQMoG+yuRW6r65WXQCnCi2VsE5xL3AzWbLXvlmNyPbBA?=
 =?us-ascii?Q?OJzRkE9L4jk2etmMlKOhsbkPYEmzbIwvGnu9NxRHD4D7R5EKbiZ7/O7TZpJC?=
 =?us-ascii?Q?y4VI/I2Mer89yE/CFjZG7oI5N3mZcgPNd9Fr7sOMzsa0KyWm6hJX4hV+1tLA?=
 =?us-ascii?Q?Er6PQH8JNrmSo0t/sxVbAu6B0JLWN12phQu6cmVftFbui5NosalrwNMYYe4x?=
 =?us-ascii?Q?zBVY4yzsFqDXY1M9iaVZeaT9gW7ZoQa4lx0XKYktkEN4LP4a2CrfhyVRkDHS?=
 =?us-ascii?Q?64FN7T7WGzqm1bEzYGKkdITs+3YBA7kkr6vtof6yhTc3UAnW7nTmO87EVJxx?=
 =?us-ascii?Q?B1yWbYDChOQXOPehzjBfn1OjA9KvZObcGaSopB2iMHSFjGTRHsx9H+78vaw3?=
 =?us-ascii?Q?LBv/9aw1fqDU5bWZCE2j9VWsxtXlP25u926Oj/yv2SBzfPcWjIMg+ZPNm3ja?=
 =?us-ascii?Q?Czi4xWt7R05NqVhIubDbNVJ69CZ5M7zpJ4aOaajTUY1UvgfIZNtusxBy03yg?=
 =?us-ascii?Q?Wi4NtDb3eVhnmFaXfaGbo5nP0BN74VSzKjt4TNSPuz85ipFP90l4wTfnVip0?=
 =?us-ascii?Q?Anf7EJZM2ghhPtv9qRg1EXm9o2+HyNv+HWyriEdxznLIqNsXMcZQliICzfu6?=
 =?us-ascii?Q?W4YXDF1eNmnB3El/Ah3DCiAZ88hK9sIevYNbeZpqneb7Pgo41nApbESHBtD/?=
 =?us-ascii?Q?SymCM3ukeSMuIjBjq1+HRIDD5BCi+UzoFgrSgTtYdiSjrpK855y12Jx8X0k+?=
 =?us-ascii?Q?4QMuVIK4XXZ5X4zMw20cT8xFyNFEEVDe19YlGHzZFcBfhmD6PgOFMrehstQZ?=
 =?us-ascii?Q?HOvWcfVNclRNvP0cpgfMEqFH1x0MNnJMrFsZvEjllNlVtVkT8yc0ZYLF7fCy?=
 =?us-ascii?Q?GuoClQ9smRS8ZpqUXC0xJE07ZKFc3CQpbN0fKwwowtfecDnO1Y2V/lI8dLRc?=
 =?us-ascii?Q?c/uOnIBzOR0ENUp9eFqhsyiu8FRhK495ZqLCvuTma8xEytzpPelJo6uSoZg4?=
 =?us-ascii?Q?B86FuTVMhAOPqnW3AhYpFkhi3pjx4qlaeCan/J2oTh45CuOXnDQQt45POBbE?=
 =?us-ascii?Q?jqslcASSVUCqbdE5k2Y0jHRsVWTOWmGq6ffQcJPlOCF8IXi4DNWDIl8B0bzg?=
 =?us-ascii?Q?jSiYiZtn4P4AKrIK4MtRLozl8I3d+HaaZ8o6OAl9EUVw/wQ997VXd8F4nw7o?=
 =?us-ascii?Q?HTnVDoPm6O6H9IUjXEqGA0Ew/DuDSfjiqQc0y+8TGMesc3neNXsEYmII6FQF?=
 =?us-ascii?Q?6oetjeQaB+MB22OEEbZcOFjgAEhwbg5cTaABPhV3L0Xu3qH4h0Feay9iAcmN?=
 =?us-ascii?Q?HFlqCVSl8rtYtQpkUvYsI80hhdbXuTWA6mou1x2yvb8j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eK/ZZV0QoPZaxa2xMQ/w2uEYO9cnTuR34pCo88RB1qM7cWyoP/t0OlktX7u9?=
 =?us-ascii?Q?3nFh9K+uCB05tMCMESeao04kENcHYRh3ts6hnZJhkLwLgQExViADb0+jKEpJ?=
 =?us-ascii?Q?Zvjiewh7eMdwd9sxBJSQ+7G4LWAHJMFsWqJf4fi+eRVpPbD7X4fNQirPwmpK?=
 =?us-ascii?Q?rIcNyARJTahnS1PQo2RTcUqZO/Y9xvv8FdmZhGdA+bEF967A+Nc48IecdgrE?=
 =?us-ascii?Q?mqqnIaAimN70khp0OB+0LEKdkhualMGxClvx4wp3hnvICyDEy5+3N0wLiGpY?=
 =?us-ascii?Q?QHI7w89qU8bYwQOwszy4jds+M+8qd5C4aFSqVGmF9oJIEK+WMpvSVTJxJ6mg?=
 =?us-ascii?Q?1xbEaZdFeklPDZIZbtZZFQusl5sWTXEIMUIWK7TMWH43fjDgLBPNnt3+NbKT?=
 =?us-ascii?Q?IKE8mWVN6WwRFYj3DM/6fmnLz/zO7LslkvrEY1bhsDUvBlTjf+DWqj6clTBU?=
 =?us-ascii?Q?7wqE8JZdczIHdNtC08qcbk+HVn1gNTLLI8C9qQHdvBTIy2PXjNDr/hPTavFR?=
 =?us-ascii?Q?maS/rXTzKDJ4ywVK990axqL5FpKwY+ZWu788NNmofugb2Z5vNs9Dmg9w33xr?=
 =?us-ascii?Q?ikyC2WMS9KGMlqq+WSD+G9cYaqH83QxogZdqrpUgoE3cXExaRsZKVoOobL8q?=
 =?us-ascii?Q?veOdtHyjM78OvH8tSRWTGm0iVOMkiRNwnDispk3oBuuztK/M4/TpAhIyTou+?=
 =?us-ascii?Q?cAkGikM8VhkyMfkWkry96T0Yaz+2uxqeyjQTaPuK81BGKEADUF+g23BNrCv0?=
 =?us-ascii?Q?At8o70LDYXKyGt2wxoCj6n3dLchGgE24kWDigijkWD5iRziVLSzpI16D9k7O?=
 =?us-ascii?Q?5EqtDTapbkSEE8v71VUcpo0LEPNIcPsx8TwswTzrRB/E5kcm4AiZOPzOqP3U?=
 =?us-ascii?Q?3OkOGbCwGt8X6AByeCZ0lPnb+7edFMYJTqjYKbgFHQAPQC+FKAwvT5BDmfDv?=
 =?us-ascii?Q?L5qaP1AJlZxZ0sZkEm2rC/vnOFJHN9V1irtj5P0KWlwRVTvxYHcbbXy0ii3m?=
 =?us-ascii?Q?oPz4Qq27YiLo6Rh05jw4Dil5GjCbz7TewyEWbjb74N3y9u+46pyCzahIq8ph?=
 =?us-ascii?Q?cqpCEwI/78OmV5AFwUfbG1CsMx26RshoKSdCzS1acfNCoJ/YiUSP+8QkeJH/?=
 =?us-ascii?Q?2b9FGsShMnqLnsgXrAbmTIxeWSKxQpH6UQMKft2//dWda+jBBzOiz6bxD1c3?=
 =?us-ascii?Q?5+WqHp7CXH8ZCvEl+ggXePhQ2y8bma6nKE0pgld/HzswSxXe33SeNviaftTm?=
 =?us-ascii?Q?MJoBCMGGwHJpPK2rvjtbuadx8JnEhrv6cj+FPy/DN661LfNeqot1PHTTNmwo?=
 =?us-ascii?Q?rXc+1a+txQx8uTHdCcWV2aBctveITDrCzFxZu6FcTo0dEmUC28cA01StIPrl?=
 =?us-ascii?Q?4vcaOZhVGJpdCEnkw9w6H7SEcnucnDTzR8Td35rRmDxnX3pbArsUWZBD8OxB?=
 =?us-ascii?Q?wHfCNhkwz3PgC7tdD42+g4udhhllzddWu6LrbK/NYxME1tlyAOIVjGL1gQWe?=
 =?us-ascii?Q?whHtdIdJwjtOaHGUffVu9IpbPi9u8DSv8J+3IYhoH54Dwzh3s1PmuLpeOK9n?=
 =?us-ascii?Q?ttTda5IJ9iiiVxF+8FtbdLMVjSI7OX7VHlzaM+QyR0LYPVbvsMDeYfGolucb?=
 =?us-ascii?Q?9jURw0oHJi9VzZgljbLbrXKtr++9871NGPZ/TexRk9wxZvs8gpyz8mf2kF38?=
 =?us-ascii?Q?bgJwQBpqF5D+zX7G1CkT5tv9oYKQCIxnS75Cj0iUn1k/2j1kZX2FMahJziOw?=
 =?us-ascii?Q?+TzlLUO6jQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aed6d93-8564-4598-d1f3-08de57d762c4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 03:52:52.6924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aifXsu74ISQtHOV1HdrKvXM7CloXAj97vyCMyivRqWd2yuiVmKAhwRCpnYolVnfscqzGRZAjb3WSmgC0Rdm1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There is no power domain defined on i.MX952, so make power-domains to be
dedicated to i.MX8QM.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,audmix.yaml    | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
index 3ad197b3c82c..07b9a38761f2 100644
--- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
@@ -34,7 +34,9 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx8qm-audmix
+    enum:
+      - fsl,imx8qm-audmix
+      - fsl,imx952-audmix
 
   reg:
     maxItems: 1
@@ -80,7 +82,17 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qm-audmix
+    then:
+      required:
+        - power-domains
 
 unevaluatedProperties: false
 
-- 
2.34.1


