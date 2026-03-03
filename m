Return-Path: <linuxppc-dev+bounces-17629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAeGNAxAp2kNgAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:09:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0059E1F6A1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:09:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQRjB4Jx5z3c9r;
	Wed, 04 Mar 2026 07:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772568574;
	cv=pass; b=S4FQKe1/8/PjLIizuVRwc0w67+gikekFtr1scQukEFDvDjpoc02He/IpQwjna2sZPRK6ANgIS2EAXzPFAKVxi5DRrLNguvqXtmsB7V/UqGmMd3duZ6aHfIyBE7CJW/wSBmGlbQ+RMGaiZzoCSOYCm+Ww2qJ/dpXQ7oYV5gug9fepd+Iw791AmMdo8px1MA8mSkqp0qEnvKtj5UmZSxRGR+0qmisxp4dn9qcOB09wyWZYFw0pKx7bJq6ge0R+KrcKR5zOPpSniPmn7RdE0wJenP1EpuH0Osj9LpVF+cKOWf1FpdQ585uKu/u/wZQLuIoZtn5spRswJQPyP0cjAniXdA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772568574; c=relaxed/relaxed;
	bh=0xUDeXnvzGgrv7TP+QNNkshzDGJy98FmX7WVWoISDJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UOllgSEUGzzSEUJfpgrHKhyFnGp50/K2IDo8s3rtmQZpGBXlydjCGe95iJkPBNKUUV7sk/3yUxOiwje/Vz67+wnKB1YHWU+BYolgQ7xX13ZbTYRQCb3T9DU8qr9pNq7RsaqodH/2gKOJ5KE4um6xmS7bcNz8eF05Kl1BKLhdZq2itI4YjFcSiw0feUjXTNAy8TvBKOFG+aiphQnHkaijfnxf4o1vq/Wtw+x7s0BWLp0r3YlBFjYDkV9yKqRXyHiE4dN6UqecHKRvFg1TWKnSQYldD+6G2TpUy4T8OTJj7fz6l2JkjJ7g5NfI5d86G0EqCUc3YfVwIVxzkwWHPIHzEw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I3ltHKpC; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I3ltHKpC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQRj95Nnzz3c7n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 07:09:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTf8SUDpA/eoLiD1vQfibdFL1lGh+5VWkl228OWJ87keVjacCr//lZmtxAfCbx0M24wilSod7Fn9xsY/Y+XblAc1T+DMr1CprBxE1vLP4Ekkk9eAyRgMIO84D7YNctdg+nNkKN7uNi0Gfrq7Nb0O6F+6Srx1/gdXTUzEiQK47C/BR+u308kLGLAAGwGI4Wjph1duHwTCDn+pdlfw35gTqkuknRA38ahyF/X0z2dWrP3wIlBGcumf/zXokVIxw2OV73SU1zfSX3f2uGmN0M6T5eNewy8lsDuD95PbOe8L5og0uyjUnDp4+JzrjHkuW2Ie4+LiYcJ4K0Wj+7JWO9phQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xUDeXnvzGgrv7TP+QNNkshzDGJy98FmX7WVWoISDJY=;
 b=K09u2bFv+6647Th9g4DlfOCe7nYPxbQmRIr8mJjtORYWHZL958OQW8myCPjRyQl2dRVF2uyX0hO1p6ne9wrPQnW2QwsbfdcnJgNyqLQUVu4wY1g3LDUlxvmlw17NelgUlCf2kvyQX7tvRR7HHkQFUl9lRuRXlfNmlx7CNStgP5VRcQZhzw9WxAmA8fqXzWO4cwC8gUiQwkQsPnpXK85zP12MY2LhADjA2qeNt7RsENSPNmLUFaNyVEU23GSntaS6D99IxnOK9kRDTU3VSTgRe/hCHXWq0tI5G+Z/go68qEYQmfoDimHrTtg0PACT0lyMTSYs3gLF/zeazj4OSlAhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xUDeXnvzGgrv7TP+QNNkshzDGJy98FmX7WVWoISDJY=;
 b=I3ltHKpC56/QsehSDTMi02CgC3eMRC0dEq77Bo1AOBm5bnBPmN3o+HPr0W1wDxdu8x12i+3Pu57jNTXM1zDdx2hfYoslfC1cJ10o4HYDfh+6hU5SrJlMqFeveZiIorhCDM55THYWVa5N2JbdCVY/RSxsxJkr6hbdVBWLNw/w8mb83BETAHRTBXG9Y5SZ7LvVy53cwqBb4kHClHKe06D6G4ptA+V/JM1AXvr9jNRFaUL/2d3DAaYPrGp6eEt3dARNu4Og9Tu8Ss2yb26FW0toM3Hs4nPpUp83dOtj7iuRUygfhYBUujae/vyDYaaKHJPo/MZMPc4G+xqJKBe5vHjxQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 20:08:54 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 20:08:54 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Kees Cook <kees@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Russ Weight <russ.weight@linux.dev>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Suki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Xu Yilun <yilun.xu@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 3/5] coresight: don't use bitmap_print_to_pagebuf()
