Return-Path: <linuxppc-dev+bounces-3679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A179E0B15
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 19:34:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2C9V4QZwz2ymb;
	Tue,  3 Dec 2024 05:34:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733164446;
	cv=pass; b=bFnpbgbW6Q+h8cufdFtrD8hkBD4+krVOz+a/GMgVBaPa8AY0nn1hw/f0M/OR+FvUq4gNLd9NumkmNUzwKA+Ry53OS9dMcEDW3BS4ygaLNsJWTRRIl9JJ0ukcxc0YnPsASXtEpCc4dBqAl1fas+Cim0B+zPh3+FKSNft8PdUx/kWUybnKqucAt3Q3XaO6R2I3M6VZkgqyYwUo5r1oNm6LllmT+dS6kLfxA+NvljRi3P0zBtVs06wy/cnQi69rDAIY9I4x2vODNZmiJLKW7xtZFgrsRE9Kaw3CqB7dE6mt3GR7MGLadkZ3qxctRAGe9nvGmfgJqET7oLhU9YwAhgEmtA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733164446; c=relaxed/relaxed;
	bh=ahS9CcuqGl94L63zE3Cop+xArrgh1GsHTiuRjG5ZNI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jPp1xRvJvHreyDG1quAitx9SfrtgakGQN4u/18xPLAgrVbcB15LS93LSIgTIgE744B7pQdQbC9kFfb+Nc+YVEtAkXGmFu9mAP71WyeuYZ3moHVIKO83m3wHWbSyRkTbokUaB7/UJgTkLpbOPXJ7TUEkkVILeXPL/12SwuH1B15y90cD6TrM2KQGdujbCVyfhEN1H+d1OTtnuCYBy4gfFdIEl9TrxCbcpfiwGBVl6ehAmOQy/5rdQaGNwHhvMl+ggFRJJAKpV955f+6vWCioY2Rfz4D9HdKeDo9HkDzTVRel3koLJ6klNOuacb+sx+JBpRaUVYfSnCqmo2EBf3xitKA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rGh+O111; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::602; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rGh+O111;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::602; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2C9T4b3Cz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 05:34:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dj2CTEhsyID2iBkLaoFPoCfi7B2A/flvXUvUQncS1RXOedFsnEsaCEtbqAYdvsiBZW7BNluStHd/Tzhlvkr1nvD1lvVsF30JUXQ7ariOwgHTdGkVp8latwY76YbwoIqKNgVmqRi5eVH7VnwRzXhp1ssNK9WdsZPOyxvjbbVGbGj+dzR5H4+LgicjzNdsBQ6HT93Z3wqvs1ip59OFYFUNP2CBA3PJwKqutpzkmy1kTxHjkC2aAZzMZrkjxbWvsVq6PHUScQFaFaZzG0gsXCVN8CK2MDShF0pUXWyGOSsMrIdpyU0UH9fvtpxbu72kuRw2R/R5MGRudHGeJJ822oz35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahS9CcuqGl94L63zE3Cop+xArrgh1GsHTiuRjG5ZNI4=;
 b=nOyHSIyq0g/KxWZwekD3+SSZSlf08Hoivmb791vAGkvOCx3N/fhx3uawHGOSUn0QTmlrRgl83IsMLa3NzhRJZxT0wkd3oGtHtlE6Mh02FdoxpravNv6u2QvYWPHBD5+fkYPZEoQjDqWZGXQOma0fNXV7l5mbQvQ67lL2UfUEw+vvzk7V8gO5oo7GHs6G/NBR4BKds5b9T9BkWqQw9mYI5ZcBf+Su2ceWpn0Pcq/ZZmiF+Qpyaw3q0wIFFQo3LTsytRi5Kbq4yoyLsgoln1bdCjPNctLdVHBFWmJu8oTWsD5cjt6YKEIz/JO8O3R0LGp6yh4LT9+QWc++xbLklyhZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahS9CcuqGl94L63zE3Cop+xArrgh1GsHTiuRjG5ZNI4=;
 b=rGh+O111tdHGDpQPFuEM48nVV9OMO7+uQFDI4ahivYcyLKcE4+mu98Cts3s8ioN3BXYLBpqkwixzVsM313wJmGCjt6yno93jnNPkjrt+zl5uXAncrS1qBy1kAMcSoCa079qHGjRUIr6mKbD+ywNfpOcTk5tJQK1bu8VpocsX6yW8WfGpVTgjeT8vEPeF/ylE9Tk324+nrh+ljaPPkGwh3ET4SeDSZjwkAHumFNhVZSTv64DU6MbkbesS17NKORnRw/K7cWR1vcaMlKIyO0xa6gDzMGT0BlWO/ojnVw5+m7e0kBpOrsT/7D5nNlcovCpHa9v1ZVna5EIvfUO3o+EKkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB8460.namprd12.prod.outlook.com (2603:10b6:610:156::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 18:33:44 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 18:33:44 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v1 5/6] mm/page_alloc: forward the gfp flags from
 alloc_contig_range() to post_alloc_hook()
