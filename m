Return-Path: <linuxppc-dev+bounces-14510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A35C8CA7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 03:27:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dH0hN00Mrz2xP9;
	Thu, 27 Nov 2025 13:27:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764210467;
	cv=pass; b=JdBqQ6sI0m4GPcVrTaNPpsns7JbRh6ktF/57SUWjkMTcsMZW1bs/XHzi+5rwZVOCikqvSvdN1q8o9lxBktjvFpb7JjO5NieXWjhNLVO3k6XrqN2XmQPprbcDX04HiL6x1/Z+tx3ymU9Ses9YELiO3DyCzaWtjo7eDhESU7RovmAuN/ce9xs0Td6ysPruFYVVSrMk8vBxIkQK+6bgPJKv3s/H4PhPO49AGXrWktrbbCGnm8BsCMS2yKF3NbZzlXtBB6I6ATZNI/g/wWAaCUAkhZSPa/d5U+O07TuxQruXvKTP4EXVXb3kwH1U0zB9F+CpCLPCI2aztwvv/u/caKZwbw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764210467; c=relaxed/relaxed;
	bh=GquacDTo8TV78UFrFTWXbDPN4nOIrkJIthILPUTiElo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=f4E1/2dBJX2OTkJo48bOxUMpPfw74yvf9s/akagvbhLH1Ewncm+DIZaLlf19Y3XarvnLV1oFwemmJoX+z2PpFPjCng30AapyaipXIFF9cp7BwOQ/vNhr9TFFYDfVkWHRYBmJu4tNCC3U143POwZ5WjnZUgNnNDuMyLl/7/jv+HVi8FseTm8psO9EhQQBNtEeQ4WLGKksDCywXKw00IoKcN2dECmZoIyEDZ/wnz0QyBnO2Vafr5/rphV9niCGBc8KV2sva15ZjUlE9ixOZ6KXJRKUWl0QP17rNqsXYN5AQNeCRUmQsc5dxKWDs9g/TrrKoRc5ikPz/q1AQr9JeNIMUQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DSZQ2zdO; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=DSZQ2zdO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dH0hL34h5z2xNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 13:27:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/ndnVdS4aJ85mW/MwAtPPYoGvSuM7eXXXzcfcdPxSiLwMFr5bq1OhCs5GQzTutHzw1DcLwjXP1AkNAq04v5/QjS6p8MxziRv7eLiaot1xs2d1TJ6BrkDB2q2LQLfwJ+SKe/DQMdpVPTUIhtISTCMG9wrkp9FOjU8Rx/e0SCU2B0FXmLBF1HZ973IEHwRJ5OSxhc6WuxnG2LMtYICM9FVdQ6T8tkxYHMeXkbQrmN4jySwGGUcm7+u8/myP4+bhoLms1th+2OksaMTn/z5HFskLkLOTokvcBNNhyNXs7O8l/3UWQuDrBvmkvdlVCcBr2sIkk4XgPCeFLpmdJyPwfw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GquacDTo8TV78UFrFTWXbDPN4nOIrkJIthILPUTiElo=;
 b=hX48VnMZmz9eHw0mQgZPFxSf+AR1O7hTCbGLlzVBG3+CpQ2I14keK6k1BUqGHNfaRcOlaK+VDULAFipx+7CqnOJ71qKBu6M3vNe6lx9IXEi/M2t69DqL9sNk2JtFkNt8axsLB9rhZzdEOkhHpBrgPHila8dI+7QjThDHYy4sgncIZt2wUjf7fjt8PPsU1/CiXziDOxMfYHaJmMNE45Kz9FEerEfXR7/4H6nRQZkqVYxX3N+e2hLJ+Fx3LDSxfNqxRP5kD1SzJc0vT1roxMKd0cfF5m72rfXagPXoVXRcztSRpZgXHi1Km3is8UIJxTgaXf89oh4+9BdOo59cfQslmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GquacDTo8TV78UFrFTWXbDPN4nOIrkJIthILPUTiElo=;
 b=DSZQ2zdOA28rkcW2eLDD/zFynDIkOtMGAIJylHeyR6qTCT42bU7mI4+0sjA1fwg4oeK9yXYnNuZIU4z8Uys7pjTucgR6bz0WBEYb7S+ae8yCwT3J0Xb3oim3HFxMEGIHHuhtR/10yj6xMcN9UTGeRCQZFl/VOnJ96skRmemeO6j7/x/iynYeF9D6cAb40yya/5z4CLUO2KIsOpWKNWTcSCavGlFhptSWEX2KEK0pOO5pxrinWDvgnqPtCLSQMrXD9b4/F+rExWGNJoWny/Eyry7CNSXEHcFril2tmXP+g8HZb8HKOWl1b3F0n6q4wwEGRCoUNF0FqwiyBsluPFrT4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DU2PR04MB8757.eurprd04.prod.outlook.com (2603:10a6:10:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 02:27:17 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 02:27:17 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: fsl_micfil: Set default quality and channel range control
Date: Thu, 27 Nov 2025 11:26:50 +0900
Message-ID: <20251127022652.674574-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0050.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::13) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|DU2PR04MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c26149-58a9-4b23-5614-08de2d5c7bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7MBuNJqVjIPYRoWj1qr7ZLR4SRTMGDDzKqWP7Oa43hneBBu4wJj98YUBFYVY?=
 =?us-ascii?Q?ENxtp+t167TJf4mlj3KME6erc06/H5BO+j1mJaI1TyRvk2KKG9UruzPJgG6m?=
 =?us-ascii?Q?68WdPEjLDKsZOzYu2JQBwbQmJroHeYEejeEMG3aIey0Bu0fiAr7CFyOzNl7T?=
 =?us-ascii?Q?8418ho+syRNgyH7utUEZ7dXohnBPtJTjo7lcGy5dvZNK+8mVBCj1u0pCKVGO?=
 =?us-ascii?Q?MOfxnLK8n34Ixzcw/DFXViKWF+v64cvSTLXhqMHaC6aoNP8wblWU9RPF6LQu?=
 =?us-ascii?Q?bxu4tBTcLzferulD6qxGWRPZ7iExIZ3g5Rq31GddNPRmW55Ir6FNHy7Tqyfm?=
 =?us-ascii?Q?7dHeGtM/Xx77dmZb2yrdcWwpN7Jlq1d37mal9T7yhuDr46XWP3zNzz5EXUO0?=
 =?us-ascii?Q?bu+uQoSHLRFMsS/BvR4TALE/1Dqs3+TD+53vXsq+6hhiwKzSoy+cpB7QdGvu?=
 =?us-ascii?Q?oAOyOotxlEdV/cIG4MZXUMiaVByk4veff5BLyUzv6AshovkmC0EuXuvcNimk?=
 =?us-ascii?Q?n7AzEKiozt/hpRODlo/331B2pKTatDyOqy7FWIOdBAE8/rQ7Z4w8VVfPyPXR?=
 =?us-ascii?Q?+EkcQfyu/FUXDkC7U6IC8RKvH7lIW5Rv2sTNBX6x7Pdjryxfc200iIKtBdJK?=
 =?us-ascii?Q?hUhdIVs/Fs2g3qTj9OXe7ryuP8ZIKLxfUA+NKxDrBILdZ5y80pOL54yLz/AH?=
 =?us-ascii?Q?xubH2+0KWriHA1Q8jmKlAE5paB+X9vZpj7Oqv7GViWwmznFZXwQz4EivSihj?=
 =?us-ascii?Q?KKmGprQc1RZhgrVdYc2z80fhvVIfeeSfZ6nRXnPpWatQGED1pP+OxDUzfIzT?=
 =?us-ascii?Q?RZXwTPPqdtFhpTunHpLAdJRmxNJbOC8N/TjLLD+jYmH8dA9HizGRZTBtNHPf?=
 =?us-ascii?Q?+nW1Yz6c10O9dRaBfiZSp/rFgbWkeMqfJmD1R3YRY5CbodISxRaUiJFvns+o?=
 =?us-ascii?Q?WTHJP86uNwE8rAYTPnpOlwywrKiwcXGj4YmMS5xzfsvxth/xuRIRuxlpdSUE?=
 =?us-ascii?Q?b0BQMXSY0NSpIJH0NRhqmHeLvKSKyaZZ3R7VCZ2oVaIQ7mRbVD+k8hEQWUwJ?=
 =?us-ascii?Q?v6qQJKo+S4AVro6VIgiqIr+yLQfujOCScWULnV8OPe+y9JOvAetCPmhvw5qS?=
 =?us-ascii?Q?5i9MnAwzRHyzpRFMVmVJU9ruIFKM8W5rOMFCeJqT2HkGR/z7rRddSsxwANcb?=
 =?us-ascii?Q?6CoMDVUqZmcS2rspoZ/OxfQ5WTqwznmqptpgA2wNuUA8Vo4D8AAlz+xZ63LL?=
 =?us-ascii?Q?Au1udnIJgTRk5MLt6qL46tCzBjLGkGQprledP1DLyoQ6Ih7M5X6xawRarnqQ?=
 =?us-ascii?Q?AcEYiUlauVYI/go4Ux1ZdB377O5jQIn8rj84t91uRUoxCI6h3pKCCgwfmLnj?=
 =?us-ascii?Q?ftaCbwtVSkZ9NshR3JJl1REicYcrYpH17W51NlKZNeCMst3z0X46nIr3ZZVy?=
 =?us-ascii?Q?vBxjhSGPMVGmp3eminHfEAeRD0UQR9gPd7y80bnQXqLD5ASxxWdCPIMYwbv8?=
 =?us-ascii?Q?cDXzXdDcQ/6vFqFU54EE9ua3giqT3oRK8RR2kDabYQaH26f9PU9KIfAvpQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SSF4FqJT5xKv0/V9LSNTu7moAq7YcPeZJmGJcbEmY7bmkKKcLCPQWSLUe8uh?=
 =?us-ascii?Q?/1noVwrMVpFl/bUCR0qsl7qCW7e6bGVXKRN/boepBxPZfTj+xfTlQOvc2jWI?=
 =?us-ascii?Q?JScN9pzfmqn6lGoVVAfsOPDodkO2mxSanKLTNdoFpj4K+3RD9DVflf41FJEz?=
 =?us-ascii?Q?QClFkk2aMZgpmHoIGlo+Cr6Ol6E0VLgbpqh1BWHp4UgM3VoSFPDy3NRxuQBn?=
 =?us-ascii?Q?dBwHadngy/NN6vDYYlBho2u4jLtdh1+eULxVfI04knUa30/1ciL/qfN2CnFN?=
 =?us-ascii?Q?JlB6GNKVdAzesp+wIpI9yvHuoV3jkfVevgQVQ542/r5bwI2l747MBVNtZaSx?=
 =?us-ascii?Q?RA72e+FxXIqINBDGvWzl0Vk5HaUGw75/KNqwFaT261EiK5TOVNnpurJDiXoi?=
 =?us-ascii?Q?E1OmBGXbszQhf8s222ArtcOEnCZ7basrMHwvCn/0Q1sw2Nw+12A/Y2YSSPHT?=
 =?us-ascii?Q?c6Js2s0rXnbszMTN+XaJGCu3UMlqaLXaO8PnnURk9h91GO2YT+fz7XDJpZiI?=
 =?us-ascii?Q?vDXUr5zghllExZjZxVvjlZroeyhEKG/fBVxemlkMQaqUZ7KhaeJ8re1vAv8j?=
 =?us-ascii?Q?lY/xGb0yHlVV/v3KKfxRFLtJ6jtzxi24fAX+wRMB6d+arUVMRUWfyi5Vwb6j?=
 =?us-ascii?Q?mLeltJu7JaINygVqtqOWShsjBoHCOzChzq8BRcz97S99hxTXlyLLWzQN7imx?=
 =?us-ascii?Q?/+9LamC8DMuEG3DypVo/s32qJlGUhMOk/YKYeqY65DqFnpRNyXYTVNoRHI7O?=
 =?us-ascii?Q?Z5zHOS3jxc/1hqzQvMpHGW3RNrSzZn9HQf8nhBnnouUv7f+TRuzcDPOVLL7M?=
 =?us-ascii?Q?fxLFHJtkrKJWuDEK1RarW2oxMQ0hvXjLEKmqOu8SmZLGX5lG3tnyS++98G8U?=
 =?us-ascii?Q?4oJ7Se6J/Rfqw8PepZawBn/2NL/3CdvXKW5Js/QSLsM3tO0gP6uD/OlVpkS+?=
 =?us-ascii?Q?iSkbaeLHcPcjuzvH1vdQL8mrZWSSN+FaazP+wQfBeQ4/JefkA018UNLibeLR?=
 =?us-ascii?Q?VGPuky206vMMSya1OqC5SX7uHu7djLLKbGapB/P84WdPwS2b8Jb8aIFoBDeG?=
 =?us-ascii?Q?XbIWNzbcHZURa9+fchkXRDAQ8QDF22jbyzSDvdujKid1iaRh6ISFnUwYU/0D?=
 =?us-ascii?Q?3s1YuuKSPqSp1j3vjpvruITmed9P8pPFFMwdShuU5nwdq4xWr5KPCxU3gqBQ?=
 =?us-ascii?Q?aQitze7FSdQrDnbOHkPmZkhT3cDcQD/lpQWrdXY4UH2fGu69MgzcYpWfRd6+?=
 =?us-ascii?Q?RYsjYQNvJdUjkw5DxQFZEb0wIomuPk2mZzrWs4TK3LdjQzlDCU8ILreu8ZOc?=
 =?us-ascii?Q?xM6Pq5DNQfSGB317fFzkIs0FamNddxMtS1KP1PO5WkW7mqaRB7tCsdH41IaP?=
 =?us-ascii?Q?msFUwR9BWMZKC+am5EGwR1NAj446rrJMPtsmdrnjdyCk7qqYoMc8emKHc4IG?=
 =?us-ascii?Q?Y10futlYBKr500umH6Keq/sKjiycZGGV/AnL26RuFVLokxdypH01fkQT2Dey?=
 =?us-ascii?Q?nQofvi8ix3W3jE+mkUUAbqTtD2pLEyHlVX57KTTo/Ty7Ykpf6aKteuJ17r6p?=
 =?us-ascii?Q?DengoZ4BwsiVJOftVCYL6Z3QeLMnfQsXot0ypDDu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c26149-58a9-4b23-5614-08de2d5c7bc7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 02:27:17.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuy+fGReK2SHgnDbxmbU28cY45lTFHVvJuZVEWsxOD9n+/oLVjez2OQUleqD3pQjsQYvbNt8ijvUFYmlQYzcjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8757
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add default quality for different platforms.
Set channel range control.

changes in v2
- use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()

Chancel Liu (2):
  ASoC: fsl_micfil: Add default quality for different platforms
  ASoC: fsl_micfil: Set channel range control

 sound/soc/fsl/fsl_micfil.c | 132 ++++++++++++++++++++++++++++++-------
 1 file changed, 109 insertions(+), 23 deletions(-)

-- 
2.50.1