Date: Tue,  3 Mar 2026 15:08:39 -0500
Message-ID: <20260303200842.124996-4-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303200842.124996-1-ynorov@nvidia.com>
References: <20260303200842.124996-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:408:e6::23) To PH0PR12MB8800.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b73853-eafe-4058-3171-08de7960b060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|10070799003|376014|921020;
X-Microsoft-Antispam-Message-Info:
	0zjLMXoyRHhpd8KI2PFBzc4EqbGrB/58RbxngWo2FnOYCMF8aA4sNib4KqOGSgSBEj89RWAX/XhRxEznPdc/d0XugVqS/8WesGChZckppgc3n+oioo6ww4ay4OHxjlFR/m1kXddnW/sVu139AV8cec2+W2s8B/JF/LjOFc6tB3g9rTERUf3ZRSboUtYyJrK6vqPd9pKdJQ5zNP2+Ocesycvn4HWHXHvpBvTahp9MVRDiLCTnFXE3hLvMkXjIYmKAXPyMafFGgC1Ih5qK/dqnfRouC0JHUN/bBhzaPOGERqryaRXSlhCtmPn7uGTxMErASSgtwNTJT6AVOY7TK/FUC6VU5BWOn1GpfJxnVwcpvZaIkPbdTosMjkjMEVYWren78pNGSRiRY0IF7mT0QFudkgJJJQFhkBFgmXr0awvYXKN1shEUFCJhti4+3WVBI5CCZnlw2y5bzpLuvgqppw4dSxl6zEVLScdKCs1YAqqkcTRD5mC7l/es5+70fG1MTY6wy/n0UF3HmhDEv34LaYUJuzHpS6q/BwnI81jhVI6LPyjantgQXQew/IhIvkR3gZdxpwrV1yTfCatN/m6JtrvhdXHlM9fUU1kUwVhD9ww0AqtSe/TChSc3xoAZIq8glp7g5WktNVyLzftreBgzjiz7X95XtxD32Z5QRcPs6Xx2MqBM/7DWm61iPbNnIX0nfzD7cs9sDUc8oDty0OwqlY7uDjr2eYphuudxEiSi4GViNiyqxCyGgXOdpqYf7d2U6HqTmyjdS4pNKEgt8+aG8iQkkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWZscDA0eENyRnRMajQ2dTFDbmFES0NtVkx5R25xcTJnbDRWcHJmWGxiVGQv?=
 =?utf-8?B?QlBNOWJTNGtTV0pQaUh1MHgxZ1JxdmhDdG9yR1Y1WDdrcDE4VDVscUR5VGs2?=
 =?utf-8?B?RUJIb3ZBOE1WNGpRdVd4L2V6REc4Y3RyazFtMXV1MG5iOWFNWGZORWdrK3V2?=
 =?utf-8?B?NGJrQkdReFU2ZnFvSEtqTFViWWt1SVFJK2o0aWxOdDZHWGEzSjBFVVFyNDRa?=
 =?utf-8?B?ZFRWcmdMM1BtQUhPUjcwNDhlb092UUgxSENjbmI2NjZEMnJFK1FzY3dtT1Q4?=
 =?utf-8?B?T0ZsSmlJZnJkNWhyMzJYMUNOTUMrV3VUdHhRc3NnS3ZDU1ZFNk9tWURwVUZT?=
 =?utf-8?B?VnY4WFJha0MyS2NIS0c4RktyV0RCMjhtL3dvQTdobzlJM3VITGh3ZDBQUUYz?=
 =?utf-8?B?d0lMVXdsLzV2VHNZS3FjeVZCN1FBWGRONUhKTmRFbzFvbW13d3lKNUZkd0xV?=
 =?utf-8?B?OFoyOXpZUklIenlhVXZJZlV3RFMxOEZZNzRqa0puS2I0a1E0ZHROVEVhZDBo?=
 =?utf-8?B?cStkeW5iYW9HdG56TFkrbWJNd2NTK25ZT252aUV4TnBnYWdRb2QvVTNpTzUz?=
 =?utf-8?B?RHNGdjZGcm42TXNoaWtjaHJPOWVyL1hKQ0V3MzQzenVGaXdyN29VVFpURGIr?=
 =?utf-8?B?YlA4emloU1ZOcGJjMDJlVWMwcXl4WCtiNzUrSnYrWk9LY3VCK3ZtNlNEa0xC?=
 =?utf-8?B?TkRWaGlRZjlrODVXbEdoZnViOVY2N0RHQWxEb3hoeVJUWHVXdEhvTkxDbGox?=
 =?utf-8?B?Ti9xREs2a3RsdzllS0hwRERhdXdURkErTlpuNnM0K01TMDNyekJRMUZBalV5?=
 =?utf-8?B?TUdnVENyUjAyVHIrTFB2OWFvVnl6VmtONWtObEc3ODVBOFk3QUJ2T3FINDNl?=
 =?utf-8?B?eE01T3Axd09TNmM2U3JTNkxqSDk4YlFLdnhrN0tiK1M0USthdWtmRENDWVZW?=
 =?utf-8?B?UUhWYWd2RVUyK3RURERjQnZwdGRhUVA2N3QySGw4K2xsYjlWeGo1YTFjclVw?=
 =?utf-8?B?UHFaeU51b3RZNlV0VkRTemRmSjZQM0c4dzJvSXlSQUpZcEtTR21VbnUyMllJ?=
 =?utf-8?B?SHQxYVpNSUZhK2Q1TDdlZ01jbmtHbHVsMnB2K24yaGt3T29nQkNnc3RrNklL?=
 =?utf-8?B?cWFuMlJMRGhTeTZudDJHN0NWZXdQNXVGTXNhTERwajIxNnQwSHR0UEowbHBs?=
 =?utf-8?B?ZXNMSHZlUTlZenpoeSt5RXRGMFVkdTgveG1ER3hHWWI4WTl4RWdrSzlSeHUx?=
 =?utf-8?B?dEM4QzNNWUFOUXhmUUkxbmhYeW16QWNTNGVsc0Mrc2c0dzNtakJOWUQ2VzdB?=
 =?utf-8?B?K2dCYm1rejFNZVNmbUFxK2ZCQ0tPeHBBZFUwWWlENFA3MC8xR1BzTHBOMGRq?=
 =?utf-8?B?QW1sNnphRytKMWRsNkExM0lncCtBZG9FU09xQkxlczZyUmpLbHR2cERnMFJi?=
 =?utf-8?B?SWN1Vm16aTA2TEk4ZmFkMlJUOVN0bS9TUEpxKzBWRnRYTkNXMjZkY1lqV0xC?=
 =?utf-8?B?YlJjMXVOaDB0Z0Z1L2JRZ2ExQnd5TXE5SFRYem8zc2c1UzBFRjkwTXdjNko2?=
 =?utf-8?B?RWZUNFBGMzRjUGI2QWQ3anhhRWhHQU5VM3htQ0pZYldCL21CSDNvQW05S1ZB?=
 =?utf-8?B?VnEzalNvbFBQSGtIL0V6bis5TkZ6RjNDTXBHYVgrZnJiQ2tOcElMMXZNUzUx?=
 =?utf-8?B?ZWhOM2Vwa2c5RVErdDRERUhLZi9zekkrQ0ZHNXBwaFFoVnVJVlJudnRrRnBs?=
 =?utf-8?B?UVlyVmRCY3dENzczd05GczgrbFBEVzdyNmM1T3JwbzhwRGtYdVZiTGlXSlJa?=
 =?utf-8?B?OXdvTHhyNDdLMGdUZlNSdGF5NXdvTUtGWVQxUDd5OXF2RnB0RlpmTFNpa0Yz?=
 =?utf-8?B?SzRSSXN4WVc4OWEwOUUraTlwcDlDVWdnR1JPMnJid3RDL3V4Yk5pNnFBUHha?=
 =?utf-8?B?VEoyNUlOcTl1dEtEb0drbVJoZzBseGFQSWoyTDBVZnpsSkQwR0l1UlgzTlJW?=
 =?utf-8?B?YWxXRFJXWUZXbHVNeElGci9La0VmS2FLaUZkYTFlVVZhcWhvR1lyQ1dNS3ZX?=
 =?utf-8?B?ZjBhMHE3azdydTBhbW9LNDZVMTk1Y0VqL0x1YkZtYkZEVWdvbHoyeWV4akUv?=
 =?utf-8?B?Q3k2ZzM4UzliTDNHTmxGRmFoRUp4MXczNWVkb1Nvby9xY2tMY0ZRekR1M0V1?=
 =?utf-8?B?VU0zcXVNZEw1bWY3YlFOOUt6akdSVDQ4U2cxdWJrMGJMQVZxNDRpd1lqV09Y?=
 =?utf-8?B?ckx5VXF1RXpGV2RaaWZUbDZvWkxoVnpqTGpuQkhUcUFLczg4bVdYdEhsaU9s?=
 =?utf-8?B?Rld0YWdFK2hqVGFaVHh4d1V1U0gwdVV6MDRBenJXc2xjaXJlbisyNXN4UHJL?=
 =?utf-8?Q?2MTO6o5rRnmms/WFhFcLR+0M9JvyHWxqhGHy0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b73853-eafe-4058-3171-08de7960b060
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:08:51.8619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR6M2DQWC0EM/TJAF/uYPgaeSeD44x7w+HCIRRdCMHw7bSdfnQGUez9eHPdaNFb/9Y67v9v6sTj/z4GR21GTUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 0059E1F6A1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:daniel.lezcano@kernel.org,m:mingo@kernel.org,m:james.clark@linaro.org,m:kees@kernel.org,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:russ.weight@linux.dev,m:sshegde@linux.ibm.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:linux@weissschuh.net,m:yilun.xu@intel.com,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:ynorov@nvidia.com,m:kuba@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,infradead.org,linux.intel.com,linaro.org,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.dev,redhat.com,weissschuh.net,intel.com,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17629-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,weissschuh.net:email]
X-Rspamd-Action: no action

