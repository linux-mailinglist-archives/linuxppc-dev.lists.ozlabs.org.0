Return-Path: <linuxppc-dev+bounces-14708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27135CB2101
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 07:22:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dR5Gs65rBz2xrk;
	Wed, 10 Dec 2025 17:22:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.162.11 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765347733;
	cv=pass; b=ULAYnetaQzynM0gKQrqyhjjpmhYEOH39Qm2a47h3syKE/e0Wu85RiFcg1+/KsgkGyCMwrBO6BGjmvtq56wQDDvuFuoYraTYBlzhH/AhwC3/YgcnU1A8+6/vKOz0STjlR4Um7H43HhVtJTsbO2oPohsq+sjZ1p93E1q30hfrb6RLnLTqvyyNRu74hHZcJtziD3W067SxyTjCqMOeMKFJW/M2r9IMXKTuwkamU3KJHv/S0YbReP6wC3z4Si0+dvMTRbTHAmjeRbBeLtgHtYZ57j3PaQSDwSqBvydsTVE/ziq98MxfdhWGUIlNThXId9pDcVcAHCaJTb+gRaN34MtZYEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765347733; c=relaxed/relaxed;
	bh=JZaES7KES/ESomOOw09G9UGdfeOLbFtKCm7WuuTLAEQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iFO1PoKRZBTLhqmAyop1zz43yZijAaiMzi5HwStLFKcCqAz9O/cqIrSTICjFPJ5XBxYxhQ5/F1+RdzvVHHZlAKIAEIwzGnoGuLiev/fVyHhBw3zJANS5/4QO4fxFI8iXqwSFCg3omR2rQj69f8kEyjpGDw8TJcjp6J3sKr1ZMrr1Kt4TWOtX91uIeWeaV7UR1Q9o3b5iboDC4b5zaRN90IuUOA0LJXpu7QSUNTcpywh4gOxFtIm37IE7/rSF63ep5K78aeZU0mEe3Iy1JBzDoxo/uAWpORDeyD7dMAMVm8Dq1i+NdWMEhEHdlMO4KcjNoGuWs0unljlwL1QUsPToVQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=d0aM2SAo; dkim-atps=neutral; spf=pass (client-ip=40.107.162.11; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=d0aM2SAo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.162.11; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dR5Gq65QLz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 17:22:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+YY5sGzMHsdD9jnJki67nmMVQa8VSLE7VzrmShJJaPRJBLuAs8IeuBcFZWyA77M2tfLNniSJnLLD3iYGVZfnSe0hjyCkoFTvjNCfX+ZoCrn0BipeO67GFK+lh2TQ7qEOZV+y5GmGO1HbTVUGJi4vSDO01WmeXaF/n1IJ/I+EzYX9Y1TomVx0w5w2zGZ/eEeElYb+8KfxFZHOOEc5AD4VY+x+5wBHMfXTrRWEhtCSjaIiVJ72fRdMGKxWIL4ork4VC18LrFdkAwasUV32S0U4KLqPn23KEUTZ7mrJo9P1jgvVTmNeHw5HTZGn1rYNMmqhckdeDbktQxXx+1hzM6RSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZaES7KES/ESomOOw09G9UGdfeOLbFtKCm7WuuTLAEQ=;
 b=ORynWutxHGkr17Q0aOFMPJIsNYs4s2Ii6ViI4Pq+ir2/8ru64UoVr4e/pl0s2JIbjYx7HvT/MptXGedYIcTQDQe5/8fxd2DKevyssqCatf+5NcimH1X6NFPVGOElZa2Kf64xMh9lAtia4Z8JPvNZ3fVrBpcGtR2HJE1EBGCOTSN9GQZhVfgM+UiqG7cNa9Yv3+ab8wzKP3ef7Icj9Aj5jF7kdlOCblOw4PpmJGEYkN2ECso8gEZIUrTwc7lYQ6/1zKDrjfE/y7O7y2kR+cIZ0SqsR+/S/axJeqslLCAoAjz1pKzOleznY2aoV/1MjkUA/kDDS+iX0Of6fMjUgAg5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZaES7KES/ESomOOw09G9UGdfeOLbFtKCm7WuuTLAEQ=;
 b=d0aM2SAopiN9xAsmMGlUmEdz7DD/mswJRoE0SJeRvvq/6wj7mSUUM4HgKSEdEWIHGHrC/xh1/UzEc6S4wt28SPmzWv7Uif+PexublYP0vkSk0LxeNFoVCwdr9KWANT9gT42xmXz17Bd7aWf/B5dGJOrWhyOkqzxmD5BmTp2tffIp9eyGQzg2cfWAVaLhG2x1fEotGY/D/lPJvonasNud7OSgYQrKRH3wHM7zWZ2U/8y6mNvKUpROqOTYeSgb/5CeG+oUG4Ty1RgCixFldEnGed66X4753nLZpeN58ZDHXOYWN+Nh+/lK4dL/zAS16KnH56FAKCn5yCcHgYKvmvTjdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VE1PR04MB7405.eurprd04.prod.outlook.com (2603:10a6:800:1a4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 06:21:31 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 06:21:31 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] ASoC: fsl_sai: Constrain sample rates from audio PLLs only in master mode
Date: Wed, 10 Dec 2025 15:21:09 +0900
Message-ID: <20251210062109.2577735-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0083.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|VE1PR04MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e19279-cf37-4872-20d9-08de37b45bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NkiVMUjgj6R2S/F54iyP01Fmr7zTMRJVQdK4vMb8hsCkYwBNEgpRnI64XqJH?=
 =?us-ascii?Q?W3pUgNz15/t2knFX7TAakQxjfJZYgVAKom/MDMPXEcKFyElu7y1JIKdb1LiQ?=
 =?us-ascii?Q?b69o2Vkef7/OrrQp1P9JwCPXDe1yRoloFvYmbFSP3PrHKoN8QUKO4xWvkbKY?=
 =?us-ascii?Q?rEOEHGekYMEjfPyNo8j3duPhnRv6hCXdqOYLyQIyvkcusB0/k9/AuOB2Z681?=
 =?us-ascii?Q?345W+Mx0WWBomoBV6QZ+67bNlNjTarlcIVxb0KE3400Mjt32bxyczpWktG5F?=
 =?us-ascii?Q?3LGnOON3AVGd/zM+1ZqETmt8jhHC/VWMMkXoPM8wnINAbv2vifghDCayBBsC?=
 =?us-ascii?Q?7BsMSOzTLYhzWqQ59V5fttjwDDDGOV2MYrJEGI1oyUPxr/b7E5UlQgQEBGao?=
 =?us-ascii?Q?8bhvj4MZwThPDZ6qC9QaNSKmB01TeyWuphXNkIpXo9ltl7Bye7lN+Ny7emlG?=
 =?us-ascii?Q?bMz11U1Z5Q2ElLLVA7IIPAWxRWQ4jORW2PXg9NVQi2EzmXBSD4zDNndfZGwQ?=
 =?us-ascii?Q?eDGFN5BBO6Dpbhd8qkbIaSsySdIIlED2a2C3dR2t17TTzntty6Ry9JjDIUt5?=
 =?us-ascii?Q?D8lTQBa56cjMFzrIsf983lUr2Eh5BPgQiATvGFlEPta7Uthv0YnjElLeCajg?=
 =?us-ascii?Q?IWj+Xmxj4yh950SJfgLCdW4tc22/Xxt3Zy0YCAWOL2O0QVnQxnO4kG9RORLw?=
 =?us-ascii?Q?oiPPvAbcKxcmqDP8PYMMei10tb5ii3OSY2RSr9v35qAcwqy/38SHlCx8Gv0X?=
 =?us-ascii?Q?FMvSCv8/iVcRT+wfDcZLGDWeFHnjw8eEmbgGr5oMIte8HV4x3m4tG5rXblqZ?=
 =?us-ascii?Q?zcZXGfyJ405fFpKqsvpGBBv/eaG7/5ul4BgibhEStv0ilBquYQNxhg1Q/H/W?=
 =?us-ascii?Q?u8Mt+A1UJiMmRIFQVHaeEGkm5084PQX6Dm3/Oe512nuYdfccdB/Cky5cpykN?=
 =?us-ascii?Q?LHIDpFpWgbUp4lA0hHU80+N+gTCOd7iPGVaaozwLpt0TxIkJJ+kj9gwPGYCH?=
 =?us-ascii?Q?csjmNxbBcfUE0R1wadBbvdIkIiRX4KSfHLpOODFSsNxEOJ8Gd4yoapTLDYEM?=
 =?us-ascii?Q?J9UMYPtwhb1tJuqKyYvVWGQdAxkS7sml0uMcVi7l3L5wPqBZzXmwKXJEX2fi?=
 =?us-ascii?Q?gV/K257NPo5Y94HpBwGMWDL0bp+QOsmah+x1QrNMMs/FWnatAOVcco9u34c1?=
 =?us-ascii?Q?6yVnApDElJJwfQOxUbPAiLWuwwvq/AamaEMoQpwsCyCzYRMlUqblpPzKLwIt?=
 =?us-ascii?Q?GYLQpevAov3TcFjPA+w+Z3J3OD7EQS+Rjh/kUGQMMG67cI4jkAp/QMYgZ3T7?=
 =?us-ascii?Q?fuwR6vOn59vWrxMJa1auqd/EIs/tra7zsV1/f1KBokN61ZlJbEnZ2GGDSF2M?=
 =?us-ascii?Q?erGN0JnW+UM+QvGsO9ZS35vDWeI7nNqvI96bL/y8Pb2smqd9w6pVGZ8UEkv7?=
 =?us-ascii?Q?hQdvPZaqPMxWXDa/eQs+loqEoBdXidSbV6aOJwREqDrFysB98y2JYkB6PjC3?=
 =?us-ascii?Q?7x/WXG+IrNuucDNnkhPLm6j+7zEEg9FUAaoahJDg09Mgl+npYEmrBeVdpQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6NEOr26hahu+9/FlR/cwGtiazWpFaoJIYWdRn4Hm4vUgLzCzrM0+MZaboZsj?=
 =?us-ascii?Q?RdKUh3bHKye6Nus89yrXHFAgZZBtTh9rQBLS51wL9JpsF4LCM8KwQRafhTHJ?=
 =?us-ascii?Q?CLki6HA3myKMowrwoU56rf+ktXFA1QtSH2E6IYgXdqxxDkYO8mNFn2LTF2fL?=
 =?us-ascii?Q?QpHyvYm6f/cAuVB8p23hvGOEEM2hGjJx8nRKO1iPKNAR9ViZ6ne3isZye3ir?=
 =?us-ascii?Q?2jvTQ1hCMB0piNu62cxr3pxRXu/j3r7/hlT3yq/vVIYeQvQmEkRBL/x066Ei?=
 =?us-ascii?Q?ugwgOg4Xej2k0eAyBCfhND3sP02sr+HBbrC0/F32q3T4CdnOuNqvTA9ufMUT?=
 =?us-ascii?Q?/fP3xMXqghgXRaiOOXahkmH4QS7lt3xSiAtiHD/ZcFKyz5FBZo52udjF0x3e?=
 =?us-ascii?Q?LFihbgkZkgiEoDqRrLGYc3T5GrLrHZy/uvl47Zs6CFJ/JH6AA/mmNy29Oc61?=
 =?us-ascii?Q?4UaYDreNocFNvq0ay0vqiv08MUPsbxPniNKzGappr+7XZALPfREL2rC3a2TG?=
 =?us-ascii?Q?2h69BpdTH63IL9d96UBRKuOHU1xPj0pnyJ+CI7NG0MJjm3l/tw0fiedBVzPa?=
 =?us-ascii?Q?HZXBKzOg418lW3laupYWIPk34oLwmKtOdtJE1KqUhssPCu9mvvykwldRp0md?=
 =?us-ascii?Q?nTBywVkFOFKkW4fSeck/LpAMROGxtYbuG5VjQ1iI2FptuxSYHB0qxKOheSoP?=
 =?us-ascii?Q?dSF45aThCihtHog+1wvk2J1mqpyzOfCZcNN+MS5N3EYDDGqlIBrNuX0oh07q?=
 =?us-ascii?Q?73iBH95bMOu62d6HK2WixC2TNqzK3DHH+n/I0FesCWIj5lTs6FCM1u7k2FUc?=
 =?us-ascii?Q?vj7R+x4aoxkuIkg3JbmFEXb+UpLjIPHWOeAgmNH6Say/bypaMCZAW7zVnrL3?=
 =?us-ascii?Q?8/Z8dTVT0lmDEUSc0+k/AECyCgUXQE3A8KNEjzV2Jk0UWTQm51rQgf3CtF2S?=
 =?us-ascii?Q?74NY0rlz/7hBno0YUWl7MbBIN7P3XslxJ61j8hzt9WfOMedPRqGSqpvh0cvu?=
 =?us-ascii?Q?8SgPHq/QZ6Wg2OUSDGH8B8yuAW6CgPtvidMOckn3G3UBv6mmGN0FM45m+yWR?=
 =?us-ascii?Q?jKo9taQp03r0zxGyN8c2INBIRv/50vUq5A7htBfX4h/RfbyHezJoxCUOwn/u?=
 =?us-ascii?Q?FFnx4NlI8j7oTmlIxlHT+D5wtoH/2BEbOpCSrdFf6GRYj+FJoyr59tEbsz3r?=
 =?us-ascii?Q?5TmzhL/gt1MDKyulErSG5X+jYt8vQnFiUeiKHZyXsnFVzFsacPNbtO/rl+s5?=
 =?us-ascii?Q?nxTjkSZ9MLIMphKn7M9AVejkFp/pzjNSNwx2BgXt9+ddH4TmY7jPYCegro0O?=
 =?us-ascii?Q?we7lXVKMsmNW/9Cl0pqrL9CMDwWpZwWcvVpmdyGWtu/+Q9YJz4Deh7v64uvj?=
 =?us-ascii?Q?nwjXXsCmFPfG56KUao3qawSQan7ToB4xaDuCxIk92Miy0wYcBehaw3QLsY+M?=
 =?us-ascii?Q?Gxs+6R+qEgIo4MElRHysMKTsod4I9A7GlBEUguGPQDvjy5nZVeDxinqjtUJb?=
 =?us-ascii?Q?RKbT88On84rkielhU8rsc+8CyFxRjhexx8XnbScHmHtYRf6BDm0bfn1KZKIG?=
 =?us-ascii?Q?lWxAVtyi2OGb8uXaKSOH+6qo8KvUaHzIXIXogrrp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e19279-cf37-4872-20d9-08de37b45bcc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 06:21:31.0111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1+iML6cvpPTrSIlv8+J6GjOV9j71HSuyfA/9kvV8aC/XnWLXQsSwuhn7FzkQpGferclE1Zfkx6iEckxZZKnIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7405
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If SAI works in master mode it will generate clocks for external codec
from audio PLLs. Thus sample rates should be constrained according to
audio PLL clocks. While SAI works in slave mode which means clocks are
generated externally then constraints are independent of audio PLLs.

Fixes: 4edc98598be4 ("ASoC: fsl_sai: Add sample rate constraint")
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 72bfc91e21b9..86730c214914 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -917,8 +917,14 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 					   tx ? sai->dma_params_tx.maxburst :
 					   sai->dma_params_rx.maxburst);
 
-	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE, &sai->constraint_rates);
+	if (sai->is_consumer_mode[tx])
+		ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+						 SNDRV_PCM_HW_PARAM_RATE,
+						 &fsl_sai_rate_constraints);
+	else
+		ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+						 SNDRV_PCM_HW_PARAM_RATE,
+						 &sai->constraint_rates);
 
 	return ret;
 }
-- 
2.50.1


