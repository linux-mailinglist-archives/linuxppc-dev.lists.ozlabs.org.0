Return-Path: <linuxppc-dev+bounces-6673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF9A4D506
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 08:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SJc2gQdz3bqp;
	Tue,  4 Mar 2025 18:40:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::60f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741074016;
	cv=pass; b=QULrj0Y5wR4DcCc61N3LaouUUJnbGVFwpX4RA0HceJ8zwM7H5rJ9Vvlxgo/UurmD2ivjxaxCMIOriwQyGS+Jt8PRzlKsetX5vy4JQJBMcf0hYvezez/XVd6Eh1XF+cqMslSHT6GrJinbx5oposkDgMI3eMDj+oqIU2I9oSFJXT7A0NtCYiTE4Gr3Rua+tjvqKln3F9R7VE0r1/gVWQ6VVzpZB2sO4IL9ZP7UwilRNYQKID3z9ZfIuDx73V1686KjcTjVTzHze5H+pmuXTl4SAleMBka/S9064qaTA07fshb0mFt28QxTM7U7LMn6SmD5JpXkwnolQAyeg/DV8O4q9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741074016; c=relaxed/relaxed;
	bh=TG/uE1RncJyCkIAfdm176LtHy2r89umHjThLOCOpG0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CyVUaOtmJetoDU4nOCZELKzbtGI3C6MKxjekGHcyKJqKpKWbnWkvmwf7UplyKP7/nhyJfPSj59lr6O5GbBJx8BNFzTPoDLu2wzw1d06vAm3n3xfsnGM6v4vcwmNhmAQUX44BuzEmIQsPXBx3zQdx6cI2dlmLXGxsCPp7S9flE07V2eMh3Z/rbplZuaFALsQz1BC9pI+cJfJ0O+M18VjTRn7Fo/byqBp9ENxQA5eTsyU9IrEuhdPLE3+y/gSZnHxXB8jfb/tgFwu09GCwLlmLG1xQoziJHp1LUMo65F2RGzj8cw6PnctEveUX4zSl++afEv9Yj8eUTnFBnh7ZrZv0kw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QZkE87m9; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::60f; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QZkE87m9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::60f; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SJb3vq0z3brm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:40:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJnOObAUEmEkQLR4vI9tbbklMtcS87i2ie4p7r0BRANpUCuvF2nHXkM/9E6P4ZyGVEZNFLAQDh8NtMgUr6QD2RmzR3Wz8gEgp+DGLK1XjyoB6moSxXcBj51uzeIqBbAfHD1654Ob9E3Dwu5e8NsmkZ/g+fZNBuPYRIHAoilQo+nQC+b7ISVBzXae0cFje/WDxyverX68AIu1FW6Co0sl0e44I2hibuCfYfKHLHadOpP6HjRhn4ftc5oOisXu7cT3TO/RTBPVNJJuCXJvR35MZ0YzCkGFGeFLQvpBrt7g3xPofXHaHn+B7X1M9l2zvnI9G9e9yJOh1wdSWrYTF6XpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG/uE1RncJyCkIAfdm176LtHy2r89umHjThLOCOpG0E=;
 b=vv5YtseCxGsF0EwiP8a78xZTb4dBmNolR/IdEw0sYfvbrDzlFHrmYoIXqikAEUhf9+HyrJ1zBwzpFD1s6fo1bILHSexA+38LApiCzMzzBe+IFKX3PqUeGtL0lwnu3+ME/6kivAGpyq8HLb6Ye1/Z0i3dW1kAn8GlOOypTaqC/tcvzChduLSK6saiCkeCtejVqP64YQ14IJtGhZlgiZLn8Vcd7bx39w2lhBDFB21x2ijpFnQ4Ovc2kMRadYFx+Q6wfNU+MT3dszlGWCm+OusUIfTO79F0QZ8fsgtZveowTrrmTOS4dlrDptTZ97JBi4+BxluBkzL7IGKRub+SLJ179A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TG/uE1RncJyCkIAfdm176LtHy2r89umHjThLOCOpG0E=;
 b=QZkE87m9Co3b40DYutqm3z8nSIP4w1sHpY0A92pQj+wh+7f+B687BHjIaXK0UWHV4Tonb+7J6/LeOGZwsdKPtFITaT+Ebt+K2Go7baCFi2/MXyzf+ygYXYGwkTKkDqJhOEdRYY/P9tnZKcAXffRGTRfQanm+8KiOO2WmAE4TJzDg6ZH1IIqht3fSQa+uFZtOSeoHaJOGm8GL7+m05yV4VbF78QKaxvHV9O9jauXqb3xYUab7k6iWU0p+B50uN1ZKLfji4ghNXzcFhEaQeAbaFXz2rFSncImc611vQNnCjYSMfduljvZh7/81trc7XprMGmb8ybLmsOEB/lh0wHAH8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Mar
 2025 07:40:08 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8466.020; Tue, 4 Mar 2025
 07:40:08 +0000
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
Subject: [PATCH v3 net-next 11/13] net: enetc: add VLAN filtering support for i.MX95 ENETC PF
Date: Tue,  4 Mar 2025 15:21:59 +0800
Message-Id: <20250304072201.1332603-12-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304072201.1332603-1-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: e92011c9-f6dd-4a92-623d-08dd5aefc944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wVkfoLRkb/JRCZOsfeLs0jdsWg2FeQStfwU4HAmqvljStnrAo1IDoKM8BMtE?=
 =?us-ascii?Q?yBXOn2bYGllAr6hskxru8vr4TJwajeag5G1vr+SVWC+3g+NnFI8hNC2Pp1Bu?=
 =?us-ascii?Q?ZkIBxyUTx8OT89YrNlDUZPDixzgU7Xuj/paV/QuKjMT0vzhVO1c3ui1ZCpfP?=
 =?us-ascii?Q?B+eG2sCwMzF3JEsN0l3OQKcptvwGSZ/48Hn5pvmnu5YSoj6HeKF6bWvgK2gh?=
 =?us-ascii?Q?HJYZv/sXVcZrDU0BJh70aEsSuKRk4exjQO1SBKhL/aOyrQxlC/jpt5ZJjr5y?=
 =?us-ascii?Q?OJRGBZAqpQf/olCoz3ZIFMSPpaQv+F7aIN0CfVtleJsxGSUy2+MwKc7T+gRp?=
 =?us-ascii?Q?6YHDQQOB2Ej8aQjfxRCxdU0z/hzpgj9FdpZEE5zafiL9ENXteXuTI3/9ejA5?=
 =?us-ascii?Q?LBC1ZDLy+hWc72oo7LXw+OOz0epkAUk+9qSXIxrFmRgLU/BfZJlAhA2YJwdH?=
 =?us-ascii?Q?Vwd15mugPHfYuNsDpacJp5RzA2471HN7NjBZVG3G6ooBVMn4w48guUtS7hql?=
 =?us-ascii?Q?Yo8VsbWx/ufq+XvAGa6EduVQoV1NaxKXi4vBDpiLb8rqQdmz+ctijsKB8tCR?=
 =?us-ascii?Q?AMU3RmFPwfyPAVNqvs8FhR66oov32eY8Ya0S6+z4Z+a9yKV8KstuGMdb7vTy?=
 =?us-ascii?Q?V1tkx56QUtMbYQAGsSLJ8i09wTAC+R/BMZFlwFh8XORzYtNs5LNHodVnLO+J?=
 =?us-ascii?Q?wHGVo4jwzmpArDJugR5naQDisBtjAeMQ5qxU0BWZQt/FnQiI+ohBIUTJ0rhM?=
 =?us-ascii?Q?jliWs3v9z7+UfStEaKagBoiziequdlQi4Ge3xXyWs+q77gJVyDss5U4YmoZ+?=
 =?us-ascii?Q?ULI6LHjZkKW+R/uJkqrcOC+duXufQLM9mlo9VywzK3sFji1EiK0Gvycd79nM?=
 =?us-ascii?Q?9bs07qfbZF2azl748qiWIi9I5vlq2J+iHjfPMOJLcowi660e7g5a5045fqNk?=
 =?us-ascii?Q?MA9vkPPsnM6lpKRgsUQab+Q7oNgyfZgaN9DF5ZvRieUPEWN+aCu8jXq5LrYD?=
 =?us-ascii?Q?Q3Z3NaUxRI+h7XaayALDIOicUxPuFUMHUx+BaIRIPKsOOphhlWkKad4TBaX6?=
 =?us-ascii?Q?wyzBaVv2pbSQwlnf8OjQc9t1qaxA3HZZMorUlxpckfn2aXu7LOAE3o1pzNrH?=
 =?us-ascii?Q?+xLlPV4S8Lw5iec6GrrQCGCGpvJNtDYbimBJ5eW3OkiVOUqaaGXe0PN7O6Gp?=
 =?us-ascii?Q?7aOCAIF6A0yDmbcs79rZiEkM7806Poi5xCG19lrCQWodyeGBmzk1UNU+Xmdq?=
 =?us-ascii?Q?C0oSpda3j+048KvNxoQU7mcxygDCW7hv5NLkRnEfvln27rf0D+jKS5KPyKDM?=
 =?us-ascii?Q?mm0ArFhb+1PSeeZ+6jff/zNf0kn9GuUmVFJOIoeyFELxYP3yHhbByPW3CD3Z?=
 =?us-ascii?Q?8RGhcl7TuaKPzZWKbdXgdj3ghBDz2qzhosZgztrlWxhI8pG0THN5gxwXjpx9?=
 =?us-ascii?Q?CIsiEXyd5gD4CDx2JZK1+tqVl7ayw7VP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eS35H0GfR+9JdI4hSsYBqRBlmLi1eZl1cksb49KtzIqCYMTWHr85fhB+LBpy?=
 =?us-ascii?Q?7+AwTgV2q0ww9AeMzin2JnA4gJ5Ga0JccVIAboepXTKFFzqUpL5EFLhrULm1?=
 =?us-ascii?Q?PwJE0zudYxgHsQcUx6/prgUBore78Rw+ihlG2hW0YWJ4nS2qPgYA4/yM/7wX?=
 =?us-ascii?Q?VwIKxPQYY+iGemDEAhmRCt2crGQhKG21LutVMDklxXnKoJD34MH0qo20xpQN?=
 =?us-ascii?Q?RW/unDu2H0tguY06UJRMqO0GPRMBC4WLaHQdd4WVFOxIp4UO4oNgKY8lBekg?=
 =?us-ascii?Q?pQyGuLZeWc/EsOJE+y6Hkv9UevzYrEk/paubYTZDpmEgaT2CLkIta9Wr0Fux?=
 =?us-ascii?Q?74QMcl7bASzB6EKmbR4jypnR5Z1ZMCPq7yhbzm6vSX0Zq3dhGZUUuKvSlz58?=
 =?us-ascii?Q?2zOKtdyCPAQTMOZzEmkm9Bca+U9laOcq5dzHm5Pf42+wxoolKqhFx3jNnif2?=
 =?us-ascii?Q?3ihm6n48IG+3Ef5/lg8ocCwmbKFTm+Xdtpb6Yjdonsytbncwhj3FOV0RjFyi?=
 =?us-ascii?Q?bdolxpZXY7g8vp6eJDH3CIC/v7HaD1e1jDw0blRxcw7ljJbxRn/4I9oUTuAv?=
 =?us-ascii?Q?9fQ6EAifxAqIkIOOwoubyJpPk9mW4LUzgVhWR5FNEkqi2QHwOIZ1T0G2oJSF?=
 =?us-ascii?Q?CnVXHyWWhoUDVaIMFtKSWXuEYbvf3BUsvkeyT82ZCYKW5gkLc3j9x3ujuCDh?=
 =?us-ascii?Q?2kJ8GroTmbqS7zJTqfD5KYRXKQGQ2UPyEQbCsv91k+CQy4tq2laBg8P3X7i5?=
 =?us-ascii?Q?2ehov/M9rIPxIO4MlSqJSHwCwoqMbY1o+PfNel+AkbOp3GGqjvAyKgfpuUhi?=
 =?us-ascii?Q?2+p0vlJC37fVXPjkv0kQfAYtfTa7KfeMy5l15rHTjkU8hl2o9i2X20BMOKgQ?=
 =?us-ascii?Q?mArIuXUTcWLqp4dgn0JDSQbC4AHiu2P4j9PQVIdHJf3BkiB294y8WY1Qra1B?=
 =?us-ascii?Q?w1LX1oZo+JwDt2UB++0SfqJMCcHGj9wBmV6FkwDv62SS5gxrxkHv2UExr9YX?=
 =?us-ascii?Q?rOI9/PFaGbfMmOjJ1T6ajN7CxIbppLLTgUVI+yq+ndMtYjBZbjC2yiX/gOi2?=
 =?us-ascii?Q?wLSvEjleI6jojsz1T0TRmbhmKiG3d2oR5v9pNVzCUiPVohksOvlDkhEik9bz?=
 =?us-ascii?Q?40h+of7j8hWI7rd9WtWoR0prVUfsgExrt5XsQDD6f3rZ6UkgV+kW86bA1z4I?=
 =?us-ascii?Q?gffLFImNban+BLtq6U2cwKH5BtHyftowAkG/DtY5kIkv73Kcr5/iXyFUiB9u?=
 =?us-ascii?Q?pQwxwsQNeDaaeaoRt++AOyuwcIe7NOYlLcsx5XxeoE+Pm8tp7+yRXlooU0Nc?=
 =?us-ascii?Q?xBHzxWT4HPQc7o0v7TsnvqcQQIIDChLYG5ED/nIlxPgtHgMcvaQDRJfhjgUd?=
 =?us-ascii?Q?FQwsR7/k7Ll2El4IrVRbPN7y3/Lkvpunzp2+Ksve2QQz46jYx3UkEH6ReExH?=
 =?us-ascii?Q?KYTr64uyKne1bau12+w4f7b04PUXHE3opGWVr6b1qe5mTeiNN8sovkuYt3Tj?=
 =?us-ascii?Q?sZcazR4oVuB9vC4mLLbMVhUdRkDWnkZfNIa1ZRNw0Cf+IDZdkzSQv2XzqGF3?=
 =?us-ascii?Q?a6AEBqYb9GCSUHABUJB8fGWtFNzr0ioVs6Vg45S5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92011c9-f6dd-4a92-623d-08dd5aefc944
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:40:07.9643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCj/imYcN/36AbAOimf6JiqIZoP/o9Icx+/xXD/sN7Hap7D2wDTn/rxdp35m+H5iSFqKWtwjzYikIHUYaaEhNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add VLAN hash filter support for i.MX95 ENETC PF. If VLAN filtering is
disabled, then VLAN promiscuous mode will be enabled, which means that
PF qualifies for reception of all VLAN tags.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  4 ++++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 20 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.c         |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 826359004850..aa25b445d301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -107,6 +107,10 @@
 #define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
 #define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
 
