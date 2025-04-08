Return-Path: <linuxppc-dev+bounces-7538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E1A7FD39
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 12:59:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX33q45F9z306d;
	Tue,  8 Apr 2025 20:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744109943;
	cv=pass; b=SwVTnemaxKoiVkld5sqRXgBX/Jiiq7QrA0VL1ztDmHoozicVT9ytFcJHMLlXyPKC/72vAxn4lnTtTWmRiQ+MTQPSS+Gk1XoFfLjq+KuXWZ6lcYS5TR93jnY5ch7qCFWReZXoQqizc6+/aZS8n8sc8cVrmr5JviuAkHrUCI0z/2RS03iiXWPbBdLu+SOhZiuLdkpip4slt1PUmlPjCxxSJWYtaiBtG9MeqNqAtPaz1rP/W3CnYPlD+DEHMm/R+AGZEHhVoa8/bVmLrsyq/uB+6HIOLRk3icfwJZ5Lx17a8DAELmz7bMF/dZ4B9siaXk7SL2LfNz6qeh9jn73NarhhvA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744109943; c=relaxed/relaxed;
	bh=hJV0tZ7nFlMAwtqfrLg2VoVBs5pJgGRydhYiREG8aS0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=T4I8oxm6IO6dkgpfe4r4mCGUz21Y/OKqkVP1u8SmqdFgnlVXP7BNk2HHxR+26u9nfinGGm7vI/UMbz0JTA2TiVu2LVfAA95P3Icwg7NB0eU44W6+SfYEQ8mYadM5q2fdDBmcyvL9ZikoGSkG0Ti02U2yIpo7LzR1+H5wJNIXaJm9GqrHRcRifG/fKNGB1Re5D+mISPo/B97H8/102Mj1dnHCfkGsFdrqTh/u8AmwoVmdOI+b+5CYjQbiILAG8QjKloLYUicPnh8/LM3tjLnoopoBOARjsodBmzMimV9P0L7oFCHAexfM7JzzYhZwikW/6qeGYwXitSkVMBtQ95V04g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=O7ysW+9B; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::608; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=O7ysW+9B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::608; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX33n6TVgz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 20:59:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRFFZgLFlZkzOEpZDZxmWpa52i0F3ffJHUpALKrnoNH6yVhK8V1ik14K2NaEwoCdfduH9Sg+3dRQFfWNOHLZzsw13BOHWcR8hzr9+86xnAUVCJA3/8Kw2uWSScrXF1tTIKFk1j+cUj2/8OejfHDvFkij2ZROTVghtZnX9EhlOtHdLWcxnFZr60sEUJqyO6/M5Ko0Z3B5lQBSLaAUYEULrPxtz3N+VfhQF4PYFrBPBd2fz194IwmCQvjMUryDzbZq5MPJUNTQBmHRDlRle4WNRTSWBMot0cl94FqijJxZJm7q7bWsCdz/cJAp5XnXREMfonNC5Wx9TUmNkvQMJs2UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJV0tZ7nFlMAwtqfrLg2VoVBs5pJgGRydhYiREG8aS0=;
 b=YxbyDGsRgwCaLjx748MqW6mwUqhlJLVPrGIXuFQlwLdJzQVr2DZITgLdo9F5K87pXGHdv1F4CCG5mK97L/uV8QboiYFFZNkd9QFXT5CharfaXC/hldeqHdgTlThr/fGUvMDADmzRD6wAAQFzyHOa9FLLJ7NJKayTy+bOUnwuM4M7piMo9nY2HXGdi91Pag8/6YkY6oYoH3iLw82CPIjfZnyiokDGH9PFjlc6Qi7UJ1yEN2wblprpaoGDaxmw7mB9Jp7WriMw3offep6UNS3yYw2/ciGipOTK6HS/hpNDxCedQ+F3rKPL07rkSVrAZRZ5axlAdUseITjX/6442ggvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJV0tZ7nFlMAwtqfrLg2VoVBs5pJgGRydhYiREG8aS0=;
 b=O7ysW+9BDQ0fkxOqs+hk+5grSq5832RR6LUQxnImeegwDcY/Y7UHcYU+VbGvoN2L/ieBNuDz3jG1XnICsR1kD7znu/erpnWk94DHgME+hoiBdljEe+WggCKdd8aRVamj8vCLZlEJegvycPI6DRXXZKr1RPXesmcyf4Hvfhq+H/oD+iO3dblAhimos8CoHPF1Ri0Tf9SMmgQILOQcLkZrGL0B5irmqqLmQZ9HogUDS0ecJEOAeBCjSqtvagybpBKMUBtbqFYOX2hkXPEadKAA6XvOPwowPXMWvpLFaU19Mn2NVMXiYV+d92aavh9jP7gYXlzi/773Kh6+LeCXyTOwkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 10:58:33 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 10:58:33 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	christophe.leroy@csgroup.eu
