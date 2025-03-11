Return-Path: <linuxppc-dev+bounces-6860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF54A5B8AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:56:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjgS6Z3Mz3bkg;
	Tue, 11 Mar 2025 16:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::613" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672580;
	cv=pass; b=MsHcOunCt0tqK3kFdV8Cq2Fz39Y7grhjg8FFWvSbRIBp6n+1N+rF0r3wwrcZnRWsNUvBHyNrdg4Jo5PVoKIj0cAdtE3Oe/yJ9gmoPN5OmNX0/WGxZY5AdWR1zVvLMVMEAbmdqHqFu7MrWabFgPm/SMjzlCD4vNY6Cbyvrs6ZpD3OZnSfFdYhi49Q4HN1DIBfJNctfXM8GlX5ntVaGC2FXa2Og04o2zvvFNHrune0rh1V8G5QUCL6mlTD8fRCBYN991gi+lRNkvQ2MnV+dQvMZUHVqs3ySWapcEu9kppIIQaLV2eeqbcXezB3mVzazzqv6DYZxvc5MZN7TAttGZAZaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672580; c=relaxed/relaxed;
	bh=A62TCjHpAIowI6C5MOaEaTbqvEa8Jw1SMF6ThCCAVqo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jHpKpY4F2vOm5kzN6H8MydOQLBZ+TzbaKgyV3kKh3cpmfdE6PWu840BZMTeCLiiRAAEsAcow/Fifgo4tK82DBGZ4VK7aMTgxyDwm9ecvBGvpxNrwMYbKYGHWqVkXLyBeUsZuFwkwMPU+CPkkgVU4sa21eFvNOGTYnlmD7VY55xU+NpAw6di7h0HApt9uI4WdaIDC31s93WD89RkJ9MqFnZYdfsNI5tQuMebEzWrw+RSfQaXl8SLAf5LgIRr78lCr+G0b8WxQ5y5q/VbNjl1PX/Z/bYTbqRzp1V0WvInX/i2VAzIqjEPxy5UQ6txE2hBy/b0rHUFCH9Ibtr4mF2Mpaw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Iq/S4jZv; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Iq/S4jZv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::613; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjgQ6FGcz3041
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:56:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhsNDAuTqHntJg7J9ZfVQEgXmXkm8lFDLmy9NayCXhhPzf70dOIdJmVOyzJxTfrLWrUHuY/ekBbOmA0ljgHS6GteJRpetAUUxcyUmyZW4dcZyKBJUXgANv6DocduuaQSJyh5cuaDyDEmQu7+IARlaPkM7PqXUNcYbkLR5HEcztvm12gqvRQk/TOyxxAj8P2iXWy4PGJaGDCoijYB8nHgBqmLhCSOhr4k0xle6gchstleIcpkCYWZ0ovqrVL70JRX77RPG2cOOE6s5Qtnkat+1FW8MYhReAyn9F5mteIBjpqK9/TAkyklgzXhHPVFZ12X1MgRETUGAhUUfxNyb3B2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A62TCjHpAIowI6C5MOaEaTbqvEa8Jw1SMF6ThCCAVqo=;
 b=LdfGY5cEK2VxzVRWT8vVJeDh86ppaWHBfuW96TuXhSqK4lshwyTfPGlOqn1fbNSCnf6R8BDMDN/h6xHk1KHQqE+aPX8+v0am2np1jv282iiZQ5Iw+HuwScxOtJScSUWqbjLT9+JWJrKLDwzmP+SlKVsJEX1iKUhSJZ0itDguxZbc4Qm8ApYvi0/1MgjjTsQhioUH2/zDD/zhtJgxMtxMUbzmVxpk3UyjclUzfPesqIRmBuUZHkq2MLXF9YU6Hl745x5/RKQo7purTuCFcsc1H+5pE1C39aiQwx/pOdREgcx1lHkuOXDal0hnLAK+b+SewGFUA1HCMqDgd+jiFkAi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A62TCjHpAIowI6C5MOaEaTbqvEa8Jw1SMF6ThCCAVqo=;
 b=Iq/S4jZvqbN91t1jAxO60XYFTn5vaVP7uCgVe6Hr9WZr3v3vCSW0ofLQ2FhMqtCroV1CjhnIgcPj44WsezqmXjOv37R++DVO43HX2ATxqWCaMF9qhiqH4w96kiXtegBJzKzgZuczl7lGh5GMH27A5ocYl3abr7r5HKYMgjlp6UwHnnR8Ev6JaJi1HFxYKYBKtxEIN7fkSI4ahrN8JKjwxjTOKmBjTAsQ1wSiN47lIgYOmKgplFZFudLg/haccDw7eDA4uwL8CMXOitQKFdLVzcdb0iZO4N6V+1WMcu+RXE95B8UHZvvwu6wGz9V1I5+sHbpU+qp8/dL4eA+UUU+LFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:55:56 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:55:56 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 net-next 00/14] Add more feautues for ENETC v4 - round 2
