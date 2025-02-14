Return-Path: <linuxppc-dev+bounces-6181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF2A3589C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 09:15:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvPy06hHxz30Wh;
	Fri, 14 Feb 2025 19:15:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739520952;
	cv=pass; b=RS04WLPLMPjbSM+ab6Q3EL7qebyHZAuK92oUDTkccgcNQ0D7Th0P2zW92RTF3cbCjGTVsKvPRjrSa4wr0m+LndN4ojtwTXBVA6OYPOWrMIl+iqzYS9z+gwTvYDeP3YGdigCcpTgTbgG0l1vq5UNMtkDXaiEBmhEqC0Zd+zGNLyPSpIKRROnEoJD71W/1dZ2Uvkal9X6/r2aMDsfEmWXFCjizvb2ZJKqFLdbG+QAZANt2Aqs/k1jfIZpF6t63yHJcWxhhVCo8plDTML3QSezE+yJZkoqZfjFR6ti+zdNpNhXoU+uxrQS9VXK7zcQuBThrsPWxqOIVwM3zakTbQCgxWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739520952; c=relaxed/relaxed;
	bh=sV9i897wFxtbBEwe8W4nrXd7b9KVnteJzbUCX5LxIH0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JkDjKmkg/kz+D9FgFY5CP6OBg+UF9UTXzVOPQP3Y2qohqFuIdIyAGeAamTjtxMfv0+c/gFczUfBQRggQLiY9Ao2KYLJqtgA07tsyxxH4QwKPkU+x+udJJ+WbaSfvODCtDyXd4GJNcMDpS/Bar7iH06hqDla5HKAf32i6Fyp2rCwuSrqZ6t0GZlwaogXXt9xZJkGCScd9pCRqK4jZE1ioZiKAlvPLtYV1wMKDEI5Wk+XqCCOyIS4Pi68dMpvjoNQLEwiY/hzRTPK5G7hcChMsofniSpvlyMfgqK0M7EDy+8aW5NlOJYhP4pmI1UTFRtmKiEhffXQGhx+nsT7xcoolJw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MUmmWGwA; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MUmmWGwA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvPy032jCz30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 19:15:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYKUdZWiMxxy06GN6zf1BHoixpyiRTfLafgVnP/qRSm6oLO9TA06xUmd4oNo/jJrLZT5x4Z0CMpyVVxShgx0Y7p0EuTVfQOvFaetlKCj07x15fY/QtKQmPsAJzpdKJgG5UWS/FmG7yQNEOtUPWopGLdXYxGtVvMQOyuv/pJRAEJZ8NDMP04q8soCBJ8Xyv9PFoNDgnE06ViDo3dpeKEgxyfTWPTtgd0qvw5GxiZg7O7ZuVAyQ6GGaixTFFwG2pD2qA27udaYs7/I9n1x/dI+hr0k0XkiQEL5Hv8+JihcD6asX1QGs47YuD1+TMD7h0oCqC7foOhZe24Ty3UU8Qiw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sV9i897wFxtbBEwe8W4nrXd7b9KVnteJzbUCX5LxIH0=;
 b=NJJI5+7xo2NEt0RMVdn0aRG5zqb0qf/iAPkRe3krj53YLTYng382zthkepWRdn/88/6GFKD4984d6Z+29eIrYSVe4HClSNo9rk6XI1yBMLUOBJhZTfIiDSy6QRg+ZLUB7yI1dhBWa1jhJ4V4MEp23pA8yhMQBHAvZ+7tt2J1j4n/14FqzzfMi8GqilczbPUlyWPxVLFvXMR4ec1fTn34HeMssHA3XM4CvOM4eIoOM2g+1v1/hcpUHTw0DUj3L+cFtHLBWBlwPqTI5T+CyWjiaIPknpnTmZJi7Y3PUnFX2EpboCB/gaZ4mhp58lQ+sWobIE0S/wB0mfb3Cc5y7CeMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sV9i897wFxtbBEwe8W4nrXd7b9KVnteJzbUCX5LxIH0=;
 b=MUmmWGwAdZqvrrxjSss/GdsoR5cCvVOFAf26AYlw8QNFLmCdDCxwmI20TpWae61a4954lAmnHCDcpvsDXd13GqvRdzOZ1nmhxJq+oS7ZO+2yroIrQhLCVZlraMCSpKO8pDNPFvIcXf8+FyQPK3NLi+MSZ5DoedAsQ0BVz+cFrVi97YtPO2zmzRYvGW/TUHLbY4x6JNfsfWaxqZIXCN/i33S8k40VQQGuVpNF7lfuHTdwgysKIQjlj3mTjDLVg/IjqpoFPLaJCybOCNhCdG1dAkaQxTXQQ1g/kKsF4KO7GvMXJ7bvD24KLMWSvNvOUTV9VKiEXpZ4rgT35EJ5bWiKmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS1PR04MB9629.eurprd04.prod.outlook.com (2603:10a6:20b:474::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 08:15:28 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 08:15:28 +0000
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
	linux-sound@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: imx-audmix: Update correct dai names
Date: Fri, 14 Feb 2025 17:14:58 +0900
Message-ID: <20250214081458.296948-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250214081458.296948-1-chancel.liu@nxp.com>
References: <20250214081458.296948-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AS1PR04MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b760d2a-f71c-4bb2-b7c5-08dd4ccfbdb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hzkyyFMtJXSqCZt2Zrp504hkRZiQ5R3uvl1XBzv0m2cRKZf6GBGvljDOhYPb?=
 =?us-ascii?Q?D5hh7uOPGy+/3/yFWIFIKUvLjTWEDBudWyy29MHTv8THWXtalw/OwfP5EeDV?=
 =?us-ascii?Q?eImNT1cH/78+1UFMTXMlD4MqIQG+GzYXLu2NGFYNqVmDMOKL5QjgV5ih5sKq?=
 =?us-ascii?Q?5DaP6MT9lsNnRZ7NENQMbM3GGszuXCiF0qdFFLapRAbsC8BV3OHSaMaBi/ts?=
 =?us-ascii?Q?/jIQ6rVB5CG5CRDrehS2LjVx/REuMp/byFENXsaoBKBALw/eDmUKM5/c2MIJ?=
 =?us-ascii?Q?V1OqpKCjOHQSyVDa+mfdKpeRdRUjmSFL8/3STXF7SHv+E7NNf/yhmtDyATGn?=
 =?us-ascii?Q?QTMeTU8sBcGua5cz32gZCU5JXDqRCFq6F8qZxHTFmrU9qAXondAh2+N1G8hI?=
 =?us-ascii?Q?7LMUDlvodPkTQnpnhEz47OPJahG1VoaXeofC5tT8fBG0ST0aSvspJwzhitj6?=
 =?us-ascii?Q?btToJTpV+yeMD2H/a6s9+V5FM/VRL/zkuhzJM1lUuN0Dp1q5tYaVqXG+zxJm?=
 =?us-ascii?Q?2sTptfeDlUnU2Ee6qX8OT+qdpURhfw9TVlNdSspz6uZw/5QEL5P5NITpBYSl?=
 =?us-ascii?Q?M/0b29HGE0DTaxbc387j21EAca2tV4ZIK8rFbNyKMpIarzjCd93KjGIWN3Km?=
 =?us-ascii?Q?yfv8wj5QIVyZfwxAfhPOAGUoi5bPUjlgzREmxHZ0OCqzBJK5dmvIRyX8GpGz?=
 =?us-ascii?Q?RNDzEArYHWAZx2xIKip0Ncvo6BzaHGIJ2WVhtl5Oh+GAaa9BsKv5UW4y7Syb?=
 =?us-ascii?Q?6oA6d0YVXtNV/cl0lC3zdfdq00FgFgrSUScpeO++uySACzypYPF9espgkJA/?=
 =?us-ascii?Q?uTuPmTFbDBJQSkjFrCF5o/xNd2/8y9rF6NWjhPDmX7FuymOaiiBJQJW44A8r?=
 =?us-ascii?Q?Mxj/Al0kXc2SN8It4QWbxej63PoTo63mqQpySZmkMYcmB5nBWB89sM45stBn?=
 =?us-ascii?Q?xZqOb2SaxSAOm0ouO/J2zjfRNhzB2qQn5WOMaJ2comuuMhcv6FVSDaV/W0ly?=
 =?us-ascii?Q?MoTPhdezqG084htkxasUgQtlvuARC1ev5CcybM7cHdwmMkrYYw+4iH2Ni2sX?=
 =?us-ascii?Q?4h4tRdg2TX71/2ecSp8bHBdXA37t8Fk6rgUZ6TnIew9jtUtzfSIOTE4A2tyd?=
 =?us-ascii?Q?NB7o4PqdHw9iXPuZ0F+CTCm+/TSDaPipAnfrPOxtXxrE96wZZVbU+dgv++Ui?=
 =?us-ascii?Q?oNwuGMBBNjn4dKm9CvX1KVuezYxF5mWWpMpwxpxrqB/Q19hve9HeMf6NaRvF?=
 =?us-ascii?Q?Z6qgAdCJaN5WwkOt7f6W4DYdztkdlD7kqod8nH56bFpqlJBDucjHgclM0Hrq?=
 =?us-ascii?Q?K4bu+DM1cOOIHxNvBKQ6Z7evfN+blQpz4nKpeX9BXzk4rjGPqY9zVG3eRcdq?=
 =?us-ascii?Q?VekKlMdk2t8lChB8T6RrQGg37EhVloZGMNZwgnAeWhNUb5YtbWkOxf7MZgTa?=
 =?us-ascii?Q?Pnh6jAnMzgalllgfK+y9WECR5FmhRJKp5d3a66oCJRdL1VivRSzzhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qAWPRvbyFEhPtiZzrrPg+Jj/KxRG9nVwGKJPOTB0/JsCDuen05rwxm/sx3km?=
 =?us-ascii?Q?O5C3zib3jENzeaML9/M7Tx8QAZm3Faq86pFVmkfDRjVMFKTzfAWm9vgJk79d?=
 =?us-ascii?Q?2CuwPLTM5i8pVSFAE1vxuXTvNFAt4Yl8UIMy4iYCWlihnLC6OzlzSWK+l0fh?=
 =?us-ascii?Q?EIfTjUZmXJDFxgVFt02U45Ja45gGW0VBtb0fEeNOFX0YrDRLrZ7RbNEUQWWh?=
 =?us-ascii?Q?LnLPV7o4Z9h59YY4YUV2y9+UVNkDgLmrG4usu6jDWy7T8dVb6voy0zb+fzyg?=
 =?us-ascii?Q?l6XtioLEDyh0RKQleLOWUTEZ7I2CnpfYtQutGOxHErYa1/k8K8nU3kQv7Gpq?=
 =?us-ascii?Q?T/TmC4cMRfS/CkvMhtMC+frNQxwZP8QbTbep6FKale+FjlFCAcnltuDtRNLB?=
 =?us-ascii?Q?0xQ47umbErlK2FWbWYFpAYmFYxbybeStVedOzHnTRUnjWLK14pLAwGWfUzgw?=
 =?us-ascii?Q?+L9xxe9zUpXbvygbf2t1GEspA9nXuyJhPeRq1wMvNrqogHLp02Z/ERY3WI2R?=
 =?us-ascii?Q?C+E4OxNnGuA0VJo8R6wXA2uuJXTTTaYTMbwMYoYig3m7JyIPwVTcvfOiFR8p?=
 =?us-ascii?Q?gUIJEYO1NFSct4RBkmasxtArdCmEHQUK/ov4YghogU+hbOfaWCS4HGwz0nuE?=
 =?us-ascii?Q?+y/Y8OE4lyLsGvTMZkzhug+z4a6F0t4tBAlQIV9iZenZ75LLDgQe9PX5PPtE?=
 =?us-ascii?Q?5vk09Atu6G0dcR70j9KesOtxNTzOVOQOJdBzeTzl5NtXpzvUumyt6w39Z+KB?=
 =?us-ascii?Q?JllQtpBs/529tPycHpa99M9kcwujdokllApQIpLrZwPYQINbtIMI5//8pUAI?=
 =?us-ascii?Q?PRTtUv5SuEPN3h/BtJtf/owFCpzfzLpicgDuakk4T40e/6TyBZj88wMivwxf?=
 =?us-ascii?Q?Q35qnFKhZ6U61756FBNfEirKhTksNoL/h1ymLWdgod2YRX/tkr5LesyUE7mI?=
 =?us-ascii?Q?IYhi1tzK40cMdznxzhYF+WMjzIC1vNsdUbPCkW/Y/ls8xasDXFqRuJuQvRBp?=
 =?us-ascii?Q?ByHskgUp9e/+1XaLNDdlr0IrtkEEXKN5mKQWkbjElMghnHaNR0Fs+IUY1LKS?=
 =?us-ascii?Q?pBRWW6QxuUSPEtS00GSidmpvRyXfW1jilbsXfmPTKYmsZJTI91mp63D3nDZs?=
 =?us-ascii?Q?iqOWvSpphYl3vJ5Kz+u1qdPzhfrKOIM7cvXPSw1SQCfavIMqQdwsrE7cGIET?=
 =?us-ascii?Q?BGDenCpOdFnxDB1BZedrKiCiDfakhTBHyKKwRN2AE9J1zIMdmvOP0zKZRfwX?=
 =?us-ascii?Q?hG3gaj1dXoo6IhlYQf6qtamry0ZNzo0+sbNazJ9Y42+YobT5TPUmtt681smI?=
 =?us-ascii?Q?wx8awhhb0U1S4T42tVxLKtNfnO5v0b4Vsm/ElY02NYJh/j8fq34eXOrPK6PI?=
 =?us-ascii?Q?NweiZFUYa8ryUlUE2T83ebcdZEWNwzuC5/O0FgyHiJsbKqYRuk/I9t+o7KWc?=
 =?us-ascii?Q?khxhYHzRg07OJBHihxWW/XmIGXqU4N/nMnjrIYek4I/U9NC1CZo0LlV1dsiA?=
 =?us-ascii?Q?sccAdyKG+vP9uSd0HyQMYtO2r0s22Mc1diCZg76VuN5K1An+PJXxR4dC4f47?=
 =?us-ascii?Q?r0TqRNFz+fbzoBOKADtl31nLqDUbWtsubPVZJmKY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b760d2a-f71c-4bb2-b7c5-08dd4ccfbdb1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 08:15:28.3961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EJhfyHOeAsnPuBqYH0stfz1Vpz4qLzfqxr6jovQ2FyKavO9Pave8PZTiI0+REfLmoTv1DmqxGNx7umJBmQjhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9629
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Update correct dai names which are changed in CPU dai.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-audmix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 50ecc5f51100..dac5d4ddacd6 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -119,8 +119,8 @@ static const struct snd_soc_ops imx_audmix_be_ops = {
 static const char *name[][3] = {
 	{"HiFi-AUDMIX-FE-0", "HiFi-AUDMIX-FE-1", "HiFi-AUDMIX-FE-2"},
 	{"sai-tx", "sai-tx", "sai-rx"},
-	{"AUDMIX-Playback-0", "AUDMIX-Playback-1", "CPU-Capture"},
-	{"CPU-Playback", "CPU-Playback", "AUDMIX-Capture-0"},
+	{"AUDMIX-Playback-0", "AUDMIX-Playback-1", "SAI-Capture"},
+	{"SAI-Playback", "SAI-Playback", "AUDMIX-Capture-0"},
 };
 
 static int imx_audmix_probe(struct platform_device *pdev)
-- 
2.47.1