Subject: [PATCH 0/6] bus: fsl-mc: cleanup and fixes
Date: Tue,  8 Apr 2025 13:58:08 +0300
Message-Id: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::11) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 87515948-1258-4974-5fd0-08dd768c4ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZVv31VQqvHhZtRRKAsPSswNqTdmyUG4/ctZB6L+VZ2fF/tib8o5dg+66f2PS?=
 =?us-ascii?Q?WudzRp7voeW7HQnVgccB+Aabc9ttEnDukcKfsMCAMR4CftuXLicy3BDKP6qS?=
 =?us-ascii?Q?kMO3I4VuA7fs7W3XCwfqavQrKIr55FFcr7GT428zaetInMzO+uao4LXh4To1?=
 =?us-ascii?Q?tuI0OoBIGCutoGlHg0Wmb5EibgbsB4DtM9TZlNju4XAlj8DPTsU+uGGiDwmZ?=
 =?us-ascii?Q?AexVfpWjmSc2KcXwhqhvV5KhK1heuC51oSJWX5bVOXhZkdeHan4halSW+uin?=
 =?us-ascii?Q?8Zyc7CB0HxO4uAsiZReYjQcLv+c4RQck6RFreV8JvdwPaplnUbZhDHgRstOR?=
 =?us-ascii?Q?cxC/BhDyFDMu5MIl4C68OINKCD+N9XwEuP2yAQKC8mPir8Ny1CzYwTdXVVER?=
 =?us-ascii?Q?3mql0+0YxuAho3Brge2zeKBKp1/RK/P+gB4luYhseheqlX9MFpV1hqTee9jD?=
 =?us-ascii?Q?AK+LObzHLpXBknKOcp38kBWTQTh6W/YDCoMuO58n0dgBPZEw5VoAOLDiXV+P?=
 =?us-ascii?Q?v2eUFiGT+fIGQR+zmiSn+wXhA63sQXfxIe5UXDH7j947V9Qb5O8VFcJzbz42?=
 =?us-ascii?Q?x5fHww/XdbkqRq07xfVhywvNbMTJ/BtSskMyY37HAEKG8dce86Ctew7v9M/z?=
 =?us-ascii?Q?Ced5Jg/CjvqYWebLjzPrnunq/005JTLhESIamRJ2Yqf6Ww1qHbYErhNgvheL?=
 =?us-ascii?Q?tE0Q/uVwPgcZVr1UZMJMCRzw4roNdF3ZXGPlU0LUYTzj5pSQQvPNie/s7cGg?=
 =?us-ascii?Q?/380Xvz7ZLgcMk86OIgN5U4Tq9HzLKaf+zCKWOdnhvqByuZdDry/1H2o8vzj?=
 =?us-ascii?Q?8c87SajnezA2/jq2ABz7Yi8inFzfaEmFdufSnSk/3bctr4lpzKkEXMwS7Dnn?=
 =?us-ascii?Q?7pMqrBtyWaX4vhjOE5T/IZXemCjv82ornyHLg9WkWymCsfb1XzyaDsjTN5GD?=
 =?us-ascii?Q?1vAE+Vqgk46PhjDqyY3v7ZERw0AvnQbBX0zn/zJ5TSXtZSzJFMCAluSJloOz?=
 =?us-ascii?Q?6oMN3Zm2/VcB9LBUgBsXadaiB37iip9M8MeULTQ29LDTWt77y921HhzPmvBI?=
 =?us-ascii?Q?Js30ZVS1cr+IR3MkviSoCRPx2PBb/iXm2FYQNfHQGzLIaNjNZ1Wuwk+zVFpA?=
 =?us-ascii?Q?ilMKQQNOShAhitYOtqXFfiw0c8BKCwa06fnL/64g+TbZTx7jPy3zsyGL8w3/?=
 =?us-ascii?Q?bh49Cw/V7w62HdqEZzsaULbrgBQU12fyKeMiSJ12Fi+CLXILm43l5bUs26e5?=
 =?us-ascii?Q?3XNukQPQqWv+J0lvS+Jt01A6ou5Ru7w2OSBfkGT7TJYK5Ad9viU9pGzYq6Jc?=
 =?us-ascii?Q?CnSZArhzIV7RcaBgybTFdw5YHGi11AWSiuioTObCJPXns2Laa9x8NnhSEQXD?=
 =?us-ascii?Q?d49GsRoGxEdzUAk33IEMq4rl2Pqi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rZIViG1eolNYSf7xVMMxwsVfT1ZqBj93UODhEKIgYQlBn0Qq8UWIHOmlUc4Z?=
 =?us-ascii?Q?lOhW6i75IzxHHQ9oWmZoQ3Ibn7KFkRdi285XInW1LminAoZWu3fZ0oCBSb6w?=
 =?us-ascii?Q?69hEgw4aiTxKUaXXERns1NHyKnM5brk31ghEf2uPJ6HnCfN5eejKzXtaouVH?=
 =?us-ascii?Q?8ftP5bG8vB600Y0pTAu7Ux8/NaXFmGq/zEtRlEhYhcmy79CpnSGKhDf19ak0?=
 =?us-ascii?Q?GbZEt8d8gHlWpqPUo/YOmHH51vot3RqujQr/RwGONdcTZk2p2mSgOIoijtk6?=
 =?us-ascii?Q?hntgvgHqX4mN80cnT/05y6Lkdcff6fYgmaMHGDT9LuBIw235P2fcVOLszmkV?=
 =?us-ascii?Q?gve6ORusN7lvNd51l2VVfk6ziXX/qnf8MCp45B1YKyFEXyw+qRCVTJouJBgR?=
 =?us-ascii?Q?0GgP8H0cmhANjrUnXY60cGo9BouD4J7iKSrGsGAfzFE9tsqp6mCOkz+k6xSo?=
 =?us-ascii?Q?hjNnpAnnDxNIGAN6X0WMWoyzWIlm3mAhv+P1MuMKBHq+6upZY8M4Y6uGu6qM?=
 =?us-ascii?Q?VfncvwTuHumpZFQGF+wyVRQF3kEXOYEuKOtxmy42KOG8UkFY31To2ELFd6NW?=
 =?us-ascii?Q?nEv6xYloKwooSern8tpQIo9nFRhZds8OIVmsh8PgPn9wfUDTHmwgUZcZdEQD?=
 =?us-ascii?Q?vGcvVYbJ/Qg58xR8VzrgO35qbP6W0UeAdj5+h6GJdCCd6PtKj40ymu5uFrwA?=
 =?us-ascii?Q?Z2i/MBbA9W00Uy3BHJJk5kw/Otw/Fzdzdymqxb6/5IhenUp3TkFGcCH9tj3n?=
 =?us-ascii?Q?8r4U2v8iTVO9VcFaUYGklrJak57T4INEyxBDylZTpmZcC+G+9Y2IM/x/4jP9?=
 =?us-ascii?Q?3/fcO2HKG+Qac4SUztca+kWGjTUeC31ZKESavxMiYvjB9dqeTxftwznMn+0Z?=
 =?us-ascii?Q?5mCf0gpjRHWZMjE0hpWmF9/t0JtU6E/k6U1LbWN9INIA+5bGv5E8OGhJk9St?=
 =?us-ascii?Q?1u4X/dMXqYwmlRaBhKE+ybQGAzBrKS3MOWt22xoU0lMd0bMzGLiCqWGjU8PF?=
 =?us-ascii?Q?z61KvQeTSdCLAhhV7D0Tf/313xFPpMi05qB4IYNLEBC2Ivc8fg9luUqJ6XUe?=
 =?us-ascii?Q?Nx6BVe06+0oApsbPOVSuecYKNCshbqcwY1JtGIzbE3q5H8rFCOUADdkwCNZB?=
 =?us-ascii?Q?tgYSmEXGva9euIifb3FpGFPDL4rgAZzaOu32V8cfy9bJU+Vvl6R6nVg2oOgn?=
 =?us-ascii?Q?ie4KCikmEDWdIdsPDu+MPD9yEMnQIaf33OVRbx30dhj+YEFxgKOGaYo0paHb?=
 =?us-ascii?Q?uhroIA6vsE3nB7blCKkx1B88KLz1byzGxu+JLcDUQLINwg5iFizmNrX2Jejt?=
 =?us-ascii?Q?h+t36XiN2JvRmfE97qncEdq8ArnWW/NCJCiAEBsvkBz9tm4PfCccCM260dxD?=
 =?us-ascii?Q?gI7UZj38oPcKgVagrtxgLMjU7uuUmOYplgDmp+mtt5lP66JlSN5irul8mZrF?=
 =?us-ascii?Q?7anPW/3fmTKe2gHPjEIRH+2qBx6DVxfqUbXiC8Gr4Be3I35evF5ezSjGiMLL?=
 =?us-ascii?Q?BHwLiEaDvu0UE2GIS9wlf6r48yEL9jthUDVUOdQsCkn0FQJcmMI2BlpaRfTl?=
 =?us-ascii?Q?EcPBBkPV4YVAZkM4nPhw5bWDkaeGMXMH5keZTVVv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87515948-1258-4974-5fd0-08dd768c4ddb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 10:58:33.1738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZ34hmDo+cSIoYCB4/qftX4gGoA/DgXWrpePurTOpmWWweOuxG9St8of3UMQ2k/1s43kpRj4DtmRJ973XZjKjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch set is a combination of small fixes and some cleanup.  Some
