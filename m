Return-Path: <linuxppc-dev+bounces-8328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3FAABD16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBMd5vWKz2xQ6;
	Tue,  6 May 2025 18:27:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520029;
	cv=pass; b=Kf6kECZe4MlTE0CY96kTOsC2dSGI3/A43EdjtjcEZ41xhtAn3AV/BCouIWYf8vjtN7b0kIR9Py+kkST9hGRFOKHFYlivUQVtLVz+6IV+JalC35JbBS+zCCQWlJgEbFrc3rJ/hBWZzM5c4owJygIFdk2oRWVlid85XXVdBH2+pJSEnfYqmRGmcI52aJY7bE0jQityVQ1PWaKE7iLFAQatAKXkZLsgGBdpbntL2733Jbi1HB0xd+3YNNV+OIKE54eY8zQpLWfbIHs2lKVHmuSg90RqUoTkuM2Sgt4jJ26bRMzWapZq6fIymR97VtZiG8L3EJ2Ahc+6HmvQUUh1gdvPkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520029; c=relaxed/relaxed;
	bh=Ihlpw50OqnKKkhDYe1RWoGQ49TMlU69ynlb4QBeC2os=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IdkzbEvpfyo/xRKhlRgodWiAvqw1NYZfCctfckvX6tx+6Z4QBzaSw/ywbdJrX/oVS6CZRGkHmQt6KMn7Sbt+jBBfOyy43ONq6P9//TeQvjX4RTauFk36hWUe6ThP405RYhThq0uSTe+41KbRVkOearPpn8/0Fy/J+areVlUXBRWYnKlW5bRhCFq/nItQ8V2JxF2Xmmb0u28PIMr9KU/esZORrdfGRuBy+lF2ILP2dg5pAZTqiLygDu0NsGqGPWnst87LKadrFtXsP2MDiW9nscnO/jFhw2xmyv3lfgSjT3LLFYLubS+8p2gcZbumLTY+xPaqgX5nBuxcjZWiExHFLg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dvtJUVMi; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dvtJUVMi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBMb4ySBz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB7RI7M0vV6P7Qa6qdX9XMydK4ZpXnnIoYeAYb/G2OTNrhZC67D+Rb3UtQjwT+93udTcb+S44rTUMa9VVeMO1aI5/KPZkKUgvGGjQcWhxweIYjTvIdCePh1Dhfj2pjsyIsadwsGKRIV4oUnOze1/dGD/3rStQZuCLQEqN0w+1IUIyf6NYiKCvCZknYSJRFhWf92w2VGkFC4RAKBDNoHHCEx0AlySaJYVVmUasL7CMW0R9WwPrgNfirs8baEKMQwMijLVLoP8EYzrUwAySQCJBH6GrUo8i+9hvVCSltJayZC+/0JInLRbVAafDV0JRZR0gQ2I5FuPK9mRYBapoxCQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ihlpw50OqnKKkhDYe1RWoGQ49TMlU69ynlb4QBeC2os=;
 b=qeC7BJi380xtL5hY8w3V+tZtr0JClprdL+uTHOl1ZFNEyh1319eyehkcOct2OzV0y7eJMlgoRvRvNIwADQAHXGkIc7qgF4+uPa/WYLBXj1gEwylkbkbRiCB7oZ4HUYXEEwh6rfF1TyXUMas0VYaNAxyJMtKmqM10C/Sckbwtqds5F+lW5JFZmWKys7kK5EztdDzvqHlmDN2x4hd13zyXMKZYkgVOXCamwU/TPuMKhSkoz+mFWdZUL6yn1GC92J94y7Hfr1MbmsZ9G9bTXK8VLO9bdTU2ABo2OW46ywHmjkbhyuxrv+KYIon1c+ibxHwKrQVXYbobUzx3sNRbi6084g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ihlpw50OqnKKkhDYe1RWoGQ49TMlU69ynlb4QBeC2os=;
 b=dvtJUVMieen7RheV8NXRCoPeNLL+V38a5Gu58SI3cH6m+JZLxOJYBk0RO7hy4AOfeBvbleORJLR6B6WZWJSEsZ3PSKPfHMBAac/6hFS7LfbIlXUKb0HKNd7B4nOaTPDFaLqW0eLpr8pROOEX5xQYcjCxKLUuPxjXWMpLHOO9C12N7qwCLBmH91rqUF8C+kPh4n+pWkxnKRoKLr86D6bKo9eN/hmXDUUTj6Qf5Vp7NaG7LU7MV3azgKikFxkS0lk7D/rS2/DLef4DDhgOlzAbtKkIJa/HGHv/pSxAmRefXxXRzxTOkPlaszaBqqiCOr9IQJEVnWZEc6YU5YlusbHAzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA2PR04MB10158.eurprd04.prod.outlook.com (2603:10a6:102:404::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 08:26:51 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:26:51 +0000
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
	linux-arm-kernel@lists.infradead.org,
	timur@kernel.org
Subject: [PATCH v7 net-next 01/14] net: enetc: add initial netc-lib driver to support NTMP
Date: Tue,  6 May 2025 16:07:22 +0800
Message-Id: <20250506080735.3444381-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506080735.3444381-1-wei.fang@nxp.com>
References: <20250506080735.3444381-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA2PR04MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d21be2-084a-4885-98b9-08dd8c77bfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?06TXpRQPcZzIGZ+PsK1G0VRi9HQjgcDvQQXpgCkiOJ2OvCqeWTbEMFRiagf4?=
 =?us-ascii?Q?loBjFfhO8nDK7de+q56o94K72WeHA2dPqEjODVBj0p4abc6TO0HzaCHsDe55?=
 =?us-ascii?Q?tVigRdDXeAj8vDitJPElnQCmLbPnyvKpzWEzG7spXZvz3SLHFRc1ZWiqSeFT?=
 =?us-ascii?Q?WPWkw/D1T3VepQJOvi8tHNgVBKVRD4sFkWPZWlN4zKE9me8a2Z4SQMuDMbuG?=
 =?us-ascii?Q?kdybB8II7C8NrPS+I4wpLQVM9IgRMnlWdbECJhv7RHUUCOGbxubTbmJniS9/?=
 =?us-ascii?Q?cA6ybAO14ruu6bH1LJT2dHcaf1QXK8qhCySIr4CSbEGdcLtXgAOYg0sEpjTh?=
 =?us-ascii?Q?p+/OYpRE/ufyz7aDU7U1mqA1SLYl+7hyyb7AAqiPDLuS10e/817D4hsBk9gu?=
 =?us-ascii?Q?pesAx699qe/yPVUdX+4kikp7eZdr6kweFt8T0NTtDaSkk6t70pSgvVF/SuxB?=
 =?us-ascii?Q?08b0tMew/hWardqvhl5pL+6VlTzyAaSNPPlZY+DiNpugHGWGSVwJCXGkr00E?=
 =?us-ascii?Q?Kdc+emmVux44FBtUVlJCgjPIh35TTUe3bEOJ3SRggsxWCwDn8mTNFerU2kqH?=
 =?us-ascii?Q?HYgruyf0YGrgytgVQUCIKQ6Z0seLa1DdHIw60TGIv1YQ76oMiuZY4qQKO6Wz?=
 =?us-ascii?Q?S6Y+uy9qBJV8huSml36DMgXtJNVOMBZIQUB5wR/RjOtUYkC7mTFkL8SKQCvM?=
 =?us-ascii?Q?TmZfoEAPRoK9hY8nisiLAQVXop0gM4u/MzVgXtaqoi/YVz0PjunP0siqrndY?=
 =?us-ascii?Q?mFTEDOaFSCogiSfAhNpxaLCUwahN+pu8h5lZWrhzDsG5OLyc6jPX19kQboB4?=
 =?us-ascii?Q?sXVllVu6ImWjozVMv5s5FY+ICZeWVDtQZtCpfJmzDbRqOk2uz6d3Zg+T4KUb?=
 =?us-ascii?Q?vc8gMTE/UQXdxCp1al1p/I/tftgasWkQmxH4xwE/tyUTUwxJGOcFd2kMLGve?=
 =?us-ascii?Q?KrDff3h/yfMJETRPsaQviWRIXW3Yjb7ay9OL/y9k6pTEU7ePB9NLFJMEvbD1?=
 =?us-ascii?Q?3AssCHTjuHyscBIn77W7fFwfYlksJZX9s06V1Qrz8iSZ4a6qSkAnkavJVkOF?=
 =?us-ascii?Q?Mk5YX7VAPlCe6+QGK/gGVuRjFnwqsWrI5JaMwymLatBIXpPMbaJPfknLHljo?=
 =?us-ascii?Q?Eh24FfUJH0mqXaUBs3Iv+lMz7ACXze6+ENUUbhHGONaVzhhAuWEcYBEPwsMS?=
 =?us-ascii?Q?VSzobeijDPB+Ay0Dge7BFhBodwt9xNdd9zdSzdRPXuqh6MnYp2Z//PfGGyXL?=
 =?us-ascii?Q?WeSl/q//vWmcUbKBnZOUKJty6FpJ3QxH4PtcwQ2dNRu7SHyzi3UE718LoIBM?=
 =?us-ascii?Q?8sw0kZXQ+Mfmuv09h6lO20odDGEmYN3lf2N4IxiAeNz/QVE99pLSkKgZXWDq?=
 =?us-ascii?Q?No4sfDu+OJY7nQbK7VnmysiBYDwFHsBb1J0KNC66rCY6Fupqv5imSzCqD4mK?=
 =?us-ascii?Q?N33AAO6mU7A4nL6ZtPODw1alDZMQxCCCbUU8SZ9P+WPA+ClMyMzF9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3zCEPOFYQjYIghc0d0RCCIVPNbbsMBEuQVeUxQ/EifllDHrAUH02pvHREwE/?=
 =?us-ascii?Q?NF63LeeCRUTx6HUqgIjJLqthH0P9JZqGpaT3qlCe+AgnP7FraIHta1dSXmJc?=
 =?us-ascii?Q?+3+fXq7UPtovNLwfUXJ28zUQfiV1ohmiQUfxo8iMelKaoCgWEtJDdjARFVWH?=
 =?us-ascii?Q?smtebR5sk+ui+Zcd6QQdd4OUe7Jjy/jBeegLJ47BQdjnd9c4oVNy7MA8LwGu?=
 =?us-ascii?Q?wtdms9Paca3P12xY1O3oZuB97khMVlXdx69yhZZFNktDpgZf+FBQmWDsqYwO?=
 =?us-ascii?Q?1ziuC0mXEmw/nRJ+MKWeZA/h6BGJFd408irvhXWrv0sskiV+4DImwZty76/5?=
 =?us-ascii?Q?vdRERhbKmPDTEPpvYtEBkhighh023BBXv8RIP/00tuws5RC5G4YLeDtEUT/f?=
 =?us-ascii?Q?hDErpy1hOfeXjVQSU3mcOcMhZLdhxCGGHsyGCp+I2jmEArCURL9QxwuSb0Ib?=
 =?us-ascii?Q?z7dfyKOzTURO7CSHXYYsT/bi8t9wxrlHS1cRaeNe7ccw59Q2WsN/k5WX+h66?=
 =?us-ascii?Q?ZnmExQK5/U1XabTvKMV7CN9oD1mpOITgp0yCkym7btE2i0YcVowXZKSSVPjt?=
 =?us-ascii?Q?HlocO2YYUISt3VtK3IG88/D7fyn7UmVFaspXIuCqHLge6LLyx008VNIU+z0d?=
 =?us-ascii?Q?0nfOW/HI0hKhl5DrzPdawPQ9HuOsZb66DEYcDnh/bde6tQ9GgEVE5VpstDC/?=
 =?us-ascii?Q?kL/47XiLMH7qrOKtaIl+LD7mmYlWDZwQy44wkiCXnmByXtdx3AoFV5hHoWhw?=
 =?us-ascii?Q?iM7FJ7z4wIGq6ppIgTS5ahvVWTi5zdcMb5QRWA4tk8rEqjoSaztvwCcD7Yia?=
 =?us-ascii?Q?5xxn3GKlKee8mENmNctkg1wyK5sq96fMRz8f4+yeoasrz5zj/9tR7SSKfPtt?=
 =?us-ascii?Q?nTmorp78RKun6m12A9rzGtGCuZhDsvfPLARvpZaHF/h9EKTMsvrWpsL2yBS4?=
 =?us-ascii?Q?g4wrThjO4O52fLogKsx92TggPmqqcACHWBNs5QLLj0ut644NVUjl7VvkL1g5?=
 =?us-ascii?Q?JGeiudR5frfdwxOFD+X7SJUmYuWcVFDRgvWh7B4Al0FD4gd+H9J9XVVhxH2w?=
 =?us-ascii?Q?K506+q01ewQgSzugFys2k7ar+aYMZyYvG63u6pdTa4KHV2S77S+snpdS+Wen?=
 =?us-ascii?Q?9MnnaERZN9ANqpWN41vk4aWNPwSL15Bt7+atZed2CflQBzTsQLJT4125rjyC?=
 =?us-ascii?Q?50mVKTcy0v1dku82pXueWuvydDTQtzgmI7aS/MTZ1S2QAM7dDH7+NcBapMSq?=
 =?us-ascii?Q?iWoKwXOGnKZ4iavt20HSbwxAtCo3R8tuWvM7MF20+CESMpV0iPyw2T9QdoF2?=
 =?us-ascii?Q?slLwSyT6UdVKkRGiRnO+QgsyZ0jB+dVm6u+yeds9mO7zClJTckjo2TMcGgcw?=
 =?us-ascii?Q?vTeyk1b8HXLkbzA0v/cWoMCR6bdQaLclAltoaFxrg4xnhYFlAUNUcmM6QOWK?=
 =?us-ascii?Q?hCd3YV9x08WMAsbyyicMJkTVF+1CyYYRdL6ci7El57A4AhRDsJ11wBJj4Mia?=
 =?us-ascii?Q?zWPRUF1TYVwMFbMwAI2bPeqvYgGo1P36m/MatI3gn0wEuBo2j3rwjfjoLyoT?=
 =?us-ascii?Q?lNe5wY3A7DcR/CoJD/IPYkHlOqEpjf8R2O74vUZz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d21be2-084a-4885-98b9-08dd8c77bfc7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:26:51.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OceDNbiQ5XUtxqLe4u0hbTcGlGSor3ZncWwnxXR39PRyCIfVQ0V+UDefKa9Foixa7bhk1ukyt/Sdn2H9CleqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10158
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some NETC functionality is controlled using control messages sent to the
hardware using BD ring interface with 32B descriptor similar to transmit
BD ring used on ENETC. This BD ring interface is referred to as command
BD ring. It is used to configure functionality where the underlying
resources may be shared between different entities or being too large to
configure using direct registers. Therefore, a messaging protocol called
NETC Table Management Protocol (NTMP) is provided for exchanging
configuration and management information between the software and the
hardware using the command BD ring interface.

For the management protocol of LS1028A has been retroactively named NTMP
1.0, and its implementation is in enetc_cbdr.c and enetc_qos.c. However,
NTMP of i.MX95 has been upgraded to version 2.0, which is incompatible
with LS1028A, because the message formats have been changed. Therefore,
add the netc-lib driver to support NTMP 2.0 to operate various tables.
Note that, only MAC address filter table and RSS table are supported at
the moment. More tables will be supported in subsequent patches.

It is worth mentioning that the purpose of the netc-lib driver is to
provide some NTMP-based generic interfaces for ENETC and NETC Switch
drivers. Currently, it only supports the configurations of some tables.
Interfaces such as tc flower and debugfs will be added in the future.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/freescale/enetc/Kconfig  |   8 +
 drivers/net/ethernet/freescale/enetc/Makefile |   3 +
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 462 ++++++++++++++++++
 .../ethernet/freescale/enetc/ntmp_private.h   | 103 ++++
 include/linux/fsl/ntmp.h                      | 121 +++++
 6 files changed, 698 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_private.h
 create mode 100644 include/linux/fsl/ntmp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c31814c9687..b69988a9f965 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9376,6 +9376,7 @@ F:	Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
 F:	drivers/net/ethernet/freescale/enetc/
 F:	include/linux/fsl/enetc_mdio.h
 F:	include/linux/fsl/netc_global.h
+F:	include/linux/fsl/ntmp.h
 
 FREESCALE eTSEC ETHERNET DRIVER (GIANFAR)
 M:	Claudiu Manoil <claudiu.manoil@nxp.com>
diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/ethernet/freescale/enetc/Kconfig
index 7250d3bbf6bb..616ea22ceabc 100644
--- a/drivers/net/ethernet/freescale/enetc/Kconfig
+++ b/drivers/net/ethernet/freescale/enetc/Kconfig
@@ -15,6 +15,13 @@ config NXP_ENETC_PF_COMMON
 
 	  If compiled as module (M), the module name is nxp-enetc-pf-common.
 
+config NXP_NETC_LIB
+	tristate
+	help
+	  This module provides common functionalities for both ENETC and NETC
+	  Switch, such as NETC Table Management Protocol (NTMP) 2.0, common tc
+	  flower and debugfs interfaces and so on.
+
 config FSL_ENETC
 	tristate "ENETC PF driver"
 	depends on PCI_MSI
@@ -40,6 +47,7 @@ config NXP_ENETC4
 	select FSL_ENETC_CORE
 	select FSL_ENETC_MDIO
 	select NXP_ENETC_PF_COMMON
+	select NXP_NETC_LIB
 	select PHYLINK
 	select DIMLIB
 	help
diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 6fd27ee4fcd1..707a68e26971 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -6,6 +6,9 @@ fsl-enetc-core-y := enetc.o enetc_cbdr.o enetc_ethtool.o
 obj-$(CONFIG_NXP_ENETC_PF_COMMON) += nxp-enetc-pf-common.o
 nxp-enetc-pf-common-y := enetc_pf_common.o
 
+obj-$(CONFIG_NXP_NETC_LIB) += nxp-netc-lib.o
+nxp-netc-lib-y := ntmp.o
+
 obj-$(CONFIG_FSL_ENETC) += fsl-enetc.o
 fsl-enetc-y := enetc_pf.o
 fsl-enetc-$(CONFIG_PCI_IOV) += enetc_msg.o
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
new file mode 100644
index 000000000000..ba32c1bbd9e1
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * NETC NTMP (NETC Table Management Protocol) 2.0 Library
+ * Copyright 2025 NXP
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/fsl/netc_global.h>
+#include <linux/iopoll.h>
+
+#include "ntmp_private.h"
+
+#define NETC_CBDR_TIMEOUT		1000 /* us */
+#define NETC_CBDR_DELAY_US		10
+#define NETC_CBDR_MR_EN			BIT(31)
+
+#define NTMP_BASE_ADDR_ALIGN		128
+#define NTMP_DATA_ADDR_ALIGN		32
+
+/* Define NTMP Table ID */
+#define NTMP_MAFT_ID			1
+#define NTMP_RSST_ID			3
+
+/* Generic Update Actions for most tables */
+#define NTMP_GEN_UA_CFGEU		BIT(0)
+#define NTMP_GEN_UA_STSEU		BIT(1)
+
+#define NTMP_ENTRY_ID_SIZE		4
+#define RSST_ENTRY_NUM			64
+#define RSST_STSE_DATA_SIZE(n)		((n) * 8)
+#define RSST_CFGE_DATA_SIZE(n)		(n)
+
+int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *dev,
+		   const struct netc_cbdr_regs *regs)
+{
+	int cbd_num = NETC_CBDR_BD_NUM;
+	size_t size;
+
+	size = cbd_num * sizeof(union netc_cbd) + NTMP_BASE_ADDR_ALIGN;
+	cbdr->addr_base = dma_alloc_coherent(dev, size, &cbdr->dma_base,
+					     GFP_KERNEL);
+	if (!cbdr->addr_base)
+		return -ENOMEM;
+
+	cbdr->dma_size = size;
+	cbdr->bd_num = cbd_num;
+	cbdr->regs = *regs;
+	cbdr->dev = dev;
+
+	/* The base address of the Control BD Ring must be 128 bytes aligned */
+	cbdr->dma_base_align =  ALIGN(cbdr->dma_base,  NTMP_BASE_ADDR_ALIGN);
+	cbdr->addr_base_align = PTR_ALIGN(cbdr->addr_base,
+					  NTMP_BASE_ADDR_ALIGN);
+
+	cbdr->next_to_clean = 0;
+	cbdr->next_to_use = 0;
+	spin_lock_init(&cbdr->ring_lock);
+
+	/* Step 1: Configure the base address of the Control BD Ring */
+	netc_write(cbdr->regs.bar0, lower_32_bits(cbdr->dma_base_align));
+	netc_write(cbdr->regs.bar1, upper_32_bits(cbdr->dma_base_align));
+
+	/* Step 2: Configure the producer index register */
+	netc_write(cbdr->regs.pir, cbdr->next_to_clean);
+
+	/* Step 3: Configure the consumer index register */
+	netc_write(cbdr->regs.cir, cbdr->next_to_use);
+
+	/* Step4: Configure the number of BDs of the Control BD Ring */
+	netc_write(cbdr->regs.lenr, cbdr->bd_num);
+
+	/* Step 5: Enable the Control BD Ring */
+	netc_write(cbdr->regs.mr, NETC_CBDR_MR_EN);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ntmp_init_cbdr);
+
+void ntmp_free_cbdr(struct netc_cbdr *cbdr)
+{
+	/* Disable the Control BD Ring */
+	netc_write(cbdr->regs.mr, 0);
+	dma_free_coherent(cbdr->dev, cbdr->dma_size, cbdr->addr_base,
+			  cbdr->dma_base);
+	memset(cbdr, 0, sizeof(*cbdr));
+}
+EXPORT_SYMBOL_GPL(ntmp_free_cbdr);
+
+static int ntmp_get_free_cbd_num(struct netc_cbdr *cbdr)
+{
+	return (cbdr->next_to_clean - cbdr->next_to_use - 1 +
+		cbdr->bd_num) % cbdr->bd_num;
+}
+
+static union netc_cbd *ntmp_get_cbd(struct netc_cbdr *cbdr, int index)
+{
+	return &((union netc_cbd *)(cbdr->addr_base_align))[index];
+}
+
+static void ntmp_clean_cbdr(struct netc_cbdr *cbdr)
+{
+	union netc_cbd *cbd;
+	int i;
+
+	i = cbdr->next_to_clean;
+	while (netc_read(cbdr->regs.cir) != i) {
+		cbd = ntmp_get_cbd(cbdr, i);
+		memset(cbd, 0, sizeof(*cbd));
+		i = (i + 1) % cbdr->bd_num;
+	}
+
+	cbdr->next_to_clean = i;
+}
+
+static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
+{
+	union netc_cbd *cur_cbd;
+	struct netc_cbdr *cbdr;
+	int i, err;
+	u16 status;
+	u32 val;
+
+	/* Currently only i.MX95 ENETC is supported, and it only has one
+	 * command BD ring
+	 */
+	cbdr = &user->ring[0];
+
+	spin_lock_bh(&cbdr->ring_lock);
+
+	if (unlikely(!ntmp_get_free_cbd_num(cbdr)))
+		ntmp_clean_cbdr(cbdr);
+
+	i = cbdr->next_to_use;
+	cur_cbd = ntmp_get_cbd(cbdr, i);
+	*cur_cbd = *cbd;
+	dma_wmb();
+
+	/* Update producer index of both software and hardware */
+	i = (i + 1) % cbdr->bd_num;
+	cbdr->next_to_use = i;
+	netc_write(cbdr->regs.pir, i);
+
+	err = read_poll_timeout_atomic(netc_read, val, val == i,
+				       NETC_CBDR_DELAY_US, NETC_CBDR_TIMEOUT,
+				       true, cbdr->regs.cir);
+	if (unlikely(err))
+		goto cbdr_unlock;
+
+	dma_rmb();
+	/* Get the writeback command BD, because the caller may need
+	 * to check some other fields of the response header.
+	 */
+	*cbd = *cur_cbd;
+
+	/* Check the writeback error status */
+	status = le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
+	if (unlikely(status)) {
+		err = -EIO;
+		dev_err(user->dev, "Command BD error: 0x%04x\n", status);
+	}
+
+	ntmp_clean_cbdr(cbdr);
+	dma_wmb();
+
+cbdr_unlock:
+	spin_unlock_bh(&cbdr->ring_lock);
+
+	return err;
+}
+
+static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void **buf_align)
+{
+	void *buf;
+
+	buf = dma_alloc_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
+				 &data->dma, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	data->buf = buf;
+	*buf_align = PTR_ALIGN(buf, NTMP_DATA_ADDR_ALIGN);
+
+	return 0;
+}
+
+static void ntmp_free_data_mem(struct ntmp_dma_buf *data)
+{
+	dma_free_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
+			  data->buf, data->dma);
+}
+
+static void ntmp_fill_request_hdr(union netc_cbd *cbd, dma_addr_t dma,
+				  int len, int table_id, int cmd,
+				  int access_method)
+{
+	dma_addr_t dma_align;
+
+	memset(cbd, 0, sizeof(*cbd));
+	dma_align = ALIGN(dma, NTMP_DATA_ADDR_ALIGN);
+	cbd->req_hdr.addr = cpu_to_le64(dma_align);
+	cbd->req_hdr.len = cpu_to_le32(len);
+	cbd->req_hdr.cmd = cmd;
+	cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
+						access_method);
+	cbd->req_hdr.table_id = table_id;
+	cbd->req_hdr.ver_cci_rr = FIELD_PREP(NTMP_HDR_VERSION,
+					     NTMP_HDR_VER2);
+	/* For NTMP version 2.0 or later version */
+	cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
+}
+
+static void ntmp_fill_crd(struct ntmp_cmn_req_data *crd, u8 tblv,
+			  u8 qa, u16 ua)
+{
+	crd->update_act = cpu_to_le16(ua);
+	crd->tblv_qact = NTMP_TBLV_QACT(tblv, qa);
+}
+
+static void ntmp_fill_crd_eid(struct ntmp_req_by_eid *rbe, u8 tblv,
+			      u8 qa, u16 ua, u32 entry_id)
+{
+	ntmp_fill_crd(&rbe->crd, tblv, qa, ua);
+	rbe->entry_id = cpu_to_le32(entry_id);
+}
+
+static const char *ntmp_table_name(int tbl_id)
+{
+	switch (tbl_id) {
+	case NTMP_MAFT_ID:
+		return "MAC Address Filter Table";
+	case NTMP_RSST_ID:
+		return "RSS Table";
+	default:
+		return "Unknown Table";
+	};
+}
+
+static int ntmp_delete_entry_by_id(struct ntmp_user *user, int tbl_id,
+				   u8 tbl_ver, u32 entry_id, u32 req_len,
+				   u32 resp_len)
+{
+	struct ntmp_dma_buf data = {
+		.dev = user->dev,
+		.size = max(req_len, resp_len),
+	};
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	int err;
+
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(req_len, resp_len),
+			      tbl_id, NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev,
+			"Failed to delete entry 0x%x of %s, err: %pe",
+			entry_id, ntmp_table_name(tbl_id), ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+
+static int ntmp_query_entry_by_id(struct ntmp_user *user, int tbl_id,
+				  u32 len, struct ntmp_req_by_eid *req,
+				  dma_addr_t dma, bool compare_eid)
+{
+	struct ntmp_cmn_resp_query *resp;
+	int cmd = NTMP_CMD_QUERY;
+	union netc_cbd cbd;
+	u32 entry_id;
+	int err;
+
+	entry_id = le32_to_cpu(req->entry_id);
+	if (le16_to_cpu(req->crd.update_act))
+		cmd = NTMP_CMD_QU;
+
+	/* Request header */
+	ntmp_fill_request_hdr(&cbd, dma, len, tbl_id, cmd, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err) {
+		dev_err(user->dev,
+			"Failed to query entry 0x%x of %s, err: %pe\n",
+			entry_id, ntmp_table_name(tbl_id), ERR_PTR(err));
+		return err;
+	}
+
+	/* For a few tables, the first field of their response data is not
+	 * entry_id, so directly return success.
+	 */
+	if (!compare_eid)
+		return 0;
+
+	resp = (struct ntmp_cmn_resp_query *)req;
+	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
+		dev_err(user->dev,
+			"%s: query EID 0x%x doesn't match response EID 0x%x\n",
+			ntmp_table_name(tbl_id), entry_id, le32_to_cpu(resp->entry_id));
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+			struct maft_entry_data *maft)
+{
+	struct ntmp_dma_buf data = {
+		.dev = user->dev,
+		.size = sizeof(struct maft_req_add),
+	};
+	struct maft_req_add *req;
+	union netc_cbd cbd;
+	int err;
+
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set mac address filter table request data buffer */
+	ntmp_fill_crd_eid(&req->rbe, user->tbl.maft_ver, 0, 0, entry_id);
+	req->keye = maft->keye;
+	req->cfge = maft->cfge;
+
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
+			      NTMP_MAFT_ID, NTMP_CMD_ADD, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev, "Failed to add MAFT entry 0x%x, err: %pe\n",
+			entry_id, ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
+
+int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+			  struct maft_entry_data *maft)
+{
+	struct ntmp_dma_buf data = {
+		.dev = user->dev,
+		.size = sizeof(struct maft_resp_query),
+	};
+	struct maft_resp_query *resp;
+	struct ntmp_req_by_eid *req;
+	int err;
+
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	ntmp_fill_crd_eid(req, user->tbl.maft_ver, 0, 0, entry_id);
+	err = ntmp_query_entry_by_id(user, NTMP_MAFT_ID,
+				     NTMP_LEN(sizeof(*req), data.size),
+				     req, data.dma, true);
+	if (err)
+		goto end;
+
+	resp = (struct maft_resp_query *)req;
+	maft->keye = resp->keye;
+	maft->cfge = resp->cfge;
+
+end:
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);
+
+int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id)
+{
+	return ntmp_delete_entry_by_id(user, NTMP_MAFT_ID, user->tbl.maft_ver,
+				       entry_id, NTMP_EID_REQ_LEN, 0);
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_delete_entry);
+
+int ntmp_rsst_update_entry(struct ntmp_user *user, const u32 *table,
+			   int count)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct rsst_req_update *req;
+	union netc_cbd cbd;
+	int err, i;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	data.size = struct_size(req, groups, count);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set the request data buffer */
+	ntmp_fill_crd_eid(&req->rbe, user->tbl.rsst_ver, 0,
+			  NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU, 0);
+	for (i = 0; i < count; i++)
+		req->groups[i] = (u8)(table[i]);
+
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
+			      NTMP_RSST_ID, NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev, "Failed to update RSST entry, err: %pe\n",
+			ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_update_entry);
+
+int ntmp_rsst_query_entry(struct ntmp_user *user, u32 *table, int count)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	int err, i;
+	u8 *group;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	data.size = NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count) +
+		    RSST_CFGE_DATA_SIZE(count);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set the request data buffer */
+	ntmp_fill_crd_eid(req, user->tbl.rsst_ver, 0, 0, 0);
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(sizeof(*req), data.size),
+			      NTMP_RSST_ID, NTMP_CMD_QUERY, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err) {
+		dev_err(user->dev, "Failed to query RSST entry, err: %pe\n",
+			ERR_PTR(err));
+		goto end;
+	}
+
+	group = (u8 *)req;
+	group += NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count);
+	for (i = 0; i < count; i++)
+		table[i] = group[i];
+
+end:
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_query_entry);
+
+MODULE_DESCRIPTION("NXP NETC Library");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
new file mode 100644
index 000000000000..685b388e7ddf
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * NTMP table request and response data buffer formats
+ * Copyright 2025 NXP
+ */
+
+#ifndef __NTMP_PRIVATE_H
+#define __NTMP_PRIVATE_H
+
+#include <linux/fsl/ntmp.h>
+
+#define NTMP_EID_REQ_LEN	8
+#define NETC_CBDR_BD_NUM	256
+
+union netc_cbd {
+	struct {
+		__le64 addr;
+		__le32 len;
+#define NTMP_RESP_LEN		GENMASK(19, 0)
+#define NTMP_REQ_LEN		GENMASK(31, 20)
+#define NTMP_LEN(req, resp)	(FIELD_PREP(NTMP_REQ_LEN, (req)) | \
+				((resp) & NTMP_RESP_LEN))
+		u8 cmd;
+#define NTMP_CMD_DELETE		BIT(0)
+#define NTMP_CMD_UPDATE		BIT(1)
+#define NTMP_CMD_QUERY		BIT(2)
+#define NTMP_CMD_ADD		BIT(3)
+#define NTMP_CMD_QU		(NTMP_CMD_QUERY | NTMP_CMD_UPDATE)
+		u8 access_method;
+#define NTMP_ACCESS_METHOD	GENMASK(7, 4)
+#define NTMP_AM_ENTRY_ID	0
+#define NTMP_AM_EXACT_KEY	1
+#define NTMP_AM_SEARCH		2
+#define NTMP_AM_TERNARY_KEY	3
+		u8 table_id;
+		u8 ver_cci_rr;
+#define NTMP_HDR_VERSION	GENMASK(5, 0)
+#define NTMP_HDR_VER2		2
+#define NTMP_CCI		BIT(6)
+#define NTMP_RR			BIT(7)
+		__le32 resv[3];
+		__le32 npf;
+#define NTMP_NPF		BIT(15)
+	} req_hdr;	/* NTMP Request Message Header Format */
+
+	struct {
+		__le32 resv0[3];
+		__le16 num_matched;
+		__le16 error_rr;
+#define NTMP_RESP_ERROR		GENMASK(11, 0)
+#define NTMP_RESP_RR		BIT(15)
+		__le32 resv1[4];
+	} resp_hdr; /* NTMP Response Message Header Format */
+};
+
+struct ntmp_dma_buf {
+	struct device *dev;
+	size_t size;
+	void *buf;
+	dma_addr_t dma;
+};
+
+struct ntmp_cmn_req_data {
+	__le16 update_act;
+	u8 dbg_opt;
+	u8 tblv_qact;
+#define NTMP_QUERY_ACT		GENMASK(3, 0)
+#define NTMP_TBL_VER		GENMASK(7, 4)
+#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
+				 ((a) & NTMP_QUERY_ACT))
+};
+
+struct ntmp_cmn_resp_query {
+	__le32 entry_id;
+};
+
+/* Generic structure for request data by entry ID  */
+struct ntmp_req_by_eid {
+	struct ntmp_cmn_req_data crd;
+	__le32 entry_id;
+};
+
+/* MAC Address Filter Table Request Data Buffer Format of Add action */
+struct maft_req_add {
+	struct ntmp_req_by_eid rbe;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* MAC Address Filter Table Response Data Buffer Format of Query action */
+struct maft_resp_query {
+	__le32 entry_id;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* RSS Table Request Data Buffer Format of Update action */
+struct rsst_req_update {
+	struct ntmp_req_by_eid rbe;
+	u8 groups[];
+};
+
+#endif
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
new file mode 100644
index 000000000000..916dc4fe7de3
--- /dev/null
+++ b/include/linux/fsl/ntmp.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+#ifndef __NETC_NTMP_H
+#define __NETC_NTMP_H
+
+#include <linux/bitops.h>
+#include <linux/if_ether.h>
+
+struct maft_keye_data {
+	u8 mac_addr[ETH_ALEN];
+	__le16 resv;
+};
+
+struct maft_cfge_data {
+	__le16 si_bitmap;
+	__le16 resv;
+};
+
+struct netc_cbdr_regs {
+	void __iomem *pir;
+	void __iomem *cir;
+	void __iomem *mr;
+
+	void __iomem *bar0;
+	void __iomem *bar1;
+	void __iomem *lenr;
+};
+
+struct netc_tbl_vers {
+	u8 maft_ver;
+	u8 rsst_ver;
+};
+
+struct netc_cbdr {
+	struct device *dev;
+	struct netc_cbdr_regs regs;
+
+	int bd_num;
+	int next_to_use;
+	int next_to_clean;
+
+	int dma_size;
+	void *addr_base;
+	void *addr_base_align;
+	dma_addr_t dma_base;
+	dma_addr_t dma_base_align;
+
+	/* Serialize the order of command BD ring */
+	spinlock_t ring_lock;
+};
+
+struct ntmp_user {
+	int cbdr_num;	/* number of control BD ring */
+	struct device *dev;
+	struct netc_cbdr *ring;
+	struct netc_tbl_vers tbl;
+};
+
+struct maft_entry_data {
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+#if IS_ENABLED(CONFIG_NXP_NETC_LIB)
+int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *dev,
+		   const struct netc_cbdr_regs *regs);
+void ntmp_free_cbdr(struct netc_cbdr *cbdr);
+
+/* NTMP APIs */
+int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+			struct maft_entry_data *maft);
+int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+			  struct maft_entry_data *maft);
+int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id);
+int ntmp_rsst_update_entry(struct ntmp_user *user, const u32 *table,
+			   int count);
+int ntmp_rsst_query_entry(struct ntmp_user *user,
+			  u32 *table, int count);
+#else
+static inline int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *dev,
+				 const struct netc_cbdr_regs *regs)
+{
+	return 0;
+}
+
+static inline void ntmp_free_cbdr(struct netc_cbdr *cbdr)
+{
+}
+
+static inline int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+				      struct maft_entry_data *maft)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+					struct maft_entry_data *maft)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_update_entry(struct ntmp_user *user,
+					 const u32 *table, int count)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_query_entry(struct ntmp_user *user,
+					u32 *table, int count)
+{
+	return 0;
+}
+
+#endif
+
+#endif
-- 
2.34.1


