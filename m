Return-Path: <linuxppc-dev+bounces-8969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66578AC6D1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 17:44:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6v2C063fz2xQ5;
	Thu, 29 May 2025 01:44:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748447074;
	cv=pass; b=f9XgFUsyL7cA1UwL3dopHO/CA9vmmbbnP2nxu6EwoSNj9PYkaVVjU4DIdkL1ZwkmTbkInMKNfJ2jkGJPkfzJ55jaBo7uY7wA9Sg5CIdvt9jrn5X0ftGwKcgvPLSvddCW/TXr17X7xevExsEqyoon4fkz2WwN1wc0x7F81JFquXBgSuWygXxE3V7cuZ+d2g9D1aXBHmVwIjlLysskAXsXQdokVv4W3pahC5fDvRgLM6X+I5t7R4OTogYeNgC08dI0sf6RBSQv21At3gP4L+IvhdEf4YQuRQjHp2Ob/kIoRMtCcPbC6hzlth3rf7PbQCQKNVRs3QpMQsnFCmuvHXVBhg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748447074; c=relaxed/relaxed;
	bh=H73NLVsQK6iY5FfKXzkbpkwXttcXf+XkGO7Xf9KyoY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QCkmdDJO0fzvU5zvugYMgsu+BrJFz2sM0WY1uKtssyrGVe3pEbuS7tZD4xGT4w0i3VQOikKjYtnrecHXOv8ldVFvRl548cvep7T4fF2L/1h31qqM4eKKYWn22oCZG2vbnoR6wXAbXZl+oLaKYaqPFuE/o0FaDDtjgQJZYMdmpNhSVnwPBUYT7Lv2lbqQy2A7zbOVu/s4SNYOB7lSHJcjTMuvuAeQSFE8Tt7HDshBA2xfXejzPGBHDNprEXRTyS7V2M/TodfIAnDOPLuov5UgihnBMQnr9sAPDhsQ2hfiWzJy24KhWcjNP3MaNjd0eLc906nOOoi5iWJ1TyMhTiU4JQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=oKozQ/u0; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=oKozQ/u0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6v2931hpz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 01:44:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILNg9QZV7Q5U2sYfDT6pKep4HnOolhdNc4tKapvXerRrY9NgU3W+OJwc+2C7z93Ur4GkfFeW4NoR0p8fDsI5eHarIrr3//M9UcPg2mt3n2ZK0mN+z4Ueyt6tGSsfRHfUi3p3Z4lNvo8x3AGwsb52gVi+1Dq81ySZDiRwELZ85enaWcUZO6YZMuaVgWEXNVb4hOD30j2lR9RmIiO6c6+EqFYHRKqFn3uocj1t7fGiPcxf+lHLOTsmCw3WGyVwZAoGnE2VPR4D412ytRJ4Q59pB4O9zpRQ2UNIzuy0UkNna6+ju9cfBtYxD6cgf+vCumqLVTfw+LfOh3u7Q5y+F/N3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H73NLVsQK6iY5FfKXzkbpkwXttcXf+XkGO7Xf9KyoY4=;
 b=WEoyET55Ej/l01W6vSDLugY17OBB+xYjohtuCUm17fVp5B3x0bqZAGISQOEyscJFTFRv3DhIAhEdavVnX4ffSYCv5fs+sOmcktv2X9gMvo6iqFjy8SxXzDJWx/avvfezTCDrytpVwLBNOrfU0IJ/ZfrgvE4Y5Tgk+miseeBYPTJLsZGY/pia3TG+G3QiViwTiqxqIZpPSncJqheMrVnxYovdGhZxS4qBRQCcRTQcrIbTkhtY57qkAVR8jUSrOVeqCiCQ6Bsuv00sKvRFQALtUihBl8HIm4yHTFhYjrZqpFJ2lFj62M+/h460GcfHd98ziU5VyIJmhN0gJ9s4S3+v4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H73NLVsQK6iY5FfKXzkbpkwXttcXf+XkGO7Xf9KyoY4=;
 b=oKozQ/u0h6JBLvh/R1TEuh704E0TiauZPbXkAJTmWpGpLjDrdh31ojR7O59dUxCda697RKBWsFXguzC1kYHeeMWNfFExRabeVffb8o2dvOWDLIlsN/Ekp+YEtkhRb93u4x2w5ogeYXHkrArf23Y1ok+zELvDiKz7wgrQS4+QQryftWeNTSCl2ysE1u59n0pI/f2hLynUHC+9WbTAZL6/PsZ8NecTUZzYFIziym+USFfMwRotZLYFloCsQaa30IxqzdlJwcYU3fEx/XNXY48KZWNVGvsunRfPEict+5IoTlwatuu+e+cosVZYyXaQQN1K7dNkOLYxSmht6Dkrh75Xtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7604.eurprd04.prod.outlook.com (2603:10a6:20b:287::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 15:44:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:44:07 +0000
Date: Wed, 28 May 2025 11:43:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Message-ID: <aDcvP975apg/dhQz@lizhi-Precision-Tower-5810>
References: <20250522213951.506019-1-Frank.Li@nxp.com>
 <20250526-unpaid-mushy-d47196d04ad1@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-unpaid-mushy-d47196d04ad1@spud>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 358d4737-8319-49a1-4e3d-08dd9dfe7b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Aor2oZ1HvZ4L6vMmQw1MDBP8/k5A4WA9zsHAhP/RdxDyMM14uktr3Dk4mdit?=
 =?us-ascii?Q?evY5OFDtk68kVpL7jce+kAqLkWUdRdBdB2T5nGlZikR0L4Z8RlhffA4gzZsH?=
 =?us-ascii?Q?U+NJOidgks0XZmVUWfU26e7E8KJoZ4r2gA8aXCxsjFvnDvdoFJzZ1CaUN+0/?=
 =?us-ascii?Q?ldSvJPQslx0vQLql0Haii6nW7nd6PCpqABgJF2XZhvYEolrwYZoqHPeFL8b2?=
 =?us-ascii?Q?kTydM90W4Jr8sgTK+AvOtihmHfFq8aLHtQgxd9ooOaHHEQY++79dVI4SRPii?=
 =?us-ascii?Q?RpKOTmIhp6lcEzHWGCUwq4Qcia9SOebYxJeWPViw2RjP5K+lo4310lK3wTJN?=
 =?us-ascii?Q?N6oEzGOkKIme6xC9h2r9Of4y6T6N97rYePy8P1TlnH7MFXU9+eE3YYsb6EAu?=
 =?us-ascii?Q?za30RRDqLkvhgZVbelrux/NPaKDDnhxGc6M1YH6rhsprLZoOTMHAUt6UhGxj?=
 =?us-ascii?Q?u5eF8v1mOBTVhwnLfO8/HCmxp6BsY1bPr98MHSpioCHYqrfHT72SVjRev+Fk?=
 =?us-ascii?Q?+i0F6nnxR1X8TCEjXkNr3s/PckqawOdLbhykk0pEog8RTlWfECm++CdmWb0U?=
 =?us-ascii?Q?/baWcjBaCaqOTRRzyw+qOFb0YYBjR4Rs+28TeINykvBaeeCWTkVGynqCmFf6?=
 =?us-ascii?Q?7bTdA+s0cTK/B17lc/Ee5IwdOFULmy6S1PZt9VcocBIb7o+pXjf8zv+mfOCk?=
 =?us-ascii?Q?7KRHQXdiIIlx2AnlyuuCb0BTw6E9VA/SCzkfaITvvbtmnLOZV8KCrA0WVpmq?=
 =?us-ascii?Q?dN2gEeyIR9FhWS+iI8o2Vy0dpopfZqYEYALqiQxnAzwesD2ZjJr0eic6HJXT?=
 =?us-ascii?Q?KHJ9MGht8G4S2bDY3XQkWc/chNBC/z6kly4UzvNSAWzez6g6F9AEiaRkLYs5?=
 =?us-ascii?Q?J/8WHDBtaQuBYGMGlDEK+r55O7b7nXNn828DEnoCjQpWcYflRdwtMHM716w8?=
 =?us-ascii?Q?ZxEDIgV39IbG1ek11d1mOjxZkZEZHH63XJbwiftY/3a0DY0E+kKUgAkIOshH?=
 =?us-ascii?Q?VClVdtPNI5Cxz4qd8CgC5iInhmIT/X9ZIASTCCK/Fg/FLbL9GETltH3lIlpD?=
 =?us-ascii?Q?QGwkUNTt2QRxjUEbqkpz6oCwNFwVoyR6YQ6/gXgUnF5ATyeyM+PERGh914Wu?=
 =?us-ascii?Q?k5Wt0GBxh4YLdbZh2bMOFumpRfNqK4zTN5vRMfrdASRXcVKsKDUFio2xV+sO?=
 =?us-ascii?Q?S85X+phCyYGlifKRN8IIUZ+Z0b3hzAbihplg4rhue2sBh3Yibl5wUY6jPDJ4?=
 =?us-ascii?Q?J+nOh5l05XwlR68NoZx9QUDqAS4n9y8Wzc92tQy0ZcuCAiH8ecHBL71jVfZm?=
 =?us-ascii?Q?nHeUZyqxyMf5Nb+vdto1XRUCQykOQkEAUQ1nhjuz8CvnV0QghjJ2qfCWRoyc?=
 =?us-ascii?Q?eR33cRdLVTnZR9RjRBgj9WHWKWrpHnnc3216Qc3nUpLSDzDXR78g6kuDMB8q?=
 =?us-ascii?Q?52s7nMBUO7E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z9608CtB2WT8UiawNjXMgzTOMdHmCU/B0DV3gWhk2VFdh+PcDw49jOjUscls?=
 =?us-ascii?Q?6GlhTCVoyWJzsrFQuZM7/3+UC4XLjyTmuD2FYe0sGgemYnw0ulzgc5/7DS0n?=
 =?us-ascii?Q?9gPRv8EEb3H0cWp4AmCwbBdYUhGEiCUtf8Uvd8oo8gMchmJyQc0zKNXhJqdw?=
 =?us-ascii?Q?+sx4x5I2ufsR3EXCjQYMVqL6dGSDDdfQyR3kWvi8fkstB4GTSMx3S0Aicgsg?=
 =?us-ascii?Q?fVzb2cz1vnJoZ7RiC7kfhCLFYwzb0v0eFd2ao6B+yUDMmkxmX6GRar5dRfkr?=
 =?us-ascii?Q?gYeVTdR+fR/F/HmUznQeqHnpLxFDtjGqxmEebm6NI1oqMZ/3MgKTWwiIGTGg?=
 =?us-ascii?Q?YQOdQRvhsrS+Wr2o6XGroixU0RFOdUM3lfWhJLk39gHd41GVqTjNcjJd89Gu?=
 =?us-ascii?Q?inwG0ZAtWjFf4uSTaVZcVfkkQwW2DHp7Y73FS5qbLj0tV6e0ZzqYe2o7q4x+?=
 =?us-ascii?Q?Hy3dUx1n3dgM8ZF1Ioqom2589GsJf9ATDrweG0bwvzDphQO4D+lsXZtEo8dS?=
 =?us-ascii?Q?9WJqtIcujIDzYr/wVySRTNs7gVvj+AFhctdmX4ob/sCCcZAubFrpqCj8BOII?=
 =?us-ascii?Q?XUYwFIc7s6xJzGO3E8aK29Dinj/d3nmEBM3m7iUHYjwmFkL/CS3I8b7ICKua?=
 =?us-ascii?Q?BjWR+jHrAyX6qerK/7NebtsqJuFa2anyT05hegdjgUsZNUrRvmj4SLQZqEeX?=
 =?us-ascii?Q?WR9I1BPquru+4P/jiBVX/Fd1HZYutT5cs9/rrfWRjTS+QARQHwGCZ6WBjQ1I?=
 =?us-ascii?Q?QD62eJE6HPJ6anlLUodYSpRbKDbX4klW07hL699qyPBSqlDfesdsq0Og1KTu?=
 =?us-ascii?Q?aUg2ZsY4Y10KnUOlwfQwuQHzzDK90qi3p3CIUha/GT41mOEGDF7GBqx1SIY2?=
 =?us-ascii?Q?JibJWqwcTtFEuz6x/6afIjudGZHFNyG2mT/bWs+XiwuVuR2yqPqlCUmQuSiM?=
 =?us-ascii?Q?zPfUB3nx3nMHyXjoOMc4rVSD+hUbq24v4uzWnI0ACIFQSdYDxZvzXmR/ZBlp?=
 =?us-ascii?Q?W0Vy/H+MsgTqOhHueYfriDXy11NNhryZvsiEEPfOey+pO85qrDU3I8+9I5CW?=
 =?us-ascii?Q?NsmmbeoSX3dQ5GUWkWaXeDC/nFXPztNiVTc2cKncgqmc4Y9db8CPAHFGMe94?=
 =?us-ascii?Q?VPEDd0Y2H4fESbQijFZj5lXhxpf++6SWgJzxRWqTnu6v2Y/wepdYhRAdehk7?=
 =?us-ascii?Q?Cd1zDsCvGnf8CVbF0HvhZ0gT9m1Ncornu9q4ys0hnrw5tpLQJo9KD6ehRDaL?=
 =?us-ascii?Q?u4dxsB28cjbm2auGNRCn75ltXhJhFCje7cdPl9qRQ2Hh6uXePmf1DxUsY2M2?=
 =?us-ascii?Q?OZbLxuriwBj9vC5aQ4C5qi04ZowZauzgRLKcO86ZK+8sfCGJnLvPNxNE06/7?=
 =?us-ascii?Q?GYzHUfgNLfPeINvzi4PfofKHPHIbKLv7Pocj1RX1TmBxw8FSryf47q2pi4Lz?=
 =?us-ascii?Q?K834J2qZieyZ/6OhTHVT8W0AUtt0qydMWfMFhrMY1ZOcHuxym0kPXQppDzq6?=
 =?us-ascii?Q?YWZNTEr/fsio2tHbBYsCS7og1YnfTKVweNEUqa7kno5jUvMx3OU0iLMyOWeB?=
 =?us-ascii?Q?4RdizFMXH8mUZnIdtHg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358d4737-8319-49a1-4e3d-08dd9dfe7b49
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:44:07.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EYOJXlFmfsw//w4qP8F9CgNUogdUcYoxnNAAyze6woDK19hp9mzJxQCEpeLUSx0XluNvI0oZymvqiXEYCJZlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7604
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 26, 2025 at 04:54:30PM +0100, Conor Dooley wrote:
> On Thu, May 22, 2025 at 05:39:50PM -0400, Frank Li wrote:
> > Add vf610 reset controller, which used to reboot system to fix below
> > CHECK_DTB warnings:
> >
> > arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
> >     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > new file mode 100644
> > index 0000000000000..4c92a5e4892bf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
>
> It's a reset controller then, shouldn't it be in /reset, not //soc?

It is not reset controller since there are not #reset-cells property to
reset other models. It just provides syscon to reboot the whole system.

Frank

>
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale vf610 System Reset Controller
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +description:
> > +  The System Reset Controller (SRC) generates the resets for the device. The
> > +  functional reset sources are programmable as either reset or interrupt. The
> > +  block also generates interrupts for various device events.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - fsl,vf610-src
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    reset@4006e000 {
>
> The generic node name here is reset-controller
>
> > +        compatible = "fsl,vf610-src", "syscon";
> > +        reg = <0x4006e000 0x1000>;
> > +        interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
> > +    };
> > +
> > --
> > 2.34.1
> >



