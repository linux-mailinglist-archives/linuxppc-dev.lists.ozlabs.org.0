Return-Path: <linuxppc-dev+bounces-16348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB5hIai4eWl8ygEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 08:20:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1509DB30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 08:20:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1DDk75W1z3bW7;
	Wed, 28 Jan 2026 18:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769584790;
	cv=pass; b=j4NE8coCdJ5oLncUEPGN+8u07e/TWVfMMgsDuFioSLnBjAkOVtGs+67D3t7OqfpPY62WHOmEXX3yzp/L1MUY2g37bMJ+5qpYMBU6MslnfhzEw9SBRqyDJ4rlkC1Uy9VCOXRzt/ceNcSSfiQrvK/rqEkYy9YO4XrlXgeNvK5su4H1KoOWTG2LhDvHoYCRpnsK8kHbJzg+Mcmsxq3USt3a73aOB+XIDAe4OAMuTopuilUW4Qed41WaAgftfCOaup+cc69qp5On8BUCYT4H4+QmRDDnVvN7+iKgBcpxOuTuIx+gCZUI+fQicKDlm6GxDEP8iIH5JQcmjhuvEkt3EbFWWg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769584790; c=relaxed/relaxed;
	bh=XP4M4EgYZhftvE9c2FkQ7p2SBTtksyZCQ/J8kbOtIDc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mucHr7ceR9ShOhNOmzlEZ55MWUlykZ9rJwPJVra96tarASQa8RaoWPgVGdAJfNQY0GTUaxFNVWZ7gyc6p0RyQDSPuoYysrYaZTIp9Qg5i/bP2SsGcdpiExkFealwezhQ5GjUIVo9VdCTIhUmPdXphRKbX03KNK+hY1xX5cUZ/HKyIEdCdDFsGz4tL+1N9Z+KoQS0G7Y446gI/Wd8YLF5kr7L2ortRDN5dLwvMIrBUFpIN3+VfVOYM3pISDoqtU95wiNDHaQ0tD+yGV6SRtKJrFynKz1k/YthndfHsfTRa6OSpMQ+YCK1/lIcHj5dTWM6ngOrKTxe/mTCIh8gCAOimA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VOXmgQPP; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VOXmgQPP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1DDk04JFz30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 18:19:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XldeTfXd/H+T5KemSj4R9qwsPpMPRAVZ5wpA6VEtz3sDJ94Au24hdPe/8Yd+YqBjZglzn/FR7HQNkKK3WJE8XJ5R1432RBQc0/5o8gKLLTeWED9p2reRw+Bm9BvlKInk5Pkxi25W+MwQzTUDM7gbXQijLY5Gg/MXJcm7fFJB2N65C9IaToYQ+Aya9xr3xUt8pudP6KTYSV4S7O+ukSN98yn2VNQYmANKoMdWUDPC/fDBx/nUPqNhgMkSUdkyAbTb7Dtn4V2qg4CdFcteDazpF+EYsSaWmIMk8TVNCDn3Qqvj3wfqmG8I2IT2m9me9tbK+V9TgMyABmMoRnPgR1t6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP4M4EgYZhftvE9c2FkQ7p2SBTtksyZCQ/J8kbOtIDc=;
 b=eKx69y8uuoKAzOQlfQKdAz0p1Ewy4zm6+h0rQ2PftbL6oLvMAOpTv7eR2jKGY9WlAGzhPbkrYGT1tDw5Fy1eVZlowDLvbNRAtiDP2KwytnzPwiHx3Y1q4xbH3bt4QcnSrpGcoHcWGg6Mpu2mBlAo7zTOrZDQq29EYQACW+12EiKAdi5XrkZyCXO7oNd7a1xKaYKniOX80JyT3jQNRuoSue3M82xWbF9Lij9CX846xk9Ferq4GgOz2zH/lXtr+VVYIAj/Yo6X37N4ObqJOMhvxp06Z5riGRuVZAr2bKtNC4pORkWU/GIHdE5zh/sHWq1X4B7GXotp2+HfKLDQpF7KQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP4M4EgYZhftvE9c2FkQ7p2SBTtksyZCQ/J8kbOtIDc=;
 b=VOXmgQPPPe3clDlHZoJQzuSzxZaga7NqT53NY1INYBE+AJb+0vdXnJvCyixeXc0bhTA/miCD6i8YRQYzyAUdS/A1HDo2PRfnHgY9INyQVGtnOWruDFD79Kk9IVruuSlG4Wii2GvSaE0UDXGrTifmQ0ersGClIjRkjX3itZ/K3AnBHx3S45TJ4I76TnsQHOBTcgK+OsyBfYr31i3KAT5iitOqI+r/tEcexG3zvkribTCIc/FSOMIpKFP917aoIuXH5nymYsY7bAGDWNfQ/0aXZ9BQa26YGT5/2QObikFcJN77rutTzfwWfox4UyUot8hFVHqUOJk7vM/9Q77ITJnaUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 07:19:33 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 07:19:32 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
