Return-Path: <linuxppc-dev+bounces-17761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNh0IhL0qGmfzgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 04:10:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4820A6F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 04:10:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRDzw6qj5z30MZ;
	Thu, 05 Mar 2026 14:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772680204;
	cv=pass; b=DUlGgR0RJsjNPggmfAvuHP1EjIoB36KJkf6j1PfrbGLE5JGQ8mbfEOTJpM4ydABk4layekxD1ae3MvADd7uqYsqwMbVx585Gsmm95CCv8UEFi6s7ATd/fVnm0XK4LzWZxBT+cGBPi9AJdq7r450eEpPZ6gvP7/8VUcFoRy83l8hz1Cav759kmvLUDXj5LrRNixei/8VG9Ic/HVSXs/MAjB9dVdXEZFGnpXOZX9W9BYaLfPFqGFrP9T6hXoQZyvyRjg7BD3D5kQyOcsC0eGLCgJDADLsxWqpacbEn1rFq8ar9zuvzO8jg8kvF2WBa6u0N6ZAerecmR/vgjtBZyqLgvw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772680204; c=relaxed/relaxed;
	bh=yNUDy3V4OPHAPfIylWbACb7QLAk9wR6xLKERnxjo+wE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IVepis0U8k/TX0tcFLgHzsHKeFIBjTnXT7QpStemBZ9mreyFvURi0A3DRJuoajJPWVElVcIekCLwOccCr7zhLVJ3gHsn9WMoMSSySRhhmMCK3kXgflWs/WVTd/LetkpUs22vhw3Ynwo9Tv7SrR9Nx0McCslUbX343taBM4XIjtBLrvpz4ucmDaT1lQlpmYuOgSmfUHuQBDOnRwim7bKIG3Q9JaN281QHZv04z6m9ipaIxf3X6I8WXb0qfe3iuizkLfDnJpUtu9V9BcIc8BGo4MtmBO8vxetQSsGZrYhJI/P9S6B1+sKxKN6AfNxuyL5s1ZV/KK+fBQxhdE1gH5SIOQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KVh7RTDB; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KVh7RTDB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRDzv63mkz30FF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 14:10:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnj0tAU5dlaNgNCv0O1Tk1tIpuqQGig5XBF6NFidtCdHWGbr2/awbr340NIfBVoRc0hYr4pcvbmOaI8vSANsGjGui8F5dVI5R0PaqMC5+lFbIVHxtl19o6BMoSY/oylI5Ah0Iz9+LSTR7c3ubHM+hcOLc1HLCuDnfkxUtDFy539p7DE6L7stX/MOs1TTFrZVqRvpNE/gIXlBin7tT2ZH6o1VFbeJEEuNnSjgkLrgt2csKijXUzCEspARAtE40Pv2GORhtqCy6VvR5lVdRI9SI0Op+fpWpX3MeWf6uCZ/Vie0HB4FMR2JlBnTjbXHqsuYCP9FvMJ1hNLTTpQFYHCdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNUDy3V4OPHAPfIylWbACb7QLAk9wR6xLKERnxjo+wE=;
 b=UuQxCPIawzLtz41I/NXiy2mEr6Lph1Z8LTqnmET5OXxuj09QZIBzPY49rZRHZQU+UX2CFMqIefCbshZtlPreaWRQIuq8ubzBD/PYqqfFtSsudpm9BEEg6QFpthqPbPus8T95w0c77Jwun92YEsNgMiG3s7eSL3N/dDoO1nF5bF5rU4MVXL29GOSC22l4p/a3+qJWqFo/oCxH2LNGf0xqJrOV/LyC1PcWd0lAJAVkQ8e2vqNmYsMmG/GLhd8dsBokywuj8t+xYfn2siVQYiiFYmadCa9ciEpL4MVfdc+IU4GppV8K5+t5vD+xRHxKFBCd0863/wiavPRWSMxanfRAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNUDy3V4OPHAPfIylWbACb7QLAk9wR6xLKERnxjo+wE=;
 b=KVh7RTDBMADKiEOvohw2J6C3HCetJtq8OtjbS4C5583NzqKh2/eOdf4kdTligB5VYYt1/q8teuIGwVOUADgYjOjGdiiP7TKDDOtd0fE/yms3rmum70dCA1d1YMoNmd6YJvgsJfGi1Q/q5ziP5midNA1+ZZ9v7+QF+QtGQIXVP8o44hG6K8uHrphDaOrQGF8qMSxpfCfO0fXuvP6U1z/Ws+QsAoZIuKK5t+GqwqxJ9s6uLWMA/r6LLKZBGL2zbo37RtVrnBlBD+vH0xEi1l4k/Wr+8Lz+Fjbzq9TCUhYHPbrnZqFLGJ6arKKdxKRXKSwqGmQjt2OBVvMICQr++hfUVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by PAXPR04MB8159.eurprd04.prod.outlook.com (2603:10a6:102:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 03:09:36 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::4dee:baeb:a5cf:1664]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::4dee:baeb:a5cf:1664%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 03:09:36 +0000
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
Subject: [PATCH v3 0/3] ASoC: fsl: add bitcount and timestamp controls
Date: Thu,  5 Mar 2026 11:10:28 +0800
Message-Id: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0094.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|PAXPR04MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 24041732-e318-471c-7945-08de7a6498e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	EXvdfdFCjwDi10VVQygrlF3pkB9slSQHtja1QQLu2psdPDa7lHuA41LEjjuy5W8fclouaIndBNCU38XCSu6il1+w2/SBqsc9Rt57hcHVRwBjMBMH9TNlFRIu41valqtIhy58mvuhGjnN5k4Vg+09jGqX/TNYTsXzhwV2iO+T6KbimuDIXP/6ls6CzLptHYuSZDFPwbwMk4h6GrPyOkbjGCeFC6UmXO+NzjvG2Q+fwgi3RI4lP4lAXIZx4dKm2zzZy6C1iJy4lFZnExdnSRbfNtCYRAjauekfWHwRxPZoJY0vOkChJ5AOLRr2JL6DR0jHu6mOgUBBp42RnybAzTii8+BO5oCBctoBIaUk1vSYcKjJq216CjLNg2d1BwUx1E+5cmCigJWbH6CL0Ny+EPoZg6V1MBpFo3p7Wr66uu/a0XCM+2nHVc7qFMUibDmtAypw8f0cu99UYF2nB7zsPw0sY9JciDrHCkbN+nzHcXLKovqPXsPU+s++fUD32R7D9DDKfY0FNCb0RX0wjjMXQV6lNdefdGhR4JkYfTZPOOE15GZ6eObtTyIdBdOHl7v+4nHm6PN9YWN04wNCjDfSYPAbeeReExDev5kP65tzQYoyNheoEzRguYcQ8bbWIZ20cD7K0F3UijUNrEc5xtuDmcZca3ZomwufcH0praPXoBs5Z9JEDXglvPjn3K0HTpTZNDKIYW/e1pIfcAxwT0itzM2RV3BmUlY9VlNNYI78bcvzxxinLUv1twp6wAmsk6gcwUKvSW7GVXKshi746TSwO6sGoZ2k0iGm0YpFlHUvNMHNNhjhnBBjt/eHkxiK5x/Vbsf0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tUML+RDM8j3ZOLjYiMsX14rthCGBJBrEzTCsZRxwdLNxCXKaqE9D0fQ8H0Y0?=
 =?us-ascii?Q?LbhPz31A5l5py8nm+XPHkiHhwyvR6JcbKqXop+pYh3ENhgG6wjmc/KLMOsxc?=
 =?us-ascii?Q?3xCTUttlFOC+FAEd7tggkpcYu784iajxZHmHKP/wsNk4WHipSyX74O8HlWqn?=
 =?us-ascii?Q?eQVAcqesaut2GoNpo6iV0hXWQX4HPU8g8Poe5F5zom133735tGcokVv8Od40?=
 =?us-ascii?Q?FIg/mwVMwXIwcfNEMVA/jzoSZgszKbFKg6/zMn9A6RKwpr1xq/DhlrxkTPJ8?=
 =?us-ascii?Q?h5/eh2BMwNMZwHHToPtaNtB9Ynjy/SA0/1Re7HYZ9i2wld9nYwgcdm0zT2vY?=
 =?us-ascii?Q?jNAu9JEM8FtvXhop3leV7xQJEFSv7zXt31XDgYxfffApmOLU1X/qLiyHKgvM?=
 =?us-ascii?Q?Zq96mwPrYkj/xw+5DqIaguXuzjcV7pf1wGq75ZVHIPM2PdIUk8RU539GhK3y?=
 =?us-ascii?Q?VgrBCpyJzW8L2ElxsSdZYxmNmvLpN91AQfxJK/uLXw4/yGPqjBN0TK0u2Ekn?=
 =?us-ascii?Q?Frvn5NlvYn3FX0y0PyTx85/lmAGcWAPsKw5KodztcDqxhqVhp92VY0U2UOS/?=
 =?us-ascii?Q?fvNzmC4qpyAcvSS8xCiqiY4iUoxtzGIRQvj6tSBQvULddyKlpQnbc509FHXz?=
 =?us-ascii?Q?MWB/3oqkbjKaf1qw9UMZcmAy03eaePLc1S828UAARy3DcJFvIGDdW+maGQEM?=
 =?us-ascii?Q?DmcVY+HuLNMsgTNtYT4GrdE/T0N+SHPSaQaviU4Yt+Cv7TlgThsxGE/n/EGa?=
 =?us-ascii?Q?EDGoTmdxq1/W2dQ4WpXKjSbJQuwOksMYtqKkaqBQWgvDFzJP9gxKVG5EBc+t?=
 =?us-ascii?Q?FdacS9dON/XuQDRllNcU+zz1E9Th5nrpK5DvMC4TLGDQ2h/0mzAbJM0SEbmv?=
 =?us-ascii?Q?vKbYE4A6Z/VvU4lPErRypYTPHrgDgA6/Wt6djj1YcXmenlCwM3mPhWetFpyH?=
 =?us-ascii?Q?rK9GgBVL1FLqjlTuWVXJGUroUJoOxK+ibNUdDbozh2wLIO8m21QeRNmgm/XF?=
 =?us-ascii?Q?yOeqPz25D9NRctEoro/GXa8RzXDqh5hHIU5RI+kYLpNyYidy+GYAJxWH9U2A?=
 =?us-ascii?Q?s9p5Q88QGde4obGWVQJu0KRX0fmsf1Ah2bkJK0X2W77MCUUQQd2nOWcYaC+i?=
 =?us-ascii?Q?WWHBPrwhlv6wLVP3Ho7zZP5xcax0heS9AUFXvDicCFtbhrrF5Isbc/+r7R4/?=
 =?us-ascii?Q?ANxU8h8MSvIqkDu+PIPYO27XeAa5Vu5st9hJ0z6q/O1/sPfmuZDvcTIIOjVe?=
 =?us-ascii?Q?nxyRFJVjWTQto8CRHdTATdqYJEmy4UUrIDjWVupwowCWXd6mqVtXJZsRLnFx?=
 =?us-ascii?Q?FSgRpi00BsczzvbaHiQw10GiXiqdMX2N2Hv/IS2Wpnp/0WrKF5r/aInpj4ZO?=
 =?us-ascii?Q?8Dc4pup5vksyu6Ea9vuzkt0iK++xlJLu7DtW++9jg8d440q6NDzSgugBFB+t?=
 =?us-ascii?Q?drFEFrKvXrmH1rx6F3idsYCGzEHAP4OUFUFmWKa+IqPA+DBr9MjCHR9CQqmq?=
 =?us-ascii?Q?SaxBjKVkEPnvyKSU6Xi5T9N3ZNE/kQY6ElYV9FE/tHQ61TR3iTh0aMnnVgad?=
 =?us-ascii?Q?OsWLQDnYemxopNTWX6T8lAlnYUQOmP4YWA2APctiPIyYh9HUagKV/WAiRBMu?=
 =?us-ascii?Q?0lLsYRjq4moExbv3iYjuEpvYDjW15j/LNCrzFr9idH/az5UY48go+30hGLvr?=
 =?us-ascii?Q?6YhkbcU7n+KbGZ/zPsHX6aochGQd28lVNvuWNfD/Oi9KYmu72p3erK1/beTd?=
 =?us-ascii?Q?yMkXqXxUrQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24041732-e318-471c-7945-08de7a6498e3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 03:09:36.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsmgg3pmumDzGUWJFlsO4YFAgVxJ2vUatw+c1Uir2Gr6/Dsj2sIaGAuxOiRSh7XXU/ch0mXByOuLu3x1oq0bbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8159
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 87F4820A6F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17761-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The SAI and XCVR have the timestamp counters and bit counters, which can
be used by software to track the progress of the transmitter and receiver.
They can also be used to calculate the relative frequency of the bit clock
against the bus interface clock.

changes in v3:
- define own functions which check the pm status before accessing the
  registers to avoid -EBUSY error reported by mixer-test.

Changes in v2:
- remove arrays of enums, define transmit_tstmp_enum and receive_tstmp_enum
  separately.
- remove __bf_shf(), define the XXX_SHIFT macros.

Shengjiu Wang (3):
  ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
  ASoC: fsl_sai: add bitcount and timestamp controls
  ASoC: fsl_xcvr: add bitcount and timestamp controls

 sound/soc/fsl/fsl_sai.c   | 62 +++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h   |  4 ++
 sound/soc/fsl/fsl_utils.c | 89 +++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h | 30 +++++++++++++
 sound/soc/fsl/fsl_xcvr.c  | 64 ++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h  | 18 ++++++++
 6 files changed, 267 insertions(+)

-- 
2.34.1