Switch the driver to using the proper sysfs_emit("%*pbl") where
appropriate.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 .../hwtracing/coresight/coresight-cti-sysfs.c | 32 ++++++++-----------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 572b80ee96fb..26ec0d8ed181 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -606,14 +606,11 @@ static ssize_t chan_gate_enable_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
 	unsigned long ctigate_bitmask = cfg->ctigate;
-	int size = 0;
 
 	if (cfg->ctigate == 0)
-		size = sprintf(buf, "\n");
-	else
-		size = bitmap_print_to_pagebuf(true, buf, &ctigate_bitmask,
-					       cfg->nr_ctm_channels);
-	return size;
+		return sprintf(buf, "\n");
+
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_ctm_channels, &ctigate_bitmask);
 }
 static DEVICE_ATTR_RW(chan_gate_enable);
 
@@ -710,12 +707,13 @@ static ssize_t trigout_filtered_show(struct device *dev,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	int size = 0, nr_trig_max = cfg->nr_trig_max;
+	int nr_trig_max = cfg->nr_trig_max;
 	unsigned long mask = cfg->trig_out_filter;
 
-	if (mask)
-		size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
-	return size;
+	if (mask == 0)
+		return 0;
+
+	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
 }
 static DEVICE_ATTR_RO(trigout_filtered);
 
@@ -834,7 +832,7 @@ static ssize_t print_chan_list(struct device *dev,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	int size, i;
+	int i;
 	unsigned long inuse_bits = 0, chan_mask;
 
 	/* scan regs to get bitmap of channels in use. */
@@ -852,11 +850,9 @@ static ssize_t print_chan_list(struct device *dev,
 	/* list of channels, or 'none' */
 	chan_mask = GENMASK(config->nr_ctm_channels - 1, 0);
 	if (inuse_bits & chan_mask)
-		size = bitmap_print_to_pagebuf(true, buf, &inuse_bits,
-					       config->nr_ctm_channels);
-	else
-		size = sprintf(buf, "\n");
-	return size;
+		return sysfs_emit(buf, "%*pbl\n", config->nr_ctm_channels, &inuse_bits);
+
+	return sprintf(buf, "\n");
 }
 
 static ssize_t chan_inuse_show(struct device *dev,
@@ -928,7 +924,7 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_config *cfg = &drvdata->config;
 	unsigned long mask = con->con_in->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -942,7 +938,7 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_config *cfg = &drvdata->config;
 	unsigned long mask = con->con_out->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
 }
 
 /* convert a sig type id to a name */
-- 
2.43.0