of the patches were already submitted in the past years but were lost in
the process due to an uncertain maintenance path.

Ioana Ciornei (3):
  bus: fsl-mc: fix double-free on mc_dev
  bus: fsl-mc: do not add a device-link for the UAPI used DPMCP device
  bus: fsl-mc: add the dprc_get_mem() command to the whitelist

Laurentiu Tudor (2):
  bus: fsl-mc: drop useless cleanup
  bus: fsl-mc: increase MC_CMD_COMPLETION_TIMEOUT_MS value

Wan Junjie (1):
  bus: fsl-mc: fix GET/SET_TAILDROP command ids

 drivers/bus/fsl-mc/dprc-driver.c      |  2 --
 drivers/bus/fsl-mc/fsl-mc-allocator.c | 21 ---------------------
 drivers/bus/fsl-mc/fsl-mc-bus.c       |  6 ++++--
 drivers/bus/fsl-mc/fsl-mc-private.h   |  2 --
 drivers/bus/fsl-mc/fsl-mc-uapi.c      | 11 +++++++++--
 drivers/bus/fsl-mc/mc-io.c            | 19 +++++++++++++------
 drivers/bus/fsl-mc/mc-sys.c           |  2 +-
 7 files changed, 27 insertions(+), 36 deletions(-)

-- 
2.34.1


