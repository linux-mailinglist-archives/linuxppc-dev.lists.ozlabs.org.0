Return-Path: <linuxppc-dev+bounces-16963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MUoEuV/l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612BE162C4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5yk1Kf3z3bf8;
	Fri, 20 Feb 2026 08:25:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524896;
	cv=pass; b=T8DjppefLVMWq2/xE/qtm3h1WR/JRYarMhLN011ozpob0VBUWYNhy9IKFtg8hiB+hQL6xXCI14NEzHbnAYg3adlSBqi6SA25R4Ob6LaMjAyw/ugwQ54+KBQBaqJL47nNg7I1/lRcI0iVDidYv0LndwvWVv/6smIQjq6ib8G850vdKgUwyfpTBciwJaxcmqmoWueboBCneNJrra8c8+Rp/3t7eHKymI4UKA2xa13yn2kKG7sUHa1/hiPD6FjzK+R5cqs3NeYbIDp8ReNa8e+tcu9bXNEmvvCLFKLSVro+32ITI0JG8M0vzE9iDvSUpI6L8fHgErk7INEZEYJJlHZAjA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524896; c=relaxed/relaxed;
	bh=Cn1iMtPpUVfN2mzHDG5Uh3tGoBPYZ6wtu608UTM0k2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i63PciNrGTdzKb75YBWIUb/GBUcun6+O6wQZcbb+5Cm++DNWNjeaZY0XNxRIaNA0WMjie9CLzkMgDMEwIrgAKCN9qRU5W12fW6PE72x6s3/6DrfboJjHIpQKNi9s6rvvfUqKRFt1BNm6Kexbp6wLgAxpv7Q+VLp7SfesBv0RfIvS1yaYartCr3ZO5zMZ/lDZFaGzt0luywUEwWk3W4PSRWLuQYfPV8BpxDn5g+H0t7U+caarFJc490qVn3+TNUNLd95CV91j8BmnZQZX8umWZKOUFz2auqfMyXx32+8/cotPOesDSSQoX5a+UGCRM91+txYxxOjbUi1BuMRHt3V88A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h0Y3Kam1; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h0Y3Kam1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kS1Cs4z2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:14:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVOuTTvV+lYfUQfl1UB3Cc0hNF4CfLOLa7KuVYmFdAo7+xE/NeVJTJjscQVhtsy4t+hvo9ZgvQqirswqWfKHmarKv2rAN6PtJQVcq8LRQmsXC9Xn0DWSzVhWduWGvJVAzpB/mTSvgMwBVCOiqoErVnpyOxrQN8yCt/e9Lgx9ntrTZLpdjIvIxxpJ4KjZFbyIqpf5XbdD5i7wgPdGnVTthG5EUCCQ6TDaQzAsRnzTEUh6BvJ9XDPJxJp+4Ok+y7+bMkJBlz1TsFlSqraj162TP2skMjp0ZAclAVSgrd86gBB758BGDIOeRoAaZhjEeh+MU2MKBXJEoomRlJAiRcq82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cn1iMtPpUVfN2mzHDG5Uh3tGoBPYZ6wtu608UTM0k2M=;
 b=lj8I+bog2VauXwTaJNMB6DaqW183ngWOhEnAGZbbwGpI31a6LVYWItaB44OzsJnWQJ/gNsFi5A/IuReC0+SxNqBXhr1QQZlR9s0rmhPwcbnMvE+86hwwhYRxzbME6cEWUPmbnhvmHb6dMu8Ey5UFKePdM5sKxOQPi476ZmWeeVNY6DR1d5AmjeJBPG0fXocSMkY6AtZ2X133eLYY9tz+GC/4RxDYbD0gyZzocXfXVjAZzInhFol+ajcPr5O6YBbGBP4H5kPX6tBrNFxM8SbVkn8TffSn14LXV/IMcjmXWkk7cAXzneuH+n9ganBwDezD2VnmbmSkpLp5Z17qV0/Wwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cn1iMtPpUVfN2mzHDG5Uh3tGoBPYZ6wtu608UTM0k2M=;
 b=h0Y3Kam1R60bXsi0QGcem3FgxgdO+0u0pZ6/DKtBVBPlTtazHlU6uj0EkoTWiM4EsQjEgOnT6LeMaPAgEk4tc15glCF13G+TN4YtnKceVu9tKnNI8cR5FtDZptR/HzqcE/rh8mGlmOneVBmMdfPB+lAl5a/tZawtCc7zwkfJHhoVSRsQAnhSiL1saDb2hdIALW3CpFrjbhy/TadJUN+eLCb5X0AiXpgwP7BuhxIBgElr2ouNRu5v2MEUCTcAsmxbNsBmewMdp7JZZzny+kVJk3bmuw1yRpwluz+tWvCHKv9Xk5SlFN1R68eq8/BpQ5WB8aqDxlwku8+ue1HJQCXFVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:32 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:32 +0000
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
Subject: [PATCH 09/12] fpga: m10bmc-sec: switch show_canceled_csk() to using scnprintf()
Date: Thu, 19 Feb 2026 13:14:01 -0500
Message-ID: <20260219181407.290201-10-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:408:e4::26) To PH0PR12MB8800.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3d570d7a-95d6-419f-be16-08de6fe2bae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9tAKSeC6B98bqFxIgYvYBLhQY3cGqrAlkIq0Rnsr9k+IBAk7G2yVEYKQMfUp?=
 =?us-ascii?Q?FDwXa3EZWCDYF1UogVjp1BI5RNPANXy2elrI3JsYSDTen4IeieqOLykB4QUn?=
 =?us-ascii?Q?GqnJoYHZAMdgtoaaTBK6YKbKkZSQAH+Qnd02uvQprg2lSeFQtfLt0Kig+S/U?=
 =?us-ascii?Q?YRY4QJF71owLHsfFA/f6SuclioBdxabX/sUW/0kEuBpRkoqjfv+c8WV8xZGQ?=
 =?us-ascii?Q?J4w+zbaeEerSeijvBubdzVCMo4w9BfkmJvhlc82NlDyj+Nh95x+/vPw/oyGH?=
 =?us-ascii?Q?+CHRzX8RFFI9HvanNqLQbj5ZENpBep19Z9AglXheRo9gkHEvM24KM2Xff9cu?=
 =?us-ascii?Q?a+BWve4pFEXIa4M+4OIMoyV3GrLOExjRKCwjIK3dN7VrPX8QfiifJWxnRtMN?=
 =?us-ascii?Q?2HRGGz56S9RRZ5QFhxv3hzd0arfKD6v4C//2hnG2BoxU0aaAESP0VmonHvTT?=
 =?us-ascii?Q?+PUSdXHRzt5RJK23MzM0qWgcTxIlLDULSvNMOque+YII2DXX704o/r/xks++?=
 =?us-ascii?Q?ES0bYUB2jtnGctx/ienhB1bRU79Nz0R3opo0ScUjzmRT3k+2OEThKMdxGm9Y?=
 =?us-ascii?Q?6YNYgGOpsjWVLzCGsQUTWJiZdkiMsqRmfY3dkAqp9xSyely5zIC375tzhwk9?=
 =?us-ascii?Q?vV/Qq2c6c+8n90p5Vp6mUSA4jyF0YZ42GoLAv/tgkckw1OjUIThMcYDlZOxb?=
 =?us-ascii?Q?VP75bQo0DfWSLVTkRoFBiaV0gyKOjBSzgitmxEeNTVsy7RkpEc1J5qFaNoNW?=
 =?us-ascii?Q?wx5VyprXYRiqMyCzI5h82NfZuPRCBOn/TkeC70HWUehonyA3Py1LAZsvtUrV?=
 =?us-ascii?Q?aA+dG53Agn663Tx6uUx5YLvM33u5UYHli3GF+HXvkdR+wUisVqtw2/G8THfk?=
 =?us-ascii?Q?/bsVIicWuQViHam0DVxKQ04pr19wi9IEguV6nG/LBzYGhVYSMBp/LH9OLD2F?=
 =?us-ascii?Q?4RM+lr7bXZwzEkwG8QM1vkO9BRAhuI0itplnfWte9JtWt5jmt1ITeBrncM+u?=
 =?us-ascii?Q?8KeoXtzGD8Sk+EWhcp/LX500jqqtVGs8X8IlkTZYsYwumWtGjo2nZ1a/3ooA?=
 =?us-ascii?Q?afB6EfENJ/SF2VR2vgs3v3+o2bOGvWNE55QwJLjijPw3W+XCBuwzVugJPdNi?=
 =?us-ascii?Q?knIQEUttR55LVN2gHsMQPN9yP/rWgxgJINVuoILJpI8jMuqjLuGlhzYtzUFs?=
 =?us-ascii?Q?dnftp8d2+xE3HTnVllc1oPYm6MyTaq4NMcuhvR0guPGwEIYF4SjXAggd/qcr?=
 =?us-ascii?Q?E58Tp/pcSsms9cHx8rWvYp89SL+IiHOUAGtqu5q7H7qyQEn+nh9DRAG7KyFK?=
 =?us-ascii?Q?dN53sPzeK6DOdZieVJrglx0Jb3UOPX0EYoK0diQbpA7O700Wi0yBM9Z0/odz?=
 =?us-ascii?Q?bEEDHG7vqBT3TcUHh0K6DpwN37L/6tY/DaXOnQeRimEsAteQA+CUYBtlT7NS?=
 =?us-ascii?Q?kXXCoZHVxzjxW8ZNUiQSbW8cIwWE3+BjCpVAySzZatUT2Vc0A+adcUKQ2/GQ?=
 =?us-ascii?Q?9mt+iaesDxzpKaEvJma45nsDVk7dV7O10MWBlcIxH3gU+gvmFxw2pq3AHTTW?=
 =?us-ascii?Q?9ZDXv++hyAapSa+wVOqTDo0FUh4qSHrznyhnkSwLkFpMuPLpjxPXwlrrnovS?=
 =?us-ascii?Q?4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w+5MCtJU3fp2L3HzF4pzinSWTQZSDFGUBAjnIHh8wfFz4sD/wUAPJh9fhXLA?=
 =?us-ascii?Q?ckJlAQJ6GmKYMsiYHBBsrXtpmcZzlvxkidqBLWGsHWhls3VBDD5GZzsAPUaP?=
 =?us-ascii?Q?pDYJCEPfX5i9TFTCmABOgrt39gnarr0FMyMaKA4EucSLVzRZ9jZZU7yP+6Mm?=
 =?us-ascii?Q?fWLkA8GNbRnTxamJ/ACJYQt0iTVqAVrf4PsMvfbYXPbHnqz7C9OrCVugKyBT?=
 =?us-ascii?Q?9Z+FTIwPREDkq0YoAw5KntjHU9pSgYY0SJ059fZeEHMqRKuz/LrJdi5Jm7RQ?=
 =?us-ascii?Q?qdiD7Tm5INyyl6/82yDWAoaTGFs8mc7dZ5JXWwfmvew2AE3aidcv5oQ4rebq?=
 =?us-ascii?Q?MVRl7uFkkWq26xH1yOR/Uoi3XvcojDaE1bz6tNhIEtNkLmLXfwWKGJfGibVn?=
 =?us-ascii?Q?6h2hkXIJjhUD1wVIOtMm7cMJc+IE73Tt2hBvDhp8pfMkxMLq50AuSXhEIawZ?=
 =?us-ascii?Q?vCYWw39SymAQRsC7/Y4kFcDO7sDzwbslvrmfCmnENhfOlQ/w1NYnEkACkhF5?=
 =?us-ascii?Q?9jrSXxDnPTIkS3myzcu5ql2O8nn6K0FvRYiOFi1genzzmnMXUxrhoAPXGugu?=
 =?us-ascii?Q?xvtgMDs0fFgCCRUw8mku4XB1MwEASKPwGha2z2Njtwn2zwImwnyWMwXLTJRb?=
 =?us-ascii?Q?jy6NSFtzrixkZE0FQDoHxTXiq5v1uuq2ImcuE/HuqQR+GCdrVJuEvm+oO1Tn?=
 =?us-ascii?Q?2Wc9GxoM5nVzX8Ghe76e0yTyjfVsKlJNrOxJDEfTIwf3fK3ChjER6QZ1HiCa?=
 =?us-ascii?Q?Y+iSgzNrWdXmvxdkuBrlyZprJ15U0UFi7hbw9c6EE5nWkuLeR6fpcfjlhoOk?=
 =?us-ascii?Q?KynILmYZZn5+nZZfnMgSSbz5+cXMqsD47pGWDJ8hETRqEl2oCBf+CnU5s6tc?=
 =?us-ascii?Q?REoEtJkArz8CHPTtrzP/I8iYd5TD/StxByPAJ8cjLZjR11HkBTEkzz/JN9kv?=
 =?us-ascii?Q?Azb9+eGDDG9kCV8Op6MAeGM1zbuRSzgGnjZNB2VyNd/SyHZEFLG1HIQ4wnbu?=
 =?us-ascii?Q?hllZ0T8vEuCCWbGT+i9psimVct0po5zG6a3w8SKylyL2FkVVolriVwPhCg1E?=
 =?us-ascii?Q?KZ/BvTvLvLNYeiFT/vT9GWjCULZg7nppo5w6oR4P1hGg7dI2bB2L74PHaVpv?=
 =?us-ascii?Q?3Du6dl5n6G15BqQ9rb/EwmDFk6NX4z1xdxZBYXJ1umc65JNSjv9h4WAGp6Un?=
 =?us-ascii?Q?sOKrn0vGn1ouaDGmVpmbcJBErh3eaiOdhWY7/ndeP0/AUkgPA+6xIl9bdZjy?=
 =?us-ascii?Q?02iU9iFsM9fZnEhlVfAYfKfp9KIyXq3HKvcTTlTA/2EpFMBuo6a1X0HAOSgV?=
 =?us-ascii?Q?FSyYwRC2y8ftJDuVwrwxKc8lno87isfD6BBYIMtU96Exg/pAyB9Kb5kKwwbG?=
 =?us-ascii?Q?GOTnVub1iIR5bGLMkF8mL9DkBwiVv47LB5XhMFLsxOfxF64YJDtdtJiPhpkV?=
 =?us-ascii?Q?J3G9aRhKpM4gkqgakag64dg15Wx5gN0vrD5BQas9ebEMS6tOmMZhb3vUpGSB?=
 =?us-ascii?Q?WyuWIhQ/xbjvmbkV1dSL5PLaebFYC4eJnvJA6aEOy5LOzRtaSIibF3vEYSNe?=
 =?us-ascii?Q?o8CDOg4BSLnTxu9Xba5pcPVcUF/3J0YtRl8iaKn65Ij+pDrOx285KgCiS+jo?=
 =?us-ascii?Q?WawX0QcabP+ESYyMHlluQZsJ52KBgsxsnmESjHjzI/FbFze6sjxz15jCVEWR?=
 =?us-ascii?Q?0dTRjE+rFvVDAG5BZK8UBKbD+6TteleqeHm1btNW965KbIJhM0kvxfky31/p?=
 =?us-ascii?Q?qhzxDNmCXuzFSL0SOCt4twdISV5nET+NbsLtzG2EriRHXkMEkWQL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d570d7a-95d6-419f-be16-08de6fe2bae4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:32.3659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OJo2PrrsYYDXFannEOhqOnMTZ7p+whM6B0JjJJWSxWf1zIc+9m+P9+HbWOGssv00CmmOBTGYDJLpa7N+quGeA==
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
	TAGGED_FROM(0.00)[bounces-16963-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 612BE162C4A
X-Rspamd-Action: no action

Switch show_canceled_csk() to use a more common scnprintf("%*pbl").

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/fpga/intel-m10-bmc-sec-update.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
index 10f678b9ed36..5ae76b8ece18 100644
--- a/drivers/fpga/intel-m10-bmc-sec-update.c
+++ b/drivers/fpga/intel-m10-bmc-sec-update.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/mfd/intel-m10-bmc.h>
 #include <linux/mod_devicetable.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -183,7 +184,7 @@ show_canceled_csk(struct device *dev, u32 addr, char *buf)
 
 	bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
 	bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
-	return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_LEN);
+	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", CSK_BIT_LEN, csk_map);
 }
 
 #define DEVICE_ATTR_SEC_CSK_RO(_name)						\
-- 
2.43.0