+/* Port station interface a VLAN hash filter register 0/1 */
+#define ENETC4_PSIVHFR0(a)		((a) * 0x80 + 0x2060)
+#define ENETC4_PSIVHFR1(a)		((a) * 0x80 + 0x2064)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index adaf28fdf0aa..e08d06e22898 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -101,6 +101,13 @@ static void enetc4_pf_set_si_mac_hash_filter(struct enetc_hw *hw, int si,
 	}
 }
 
+static void enetc4_pf_set_si_vlan_hash_filter(struct enetc_hw *hw,
+					      int si, u64 hash)
+{
+	enetc_port_wr(hw, ENETC4_PSIVHFR0(si), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC4_PSIVHFR1(si), upper_32_bits(hash));
+}
+
 static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
 {
 	struct enetc_mac_list_entry *entry;
@@ -403,6 +410,7 @@ static void enetc4_pf_set_mac_filter(struct enetc_pf *pf, int type)
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
+	.set_si_vlan_hash_filter = enetc4_pf_set_si_vlan_hash_filter,
 };
 
 static int enetc4_pf_struct_init(struct enetc_si *si)
@@ -692,6 +700,16 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 static int enetc4_pf_set_features(struct net_device *ndev,
 				  netdev_features_t features)
 {
+	netdev_features_t changed = ndev->features ^ features;
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+
+	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
+		bool promisc_en = !(features & NETIF_F_HW_VLAN_CTAG_FILTER);
+
+		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
+	}
+
 	enetc_set_features(ndev, features);
 
 	return 0;
@@ -705,6 +723,8 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 	.ndo_set_features	= enetc4_pf_set_features,
+	.ndo_vlan_rx_add_vid	= enetc_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= enetc_vlan_rx_del_vid,
 };
 
 static struct phylink_pcs *
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 9f812c1af7a3..3f7ccc482301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -135,7 +135,7 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
+		ndev->hw_features &= ~NETIF_F_LOOPBACK;
 		goto end;
 	}
 
-- 
2.34.1


