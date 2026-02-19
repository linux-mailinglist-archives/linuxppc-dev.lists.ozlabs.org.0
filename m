Return-Path: <linuxppc-dev+bounces-16964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJOaJOx/l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:26:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8B162C51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:26:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5yr5GSFz3bjN;
	Fri, 20 Feb 2026 08:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524897;
	cv=pass; b=N3QFYnWmbscMUxqo6u+1vPtNrrgHwKbBOyKbRiSfDUJcxYBA7Dt5mtCdFGN0WNZuBRh+mfduGIcxkt4QOs4EIAouHxqVjmmTl5hdY+bJx4GHg5bvlUXCaAe+QOEatusu+Zq5MS/sMWxDhwluSa+zF2YoEFH/5cI71ZmvqEu4+dWzhCBWvbZvHkJvk2agbRjvkRNEvb30N5/Wh890E7AvvllIY8cxr6xvv3rjIMJ1OSNrlrOHRupxAlEfX+PAlO+mgKxuXt6wkstpUmqyLDocxYhc0NiMqaf9ifEbfRQsI2OL5PaRXqKKyJ5mUZWBCyd83nmvD2/VkqgD+DALf6RQtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524897; c=relaxed/relaxed;
	bh=Ng4jV/99nMgZSaZXpiEhnurNwSha6j20EOcmkMUj8LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gcwHfaOqivuJ7s/o03DuLVEHu2xRFEAtxvP5L9Op9wuZU6fhgBBIUmZubvMZckxmF8ZlW+8prX+Pq7BqcqDFMZnU7canmWBLrvmtJv54ds02EXLWTjcv6bqcOukfjLGc0RMd8TuRw/sTIFL0REo2TyDCbOOc1DQfXttAkeoDJfC+GYKVIoguxdrRIf4sY2phgppH2v5gZ0EL/+Kl4FpPe+T9Ki3oitsCY2HgifGcTFEQSz9xSRJYjextQlX5i1m1/aUHLfMXjxMaJSSTfAHiFeoPvXFkcIFQUSgzC6KRPwstq+QEYu4W5EYllTMJC3zGTZnxN1L4Q6FY8Te1J6nwfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PyrImgYD; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PyrImgYD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kS6vgsz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:14:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgd7eXP77qEL3MEQm5XdhfJvwACFlbCijG4G3gFG0IJV07gQ/g4ttb6OqUEDgTxoBqBnBcElVNLXbFpVQRwF4QEpiYWmnAn26TcWogG8n9M/7ddTTXVJNZ5np+knyqk4pCr57lJwZtpELXXXqvY5t+0EgFQBwUUDJDZXGGgBk2Aj6jhxs/lC2dtPidHsHmSXj013d6yqbYVPEg4X9j0jm0emxh/hUVBxc30dm3/IJIMlOtQ22VS/U6t72JnPf3g0qrjKMJG2fUpDeIIdmXKlji2+NsQBV9jmjCzsZzHqJn5sh4JsoMKq0i9sNCqtXY+pr+P/BynTGUYVXIEZ5FNaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng4jV/99nMgZSaZXpiEhnurNwSha6j20EOcmkMUj8LE=;
 b=Rue5DjVHyvsajCXMGVTU1S9ldLq9us79kO+5nog4R5ENVCwnNkhBeOH8/a/hohRgwKpONku502vgxf/fiaLTkho33v3ukGMY8AwGNgxFe8jeOMihibeyokaKJpXCvRQ3g32zsfuPeOCzkieTmHHIzh0mE8eCZa6Al/Nyu+izICDOT2fZ+37WIsfUgOgnDK41eEn5z3on4T8HxILcv0CScYkzXcy+PQjh/mnpiFAkIZwBrH5lel/VQtO1So+O80VTfN0trL+Pr35KH3cALlyYn7zNR1qkl38PJGEu1EdIaFl4hjcEEjlBdc7/C8vRqkhiNdM8Adf7cz9AWl/ocx6sTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng4jV/99nMgZSaZXpiEhnurNwSha6j20EOcmkMUj8LE=;
 b=PyrImgYDIlj5mJlvznRWbCOAkTry44wPLTZ85C0vCj0IUMceFUL4pMyfSP7d1cXcl2wv0pbwWmMn8GHfoNEa/pqVgBErEM5IW3jHhwYh65/KlvFfLqW+jA1aTfsL3C+QbW0onGOQEtSYrgSZ5KYD/D6tgc6xss4mxgnZ1rzzDfTN+EYUNieRcuAJ5wSFzVe0q9+rXWgvroxOtt7RpbnWbPg1VN3dvHd2Tw7Fe16DTvwX9BTkt0hFf//j6f3pZGtJG8LSn9sOxRB6LrVVF/yKRXv8IdgDAFpbwDM4MRaPaiFWcw0/P287Y234741LRgDWV66AKqV/T09iNlZEylHQ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:34 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:34 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 10/12] net-sysfs: switch xps_queue_show() to using scnprintf()
