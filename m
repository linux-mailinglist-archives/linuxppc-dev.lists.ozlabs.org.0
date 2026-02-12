Return-Path: <linuxppc-dev+bounces-16827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIM/DI1/jWmp3QAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 08:21:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF37C12AEAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 08:21:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBRZ12pHcz2yLH;
	Thu, 12 Feb 2026 18:21:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770880905;
	cv=pass; b=iAu1HF8mGqjDQZGeYmNXzNgPm4XYLavoiHWMh0Czj1qJVluIyinMoVKcw27EuAtvFU+OIn6I4bhwO6izt3iCN9a9WchsORsYqcUxZhiMk5CqwQZbkgU2mTF/H+mduK9kJrzhADo3M7rwlPV3Oc8rehpoTUu7hVmT2HpY+L6byK75016gsKcMyKpB17lqwJ41hd61B68fFCzy3ISGO7CMfYsduK/f6QvqWMd3y29hZxTuysZY5XdHmqPqjYxNKR/6uaxehXqNW7XgP1xESKlGYDjD2adeX5xnYeDPnsh7B1PCCxNrZrl4JpTkYTGPjf5NBRzBzpt/KIk7DmBuB2GtJw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770880905; c=relaxed/relaxed;
	bh=CkzExf/GjOzz24jRebpdrtJ4Z9/a+ntbQuN+S9lP18o=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JPMpm5FqEmrh6RDcxtbPnVuCdk9Y0Nt0wP+2yzdFn65SyIb+08cxFVoYKlbD2o/uEXxGDqaRM3LfMNhI2JpUTn4HP3Gp6vhl2Q9k0EpbjF1sDSE6AegoN8S3/FOgrJ6LS6dkvH1/Bl4DRjwwyhrwB1PMu/uZKmYpwmZRTKPePWaAssc+nSVDn/WLTA4s6/oBxUrilpSquQkzwtqmEMCrS3leoI0fVe6U28VOAJRsTxC1YcjgD7yfmg18LHBh/ry+z69aKvckP2ZusxfCyrak0wVzcEQRbjE3nG6YGqbQe4DQbFo34b63AYUENN8ncC0PnyGT6YP0VOzoUCnSVoEONQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jL3yq+Wn; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jL3yq+Wn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBRYz1CmQz2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 18:21:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIxr8nGfC/WQDS+be0D45CtSFZwPc52jNBqh2p683qSjqSC9EBoodgMYWjzzaA/1R/7b8HRlytOYtEoVDkg+7wHAL4CsPvO3Sf6zsJ/o5T4Gw+4RhqOZ9TAW3Ip0dlXfUBNBatMxrUh0L0UaotPjUI4aa+iUx3U0KnnJjgnFL3RgFkOgg6b1pRA3nkJl+OBADVCLyydGN88xUnTJEvIit3pIFHnDVE2GAi+uU5+xx5KDOCSQe7lqi0KYmaRjX3FO+trE38jUCAa1+OoZMGQ8bN3bs15NwEGJle614w+doEc9kiFO1x6B6lKYcnSE2Rt0HDvinQPIQCdIT2BilAAE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkzExf/GjOzz24jRebpdrtJ4Z9/a+ntbQuN+S9lP18o=;
 b=UiEASiUo30KPFrXZyT9hIh/dKXKT7HqRjoSnzGlHwtD0Z3i8wcFp6bh44ZY/zP5puFXo3aWoqnFl3eZlV9O0wfm/fVFOT/tGteKW5xBCFu0uXGsNET/mvUq1ej/M9HGh6kn7HsXNwkwx21dQWBUeH+kLs5rSCXcf/jMVa6ezu9OaEEz9kKrUge+Nb6JaNUqxY8TeO33cZI4Sxlgd5bxGOQwiFy4/+Ynx91zr5DbMf5ZM27XR59MpbVCtdQhddglnN8Ogod2OEtcgAgQrmiZNgwjVRrWzK3Wx2sBt46UCmeBK+eNFj+fZpZWlT4zYFJc2B2M69OS9YHr44nV+UbF26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkzExf/GjOzz24jRebpdrtJ4Z9/a+ntbQuN+S9lP18o=;
 b=jL3yq+WnSbQuQKebToUBXYNnfPG2z++/q1OhloiZPlTY26RdjvLdguWx1ZporLYmc/G80exr7ErL+9C/NFlc3PF4YNTjhvcQ0YyfyPqkTHHkn5Gsh8zo9dNqT0sUPrfChtUmfSPNzV9lcicxUeyjeWe8pDvtJI5CfvDDCmx22//UkLZtQgb/oNYCNrl0A4pVRZ8engNZ+T9DJ2BZ9tDdE/OmYdH8AO9SwVyD30JoXYtLbnTxWjz68Z51/iWu+8yezx2I2tECa40G3puCVJcCLeZVnwWxWaLsItbJRLrJfaZrGRIyQttgAHRCz97csnfVNHRDnzmsevUnwrJOaHJWKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 07:21:11 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Thu, 12 Feb 2026
 07:21:11 +0000
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
Subject: [PATCH v2 0/2] ASoC: fsl: add bitcount and timestamp controls
Date: Thu, 12 Feb 2026 15:22:27 +0800
Message-Id: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DB9PR04MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e36e87-a119-42cb-b068-08de6a074c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lOBAdtHAHXDXY9jSfQEkDyZrL5OhgpWwqzzQXCvuup7WdC06xpvzf4l8yVcV?=
 =?us-ascii?Q?Uj4P2JN8IH7XIDOhmEJW6pk3qlJaoKSlDWMu0Fl2g/RKqFVolLdE2E45MlbH?=
 =?us-ascii?Q?pzk21Hc4NaBHUtgMhdyZ/WYBnE7KddlFE+kDWKBHWsFGSQa0HhRdN7RgB156?=
 =?us-ascii?Q?9y4hL3RgQK8A1r+nY38+Ny/QuWY2M0FcP0K1Gi2Tv4ULBgZZWMkgP0C916Hr?=
 =?us-ascii?Q?9e6MtaFUjBb7IM4OO7mg9YrmaMUxDHHIOpdKclZAD3Rlqb/LzeUYju1plSHU?=
 =?us-ascii?Q?A3WBts4FhIRSRw28nrvj+Cr/RQpqMNQrmprR0771BE7Qr2TxVKqot0GZ0Lj/?=
 =?us-ascii?Q?N1e2s5MHJbcTaPPCA+2+kQsNJTMaDlDDT/2R3OWBYOpZULU0HnzeoFE0T5oe?=
 =?us-ascii?Q?A/GArUgMW53rP8EjJoX7I0kcUTHLSwH9IqE9PyqHvdP7F94NcEo4nj+0Os3Q?=
 =?us-ascii?Q?8I8vMSLqVnQb9rG0nOUOjxot22HRq0jn5hcFEFnMxW9D9W7NVqGfDL6EUYKR?=
 =?us-ascii?Q?scsNMW9+UT7Jlz2oZ68Aoc/49cp83kS6mfyIPdzBqcksBsEQDik+xgeDszja?=
 =?us-ascii?Q?Lo/u4kmvNVMawnd9/GitwIfRs754CzX7F0Y2Q1tYL2thqtp/0fIhv3Z4W7aM?=
 =?us-ascii?Q?GmxkyYkbzqtaa7/29UguVs3U3BL0ITPYhQ3DJD2vzcN9TPzo8AakTX+l0Gj5?=
 =?us-ascii?Q?e6P2mSWmTn5vaAkz6AHXGPjQUHy+BrVqvYX4+eL0uSVqimZVFEBw0OzDCJyt?=
 =?us-ascii?Q?IxfEaqhOmVEnQBI0ohAcgY08KH3fzsdSCgmYVVk7xfZqlreSA9HiVAhkNfdV?=
 =?us-ascii?Q?XwwgAlLbryZycdPW8w9raHgr/MKOXQXuFg9bDoh3ZL/eN0KXwebNEZtLuAIj?=
 =?us-ascii?Q?qPyXAt+g4xnE5B53TyMajiA7wSdeEs/cnuUeuOcS1YrJdg7sDRH23kZJLQ/v?=
 =?us-ascii?Q?OvpdTtVjuzUrMsBJ54BZ9M/U46/aHwiyaFJvXzz+IMC6WYbUJjhmfAWLFJC/?=
 =?us-ascii?Q?oRbWz1mj4mkjLJxFmYG01jhULiKN/8muwRSS4TTFcOTowb5pj0LRxYa7+HOB?=
 =?us-ascii?Q?YsOnSOanpi9+2kmkLhIYnuL8z6DrIEnxx+l8KTBG8fkCmN+9C6CxDU553rl6?=
 =?us-ascii?Q?d7jQKmIWwLLrpUQT+odAVf78ozDEQbYw3oQwRa89+JpiDzBae6l357edtCio?=
 =?us-ascii?Q?yblmZnlz75FS4rdcZGx/EBjSWTZUVyRkHt/VbCOtm2YoiDSInVfnFLvVrIjj?=
 =?us-ascii?Q?Wmc4rsYvkIbuiqlpIMYizSJsHvmPz0TVy8A3MOL6zNn9eHsJ7KpYri6ncCVv?=
 =?us-ascii?Q?cwbVezC12J4GJVTb7+kQvic3CB3wmDpujx+DWB/a4/Rb7sQLm3AB2RBuercA?=
 =?us-ascii?Q?3cL90U/OplqfaXRNein3FMOcn3MqcNj/zV0ONHRTNlhU23xh2IsvVeXoIEDR?=
 =?us-ascii?Q?gkgpm5RSmYh0Vzq0Eu/AqC5qaCcS2NFhGqHxm11lgfrjZ70kNwFaXw1zZWBM?=
 =?us-ascii?Q?yyabfBh1TQsENFrPxCGHj5mPjU+H//GzVoNxsBpsFGg4pEkG8qo6Xy8IYkA8?=
 =?us-ascii?Q?DjfxIhvDiP5HCULFj1mpkldQ5FpQf3HKBaBxZdnGgPu/ZZJZbapEu4ZcelFD?=
 =?us-ascii?Q?2XdviXgD9KsT4b88y6GAdQt1QSx4/sBPGEu1eiAWH4PY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ao9BkCe2ZJyw4PJTEN9mjobR1WMB9iq7FnTRVxrk3syh0q5WDqOFz/+TSPr4?=
 =?us-ascii?Q?CkcBZUOgXTp4lk/yHVJKGqK8UdEFbh6Y+QNqlsONYAG7chlA5dDH1aBJ07Ni?=
 =?us-ascii?Q?LV7Aa6xjV0xFifWMJdM95gtVuvrVvPxqqWziR5oN7vfFZVO3Fc5bxwQTKB8w?=
 =?us-ascii?Q?n1Ks1Pu74vZoVLKn0mh1qDmMHk2Qu0B38y53rv2gYY6zbWsCL6bhHF/rW+MY?=
 =?us-ascii?Q?o62vk33XGzlWqu8vlM6LgfxB7Xk4H/fEo4invo6vjG8hUIyCuYmgP8h/4rke?=
 =?us-ascii?Q?Jhq5W4+UzI8+kvZ2l9CgIVYjoaafNCFLQQfwkkIrw2dqP2oHPMQ9YspS/m8Z?=
 =?us-ascii?Q?/Z6P8AF1k4d8ZrT9GeLegDlJVMfQVAWP5zC3MAQaxpfAoTjioR9egq2ZjG30?=
 =?us-ascii?Q?lZ8kFxxix6JPKf3glegHNSIkJ0umP3Ncx4ArtohcXB7iWMmLPI0cWWbp6gUy?=
 =?us-ascii?Q?T7npaag0HFBjOSDy45u+et+tCJYMbNysIWJXJPDZflacEVnucKT/kMN21WQM?=
 =?us-ascii?Q?oo5J5bXRudCVHH4RrmkItd3kIAKBV14xy6MOtlFt6KboJidkMsgESnnQG/pu?=
 =?us-ascii?Q?gvDxeoF7co1Faj98oSnWZZJn6nhk9kytLbj4wHP29NOX2TCnb8Ay1zwlHNmg?=
 =?us-ascii?Q?dnRrhkG/2bg66/aE+eyOxiw/4ZAGQoIoguR599k5Sd5Ay6VK6dJrK07qEBCd?=
 =?us-ascii?Q?CgxUN2OZbO676jAu5E6/+FUjpK7XRwsdve4FXeKDgd0oUCxv+CvkgJG6sFb3?=
 =?us-ascii?Q?O1a7tLE+MJB2qBSFwgBzoY5Jzj3jboxjY0r0Q1a5SrAZRcEneFxt/ElNGvxe?=
 =?us-ascii?Q?nwWnU8JDQRYIlm7gDkBBW0wuJawCrw4/eJ+wTRbkhfJPZCBSTkso3txnCueO?=
 =?us-ascii?Q?bPb042Za+/qT1yxvjCLxxc9iUKLugS8bC/TfdhUHXKro7yvOAwxrJlOVfnLe?=
 =?us-ascii?Q?es7BVSKuC0+/dQgpYiSuSFELti0895kKdtzqN2x+F6ylp6J/QJAOK/Z2HYRu?=
 =?us-ascii?Q?CKjotXZhDQuBvNslSn5OyW6pWCHzjW3vLRR+NEbhWW+kCqonScTX1piuZbKH?=
 =?us-ascii?Q?p0NqsRhdbu9Xo6v8qjxi4S42qXVXbZqU2NDQlwZA33P1FLzPjhd1yE9XHqMi?=
 =?us-ascii?Q?MLZy1UthqLJYQ00oWZsCkjZLUwnsbuDQo2kBmh50C+axXfot1/3wU0fdr8rM?=
 =?us-ascii?Q?4dHS/qSo1Tkajox3xtzKCHq8sBLzqsKJVCpY9ihadXWP32eUjw1u6lbv6x8b?=
 =?us-ascii?Q?J+VGcKRS3yPEyzcoyQfZbYa0056NCCiIXMZE4e6MRABHfW/Vc+1M6M7BmITz?=
 =?us-ascii?Q?s50jn3tUWBABRgrPFWPPuGD7xdEl26PMDlcJxkl00wpIWLig4ttg0TFGhXNQ?=
 =?us-ascii?Q?2A5cADVYBDoRxJVuJlEGYNcEgnrHXVjhrD9tbqR0V1fKe/KbZpiJVq17BD8W?=
 =?us-ascii?Q?LFit0AM0fnksLc4CSHicBYvOejHbiFdgL1BTKh/Rt3nT96IJ9eFkZ5sAuXHD?=
 =?us-ascii?Q?PsWUugN1IdCIPs1OmIl6YbzIOy3Y/oBIDMRfJMQjfa+KcBiipdpmrR+82vrP?=
 =?us-ascii?Q?2KsHPY3gT5JUfnt3QQovmnXd+BCgGJAnx+zcszCvL4B3zA1M9YLiMJgoE5ko?=
 =?us-ascii?Q?P/wLhOty88PvZ0bGybLb8NgA3FJEiKVrYKfSaqLuxqHtw2Yw+VM4/kPt39EP?=
 =?us-ascii?Q?RdZFNTR8Iv1Wjvcntry9k3Rq+GnyMw67hVNdtWY+MbxG4fyAzZfYFeslGgh8?=
 =?us-ascii?Q?F1t4jnp5bQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e36e87-a119-42cb-b068-08de6a074c27
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 07:21:11.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAhYTyb1zbPYEwpmZTKGYHLg2e5WMK10Pz7rJJKZZh98ALPJ7P8nuJoB8tNqgvSe1Y682tFrwcUeFirNrqy2cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9355
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16827-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: CF37C12AEAE
X-Rspamd-Action: no action

The SAI and XCVR have the timestamp counters and bit counters, which can
be used by software to track the progress of the transmitter and receiver.
They can also be used to calculate the relative frequency of the bit clock
against the bus interface clock.

Changes in v2:
- remove arrays of enums, define transmit_tstmp_enum and receive_tstmp_enum
  separately.
- remove __bf_shf(), define the XXX_SHIFT macros.

Shengjiu Wang (2):
  ASoC: fsl_sai: add bitcount and timestamp controls
  ASoC: fsl_xcvr: add bitcount and timestamp controls

 sound/soc/fsl/fsl_sai.c  | 50 +++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h  |  4 +++
 sound/soc/fsl/fsl_xcvr.c | 56 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 18 +++++++++++++
 4 files changed, 128 insertions(+)

-- 
2.34.1


