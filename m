Return-Path: <linuxppc-dev+bounces-14565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D58DEC9BE9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 16:15:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLPTX4nM0z3bsR;
	Wed, 03 Dec 2025 02:15:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c20f::7"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764688512;
	cv=fail; b=nWLnaOuXeylkpMz/MPzepgzE3ky150qUnCZh30emRqSPSKVDx1hxCJnOPeqc2ZEWyerJoFxXGhSB1YjU+YhM8wtbBtgEtnhGh9VafuF/jjUn5XW4P9Rq6WSf7LHzoNiVrXoyrxePIpsXkF0Vjge+Udt5mc0y3td4mUC2HBpkudjG6sT07SmaEDfA9A8j+ijoKi3jJMSxmjS5V9BfEXIy63BD8KmmjWmqvP5efmsViCoDnBJ75HsWvRGE5mXDjL/XeysyxEYF6GxGxuVjpHqFMprm+pGUt5cbBbc1lp15poVxbCeQSQjE+SnSJgiamEUdv7wgIqy6lGT0cOG8BQqRDw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764688512; c=relaxed/relaxed;
	bh=popOzAOD5DbKrZuVhbIU28crPyZsAVRg+/fKxJ94bRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KRmJ6Yl6Kjw1FkFGQxfVmzU0n0gfNw67X+KzJODKRZktyCkYge8P4u/5GNfTCV3+5i4PwtPOjiID1zTJBQ+vhO+1C759bWSVDmsZ/FRgWbqaLbb705rUCL+EY7XARIajnXQhhqrgLLTLV9rh5dgFETgSttzA75vNEbe/EGkDqPYvBY1nqlzGcVPD68q51IjBv/BH3qWURgv3QvJghWE6cXHkQET+XEoCunTMNfHwAK47Cpu0Yg87VjsdiBhkVwvp3rjmW/2p6N9Zu1Ua0rE0lopauSd6CGW0GaS1zrPY9m+WmtGV9gTgXpTVH/0cAIzCpkWOdu1GkcSqPyTi1NBhqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=G8Iv7FTW reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=G8Iv7FTW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLPTW1CpFz2yFx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 02:15:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJxDhjBcNn4f10tfvpBXTHanNdcFtx4eBLvQfDx2shFu4HJ9X6mlJGI4qiXFQ3/mr18Gn8ZMW+2nWBu4uMv0U3uIrdXQk2b8UdaTxLccMe2Ah/ZD4R2f5cTqaVH0gcRzaXCd5YmwKC9Gxv0+5WAT1n3XA/8VU9khAeclETnxiEMdxzcT6LATALqsIrSFmWARvKTZNcdeXr7Sn8CZ1pRalLHClAsVrpxn1gmxH4+v1/MGbvqWdDmHccDD7fs0SAnb7pXnZxAHk4mnHRMwAPzMeqpX1J6NJibs3bs0KH/Fs+L6wOxGjYmrpyd/Qk6djtInowTsvP3QkNcMLxuqQOotow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALKz0an/XhnIalLj4YI/TipK2R9GORpiPQRqncDp0jw=;
 b=rpXtC7D0uXoeY8duSxpobTYCj91WC/pAmXCspyJuyjSfYmubjq/6waJhFBqjaECsD7QULfmwDN9lLrbU07uZViYu7ZFOBjzdMDG4YmJuhrK/tCmGabOQGjlyLxJY67ZiMcflKZZLi7Rl2POW5bXAhA4YakGU2DOYLgG95GgTKLM2inseaR6nQrr1ud1NGQjOcZHOU5hP2Mo6/KkzcoKBv/WUASx8+XOcoc1cTGmRbU5Tt13QpyguLmBpL01tYYQIZHwQCg/dN+NdMb/oJ37JrY+aPLyhDmyfmyHcdohHBykuDVezpo0X8SFP4P1ixuBzBI9ofqPAITwpzzgTps1SbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALKz0an/XhnIalLj4YI/TipK2R9GORpiPQRqncDp0jw=;
 b=G8Iv7FTW1r8TN/ubAsMERLup0ECYTCMKEHCEknQesciM+BDt0GDXG6iQfcYc7wrG0Fdek3x1ToTBGjWLzU+fLmut8DrGSWFTqYJoWT2ILixjkcEVobW0pMHnyIDWUbPbfh3nUMHMGfxwlorHVT0YQl63c5wyEGimo8ITcjHzHEyLb835AXsJkRYSZy3S13g1Iu5+Daqj9Ql8pTRCisiC2Yo7l21J2yS0TnV/fbcROUy7Qz3Y1EQNZ3tzHEx4W4UqN6HDKddYZ9NjcfRm1dirZA4fZsuQls2KQTxvErMkF8ke+78gDuQJ25QehQsThBoQjsv8EhSVrVjeleEGspl9kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by GVXPR04MB11543.eurprd04.prod.outlook.com (2603:10a6:150:2c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:14:45 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 15:14:45 +0000
Date: Tue, 2 Dec 2025 17:14:41 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] bus: fsl-mc: Convert to bus callbacks
Message-ID: <ay4xu6sdbnwza26jau2lnqdnim2wzdm4qili7irl57wtcjwnsu@ah37ljx65nph>
References: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: AS4P250CA0003.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::19) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|GVXPR04MB11543:EE_
X-MS-Office365-Filtering-Correlation-Id: 896929ef-0f40-43f2-fed4-08de31b586bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?A4f3X/9/v9R7WWCIt4TmDgIiiZlGDzhurYBtB5Y04PJZTklgB37oPLgZBZ?=
 =?iso-8859-1?Q?3fHzYjSLYTV7rTH2WP/6hbFNie5reIMo7fgnLFXsec2U0Ch7CmC/3DLPjU?=
 =?iso-8859-1?Q?xBmRNRa1I6JeED9LYtNfs5a56IA92Qd3pDF/vMbUXIDu36beERBZ8ccw+J?=
 =?iso-8859-1?Q?9kJcqvRmMMR+IOzsm2yfR+prFyW1EJs48F7iO2ng1OCTpbhsJUW7ZiJk/B?=
 =?iso-8859-1?Q?7miNRKiljPRikTAmuQD6IDE2X8U1hQuMqqo6hSscj9tEXY5lRbOCP4064S?=
 =?iso-8859-1?Q?Pwgk5dbvhEg5YuNKr1FQQv8WYQJnKVWOW/afwCHTtvaQOIa/SIK4UUnczP?=
 =?iso-8859-1?Q?rqZhAMMBpQQGS9G9y4IjFjzezHRvMLKx6UWFXupcabiAMTZcuKfWUNk3+3?=
 =?iso-8859-1?Q?kh6Odp84UWAvarI9LXGOfGlNRJAZbg/99nAFDxkAmsS6IRekRKxKZYAhJG?=
 =?iso-8859-1?Q?IMjKlxDDvxjLZvdWRvl8P2k3QqIV68eeYGvFdc/65B6VLc2iz1j+WaaXOm?=
 =?iso-8859-1?Q?zyIKVGrjARmkkStaTpuYaGJLAYcPeEnX7ZMc47Rcx2aNdZzLwRZGKDRad8?=
 =?iso-8859-1?Q?e2tNMRmDpbeGF1AElTgQV3mg2xhNRCKPNDySS3Kpg/K2+/jjYWZ7eYLR7V?=
 =?iso-8859-1?Q?pSMJCN/m4fXmr5Zm9glvGHpB8AiFzIexdZP2y3mV0u50izwVT6VaIwCB6q?=
 =?iso-8859-1?Q?uFnsk9IwX/N9hbD2GYAHdFT7vbdZU6t/1BrV0rLprDe8y4yuTup8fz6r4G?=
 =?iso-8859-1?Q?uUelZ3Jf1D5sPTJon0xsWKHO/ZoSLRgVeOgrqUv7tQwNTlvw+66QzlmsJx?=
 =?iso-8859-1?Q?kwF3F+7soRUu5LY1mQW4q8XbFXVVnO8bBbaXUzGdbA16sZlgZ7uEJthzBG?=
 =?iso-8859-1?Q?R7y5kunauWRgUYcDDDBOW+9fxPo5WwpTnvhIo93cCQP+Wu+fZYZjzf0V1E?=
 =?iso-8859-1?Q?wOZO9plzOpxM+lF5Fu3TeLaT8r57tKG+E04ym+ZUIqzOiyIwbhcCp1gi/0?=
 =?iso-8859-1?Q?sZRNlvFMtvPrzgbb0zMPSqRP3ubz66FqF/wMZypzab3SzD2/8GPb/MqiOv?=
 =?iso-8859-1?Q?lB/4as2BUnyEDgu9m1uU+LKos6vYJdeVrAvm1iJq7OPAr+vXaeY0PZ+oew?=
 =?iso-8859-1?Q?zFVhpGtkDTiO3JBs1F5nCd7TEuN+CxAAouM7Zw3hA+qXRcmnT6evBkRXBM?=
 =?iso-8859-1?Q?GgnFWiNsa1tftvuQc4WxyrlKph3IcfoNSmOusa0Zt7/9ZtMDThEW5KpAy4?=
 =?iso-8859-1?Q?ND6cTklYdSaCSUHjSeCMV+GgLw40V3ShZC07MzUtlD93+i4CQx0btVqPpc?=
 =?iso-8859-1?Q?KnX5trq29j7YdldyE6f+hy30fNNixfrGCNwF/pxxmNbSSjU30AyLrIf4/u?=
 =?iso-8859-1?Q?cqY0aZ7XkiWwMOszNQmP7G8JPxX+qxADILhnkce84OJV8Yq6wkd4w61zO3?=
 =?iso-8859-1?Q?5TRUxVtIVvf7BP3K7Izn60jVGHGQ/T6EoJivCBowlT3/OemjoBEYWnoGI2?=
 =?iso-8859-1?Q?dMjN+mLNqMy+6iu9AYQN5t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?XQoLfv6csRobh43lNGpGMWqPacc91dZGgtd2sgf0woHEU4NxUfj60mdDiT?=
 =?iso-8859-1?Q?mEZZq0SY/RBeo2TApmhjEtyraW/pm9OCH7nk8G7QA33iW4o7c8ZcxF3WQN?=
 =?iso-8859-1?Q?aF/bHu2pWW3iV0AEz0L94WLSPzKksAEI8zTCgLrXxqBMEe1YmW5KIYG3Iu?=
 =?iso-8859-1?Q?wqYeyCm61N3wh4nfGyKFVdge5oUE7KjkC2GK4FD1d3Dx3qx6Mo29OBZjzX?=
 =?iso-8859-1?Q?IvgFERImC7lB0nKPK0RKFT2r6H//ttHaIAJoUpv4sZBPH/K7neAmVelWiM?=
 =?iso-8859-1?Q?68BOZP7FE5BSy45M0x+G4WOCd5PReFMJdFVeo5CasZ3y5lWlGMxFJ3N6kE?=
 =?iso-8859-1?Q?1Q2+sRDo1brgeTA1mccYMpl8zb+cyaayNEb/5s0/yTK1EbX5Q3sFffAPYz?=
 =?iso-8859-1?Q?h1hx0pHkR2K26bsCNq9p5vPuCCfRvZdxEJm83jjHWAHMkZexpUOwphGfPL?=
 =?iso-8859-1?Q?LNMqZ4Nssqi5C0ZOsjDxWKLIR9trZzEu3fgX4ZjwW3PEBdQ+0/w+xnKkKl?=
 =?iso-8859-1?Q?15VwQgDGROhOHS3oGLhzQBKlwPEgL8yUX28JJJqppx344ko1VwBaisaBym?=
 =?iso-8859-1?Q?pJF3DM2e4MryzGKt1Y0sDLMYZJzpPCbMNBHCN5K8I915gyzWst+a0CTbg2?=
 =?iso-8859-1?Q?/rigqWJSv04CSUzquRDXFlCFxr5DkhfPROt4bRGjlzLvgE0xLarrOWyB8h?=
 =?iso-8859-1?Q?eskFxNQZeQNRZlV+BukbRtskfoQ9vf6ZMTeFK6TluK3tuIt+vsC1d+Q/Dh?=
 =?iso-8859-1?Q?BScsT3wIRPiA0G/hRfy2tf4BP4yd32aahS1WEvfM3ijmWwk5F3WyQ8eVdf?=
 =?iso-8859-1?Q?f1DKvx7DVA302TQbUvMiHcimzuP6cm4ZGU9BRHV4mQq8tJ4r3e/9+5S9+i?=
 =?iso-8859-1?Q?D9KordPBV7cwjoiWwDN2KhkDHgerQxyujZWcpbsfVRZ9veKL8yQYbGoiQM?=
 =?iso-8859-1?Q?QAzTqwTFsYmCMs7J+oh2ERv/QiMHY/Sm2UQLBkutdxOtHORsvSQQUzZF7H?=
 =?iso-8859-1?Q?i4OBq/SguruGQF8LgLMQxT+N4KNa7XqFwMYfE0Dx5ncCCevMVKmUSKkCNq?=
 =?iso-8859-1?Q?LQvYoEtkkVgb0sdiBsTCmBdeu0b93lwW+nbx3idnSmDZ7bo+dEq9W/pT/u?=
 =?iso-8859-1?Q?w89eKjbf7N7w6+LCdSaJ4oeNMWuIx2gjhM3+Lh7u8SkDIH8NKpEiVRQCF1?=
 =?iso-8859-1?Q?x3AQ99FrId3i1OhIlCAbFnuhm431E2QIalaSRLX8sJeiLhcpHImYuzWM2X?=
 =?iso-8859-1?Q?H63kBUJwPdjF9Ub7nLaVusNyI3lJE6J4wrIJ5h1y2j8yRqe7eHKVHmnVUS?=
 =?iso-8859-1?Q?BprZEkv9hehzB0XuqvqI+2ToU+9cXxRtUG208EVq/leGx+HkGVCi+1PAsf?=
 =?iso-8859-1?Q?03OiG+dfvhac9QMCXIRYTqf1JcbXcxU8QGaFbjs5PG+T5aUNWRzTdGLNoH?=
 =?iso-8859-1?Q?1+T9BPV2oY8m4X/7KjpjNrYzFGJF9Q0ZAJlRFKZm7o18y9uNLxts3yaNwX?=
 =?iso-8859-1?Q?5gIVzKF//bMJnf7puivjBYfmDlFZENmgVcSPdEEXFLa+3kFs4L2aFGIGNa?=
 =?iso-8859-1?Q?84QH51ooM/YB5KWGMoIdh40TbVxHH8lHJx4mH9mxuuLZXgxtV4Jou39oEN?=
 =?iso-8859-1?Q?Yr1M3AGkp2dfcVHHZPkLDoe2PIdBm45Nal?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896929ef-0f40-43f2-fed4-08de31b586bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:14:45.4704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sCXG5NXsi3WAwICKYt2hYVV7HErqQwZ1zkPZ85ZVrbEm0j591uLGGeR767uxxevGN0ocHrre/pPqeFV54kxDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11543
X-Spam-Status: No, score=1.6 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 02, 2025 at 03:09:18PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> with the eventual objective to drop .probe, .remove and .shutdown from
> struct device_driver convert the fsl-mc bus to use proper bus functions.
> 
> There is no intended change of behaviour.
> 

Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>