Date: Wed, 28 Jan 2026 15:18:52 +0800
Message-Id: <20260128071853.2602784-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d2e8e4-2473-4457-667e-08de5e3d9547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9KACuD5HIcEqw5tZmJ1A+9BylpK3777M0fqZhn8wfXIh9fJp1BsRCYRjdhLS?=
 =?us-ascii?Q?Tnm2zTEJkcziAJCcN8CFrjKbdFH8mbWMQ/V+sbOGFH0EvsN1vU8fdAGvf0Jj?=
 =?us-ascii?Q?P4TC5Qu8Cfd5lfkLEKgEP8MkzSC3neoZbK8DN6LizQNHy4WmR23wq7km5tki?=
 =?us-ascii?Q?jMJe6Sy7SXw/1ddhSZjlIkGkmpGCWICCT0xW78hHPffxUTJ4/ox1YRHUpmUs?=
 =?us-ascii?Q?TJwJP46X+AmdG1GLlAPtQEIadNEXLWFK1b95q++/JmCCgqWMpi3rrbTmVbNN?=
 =?us-ascii?Q?MLgBr5gNZSpLlH/MPPdkPRlB87B49mJCsXGxxqYI43HoSwV5iyRn8n0bFHBh?=
 =?us-ascii?Q?FuzlJi4EnoWDLuI9vioUO/n5ra/m/ZpKPDgoDoDzvr/4dzuj7jNRNPVxQiDK?=
 =?us-ascii?Q?JT3Rgy+6/2c8qmU3heHkJ1FMEtPaPQwVjha8d/bsLrdnQwc+qtg9zW6cpejm?=
 =?us-ascii?Q?EiDJASMY1o0uDLJOgSBARu/wLe6Ae6GtU+xUeahd9z5oF6YYIlgAprL3czm9?=
 =?us-ascii?Q?N8nRKAScmzf3BtDcDrhuRrKvehRKPb9UkWMmT4CFJgRJeIbqs9q006t3LjSs?=
 =?us-ascii?Q?3KWDu6sx9AKRNvfIY5SMmhEoF0U8r/4cP8px32rZO/GRzxlaBrziNrjgtOEf?=
 =?us-ascii?Q?KmGRPQmczTH9I7/vwxTb9GuQrQwF/oCdhkmmiP4AR9bIfwvFK0IXSvC1Dxwr?=
 =?us-ascii?Q?AdYyf13Vqt7xw/zuOhmYhW301L7TjgdSLIxw/ksRPO1S3V8BuahUPxjFLtNU?=
 =?us-ascii?Q?ODrp1YXfgfc6sJvhAsIZZ20PHvWlOh36RNEdQgL7yZgIDWvwvJgUbnWtpBc7?=
 =?us-ascii?Q?4bbNxf2CspluLqx0J5W93mgFOmVLFAZHFrLWApfNilPwMBJeikxHY6X8ZYmm?=
 =?us-ascii?Q?PaAIOhQgqu8+gi7FUfGwaxhp+Ixxuw0TZ9q9dZF+TsmWsgM9hjLFSnDyBgrk?=
 =?us-ascii?Q?/zYu7WOWvXjVcsz80hbRjjC0+CRaUykSG3Iky9/13ZSWJ5iZOcdVZFAzBeeD?=
 =?us-ascii?Q?w7NautAH/35SQ8UxHk3HZdHtfQ/ILVL9k6yNefp1F4tGyBOpfhygtOvQm3TU?=
 =?us-ascii?Q?heyQ/pHX5czWenFVFjrxQzqq1ROtzgXAIZHULFOM3SgtS2d3wsRvTDhnKZgm?=
 =?us-ascii?Q?fRvJuKwEzKebtVNcyBVRHSXKCTKcqDpVWBqT9wbw8/sAiOK7z78liRd8wobK?=
 =?us-ascii?Q?5SU7+zTohLUiiFgxuMUmEHM2yptEMuC7UZI21riUop0/f/Z26I5vpHOZp9O7?=
 =?us-ascii?Q?iBY/2E0kAwgbswTPckNZ/2C6slh+BdUz69fSKYzGsNtPSM3M8ewby0MtzK0q?=
 =?us-ascii?Q?+W522GfoF5gtST8xsoKcHz1Ym1L2odF134PjrG8ltlil5PXZzQXlAvPxILvd?=
 =?us-ascii?Q?sBIx+74vQ7yhJ4bhl+FhbpFlJUIHf+TSt9tyP1F9a49gfgQLl/HApXHUDEpD?=
 =?us-ascii?Q?zy0J2Lz5/t05JC8S/4ChS9i0nYe3IDTLI86UntE2TUJ9HHqvN3f/72apCdqW?=
 =?us-ascii?Q?QFIUQb7TNUEKLh6WPz1B4aQT7ERQHkyzSjLRskGX3Z3kkbhdRLSZA2gdccfF?=
 =?us-ascii?Q?xqdSuD5EU9bR7M/85YNdQ5wIO9FIdGtKx0htNyAA4kbXKAS9/8Iuizkw4E/+?=
 =?us-ascii?Q?soHLXfKnFqYInqks74Ogg92QjxFVhIDXitgVsek1G2If?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZWt8Yq81LdeogRySIlgAAO+Tm2ZxUe4z1anTJ8fc1vf7AHsXQrZ/x5Di6yWN?=
 =?us-ascii?Q?Zx2bNa7h14CKiDIKi+Vztrdh42/n3H/6BgqQ2GLWn9f210E0r5T4xVVqQYyx?=
 =?us-ascii?Q?Ctvcx9Wh4t42cVsr/Kjzce2A8Tgg0ZcvcLGVYtdbbckEweSarPlcq56kgWfg?=
 =?us-ascii?Q?yLNx/izrUMyrE1cJqzbZYADMMxUgnEemQRSzt4oLxZbPOQJsT7mH7IZE/s41?=
 =?us-ascii?Q?dEcuWsnPnNwph9rXusZWxcmFK31TdrDkn+Vbnv1pC7xHFNbY27LyDuSXtQiv?=
 =?us-ascii?Q?5l5W5rJgvtB/3Vmo4FCfJERGelMtk/a4VgyglMsgPQoCHBfHeChdYmkASU9F?=
 =?us-ascii?Q?lIbVN2kZRug4FzvPvukQ8g64RXm9OFbdicu7q3gDGsnJrvaAeOapCBIuhq6t?=
 =?us-ascii?Q?RiVPb/D6nfG4UanQYscBmD4S6wdiCZhs2hwY4DvzuAcqX/YF+89g1hlmbvuR?=
 =?us-ascii?Q?3Tc/dhXewxD4bRR9iOwa6TqY/qIgpx9WLaFXvtYPkf983KzDhaqIL2b3D7m1?=
 =?us-ascii?Q?4/Mxr7bLuC5ZVInW8FjYP+SrgC+4D5o6/hBxymfHfwsPrrDsR6wYXBWiZeNm?=
 =?us-ascii?Q?u2ye4BKgu3tcc40UhFvSWlDM/3VXl9s4mulrefqpvpsezCABfp/kS/6iJJaW?=
 =?us-ascii?Q?ToCAh9+C3Kkk6KmpTbGFm5MssKKKaTCJnLSnQkl5gp0OBj4iXqxWMv48q+WJ?=
 =?us-ascii?Q?g3V2M4xYMWxwOLK9AYp24OgoDTnO2rd6w36o7QZ4O+3WhPDqFzM10P/Qjs49?=
 =?us-ascii?Q?0j0ixRnN7h68zrsrS/LViBIuIllh13Bege/YB1tKxeP8zeCLMsL9iQS5zbGw?=
 =?us-ascii?Q?EgQ2d6XT6x3/lagV73eHhA2UbMu1Ym2HYvf0ArOPXKKv0xbJW7JslGZY685T?=
 =?us-ascii?Q?PDuPlN00kxo1ENNvO6ue5NSd+/fGxFmGy1ClEUgcB/V7JmntckFX32/Co6Dj?=
 =?us-ascii?Q?d7EyqvzY16c9tRxsf2Ey58t6WJkzOpYodiKA9CzEK13G2ygv6FkYWcPoiBpG?=
 =?us-ascii?Q?+mgME7M/XjKsL1khQ+qdJf9UDdtMNpaDvS+YjBA07llgo03zEdSSVUlQF4m9?=
 =?us-ascii?Q?5+JpENMjgp3zY2N/V3HPrYsbThPK57+ReAcH59qw2WB7X83goaGMwYNuWmUo?=
 =?us-ascii?Q?GC852jsA1U2EIHmp36Vhv6IasqTIIE6s2cp8Lz6D7Y+gB/kRmRLprkupaJ3O?=
 =?us-ascii?Q?hRwR1lbkWK0EJCYCoGjECakQXtp6qC2krQm6mHeujaCUvao83lLdgx74P5tV?=
 =?us-ascii?Q?JGnZ45JW2y2iab//gBMLENmoIHmQ5g72OmWj34OsbWdzrg7lSEdCOD6wtriP?=
 =?us-ascii?Q?KtnfrdjQM/SkuhGgbNoqNX2luN+ygwq37bujhF9C9kvcABvHp66qvWthDOoP?=
 =?us-ascii?Q?Q196GH1t9iVy0aExAGXHz2E4Jh2uOmc6UHlJPw+ffMXSasHkpTqWR0vgZ7ZG?=
 =?us-ascii?Q?tg6XuC+43U93BT1hJjH8t00eY2SuoKJUN3QQLWuoP5cftuIeqzPrBZgMJDft?=
 =?us-ascii?Q?Yy617jPo1ecgsOq0mM2+RMevOaqsG4I/PqddC5MEX98pbkfKEU05HL5TyqFD?=
 =?us-ascii?Q?hhuZeyZ4Z5q4SurS6h/FWYvDTTQIFmXa9J7iRzRSdHjf57H7ovo+eIMfJxYe?=
 =?us-ascii?Q?9CqPup/xlfZz+VoAI+03q3esxWMXZF/mmyONYUBNMaW1m2TNxjnqyfsFjBfp?=
 =?us-ascii?Q?FGzpP6Bm/CPg3nKXksSnwglGbp3PNsvDd1cu+s/TqONOv4BzivBTJKxRZaU/?=
 =?us-ascii?Q?yJDEymrzKQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d2e8e4-2473-4457-667e-08de5e3d9547
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:19:32.4671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g89QKr/2zPooA+bg4MVTEPz8n7OfS828WiEY4GgXIsr4KOmz2z8rjS/nTQ6l6+72+wwkFo2WIFaadOYNDtKdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8687
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16348-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3C1509DB30
X-Rspamd-Action: no action