Date: Tue, 11 Mar 2025 13:38:16 +0800
Message-Id: <20250311053830.1516523-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GV1PR04MB10941:EE_
X-MS-Office365-Filtering-Correlation-Id: 972477a3-3905-4341-6517-08dd606162b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OD1OuQoqWYLwtw7kwHqQddzuBaCTtjM43d1BIY/oNd2C94vkSKjhI1t/r4hq?=
 =?us-ascii?Q?XpNBq43aoY+e2sXfkfADvvfCetAockMzVGx8nWtHhAYkP3FNJUZdAFDOBjFF?=
 =?us-ascii?Q?UoEFZRYtcrsW1fz1H8v5jsTU3A9pU4FOfXOD+E/I7X5an9QEQQ9A567k6wsL?=
 =?us-ascii?Q?Z2Pstxt+CSY96ne8y6I9f3UaSuHU6LdL+PT1dr1UQXv6FFceho4K9VXI9096?=
 =?us-ascii?Q?QibJ26pb/JIBc8GPJs+MIxNYKfFnrqk57U1moIQv8ICsPr4dMc5fh6jp41hc?=
 =?us-ascii?Q?R8RCWuaDIRbt9O2yrBaZfmYBkqFqj72aaPVLUt6g0K2qeSyN+NbO9MPTcY0Y?=
 =?us-ascii?Q?4BWpOWv2ydavNanuo9zM4tEXgymW+vP1BxdsRsPOEEXCqLvqw2+6lH5OY2CQ?=
 =?us-ascii?Q?3FiCWxOBrVmYX7HxmgUUyFkFVO4AZsIFlSxmAZIy4mktaiY+gIlsmYW5F2RT?=
 =?us-ascii?Q?QDpO8HVwuFvpbwTy9InqBnAJIH/88NGAtgwOiRwACTJ+xOoyDWCPMAXoHW8d?=
 =?us-ascii?Q?NPOT3VTKyknUnCC3msnWKptWsrUQcyCpITbsDVuSiaVzq4qJStvSfMXCr/Zp?=
 =?us-ascii?Q?4sfsuBsBdwN7KJ95+Asn9YYt2qXuQo1YZzAlox3DWkRAWcYxnloIC0wv19MA?=
 =?us-ascii?Q?ll/uNx5CPZosCdAp6pWJfsC32YCCj7/vrsbkabDh7/8kGqaW8ziHT37O6I0j?=
 =?us-ascii?Q?gOx/rCtBerFCSVggpwyahd77PeWQQfYAFGXcQLBwD6J7bUHbSx9zq54aQwwh?=
 =?us-ascii?Q?yUFkZo8/qkDtq1eezpyjqXmDg0WNcb68G2F+cpHtVh84Q7rTcu5/Nl1dUJ+q?=
 =?us-ascii?Q?cmDSQo64y8Yp+9xiIRaajvkP0sYCOsDiLckdRnTQWg8ExJafCmt0rz7+B194?=
 =?us-ascii?Q?T6szNrYCL2AhOyHQJT3jBx3K/OtCdN9cqwwQvpmSm1aGyzrAyyDRJTGmFqx9?=
 =?us-ascii?Q?zu9X2AjbMEMHXB1NRPxiJmX0k+4+buEGiFJ3tRE6RpZVs3JN7SGRSgXfAhLN?=
 =?us-ascii?Q?HCPeIyYbkaD7XBkiJ9qKYWebGGopNnqDe7/z/ux9/pdEvFfDE6TDlRF6W07Z?=
 =?us-ascii?Q?RsIQzZT1G5+d10tasvRSjTDGK8xFW6oH1B8nod6b0RfzqsYj9/fLct0xmfLp?=
 =?us-ascii?Q?vhMcM1zMKBVh7MZ8jgYBQQPiHW+XkHt/hFRPNKWAB1kASn7kgJFadxKXw4D/?=
 =?us-ascii?Q?HqSdTW0fmqC1NYKIdoZbvSlkiSQ+VWfXYlzZ62/wm2zqUfeIKAt+9FfuXXWO?=
 =?us-ascii?Q?97C8UTtncCp0a40yV9juAdyNJW0AvqrgkLIFXWZt5ffC8iPDXZ9k1y6BSMN4?=
 =?us-ascii?Q?pY+zdk5N6efu5sZC1iye3XPE8xFymZuDEURrh/Bim7TUV6Vse/s/8WkkSocV?=
 =?us-ascii?Q?APlnycId7Dr3dGL2QaX38hWuVuYg+pj1FcmsYKcFwJzOALLw7UhPZn5ZEwFl?=
 =?us-ascii?Q?E8oiL2sRdIbHtyKFbbpGTQg29347LocZ1thb6swjme1g5QQTA1Z/jQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XwTWAirVAtLILh6SQ2UMbZhH8SkAdjGnjTMvPpRwHvF7HxZ9+E6KCOfgi1Mq?=
 =?us-ascii?Q?3MafRLjGUag500HKmoHw+vyMObrsNpzbDZD5+RlCoFeK6RbBpt90YSFCdvyc?=
 =?us-ascii?Q?gKVal6HscOePdOHhjOLaWfXq5vWbW9USfQkQvctGx5Ez4ZQHoD3W0agtjq9I?=
 =?us-ascii?Q?Rx/yFXirw7CUuAji5+pbsEK65wZN3FelpJsmx5qwMeJoyyZNuBqcY8GpSwba?=
 =?us-ascii?Q?ZixlGykYKeNvG2cUHXwvE9GPIoHqm09VBHB3mx+Zj6mOySNJ65P/GD+47dEq?=
 =?us-ascii?Q?CcNL6BpDbdLFtYpWa3jdEFi2vrgS/QBAEHs6X/sM2gxc6vNpUzoJY1Dx7Ve2?=
 =?us-ascii?Q?zvTtVpCnQvHLoX0rKjLsSfDVZ9MRbghSZcWm7ma1jUzLiOv/2nIdbQUdajeU?=
 =?us-ascii?Q?CgOTihpIYIPGopAN6a8PyF72bc0s2xoX8KyBT4+rbZDwbHslNW9lyiIVkXsG?=
 =?us-ascii?Q?1eAZjXTvaxX8hheJI8g11Y7pQFF0W9nD/pLeGvh8WXdg8DMLbfPoCURRkW4d?=
 =?us-ascii?Q?oc3DlTTI9xSHHHMg52ydGa/8DVGmUwG7w0Yr4KsvGYkgnfZpPAZxWf06jz4b?=
 =?us-ascii?Q?qTlOoUgjzOkHuH3OolRk+UYpM/aeUXK1ogDNY6/Jms8D9UeRUBtWDKcFMFbg?=
 =?us-ascii?Q?kMDWo6H+iLagfhBwBwx1OZ33vMXNuqI6Ff//gboM2Kwbb/dqXA7DWFgy9c3N?=
 =?us-ascii?Q?dd3TJXYFWu8qFntP3GbfQPorVU177yPqnAtmd0HjaBnHb7xDSSO7sgP+axjn?=
 =?us-ascii?Q?EZSqrf04rc8gCpprINhp2qfvHn67PD//Vt1clCm3nBKDLU9xFjSKS7WRuV8t?=
 =?us-ascii?Q?+mYHhq6oa3GXMspK5BOHOXQqQYEDZdqF1/DnQh7XOoGfIIvLz+RQFcVws4s+?=
 =?us-ascii?Q?ksiyw0Eyka3aZ5C9vvwed/i445/SZH/hpfr3Z7FChOi53HKPO5VWs6JcIETP?=
 =?us-ascii?Q?W8jVA8VnzzrbPcqOkxSznmGwxRx7X/NYUxoYjvLlaXHmcjvsKkyf0gTbUhVn?=
 =?us-ascii?Q?xFKnIpQsCRCpUmB44f0jssQah/HpoHY1uAzHJWi3+Sk1g15dVITRY0svX/Au?=
 =?us-ascii?Q?YkGw2j8iXsg21m8OmdwJM1pyBwx6Mfqxf1PWO+pbL4mBcU/KOfT+L6VEMrD9?=
 =?us-ascii?Q?urBjSGYMCNGecQYk6dfyAmrDs9uJ3TbF1hqvbHTevmf8EzgdgCYjL2R+aUBo?=
 =?us-ascii?Q?QwVEtB1E2+KnQQzG1YQ2uLKSEAMGtHqfbcQbMHAejnSEfhPm15TcJIdNJ/rS?=
 =?us-ascii?Q?k2Up1dgBA8ZCS5MG0kfO03HcXbQ1SDf0vk95BCT2isJ7nc7FJBZ71fhCfsYM?=
 =?us-ascii?Q?RN5g/KSPogZ/3bKSGzoP+2MeLr0AfQ7VDXWcL5KPXvnLJyhaDeRNVMxJ3E5m?=
 =?us-ascii?Q?/FLMeiB9SedjoFck3E5zulaga4GPSUPA5nmtT6Yg3F+q1rxPaonqWHBlBMjV?=
 =?us-ascii?Q?QP14G/JwGBUw4rzOPBkRH+K14SCC8SG9x7ZoH3RKAuTIF3MAMiEsaHXYXDIR?=
 =?us-ascii?Q?XL01dO0DbzEUywDfoUDCroDeHAHLmU9XYeTge5Nmuzqwencs5+9+A5cGz8HX?=
 =?us-ascii?Q?8dNrXMmUOpiqUJcdiU/y9yV0tAH3yOy9+LyGWjDr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972477a3-3905-4341-6517-08dd606162b2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:55:56.1059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJZtlRkpmbHhnx69ix8iDyUtQL8sZKV4R0sLeqQies4SVkuOg8x9HPRqqsnMEZB4K8vH21Uqa0ZjE6H+wyIhAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
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
v2 changes
1. Change NTMP_FILL_CRD() and NTMP_FILL_CRD_EID to functions
2. Fix the compile warning in enetc4_pf.c
v2 Link: https://lore.kernel.org/imx/20250113082245.2332775-1-wei.fang@nxp.com/
v3 changes
1. Rename ntmp_formats.h to ntmp_private.h, becuase in addition to
   defining some table formats, some macros and function declarations
   will be added to this header file in the future
