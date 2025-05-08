Return-Path: <linuxppc-dev+bounces-8442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED5EAAFB61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 15:32:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtY310308z30DP;
	Thu,  8 May 2025 23:32:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746709623;
	cv=pass; b=T0YhJ9cP/IHUPzqs3xZj9ioy1s3ILxD27p4WsVQvopVW91iPsPbfLsy08wsb9q0/qRg46vn1OX53R3DMEPoMYSAjyAg3Ch1cRp3ryoPX9VOMZgPuiUnDB0X4taxJqBmYRQaeU5ZT30I/4ebE8AHDn1LqDgNVaKO4gi5T6w78Wxo/2LkGogQowrn/TNAZtx64Rwyn6oMUV+FRcORLcJeVVlaguqwNCFMCPAwqq+jApePZENNqj0dwmLRU+yE9x9tEzRh1EcX646lW38Y/N1gDafP0PwFcEg6eixVAHT76gkyTTfpf8gGQE1D76yWVNlL7qjWdtGG9K67j8DoS8dA6tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746709623; c=relaxed/relaxed;
	bh=D6hEccL6HiR7eyGIqBcyl2E98fOhlcxvHaAuAy2FE4o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OTV5XogHYoPEaK3/GkcsFUacvizjiCpgZctwsA4UVq53+gb+PBHAk3sJ4eMFyicYyKE31tT7MQLICif/V/aj5HXEjIR0IbfhfpsgWoYB4J04Fi2n1JKRqSoDCSSWoNRaNafcuD1abHfXSrtgys7gdZWxUqgTNoy53uWIsY1hmJYq8FirUUKjqft0IdREN6nCZSvB5ZqrXMiNIlwY5DYPHZRkYu146byqpGlf0R6efZn7yUcM7oD2MaLqCV5aN5EKlpVdEX5alX2DRCIX6m/9mjDRG8AljwA/eOOLynNUVa+iJiDqABceyQwtLxxl70J6W/5NdpMpW5qes4Qfe/OWFQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com; dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=oecok5gB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org) smtp.mailfrom=mt.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=oecok5gB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mt.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtXTb2qtxz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 23:06:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffCo3YAdAM5hCzW+0pYqx03XK0Ae28jUQAYVvYd0zC4wMIdd8XXrFkx2kj1ghHfn/sDJCAZrIBcUrzzJLt7EVydvj6jsLw8ROa9RTjF/LNh6PFY43HwebFHNwH936kGQFKv4VgKpc0BGsk7NKIHuEKnYf9DPlti0FobVflBK4OHI07mbs8q8SsxI7nUL2uth+NM/7cEnJWdKfTQUAP6IJQe7kTC7ixEQnJ7K0fKFta+VC3o+t3qerbHLQnYxAUHlu7PRvqzEFzAW2BKXkCuCgEcyoSh7/vBGxoYssSUDewwWPjdh0A+J7eJJ7Db6PACKlgHYojrZOoGampOmALrFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6hEccL6HiR7eyGIqBcyl2E98fOhlcxvHaAuAy2FE4o=;
 b=VdzXat2tx0YJv7irjN5KnjBxoD/Iv187Uu8fLj18S6nhWBlnxq1T/og9VhrYPhqhKlPu8dR0JwNIeKwU8mY7WLyzKWi/8jYyT31IHa9gV9ji1i/lMN1tfNSQudMslBvkWgNIPAlfVmG41u8YV3661EXyT5tYxa9487aNaAfPptsLgaJH7Dik30p4L5ALnVf6OA1x+TblIOTX3UJcfAqmLKyNj0vSu/x7Mj4dNNGKqO5tgqGr/ANOf814Thk8F7n2i4mHSPZMo2I6wSkEualLKEyAybyMmdGSANW3yRzUHkv5pQM6W7yf2Tvi5jDikyyHh4+DhKSK+7It3cPQZ4llkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6hEccL6HiR7eyGIqBcyl2E98fOhlcxvHaAuAy2FE4o=;
 b=oecok5gBWy8H+urELq8Sfe0lP6JizyQCQa8aKCZ/lDwzWUCWk7XRAupT2OJnyBmr6Zy+JKhsAIfycqqQzAquBmavwyNRyoWPNb+o3zTiWbrm2uV4MECjJiVo+PmYVkYwvFG0ZxiptKa5DS9v4H6C1cq8njMQxAdZoAXHMy27cV6RXjl7y8BMy1MIFAi++dhW9G9Mh+pcyXK1J1ZJMg0feasMqYwzRDHXGSmYnD+xlSsuSj4DS0/JfpRNdPiAXjgFNwJ/vaKtUzE8K2VRx3+DymyAxopxB8hnzO/NO8A9CxXGwVazwjjro619Fv3TxHmTcKjMhDcl/aNnsg6xLETPyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 DBAPR03MB6439.eurprd03.prod.outlook.com (2603:10a6:10:199::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Thu, 8 May 2025 13:06:32 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Thu, 8 May 2025
 13:06:32 +0000
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
Subject: [PATCH v4 0/6] Fix potential out-of-bounds error in some drivers
Date: Thu,  8 May 2025 15:06:06 +0200
Message-Id: <20250508130612.82270-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0020.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::18) To DB6PR03MB3062.eurprd03.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3467c20e-bc98-47c1-7f94-08dd8e31272d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1nQFFE4MGlxjrpUOEUIk9D58BhMaVfcP7iZwYKP2xxfrqnYNBmWeYvIIZ1u?=
 =?us-ascii?Q?PO6045/2Rimboh2q8fBNLJHTEwGQrzIQmSytq6ugSBhr0uW2fV88itVr9Nit?=
 =?us-ascii?Q?CvbsvUxWWE8/MF5I0zhldJrM9LzLEE50/cPdPsjWNbw+pLY6wKyJksjhRx09?=
 =?us-ascii?Q?r3PLA6Kr02FsWOKqaUJOGQkjzDLP/+8E75P4zGA4cd49hpMw7r9wKSOnbV46?=
 =?us-ascii?Q?gyEHHd17hWXV3q0Y2y1lYrbXWv9LrtsVYXn7JeJYolsqXpKOZLZ8PdOywgb1?=
 =?us-ascii?Q?kw/OUXwWAFIetWWFWOLOJflTUH02Gf4/zz47+ChSAIjuwxByIyeq6kywscsX?=
 =?us-ascii?Q?/1BaP13TXRjoH+N9tnmRINIxoHKHCg38LdLwywu7aJ8qjVTjaOsYXS8p1NOp?=
 =?us-ascii?Q?GIAijrBg+2VZvvHCrf1qRvFAVbwa6be+Czu1734mopqKH+XImDok4P/Hf9qb?=
 =?us-ascii?Q?AvTyYntkXYzpoPvSmr21NhW3II5JfOr2NHSe41ts1x0B8GYcdkemq6CTgxy+?=
 =?us-ascii?Q?MFrV4uvlvnh8Ka0AAZYbRoQnyDj5ZblB0rkqTP4SdXyE3C3tL6M+rViWZJyc?=
 =?us-ascii?Q?fdgMpzzdkPqSaXPk4U6Y/dLjCxITglw38lvP1zKBhGWbIht4+lAusKcsT1y7?=
 =?us-ascii?Q?1qS927BR5J8KDvUuJy/yrEkAsaPmelJLN92Y/iZlaX/mjK6ilxXjZq6figSY?=
 =?us-ascii?Q?GnOLmVP4uoDFuevuIeQ3AcikFIc+0cuZ6UCyIcfEYkmIupkm01tl4OhIJfHP?=
 =?us-ascii?Q?28fLjjXjxfEhty7lcpoYDoS+fytrwLQAa/wPnFwArp79zuxUkxtUEBTGAHwO?=
 =?us-ascii?Q?Fnfa7QBLAgv6z7iheFwTGtk+1TOCp44rzoX+c3v+dgQqER28TRk7axfka4pS?=
 =?us-ascii?Q?heF7ZtF60n0HzurkLeOuB9JS2+1Oti8hp6TonrKqYFX602eqGg3t8vMO5d9i?=
 =?us-ascii?Q?aNejh5SLOXkLIqLXXt/EebUcn93qAPzJgBh359sLcoCDeEg2G5EUqbnPuIPW?=
 =?us-ascii?Q?v6i/5z91iVjOGLbxwA9fJThaXl+NiXIaLPN47NUpe/HURA48IP4VblUidJEH?=
 =?us-ascii?Q?o9Bys8w87hVAC5FGqeb1MdBbyqGGkKjT/v1yY16Uiq5C39c6q4XsVBjy/oCb?=
 =?us-ascii?Q?rHB3bHeql7T/zCEgPZsCK4IVKxE8sTll+Ajop1Jq5yeF8Cyg9AKePssuda0J?=
 =?us-ascii?Q?kQ8T0PI5bcL3nwDKjKhRXkh5p4xvCU1n3sMqCrUlSD0nEsigKT7/LuqWwKF4?=
 =?us-ascii?Q?mb1TCvTafu1CRaM97YV2OjH7bRRvKfYWV1MMxLD2eiIBfQ59OWDCDyVujr8j?=
 =?us-ascii?Q?8QHD1Of9QSJBoj3HuezI73Q/rsUbqI+en0/wcu2K0DItdIA2DMLKhZwSrlGI?=
 =?us-ascii?Q?AuxgaUbWBMqQMBU7xq8eD8GQ4zEb8X8TNrJEKywEvJnN3k117Vv5EnT5Ixwc?=
 =?us-ascii?Q?ok0guqH0Kkl1cwlhb733dcm++MFQgWHD15QSJttOY1fDgnL+jxQaLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j7eTDj7baio8H7fE3UviJotx3bFAFgoQvCJy+eqq6Jb4PiLG2XHjPwqc217a?=
 =?us-ascii?Q?A3YhbdWRpY5EpA0UnDFrE56fMLG4rlYp5eL/eNvjft2camzhAKJFYxrNZj1J?=
 =?us-ascii?Q?wE9FT1k5sMyYscUJ7GFZgJkDgPaCEMTmr2eIss6qwJf9TBtvxQyFJx5ks+hc?=
 =?us-ascii?Q?J95ZsZmK1aq5fAvk2ivke4MDFgzE0EN3tqkpcOLhNz2SmT5ToG8cKq/nTxvz?=
 =?us-ascii?Q?igaB8yaheUt0cNcYjb72bekVUtt6NLFXTqzQIDV4gZgL0UEDPsMlLu960XGo?=
 =?us-ascii?Q?XvVNfjZ+trOd/D0CbYC96KI/DR5q0jRlJ+DlgYrCtueSNYgGNtaqe6AC9O73?=
 =?us-ascii?Q?bolCtAe8f6han+Nl0bhj0Iq5Pb0YLLOWIsv2lKAe/rpfmgPs0HS3xdYfdBTd?=
 =?us-ascii?Q?1/jgtpSDpQItyoruAkX0aOk/BMIa+IwHVSDRx7mZ9ESw4HDP5P2tyG0iBZu6?=
 =?us-ascii?Q?RO+2MzmAjMycFZY9Q1upbXKtjlbkslKk8KeqkiHgz5UMDDqk+6dhhWmbL5jv?=
 =?us-ascii?Q?DpDuUuhq+buR6Wvohex0xaj14bcgS5JmPqbdtgEXsoDzZAXnE9Imt70Op94J?=
 =?us-ascii?Q?yVrzNQQdsCiDn5Ir9ZzisJ2/MK8MwIwOgovKPCl7/+2vBIUhvjN/rjwkJRgk?=
 =?us-ascii?Q?KjZ/fbsm+vfoW9fp9WT94U/RCzJwR83/TVRy51ea/QFj7oTygKvWQ2Jt8vNa?=
 =?us-ascii?Q?Su9yq8jUbQ9liAT5lOQB5kO+/IDmW+o2RZpGZw/x7mfU4PsWK3bjQTJD3uY7?=
 =?us-ascii?Q?TbTrDl/2qsI8XoB9Dc5xQCX+l2FTjWG4ynkVZ7CKlfM2pIFpdcWfoxgKKhW/?=
 =?us-ascii?Q?lVWCC0FmNzx17NvNdMk/IebLZiKPrqjY5plaEFAIjyQrPMI/jYXziIN5Nxro?=
 =?us-ascii?Q?wtzIG/ohfy4H+X9pdsO2LycL/xeW8Yg0+aPnx1LY+NiG7RV84vPZpxND8KnH?=
 =?us-ascii?Q?rR8HQlNFMmRo09iO/2TolU+we8aLogqE5xrNZqxZ+KW0MBuiKDxZy+tonatM?=
 =?us-ascii?Q?Rba9zqR3vnjx1N0gMDOXAzf/8FBTAKdOHaz1Ofr8O0+6szPpFGnjwvK2OWQu?=
 =?us-ascii?Q?MeaizXWykRLYvuaNrIEdVEE4Sjtjdqx+ZkQhnztZ/mn5A95FN+XE7+rX9hlz?=
 =?us-ascii?Q?hW6S+kUCawz4blLjwu7ZjEzA8nNMnBB7nJQdjKQtPTGOyb58MKKljD7Zo7bf?=
 =?us-ascii?Q?zVLF1vhWzvTXhHXsUFi9FbmbbbV4lqZwxO+6N8HXZUNwfLq5KjP9IFQSlwrI?=
 =?us-ascii?Q?2sP9SJ1CCwcZshblZyPoL/rTiYLDti+zsYCOSvzIfyhdhgBfk4fQhvLxiPBz?=
 =?us-ascii?Q?IMdfsRfL7IKJipKx3Qvkd+9k8DsjNTlrKV9L50Am5zpgvERO+A+X86vyZSbC?=
 =?us-ascii?Q?EBDQKScA7fd8aERD/FT1FWacbPJjLdmHFsfZ+WfuKJm6h4+q2QX3j1eB9nzC?=
 =?us-ascii?Q?Mvuv7JIi4lZY+rbVZzp7Rv6ItFmFEAv8viCFVdEDvpGSw3x3PH5CmJpgqQlv?=
 =?us-ascii?Q?eXQC49EWHQqE3DRZdeOcu9Irm5aeMWj39O5q8wzSVcyzpAq2VD8a2uVI2hLu?=
 =?us-ascii?Q?JTHIAM0FBAReljxiyHnpkIxWaSmEHv3ElD01pgu6?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3467c20e-bc98-47c1-7f94-08dd8e31272d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:06:32.0742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbyPbVaA+1pN2BWb2HGQnGUFF1At4GBFzn6ms7m9v7OUfBoHtNcPbhdsDva7scS1F6pmDkB7qfKPdmVt6KrUEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6439
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Several drivers are using debugfs and follow the same pattern.

