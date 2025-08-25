Return-Path: <linuxppc-dev+bounces-11259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A77B34640
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 17:48:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9Zvf2lq8z3cjL;
	Tue, 26 Aug 2025 01:48:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756136910;
	cv=pass; b=gCpi2nl82znQvQLviIhXQJMMdPDhbzix8vbSP6SIz6xztUkuQ/XBl/c3FbyLEbwEWW8P0H4f70K3id2a7c/6lVS2y9sR5me262x1Uzv/l3K8t2dsrLl8tKXdFs2EDZpVOdy/lYCmM+geLxVfQ1wj0Es94THYim5qoO6xOCt5XY8jcdEtuXdJUZ/oR/cSEsTllbPw7gzPV6YnqX7BZqSOKoD7rdnJeovQq0yx5DmnsCltu5adISXmnNMXIO64TVrZxq2cql8pU9s4h1dDGnz4sMlehw2ewn24QP+Xh5g8xBsCKmMQf81dSZX73CBb3eFqZzDR180fdTZWrvSdquOoyg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756136910; c=relaxed/relaxed;
	bh=Gayy/u5YJgTolACBqc1Pq3ipsMTmEQuKf2wqvxzJq5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Itl3L6srxImJhNfhw334HV0lMoCAiwAS1nmJr06NQuTt3HO0iYZAQ0gXnmUqHSMQodR4cZtl5kW0nOqajnMM3K1arWiOUm7S8zSTWy0n9kaQ/YGZqLL3dzoRpR4mmNbV2rEkpiDQ1hDz3CzglVunjLUl+kjzFUR8aQd9NHE90MhwbvSfJ5tZXx+p0h3fkA1QQo6+wg/P1E0HjkTNfMvjCnFd8sI+nA8zT1fzjpUVmf7IT8Ha5+XVzcavaH7/q3n+xJ1ppYmrElO0iIwrI9UIzfYuB5PpF6Je6+WGPlyZQc/2hPwbeVhIxML9ygcpc/DfPRxz0V/sBeP5+Hs9JPtI8A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Fdtgc/Rl; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Fdtgc/Rl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9Zvd4zjPz3cZM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 01:48:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHmAQShyhVH208N1uvrKToU2SMD/GuttP+IYSyq5rCVLCcmApl9//jcnSwPvt7oicb+b6ocDM4J/3z+0q8ERO3eoYIHIcJT+4OTkkc8rgN6Yv3vAAjQg2qi6+Rxi9WCQ1dY+8QhLbt4fX/VXLXMe41knaOyRUwqOAwVnMOdigpLrpCOPeiVOu9h5KWnDmLLaMQUz1G9a2i+Yca5r/GVXTXm3f8BA9vA8t/MOn+EqQroG5ec1a6ac1g1b2O4eELDP6nxRck5JoxKVKoFcYdbHqkVex3JHSb6Y1NqqLnNFNWIe1EnOVBsqR2EzDSm9hVq2VWZUrJCe4r6IxHPPq8+ktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gayy/u5YJgTolACBqc1Pq3ipsMTmEQuKf2wqvxzJq5c=;
 b=uZkjrZJYv2zFbtaCP9gCUvZY3rhD2TMhXKbhGEI/cvZMJwhxho5sMBP3/Uce0F/VWF/xHQvJQi2OgJR+mciepUzNo9I2L4XcUSAQZpPaTUhYVVTtyLWMHNcwWBe5pxIt8XNPuN9j81CQPQO/r0tjz5xc5fLM9X7f0/VLqdWEl5ISzMIlIUH0AQIIzPCzHWdIf5BLW262bezwQgfbsW9aMS5N9tnLYPKUcCCUKwi3GRzBghLx9lTtAz6/xbZKAja6T9fmPL8dJf/UQPiA8UUsAvmO9Bc2Iyb6rD20RBTazAk0yaM7izxA7Q14R6AmnryM9Y/90fwHTckqns4meqIHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gayy/u5YJgTolACBqc1Pq3ipsMTmEQuKf2wqvxzJq5c=;
 b=Fdtgc/RlYrZPsTELp8Y7wmRMGQFYCASiFJ2WzHMeJWaoFk4LF0b1XXPpzoEHGn5mrwh5piP+pfQZYCfX1sUYfJSyla1ibC1fbwj71THHTH5z8UwxJ/hyDEPcKp9+ZcP2MdhvzuNFs/6e1JD4apxSSXCyxZu0Rm9X8ZrlVxTLIVcSVY8Koi6D+a78KyGyrrxCJmAuio6WG0OFuqFKkMW3alLHOI5E6YFB5ZVHiE3dgQwl8rJGnA3MNuHvfR6OJKOec8TnTQgT6DKYDCXhdZVMfetImj5VXnW4M1Xra59xM9wvtjeSGh+bpoSqeKLAqU9QiPbAuee81wR+RD50WZJn4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10702.eurprd04.prod.outlook.com (2603:10a6:150:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Mon, 25 Aug
 2025 15:48:05 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%7]) with mapi id 15.20.9073.010; Mon, 25 Aug 2025
 15:48:05 +0000
