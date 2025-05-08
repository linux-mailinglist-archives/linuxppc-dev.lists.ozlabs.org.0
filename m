Return-Path: <linuxppc-dev+bounces-8446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4AAAFB69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 15:33:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtY3W041Dz3bV6;
	Thu,  8 May 2025 23:32:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746709627;
	cv=pass; b=Cjt8oh7XdFNQLVCOy65JV3WDODFK89AByYJOGYJQiSUrlgFJ1bRqjGKxHRQwIDDDDookY94DCgPwgMWsMTY7dhRYku20TdCT6nsnU/ZsfxjfhomPA/0TeWZED9pDbbwbCasQ+0zt/EWWaAxyH1/ST5UZ6BYTj93lFJx02jdbWevJvpN4pvUHiZdpvL6Mas57cYVo5RQgaqViiq0d8TIv7oqZjViwWzJ1neXTkLZo0kXc3O7IDXEBbVYpbDnV6ToPwVTlPFOxcoDFEO64P+iy5koIu0eRwUKQfbd7SMIF48PlLgGudUxu2sHUdEdA2pYUdqqiCSTGBroVXTJPeEhvOg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746709627; c=relaxed/relaxed;
	bh=tmKj3I0cfwPhHUm8bLliVD/icz5F07yr/jMTgyoGZfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dIEe1kyD6OBBKVUBnRL9/g2KHiSKt1Db0mw9giRuoVx6ZO8pZH32BtvkKyAJ3Jdk7h1NLB0QYAzO/znCetWWR0Gl9pZuSX6dOhey4/wYQWeorkSHK0aw3tIAmf/ZJstVQRXSPBJyLCrnznm1GFLX8gcWf8US/8xuxNYy3MAEL42Xk9wxF7fAqrxGARBdJR2witemX/c8vKSmjlzTrllEf43X+31vinnAc1PP68zn/plA8JR+DPBvW3VY/Rgkr7xxjeZwJQuvDFLxjlv7dlFD9e8d1e6tk2KnXAsGEC+p+NoPWJbfDcxcrYGNvW7jCBNx5e+MBzIvSUIZuL8oPReAoQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com; dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=iizF6Iw2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org) smtp.mailfrom=mt.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=iizF6Iw2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mt.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtXTl2BmMz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 23:07:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDBf+54gTaufHajsNWZUGSiH6ewEVZ7ZL6EPpRq+pbe4F8+jBXa7kKm7+K0ozRwD0BWqecUZDOE5jp60OMUzgal6YMk9iT288Xi+urh/+77HdRt7K9tgU/+tMobQIjOruaQweBsTpg45+xiSIpZGCdj6+TZkou41dLmd/duEy8JfkD+2FMCwLD7cbNWAJSCcGDdMhhnBaDianxhua1yAFv1v4OQwVA+BR5i+2uH1oAy4Q0Mlg8IqmJX0hMrgTm5DoJJrTc3Cbd31VG8Ljl9UM0pn8tluFoD0mf1VXkLZnMBn23/okXy6QXUplcyk2aVKwQe82QZuHgHXkVh2jLOr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmKj3I0cfwPhHUm8bLliVD/icz5F07yr/jMTgyoGZfc=;
 b=p6KjqoQdjfciXoUI47ePDV7JQsJrpZbXAjSV7F/efYaYbMUx9n3LH0ALrHFs0IE1KDJMUow3dc86XNG6Nx0pyP9s4z3W0GSBFzJByF3nx+ORLJC1MeOuiPcZqvLVSqk7yRCbWTrCrxjRyG1DebvfK0wdABVZjziUnL9x1A8zrNFV7MX9p/LuB3ojAunaFaKSkkbn7hcHZE7c4SlHHdBHr4AvT8WOmlEg0WlLWYP6i0YlzpWpgBmeRMX9plozdeWdvIoGlCOOMwUlFKZxmz5w/pJHa6yPDZ++ucNd1howFXdHpdHx3UCPSL/uYYSWeXklBRl5TCdGROHFJrn1VlehGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmKj3I0cfwPhHUm8bLliVD/icz5F07yr/jMTgyoGZfc=;
 b=iizF6Iw2SPmRURHrZhTRIIT562pfeRii1XNKGCbgqWBgdEXx4/cmsKMSWwTJ4ZoLYXKcRLnIbUyHyFz94UBj6ptsglxDHuqF75oAQpoGidJOV1u+0tWl9ZMRPnp15lAGRnrq8dcESWUKYCx6pSTSN5BQHWQjyhq6lYwNSc7eOB/v3+zvxs17zkazlEmWsa42MVWKePcX9rFlvosjRSGU2BLlhPHOVDVwwWSxPDjFhJqEAEJhaLB4e+NQhxPXuz+XDbt1XfkadkGYX8EzMi2aLb9jk33iANIAi1K5Vl/dqOWq2k33kNE3SrLQGrcitvZjTmzURz5KbH9EwPjDGmWnYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 DBAPR03MB6439.eurprd03.prod.outlook.com (2603:10a6:10:199::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Thu, 8 May 2025 13:07:03 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Thu, 8 May 2025
 13:07:03 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v4 4/6] gpio: fix potential out-of-bound write
