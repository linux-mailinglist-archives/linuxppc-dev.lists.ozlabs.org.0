Return-Path: <linuxppc-dev+bounces-16961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKzLDtZ/l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B5162C2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5yS6WwWz309S;
	Fri, 20 Feb 2026 08:25:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524891;
	cv=pass; b=kxTXSC5tqCDFgtWiOckHwt6oaWELJTA5Om0n2tFtPjZV6Vd71QNujPQm579sXP5S1mIe659LGgSZfVj4jQ7DNnoUKYAUnbIduSobkpGvw17fVYoKp5bsIxXyCYI3bUJOhSZ+6KElGOzCZRPA6U9fD9OSKbQJztUrLEzAXYDU+3G31rAhF+1pfKtfEtmJtbt7T6/Y+bsNID7xw32Pn6C+QeenCMOc1lZr6ZLwYAvxIO5z0hfpkwoEvK1ILFOKV2bUGnKggAGF+CdB9zhgGATu7g+B+sFBKjMcXeGGf71Jor9bt9ICg3y1OVBm55/z0gV0ej8yO+Syr+PLCEet5cKhCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524891; c=relaxed/relaxed;
	bh=CxZHoCvUFEvKXE89GHy7RIyPqC6Llv2ihBtEsUX3bI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iMZlEjCJ2VJM7xTOIwg6Hn3n6z5tfCRrkTPMV4gw6ASJhccjN8giVeiICoJEet+JSivave9dUJxO/uMXt0awBcol380epnt1lNtxNAoakLtG+BJPUTAPP8j73i+up3ulbtvhSnScDWCqI0oiSqUylObxR6u/2TvGc829GWrw+ZQTb46fLTO5ySSC8FFMvlahX/NnznkWAG7eBcEEfChNdMqkSCReo+K73IY872xEM3JE403m9GIr0XiAtI4Qnni7ZumtxqPeInes4LtcpM5ajOXZecdG31l9n8w9wdI6wKzAGdz4LjqWSNkCDeoY40Ut/myHmEfcFfvTflDskT0hNw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pQM+TWIq; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pQM+TWIq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kM2B4lz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:14:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtKZMFWOw7N/f810bmxD7aM8h96uvNBkCRWcCtGMEjTAjqaaWT/zkvAZRAjene5p2kYp0iaHrFEKkmblwivwyMINue740FNcMC28G8Spn6wYT3UkOPJX1LwCV4jyGApyvPZRso9BlF2GK06NiE7HhVC5IJL6lhRdLImx9EACFNjUZs+HswXjzXj56l4LfYO/dgNUriyPji2iTSmcLzF2klHHMU7CgbIDR1ocy4vWbxz9kewHO6f20NMA2en3cLFCWf7s3V7nkzd46oCzzbmXl+tXgZ0YWwk//gkilNjRBrX8mWf6H9oDCv4f4UCEM9syUy+Osu0qzbaYMaK5wLbUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxZHoCvUFEvKXE89GHy7RIyPqC6Llv2ihBtEsUX3bI0=;
 b=PjRmuIlbrYdwydAmd3KlhE7AA1ez7wS5UmS3zo3JdDQDek1lSrmLJRffDgnC9VbWjO07Q5xF+g33FkB0v5JFK7AOQnFIIQJ7LujCBqQO+tctkh5dGwE3ziIT30egXG/g6mGCm/c/NeWGH0qQrGhPvAlVc0aPn5Hvkh1oYhJiw/ok8nBxt154bs/wTyPSiAHzzaqX/BuVJhNad0jBLeN8O3FgS1pPVfcquh8EZDVrvwZwUdKQ4vkH5MYmF60LTwYjHjUmhz2MrUxQ6f+AX5vUAsIPG1FifMNP5Mis31mHqYwRv/9DuYjPgp+Jxe9haBhILQlBbpiH5tcYwyM9uPxA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxZHoCvUFEvKXE89GHy7RIyPqC6Llv2ihBtEsUX3bI0=;
 b=pQM+TWIq7IPkvCjJDmczw2OPtp9qVGcthcY20avttU+mjl5lgNnEuFwCNjQzw67UjfjcK8t+ISg4+R0pmQF7MWx9MLjLNFSy3pXZZXtCDNjcM7uEvUAQHMFKY57/TGcbvq+8ch9qbFfokqQz24lSQ31/MQ5eEEcwrokU3QemZhIgGbvZfxCJygRWPqfGmbjZzp0LZ/sxF49IVuJjZJvMpG2v1S5ujT4tampMJ0N7RMejIpGRG58RXtyyb1RDeoE00SxDswM6+zO+/FwhJR/+C+FdCoA8Vecn1K+adbBb8KoMs+T1+5BmNO84N89tMGfjFhYODkjgzw/7dy66CxzStQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:13 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:13 +0000
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
Subject: [PATCH 01/12] powerpc/xive: simplify xive_spapr_debug_show()
Date: Thu, 19 Feb 2026 13:13:53 -0500
Message-ID: <20260219181407.290201-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0124.namprd04.prod.outlook.com
 (2603:10b6:408:ed::9) To PH0PR12MB8800.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ffa124-6d32-4bdb-71af-08de6fe2af4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aq/fbjJLwEjUZyZjLTyHFsYnANlYJHUC2eCH42GxFDL3LI9hWUZy2O3b2yP9?=
 =?us-ascii?Q?w4xYgdI3p98tYcMY6DTLyv7JWLHe+2hiOKdAQVDh+ITCYB5XLjONr9Rj3ONk?=
 =?us-ascii?Q?FnjQ0XXRjmCcoYgqCO9JXs9+vd08DTUXz+uuh0rgLmSK2c+eb5+tzQnNMbiW?=
 =?us-ascii?Q?iq4knC71Vm+ZNkwoQh8LLAfFRXgSLhlTCHRXo8blO0fvTjveLZUdtJab1XXu?=
 =?us-ascii?Q?eGOoLpWEBtuvPwowtRHZP73w+EDV15UyqdPWCGsEnFZ/R97UUmiQINqWanZ9?=
 =?us-ascii?Q?/lfQE+rihwynmkWST9umIIDhRg6jHWTCbpb0+OoIAw700pzUwgfOvZjKKtsI?=
 =?us-ascii?Q?A38uRhYDg6yIDGnZnqXLrtOcLrmcuSNbcElOHKqcBNhDJLq9jH+h5hHR4wik?=
 =?us-ascii?Q?l1R7GTN2Esbo6/mhPg3rGaZbCrdq2toF3isTCCPyT8Yb0zLuK0SdL/fy/OGx?=
 =?us-ascii?Q?NcM+8qQuNFh3+LPGmo49VwWeVGh6BnADN9KXHWlOInMRAXMh1WBFMFiCEk6E?=
 =?us-ascii?Q?6BFsPmJmx/SMexPT+pBEaNgKugDJwsSasZusMyHDqpaVEvn0cG51DkWqE/dB?=
 =?us-ascii?Q?gdl6UTg+H1j5dWnbP5OvpwaYmTbT88meoXLcMhqOOns/xNAsiY9iwhInBxY6?=
 =?us-ascii?Q?8+A9TEGm8+wXzXz3j1jlGp13M9igfSpoYFwB8+ySFXFbC5bsWGEHhHMtWznx?=
 =?us-ascii?Q?CfFYJqHQR17BDAl2f27oXA/n0qVaVSlQZZwnOHWtuD/hVGCdcjcjtAklY3Aa?=
 =?us-ascii?Q?5BqSzgvarBH7ezss+TX7hRV/eW00EHe1zVoeqkL68RR3NHLM/SRYXLQaqIMF?=
 =?us-ascii?Q?RcOf2mqHWRGeVpbBS5RnxBwWxl2DZbDyrGbZmJL11e6EseqqPzjhI2c853Gs?=
 =?us-ascii?Q?lLxkwoZapsEaw1UxmHsCl6NdEJrWBvPSDcn8Wz5FNw2xg86M68Z7O8Qfi+Ds?=
 =?us-ascii?Q?hF7+bSxvnS2/NziEWrxPdI06UQP/rZa7OiV9JyyvQ8hYSoHMG5GcFio2KcEC?=
 =?us-ascii?Q?UQuL5XqNauxEIZMiRjTqRjBPxaH80QeFZCdRDT7Cmek4H2AneP9oGPU+1sBg?=
 =?us-ascii?Q?6jetLWeafyzY1iWIQq9Frd1Z9TLwOdTGdyTy5PWyJsHrO9f8hTS8uOAREMGX?=
 =?us-ascii?Q?GpPJhT/HeqhBN/jF7A2060ffCTcLkXu3AY0c1EVUtgk4/3bnf+kKh1fHvKTB?=
 =?us-ascii?Q?Dgzwvwyoo4q3nPVxlNBCwVYHBpuWCMIFp8wUkwSEvRO8IH42SdCgn8OAR33z?=
 =?us-ascii?Q?ni0Nozj0yIGY7WUY/70Vt6DdMNLvX0//B85JwpqKfGsp6sFBNfD3Gm/a7Llm?=
 =?us-ascii?Q?v1ju77arsZucv/ApAX2KiGBn87C9WL69pjV2GXyVlDzdsAAv+9dO19Ap/Jxs?=
 =?us-ascii?Q?3LsIJn8uzYb97ZynbthBA70QrmtFppmyXCcvPsUzcbvVm+NLdqYSod+3PIFL?=
 =?us-ascii?Q?RL4/IQqR7MdI74sjL1Ited5GmHPJwkUFyhaODB4fiz+IvLPgHGyRHZMf+taq?=
 =?us-ascii?Q?1MQz4rMF2PL62GPPvZmlyd8o4Qb5Tzqfd2zNYdKwUNrDksu77lxhQHV0ei11?=
 =?us-ascii?Q?tRR7F/PD3OWJ6XJpQj9LYO2S/iw1dUNUzv8JCcfIhE3VBAlWObua5hk4yrtl?=
 =?us-ascii?Q?Bw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SwAyCs5hjPYmE/dFdHwSNVRGp0aHdGgW/jWJs7UDxrFO/AJ9CHwGmrzLhskQ?=
 =?us-ascii?Q?TYVKaFw4W38+oaKtGWgeURgs+Zqp1/RJWPeMTztqX3/a/9M8EzT4qiDfoGk3?=
 =?us-ascii?Q?XR9YKltmRhN963D/eoRd2Rl0zbn/8sqIWFNxMEq6ZdJE8mFxvPo9WhrhUUU1?=
 =?us-ascii?Q?1qXyKVXNSSeqU2tqSn3DVrijm3IKwjevfKqkZzOs1n+BmF9KKJ4dPhPE2st2?=
 =?us-ascii?Q?T9/ZkFpUtowJ8m7Sen0ZZIRxddygcjFVPBC1uC+Z0Wmd8djSMZnGWqXtG1U2?=
 =?us-ascii?Q?44e0rw2Dv52TSuNFzHEsQcIldWqvP3J/wr+deS2seK3jrOLd3LSxhAvnqbo+?=
 =?us-ascii?Q?bwTNjH8WKW8cW695Y3bhIAXb7WL5qcdGcuDEkSQLN2s+WR/e1yeVUra5FiVG?=
 =?us-ascii?Q?Z2FiMTgchMLRdhbLEXVMMOv2YHGkZBvM/FDRKl3IoJjOyRJUfQJ8EQaoiHBU?=
 =?us-ascii?Q?WCLIupqQcwbEl64XbYev3eJ0+lcMYhdtyRhDm/d91z4wbalAZpQMHOVEM7Qy?=
 =?us-ascii?Q?+Lbn2gcEwVPrvXdCndsaIMH6uYK/CEMUlUgoqgHTHYHT8gJ4Q3JkVnQ5r17F?=
 =?us-ascii?Q?vt377HPYbxNr+3lH1WqBZgt1TKIiZ/SOhQwmcfNSW0xO5l9f87fn++K+XpOq?=
 =?us-ascii?Q?6sy2EFwzaG2LbfpQ+CcJf/YRI8pFo8TMTLvTpBzcP+L3aZha3XMZ5GnGV8Zy?=
 =?us-ascii?Q?kAWmpRZ7yX9k4DRVdV4dV+6SPfmS2KfaFnfQItAVwt5KOnBazE3IwufMWeLT?=
 =?us-ascii?Q?Se1u5mILvd5AJFxE80juIZbCfTrnomqq23V3gvEcrbKoXBDYlLVPKzn8yuzd?=
 =?us-ascii?Q?lVsLI1fQS8ia/GCqDqV2yyDvW1xZtMRhucf2KhzhWmKJzL85hTodFRQTBaUg?=
 =?us-ascii?Q?CVLYmkITlmrvS/SQH0NnvolFnpcZDOHbkhI2zE/onnhXBh1wgBR2kAfr8lto?=
 =?us-ascii?Q?sm2gW3J6gfLht6Oh2NVwgm6c3H+d2moCE5+ReUsXS5DNoKSTc+22ilu/Kqj8?=
 =?us-ascii?Q?AImx3eM6i2y5mzc83nqDPckg9SnFMxGGEvXzOf7T/zRWnnE9rnLzcSI6rOCE?=
 =?us-ascii?Q?gLxreJjx1mnQFi+YSXMmiDmhlTmqq6DHcJxZ5PjnJofb1l5tN+oTif5ii5ez?=
 =?us-ascii?Q?bN7RfRKfdpRZO81yO74kgkKml2AX/srEDxNMtfKreIFuDBF+FnKwAOphznLV?=
 =?us-ascii?Q?jYw1jEiQn1JBKs/oz8S33FdibIZhfKU0wfQSxmCmuwrznVGreRWO67ibCs2S?=
 =?us-ascii?Q?+lE4f5rTVjLokVmsKS4Qi/BoPWEQvEr/NGXcTWr4K1+LOa3/jx26Z0NLOXNk?=
 =?us-ascii?Q?37Zg0uERR/P+3fZVQas+iwziAa39IYIss2vz7pTYGrXx2S1Lu9509MjyeyPg?=
 =?us-ascii?Q?A2O+jXp+tkAXnawNgsTfX/JchYduHUTsH/17zzdAJ5PUbTtEq0ZuICZCam4a?=
 =?us-ascii?Q?SHziqF0Vd9G6dgukx/jQsQmgGR/9fg3ZnH8/K8ni9ZlJerdEVeaxQmI6Xr8F?=
 =?us-ascii?Q?79jp4QMPCQjtSY+r3SsIzOPwROu9gnjiaC8LJU/5XnIDcVURzYkMwDA/UDI9?=
 =?us-ascii?Q?wbzf2967k0qxDEbR5AxMhhq6ypbkFDasCx8lD6pg/ln93PYXToG2n/0EvuI/?=
 =?us-ascii?Q?uEh3GlMIAHMNbOkmuCeDTC1STzUTrGW2LJF7ujc5GO/xLzo/GOb+pGpfVD7g?=
 =?us-ascii?Q?ITv0dzJhbW1a/mgEjNIXHr2p3mivi1DzJYXHe9ELw5Sap1ZAWmv16eHRbdin?=
 =?us-ascii?Q?6PUBjZoEyOHb1334kDWopyG2A0SGjWYuudXPPzfi4K9hvv3s5Rcw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ffa124-6d32-4bdb-71af-08de6fe2af4b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:12.9455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8C1LHg5Rb0BOhJLNkhDY3jIKII5Fo3c716Iuc53/LvPkAID6QQo2zT94M1AKZN93CxKgLDvpejuTra7TO6xR0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-16961-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 7E6B5162C2D
X-Rspamd-Action: no action

The function creates temporary buffer to convert xibm->bitmap to a
human-readable list before passing it to seq_printf. Drop it and print
the list in seq_printf() directly with the "%*pbl" specifier.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 5aedbe3e8e6a..f818299579b1 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -667,17 +667,9 @@ static void xive_spapr_sync_source(u32 hw_irq)
 static int xive_spapr_debug_show(struct seq_file *m, void *private)
 {
 	struct xive_irq_bitmap *xibm;
-	char *buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 
-	if (!buf)
-		return -ENOMEM;
-
-	list_for_each_entry(xibm, &xive_irq_bitmaps, list) {
-		memset(buf, 0, PAGE_SIZE);
-		bitmap_print_to_pagebuf(true, buf, xibm->bitmap, xibm->count);
-		seq_printf(m, "bitmap #%d: %s", xibm->count, buf);
-	}
-	kfree(buf);
+	list_for_each_entry(xibm, &xive_irq_bitmaps, list)
+		seq_printf(m, "bitmap #%d: %*pbl\n", xibm->count, xibm->count, xibm->bitmap);
 
 	return 0;
 }
-- 
2.43.0