Date: Mon, 25 Aug 2025 18:48:03 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: fsl-mc: Replace snprintf and sprintf with
 sysfs_emit in sysfs show functions
Message-ID: <owszq7idyxrn54ntfrxqh5c7fqhurqt3oocrqdjjpp6nqg3omt@ybtexqiproxb>
References: <20250822124339.1739290-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822124339.1739290-1-chelsyratnawat2001@gmail.com>
X-ClientProxiedBy: AM0PR01CA0133.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::38) To AS8PR04MB8868.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10702:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b53dc32-dff4-422a-771a-08dde3eec81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pass7sFP3zr99FNqtGArEgW56RtOpJCP28Tgj/oKTlhZoe+xMd5+7nxVG4OB?=
 =?us-ascii?Q?uT6KwE+dnCMwC4FMa9LinKU5It1YAjpg3FhhyduMupPPrvbqTpyS62UlliNb?=
 =?us-ascii?Q?RnS2IyE1vJ6UxmQSJiNxu1Ro5f9Z8PrE9l6s09uj8i5BNHu0iUgonRuG7tSo?=
 =?us-ascii?Q?10+gQ2RbdJxQjgw+RmwtoBnkyyav3lfQMwBlJkxjuIVrxSWMxn1DBEvRhmD5?=
 =?us-ascii?Q?7Xvv+npQGu8kBKd8LMiHeR0rrxb7SlDadCBxNvC2OrrmEqD8gAqgj0zmUsHG?=
 =?us-ascii?Q?8WThvBuUSP4s7Ll12kCwuxfzvCaKM01nKxnTozGpLdMV0xjojvkWnYrwdK/0?=
 =?us-ascii?Q?Ad3/9fKCr+346ZybfGiMP/qgi8cOkZ7stPwu3SGuzK0a80CzLxgvaUuWnvMR?=
 =?us-ascii?Q?yKFq9oroFA5z5BoC9ZqJ0XQODg9Xj8bOmFVWU3Kp8ez7Eu2RGxS78Qj3tAx1?=
 =?us-ascii?Q?HBDOeG/+P4bT/JpWpMDGvB5wdmQCjh3tMX3f2ifUv8lv2EdP3b8nWHhvGlBO?=
 =?us-ascii?Q?ArC9vSZGoPcDoCPd7pnkHupl/yLUpW7rlUrZhWU3BAICILrPUhN3y1CfYfLA?=
 =?us-ascii?Q?ts0wRP6YyZUUB7x12CCjn0zpRg6qm6thvW4c4JLMdfr6Uk/ATpfseTRYaJpA?=
 =?us-ascii?Q?XBf3kTajJGhCZc9zQY77ctOnORzJrfejd3NoHMbKZ/NXewCffNMKgdWe2m3u?=
 =?us-ascii?Q?Gyp3QETgBx1K8mo+vJSzafgr7kTeGhvkASu2U7xKXR4e8yn/LjUS/umwNm84?=
 =?us-ascii?Q?gLuc0fV2yct+tX/yO2dRrqt6HtBsAsKzZy7Gs7Viicax0ooZgCa3eQ1NwEge?=
 =?us-ascii?Q?aNFgZidtAFWFkn/aWFe0qfhZRgyFd3rnMxZqq5PMKLLqbNjfAGT1RY9GkRW5?=
 =?us-ascii?Q?ZwUWT8voBRQr4MpXzjbvbev+aNXmvNVmhT8PSpwDPOujKY9lx8MUKXeVGDDI?=
 =?us-ascii?Q?L6EzDhF4jK9C4Ja/CSFfGZK+FIpYgWuhExmTcG9TXTtuq++xXYMxqnzr2A/j?=
 =?us-ascii?Q?GAkk8Inm3WSmzDFheFvZghu2yTuEJM0AvUZajCY3o51Y6itL251ha5AnYSVU?=
 =?us-ascii?Q?Smj+2q/lkiASiGZA7DRAe9Q9kDoV3RhDX1PzK1J9MddHQuC3P7U1PNGdn+XC?=
 =?us-ascii?Q?ttEQINqFZN/VoLWKJC50xQquWfuDHxvf7yn2u2nV/UtN1uR79u+RKCxAu+jR?=
 =?us-ascii?Q?Egs9BXoXRaL4Deba9BNiToRdomUJPKe5vYwadC0aF+ej4gxmAC0tJlroiC4Z?=
 =?us-ascii?Q?42P6CPp51n7HVLwJ6uq9YdmF21ASEh9hg72wqWARhSVqe88hmovrbDVI5WHB?=
 =?us-ascii?Q?RD/hPOVGW6y0+f6wyDjHc09zF/pc44o2Frb5G94ZGsdwpMMSF9/OHQ0XuTM3?=
 =?us-ascii?Q?T0jwZB5qy0koAmwtiiGD4Hqje+IbOBXn1VoTrhzMSU/HXQl/0p73yRfCJ0MD?=
 =?us-ascii?Q?p9bu26hzamLTgbwXpCrPngS7+B0HzB3lXl4i19D9PFEuSDnQ80qUiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7053199007)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1OPpTOWu9cE8K0zAgS061tstnh03TmFQddzNCnbiFPtJ/9/qqZganeOx6mM2?=
 =?us-ascii?Q?jBdXIIWHogDMD4rELCwPjQOf+EelyWQsqT2CLeSRn2IwBtq787n4kAT1x2oI?=
 =?us-ascii?Q?pOGgO/TUqBAr06Fu/CHpFg2KE2J2QgLWNku96ZacZDV9jBfkq0LwC8M4N1q9?=
 =?us-ascii?Q?UnvbOgv++mLV1ZpHM89gyga/SCR86n5KCJJJpvGXZWtHEdCZrpzRb9UacZHT?=
 =?us-ascii?Q?6qKb7O/VVmXKt6VJIa3/ZsBhgdgPgPbaXOR989G/g3LK3ew6XyjjuIoXESa6?=
 =?us-ascii?Q?6Ljr9Q22oiZ56MBMVwlSi0zwEHAMI1mKviwuLpRNxrBX2Tt0Nan0h3yd+EN4?=
 =?us-ascii?Q?TBTJJilVExzpMv9Ap1EOK+3YInAfDxtaZai1JGJhA3pViCp6NNXnmmklHQQb?=
 =?us-ascii?Q?54nkpQY6sLurfKYRRmTIx1RT11IDB57KrVGGA+uV7uagTfhLSlelTmvhjrJd?=
 =?us-ascii?Q?ZCDH+NpUtKOwnv6Zx7OgXeXRDmD/Jsv/HRBxgo6QoKDwBI7pR/5XAi1Ls469?=
 =?us-ascii?Q?c9LfTRpEV292Y61iFxi+x2H4hcXl/lCbie0aHEEP5bYzRH/E0SgdGmJNpK+k?=
 =?us-ascii?Q?yACTnsAdp9coq0db6RwKdB/Y6KqhGLaLciG4cnUpXaN0MSWX8ld+/Y/TMgHm?=
 =?us-ascii?Q?OFax+MfV/QxZW5ZWHGxe9xvVii5GuhDm/i0V4IQvhqkFsx505pO+KALoqP+6?=
 =?us-ascii?Q?g+x6buo1BzlkDR1uriKCEf+Ak9yeLma7MenYxmFrdQKnbWR9N2eukMSBD+yb?=
 =?us-ascii?Q?jiqSgHj+Xz4fDU7RS3ncg812FzuNIyt+1WkpdHT88YK0Iawh0IlcYmVz6Crc?=
 =?us-ascii?Q?VMIFz9X312DMx5w9OUMsYFo4n/KnMyOzg+JnBILc8LlWy7e8ZMeO6f/GsLaw?=
 =?us-ascii?Q?KVwF5tof0osoSe6zQg4bMcPq+ttzczMs+eFvEJnvGlJy1+i7+uXimKL9y6os?=
 =?us-ascii?Q?f/P4Xdvv0AgACSSdNX6ImyL0QOjzIydI+ViTmD1Zwj/92eAQXq8hEbLIUgry?=
 =?us-ascii?Q?IXYgvjvQMm9eDFttpN8V5ADjyrZL4VsVTQkw04yoQp3lplb7x/Y/PRSG9E/M?=
 =?us-ascii?Q?b1VYl2fxhMK5QWnFJH6F7kjjXHF6SXc2WbMefhnil1bgiVS6n5cdLMfzWRpu?=
 =?us-ascii?Q?DbGLFk65yxtB/qmwjENbGfTeep3WSgkm9autO6RqfQ5XsMlR3MGtz09YmM/B?=
 =?us-ascii?Q?ozXXuFwAJhDokZ2ZEzcJBLkokc+vPuGFN3fhHYVD5Apkgyd/z3K2JuQ/DkPF?=
 =?us-ascii?Q?6lgDXEMI59IBMFRq8CssGpAiV04ufflNo1WYn0ky7LhKSmSVOtHZmEK+yOQr?=
 =?us-ascii?Q?wkOzw498ejlZ5DKdUN4N6S6zbEPxhq44/WER0zyuiRTLguY9bLrmgjKudRc1?=
 =?us-ascii?Q?ndW76W7qm0pSAlVnTcB5XRUxt1sMIYW2thmIcBRnLwgmgj+/pwESI0jfWDte?=
 =?us-ascii?Q?v3LEo0TUI+lhuDNgE+YVS0DI/P8dLgAMT1Nh/esQjWk8qnNsaf4hcm9OxbX3?=
 =?us-ascii?Q?hpoIYcMUETf8uWws2T3/NSfqhRcW/j0K4+MNxttkqP8CPN+am5zvkGATotOR?=
 =?us-ascii?Q?sV0PZdNEcExnu5EvxyOMtPe44EmbiDpeQhLmgCmE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b53dc32-dff4-422a-771a-08dde3eec81e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 15:48:05.7049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mXmSBaRgG+sZ61r86Fbi5C+5bk3NesaWgaTqpqkIPcdZAVJ7aiy+q++pcFOvoHkOqHbtQ02hDXilLZv8Jqkpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10702
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 22, 2025 at 05:43:39AM -0700, Chelsy Ratnawat wrote:
> Use sysfs_emit() instead of snprintf()/sprintf()  when writing
> to sysfs buffers, as recommended by the kernel documentation.
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

Acked-by: Ioana Ciornei <ioana.ciornei@nxp.com>