Date: Mon, 02 Dec 2024 13:33:42 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <DA3DFB9C-960D-451B-866C-E5B8A9B3ABB8@nvidia.com>
In-Reply-To: <20241202125812.561028-6-david@redhat.com>
References: <20241202125812.561028-1-david@redhat.com>
 <20241202125812.561028-6-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:208:d4::43) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 151eb704-3f38-4115-1ad2-08dd12ffda29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Doxu2FQAsHEfoa1NYZ+qwtsfGf0Re6TYFA0kBc7yxiB5DwNqi5NEd8vGJC5j?=
 =?us-ascii?Q?a+FP3bPMbU1V7Cb3vAnkwCHkM66drZ7jmRKZTTeB4zvxHimDZafG+Nbb3M1P?=
 =?us-ascii?Q?rgeCdVokhNBoxeF7u7Y/YHmN7KuIEooVbq1NXZdzepr/L3FbNwuFtmwCf/YI?=
 =?us-ascii?Q?d9YmH8khDhNO2eZ3lqYp+GH6rrEoo8VoMANuhOHlZWkRwENfII2NaMsnHySl?=
 =?us-ascii?Q?rHDeylFHLuhjF7YQXuP5USwRQvb6R228XiEsQqcecNzQrmTh9HvCpnweUgy1?=
 =?us-ascii?Q?v3Vsaj/LiARE8YPAMAh8RVuIUhOKD1VIRjP8GZe1OIaW4MSQE8PUH2jPJeUV?=
 =?us-ascii?Q?gpvR55zQgXTQeLHz6JJ8OQDq8nncawLuV4Zy6TEkwBc7oDcSnxjYO5jeLBo+?=
 =?us-ascii?Q?h/1s5hXEubSJHASfQNNWN1cyiz6QAc5PQSZUschtJR1aAc/UqnLecvEmvIiH?=
 =?us-ascii?Q?/YjRrbeoOdTt34NJRohYq6dXewijuKdFe5QUMSrhkpUGEe3Mzjuc2eDAzE6I?=
 =?us-ascii?Q?Rund4w1GdFo1rLYwGCoYQuP7ipByg4OImgONIQzXdhEUNuI+Z77h/L4l1Qxk?=
 =?us-ascii?Q?RAdQtdsIRZGjUZO6X6IzgehEHZQ86VTUZwZ2QwcvrYJv+gM2jqwniei8FpAn?=
 =?us-ascii?Q?WF9P3jQZ7c1VJxnTpuVwPuTN2jZvWVUXBfioFOQETxiVMrbHEL/e47rKzk1F?=
 =?us-ascii?Q?TmnXvGfOdeL8ZE3ZLD4oWfIhMXxYYda+V4AaUY/4F8UcfqYq+XCslM8BQVYH?=
 =?us-ascii?Q?M6OlY4nldM+5sygK+BFXpHDEMv+YPwTTjooedbpbIs+OB0ARNWwtZAE075NQ?=
 =?us-ascii?Q?0RYYTmkFqEHTCHVNoRE7e5IohXTV4cjpU0dNO+/BXtCoBQt79KyHx0pWohcG?=
 =?us-ascii?Q?7wz2xYBOGcMuzUDvIVa2k4x9xE2zu6TCezTa4OVnIWMWC6hH+XpsHj6iGn/K?=
 =?us-ascii?Q?s7sdwEPWjyBsSgtqwOrnamggQvgRb0rtz8ilCoqPkQoROTsmjD6o5NZOONwJ?=
 =?us-ascii?Q?Tc6/TjtUQKW9mZq7t1+ycC92QygTapK8ftsHsoKh995PMuC7zIYe+mE6/b1v?=
 =?us-ascii?Q?tFhpIOkeA8Tl0kJM5ccMbgKTDh7gqvRUtGVEc/LPnKB0sYi+TmkmHxaY+e+G?=
 =?us-ascii?Q?OE8Sqi0LeqD/0UnQ3nPRBWNYzN+EhykRY56oAASJ/2kHjELtg+0MJL5+BB+m?=
 =?us-ascii?Q?dc+MUYML3r8/B0PDMTG1mT/w9kQjX5wwycPfVeyLO7CSE6h8smp8d/kjAie7?=
 =?us-ascii?Q?NIMp6z+TM3H7+7dKnMfDEILBMJFxGbhkpcK9nY0fLmV/25bu46/9ci5uHMlt?=
 =?us-ascii?Q?FbuLdoASAok5RnE/8i/7CA9T81IgPkt7fglc+DBUhZtHZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0caXR9JBCovLxjtSegEImyvOQ3o9u6+ld4QHmdgHh9QZeYUVQ2tnaBPw0USB?=
 =?us-ascii?Q?zJmBg480hPuXWhHSWYw8XpDUlNQyvoZyW1EdIMa4O0LfYJA2YeSG94gUE1ia?=
 =?us-ascii?Q?waZE0sUqWfh7AEXM93oHbYTDE43+hE9iIOvMxnQhuADImWetbD5bCn0o5jec?=
 =?us-ascii?Q?zFNQVgem1u/xNq7cr9iFoQoKlfTh6CuHe72HDUdfcWB6I2J6d0PuXXj4iq12?=
 =?us-ascii?Q?HEtnlSm8O+stfRpK/Ob43fpro1FsxxIOulbaTccq9DNlI8uDIXt/cviQMw19?=
 =?us-ascii?Q?xPnq8SM85N+0QExUz1e87hk0GJMJYAznQyG5eKzn3c8ETVoSvo87oyB+rT/M?=
 =?us-ascii?Q?6WuTKdQZdKWuOialH/22olRq4xTtaNQcpdA6vb7YgPsS3Z5paKVTcNnu8IH8?=
 =?us-ascii?Q?WTRuggey4usoO70SvQ7uqZDHlu/Idq0cN66RRIG3gXJBx9ApYUZ4mUj9RnkT?=
 =?us-ascii?Q?ms2SBT/8X4CGhQciYIa4k0KWFyynMOvk3OygAh/G58K3xn0BO7Q4ZMLXXcOO?=
 =?us-ascii?Q?H1d/REemnXvgqETYJZ4kEYwGUDGeP85F2kVFxTbL8z/KuGIQBsGtsfhsGiwf?=
 =?us-ascii?Q?UWXo7DnQEjJMAYUUguMg7IzkQgpg+1o5CHVbQ0PN6+UPGqVWw1L67fgHcE/S?=
 =?us-ascii?Q?pAMZHfgBokP8i8ufeWwzBUP8t+m2vhCc69MvSuiq9t3FroUwAYrggkQ5baYN?=
 =?us-ascii?Q?hMtcpHDA7FfR6wTtkH+5GPnl91T1ZizHL8skoedut/zKCbGo3JcZyJ+IaPhi?=
 =?us-ascii?Q?ODjyNVQ7ouDPfxMudjVTI1OMGDZYAWTfKkeGkEZ2HvMqsCp9qi8XdalD4kRg?=
 =?us-ascii?Q?jzHJ4YLhx2KZ+o29GmOCm4cdKDIyZ4OZUkFqtjI5UNwZcFWh8RscfvvvV2IJ?=
 =?us-ascii?Q?9mz+f6nwb8pyc4/4wj2MANuTJv/SdSnu2WNcL9DICIVcYbyn5pgvBGgWS85S?=
 =?us-ascii?Q?SzIz9/NfbUw4eqzuJbKSzGZNrprdyHgcKM0B9alYLhsOuLk5kjfhWx/hyATx?=
 =?us-ascii?Q?Me5RKZsJGRSjwq2uNJDKbQTVbPnq/79sxg1CwPnceqmMH0ya0iaaMuP0MZOD?=
 =?us-ascii?Q?0eDEBPc5u8XlmzlW/KBh6EBexgfnMQTbRgIxXGRJKT4m2jZJQf89ZA6Kr6e8?=
 =?us-ascii?Q?WDRb77z813BHxdWF844qGCmKnQx7w7orz5hYD4PyNIGsO7p1rr81G3Ko+pZo?=
 =?us-ascii?Q?LzRhbcK4TfWr6z9z9uNtc5sF7fPTRqCd3EmfW90jvul4FhZEn2gqXP54gdBL?=
 =?us-ascii?Q?QfmtUi2GQuieTx13fQLIwNDc/SwcYAjB3SFuisIResqeEW3CJ078HqUJ2UVg?=
 =?us-ascii?Q?fWiNCmCikJY0Rbwa8EcKAnMyhOBbqVuWdZhOtG2hP/PNKMDn1024AqKMHAxS?=
 =?us-ascii?Q?D2cRa4RvVmU4wsyU07g2CPVwRblZc4zh0uc3JdPPgE7ZkNs9XdnQvmTW81gD?=
 =?us-ascii?Q?G1PI/OqThe6wARx0bsxjabgZfZknl2GN0np3n1+1NvU/Lpm6xoRr9SjsZRSY?=
 =?us-ascii?Q?mMERIsL5C2lWjdIgOYJyggpz3VUFYvt7KaJz5CRqLD3rl9pG1fQRfE5HKkbJ?=
 =?us-ascii?Q?yM0qoM2VS5C7ZMP2qcLmpg/Q6/kyuUbSrMiXslLG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151eb704-3f38-4115-1ad2-08dd12ffda29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 18:33:44.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWM9LpQLMKaitHwIrnvQbod2NbRq2epfx26etcOi3tmalF5g0Xj+u+0Ttwvy3bLZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8460
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2 Dec 2024, at 7:58, David Hildenbrand wrote:

> In the __GFP_CONT case, we already pass the gfp_flags to

s/__GFP_CONT/__GFP_COMP/

> prep_new_page()->post_alloc_hook(). However, in the !__GFP_CONT case, we

Ditto

> essentially pass only hardcoded __GFP_MOVABLE to post_alloc_hook(),
> preventing some action modifiers from being effective..
>
> Let's pass our now properly adjusted gfp flags there as well.
>
> This way, we can now support __GFP_ZERO for alloc_contig_*().
>
> As a side effect, we now also support __GFP_SKIP_ZERO and__GFP_ZEROTAGS;
> but we'll keep the more special stuff (KASAN, NOLOCKDEP) disabled for
> now.
>
> It's worth nothing that with __GFP_ZERO, we might unnecessarily zero pages

s/nothing/noting/

> when we have to release part of our range using free_contig_range() again.
> This can be optimized in the future, if ever required; the caller we'll
> be converting (powernv/memtrace) next won't trigger this.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/page_alloc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
After the commit log is fixed, Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