A buffer is created on the stack with a limited size to copy the given data
from user space. The copy is performed using simple_write_to_buffer.
This function limits the input according to the specified buffer size, but
it does not write a string terminator if the buffer is truncated.
Therefore, the driver adds this zero terminator afterward.
Unfortunately, the original buffer size is used as an index, which can lead
to an out-of-bounds error.

This patch set fixes this issue in all the drivers I have detected so far.
The fix is to return an error in case of an unexpectedly long buffer being
received and to use the effective written size for the zero terminator for 
consistency.

Changes in V4:
* Revert the decrement of accepted size by one character
* Added patches for drivers with the same pattern

Changes in V3:
* Decrement accepted size by one character according to feedback

Changes in V2:
* Use effective written size as index instead of original size

---
[V3] https://lore.kernel.org/lkml/20250505203830.5117-1-markus.burri@mt.com/
[V2] https://lore.kernel.org/lkml/20250505045346.29647-1-markus.burri@mt.com/
[V1] https://lore.kernel.org/lkml/20250501063240.25295-1-markus.burri@mt.com/

Markus Burri (6):
  iio: backend: fix out-of-bound write
  accel/ivpu: Use effective buffer size for zero terminator
  iio: fix potential out-of-bound write
  gpio: fix potential out-of-bound write
  powerpc/eeh: fix potential OoB
  powerpc/eeh-powernv: fix potential OoB

 arch/powerpc/kernel/eeh.c                    |  7 ++++++-
 arch/powerpc/platforms/powernv/eeh-powernv.c |  7 ++++++-
 drivers/accel/ivpu/ivpu_debugfs.c            |  2 +-
 drivers/gpio/gpio-virtuser.c                 | 12 ++++++++++--
 drivers/iio/industrialio-backend.c           |  5 ++++-
 drivers/iio/industrialio-core.c              |  5 ++++-
 6 files changed, 31 insertions(+), 7 deletions(-)


base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.39.5