2. Add struct ntmp_dma_buf, so refactor ntmp_alloc_data_mem() and
   ntmp_free_data_mem() accordingly
3. Add the setting for cache attributes of command BD Ring in
   enetc4_setup_cbdr()
4. Remove __free() and scoped_guard() from patch "net: enetc: add MAC
   filter for i.MX95 ENETC PF", as these cleanup APIs are discouraged
   within networking drivers.
5. Remove patch "net: enetc: make enetc_set_rxfh() and enetc_get_rxfh()
   reusable" in v2, and add enetc_set_rss_key() and enetc_get_rss_key()
   instead of adding .set_rss_key() and .get_rss_key() to enetc_pf_ops
6. Separate patch " net: enetc: check if the RSS hfunc is toeplitz" from
   patch "net: enetc: add RSS support for i.MX95 ENETC PF"
v3 Link:https://lore.kernel.org/imx/20250304072201.1332603-1-wei.fang@nxp.com/
v4 changes
1. Optimize the indentation in patch "net: enetc: add MAC filter for
   i.MX95 ENETC PF"
2. Remove pack(1) from ntmp.h and ntmp_private.h
3. Remove the string after "tristate" from CONFG_NXP_NETC_LIB
4. Separate two patches from the patch "net: enetc: add RSS support for
   i.MX95 ENETC PF", one is "net: enetc: add set/get_rss_table() to
   enetc_si_ops", the other one is "net: enetc: make enetc_set_rss_key()
   reusable"