Add a compatible string and clock mapping table to support ASRC on the
i.MX952 platform.

There is a limitation on i.MX952 that dma request is not cleared at the
end of conversion with dma slave mode. Which causes sample is dropped
from the input fifo on the second time if dma is triggered before the
client device and EDMA may copy wrong data from output fifo as the output
fifo is not ready in the beginning.

So need to trigger asrc before dma on i.MX952, and add delay to wait
output data is generated then start the EDMA for output, otherwise the
m2m function has noise issues.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c        | 39 +++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        | 16 ++++++++++++++
 sound/soc/fsl/fsl_asrc_common.h |  3 +++
 sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++-------
 4 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 92fb16f7be45..5a038efed39c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -106,6 +106,12 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 	},
 };
 
+static unsigned char clk_map_imx952[ASRC_CLK_MAP_LEN] = {
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x4, 0x5, 0x6, 0x8, 0xf, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0x9, 0xa, 0xb, 0xc, 0xd, 0xf, 0xf, 0xf, 0xf,
+};
+
 /*
  * According to RM, the divider range is 1 ~ 8,
  * prescaler is power of 2 from 1 ~ 128.
@@ -1078,6 +1084,27 @@ static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
 	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
 }
 
+static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	int retry = 1000;
+	u32 val;
+
+	do {
+		regmap_read(asrc->regmap, REG_ASRFST(index), &val);
+		val &= ASRFSTi_OUTPUT_FIFO_MASK;
+		val = val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
+	} while (val < ASRC_M2M_OUTPUTFIFO_WML && --retry);
+
+	if (!retry) {
+		pair_warn("output is not ready\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc_pair_priv *pair_priv = pair->private;
@@ -1275,6 +1302,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
 	asrc->use_edma = asrc_priv->soc->use_edma;
+	asrc->start_before_dma = asrc_priv->soc->start_before_dma;
 	asrc->get_dma_channel = fsl_asrc_get_dma_channel;
 	asrc->request_pair = fsl_asrc_request_pair;
 	asrc->release_pair = fsl_asrc_release_pair;
@@ -1289,6 +1317,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
 	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
 	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+	asrc->m2m_output_ready = fsl_asrc_m2m_output_ready;
 
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
@@ -1315,6 +1344,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			asrc_priv->clk_map[IN] = clk_map_imx8qxp[map_idx];
 			asrc_priv->clk_map[OUT] = clk_map_imx8qxp[map_idx];
 		}
+	} else if (of_device_is_compatible(np, "fsl,imx952-asrc")) {
+		asrc_priv->clk_map[IN] = clk_map_imx952;
+		asrc_priv->clk_map[OUT] = clk_map_imx952;
 	}
 
 	asrc->channel_avail = 10;
@@ -1553,11 +1585,18 @@ static const struct fsl_asrc_soc_data fsl_asrc_imx8qxp_data = {
 	.channel_bits = 4,
 };
 
+static const struct fsl_asrc_soc_data fsl_asrc_imx952_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+	.start_before_dma = true,
+};
+
 static const struct of_device_id fsl_asrc_ids[] = {
 	{ .compatible = "fsl,imx35-asrc", .data = &fsl_asrc_imx35_data },
 	{ .compatible = "fsl,imx53-asrc", .data = &fsl_asrc_imx53_data },
 	{ .compatible = "fsl,imx8qm-asrc", .data = &fsl_asrc_imx8qm_data },
 	{ .compatible = "fsl,imx8qxp-asrc", .data = &fsl_asrc_imx8qxp_data },
+	{ .compatible = "fsl,imx952-asrc", .data = &fsl_asrc_imx952_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 1c492eb237f5..1be93148a879 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -324,6 +324,13 @@ enum asrc_inclk {
 	INCLK_SAI6_TX_BCLK     = 0x22,
 	INCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
 	INCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
+
+	INCLK_SAI2_TX_BCLK	= 0x26,
+	INCLK_SAI3_TX_BCLK	= 0x27,
+	INCLK_SAI4_RX_BCLK	= 0x28,
+	INCLK_SAI4_TX_BCLK	= 0x29,
+	INCLK_SAI5_RX_BCLK	= 0x2a,
+	INCLK_SAI5_TX_BCLK	= 0x2b,
 };
 
 enum asrc_outclk {
@@ -364,6 +371,13 @@ enum asrc_outclk {
 	OUTCLK_SAI6_TX_BCLK     = 0x22,
 	OUTCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
 	OUTCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
+
+	OUTCLK_SAI2_TX_BCLK	= 0x26,
+	OUTCLK_SAI3_TX_BCLK	= 0x27,
+	OUTCLK_SAI4_RX_BCLK	= 0x28,
+	OUTCLK_SAI4_TX_BCLK	= 0x29,
+	OUTCLK_SAI5_RX_BCLK	= 0x2a,
+	OUTCLK_SAI5_TX_BCLK	= 0x2b,
 };
 
 #define ASRC_CLK_MAX_NUM	16
@@ -432,10 +446,12 @@ struct dma_block {
  *
  * @use_edma: using edma as dma device or not
  * @channel_bits: width of ASRCNCR register for each pair
+ * @start_before_dma: start asrc before dma
  */
 struct fsl_asrc_soc_data {
 	bool use_edma;
 	unsigned int channel_bits;
+	bool start_before_dma;
 };
 
 /**
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 0cd595b0f629..23ac516565d2 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -107,6 +107,7 @@ struct fsl_asrc_pair {
  * @asrc_rate: default sample rate for ASoC Back-Ends
  * @asrc_format: default sample format for ASoC Back-Ends
  * @use_edma: edma is used
+ * @start_before_dma: start asrc before dma
  * @get_dma_channel: function pointer
  * @request_pair: function pointer
  * @release_pair: function pointer
@@ -143,6 +144,7 @@ struct fsl_asrc {
 	int asrc_rate;
 	snd_pcm_format_t asrc_format;
 	bool use_edma;
+	bool start_before_dma;
 
 	struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, bool dir);
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
@@ -154,6 +156,7 @@ struct fsl_asrc {
 	int (*m2m_start)(struct fsl_asrc_pair *pair);
 	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
 	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+	bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
 
 	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
 	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index f46881f71e43..296e13a16490 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
 	reinit_completion(&pair->complete[IN]);
 	reinit_completion(&pair->complete[OUT]);
 
-	/* Submit DMA request */
-	dmaengine_submit(pair->desc[IN]);
-	dma_async_issue_pending(pair->desc[IN]->chan);
-	if (out_dma_len > 0) {
-		dmaengine_submit(pair->desc[OUT]);
-		dma_async_issue_pending(pair->desc[OUT]->chan);
-	}
+	if (asrc->start_before_dma) {
+		asrc->m2m_start(pair);
+		/* Submit DMA request */
+		dmaengine_submit(pair->desc[IN]);
+		dma_async_issue_pending(pair->desc[IN]->chan);
+		if (out_dma_len > 0) {
+			if (asrc->m2m_output_ready)
+				asrc->m2m_output_ready(pair);
+			dmaengine_submit(pair->desc[OUT]);
+			dma_async_issue_pending(pair->desc[OUT]->chan);
+		}
+	} else {
+		/* Submit DMA request */
+		dmaengine_submit(pair->desc[IN]);
+		dma_async_issue_pending(pair->desc[IN]->chan);
+		if (out_dma_len > 0) {
+			dmaengine_submit(pair->desc[OUT]);
+			dma_async_issue_pending(pair->desc[OUT]->chan);
+		}
 
-	asrc->m2m_start(pair);
+		asrc->m2m_start(pair);
+	}
 
 	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
 		dev_err(dev, "out DMA task timeout\n");
-- 
2.34.1