Date: Thu,  8 May 2025 15:06:10 +0200
Message-Id: <20250508130612.82270-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
References: <20250508130612.82270-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::17) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
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
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|DBAPR03MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0868d9-91d8-48a3-35cf-08dd8e3139e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CN7EeLrZ2p4J1Bs6h93Hza8PNBfYN0reYAr6F4tf+d5eZUXibjb/vSynrHCI?=
 =?us-ascii?Q?sv2bel2+YL7rDlwai+EBGKSh+4R+h7YJdhG0LOpS4I3YOjjWMtVZMfqvos1J?=
 =?us-ascii?Q?UfbbInttTzV4Ci2kuyTZE3z7cmMfgqjfIL80jNAwEzZwGcetlBDOUMjzkWx4?=
 =?us-ascii?Q?bsWtFnzReTFSPgMUcgntVrEBoOjS01ebXPwtZo78AVZaxIMbxZuF/RnPT3Gb?=
 =?us-ascii?Q?frfj43I78u1j57G8a+cmqszjvWSmrW3BF8PuywFGpxVmJAGVvNT1YSe19603?=
 =?us-ascii?Q?P8ZvPhK65KVGJplaZZy76ReOZbrLguMVrqzToqiJnIXKRRhoaNJ3Hpj9Fvt4?=
 =?us-ascii?Q?aGK1ue57Ndm3lj21q2pN3KLzFB773LCCntUcO+qkbj7A8fKuRQIJoPhGpuzV?=
 =?us-ascii?Q?N2eNSAJwlNEhP+IPmEzJSVsb0wuW0n50bUAGtA7BesIloBvrGb39WBEInfUt?=
 =?us-ascii?Q?GL7dgYcYk3LKWKAKBlaWvMSIq3LDzaMdLeQKlZyjblzDvS0FzQtr+lG8X8hz?=
 =?us-ascii?Q?RbYO6tCw1JRuExG274jLONrVRYgsZtcNzleCxpW8wKF/2JXO3NWoOYT8UPpx?=
 =?us-ascii?Q?zTo4OFsnTD6kFOuijP/5Czl+oA9EC/vQdC8FCHVZSyPjvfXkaYEGrLQm/E11?=
 =?us-ascii?Q?15vbYG1LiT1D8BuVhRV/2MKDQNJHFO7EJSKoanhzAjmRMBG+rWdgNFs8QWj1?=
 =?us-ascii?Q?T3Wh7Uif+9lmwiJeYsjl864N8PPrDA7cSuMk0OXwl6HEdXSmw+9DoTAp7HeW?=
 =?us-ascii?Q?EOoKQEYemM6HYTeIc+1he9MDJ61KeDb1dbT8OtUECt6G+0x7bwbvPBdiSMaP?=
 =?us-ascii?Q?Xbjwb55qj5wjRBeUfqumjQwii539aptCFuW4/bXyULgif8ewsUc5XrgG99OU?=
 =?us-ascii?Q?BxPYGB97zbgh9peAk9piWyHh1Boudh3QEuGZjtyE1Ea+VG2l55OpQAqAdaRG?=
 =?us-ascii?Q?Ez9GJF17ycefX2rn+e2hXXlQP8oJTFg9/i5wFIG/CPNF2J2cMIC15X4zuXJr?=
 =?us-ascii?Q?TxDvBGAgw+rKatyBRSRGL8r3tYfkoeCESRAwzpewhRn3P8ZJPZQxJS2X1+/Z?=
 =?us-ascii?Q?kOHhjs68yfhBFA8NQKgjl69iCw2yIVp3LnhXspRxYdzy/aupNUvA/RRXRK00?=
 =?us-ascii?Q?zQ7ufGrJoTcb4f7UL3e2zml0iFTvQxURJMd+JdFx9BDjeeFEBsgxacWMGz6e?=
 =?us-ascii?Q?wVztfWQkLkkhF1VtpKYPtKTn80sJ02ONGCm69rzPvrHWEgp9XAPX2byqWFFL?=
 =?us-ascii?Q?MnrKP/ru2ZysG7/RGTwCCV0rIijxIrhHYLyp/kYXy3rcHuDC042W5MYOgBpQ?=
 =?us-ascii?Q?9SVQtNOHZVsZCdR91nKY2AMD0xP6G0QOLLFHML9adt5rtxM7LcSgxV6m3cDf?=
 =?us-ascii?Q?hX8t3eUrPh1vLcvT8SAUb7vu262CI4qXQCRD588Yb2XhEbqqEioD0VNuOOxD?=
 =?us-ascii?Q?JUz0dbWqweOKK3D4tA6o8+uemBqzdzHt07nUSRttPr5WkHyGIV+3iA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nKIOQrLbFA0QK4RbcllreIEyEl1t6Y7ZBo0EGVF24TWWXYZcr/5vxQ4tBwBv?=
 =?us-ascii?Q?s/vWUb7toLMk731E3yr589Hpg05cWh8xnBJ+M0mg3otDI/TPfecv7JAYOl/Y?=
 =?us-ascii?Q?r98yUsbQhQGeBFZJLxctNjGYnMviElZ9pqFjc3LoAqQ522zVUenPhuT5E8xs?=
 =?us-ascii?Q?1CbKs8PvhVTt8yIlTGIgZSP8U/7vpsPy48epZ4gcGhOrlYM2OlbaLxlk8lp6?=
 =?us-ascii?Q?DlTkTWpJHLrmQWhrvOsrIg7WUpQe3637z52yGFNgBetNzhyfkksDUtFMmnPx?=
 =?us-ascii?Q?L3UmdhaiZXez0e0S3QfdX7nx+hDRPjsOwOUQl5rco8xOYCz34Hd0AND2vfoH?=
 =?us-ascii?Q?lQzpCH7Nz1nRWR7N2nKeJwABSZ/nW5M91rAlkwDsoHv6Lhq5qnJ8o+WSRLC6?=
 =?us-ascii?Q?BRzZ3+sS2G2IK+ng24J/rt7gNGSYdoZe/ja/G2UU0caRjOAgvaXrfb+OxvWG?=
 =?us-ascii?Q?2TB4y/xDhehvB1xMINF2LaDCk6eU4Ot9nEIGLj0RxtOmTx6GnCyA2dWku54Q?=
 =?us-ascii?Q?CL1vLykeGtfnGRdPGaDCnv/eRB6qEAUy/+hSK1U2S1nbujrdKKTRtujjEiy3?=
 =?us-ascii?Q?2pvjm9lPGRG8+JimWk263U8LO95EHreTz4ZR0008KcOxxd1ZLwz9th6yhZ6Z?=
 =?us-ascii?Q?I5neskZ2aFzNozjH0At+4ZX+LVcYA2qy+wxRtQLLXE6Fcjx72GCJP6/2t9pe?=
 =?us-ascii?Q?kjXBgDzFRyfzLQMCmwpK7E/Y76LffE3qTK4iPnyXac7+TchtLWws0kSTtyLz?=
 =?us-ascii?Q?iJFF7+CSoK1pyH+OiygVDEJeWlNb+9U/MxIDdVKlgQIOghhhNhhIjemI/tmm?=
 =?us-ascii?Q?qaTVD5LX6L6awKoOOBjtMfOxtPveMAzxnEchxVrykjRlS+chERFilrk4UdHQ?=
 =?us-ascii?Q?Ez06/1TjiFCKAziTXDL2QWltHKBd3173pw0qO3oWgKPbDqwVlmbqwqj5LzUB?=
 =?us-ascii?Q?XXsikWSUvw3j8beDkgbUVCTTg8yAIuM26IIlFBR9OJCKGfo/dt8xFYqsS29y?=
 =?us-ascii?Q?9UKAQJiPC7yJvlMakjyO00lwJiMr5Ge2lIbFCBx8I4XxY/Br3t/7bpEVbBmb?=
 =?us-ascii?Q?J2OMyuiOCmnPMAd63dRva3jAcKNWFA3O7zXnp+ayJWqNpQoYr9xGRBNR1ajy?=
 =?us-ascii?Q?qlKTntJz8agqduisAKqvWBNWpolcKyed2DlLgmdAp6qqVAWlsKvTi2iFP76e?=
 =?us-ascii?Q?kJlxS/f8wEPQPuAgK39gr0EdyKjtAB3rfc5FyLnRsveqa2X9Gz3mwQEgjcKY?=
 =?us-ascii?Q?DqpCYdZ///6umTXutbc51Jv9ElXgY/ytYgaraENmSb5MgXZCn35od80NeOMx?=
 =?us-ascii?Q?WeRZJVOrpl1/Vn5v4avTtl3xHtdonxsSFpqtDCe6XQNhHVJ0H8cwS5SKtRx8?=
 =?us-ascii?Q?Opx3XHdWi7sSI0L4lQjbYxDLR6E1/pskcqu/6agS0zrlkbA84kRF3tlLo+bp?=
 =?us-ascii?Q?GTg9e8IO/+6vHvux+kYQ9cpgB8XFVIEXnAYVmXs8YpceM2OXfr5Ae6+jlL2a?=
 =?us-ascii?Q?WpVrgYhdcdHBfLWK1lcqskdGjPa6OX1dpoo0wF4tvxsnZG5V0tlw2eDknitD?=
 =?us-ascii?Q?bE86PYildXvwzWWitrN0hdzdmnD59y1jGvJW9fMU?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0868d9-91d8-48a3-35cf-08dd8e3139e9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:07:03.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Tkg642MgrvkQqvJynpwN67/YKMsJrUQqrIR0dlGnk4TZ1McMTRuns2OxmW2j6i/XM60i60IrQ4DuUz3uMy8xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6439
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Check that the input size does not exceed the buffer size.
If a caller write more characters, count is truncated to the max available
space in "simple_write_to_buffer".
Write a zero termination afterwards.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/gpio/gpio-virtuser.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 13407fd4f0eb..9f3c491f5af1 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -401,10 +401,15 @@ static ssize_t gpio_virtuser_direction_do_write(struct file *file,
 	char buf[32], *trimmed;
 	int ret, dir, val = 0;
 
-	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
+	if (size >= sizeof(buf))
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
 	if (ret < 0)
 		return ret;
 
+	buf[ret] = '\0';
+
 	trimmed = strim(buf);
 
 	if (strcmp(trimmed, "input") == 0) {
@@ -623,12 +628,15 @@ static ssize_t gpio_virtuser_consumer_write(struct file *file,
 	char buf[GPIO_VIRTUSER_NAME_BUF_LEN + 2];
 	int ret;
 
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
 	ret = simple_write_to_buffer(buf, GPIO_VIRTUSER_NAME_BUF_LEN, ppos,
 				     user_buf, count);
 	if (ret < 0)
 		return ret;
 
-	buf[strlen(buf) - 1] = '\0';
+	buf[ret] = '\0';
 
 	ret = gpiod_set_consumer_name(data->ad.desc, buf);
 	if (ret)
-- 
2.39.5