Date: Thu, 19 Feb 2026 13:14:02 -0500
Message-ID: <20260219181407.290201-11-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:408:fd::12) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH3PR12MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d02fe1f-a183-460a-5fa6-08de6fe2bc35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HwqYdj8f82A75TivfDHTTuZRdiRSrRAedohO9SHqgZyo0+Mv4DlYJTwAI3sq?=
 =?us-ascii?Q?IRUZ8doW7hQwqcnl4XVHSxQH0I8YhKGecUxUrjf2s47s9OkS1eMd4ObXBEhN?=
 =?us-ascii?Q?xMNxH2O1K7v07F5ROUB8/+avQgJ39l8ILDbH9alNDG6aHueuVtkedwffDZQL?=
 =?us-ascii?Q?lbBQTh266yaKbCYW8EfVk0qmlfvmIEF8uAKDR/OM/J3iGdZwBdICMANDzDzn?=
 =?us-ascii?Q?6KOtV6b7JMoVD8pqWafj/fNn3zHlMm2IhPecHN/hLlzPStRdGgZU1Mg4z7EQ?=
 =?us-ascii?Q?RMjf/VyYcneU/YAejcyXMGU1NaGzHWhyAyuEJUuDAJon5oTlyx1Xz69kL4pO?=
 =?us-ascii?Q?5jmOw9XoJ3p4YKrSkVlH5jImXr7CujBMknLOnHBYkYRXs5HobM3KzVoDwPRR?=
 =?us-ascii?Q?VidL5I5MqvTPF5AnTPqcSXJcbxqHrDWM7uCKkffGWc+0pIeWzNeUXsm2HM4t?=
 =?us-ascii?Q?LsFvj2MZsRyY6PSu4btBtTNkw+IwnEy1GpzQKdakUKu5LxN28N6v62bbGMXx?=
 =?us-ascii?Q?Q4l8/RKFD2QjDjZQY0n71EK1TEkqt0ERX6QnOUxz191ykkFIXcaXzN0tJkQ6?=
 =?us-ascii?Q?Aum0rwWqmtImv8DkgNE5/Augtl587eYXoRtQkUeXbbgb2kzxtai+w5JZTAR0?=
 =?us-ascii?Q?NeHkLnyjZdEzWwn5fyHXqmkpRIQnjjfHeAy8exCuTspDHRZmLfvG3slcpAWU?=
 =?us-ascii?Q?ir+Neejfev58yh28fFIzcYvEu0FTpGZlEoIF619vPTVtiquF8mnvuRG8t6uD?=
 =?us-ascii?Q?xKOjek69qdCveYlDsRRI76PdOp4gJEHqSA/CaJe32GoLcW98OGbfM4iYWsqh?=
 =?us-ascii?Q?ymTfCkBrKdXg0bm9aBPPY4ZrYR+6B0/EGf4gWCsJd4L0g/W7We3OKBYW8DCF?=
 =?us-ascii?Q?GZP0LKD+ydxbMPgwLenzN3Dw8UiP+0pAq5wCwXTQ6kniQgI7STAK5FRFHcQi?=
 =?us-ascii?Q?sjIAic8kg7h8UqrL/6O7X5+Sp+Sqtxsu1/zInk2sXoMWuznyZvBO+QUDFKMI?=
 =?us-ascii?Q?mZ3CQIsWQg0/y/ZtIAJmxGbbERaHWO8JQ90ZoMbw1U9s2lMBfuqyoiFXIHGP?=
 =?us-ascii?Q?yfDxb6G2gI1XKJdu4kC6DpQdKX5hXl74TL0ykl8aLhdwf424yhifTc5yocae?=
 =?us-ascii?Q?rprZQk6eO1TnqTWjwYFv0cITXMVXRXqDIPDZOER1UMyx1FIGc1hNWppZ20PB?=
 =?us-ascii?Q?3+lc7x6v7w6m1UD9HFPGq34cSQd4CeaMbmIRoaI51t2nZ7NPBBBsnLu0Vwnj?=
 =?us-ascii?Q?wz2Lyq4W84kiMH1QY/f6RpSxsN4vUDSHaYsqQhO2nLiJNMXFYHRK2opZKmFN?=
 =?us-ascii?Q?QSwgChY7WJTcEmU4sYtyo5L8mtdRViog0ZCz3F1HJ1TUYGr6xO9RCZLLuKTT?=
 =?us-ascii?Q?K5lJu9Mr5MZIzc08vKj865k3ikbJFbivEolRc5ZfXOcRdybFH2YYlAdep+zE?=
 =?us-ascii?Q?VKpMGZl4fns5kBxwopHUsok517cV0z1MSbAjGXpN16hM83pqBGL17B3JZv2U?=
 =?us-ascii?Q?0qfOr73oYqlEyeQ7wQ6evd+TFNWwEAPCEetXusvhFrpbCRe3AOh53nyEyLUD?=
 =?us-ascii?Q?M8JRzEhKV0dwWuoRKWiTqV99vg0qssRuXvEUX0XYd7cAfwLcvjPhfMxR8NtC?=
 =?us-ascii?Q?sQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KnN6NcItabFWaCWuPyDj/WokB+SQBRP54F7Eu1OCGRhDIvA27/y9qbt3pnvR?=
 =?us-ascii?Q?OnjIFe4LjqCyww+iWtkEq2h+17EuH4Nx6LXUOjzpMJNV5UH0ovE2dDXspDY4?=
 =?us-ascii?Q?nzGQ5tc4mnLH8rv+DtC2tJSo8/3dp/FBjWzkJL3TeBcXNlH4xnTwqrxXLBSi?=
 =?us-ascii?Q?2P2iEWof/dEFPpv3ZI+/ZP5z2y3+cCqk2H2IBbgqvfHzv//JRASzchr+Cqfj?=
 =?us-ascii?Q?5kF/isuGf8NC2bm7cn5Z7bUIkTJcsi+vDUJgCUZHzUoTmiMmsDjXaDzKzPGt?=
 =?us-ascii?Q?4fU52wfGOGpPZ/WjZS/n10CnxLbvvtaSJZyWEXLrkf9BXevXg3JrDMbcYAUN?=
 =?us-ascii?Q?5b3GfC07RrrxK18g17s1ZAIiidk3KRUe5oRXbBDKDzwqBZdYwpiJRO3Qk8Pq?=
 =?us-ascii?Q?Yvw2+6KxkKT2wZtaXf0GjWVowKKbioYoEo3ehmkNE9yPaCrAylEwrQVrpdNp?=
 =?us-ascii?Q?7wh8gDwUgj0BqBqDa84DnvcDr1FBbSIOfroriTleGCLlmDhk+c5IegHvGAVg?=
 =?us-ascii?Q?pHWq8IKGFJfU0mRb6qCdSI9+BqipiQO4SJGiUbom6szkInga/S64byxieOzf?=
 =?us-ascii?Q?9JJ0ZZznLxAQM6JR4u+LVSQmOqNnG8h8jAYOyJPJeJUrSArk7uPzg/KihilC?=
 =?us-ascii?Q?yY4ntwN9kdnbcoppo7MNSia3iPNpTq0tJaBZNDSD3N/p++TionCggPGtrfh3?=
 =?us-ascii?Q?ohhmZB0O3rX10NPYjedmViN56fnkEHCtst9mJHTBHFyWMCtcz1k7EUh2MoZU?=
 =?us-ascii?Q?uFrAE2d6fDo/hKxUvWcRShH+yJuF7xXGYAOt5MJik9icPC/o78H/yCRSfZkU?=
 =?us-ascii?Q?TJ/WIxFtzJz7qtj4OFax+OtW0cPFAbjML4yC0MH+WsOZ10Pv9gBXmHHOE75s?=
 =?us-ascii?Q?WHpjyQsMtAMF5FvWQh9TqJBLIsET4v9jEI/dKCA9cjKwYozsX6vQEZhCmLub?=
 =?us-ascii?Q?6drxZhfBltbjqUXOr0Y54rVe/fWCsgns1HQEMfRNnRzmLKqgnzySfhMFk0/c?=
 =?us-ascii?Q?iYY6SgkH2XP+TYIqGA2aGIawuodnDXLMM5wZZ5/z+cYODW2Bpk4gMBObBrXj?=
 =?us-ascii?Q?zoLhEdimqx3sQ1FKSGxg8RozYvypVCGemEeV7335DddnyD7klgcmQIriVqam?=
 =?us-ascii?Q?1/zxH5yPe3CwiZ24HuNvSk6d7vYaEG2mr4+0nZS7NElhb/AJTUZBy2q8ppMl?=
 =?us-ascii?Q?lRPwgbS+E+0imrqoXPn1opqfVuk+sgvHIF5NMuVDjVLCEZJ1WofWPLvcNjl+?=
 =?us-ascii?Q?D6kqhq++Q6YsOo36tIkOioXlVz4NqdgCkoYCSjMbIlQSSQwYhVvGJyLnusDF?=
 =?us-ascii?Q?30nFQZ3j9Ko/mW8wZv4fZS35WR/FlYgGKChJSE+dppxijOinXF5GXS0bWrHe?=
 =?us-ascii?Q?DgIXWdbN9BvwRA11eCkewa9nhPy2vhfhZCrqUggWVb4U6zQ0vyG8iuT3g+Je?=
 =?us-ascii?Q?omQSZ/fptwKdjSU8jG4+E8sGxdOqGsGSnH5RKB2vkHW4j0PlFALA2L7ZvobR?=
 =?us-ascii?Q?V6bMc4IamhKti6EGdODRJXkdzkgqhszNyW/5Gcodvvk42Sr/1ET3/ALKguvb?=
 =?us-ascii?Q?1GvLWPuZ7hRVRJL0on6NdDDEVBicKkbAypH/UCjqqS6aYSiW8sujJw4nU7dv?=
 =?us-ascii?Q?EHNVRQ+YU5DLYg+dL3ecmQzw84ZXqnIXiedvneYSGfwz1pNBD9WXGQWTHhFG?=
 =?us-ascii?Q?FAaTvLS86Q/rND0cTznQd/zLR2bT2bW+eLYq7r9tcXLPVDWSPSmnhGbvErj6?=
 =?us-ascii?Q?cGwew3rHCxS0nsf6woBfbDGQzOIFqPDJUU98IGBGo3agzKmyzfFb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d02fe1f-a183-460a-5fa6-08de6fe2bc35
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:34.6239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVCraiY9a/pg8u+mt459Ol5wNeVWZU3LS25A9mPjGuDyZFLP5uue2gmB3juyMEpvP2TyMHPWoFwEOlOQNd9LvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8877
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:netdev@vger.kernel.org,m:ynorov@nvidia.com,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16964-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: B3A8B162C51
X-Rspamd-Action: no action

Switch the function to use a more common scnprintf("%pb").

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 net/core/net-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
index 07624b682b08..501c75ecda1c 100644
--- a/net/core/net-sysfs.c
+++ b/net/core/net-sysfs.c
@@ -1754,7 +1754,7 @@ static ssize_t xps_queue_show(struct net_device *dev, unsigned int index,
 out_no_maps:
 	rcu_read_unlock();
 
-	len = bitmap_print_to_pagebuf(false, buf, mask, nr_ids);
+	len = scnprintf(buf, rest_of_page(buf), "%*pb\n", nr_ids, mask);
 	bitmap_free(mask);
 
 	return len < PAGE_SIZE ? len : -EINVAL;
-- 
2.43.0


