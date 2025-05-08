Return-Path: <linuxppc-dev+bounces-8447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26270AAFB6A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 15:33:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtY3h64bmz30Kg;
	Thu,  8 May 2025 23:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746709656;
	cv=pass; b=JCmNzUGOA/RuYonaAAn4jeU7xF/YRKkiDCZG0Jj00zFHNu5+vm8aDeWQl+aRF8S45sLvZWb4t+r6voV98c27J6ZUSJT5yGshhbXas28iL/4PpoNfcPPE5VULdpkhovLQ4ZCHlRq4gwlzjVze8Aj6aeAKXCPlz1yRWTf9V8TEeOA/rkMpe4lxeL/BFAeU9R0LMLlS3VE20/1RJS6fGQiyYwrjI0+Ycj9Ssl3cvB4vCDOhEZPs+uM9SuFcbMEpMmJs+jiaP76QZ7CHsgH9HzURKaCLEIefBRDWRaJEpQOKVZwg0L7x5sZb7Ebo0nNENyoR2685U2srtZiNc4f0l1jFSw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746709656; c=relaxed/relaxed;
	bh=S5F41WSHzCATAWBZl/xM7lrGyq/XeH1P31zMh2fxr/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zxc4g6eDWlRmsiaEOnPg0eGXEESPx7YmqUjETC82SJ9PeNOaM7twClvY4KY/mH0G0O2GOJcIpwSoveQXwE7JV8Xrwp/OxFvnUUyiTaFvPirSGRLGucBivB/L7BeJ5Wv92gCBH312+25iOK+Zqqn3SouW4oeOw5g0CqhEA8M/Z7WpeAjRZ9Xfyf8A4zuPd/T+nUz6ti952QI32H9K4qSzS2GluGTeswtvJUQyJgE4imozHwDe5fWU3TCHN0SPhosQkjrAgGK6QZPri76kV94FDc4g9wxN+4QAW8n7yoV2dp9v05Y3AYrwJGrVsLkpsYw3vmnuj0l8zlsGtHMopVBJJg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com; dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=gqm5UuuJ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::7; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org) smtp.mailfrom=mt.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=gqm5UuuJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mt.com (client-ip=2a01:111:f403:c201::7; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtXVJ2Z0Vz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 23:07:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXT3XxDZneGsl4DD7W/UbKsBnsDeL4AeTyTRzbRrITQYBiGw9txxZEx5HAajvtwQWxMSEod/IWleeask5J+IEzHbpn2x607cwXG/ZfwNcWgkpfNNlPuEyfAIxhuw2ubXRXssqw7Rz7Tk2HJf4oEp3mKLdiCUHibhyRyV0hMKqKoJ22E/Z+GhhZBgzP0+NeyKlKHqKxz/LgtkwVtYQ7nH+m9R1HPSpv4IZZlkwbrGfFjCK8ADyxfXukAFRsKx1kPQHKKRiToPNw3AIrhEkBfkcC8yp2qzZPfqtiQm9LaIqjmYAFJA5ZaXRQojjrLB1uLJv2d6IOmQbszAaaV1uwC7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5F41WSHzCATAWBZl/xM7lrGyq/XeH1P31zMh2fxr/g=;
 b=W53Ci65v9L9u2qX+CBVGm9KuMkwi983EMw87O+7A9U4063vlQuiEvwOJVTRnaOuscZpu32Q9AEOrhrvaObdUdrKNYCuG2cJnJ39ksXp2avf7O4xXmEHRgIANUc+DtSf+sYSoDL5n6PCYxyJvTGRcWawHwoMcvevjE9SmiYIzOGXxHaXCewJtWOAYQFu4317S8C6CHzwgT/cU4vfT1H7bNqAY/IxFqdaL8o6N2RQM0Ri0nBdbGc2QMdNzZU85JPXPZNAUr2C9BJUe0GR+k6BVclCLrNFswiDpJ21joNMSoSV4WuN8dF5TwIgqfsQDkKklzgeril4ZfwhvKiUwrI/Z1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5F41WSHzCATAWBZl/xM7lrGyq/XeH1P31zMh2fxr/g=;
 b=gqm5UuuJcqTFu+wiaVy3MxzDnd32sggllXLk+WzC4IOzKxuZLxyI3sDxYcWcXc/r1rtpIfAPsLLbdliVkNwbsIx6Z9SRmNzhKaOXaULiJh3zhfJ5+LjvwApCjyxW0XiMq6w9sFXYFiJ6ASnUxFv83vpoAYHzIjfR1wr94YvBd/fj3i9ZmVabI3BALZIK84tD2s5/z8PCqJG30FEreDotpkrOt5l6tr8e37HvnaaPZsWNNOQ2tP95DRiYpe8EKqoebLvc7mGrEOLiXvWSh7uHaeoRacaKx4p9TOGFSNx1bKFw7Mqp0CSy1/kohcDYlJurI5ZIL6kt8PQmdYGE0H8SKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 DBAPR03MB6439.eurprd03.prod.outlook.com (2603:10a6:10:199::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Thu, 8 May 2025 13:07:13 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Thu, 8 May 2025
 13:07:13 +0000
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
Subject: [PATCH v4 5/6] powerpc/eeh: fix potential OoB
Date: Thu,  8 May 2025 15:06:11 +0200
Message-Id: <20250508130612.82270-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
References: <20250508130612.82270-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::14) To DB6PR03MB3062.eurprd03.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d942e158-cec1-4556-2a75-08dd8e313ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i+eBpRJ4YrvktpJ9eyQCVL0/0ZXYHo9S0CCnHdGRwhwxDOH63nevPs8DGY3f?=
 =?us-ascii?Q?ExITHd7rolVi5x/Ile2sHulaelP7lkOLcZr+XJcHQn+wSiO8cWBJnAnbQCWt?=
 =?us-ascii?Q?UvKBCtKUhWuy+eL0csGYoiSWIMbIUpK05hyY3zB5NZMUHd0BGaf00HDyIr4z?=
 =?us-ascii?Q?qT2jpTHIBAD2MMArbCI4jIWq3WKoUUg++iAuQjo5omKw3DGZ//OppweYpGNS?=
 =?us-ascii?Q?v4qrUqwJgB2IKx/d3o6CBwhonufpxZ/+wqgH8GYpTezuANEn3OkmQwA6kJ/E?=
 =?us-ascii?Q?Ceoh/BFcqKdko3/2Q9eKqs+dKqjC/tXfjO4R5vnqbwtdSxUBQEuqCRuqK+M5?=
 =?us-ascii?Q?xNhBVjucn3sWY+ZSsW9Wh4NWva5m5PWodsJixf63L1vGooWCFPf9OLu6T42z?=
 =?us-ascii?Q?IO+Q9VtqwPFt6gv+m8sllWB3C91q5GdGxNCqojGUMD0PqEK3DImUKQSmWIp9?=
 =?us-ascii?Q?vQIdYx7yQ5T+6Z4RuIViQgdFNmSV8rHgoxatNLpwvRaYL9L3xh2VoXv4qPWG?=
 =?us-ascii?Q?E6RCxJ4jIsuY/YcxUGJSfBvUOwe1z8VCZ2fZXKK/d7NmgNE1UQtrj14Y0h9o?=
 =?us-ascii?Q?5ZkCLjy7HpeBTfxQYWK7lU9f/OARl88yIM3/AL2s1lYksViu1bR0yaZ9rHEZ?=
 =?us-ascii?Q?7QkW5X3peuYIrksU/CdymIdgXmjEQgaLu8iIzs8fTKsMgcC8kC0cd3DOVekZ?=
 =?us-ascii?Q?u3cvxY8KtHxmJAfVzAOs1RnW1jWOfDfR/iPkkPZCoUM3owjKm20sEczohtcz?=
 =?us-ascii?Q?XW7PnH1okyTzClD1iTaP1pKXUcjjiM1bYtV/GhT2ynzOFqM0Dv2NhqKLijrw?=
 =?us-ascii?Q?N4QhlQQoh4HWP6OmhuBmQlvIbrI5MOIWx3vjFCR6WqwvMA/Q9/TvR5neKjjE?=
 =?us-ascii?Q?/9jsjMDVZ9151+K4H/+XlAmTHUVDvhF60Y3jqLAsh1fytGjdZNaZd6Iyepc0?=
 =?us-ascii?Q?EA+YL7t79GSiLUusgnw6rFX/k31yWCTMyN+gCqLglEcDCSQB0KXebzrWm9iX?=
 =?us-ascii?Q?bX+FK9XPT2gUNu96j9St9SnfaQW/ZiyB51BxvwbB04FC0HgbNZqeLeP0xwCh?=
 =?us-ascii?Q?qDqekvJVBenz5SNLxAggiPKIrdQJxFRROKpQjY3V5O/aw0aFr5wrrjP1DzW5?=
 =?us-ascii?Q?KA4qfy5pphzsDnxLYkSjr7NJIhT5iYgklYDup+oNvIRfpeKrpWjmLG6qMpYU?=
 =?us-ascii?Q?xTHUlBmC5XhIFO6zq7UUtWmgp0s+lNWb0jhrQfL5ZtUIR61abbCLrI/ACQ/m?=
 =?us-ascii?Q?pB7xn6eQHyXInV3gUDv4h/jZPguqegzb1GjDoMycOueBaHlNW+TL0+d0c2fh?=
 =?us-ascii?Q?qdSnZVh7SE6wFh+usDW5AgzNkshKqUoPxun/nPSodbF88hCaxBHoJl2r1OBC?=
 =?us-ascii?Q?IbsFb7BJzUtw4rri+PKrpocgK96NMpWBCsXWjjL6A8QzA75SeUHxo4i3xJjG?=
 =?us-ascii?Q?PkyK07mmsmuuyMgWpK6zbihLLQqcN4pWH/l/382weYqrRMu23v85Fw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Zh0dIsPa9pR0Tj453r9azWrgpcqbHNs9wfiFjiJ/EOIu+LpBhz+QAOiaCBB?=
 =?us-ascii?Q?SMWvvrE4bSWDth9ktcOpgP0A3YuEq7c17Vp3uha3oQTB6Z9YGDZKXje4NhhF?=
 =?us-ascii?Q?EZMWgK9dQFbv+JPNldivCC88O0X3KLT420SY+Mjj7bBobh71/0oPFYg7x6xy?=
 =?us-ascii?Q?ha3En2vuibwLp0kP1MMGmL+jXZg29tW4+dsC3Hf5zn2FsRfoObt8uBhvi1Yk?=
 =?us-ascii?Q?gnqkEaBIupVqBGW+Wd+mmm6B1/S7KozPeRKVu3Yr6vzxndIdbRBrDvofZiJZ?=
 =?us-ascii?Q?9HG/Gr0YA7Cno9uAxAMrm5N0fepwCDLu6vG/h4Q7IrOTD0BZV+NiZ/CAV0GH?=
 =?us-ascii?Q?gvehKRJRLewflnAa8U9Dtq4GFrVFOjvZnA7x2Bfbe6ILjG/Xb9Khxu3pk1EC?=
 =?us-ascii?Q?uBXzYdD5P5FvO1PA/O6nehDwTI9o7HU8p5633CHqkKG8XQEikjYEsviL3CqC?=
 =?us-ascii?Q?Lc7MNUBXAETjlqYTg4APUfPpp1FRCCn62T4VM0SqZSbt1X/NX8GC/M1WvFPa?=
 =?us-ascii?Q?wYk6UDHiFEdCSeshMktJuV3lsN3j4aEJ0p+hGa1wRWBYSjz2jQIAMoGIuOSl?=
 =?us-ascii?Q?jCS6Ywv8+KCb5U62SV0NVlaGKJkiYmT7SKozmj4IrDj57f/IY15rUHu2L5t9?=
 =?us-ascii?Q?2AmMTfRiTxPk0yr1qdH9AQnXSQG6VcwY2OQKE0xeq+q32cUE2aakKPh7c8dp?=
 =?us-ascii?Q?HbA8pmDbZCYHqbSP/ciZ8hu4TkMlmIWOXx2lqNKZ6KXAlV9+Z8ix/RQtCPrL?=
 =?us-ascii?Q?it0Q1FxszdQ9ND4Ehob0Y4ejeUcCDh6mMweoS9tHELhuy4q9NsM5jVT3eeDh?=
 =?us-ascii?Q?DIxt3fwBdXXhxuXlv8yAOpaDI/zPY7F8xzRU7g/hMo9bYTyPNoMWLI8xySPc?=
 =?us-ascii?Q?CBAqq6XiGLIZCxbtz17AgcYtvA0qZdtq2mbrYuHjXKR76pgkFPsSHSp2Ylog?=
 =?us-ascii?Q?bGH7VoNsOMNMB5FmEQIekguVxkt92I4v8zpWsu+i9LIf/H8efl37Knq4Ub+f?=
 =?us-ascii?Q?Ey5obw+OT85TIKcFrEzO2B1m+DfTYhTpRkHcNFsla3jCzm7BYNUha1J0xrU/?=
 =?us-ascii?Q?1uzqFkpCj3F7HRNkdR1bNgaQoMx46NAlY9euRbxLd5nrSlZePhZJWjaTRiHZ?=
 =?us-ascii?Q?ow65vtx04fq6S0xybYDmGP3eu8JcTLKvfgUd6slj8O6O29k3OPTctlshwkhe?=
 =?us-ascii?Q?UMn11y7Y7CZ2ezdjU4XkwyTnVrNxAivZ3GBz7EyM9ZCHBe7VGZkOkM1rJFZG?=
 =?us-ascii?Q?TjLt+6mLQo9k3q6BFK6LFTVChamVXB0NsZG4ZWk8xC04htCArgWloUk48IgH?=
 =?us-ascii?Q?nEnN8FFNojWXOY8QVu8L2tt26jbiDZoMiZtKpnA4XjF5ZsNPRtgfm+/H4OWl?=
 =?us-ascii?Q?Zze45GGNhzrREfsmXIzHstoe7O/2IJeKyOUiFZJOBoNH13FbfT2aiHCsnLGN?=
 =?us-ascii?Q?3CGVvu/wrSCvgdQZWTXJFjbSXJoHgmC2P9XjMD5m5ne9fjoP/8lMY2rWNdsO?=
 =?us-ascii?Q?+L8UwuVJoVcOg/Tsy9rymWxIKmMuwe8t7Faq6Wziyq4Jbe30yRn7K+7+vzzb?=
 =?us-ascii?Q?puKxSztzbZj2CTdiugyvmbeg/ynB+Rp606zzjnjK?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d942e158-cec1-4556-2a75-08dd8e313ff9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:07:13.5203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYWMiu/vtGaata4SJ4J329tM5Xfa2SiQtyEFic/70daJaBYEUEEPWN89IWq2arUnXqicBKozvVl0TZNiWxFOow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6439
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The buffer is set to 20 characters. If a caller write more characters,
count is truncated to the max available space in "simple_write_to_buffer".
To protect from OoB access, check that the input size fit into buffer and
add a zero terminator after copy to the end of the copied data.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 arch/powerpc/kernel/eeh.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 83fe99861eb1..92ef05d3678d 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1734,10 +1734,15 @@ static ssize_t eeh_force_recover_write(struct file *filp,
 	char buf[20];
 	int ret;
 
-	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
 	if (!ret)
 		return -EFAULT;
 
+	buf[ret] = '\0';
+
 	/*
 	 * When PE is NULL the event is a "special" event. Rather than
 	 * recovering a specific PE it forces the EEH core to scan for failed
-- 
2.39.5