5. Remove patch "net: enetc: check if the RSS hfunc is toeplitz" from
   this patch set.
---

Wei Fang (14):
  net: enetc: add initial netc-lib driver to support NTMP
  net: enetc: add command BD ring support for i.MX95 ENETC
  net: enetc: move generic MAC filterng interfaces to enetc-core
  net: enetc: add MAC filter for i.MX95 ENETC PF
  net: enetc: add debugfs interface to dump MAC filter
  net: enetc: add set/get_rss_table() to enetc_si_ops
  net: enetc: make enetc_set_rss_key() reusable
  net: enetc: add RSS support for i.MX95 ENETC PF
  net: enetc: enable RSS feature by default
  net: enetc: move generic VLAN filter interfaces to enetc-core
  net: enetc: move generic VLAN hash filter functions to
    enetc_pf_common.c
  net: enetc: add VLAN filtering support for i.MX95 ENETC PF
  net: enetc: add loopback support for i.MX95 ENETC PF
  MAINTAINERS: add new file ntmp.h to ENETC driver

 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/freescale/enetc/Kconfig  |   8 +
 drivers/net/ethernet/freescale/enetc/Makefile |   4 +
 drivers/net/ethernet/freescale/enetc/enetc.c  | 103 +++-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  59 +-
 .../ethernet/freescale/enetc/enetc4_debugfs.c |  93 +++
 .../ethernet/freescale/enetc/enetc4_debugfs.h |  20 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  12 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 533 +++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c |  69 ++-
 .../ethernet/freescale/enetc/enetc_ethtool.c  |  69 ++-
 .../net/ethernet/freescale/enetc/enetc_hw.h   |   6 +
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 124 +---
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  30 +-
 .../freescale/enetc/enetc_pf_common.c         |  46 +-
 .../freescale/enetc/enetc_pf_common.h         |   2 +
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  19 +-
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 458 +++++++++++++++
 .../ethernet/freescale/enetc/ntmp_private.h   |  63 +++
 include/linux/fsl/ntmp.h                      | 174 ++++++
 20 files changed, 1702 insertions(+), 191 deletions(-)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_private.h
 create mode 100644 include/linux/fsl/ntmp.h

-- 
2.34.1


